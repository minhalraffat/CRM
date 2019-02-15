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
    public partial class Reports : System.Web.UI.Page
    {
        string conString = "Data Source=.;Initial Catalog=CRMDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetStatus();
                this.BindRDLCReport();


            }

        }
        private void BindRDLCReport()
        {

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Complains.rdlc");
            Complains dsComplains = GetData("SELECT  * FROM complaints WHERE Status = @Status OR @Status = ''");

            ReportDataSource datasource = new ReportDataSource("DataSet1", dsComplains.Tables[0]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);



        }





        protected void Countries_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.BindRDLCReport();
        }







        private Complains GetData(string query)
        {
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter ads = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Status", this.ddlStatus.SelectedItem.Value);
                    ads.SelectCommand = cmd;
                    using (Complains dsCustomers = new Complains())
                    {
                        ads.Fill(dsCustomers, "DataTable1");
                        return dsCustomers;
                    }
                }
            }
        }








        private void GetStatus()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT Status FROM complaints");
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    DataTable dtStatus = new DataTable();
                    sda.Fill(dtStatus);
                    ddlStatus.DataSource = dtStatus;
                    ddlStatus.DataTextField = "Status";
                    ddlStatus.DataValueField = "Status";
                    ddlStatus.DataBind();
                    ddlStatus.Items.Insert(0, new ListItem("Select", ""));
                }
            }
        }




    



    }
}