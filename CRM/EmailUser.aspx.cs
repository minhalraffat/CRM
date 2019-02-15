using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class EmailUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Name = txtName.Text;
            string EmailAddress = txtemail.Text;
            string Description = TextBox3.Text;
            //string senderEmail = TextBox1.Text;
            //string password = TextBox2.Text;

            SendEmail(Name, EmailAddress, Description);
        }
        public void SendEmail(string name, string email, string description)
        {
            try
            {

            string SenderEmailAddress = TextBox1.Text;
            string SenderEmailPassword = TextBox2.Text;
            string SenderSMTPServer = "smtp.gmail.com";

           
            int portNumber = 587;
            bool enableSSL = true;

          

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(SenderEmailAddress);
                mail.To.Add(email);
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
            catch (Exception)
            {
                message.InnerText = "You are either not connected to the Internet or Email address / Password doesnot match ";
               
            }

        }
    }
}