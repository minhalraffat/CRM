using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRMDLL.DataBase;
using CRMDLL.ModelClasses;
using CRMDLL.FactoryMethods;

namespace CRM
{
    public partial class AddEvents : System.Web.UI.Page
    {
        public int EmpId;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == " ")
            {
                lblMsg.InnerText = "Enter your Name";
                return;
            }

            if (txtEventName.Text == " ")
            {
                lblMsg.InnerText = "Enter Event Name";
                return;
            }

            if (txtTimeStart.Text == " ")
            {
                lblMsg.InnerText = "please enter the start time";
                return;
            }

            if (txtEndTime.Text == " ")
            {
                lblMsg.InnerText = "please enter the end time";
                return;
            }

            if (txtLocation.Text == " ")
            {
                lblMsg.InnerText = "please enter location";
                return;
            }

            if (txtDesc.Text == "")
            {
                lblMsg.InnerText = "please enter description";
                return;
            }

            if (txtDate.Text == "")
            {
                lblMsg.InnerText = "please enter date for your event";
                return;

            }


            CRMDataContext db = new CRMDataContext();
            Event ev = new Event();

            AuthenticationModel oModel = SessionService.GetCurrentUser();
            if (oModel.AccountType != 0)
            {
                EmpId = oModel.EmployeeInfo.Id;
            }

            if (EmpId == 0)
            {
                btnSave.Enabled = false;
                lblMsg.InnerText = "Please Login to continue";
                return;
            }

            ev.EmployeeId = EmpId;
            ev.Date = Convert.ToDateTime(txtDate.Text.Trim());
            //ev.StartTime = Convert.ToDateTime(txtTimeStart.Text);
            //ev.EndTime = Convert.ToDateTime(txtEndTime.Text);
            ev.Description = txtDesc.Text.Trim();
            ev.Location = txtLocation.Text.Trim();
            ev.EventName = txtEventName.Text.Trim();


            db.Events.InsertOnSubmit(ev);
            db.SubmitChanges();

            lblMsg.InnerText = "Event Has Been Created";




        }


    }
}