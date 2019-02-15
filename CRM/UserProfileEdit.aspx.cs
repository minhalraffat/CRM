using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class UserEdit : System.Web.UI.Page
    {
        private static String Password;
        int userId = 0;
        const string vs_userId = "UserViewState";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                    {
                        int.TryParse(Request.QueryString["id"], out userId);
                    }
                }
                if (userId < 1)
                {
                    AuthenticationModel oAuthenticationModel = SessionService.GetCurrentUser();
                    if (oAuthenticationModel.Authenticated && oAuthenticationModel.RegisteredUsers != null)
                    {
                        userId = oAuthenticationModel.RegisteredUsers.Id;
                    }
                }
                SetPageControls(userId);
            }
        }
        private void SetPageControls(int userId)
        {
            try
            {
                RegisterFactory oUserFactory = new RegisterFactory();
                RegisterInfo oInfo = oUserFactory.GetUserById(userId);
                if (oInfo != null)
                {
                    ViewState[vs_userId] = userId.ToString();
                    txtName.Text = oInfo.Name;

                    txtDOB.Text = oInfo.DOB.ToString("dd-MMM-yyyy");
                    txtEmail.Text = oInfo.Email;
                    txtAddress.Text = oInfo.Address;
                    txtContactNumber.Text = oInfo.ContactNo;
                    txtUserId.Text = oInfo.LoginId;
                    Password = oInfo.Password;
                }
            }
            catch (Exception ex)
            {

            }
        }
        private RegisterInfo GetData()
        {
            RegisterInfo oUserInfo = new RegisterInfo();
            try
            {
                if (ViewState[vs_userId] != null)
                    int.TryParse(Convert.ToString(ViewState[vs_userId]), out userId);

                oUserInfo.Id = userId;
                oUserInfo.LoginId = txtUserId.Text.Trim();
                oUserInfo.Name = txtName.Text.Trim();
                oUserInfo.Address = txtAddress.Text.Trim();
                oUserInfo.DOB = Convert.ToDateTime(txtDOB.Text.Trim());
                oUserInfo.Email = txtEmail.Text.Trim();
                oUserInfo.ContactNo = txtContactNumber.Text.Trim();
                if (Password == TextBox2.Text.Trim())
                {
                    oUserInfo.Password = txtnewPassword.Text.Trim();
                }
                else
                {
                    lblMsg.InnerText = "Old password is invalid ";
                }
                


            }
            catch (Exception ex)
            {

            }
            return oUserInfo;
        }
        protected void btnSaveEditUser_Click(object sender, EventArgs e)
        {
            try
            {
                RegisterInfo oUserInfo = GetData();
                if (RegisterFactory.EditUser(oUserInfo))
                lblMsg.InnerText = "User Updated";
            }
            catch (Exception ex)
            {
            }
        }
    }
}