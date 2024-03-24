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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(isPasswordResetLinkIsValid())
            {

            }
            else
            {
                Response.Redirect("~/WebPages/Authentication.aspx");
            }
        }

        private bool ChangeUserPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@Guid",
                    Value = Request.QueryString["uid"]
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = FormsAuthentication.HashPasswordForStoringInConfigFile(tbConfirmPassword.Text,"SHA1")
                }
            };
            return ExecuteSp("spChangePassword", paramList);
        }
        private bool isPasswordResetLinkIsValid()
        {
            List<SqlParameter> parmList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@Guid",
                    Value = Request.QueryString["uid"]
                }
            };
            return ExecuteSp("spIsPasswordResetLinkValid", parmList);
        }
        private bool ExecuteSp(string spName, List<SqlParameter> spParameter)
        {
            string cs = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;  
                foreach(SqlParameter parameter in spParameter)
                {
                    cmd.Parameters.Add(parameter);
                }
                con.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        protected void lnkbtnChange_Click(object sender, EventArgs e)
        {
            if(ChangeUserPassword())
            {
                lblMessege.Text = "Password IS Successfully Changed";
                System.Threading.Thread.Sleep(2000);
                Response.Redirect("~/WebPages/Authentication.aspx");
            }
            else
            {
                lblMessege.Text = "Password Reset Link Has Expired.!";
            }
        }
    }
}