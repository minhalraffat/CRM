using System;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;

namespace CRM
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected int EditUserId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticationModel oModel = SessionService.GetCurrentUser();
            if (oModel != null)
            {
                EditUserId = oModel.RegisteredUsers.Id;

                if (!IsPostBack)
                {
                    if (oModel.Authenticated && oModel.RegisteredUsers != null)
                    {
                        GetPreviousPageData(oModel.RegisteredUsers.Id);
                    }
                }
            }
        }

        public void GetPreviousPageData(int UserId)
        {
            try
            {
                RegisterFactory ofactory = new RegisterFactory();
                RegisterInfo oUserInfo = ofactory.GetUserById(UserId);

                if (oUserInfo != null)
                {
                    litName.Text = oUserInfo.Name;
                    litAddress.Text = oUserInfo.Address;
                    litEmail.Text = oUserInfo.Email;
                    litContactNo.Text = oUserInfo.ContactNo;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}