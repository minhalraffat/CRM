using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;


namespace CRMDLL.FactoryMethods
{
    public class ComplainFactory
    {
        CRMDataContext db = new CRMDataContext();
        string EmailId;
        public string AddComplain(int UserId, int ComplainTypeId, int DepartId, string Description, int productId)
        {
            string output = null;

            try
            {
                if (UserId == 0)
                {
                    throw new Exception("Your Session has been expired. Please Login again");
                }

                CRMDataContext db = new CRMDataContext();
                Complaint table = new Complaint();

                Random rnd = new Random();
                int no = rnd.Next(15628);

                table.ComplainTypeId = ComplainTypeId;
                table.ComplainNumber = no.ToString();
                table.Description = Description;
                table.UserId = UserId;
                table.Status = "In-Progress";
                table.ProductId = productId;
                table.DepartmentId = DepartId;
                db.Complaints.InsertOnSubmit(table);
                db.SubmitChanges();

                output = table.ComplainNumber;
            }
            catch (Exception)
            {
                throw;
            }
            return output;
        }

        public bool DeleteComplain(ComplainInfo oInfo)
        {
            bool result = false;
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var data = oContect.Complaints.Where(e => e.Id == oInfo.Id).FirstOrDefault();


            if (data != null)
            {
                oContect.Complaints.DeleteOnSubmit(data);
                oContect.SubmitChanges();
                result = true;
            }
            else
            {
                result = false;

            }
            return result;




        }

        public bool EditComplain(ComplainInfo oInfo)
        {
            bool result = false;
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var data = oContect.Complaints.Where(e => e.Id == oInfo.Id).FirstOrDefault();
            if (data != null)
            {
                if (data.Status == "In-Progress")
                {
                    data.Status = "Resolved";
                }
                else
                {
                    data.Status = "In-Progress";
                }
                oContect.SubmitChanges();
                result = true;





            }
            return result;
        }
    }
}