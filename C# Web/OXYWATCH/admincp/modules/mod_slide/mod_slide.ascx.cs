﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincp_modules_mod_slide_mod_slide : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //==============================================
        string strDo = clsInput.getStringInput("do", 0);
        int intId = clsInput.getNumericInput("id", 0);
        //Doi vi tri ban ghi - Di chuyen len
        if (strDo == "up")
        {
            clsSwap.swapUpRecord("tbl_slide", "PK_slideID", intId, "FK_LangID = " + lang.getLangID());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Doi vi tri ban ghi - Di chuyen xuong
        if (strDo == "down")
        {
            clsSwap.swapDownRecord("tbl_slide", "PK_slideID", intId, "FK_LangID = " + lang.getLangID());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Khoa ban ghi
        if (strDo == "lock")
        {
            clsDatabase.ExecuteQuery("update tbl_slide set C_Active = 0 where PK_slideID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Mo khoa ban ghi
        if (strDo == "unlock")
        {
            clsDatabase.ExecuteQuery("update tbl_slide set C_Active = 1 where PK_slideID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Xoa du lieu
        if (strDo == "delete")
        {
            clsDatabase.ExecuteQuery("delete tbl_slide where PK_slideID = " + intId.ToString());
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Xoa nhieu ban ghi
        if (strDo == "DeleteAll")
        {
            string strAllRecord = Request.Form["listArrRecord"];
            clsDatabase.ExecuteQuery("delete from tbl_slide where PK_slideID in (" + strAllRecord + ")");
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //Active nhieu ban ghi
        if (strDo == "ActiveAll")
        {
            string strAllRecord = Request.Form["listArrRecord"];
            clsDatabase.ExecuteQuery("update tbl_slide set C_Active = 1 where PK_slideID in (" + strAllRecord + ")");
            Response.Redirect(clsConfig.getCurrentUrl());
        }
        //InActive nhieu ban ghi
        if (strDo == "InActiveAll")
        {
            string strAllRecord = Request.Form["listArrRecord"];
            clsDatabase.ExecuteQuery("update tbl_slide set C_Active = 0 where PK_slideID in (" + strAllRecord + ")");
            Response.Redirect(clsConfig.getCurrentUrl());
        }
    }

}