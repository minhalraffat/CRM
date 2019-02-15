using CRMDLL.DataBase;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.Master
{
    public partial class CRMMaster : System.Web.UI.MasterPage
    {
        CRMDataContext db = new CRMDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticationModel oAuthenticationModel = SessionService.GetCurrentUser();
            if (oAuthenticationModel != null)
            {
                if (oAuthenticationModel.Authenticated)
                {
                    if (oAuthenticationModel.AccountType == UserTypeEnum.User)
                    {
                        UserNameLit.Text = oAuthenticationModel.RegisteredUsers.Name; 
                        AdminMenu.Visible = false;
                        UserMenu.Visible = true;
                        EmpMenu.Visible = false;
                    }
                    if (oAuthenticationModel.AccountType == UserTypeEnum.Admin)
                    {
                        UserNameLit.Text = oAuthenticationModel.RegisteredUsers.Name;
                        UserMenu.Visible = false;
                        EmpMenu.Visible = false;
                        AdminMenu.Visible = true;
                    }
                    if (oAuthenticationModel.AccountType == UserTypeEnum.Employee)
                    {
                        UserNameLit.Text = oAuthenticationModel.EmployeeInfo.Name;
                        EmpMenu.Visible = true;
                        AdminMenu.Visible = false;
                        UserMenu.Visible = false;
                    }
                }
                else
                {
                    EmpMenu.Visible = false;
                    AdminMenu.Visible = false;
                    UserMenu.Visible = false;
                    SessionMenu.Visible = true;
                }
            }

            var count = (from m in db.Complaints
                         select m).Count();

            //Label1.Text = count.ToString();


          
        }
    }
}