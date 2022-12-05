using Microsoft.Owin;
using Owin;
using CyberpunkServer.SignalR.hubs;
using Microsoft.AspNet.SignalR;

[assembly: OwinStartupAttribute(typeof(CyberpunkServer.Startup))]
namespace CyberpunkServer
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            app.MapSignalR("/com",new Microsoft.AspNet.SignalR.HubConfiguration() { EnableDetailedErrors=true });
            GlobalHost.Configuration.MaxIncomingWebSocketMessageSize = null;
        }
    }
}
