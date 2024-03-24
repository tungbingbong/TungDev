<!-- BEGIN: main -->
<div id="category">
	<!-- BEGIN: catalogs -->
	<div class="panel panel-default-shop wow bounceInDown">
    
		<div class="block_defalt">
			<h3><span class="pull-left" href="{LINK_CATALOG}" title="{TITLE_CATALOG}"><p style ="color:#fff"><i class="fa fa-shopping-bag" aria-hidden="true"></i>&nbsp;{TITLE_CATALOG}</span></h3>       
			   
            
		</div>
        <div class="clear"></div>
        <div class="row banner">	
			<div class="col-md-8 stack-product">
                <!-- BEGIN: image -->
				<a class="pull-banner" href="{LINK_CATALOG}" title="{TITLE_CATALOG}"><img src="{IMAGE}" alt="{TITLE_CATALOG}" class="img-responsive-banner" /></a>
				<!-- END: image -->
                
                
			</div>
        <div class="col-md-16 wow bounceInDown">
		<div class="panel-banner">
			<!-- BEGIN: items -->
            <div class="col-sm-24 col-md-6 stack-product">
                <div class="thumbnail">
                    <div style="height: {height}px">
                        <a href="{LINK}" title="{TITLE}"><img src="{IMG_SRC}" alt="{TITLE}" <!-- BEGIN: tooltip_js -->data-content='{hometext}' data-rel="tooltip" data-img="{IMG_SRC}"<!-- END: tooltip_js -->class="img-thumbnail" style="height:{height}px;width:{width}px;"></a>
                    </div>
		            <div class="info_pro">
		            	<!-- BEGIN: new -->
		            	<span class="label label-success newday">{LANG.newday}</span>
		            	<!-- END: new -->
		            	<!-- BEGIN: discounts -->
		            	<span class="label label-danger">-{PRICE.discount_percent}{PRICE.discount_unit}</span>
		            	<!-- END: discounts -->
		            	<!-- BEGIN: point -->
		            	<span class="label label-info" title="{point_note}">+{point}</span>
		            	<!-- END: point -->
		            	<!-- BEGIN: gift -->
		            	<span class="label label-success">+<em class="fa fa-gift fa-lg">&nbsp;</em></span>
		            	<!-- END: gift -->
		            </div>
					<div class="text-center">
    					<h3><a href="{LINK}" title="{TITLE}">{TITLE0}</a></h3>
                            
                        <!-- BEGIN: product_code -->
                        
                        <div class="label label-default">{PRODUCT_CODE}</div>
                        
                        <!-- END: product_code -->
                       
                        <!-- BEGIN: adminlink -->
                        <p>{ADMINLINK}</p>
                        <!-- END: adminlink -->

						<!-- BEGIN: price -->
						<p class="price">
		                    <!-- BEGIN: discounts -->
		                    <span class="money">{PRICE.sale_format} {PRICE.unit}</span>
		                    <span class="discounts_money">{PRICE.price_format} {PRICE.unit}</span>
		                    <!-- END: discounts -->

							<!-- BEGIN: no_discounts -->
							<span class="money">{PRICE.price_format} {PRICE.unit}</span>
							<!-- END: no_discounts -->
						</p>
						<!-- END: price -->
                        </div>
                        
						<div class="caption text-center">
		                <!-- BEGIN: contact -->
		                <p class="price">{LANG.detail_pro_price}: <span class="money">{LANG.price_contact}</span></p>
		                <!-- END: contact -->

                        <!-- BEGIN: compare -->
                        <p><input type="checkbox" value="{ID}"{ch} onclick="nv_compare({ID});" id="compare_{ID}"/><a href="#" onclick="nv_compare_click();" >&nbsp;{LANG.compare}</a></p>
                        <!-- END: compare -->

                        <div class="clearfix">
                            <!-- BEGIN: order -->
								<a href="javascript:void(0)" id="{ID}" title="{LANG.add_product}" onclick="cartorder(this, {GROUP_REQUIE}, '{LINK}')"><button type="button" class="btn btn-icon btn-xs"><i class="fa fa-shopping-cart"></i></button></a>
								<!-- END: order -->

								<!-- BEGIN: product_empty -->
								<button class="btn btn-danger disabled btn-xs">{LANG.product_empty}</button>
								<!-- END: product_empty -->

								<!-- BEGIN: wishlist -->
								<a href="javascript:void(0)" title="Sản phẩm ưa thích" ><button type="button" onclick="wishlist({ID}, this)" class="btn btn-icon btn-xs <!-- BEGIN: disabled -->disabled<!-- END: disabled -->"><i class="fa fa-heart"></i></button></a>
								<!-- END: wishlist -->
                                
					       
                        </div>
					</div>
				</div>
			</div>
			<!-- END: items -->            
		</div>
        </div>
        </div>
        <div class="text-center xemtatca_bnt">
			<a href="{LINK_CATALOG}" title="{TITLE_CATALOG}"><span><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;Xem các sản phẩm khác <i class="fa fa-caret-right"></i></span></a>
		</div>
	</div>
	
	<!-- END: catalogs -->
</div>

<!-- BEGIN: modal_loaded -->
<div class="modal fade" id="idmodals" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">{LANG.add_product}</h4>
			</div>
			<div class="modal-body">
				<em class="fa fa-spinner fa-spin">&nbsp;</em>
			</div>
		</div>
	</div>
</div>
<!-- END: modal_loaded -->

<div class="msgshow" id="msgshow">&nbsp;</div>
<!-- END: main -->
