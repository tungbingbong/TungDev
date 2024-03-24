<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sitemap.aspx.cs" Inherits="sitemap" %>
<%@Import Namespace = "System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@Import Namespace = "System.Data" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HOANGLONGCO</title>
<link href="<%= clsConfig.GetHostUrl() %>/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%= clsConfig.GetHostUrl() %>/js/dropdowncontent.js"></script>
</head>
<body>
<div class="site">
  <div class="container">
    <asp:PlaceHolder ID="inc_header" runat="server"></asp:PlaceHolder>
    <div class="midle">
    <div class="guide">
       	  <a href="<%= clsConfig.GetHostUrl() %>/Default.aspx" class="norB"><%= lang.setLangValue("Home", "Trang chủ")%> &raquo;</a> <a href="#">Sitemap</a></div>
          <div class="sitemap">
          		<ul>
                	 <li>
                    <h2><a href="<%= clsConfig.GetHostUrl() %>/Default.aspx" style="color:#ffffff;"><%= lang.setLangValue("Home", "Trang chủ")%></a></h2>
                      </li>
                	<li>
                    <h2><%= lang.setLangValue("Company", "Công ty")%></h2>
                    <div class="listsitemap">                    	  	
                    	  	<%
                            DataTable dtNhaxuong = clsDatabase.getDataTable("select * from tbl_category_news where C_MenuNgang = 1 and FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 14 or FK_ParentID = 23 ) order by C_Rank desc");
                            for(int iNhaxuong = 0; iNhaxuong < dtNhaxuong.Rows.Count; iNhaxuong++)
                            {
                             %>
   	                    <a href="<%= clsConfig.GetHostUrl() %>/category/1/<%= dtNhaxuong.Rows[iNhaxuong]["PK_CategoryID"].ToString() %>/<%= clsFunction.RemoveUnicode(dtNhaxuong.Rows[iNhaxuong]["C_Name"].ToString()) %>.aspx"><%= dtNhaxuong.Rows[iNhaxuong]["C_Name"].ToString() %></a> 
   	                        <% } %>
                    </div>
                    
                    </li>
                     <li>
                    <h2><% if(lang.getLangID() == 1) { %><a href="<%= clsConfig.GetHostUrl() %>/cong-trinh/2/11/cong-trinh-tieu-bieu.aspx" style="color:#ffffff;"><% } %><% if(lang.getLangID() == 2) { %><a href="<%= clsConfig.GetHostUrl() %>/cong-trinh/2/22/cong-trinh-tieu-bieu.aspx" style="color:#ffffff;"><% } %><%= lang.setLangValue("Typical Building", "Công trình")%></a></h2>
                      </li>
                    <li> <h2><%= lang.setLangValue("Rocks", "Các loại đá")%></h2><div class="listsitemap">
                    	  <%
                            DataTable dtGranit = clsDatabase.getDataTable("select * from tbl_category_news where C_MenuNgang = 1 and FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 13 or FK_ParentID = 21 ) order by C_Rank desc");
                            for(int iGranit = 0; iGranit < dtGranit.Rows.Count; iGranit++)
                            {
                             %>
   	                    <a href="<%= clsConfig.GetHostUrl() %>/Granite/3/<%= dtGranit.Rows[iGranit]["PK_CategoryID"].ToString() %>/<%= clsFunction.RemoveUnicode(dtGranit.Rows[iGranit]["C_Name"].ToString()) %>.aspx"><%= dtGranit.Rows[iGranit]["C_Name"].ToString() %></a> 
   	                        <% } %>
                    </div>
                    </li>
                    <li><h2> <%= lang.setLangValue("Product", "Sản phẩm")%></h2><div class="listsitemap">
                    	<%
                        DataTable dtProduct = clsDatabase.getDataTable("select * from tbl_category_news where C_MenuNgang = 1 and FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 12 or FK_ParentID = 20 ) order by C_Rank desc");
                        for(int iProduct = 0; iProduct < dtProduct.Rows.Count; iProduct++)
                        {
                         %>
   	                <a href="<%= clsConfig.GetHostUrl() %>/product/4/<%= dtProduct.Rows[iProduct]["PK_CategoryID"].ToString() %>/<%= clsFunction.RemoveUnicode(dtProduct.Rows[iProduct]["C_Name"].ToString()) %>.aspx"><%= dtProduct.Rows[iProduct]["C_Name"].ToString() %></a>  
   	                    <% } %>
                    </div>
                    </li>
                      <li>
                    <h2><a href="<%= clsConfig.GetHostUrl() %>/contact.aspx" style="color:#ffffff;"><%= lang.setLangValue("Contact", "Liên hệ")%> </a></h2>
                      </li>
                      <li>
                    <h2><a href="<%= clsConfig.GetHostUrl() %>/sitemap.aspx" style="color:#ffffff;"><%= lang.setLangValue("Site map", "Cấu trúc Site")%></a></h2>
                      </li>
                      <li>
                    <h2><a href="<%= clsConfig.GetHostUrl() %>/rss.aspx" style="color:#ffffff;">Rss</a></h2>
                      </li>
                   
                </ul>
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                  <div style="clear:both"></div>
          </div>
          <!-- end sitemap-->
    </div>
    <!-- end midle-->
    <div style="clear:both"></div>
  </div>
  <!-- end container-->
  <div class="bottom">
    <asp:PlaceHolder ID="inc_footer" runat="server"></asp:PlaceHolder>
  </div>
</div>
</body>
</html>

