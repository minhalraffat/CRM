using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;

namespace CRM
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        int Eid;
        CRMDataContext db = new CRMDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartment();
                BindEmployees();
                BindDesignation();

                if (Request.QueryString != null)
                    if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                        int.TryParse(Request.QueryString["Id"], out Eid);

                if (Eid != 0)
                    SetTextBoxes(Eid);
            }
        }

        private void BindDesignation()
        {
            var data = from d in db.Designations select d;

            ddlDesgination.DataSource = data;
            ddlDesgination.DataTextField = "DesignationName";
            ddlDesgination.DataValueField = "Id";
            ddlDesgination.DataBind();
            ddlDesgination.Items.Insert(0, new ListItem("Select Designation", "0"));
        }

        private void BindSalary(int DesigId)
        {
            if (DesigId != 0)
            {
                var data = from d in db.EmployeeSalaries where d.DesignationId == DesigId select d;

                ddlSalary.DataSource = data;
                ddlSalary.DataTextField = "Salary";
                ddlSalary.DataValueField = "Id";
                ddlSalary.DataBind();
                ddlSalary.Items.Insert(0, new ListItem("Select Salary", "0"));
            }
        }




        private void BindDepartment()
        {
           
                var data = from d in db.Departments select d;

                ddlDepartment.DataSource = data;
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataValueField = "Id";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, new ListItem("Select Department", "0"));
            
        }
        protected void ddlDesgination_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDesgination.SelectedValue != "0")
            {
                int DesigId = Convert.ToInt32(ddlDesgination.SelectedValue);
                BindSalary(DesigId);
            }
        }

        private void BindEmployees()
        {
            var grid = new EmployeeFactory().GetAllEmployee(); //from m in db.Employees select m;
            repeaterEmployee.DataSource = grid;
            repeaterEmployee.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Validations
            if (string.IsNullOrEmpty(txtEmpName.Text.Trim()))
            {
                lblMsg.Text = "Please Provide a Name";
                return;
            }
            if (string.IsNullOrEmpty(txtEmpAddress.Text.Trim()))
            {
                lblMsg.Text = "Please Provide Address";
                return;
            }

            if (string.IsNullOrEmpty(txtEmpDOB.Text.Trim()))
            {
                lblMsg.Text = "Please Provide DOB";
                return;
            }
            if (string.IsNullOrEmpty(txtEmpContact.Text.Trim()))
            {
                lblMsg.Text = "Please Provide Contact Number";
                return;
            }
            if (string.IsNullOrEmpty(txtEmpEmail.Text.Trim()))
            {
                lblMsg.Text = "Please Provide Email";
                return;
            }
            if (ddlDesgination.SelectedValue == "0")
            {
                lblMsg.Text = "Please Provide Designation";
                return;
            }
            if (ddlSalary.SelectedValue != null)
            {
                if (ddlSalary.SelectedValue == "0")
                {
                    lblMsg.Text = "Please Provide Salary";
                    return;
                }
            }
            #endregion

            if (Request.QueryString != null)
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                    int.TryParse(Request.QueryString["Id"], out Eid);

            EmployeeInfo oEmployeeInfo = new EmployeeInfo();
            oEmployeeInfo.Id = Eid;
            oEmployeeInfo.Name = txtEmpName.Text;
            oEmployeeInfo.Address = txtEmpAddress.Text;
            oEmployeeInfo.DOB = Convert.ToDateTime(txtEmpDOB.Text);
            oEmployeeInfo.CellNo = txtEmpContact.Text;
            oEmployeeInfo.Email = txtEmpEmail.Text;
            oEmployeeInfo.DesignationId = Convert.ToInt32(ddlDesgination.SelectedValue);
            oEmployeeInfo.SalaryId = Convert.ToInt32(ddlSalary.SelectedValue);
            oEmployeeInfo.DepartmnetId = Convert.ToInt32(ddlDepartment.SelectedValue);
            oEmployeeInfo.LoginId = txtloginId.Text.Trim();
            oEmployeeInfo.Password = txtPassword.Text.Trim();
            oEmployeeInfo.UserTypeId = 3;

            bool result = new EmployeeFactory().AddEmployee(oEmployeeInfo);
            if (result)
            {
                lblMsg.Text = "Employee " + "'" + oEmployeeInfo.Name + "'" + " Added";
                BindEmployees();
            }
        }

        private void SetTextBoxes(int Eid)
        {
            try
            {
                txtloginId.Enabled = false;
                txtPassword.Enabled = false;
                EmployeeInfo oInfo = new EmployeeFactory().GetEmployeeById(Eid);
                if (oInfo != null)
                {
                    txtEmpName.Text = oInfo.Name;
                    txtEmpAddress.Text = oInfo.Address;
                    txtEmpDOB.Text = oInfo.DOB.ToShortDateString();
                    txtEmpContact.Text = oInfo.CellNo;
                    txtEmpEmail.Text = oInfo.Email;
                    
                    if (oInfo.DesignationId != 0)
                    {
                        ddlDesgination.SelectedValue = oInfo.DesignationId.ToString();
                        BindSalary(Convert.ToInt32(ddlDesgination.SelectedValue));
                        ddlSalary.SelectedValue = oInfo.SalaryId.ToString();
                    }
                    ddlDepartment.SelectedValue = oInfo.DepartmnetId.ToString();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {

                LinkButton lb = (LinkButton)(sender);

                string empid = lb.CommandArgument;

                if (empid != null)
                {
                    var aa = new EmployeeFactory().DeleteEmployee(Convert.ToInt32(empid));

                    if (aa)
                    {
                        Response.Redirect("AddEmployee.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Employee Cannot be deleted";
                    }
                }

            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message;
            }
        }
    }
}