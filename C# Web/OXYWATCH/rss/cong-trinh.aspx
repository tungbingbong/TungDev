<%@ Page Language="C#" AutoEventWireup="true" ContentType="text/xml" CodeFile="cong-trinh.aspx.cs" Inherits="rss_cong_trinh" %>
<%@Import Namespace = "System.Data" %>
    <rss version="2.0">
      <channel>
        <title>Da hoa cuong Hoang Long</title>
        <link>http://dahoacuonghoanglong.com</link>
        <description>
          Website hiển thị thông tin các loại đá - Mục công trình
        </description>
 <%
     DataTable dtRssNhaxuong = clsDatabase.getDataTable("select tbl_news.*, tbl_category_news.C_Name as CatName from tbl_news inner join tbl_category_news on tbl_news.FK_CategoryID = tbl_category_news.PK_CategoryID where tbl_news.FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 11 or FK_ParentID = 22 ) and tbl_news.C_Active = 1 order by tbl_news.C_Rank desc");
     for (int iRssNhaxuong = 0; iRssNhaxuong < dtRssNhaxuong.Rows.Count; iRssNhaxuong++)
     {
  %>
        <item>          
          <category><%= clsFunction.FormatForXML(dtRssNhaxuong.Rows[iRssNhaxuong]["CatName"].ToString())%></category>
          <link><%= clsConfig.GetHostUrl() %>/detail-news/1/<%= dtRssNhaxuong.Rows[iRssNhaxuong]["PK_NewsID"].ToString() %>/<%= clsFunction.FormatForXML(clsFunction.RemoveUnicode(dtRssNhaxuong.Rows[iRssNhaxuong]["C_Name"].ToString()))%>.aspx</link>
          <title><%= clsFunction.FormatForXML(dtRssNhaxuong.Rows[iRssNhaxuong]["C_Name"].ToString())%></title>
          <images><%= clsConfig.GetHostUrl() %>/<%= clsFunction.FormatForXML(dtRssNhaxuong.Rows[iRssNhaxuong]["C_Img"].ToString())%></images>
          <description>
             <%= clsFunction.FormatForXML(clsInput.decodeStr(dtRssNhaxuong.Rows[iRssNhaxuong]["C_Des"].ToString()))%>
          </description>                    
        </item>
 <% } %>
      </channel>
    </rss>