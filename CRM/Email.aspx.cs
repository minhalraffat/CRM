using CRMDLL.DataBase;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string Description = txtDescription.Text;
            //string senderEmail = TextBox1.Text;
            //string password = TextBox2.Text;
            string ddlValue = ddlFrequency.SelectedItem.Value;
            SendEmail(Description, ddlValue);
        }
         
        public void SendEmail( string description,string frequency)
        {
            try
            {
                //string smtpAddress = "smtp.gmail.com";
                int portNumber = 587;
                bool enableSSL = true;
                

                string SenderEmailAddress = System.Configuration.ConfigurationManager.AppSettings["SenderEmailAddress"];
                string SenderEmailPassword = System.Configuration.ConfigurationManager.AppSettings["SenderEmailPassword"];
                string SenderSMTPServer = System.Configuration.ConfigurationManager.AppSettings["SenderSMTPServer"];
               
                SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=CRMDB;Integrated Security=True");
                connection.Open();
                CRMDataContext db = new CRMDataContext();
                SqlDataReader sqlData;

                if (frequency == "1")
                {
                    sqlData = new SqlCommand("Select Email From Employee", connection).ExecuteReader();
                }
                else
                {
                    sqlData = new SqlCommand("Select Email From Register where TypeId = 2", connection).ExecuteReader();
                }
                int count = sqlData.FieldCount;

                while (sqlData.Read())
                {
                    for (int i = 0; i < count; i++)
                    {
                        string emailnew = sqlData[i].ToString();

                      

                        using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress(SenderEmailAddress);
                            mail.To.Add(emailnew);
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
                                    message.InnerText = "Mail Sent Successfully";
                                }

                            }
                        }
                    }
                }
                connection.Close();

                //string SenderEmailAddress = System.Configuration.ConfigurationManager.AppSettings["SenderEmailAddress"];
                //string SenderEmailPassword = System.Configuration.ConfigurationManager.AppSettings["SenderEmailPassword"];
                //string SenderSMTPServer = System.Configuration.ConfigurationManager.AppSettings["SenderSMTPServer"];

                ////string smtpAddress = "smtp.gmail.com";
                //int portNumber = 587;
                //bool enableSSL = true;

                //// string emailFrom = "tahahussain799@gmail.com";
                //// string password = "Rockstar4388";
                //// string emailTo = "waqaralikhan26@yahoo.com";
                ////  string subject = "Hello";
                //// string body = "Hello, I'm just writing this to say Hi!";

                //using (MailMessage mail = new MailMessage())
                //{
                //    mail.From = new MailAddress(SenderEmailAddress);
                //    mail.To.Add(email);
                //    mail.Subject = "CRMMINT";
                //    mail.Body = description;
                //    mail.IsBodyHtml = true;
                //    // Can set to false, if you are sending pure text.
                //    using (SmtpClient smtp = new SmtpClient(SenderSMTPServer, portNumber))
                //    {
                //        smtp.UseDefaultCredentials = false;
                //        smtp.Credentials = new NetworkCredential(SenderEmailAddress, SenderEmailPassword);
                //        smtp.EnableSsl = enableSSL;
                //        if (smtp.EnableSsl)
                //        {
                //            smtp.Send(mail);
                //            message.InnerText = "Mail Sent Successfully";
                //        }

                //    }
                //}


            }
            catch (Exception)
            {
                message.InnerText = "You are not connected to Internet";

            }

        }
    }
}