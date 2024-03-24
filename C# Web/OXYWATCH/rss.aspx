<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rss.aspx.cs" Inherits="rss" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HOANGLONGCO</title>
<link href="<%= clsConfig.GetHostUrl() %>/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%= clsConfig.GetHostUrl() %>/js/dropdowncontent.js"></script>
</head>
<body>
<div class="site">
  <div class="container">
    <!-- begin menu -->
   <asp:PlaceHolder ID="inc_header" runat="server"></asp:PlaceHolder>
    <!-- end menu -->
    <div class="midle">
    <div class="guide">
       	  <a href="<%= clsConfig.GetHostUrl() %>/Default.aspx" class="norB"><%= lang.setLangValue("Home", "Trang chủ")%> &raquo;</a> <a href="#">RSS</a></div>
          <div class="sitemap">
          		<h2><%= lang.setLangValue("What is RSS?", "RSS là gì?")%></h2>

<p><%= lang.setLangValue("When the number of news websites and more, the Web browser to find the information you need more and take longer. Is it better if the information and the latest data is sent directly to you, instead you have to track information from this site to other sites? Now, you can use this utility via a service called RSS information. </ P>There are many opinions surrounding the issue explained the acronym RSS means. However, most agree that this is an acronym for Really Simple Syndication-information service is simple. In short, this service allows you to find information of interest and sign up to be sent directly to the information. This service helps you solve the problem of updating of information by providing you with the latest information that you are interested. </ P>There currently are not any sites also offer RSS, but this service will become popular. Many news sites like BBC, CNN, and New York Times are providing RSS.", "Khi số lượng website tin tức ngày càng nhiều, việc duyệt Web để tìm những thông tin bạn cần ngày càng mất nhiều thời gian. Liệu có tốt hơn không nếu các thông tin và dữ liệu mới nhất được gửi trực tiếp đến bạn, thay vì bạn phải tự dò tìm thông tin từ trang web này đến trang web khác? Giờ đây, bạn đã có thể sử dụng tiện ích này thông qua một dịch vụ cung cấp thông tin mới gọi là RSS.</p><p>Có nhiều ý kiến xung quanh vấn đề giải thích từ viết tắt RSS có nghĩa gì. Tuy nhiên đa số đồng ý rằng đây là từ viết tắt của Really Simple Syndication- Dịch vụ cung cấp thông tin cực kì đơn giản. Nói ngắn gọn, dịch vụ này cho phép bạn tìm kiếm thông tin cần quan tâm và đăng ký để được gửi thông tin đến trực tiếp. Dịch vụ này giúp bạn giải quyết vấn đề về tính cập nhật của thông tin bằng việc cung cấp cho bạn những thông tin mới nhất mà bạn đang quan tâm.</p><p>Hiện tại không phải bất cứ trang web nào cũng cung cấp RSS, nhưng dịch vụ này sẽ dần trở nên phổ biến. Nhiều trang web tin tức như BBC, CNN, và New York Times đang cung cấp RSS.")%></p>
                <div class="listfeed">
           	   <a href="<%= clsConfig.GetHostUrl() %>/rss/home.aspx"> <img src="<%= clsConfig.GetHostUrl() %>/images/OsFeed.gif" width="18" height="18" class="imgfloat"/> <%= lang.setLangValue("Home", "Trang chủ")%> -  http://www.dahoacuonghoanglong.com/rss/home.htm</a>
                <a href="<%= clsConfig.GetHostUrl() %>/rss/nha-xuong.aspx"> <img src="<%= clsConfig.GetHostUrl() %>/images/OsFeed.gif" width="18" height="18" class="imgfloat"/> <%= lang.setLangValue("Factory", "Nhà xưởng")%> -  http://www.dahoacuonghoanglong.com/rss/nha-xuong.htm</a>
                 <a href="<%= clsConfig.GetHostUrl() %>/rss/cong-trinh.aspx"> <img src="<%= clsConfig.GetHostUrl() %>/images/OsFeed.gif" width="18" height="18" class="imgfloat"/> <%= lang.setLangValue("Works", "Công trình")%> -  http://www.dahoacuonghoanglong.com/rss/cong-trinh.htm</a>
                  <a href="<%= clsConfig.GetHostUrl() %>/rss/cac-loai-da.aspx"> <img src="<%= clsConfig.GetHostUrl() %>/images/OsFeed.gif" width="18" height="18" class="imgfloat"/> <%= lang.setLangValue("Rocks", "Các loại đá")%> -  http://www.dahoacuonghoanglong.com/rss/cac-loai-da.htm</a>
                   <a href="<%= clsConfig.GetHostUrl() %>/rss/san-pham.aspx"> <img src="<%= clsConfig.GetHostUrl() %>/images/OsFeed.gif" width="18" height="18" class="imgfloat"/> <%= lang.setLangValue("Product", "Sản phẩm")%> -  http://www.dahoacuonghoanglong.com/rss/san-pham.htm</a>
                   </div>
              <p class="norB">     <%= lang.setLangValue("How do I start using RSS directories?", "Làm cách nào để bắt đầu sử dụng các danh mục tin RSS?")%></p>

