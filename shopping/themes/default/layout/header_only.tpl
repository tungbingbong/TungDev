<!DOCTYPE html>
	<html lang="{LANG.Content_Language}" xmlns="http://www.w3.org/1999/xhtml" prefix="og: http://ogp.me/ns#">
	<head>
		<title>{THEME_PAGE_TITLE}</title>
		<!-- BEGIN: metatags --><meta {THEME_META_TAGS.name}="{THEME_META_TAGS.value}" content="{THEME_META_TAGS.content}">
		<!-- END: metatags -->
		<link rel="shortcut icon" href="{SITE_FAVICON}">
		<!-- BEGIN: links -->
		<link<!-- BEGIN: attr --> {LINKS.key}="{LINKS.value}"<!-- END: attr -->>
        <link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/components.css" rel="stylesheet">
         <link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/style1.css" rel="stylesheet">
          <link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/set1.css" rel="stylesheet">
          
           <link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/jquery-ui.css">
        
        <link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/animate.css" rel="stylesheet">
    	<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.carousel.css" rel="stylesheet">
  		<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/owl.theme.css" rel="stylesheet">
		<!-- END: links -->
		<!-- BEGIN: js -->
		<script<!-- BEGIN: ext --> src="{JS_SRC}"<!-- END: ext -->><!-- BEGIN: int -->{JS_CONTENT}<!-- END: int --></script>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/theme.js"></script>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/components.js"></script>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jquery-ui.js"></script>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jquery-1.12.4.js"></script>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/jquery-1.9.1.min.js"></script> 
		<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/owl.carousel.js"></script>
		 <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/wow.js"></script>
           <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/wow.min.js"></script>
           <script>
 		new WOW().init();
        </script>
        
        <script type="text/javascript">
/* <![CDATA[ */
var _themeConfig = {"stickyHeader":"","responsiveMenu":"1","blogLayout":null,"pagingStyle":"numeric","pagingContainer":"#main-content > .main-content-wrap > .content-inner","pagingNavigator":".navigation.paging-navigation.loadmore"};
/* ]]> */
</script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
  <script>
  $('#introslider').owlCarousel({
		margin:15,
		loop:true,
		responsiveClass:true,
		nav:true,
		dots:false,
		autoplay:false,
		autoHeight:false,
		autoplayTimeout:4000,
		autoplayHoverPause:true,
		responsive:{
			0:{
				items:1
			},
			534:{
				items:2
			},
			992:{
				items:3
			}
		}
	});
	
  </script>
		<!-- END: js -->
	</head>
    
	<body>
   <div id="preloader">
  <div id="status">&nbsp;</div>
</div>