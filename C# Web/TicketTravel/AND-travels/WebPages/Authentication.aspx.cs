using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace AND_travels.WebPages
{
    public partial class Authentication : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }
        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {
            int check = Register();

            if (check == 0)
            {
                lblError.Text = "You are Allready Registered";
            }
            else if (check == 1)
            {
                tbName.Text = "";
                tbEmail.Text = "";
                tbMobile.Text = "";
                lblError.Text = "You are Successfully Register Go With Login";
            }
        }
        private int Register()
        {
            string encryptedPassword1 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbSignUpConfirmPassword.Text, "SHA1");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spRegister", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraName = new SqlParameter("@Name", tbName.Text);
            SqlParameter paraEmail = new SqlParameter("@Email", tbEmail.Text);
            SqlParameter paraMobile = new SqlParameter("@Mobile", tbMobile.Text);
            SqlParameter paraPassword = new SqlParameter("@Password", encryptedPassword1);

            cmd.Parameters.Add(paraName);
            cmd.Parameters.Add(paraEmail);
            cmd.Parameters.Add(paraMobile);
            cmd.Parameters.Add(paraPassword);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            return check;
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            int check = Login();
            if (check == 1)
            {
                lblError.Text = "You Are Successfully Login";
                HttpCookie myCookie = new HttpCookie("UserInfo");
                myCookie["username"] = tbUserName.Text;
                Response.Cookies.Add(myCookie);
                FormsAuthentication.RedirectFromLoginPage("sam", false);
            }
            else if (check == 2)
            {
                lblError.Text = "Password is Incorrect";
            }
            else if (check == 0)
            {
                lblError.Text = "You Are Not Register...Register First.";
            }

        }

        private int Login()
        {
            string encryptedPassword2 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraUserName = new SqlParameter("@UserName", tbUserName.Text);
            SqlParameter paraPassword = new SqlParameter("@Password", encryptedPassword2);
            cmd.Parameters.Add(paraUserName);
            cmd.Parameters.Add(paraPassword);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            con.Close();
            return check;
        }

        protected void lnkbtnForgetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/PasswordRecover.aspx");
        }
    }
}