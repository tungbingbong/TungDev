<%@ Page Language="C#" AutoEventWireup="true" ContentType="text/xml" CodeFile="san-pham.aspx.cs" Inherits="rss_san_pham" %>
<%@Import Namespace = "System.Data" %>
    <rss version="2.0">
      <channel>
        <title>Da hoa cuong Hoang Long</title>
        <link>http://dahoacuonghoanglong.com</link>
        <description>
          Website hiển thị thông tin các loại đá
        </description>
 <%
     DataTable dtRssProduct = clsDatabase.getDataTable("select tbl_granit.*, tbl_category_news.C_Name as CatName from tbl_granit inner join tbl_category_news on tbl_granit.FK_CategoryID = tbl_category_news.PK_CategoryID where tbl_granit.FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 12 or FK_ParentID = 20 ) and tbl_granit.C_Active = 1 order by tbl_granit.C_Rank desc");
     for (int iRssProduct = 0; iRssProduct < dtRssProduct.Rows.Count; iRssProduct++)
     {
  %>
        <item>          
          <category><%= clsFunction.FormatForXML(dtRssProduct.Rows[iRssProduct]["CatName"].ToString())%></category>
          <link><%= clsConfig.GetHostUrl() %>/detail-Product/3/8/<%= clsFunction.FormatForXML(clsFunction.RemoveUnicode(dtRssProduct.Rows[iRssProduct]["C_Name"].ToString()))%>.aspx</link>
          <title><%= clsFunction.FormatForXML(dtRssProduct.Rows[iRssProduct]["C_Name"].ToString())%></title>
          <images><%= clsConfig.GetHostUrl() %>/<%= clsFunction.FormatForXML(dtRssProduct.Rows[iRssProduct]["C_Img"].ToString())%></images>
          <description>
             <%= clsFunction.FormatForXML(clsInput.decodeStr(dtRssProduct.Rows[iRssProduct]["C_Des"].ToString()))%>
          </description>                    
        </item>
 <% } %>
      </channel>
    </rss>