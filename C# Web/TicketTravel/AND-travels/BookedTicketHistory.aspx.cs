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

namespace AND_travels
{
    public partial class BookedTicketHistory : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                HttpCookie Cookie = Request.Cookies["UserInfo"];
                getUserInfo(Cookie["username"]);
                getRecord();
            }
            else
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }
        }
        private void getUserInfo(string userName)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlParameter paraUserName = new SqlParameter("@UserName", userName);
            SqlCommand cmd = new SqlCommand("spGetUserRecord", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(paraUserName);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            lnkbtnUserName.Text = ds.Tables[0].Rows[0][1].ToString();
            con.Close();
            HttpCookie Cookie1 = Request.Cookies["userid"];
            lblUserId.Text = Cookie1["UserId"];
        }
        protected void lnkbtnCancleBusTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CancleBusTicket.aspx");
        }
        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WebPages/index.aspx");
        }
        private void getRecord()
        {
            /*
        
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetHistory",con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter paraUserId = new SqlParameter("@UserId", Convert.ToInt32(Cookie1["UserId"]));
            cmd.Parameters.Add(paraUserId);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            con.Open();
            sda.Fill(dt);
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
            con.Close();*/
        }

        protected void lnkbtnHistry_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchResult.aspx");
        }

    }
}