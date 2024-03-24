﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MOONLY.BusinessLogic;

public partial class Admin_SuaSanPham : System.Web.UI.Page
{
    private const string IDHinh = " ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtTenSanPham.Focus();
            HienDanhMucSanPham();
            HienSanPham();
        }
    }
    //-----------Hiện danh mục sản phẩm----------------
    private void HienDanhMucSanPham()
    {
        XuLyLayDanhMucSanPham xulydanhmucsanpham = new
        XuLyLayDanhMucSanPham();
        try
        {
            xulydanhmucsanpham.Thucthi();
        }
        catch
        {
            Response.Redirect("../Trangloi.aspx");
        }
        dropDanhMucSanPham.DataTextField = "TenDanhMucSanPham";
        dropDanhMucSanPham.DataValueField = "IDDanhMucSanPham";
        dropDanhMucSanPham.DataSource = xulydanhmucsanpham.Ketqua;
        dropDanhMucSanPham.DataBind();
    }
    //----------Hiện sản phẩm theo id sản phẩm--------------
    private void HienSanPham()
    {
        MOONLY.Common.SanPham Spham = new MOONLY.Common.SanPham();
        Spham.Idsanpham = int.Parse(Request.QueryString["Idsanpham"]);
        XuLyLaySanPhamByID laySanPhamByID = new XuLyLaySanPhamByID();
        laySanPhamByID.Sanpham = Spham;
        try
        {
            laySanPhamByID.Thucthi();
            txtTenSanPham.Text = laySanPhamByID.Sanpham.Ten;
            CKEditorControlMoTa.Text = laySanPhamByID.Sanpham.Mota;
            textGia.Text = laySanPhamByID.Sanpham.Giasanpham.ToString();
            imgHinhSanPham.ImageUrl = "../HienThiHinhSanPham.ashx?Idhinhsanpham=" +
            laySanPhamByID.Sanpham.Idhinhsanpham.ToString();
            dropDanhMucSanPham.SelectedIndex =
            dropDanhMucSanPham.Items.IndexOf(dropDanhMucSanPham.Items.FindByText(
            laySanPhamByID.Sanpham.Danhmucsanpham.Tendanhmucsanpham));
            LuuTamIdHinhSanPham = laySanPhamByID.Sanpham.Idhinhsanpham;
        }
        catch
        {
            Response.Redirect("../Trangloi.aspx");
        }
    }
    //---------------Cập nhật thay đổi sản phẩm--------------------
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            MOONLY.Common.SanPham Spham = new MOONLY.Common.SanPham();
            Spham.Idsanpham = int.Parse(Request.QueryString["IDsanpham"]);
            Spham.Ten = txtTenSanPham.Text;
            Spham.Mota = CKEditorControlMoTa.Text;
            Spham.Giasanpham = Convert.ToDecimal(textGia.Text);
            Spham.Iddanhmucsanpham = int.Parse(
            dropDanhMucSanPham.SelectedItem.Value);
            Spham.Idhinhsanpham = LuuTamIdHinhSanPham;
            if (fileuploadHinhSanPham.HasFile)
            {
                Spham.Dulieuhinhsanpham = fileuploadHinhSanPham.FileBytes;
            }
            else
            {
                XuLyLayHinhSanPham XuLyLayHinh = new XuLyLayHinhSanPham();
                XuLyLayHinh.Sanpham = Spham;
                try
                {
                    XuLyLayHinh.Thucthi();
                }
                catch
                {
                    Response.Redirect("../Trangloi.aspx");
                }
                SqlDataSource src = new SqlDataSource();
                src = XuLyLayHinh.Ketqua;
                DataView view = (DataView)src.Select(DataSourceSelectArguments.Empty);
                Spham.Dulieuhinhsanpham = (byte[])view[0]["DuLieuHinhSanPham"];
            }
            XuLyCapNhatSanPham capnhatsanpham = new XuLyCapNhatSanPham();
            capnhatsanpham.Sanpham = Spham;
            try
            {
               capnhatsanpham.Thucthi();
            }
            catch
            {
                Response.Redirect("../Trangloi.aspx");
            }
            Response.Redirect("SanPham.aspx");
        }
    }
    //---------sự kiện nút bỏ qua----------------------
    protected void btnBoQua_Click(object sender, EventArgs e)
    {
        Response.Redirect("SanPham.aspx");
    }
    // Lưu hình để lấy lại hình sản phẩm trong trường hợp hình không thay đổi
    private int LuuTamIdHinhSanPham
    {
        get { return (int)ViewState[IDHinh]; }
        set { ViewState[IDHinh] = value; }
    }
}
