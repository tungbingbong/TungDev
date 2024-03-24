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
    public partial class Booking : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                HttpCookie Cookie = Request.Cookies["UserInfo"];
                getUserInfo(Cookie["username"]);
                if(Request.QueryString["id"] != null)
                {
                    getRecord(Convert.ToInt32(Request.QueryString["id"]),Convert.ToString(Cookie["username"]));
                }
            }
            else
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }
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
        }

        private void getRecord(int proId,string UserName)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlParameter paraProId = new SqlParameter("@ProId", proId);
            SqlParameter paraUserName = new SqlParameter("@userName", UserName);
            SqlCommand cmd = new SqlCommand("spGetRecord", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(paraProId);
            cmd.Parameters.Add(paraUserName);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            
            lblName.Text = ds.Tables[0].Rows[0][0].ToString();
            lblSource.Text = ds.Tables[0].Rows[0][1].ToString();
            lblDestination.Text = ds.Tables[0].Rows[0][2].ToString();
            lblArrive.Text = ds.Tables[0].Rows[0][3].ToString();
            lblDeparts.Text = ds.Tables[0].Rows[0][4].ToString();
            lblBusType.Text = ds.Tables[0].Rows[0][5].ToString();
            int Cost = Convert.ToInt32(ds.Tables[0].Rows[0][6].ToString());
            lblUserId.Text = ds.Tables[0].Rows[0][7].ToString();
            lblBusNumber.Text = ds.Tables[0].Rows[0][8].ToString();
            int TotalCost = Cost * Convert.ToInt32(ddlNumberOfSeats.SelectedItem.ToString());
            lblTotalCosts.Text = Convert.ToString(TotalCost);
            con.Close();
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            saveRecordOnBooking(Convert.ToInt32(lblUserId.Text),Convert.ToInt32(ddlNumberOfSeats.SelectedItem.ToString()),Convert.ToInt32(lblTotalCosts.Text));
            
        }
        private void saveRecordOnBooking(int UserId,int PassangerCount,int TotalPrice)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spSaveOnBooking", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraUserId = new SqlParameter("@UserId", UserId);
            cmd.Parameters.Add(paraUserId);
            SqlParameter paraPassangerCount = new SqlParameter("@PassangerCount",PassangerCount);
            cmd.Parameters.Add(paraPassangerCount);
            SqlParameter paraTotalPrice = new SqlParameter("@TotalPrice",TotalPrice);
            cmd.Parameters.Add(paraTotalPrice);
            SqlParameter paraBusId = new SqlParameter("@BusId", Convert.ToInt32(lblBusNumber.Text));
            cmd.Parameters.Add(paraBusId);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            if(check == 1)
            {
                Response.Redirect("~/Payment.aspx?id=" + lblTotalCosts.Text);
            }
            else if(check == 0)
            {
                Response.Write("UserDoesNotExist");
            }
            con.Close();
        }

        protected void lnkbtnHistry_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BookedTicketHistory.aspx");
        }

    }
}