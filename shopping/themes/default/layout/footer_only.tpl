    	<!-- BEGIN: lt_ie9 --><p class="chromeframe">{LANG.chromeframe}</p><!-- END: lt_ie9 -->
        <div id="timeoutsess" class="chromeframe">
            {LANG.timeoutsess_nouser}, <a onclick="timeoutsesscancel();" href="#">{LANG.timeoutsess_click}</a>. {LANG.timeoutsess_timeout}: <span id="secField"> 60 </span> {LANG.sec}
        </div>
        <div id="openidResult" class="nv-alert" style="display:none"></div>
        <div id="openidBt" data-result="" data-redirect=""></div>
        <script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/bootstrap.min.js"></script>
		<script src="{NV_BASE_SITEURL}themes/default/js/jquery-1.9.1.min.js"></script> 
		<script src="{NV_BASE_SITEURL}themes/default/js/owl.carousel.js"></script>
		<script>
		$('#priceslider').owlCarousel({
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
		$('#priceslider-1').owlCarousel({
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
    $('#priceslider-2').owlCarousel({
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
    $('#priceslider-news').owlCarousel({
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
    //intro slider
	$('#introslider-1').owlCarousel({
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
			},
			1200:{
				items:4
			}
		}
	});
    </script>
    
	</body>
</html>