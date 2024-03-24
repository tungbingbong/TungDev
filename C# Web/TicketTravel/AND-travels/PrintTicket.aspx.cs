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
    public partial class PrintTicket : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["paymentid"] != null)
            { 
                string PaymentId = Request.QueryString["paymentid"];
                HttpCookie Cookie = Request.Cookies["userid"];
                string UserId = Cookie["UserId"];
                getRecordOnPrintTicket(PaymentId, UserId);
            }
            else
            {
                Response.Redirect("~/SearchResult.aspx");
            }
        }

        private void getRecordOnPrintTicket(string PaymentId,string UserId)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetRecordOnPrintTicket",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraUserId = new SqlParameter("@UserId", UserId);
            cmd.Parameters.Add(paraUserId);
            SqlParameter paraPaymentId = new SqlParameter("@PaymentId", PaymentId);
            cmd.Parameters.Add(paraPaymentId);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            lblBusNumber.Text = ds.Tables[0].Rows[0][0].ToString();
            lblBusName.Text = ds.Tables[0].Rows[0][1].ToString();
            lblSource.Text = ds.Tables[0].Rows[0][2].ToString();
            lblDestination.Text = ds.Tables[0].Rows[0][3].ToString();
            lblPassangerName.Text = ds.Tables[0].Rows[0][4].ToString();
            lblMobile.Text = ds.Tables[0].Rows[0][5].ToString();
            lblArrival.Text = ds.Tables[0].Rows[0][6].ToString();
            lblDeparture.Text = ds.Tables[0].Rows[0][7].ToString();
            lblBookingDate.Text = ds.Tables[0].Rows[0][8].ToString();
            lblJourneyDate.Text = ds.Tables[0].Rows[0][9].ToString();
            lblPassengerCount.Text = ds.Tables[0].Rows[0][10].ToString();
            lblTotalPrice.Text = ds.Tables[0].Rows[0][11].ToString();
            con.Close();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchResult.aspx");
        }



    }
}