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

public partial class admincp_modules_mod_news_mod_category_news : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        string strDo = clsInput.getStringInput("do", 0);
        int intId = clsInput.getNumericInput("id", 0);
        //Doi vi tri ban ghi - Di chuyen len
        if (strDo == "up")
        {            
            clsSwap.swapUpRecord("tbl_category_news", "PK_CategoryID", intId, "FK_ParentID = " + clsInput.getNumericInput("parentid",0) + " and FK_LangID = " + lang.getLangID());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Doi vi tri ban ghi - Di chuyen xuong
        if (strDo == "down")
        {
            clsSwap.swapDownRecord("tbl_category_news", "PK_CategoryID", intId, "FK_ParentID = " + clsInput.getNumericInput("parentid", 0) + " and FK_LangID = " + lang.getLangID());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Khoa ban ghi
        if (strDo == "lock")
        {
            clsDatabase.ExecuteQuery("update tbl_category_news set C_Active = 0 where PK_CategoryID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Mo khoa ban ghi
        if (strDo == "unlock")
        {
            clsDatabase.ExecuteQuery("update tbl_category_news set C_Active = 1 where PK_CategoryID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Xoa du lieu
        if (strDo == "delete")
        {
            //Xoa tat ca cac ban ghi thuoc phan tin tuc
            clsDatabase.ExecuteQuery("delete from tbl_news where FK_CategoryID = " + intId.ToString());
            //Xoa danh muc
            clsDatabase.ExecuteQuery("delete tbl_category_news where PK_CategoryID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
    }
    
}
