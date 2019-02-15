using CRMDLL.DataBase;
using CRMDLL.FactoryMethods;
using CRMDLL.ModelClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace CRM.Master
{
    public partial class DepartmentComplains : System.Web.UI.Page
    {
        public int UserId;
        public string UserName;

        public int DepartmentId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
                BindDepartments();
            }
        }

        public void BindGridview()
        {
            List<ComplainInfo> oInfoList = new List<ComplainInfo>();

            CRMDataContext db = new CRMDataContext();
            var collection = db.Complaints.ToList();

            if (collection != null)
            {
                foreach (var item in collection)
                {
                    ComplainInfo oInfo = new ComplainInfo();
                    oInfo.Id = item.Id;
                    oInfo.ComplainNumber = item.ComplainNumber;
                    oInfo.ComplainTypeId = item.ComplainTypeId;
                    oInfo.ComplainTypeName = item.ComplainType.ComplainName;
                    oInfo.Description = item.Description;
                    oInfo.ProductName = item.Status;
                    oInfo.UserId = item.UserId;
                    //oInfo.ProductIdName = item.Product.;
                    //oInfo.UserName = item.Register.Name;

                    oInfoList.Add(oInfo);
                }
            }

            repeaterComplains.DataSource = oInfoList;
            repeaterComplains.DataBind();
        }

        private void BindDepartments()
        {
            //AuthenticationModel oAuthenticationModel = SessionService.GetCurrentUser();
            //if (oAuthenticationModel != null)
            //{
            //    if (oAuthenticationModel.Authenticated)
            //    {
            //        UserId = oAuthenticationModel.EmployeeInfo.Id;
            //        UserName = oAuthenticationModel.EmployeeInfo.Name;
            //    }  
            //}

            CRMDataContext db = new CRMDataContext();
            var data = from d in db.Departments select d;

            ddlDepartment.DataSource = data;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "Id";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("Select Department", "0"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlDepartment.SelectedValue == "0")
                {
                    lblMsg.Text = "Please Select Department Type";
                    return;
                }

                int DepartId = Convert.ToInt32(ddlDepartment.SelectedValue);
                List<ComplainInfo> oInfoList = new List<ComplainInfo>();

                CRMDataContext db = new CRMDataContext();
                var collection = db.Complaints.Where(a => a.DepartmentId == DepartId).ToList();

                if (collection != null)
                {
                    foreach (var item in collection)
                    {
                        ComplainInfo oInfo = new ComplainInfo();
                        oInfo.Id = item.Id;
                        //oInfo.UserId = item.UserId;
                        //oInfo.UserName = item.use
                        oInfo.ComplainNumber = item.ComplainNumber;
                        oInfo.ComplainTypeId = item.ComplainTypeId;
                        oInfo.ComplainTypeName = item.ComplainType.ComplainName;
                        oInfo.Description = item.Description;
                        oInfo.ProductName = item.Status;
                        oInfo.UserId = item.UserId;
                        oInfo.Status = item.Status;
                        if (item.ProductId.HasValue)
                            oInfo.ProductId = item.ProductId.Value;
                        oInfo.ProductName = item.Product.Name;

                        oInfoList.Add(oInfo);
                    }
                }

                repeaterComplains.DataSource = oInfoList;
                repeaterComplains.DataBind();
            }
            catch (Exception aa)
            {
                lblMsg.Text = aa.Message;
            }
        }
    }
}