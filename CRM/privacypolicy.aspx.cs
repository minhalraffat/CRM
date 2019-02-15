using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRMDLL.ModelClasses;
using CRMDLL.FactoryMethods;
using CRMDLL;

namespace CRM
{
    public partial class privacypolicy : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var credentials = new Authentication();
            credentials.LoginId = txtLoginId.Text;
            credentials.Password = txtPasswordLogin.Text;
            credentials.Type = (UserTypeEnum)Convert.ToInt32(ddlUserType.SelectedValue);

            var authentication = this.AccountService.Login(credentials);
            if (authentication.Authenticated)
            {
                Session["LoginID"] = authentication.RegisteredUsers.LoginId;
                Session["LoginName"] = authentication.RegisteredUsers.Name;
                Response.Redirect("~/Dashboard.aspx");

            }
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Please Provide Valid Credentials";
            }
        }

        #region Register code
        private RegisterInfo GetRegisterData()
        {
            RegisterInfo oRegisterInfo = new RegisterInfo();
            try
            {
                oRegisterInfo.LoginId = txtUserRegister.Text;
                oRegisterInfo.Password = txtPasswordRegister.Text;
                oRegisterInfo.Name = txtNameRegister.Text;
                oRegisterInfo.TypeId = 2;
                oRegisterInfo.Address = txtAddressRegister.Text;
                oRegisterInfo.DOB = Convert.ToDateTime(txtDOBRegister.Text);
                oRegisterInfo.Email = txtEmailRegister.Text;
                oRegisterInfo.ContactNo = txtContactRegister.Text;
            }
            catch (Exception ex)
            {
                throw;
            }
            return oRegisterInfo;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                RegisterInfo oInfo = GetRegisterData();
                RegisterFactory oFactory = new RegisterFactory();
                bool result = oFactory.AddUser(oInfo);
                if (result)
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "User Registred Successfully";
                }
            }
            catch (Exception ex)
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Please Provide All Fields";
            }
        }
        #endregion

    }
}