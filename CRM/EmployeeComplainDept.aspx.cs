using System;
using System.Linq;
using CRMDLL.DataBase;
using CRMDLL.ModelClasses;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CRMDLL.FactoryMethods;

namespace CRM
{
    public partial class EmployeeComplainDept : System.Web.UI.Page
    {
        public int Cmid;
        public int DepartId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }

        public void BindGridview()
        {
            List<ComplainInfo> oInfoList = new List<ComplainInfo>();

            AuthenticationModel oAuthenticationModel = SessionService.GetCurrentUser();
            if (oAuthenticationModel != null)
            {
                if (oAuthenticationModel.Authenticated)
                {
                    DepartId = oAuthenticationModel.EmployeeInfo.DepartmnetId;
                }
                else
                {
                    lblMsg.Text = "Session Expired: Please Login again";
                    return;
                }
            }

            CRMDataContext db = new CRMDataContext();
            var collection = db.Complaints.Where(x => x.DepartmentId == DepartId).ToList();

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
                    oInfo.Status = item.Status;
                    oInfo.ProductId = item.ProductId.Value;
                    oInfo.ProductName = item.Product.Name;

                    oInfoList.Add(oInfo);
                }
            }

            repeaterComplains.DataSource = oInfoList;
            repeaterComplains.DataBind();
        }
        protected void OnEdit(object sender, EventArgs e)
        {
            if (Request.QueryString != null)
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                    int.TryParse(Request.QueryString["Id"], out Cmid);

            ComplainInfo oInfo = new ComplainInfo();
            oInfo.Id = Cmid;

            //oInfo.Status = (txtStatus.Text).ToBoolean();


            bool result = new ComplainFactory().EditComplain(oInfo);

            if (result == false)
            {
                lblMsg.Text = "";

            }
            else
            {
                lblMsg.Text = "Updated";
                BindGridview();


            }


        }
        protected void OnDelete(object sender, EventArgs e)
        {
            if (Request.QueryString != null)
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                    int.TryParse(Request.QueryString["Id"], out Cmid);

            ComplainInfo oInfo = new ComplainInfo();
            oInfo.Id = Cmid;


            bool result = new ComplainFactory().DeleteComplain(oInfo);

            if (result == false)
            {
                lblMsg.Text = "";

            }
            else
            {
                lblMsg.Text = "Deleted";
                BindGridview();


            }


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
               
                var ComplainNo = txtComplainNo.Text;



                List<ComplainInfo> oInfoList = new List<ComplainInfo>();

                CRMDataContext db = new CRMDataContext();
                var collection = db.Complaints.Where(a => a.DepartmentId == DepartId || a.ComplainNumber == ComplainNo).ToList();

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
                        oInfo.Status = item.Status;
                        oInfo.UserId = item.UserId;
                        //if (!string.IsNullOrEmpty(item.Register.Name))
                        //    oInfo.UserName = item.Register.Name;
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