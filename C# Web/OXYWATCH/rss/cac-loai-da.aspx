<%@ Page Language="C#" AutoEventWireup="true" ContentType="text/xml" CodeFile="cac-loai-da.aspx.cs" Inherits="rss_cac_loai_da" %>
<%@Import Namespace = "System.Data" %>
    <rss version="2.0">
      <channel>
        <title>Da hoa cuong Hoang Long</title>
        <link>http://dahoacuonghoanglong.com</link>
        <description>
          Website hiển thị thông tin các loại đá
        </description>
 <%
     DataTable dtRssGranite = clsDatabase.getDataTable("select tbl_granit.*, tbl_category_news.C_Name as CatName from tbl_granit inner join tbl_category_news on tbl_granit.FK_CategoryID = tbl_category_news.PK_CategoryID where tbl_granit.FK_LangID = " + lang.getLangID() + " and (FK_ParentID = 13 or FK_ParentID = 21 ) and tbl_granit.C_Active = 1 order by tbl_granit.C_Rank desc");
     for (int iRssGranite = 0; iRssGranite < dtRssGranite.Rows.Count; iRssGranite++)
     {
  %>
        <item>          
          <category><%= clsFunction.FormatForXML(dtRssGranite.Rows[iRssGranite]["CatName"].ToString())%></category>
          <link><%= clsConfig.GetHostUrl() %>/detail-granite/3/<%= dtRssGranite.Rows[iRssGranite]["PK_GranitID"].ToString() %>/<%= clsFunction.FormatForXML(clsFunction.RemoveUnicode(dtRssGranite.Rows[iRssGranite]["C_Name"].ToString()))%>.aspx</link>
          <title><%= clsFunction.FormatForXML(dtRssGranite.Rows[iRssGranite]["C_Name"].ToString())%></title>
          <images><%= clsConfig.GetHostUrl() %>/<%= clsFunction.FormatForXML(dtRssGranite.Rows[iRssGranite]["C_Img"].ToString())%></images>
          <description>
             <%= clsFunction.FormatForXML(clsInput.decodeStr(dtRssGranite.Rows[iRssGranite]["C_Des"].ToString()))%>
          </description>                    
        </item>
 <% } %>
      </channel>
    </rss>