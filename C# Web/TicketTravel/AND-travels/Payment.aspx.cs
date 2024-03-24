using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AND_travels
{
    public partial class Payment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                if (Request.QueryString["id"] != null)
                {
                    transactionNumber();
                    lblTotalCost.Text = Request.QueryString["id"].ToString();
                }
                else
                {
                    Response.Redirect("~/SearchResult.aspx");
                }
            }
            else
            {
                Response.Redirect("~/SearchResult.aspx");
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            HttpCookie Cookie = Request.Cookies["userid"];
            savePaymentId(lblPaymentId.Text,Convert.ToInt32(Cookie["UserId"]));
        }

        private void transactionNumber()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spGetTransactionNumber",con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            lblPaymentId.Text = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
        }
        private void savePaymentId(string paymentId,int userid)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spSavePaymentId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter paraPayment = new SqlParameter("@PaymentId",paymentId);
            cmd.Parameters.Add(paraPayment);
            SqlParameter paraUserId = new SqlParameter("@UserId", userid);
            cmd.Parameters.Add(paraUserId);
            con.Open();
            int check = (int)cmd.ExecuteScalar();
            if(check == 1)
            {
                Response.Redirect("~/Loading.aspx?paymentid="+paymentId);
            }
            else if(check == 0)
            {
                Response.Write("Payment IS Allready done");
            }
            con.Close();
        }

    }
}