<p><%= lang.setLangValue("In general, the first thing you need is something called news reader (news reader). There are many types of news reader, some are embedded directly in the browser, some applications can be downloaded from the Internet. All these tools will enable you to view information and registration information using a list of RSS.", "Nhìn chung, đầu tiên bạn cần có một thứ gọi là trình đọc tin (news reader). Có rất nhiều kiểu trình đọc tin, một số được nhúng trực tiếp trong trình duyệt, một số là các ứng dụng có thể tải về từ Internet. Tất cả những công cụ này sẽ giúp bạn có thể xem được thông tin và đăng kí sử dụng danh mục tin của RSS.")%></p>
<p>
<%= lang.setLangValue("After you have chosen a news reader, all you have to do is select the contents of the information you need. For example, you need the latest information about information technology, you can use the orange RSS button of the Life section. Can drag / drop this button into your news reader, or cut / paste the url into the add list function of the message read", "Sau khi bạn đã chọn được một trình đọc tin, tất cả những gì bạn phải làm là lựa chọn nội dung thông tin mà bạn cần. Ví dụ như bạn cần thông tin mới nhất về công nghệ thông tin, bạn có thể sử dụng nút RSS màu cam của mục Đời sống. Có thể kéo/thả nút này vào trong trình đọc tin của bạn, hoặc cắt/dán Url vào chức năng thêm danh mục tin của trình đọc tin")%></p>
</p>
<%= lang.setLangValue("Some browsers, including Firefox, Opera and Safari, have functionality automatically select your desktop to your list. If you need more specific information, you can view information on the homepage of the browser.", "Một số trình duyệt, trong đó có Firefox, Opera và Safari, có chức năng tự động chọn danh mục tin RSS cho bạn. Nếu cần biết thông tin cụ thể hơn, bạn có thể xem thông tin trên các trang chủ của các trình duyệt đó.")%></p>
</p>
<%= lang.setLangValue("There are many different types of news reader and the version is updated regularly. Each news reader requires a different operating system, so you should consider when choosing which news reader.", "Có rất nhiều loại trình đọc tin khác nhau và các phiên bản được thường xuyên cập nhật. Mỗi loại trình đọc tin lại đòi hỏi một hệ điều hành khác nhau, do đó bạn phải cân nhắc về điều đó khi lựa chọn trình đọc tin.")%></p>
<p class="norB">
<%= lang.setLangValue("The limited use", "Các giới hạn sử dụng")%></p>
<p>
<%= lang.setLangValue("The source channel information is provided free for personal and non-profit organizations. We ask that you provide clear information needed when you use this channel resources from Zing. Zing may ask you to stop providing information and distributed this form at any time and for any reason.", "Các nguồn kênh tin được cung cấp miễn phí cho các cá nhân và các tổ chức phi lợi nhuận. Chúng tôi yêu cầu bạn cung cấp rõ các thông tin cần thiết khi bạn sử dụng các nguồn kênh tin này từ Zing. Zing có quyền yêu cầu bạn ngừng cung cấp và phân tán thông tin dưới dạng này ở bất kỳ thời điểm nào và với bất kỳ lý do nào.")%></p>
<p class="norB">
<%= lang.setLangValue("RSS reader", "Phần mềm đọc RSS")%></p>

<%= lang.setLangValue("You can use RSS reader to read quickly Newz Crawler RSS document", "Bạn có thể sử dụng chương trình đọc RSS Newz Crawler để đọc nhanh tài liệu RSS")%>
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

