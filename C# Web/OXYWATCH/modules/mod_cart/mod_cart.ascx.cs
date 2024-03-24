﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class modules_mod_cart_mod_cart : System.Web.UI.UserControl
{
    public DataTable cart;
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = clsInput.getStringInput("action", 0);
        if (action.Equals("addcart"))
        {
            string key = HttpContext.Current.Request.QueryString["key"];
            DataTable dsSanPham = clsDatabase.getDataTable("select TOP 1 tbl_category_news.C_Name as CatName, tbl_product.* from tbl_category_news inner join tbl_product on tbl_category_news.PK_CategoryID = tbl_product.FK_CategoryID where tbl_category_news.FK_LangID = " + lang.getLangID() + " and tbl_product.PK_ProductID =" + key);

            #region addcart
            if (Session["cart"] == null)
            {
                cart = new DataTable();
                cart.Columns.Add("PK_ProductID");
                cart.Columns.Add("C_Name");
                cart.Columns.Add("C_Img");
                cart.Columns.Add("C_Price");
                cart.Columns.Add("C_SoLuong");
                cart.Columns.Add("C_UserID");
                cart.Columns.Add("C_UserName");
                cart.Columns.Add("C_UserAddress");
                //================================
                DataRow dr = cart.NewRow();

                dr["PK_ProductID"] = dsSanPham.Rows[0]["PK_ProductID"].ToString();
                dr["C_Name"] = dsSanPham.Rows[0]["C_Name"].ToString();
                dr["C_Img"] = dsSanPham.Rows[0]["C_Img"].ToString();
                dr["C_Price"] = dsSanPham.Rows[0]["C_GiaMoi"].ToString();
                dr["C_SoLuong"] = "1";
                dr["C_UserID"] = "";
                dr["C_UserName"] = "";
                dr["C_UserAddress"] = "";

                cart.Rows.Add(dr);
                //================================
                Session["cart"] = cart;


            }
            else
            {

                cart = Session["cart"] as DataTable;
                //================================
                bool isExisted = false;
                foreach (DataRow itemCart in cart.Rows)
                {
                    if (itemCart["PK_ProductID"].ToString().Equals(dsSanPham.Rows[0]["PK_ProductID"].ToString()))
                    {
                        isExisted = true;
                        //Sua so luong
                        int soLuongEdit = int.Parse(itemCart["C_SoLuong"].ToString()) + 1;
                        itemCart["C_SoLuong"] = soLuongEdit;
                        break;
                    }
                }
                if (!isExisted)
                {
                    DataRow dr = cart.NewRow();

                    dr["PK_ProductID"] = dsSanPham.Rows[0]["PK_ProductID"].ToString();
                    dr["C_Name"] = dsSanPham.Rows[0]["C_Name"].ToString();
                    dr["C_Img"] = dsSanPham.Rows[0]["C_Img"].ToString();
                    dr["C_Price"] = dsSanPham.Rows[0]["C_GiaMoi"].ToString();
                    dr["C_SoLuong"] = "1";
                    dr["C_UserID"] = "";
                    dr["C_UserName"] = "";
                    dr["C_UserAddress"] = "";

                    cart.Rows.Add(dr);
                }
                //================================
                Session["cart"] = cart;
            }
            #endregion
            
        }
        if (action.Equals("deletecart"))
        {
            #region editcart
            cart = Session["cart"] as DataTable;
            string key = HttpContext.Current.Request.QueryString["key"];


            for (int i = 0; i < cart.Rows.Count; i++)
            {
                DataRow dr = cart.Rows[i];
                if (dr["PK_ProductID"].ToString().Equals(key))
                {
                    dr.Delete();
                }
            }

            Session["cart"] = cart;
            #endregion
            
        }
        if (action.Equals("editcart"))
        {
            #region editcart
            cart = Session["cart"] as DataTable;
            string key = HttpContext.Current.Request.QueryString["key"];
            string[] arrKey = key.Split('_');
            foreach (DataRow itemCart in cart.Rows)
            {
                string idCart = itemCart["PK_ProductID"].ToString();
                int soLuongEdit = 0;
                foreach (string itemKey in arrKey)
                {
                    if (itemKey.Contains(idCart + ","))
                    {
                        soLuongEdit = int.Parse(itemKey.Split(',')[1]);
                        itemCart["C_SoLuong"] = soLuongEdit;
                    }
                }


            }
            Session["cart"] = cart;
            #endregion
            
        }
    }
}