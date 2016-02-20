using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(chess.Startup))]
namespace chess
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
