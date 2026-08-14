using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using RallyHelper.Pwa;
using RallyHelper.Pwa.Services;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
builder.Services.AddSingleton<LocalStorageService>();
builder.Services.AddSingleton<GpsTimeService>();
builder.Services.AddSingleton<WakeLockService>();
builder.Services.AddSingleton<NotificationService>();

await builder.Build().RunAsync();
