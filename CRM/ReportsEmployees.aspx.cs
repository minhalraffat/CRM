using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.Master
{
    
    public partial class ReportsEmployees : System.Web.UI.Page
    {
        string conString = "Data Source=.;Initial Catalog=CRMDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetEmployeeStatus();
                this.EmployeeBindRDLCReport();
            }

        }

        private void EmployeeBindRDLCReport()
        {

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Employees.rdlc");
            Employees dsEmployees = GetEmployeeData("SELECT  * FROM Employee WHERE Name = @Name OR @Name = ''");

            ReportDataSource datasource = new ReportDataSource("DataSet1", dsEmployees.Tables[0]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);



        }


        protected void Employees_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.EmployeeBindRDLCReport();
        }



        private Employees GetEmployeeData(string query)
        {
            SqlCommand Empcmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    Empcmd.Connection = con;
                    Empcmd.Parameters.AddWithValue("@Name", this.ddlEmployees.SelectedItem.Value);
                    sda.SelectCommand = Empcmd;
                    using (Employees dsEmployees = new Employees())
                    {
                        sda.Fill(dsEmployees, "DataTable2");
                        return dsEmployees;
                    }
                }
            }
        }

        private void GetEmployeeStatus()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT Name FROM Employee");
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    DataTable dtStatus = new DataTable();
                    sda.Fill(dtStatus);
                    ddlEmployees.DataSource = dtStatus;
                    ddlEmployees.DataTextField = "Name";
                    ddlEmployees.DataValueField = "Name";
                    ddlEmployees.DataBind();
                    ddlEmployees.Items.Insert(0, new ListItem("Select", ""));
                }
            }
        }

    }
}