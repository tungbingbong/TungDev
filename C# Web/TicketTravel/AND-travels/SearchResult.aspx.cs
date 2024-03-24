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
    public partial class SearchResult : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
           
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.User.Identity.IsAuthenticated)
            {
                HttpCookie Cookie = Request.Cookies["UserInfo"]; 
                if(Cookie != null)
                { 
                    getUserInfo(Cookie["username"]);
                    searchResult(Convert.ToString(ddlSource.SelectedItem), Convert.ToString(ddlDestination.SelectedItem));
                }
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

        protected void lnkbtnCancleBusTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CancleBusTicket.aspx");
        }

        /********Executable Method Starts*******/
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
            lblUserId.Text = ds.Tables[0].Rows[0][0].ToString();
            HttpCookie cookieUserId = new HttpCookie("userid");
            cookieUserId["UserId"] = lblUserId.Text;
            Response.Cookies.Add(cookieUserId);
            lnkbtnUserName.Text = ds.Tables[0].Rows[0][1].ToString();
            con.Close();
        }

        private void searchResult(string from, string to)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spSearchResult", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraSource = new SqlParameter("@Source", from);
            SqlParameter paraDestination = new SqlParameter("@Destination", to);
            cmd.Parameters.Add(paraSource);
            cmd.Parameters.Add(paraDestination);
            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //con.Open();
            //sda.Fill(ds);
           
            con.Open();
            DataTable dt = new DataTable();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            con.Close();
        }

        protected void lnkbtnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "BookNow")
            {
                lblMessege.Text = e.CommandArgument.ToString();
            }
        }

        protected void btnBook_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {    
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("spSaveOnSearchResult",con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paraBusNumber = new SqlParameter("@BusNumber", e.CommandArgument.ToString());
                cmd.Parameters.Add(paraBusNumber);
                SqlParameter paraSource = new SqlParameter("@Source", ddlSource.SelectedItem.ToString());
                cmd.Parameters.Add(paraSource);
                SqlParameter paraDestination = new SqlParameter("@Destination", ddlDestination.SelectedItem.ToString());
                cmd.Parameters.Add(paraDestination);
                SqlParameter paraUserId = new SqlParameter("@UserId", lblUserId.Text);
                cmd.Parameters.Add(paraUserId);
                SqlParameter JourneyDate = new SqlParameter("@JourneyDate", theDate.Value);
                cmd.Parameters.Add(JourneyDate);
                SqlParameter paraBookingDate = new SqlParameter("@BookingDate", DateTime.Now.ToString());
                cmd.Parameters.Add(paraBookingDate);
                con.Open();
                int check = (int)cmd.ExecuteScalar();
                if(check == 1)
                {
                    Response.Redirect("~/Booking.aspx?id=" + e.CommandArgument.ToString());
                }
                else if(check == 0)
                {
                    Response.Write("check ==0 Executed Nothing Happened");
                }
                else if(check == 2)
                {
                    Response.Redirect("~/Booking.aspx?id=" + e.CommandArgument.ToString());
                }
                con.Close();
                
            }
        }

        protected void lnkbtnHistry_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BookedTicketHistory.aspx");
        }
    }
}