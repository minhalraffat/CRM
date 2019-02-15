using System;
using System.Linq;
using CRMDLL.ModelClasses;
using CRMDLL.DataBase;
using System.Net.Mail;
using System.Net;

namespace CRMDLL.FactoryMethods
{
    public class RegisterFactory
    {
        public bool AddUser(RegisterInfo oRegisterInfo)
        {
            bool result = false;
            
            CRMDataContext oContect = null;

            try
            {
                oContect = new CRMDataContext();
                Register eRegister = new Register();
                eRegister.LoginId = oRegisterInfo.LoginId;
                eRegister.Password = oRegisterInfo.Password;
                eRegister.Name = oRegisterInfo.Name;
                eRegister.TypeId = 2;
                eRegister.Address = oRegisterInfo.Address;
                eRegister.DOB = oRegisterInfo.DOB;
                eRegister.ContactNo = oRegisterInfo.ContactNo;
                eRegister.Email = oRegisterInfo.Email;
                eRegister.IsActive = true;
                eRegister.IsDelete = false;

                oContect.Registers.InsertOnSubmit(eRegister);

                oContect.SubmitChanges();
                return true;
            }
            catch (Exception x)
            {
                throw new Exception(x.Message);
            }
            return result;
        }

        public static bool EditUser(RegisterInfo oEmployeeInfo)
        {
            bool result = false;
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var data = oContect.Registers.Where(e => e.Id == oEmployeeInfo.Id).FirstOrDefault();
            if (data != null)
            {
                data.Name = oEmployeeInfo.Name;
                data.Address = oEmployeeInfo.Address;
                data.ContactNo = oEmployeeInfo.ContactNo;
                data.DOB = oEmployeeInfo.DOB;
                data.Email = oEmployeeInfo.Email;
                data.Password = oEmployeeInfo.Password;
                oContect.SubmitChanges();
                result = true;
            }
            return result;
        }

        public RegisterInfo GetUserById(int UserId)
        {
            RegisterInfo oRegUsers = new RegisterInfo();
            CRMDataContext oContect = null;
            oContect = new CRMDataContext();

            var empData = oContect.Registers.Where(e => e.Id == UserId).FirstOrDefault();
            if (empData == null)
            {
                throw new Exception("No User found with provided User id " + UserId);
            }

            try
            {
                oRegUsers.Id = empData.Id;
                oRegUsers.LoginId = empData.LoginId;
                oRegUsers.Password = empData.Password;
                oRegUsers.TypeId = empData.TypeId;
                oRegUsers.Name = empData.Name;
                oRegUsers.Address = empData.Address;
                oRegUsers.ContactNo = empData.ContactNo;
                oRegUsers.DOB = empData.DOB;
                oRegUsers.Email = empData.Email;
                oRegUsers.IsActive = empData.IsActive;
                oRegUsers.IsDelete = empData.IsDelete;
            }
            catch (Exception)
            {
                throw;
            }
            return oRegUsers;
        }



        public string SendEmail(string description, string emailAddress)
        {
            string jresponse;
            try
            {


                string SenderEmailAddress = System.Configuration.ConfigurationManager.AppSettings["SenderEmailAddress"];
                string SenderEmailPassword = System.Configuration.ConfigurationManager.AppSettings["SenderEmailPassword"];
                string SenderSMTPServer = System.Configuration.ConfigurationManager.AppSettings["SenderSMTPServer"];

               
                int portNumber = 587;
                bool enableSSL = true;

        

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(SenderEmailAddress);
                    mail.To.Add(emailAddress);
                    mail.Subject = "CRMMINT";
                    mail.Body = description;
                    mail.IsBodyHtml = true;
                    // Can set to false, if you are sending pure text.
                    using (SmtpClient smtp = new SmtpClient(SenderSMTPServer, portNumber))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(SenderEmailAddress, SenderEmailPassword);
                        smtp.EnableSsl = enableSSL;
                        if (smtp.EnableSsl)
                        {
                            smtp.Send(mail);
                           return jresponse = "Mail Sent Successfully";
                        }

                    }
                }

                return jresponse = "Mail Sent Successfully";
            }
            catch (Exception)
            {
                return jresponse = "You are not connected to Internet";

            }

        }
    }
}