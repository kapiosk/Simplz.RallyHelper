using Microsoft.JSInterop;

namespace RallyHelper.Pwa.Services;

public enum GpsStatus
{
    NoFix,
    Good,
    Stale,
    Denied,
    Error,
    Timeout
}

public sealed record GpsPositionUpdate
(
    long Timestamp,
    double? Accuracy,
    double Latitude,
    double Longitude,
    double? Altitude,
    double? Speed
);

/// <summary>
/// Provides a GPS-corrected clock using the Geolocation API.
/// The position timestamp is compared with the device clock to derive an offset,
/// which is then applied to the current system time for all rally timers.
/// </summary>
public sealed class GpsTimeService : IDisposable
{
    private readonly IJSRuntime _js;
    private IJSObjectReference? _module;
    private DotNetObjectReference<GpsTimeService>? _selfRef;
    private int _watchId = -1;
    private readonly List<double> _offsets = new();
    private const int MaxSamples = 9;
    private readonly object _lock = new();

    public GpsTimeService(IJSRuntime js) => _js = js;

    public GpsStatus Status { get; private set; } = GpsStatus.NoFix;
    public string? ErrorMessage { get; private set; }
    public double? LastAccuracy { get; private set; }
    public DateTimeOffset? LastFix { get; private set; }
    public double? LastOffsetSeconds => GetMedianOffset()?.TotalSeconds;

    public DateTimeOffset CorrectedNow
    {
        get
        {
            var offset = GetMedianOffset();
            return offset.HasValue ? DateTimeOffset.Now + offset.Value : DateTimeOffset.Now;
        }
    }

    public Task StartAsync()
    {
        return StartAsyncCore();
    }

    private async Task StartAsyncCore()
    {
        try
        {
            _module = await _js.InvokeAsync<IJSObjectReference>("import", "./gps.js");
            _selfRef = DotNetObjectReference.Create(this);
            _watchId = await _module.InvokeAsync<int>("watch", _selfRef);
        }
        catch (Exception ex)
        {
            Status = GpsStatus.Error;
            ErrorMessage = ex.Message;
        }
    }

    [JSInvokable]
    public void OnPositionUpdate(GpsPositionUpdate update)
    {
        lock (_lock)
        {
            var systemNow = DateTimeOffset.Now;
            var offsetMs = update.Timestamp - systemNow.ToUnixTimeMilliseconds();
            var offset = TimeSpan.FromMilliseconds(offsetMs);
            var age = TimeSpan.FromMilliseconds(Math.Abs(systemNow.ToUnixTimeMilliseconds() - update.Timestamp));

            LastAccuracy = update.Accuracy;
            LastFix = systemNow;

            _offsets.Add(offset.TotalSeconds);
            while (_offsets.Count > MaxSamples) _offsets.RemoveAt(0);

            if (age < TimeSpan.FromSeconds(2) && (update.Accuracy ?? double.MaxValue) < 50)
                Status = GpsStatus.Good;
            else if (age < TimeSpan.FromSeconds(30))
                Status = GpsStatus.Stale;
            else
                Status = GpsStatus.Stale;
        }
    }

    [JSInvokable]
    public void OnError(int code)
    {
        Status = code switch
        {
            0 => GpsStatus.Error,
            1 => GpsStatus.Denied,
            2 => GpsStatus.Error,
            3 => GpsStatus.Timeout,
            _ => GpsStatus.Error
        };
        ErrorMessage = code == 0 ? "Geolocation not supported" : $"Geolocation error ({code})";
    }

    private TimeSpan? GetMedianOffset()
    {
        lock (_lock)
        {
            if (_offsets.Count < 3) return null;
            var sorted = _offsets.OrderBy(x => x).ToList();
            double median = sorted.Count % 2 == 1
                ? sorted[sorted.Count / 2]
                : (sorted[sorted.Count / 2 - 1] + sorted[sorted.Count / 2]) / 2.0;
            return TimeSpan.FromSeconds(median);
        }
    }

    public void Dispose()
    {
        try { _module?.InvokeVoidAsync("clearWatch", _watchId); } catch { /* ignore */ }
        _selfRef?.Dispose();
    }
}