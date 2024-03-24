using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace AND_travels.WebPages
{
    public partial class index : System.Web.UI.Page
    {
        
            
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/Authentication.aspx");
        }

        protected void lnkbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/Authentication.aspx");
        }

        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie = Request.Cookies["UserInfo"];
            myCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/index.aspx");
        }

        protected void lnkbtnCancleTkt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPages/Authentication.aspx");
        }

        protected void lnkbtnSearch_Click(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                Response.Write("<script>alert('You Are Not Login Login First.')</script>");
            }
        }

        
    }
}