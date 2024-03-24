using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;

namespace AND_travels.WebPages
{
    public partial class PasswordRecover : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {

            }
        }

        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/Authentication.aspx");
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/Authentication.aspx");
        }

        protected void lnkbtnRecover_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paraEmail = new SqlParameter("@Email", tbEmail.Text);
                cmd.Parameters.Add(paraEmail);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    if(Convert.ToInt16(dr["ReturnCode"]) == 1 || Convert.ToInt16(dr["ReturnCode"]) == 2)
                    {
                        int check = SendPasswordResetEmail(tbEmail.Text, Convert.ToString(dr["UserName"]), Convert.ToString(dr["GUID"]));
                        if(check == 1)
                        {
                            lblMEssege.Text = "An PassswordReset Link Is Send On '"+tbEmail.Text+"' Kindly Check Your Email.";    
                        }
                        else 
                        {
                            lblMEssege.Text ="An Problem Occured in send Email.";
                        }
                    }
                    else if(Convert.ToInt16(dr["ReturnCode"]) == 0)
                    {
                        lblMEssege.Text = "You Are Not Register ...Please register first..";
                    }
                }
            }
        }

        private int SendPasswordResetEmail(string ToEmail,string USerName,string GUID)
        {

            MailMessage mailMessege = new MailMessage("ptcsam71@gmail.com", ToEmail);

            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear <b>" + USerName + "</b><br><br>");
            sbEmailBody.Append("Please Click on the folloeing link to reset your password.<br>");
            sbEmailBody.Append("http://localhost:52170/WebPages/ChangePassword.aspx?uid="+GUID);
            sbEmailBody.Append("<br><br><b>&-travels</b>");
            mailMessege.IsBodyHtml = true;
            mailMessege.Body = sbEmailBody.ToString();
            mailMessege.Subject = "ResetYourPassword";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "ptcsam71@gmail.com",
                Password = "ptc.sam.@71"
            };
            
            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessege);
            return 1;
        }
    }
}