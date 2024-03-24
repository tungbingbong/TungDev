using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AND_travels
{
    public partial class Home : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.User.Identity.IsAuthenticated)
            {
                HttpCookie Cookie = Request.Cookies["UserInfo"]; 
                getUserInfo(Cookie["username"]);
            }
            else
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }
        }

        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WebPages/index.aspx");
        }

        private void getUserInfo(string userName)
        {
            SqlParameter paraUserName = new SqlParameter("@UserName", userName);
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetUserRecord",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(paraUserName);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            lnkbtnUserName.Text = ds.Tables[0].Rows[0][0].ToString();
             
             con.Close(); 
        }

        protected void lnkbtnCancleBusTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CancleBusTicket.aspx");
        }

        protected void lnkbtnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchResult.aspx");
        }
    }
}