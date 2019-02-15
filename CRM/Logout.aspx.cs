using CRMDLL;
using CRMDLL.FactoryMethods;
using System;

namespace CRM
{
    public partial class Logout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionService.Remove(SessionService.Keys.AuthenticationInfo);
            Response.Redirect("~/Home.aspx");
        }
    }
}