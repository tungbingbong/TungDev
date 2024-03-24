<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_home.tpl"}
<div class="row">
	[HEADER]
</div>		
<div class="row">
	<div class="col-xs-24 col-sm-24 col-md-24 maunengia">       
        <div id="tabs" >
  <ul>
    <li><a href="#tabs-1"><i class="fa fa-bar-chart"></i><span class="vc_tta-title-text">Bảng giá</span></a></li>
    <li><a href="#tabs-2"><i class="fa fa fa-qrcode"></i><span class="vc_tta-title-text">Shop</span></a></li>
    <li><a href="#tabs-3"><i class="fa fa fa-newspaper-o"></i><span class="vc_tta-title-text">Bài viết</span></a></li>
    <li><a href="#tabs-4"><i class="fa fa-camera-retro"></i><span class="vc_tta-title-text">Video</span></a></li>
    <li><a href="#tabs-5"><i class="fa fa-users"></i><span class="vc_tta-title-text">Khách hàng Vip</span></a></li>
    <li><a href="#tabs-6"><i class="fa fa-optin-monster"></i><span class="vc_tta-title-text">Mẫu trang điểm</span></a></li>
  </ul>
  <div class="logo col-xs-24 col-sm-24 col-md-24">
  <div id="tabs-1">
   [BLOCK_GIA]
  </div>
  <div id="tabs-2">
   [BLOCK_SHOP]
  </div>
  <div id="tabs-3">
    [BLOCK_COLLEC]
  </div>
  <div id="tabs-4">
    [BLOCK_VIDEOS]
  </div>
  <div id="tabs-5">
    [BLOCK_KHACHHANG]
  </div>
  <div id="tabs-6">
    [BLOCK_TRANGDIEM]
  </div>
</div>
	</div>

</div></div>
<div class="container" id="body">
<div class="wraper">
<div class="row">
	[FOOTER]
</div>
{FILE "footer_home.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->