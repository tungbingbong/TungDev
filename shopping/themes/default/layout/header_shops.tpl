	<noscript>
		<div class="alert alert-danger">{LANG.nojs}</div>
	</noscript>
    <div class="body-bg">
	
		<header>
        <div class="trencungxemtrang">
        <div class="trencungxemtrangmo">
			<div class="container wraper ">
				<div id="header" class="row">
				    <div class="logo col-xs-24 col-sm-24 col-md-3">
                        <!-- BEGIN: image -->
                        <a title="{SITE_NAME}" href="{THEME_SITE_HREF}"><img src="{LOGO_SRC}" height="110" alt="{SITE_NAME}" /></a>
                        <!-- END: image -->
                        <!-- BEGIN: swf -->
                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="{LOGO_WIDTH}" height="{LOGO_HEIGHT}" >
                   	        <param name="wmode" value="transparent" />
                           	<param name="movie" value="{LOGO_SRC}" />
                           	<param name="quality" value="high" />
                           	<param name="menu" value="false" />
                           	<param name="seamlesstabbing" value="false" />
                           	<param name="allowscriptaccess" value="samedomain" />
                           	<param name="loop" value="true" />
                           	<!--[if !IE]> <-->
                           	<object type="application/x-shockwave-flash" width="{LOGO_WIDTH}" height="{LOGO_HEIGHT}" data="{LOGO_SRC}" >
                                <param name="wmode" value="transparent" />
                                <param name="pluginurl" value="http://www.adobe.com/go/getflashplayer" />
                                <param name="loop" value="true" />
                                <param name="quality" value="high" />
                                <param name="menu" value="false" />
                                <param name="seamlesstabbing" value="false" />
                                <param name="allowscriptaccess" value="samedomain" />
                       	    </object>
                            <!--> <![endif]-->
                        </object>
                        <!-- END: swf -->
                       
                    </div>
                    <div class="col-xs-24 col-sm-24 col-md-17">
					[MENU_SITE]
				     </div>
                     <div class="col-xs-24 col-sm-24 col-md-4">
                     <div id="site-header">
                     <div id="masthead">
                     <nav id="site-navigator" class="navigator">
                     <ul class="menu menu-extra">
	
			<li class="search-box">
			<a href="#"><i class="fa fa-search fa-lg"></i></a>
			<div class="submenu">
            <div class="widget widget_search">
            <div class="headerSearch">
                                <div class="input-group">
                                    <input type="text" class="form-control" maxlength="{NV_MAX_SEARCH_LENGTH}" placeholder="{LANG.search}..."><span class="input-group-btn"><button type="button" class="btn btn-info" data-url="{THEME_SEARCH_URL}" data-minlength="{NV_MIN_SEARCH_LENGTH}" data-click="y"><em class="fa fa-search fa-lg"></em></button></span>
                   </div>
                </div>
            </div></div>
		</li>
	</ul>
    <div class="social-links">
									<a  href="https://www.facebook.com/ONEinteriorVN/" target="_blank">
						<i class="fa fa-facebook"></i>
					</a>
							</div>
    </nav></div></div>
                     </div>
				</div>
                <div class="container wraper anthanhbreadcrumbs">
                <span  class="langtop"> Shops</span>
                                <!-- BEGIN: breadcrumbs -->
                                <div class="breadcrumbs-wrap">
                                	<div class="display">
                                		<a class="show-subs-breadcrumbs hidden" href="#" onclick="showSubBreadcrumbs(this, event);"><em class="fa fa-lg fa-angle-right"></em></a>
		                                <ul class="breadcrumbs list-none"></ul>
									</div>
									<ul class="subs-breadcrumbs"></ul>
	                                <ul class="temp-breadcrumbs hidden">
	                                    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{THEME_SITE_HREF}" itemprop="url" title="{LANG.Home}"><span itemprop="title">{LANG.Home}</span></a></li>
	                                    <!-- BEGIN: loop --><li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="{BREADCRUMBS.link}" itemprop="url" title="{BREADCRUMBS.title}"><span class="txt" itemprop="title">{BREADCRUMBS.title}</span></a></li><!-- END: loop -->
	                                </ul>
								</div>
                                <!-- END: breadcrumbs -->
                               
                            </div>
			</div>
            </div>
            </div>
		</header>
		
       <div class="wraper">
		<section>
			<div class="container" id="body">
               
                [THEME_ERROR_INFO]