using System;
using System.Linq;
using System.Web.UI.WebControls;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;

namespace CRM
{
    public partial class Complaints : System.Web.UI.Page
    {
        CRMDataContext db = new CRMDataContext();
        private int UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindComplainType();
                BindGridview();
                BindProductType();
                BindDepart();
            }
        }

        private void BindComplainType()
        {
            var data = from d in db.ComplainTypes select d;

            ddlComplainType.DataSource = data;
            ddlComplainType.DataTextField = "ComplainName";
            ddlComplainType.DataValueField = "Id";
            ddlComplainType.DataBind();
            ddlComplainType.Items.Insert(0, new ListItem("Select Complain Type", "0"));
        }

        private void BindDepart()
        {
            var data = from d in db.Departments select d;

            ddlDepart.DataSource = data;
            ddlDepart.DataTextField = "DepartmentName";
            ddlDepart.DataValueField = "Id";
            ddlDepart.DataBind();
            ddlDepart.Items.Insert(0, new ListItem("Select Department", "0"));
        }


        private void BindProductType()
        {
            var data = from d in db.Products select d;

            ddlProducts.DataSource = data;
            ddlProducts.DataTextField = "Name";
            ddlProducts.DataValueField = "Id";
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, new ListItem("Select Product Type", "0"));
        }

        public void BindGridview()
        {
            AuthenticationModel oModel = SessionService.GetCurrentUser();
            if (oModel.AccountType != 0)
            {
                UserId = oModel.RegisteredUsers.Id;
            }

            var grid = from m in db.Complaints where m.UserId == UserId select m;
            repeaterComplains.DataSource = grid;
            repeaterComplains.DataBind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string res = null;

            try
            {
                AuthenticationModel oModel = SessionService.GetCurrentUser();
                if (oModel.AccountType != 0)
                {
                    UserId = oModel.RegisteredUsers.Id;
                }

                int ComplainType = Convert.ToInt32( ddlComplainType.SelectedValue);
                int depart = Convert.ToInt32(ddlDepart.SelectedValue);
                var Description = txtDescription.Text;
                int Product = Convert.ToInt32(ddlProducts.SelectedValue);

                res = new ComplainFactory().AddComplain(UserId, ComplainType, depart, Description, Product);
            }
            catch (Exception v)
            {
                lblTextMsg.Text = v.Message;
            }

            if (res != null)
            {
                lblTextMsg.Text = "Complain Has Been Lodged. Your Complain Number is " + res;
            }
            BindGridview();
            Label1.Text = "Your issue will be resolved in next 24 hours! We apologize for any inconvenience caused ";
        }
    }
}