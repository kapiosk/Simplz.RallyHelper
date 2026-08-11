using Microsoft.JSInterop;

namespace RallyHelper.Pwa.Services;

/// <summary>Thin localStorage wrapper for persisting settings and notes across sessions.</summary>
public sealed class LocalStorageService
{
    private readonly IJSRuntime _js;

    public LocalStorageService(IJSRuntime js) => _js = js;

    public async Task<string?> GetAsync(string key)
    {
        try { return await _js.InvokeAsync<string?>("localStorage.getItem", key); }
        catch { return null; }
    }

    public async Task<string?> GetAsync(string key, string? fallback)
    {
        var value = await GetAsync(key);
        return string.IsNullOrEmpty(value) ? fallback : value;
    }

    public async Task<double?> GetNumberAsync(string key)
    {
        var value = await GetAsync(key);
        return double.TryParse(value, out var result) ? result : null;
    }

    public async Task<bool> GetBoolAsync(string key, bool fallback)
    {
        var value = await GetAsync(key);
        return value is null ? fallback : value is "1" or "true";
    }

    public Task SetAsync(string key, string? value)
    {
        try { return _js.InvokeVoidAsync("localStorage.setItem", key, value ?? "").AsTask(); }
        catch { return Task.CompletedTask; }
    }

    public Task SetNumberAsync(string key, double? value) => SetAsync(key, value?.ToString("0.#####"));

    public Task SetBoolAsync(string key, bool value) => SetAsync(key, value ? "1" : "0");
}