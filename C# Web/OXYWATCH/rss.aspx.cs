using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class rss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((this.Session["fron_login"] == null) || (Convert.ToBoolean(this.Session["fron_login"]) != true))
        {
            this.Session["fron_login"] = true;
            Response.Redirect(clsConfig.GetHostUrl() + "/index.aspx");
        }

        inc_header.Controls.Add(LoadControl("~/modules/mod_top/mod_header.ascx"));
        inc_footer.Controls.Add(LoadControl("~/modules/mod_footer/mod_footer.ascx"));
    }
}
