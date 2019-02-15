using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using CRMDLL.DataBase;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using System.Text;

namespace CRM
{
    public partial class Chats : System.Web.UI.Page
    {
        public static int UserId;
        public static string UserName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetLoggedInUsers();
                this.InsertMessage(ConfigurationManager.AppSettings["ChatLoggedInText"] + " " + DateTime.Now.ToString());
                lblMessages.Text = string.Empty;
                txtMessage.Focus();
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            if (txtMessage.Text.Length > 0)
            {
                this.InsertMessage(null);
                txtMessage.Text = String.Empty;
            }
        }

        private void GetLoggedInUsers()
        {
            CRMDataContext db = new CRMDataContext();

            AuthenticationModel oAuthenticationModel = SessionService.GetCurrentUser();
            if (oAuthenticationModel != null)
            {
                if (oAuthenticationModel.Authenticated)
                {
                    UserId = oAuthenticationModel.RegisteredUsers.Id;
                    UserName = oAuthenticationModel.RegisteredUsers.Name;
                }
                else
                {
                    lblError.InnerText = "Session Expired: Please Login again";
                    return;
                }
            }

            string userIcon;
            StringBuilder sb = new StringBuilder();

            userIcon = "<img src='img/find_user.png' style='vertical-align:middle' alt=''>  ";
            sb.Append(userIcon + "<b>" + UserName + "</b><br>");
        }

        private void InsertMessage(string text)
        {
            if (!string.IsNullOrEmpty(UserName))
            {
                var mess = txtMessage.Text;
                lblMessages.Text += "\r" + UserName + ":" + mess;
            }
            else
            {
                txtMessage.Enabled = false;
                lblError.InnerText = "Please Log In To Chat";
            }
        }

        protected void BtnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Logout.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblMessages.Text = string.Empty;
        }
    }
}