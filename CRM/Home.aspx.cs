using System;
using CRMDLL.ModelClasses;
using CRMDLL.FactoryMethods;
using CRMDLL;
using System.Web.Routing;

namespace CRM
{
    public partial class Home : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var auth = new Authentication();
            auth.LoginId = txtLoginId.Text;
            auth.Password = txtPasswordLogin.Text;
            auth.Type = (UserTypeEnum)Convert.ToInt32(ddlUserType.SelectedValue);

            var authentication = this.AccountService.Login(auth);
            if (authentication.Authenticated)
            {
                //Session["LoginID"] = authentication.RegisteredUsers.LoginId;
                //Session["LoginName"] = authentication.RegisteredUsers.Name;

                RouteTable.Routes.MapPageRoute("", "MintCRM", "~/Dashboard.aspx");
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Please Provide Valid Credentials";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                RegisterInfo oRegisterInfo = new RegisterInfo();
                oRegisterInfo.LoginId = txtUserRegister.Text;
                oRegisterInfo.Password = txtPasswordRegister.Text;
                oRegisterInfo.Name = txtNameRegister.Text;
                oRegisterInfo.TypeId = 2;
                oRegisterInfo.Address = txtAddressRegister.Text;
                oRegisterInfo.DOB = Convert.ToDateTime(txtDOBRegister.Text);
                oRegisterInfo.Email = txtEmailRegister.Text;
                oRegisterInfo.ContactNo = txtContactRegister.Text;

                bool result = new RegisterFactory().AddUser(oRegisterInfo);
                if (result)
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "User Registered Successfully";
                }
            }
            catch (Exception ex)
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Please Provide All the required Fields / Username is already taken";
            }
        }
    }
}