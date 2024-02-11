using Cyberpunk_Server_Blazor.Areas.Identity;
using Cyberpunk_Server_Blazor.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using CyberpunkServer.Models;
using System.Configuration;
using Cyberpunk_Server_Blazor;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;
var configuration = builder.Configuration;
services.AddSignalR(o =>
{
    o.EnableDetailedErrors = true;
    o.MaximumReceiveMessageSize = null;
});
// Add services to the container.
var connectionString = builder.Configuration["ConnectionStrings:Cyberpunk-Connection"] ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
services.AddDbContextFactory<CyberpunkEntities>(options => options.UseSqlServer(builder.Configuration["ConnectionStrings:Cyberpunk-Connection"]));
services.AddDbContext<CyberpunkEntities>(options => options.UseSqlServer(builder.Configuration["ConnectionStrings:Cyberpunk-Connection"]));

builder.Services.AddDatabaseDeveloperPageExceptionFilter();
builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddScoped<AuthenticationStateProvider, RevalidatingIdentityAuthenticationStateProvider<IdentityUser>>();
builder.Services.AddSingleton<WeatherForecastService>();

services.AddAuthentication().AddGoogle(googleOptions =>
{
    googleOptions.ClientId = "253969050145-ksvot2cm9si42h9e9bop4odqiltt08hf.apps.googleusercontent.com";
    googleOptions.ClientSecret = "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";
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint();
}
else
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllers();
app.MapBlazorHub();
app.MapHub<Cyberpunk_Server_Blazor.Hubs.ComHub>("/com");
app.MapFallbackToPage("/_Host");

app.Run();
