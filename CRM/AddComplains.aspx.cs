using System;
using System.Linq;
using CRMDLL.DataBase;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class AddComplains : System.Web.UI.Page
    {
        public string EmailId;

        CRMDataContext db = new CRMDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();

            if (!IsPostBack)
            {
                BindComplainType();
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
        public void BindGridview()
        {
            var grid = from m in db.Registers select m;
            grdmoviedetail.DataSource = grid;
            grdmoviedetail.DataBind();
        }
        protected void btnserach_Click(object sender, EventArgs e)
        {
            var search = from mn in db.Registers
                         where mn.Name.Contains(txtname.Text)
                         select mn;

            if (search != null)
            {
                grdmoviedetail.DataSource = search;
                grdmoviedetail.DataBind();
            }
            else
            {
                lblTextMsg.Text = "no data found";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string res = null;

            try
            {
                if (string.IsNullOrEmpty(txtUserId.Text))
                {
                    lblTextMsg.Text = "Enter User Id";
                    return;
                }
                if (ddlComplainType.SelectedValue == "0")
                {
                    lblTextMsg.Text = "Select Complain Type";
                    return;
                }
                if (string.IsNullOrEmpty(txtDescription.Text))
                {
                    lblTextMsg.Text = "Enter Description";
                    return;
                }

                int UserId = Convert.ToInt32(txtUserId.Text);
                int compType = Convert.ToInt32(ddlComplainType.SelectedValue);
                string Description = txtDescription.Text;

                res = new ComplainFactory().AddComplain(UserId, compType, 1, Description, 1);
                RegisterFactory regFactory = new RegisterFactory();

                // get user by id

                var data = db.Registers.Where(x => x.Id == UserId).FirstOrDefault();
                if (data != null)
                {
                    EmailId = data.Email.Trim();
                }

           
                if (!string.IsNullOrEmpty(EmailId))
                {
                    regFactory.SendEmail("Your complaint has been logged successfully your complaint number is: " + res, EmailId);
                }

            }
            catch (Exception v)
            {
                lblTextMsg.Text = v.Message;
            }

            if (res != null)
            {
                lblTextMsg.Text = "Your Complain Number is " + res;
            }
        }
    }
}