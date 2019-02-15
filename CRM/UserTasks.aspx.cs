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
    public partial class UserTask : System.Web.UI.Page
    {
        public int EmpId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPriority();
                BindStatus();
                BindDepartment();
            }
        }

        private void BindDepartment()
        {
            CRMDataContext db = new CRMDataContext();
            var data = from d in db.Departments select d;

            ddlDepartment.DataSource = data;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "Id";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("Select Department Type", "0"));
        }

        private void BindStatus()
        {
            CRMDataContext db = new CRMDataContext();
            var data = from d in db.TaskStatus select d;

            ddlStatus.DataSource = data;
            ddlStatus.DataTextField = "Name";
            ddlStatus.DataValueField = "Id";
            ddlStatus.DataBind();
            ddlStatus.Items.Insert(0, new ListItem("Select Status", "0"));
        }

        private void BindPriority()
        {
            CRMDataContext db = new CRMDataContext();
            var data = from d in db.TaskPriorities select d;

            ddlPriority.DataSource = data;
            ddlPriority.DataTextField = "Name";
            ddlPriority.DataValueField = "Id";
            ddlPriority.DataBind();
            ddlPriority.Items.Insert(0, new ListItem("Select Priority", "0"));
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtTaskName.Text == " ")
            {
                lblMsg.InnerText = "Enter Task Name";
                return;
            }

            if (txtSubject.Text == " ")
            {
                lblMsg.InnerText = "Enter Subject";
                return;
            }

            if (txtDueDate.Text == " ")
            {
                lblMsg.InnerText = "please enter the Due Date";
                return;
            }

            if (ddlDepartment.SelectedValue == "0")
            {
                lblMsg.InnerText = "please select the Department ";
                return;
            }

            if (ddlStatus.SelectedValue == "0")
            {
                lblMsg.InnerText = "please choose Status";
                return;
            }

            if (txtDesc.Text == "")
            {
                lblMsg.InnerText = "please enter description";
                return;
            }

            if (ddlPriority.SelectedValue == "0")
            {
                lblMsg.InnerText = "please choose the priority";
                return;

            }


            using (CRMDataContext db = new CRMDataContext())
            {
                Task tsk = new Task();

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
                tsk.EmployeeId = EmpId;
                tsk.TaskName = txtTaskName.Text.Trim();
                tsk.Subject = txtSubject.Text.Trim();
                tsk.DueDate = Convert.ToDateTime(txtDueDate.Text);
                tsk.Description = txtDesc.Text.Trim();
                tsk.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
                tsk.PriorityId = Convert.ToInt32(ddlPriority.SelectedValue);
                tsk.StatusId = Convert.ToInt32(ddlStatus.SelectedValue);

                db.Tasks.InsertOnSubmit(tsk);
                db.SubmitChanges();

                lblMsg.InnerText = "Task Has Been Generated";

            }
            
           
        }

    }
}