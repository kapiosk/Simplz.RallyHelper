using Microsoft.JSInterop;

namespace RallyHelper.Pwa.Services;

/// <summary>
/// Wraps the Notifications API. Notifications are posted through the service
/// worker registration (the only route that works from a hidden page, and the
/// only one supported by iOS home-screen PWAs). The JS side suppresses them
/// while the app is visible.
/// </summary>
public sealed class NotificationService
{
    private readonly IJSRuntime _js;
    private IJSObjectReference? _module;

    public NotificationService(IJSRuntime js) => _js = js;

    public bool IsSupported { get; private set; }

    /// <summary>'default' | 'granted' | 'denied' | 'unsupported'</summary>
    public string Permission { get; private set; } = "default";

    private async Task<IJSObjectReference?> GetModuleAsync()
    {
        if (_module is not null) return _module;
        try
        {
            _module = await _js.InvokeAsync<IJSObjectReference>("import", "./notifications.js");
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
        if (module is null) return;
        IsSupported = await module.InvokeAsync<bool>("isSupported");
        if (IsSupported)
            Permission = await module.InvokeAsync<string>("getPermission");
    }

    /// <summary>Must be called from a user gesture.</summary>
    public async Task<string> RequestPermissionAsync()
    {
        var module = await GetModuleAsync();
        if (module is null) return "unsupported";
        Permission = await module.InvokeAsync<string>("requestPermission");
        return Permission;
    }

    /// <summary>Shows a notification only while the app is in the background.</summary>
    public async Task ShowIfHiddenAsync(string title, string body)
    {
        var module = await GetModuleAsync();
        if (module is not null)
            await module.InvokeAsync<bool>("showIfHidden", title, body);
    }
}
