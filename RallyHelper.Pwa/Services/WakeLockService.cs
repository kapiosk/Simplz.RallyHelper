using Microsoft.JSInterop;

namespace RallyHelper.Pwa.Services;

/// <summary>
/// Wraps the Screen Wake Lock API so the phone doesn't sleep while the app is
/// open. The lock auto-releases when the page is hidden and is re-acquired on
/// return; that lifecycle is handled in wakeLock.js.
/// </summary>
public sealed class WakeLockService
{
    private readonly IJSRuntime _js;
    private IJSObjectReference? _module;

    public WakeLockService(IJSRuntime js) => _js = js;

    public bool IsSupported { get; private set; }
    public bool Enabled { get; private set; }

    private async Task<IJSObjectReference?> GetModuleAsync()
    {
        if (_module is not null) return _module;
        try
        {
            _module = await _js.InvokeAsync<IJSObjectReference>("import", "./wakeLock.js");
            return _module;
        }
        catch
        {
            return null;
        }
    }

    public async Task InitAsync()
    {
        var module = await GetModuleAsync();
        IsSupported = module is not null && await module.InvokeAsync<bool>("isSupported");
    }

    public async Task SetEnabledAsync(bool enabled)
    {
        Enabled = enabled;
        var module = await GetModuleAsync();
        if (module is null) return;

        if (enabled)
            await module.InvokeAsync<bool>("enable");
        else
            await module.InvokeVoidAsync("disable");
    }
}
