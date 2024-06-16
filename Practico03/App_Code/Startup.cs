using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Practico03.Startup))]
namespace Practico03
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
