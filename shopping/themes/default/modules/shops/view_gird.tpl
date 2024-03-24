<!-- BEGIN: main -->
<div id="category">
    <div class="page-header">
        <h1>{CAT_NAME} ({count} {LANG.title_products})</h1>
        <!-- BEGIN: viewdescriptionhtml -->
		
        <div class="alert alert-info">
		<p><i class="fa fa-quote-left" aria-hidden="true"></i>&nbsp;&nbsp;{DESCRIPTIONHTML}&nbsp;&nbsp;<i class="fa fa-quote-right" aria-hidden="true"></i></p>
         </div>
		<!-- END: viewdescriptionhtml -->
        
    </div>
    <!-- BEGIN: displays -->
    <div class="form-group form-inline pull-right">
        <label class="control-label">{LANG.displays_product}</label>
        <select name="sort" id="sort" class="form-control input-sm" onchange="nv_chang_price();">
            <!-- BEGIN: sorts -->
                <option value="{key}" {se}> {value}</option>
            <!-- END: sorts -->
        </select>
        <label class="control-label">{LANG.title_viewnum}</label>
        <select name="viewtype" id="viewtype" class="form-control input-sm" onchange="nv_chang_viewtype();">
            <!-- BEGIN: viewtype -->
                <option value="{VIEWTYPE.key}" {VIEWTYPE.selected}> {VIEWTYPE.value}</option>
            <!-- END: viewtype -->
        </select>
    </div>
    <div class="clear">&nbsp;</div>
    <!-- END: displays -->
	<div class="panel-body rmv-padding">
	<!-- BEGIN: grid_rows -->
    <div class="col-sm-12 col-md-8 stack-product">
        <div class="thumbnail">
            <div style="height: {height}px">
                <a href="{link_pro}" title="{title_pro}"><img src="{img_pro}" alt="{title_pro}" <!-- BEGIN: tooltip_js -->data-content='{intro}' data-rel="tooltip" data-img="{img_pro}"<!-- END: tooltip_js -->class="img-thumbnail" style="max-height:{height}px;max-width:{width}px;"></a>
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
            <div class="text-center" style="margin-top:10px">
                <h3><a href="{link_pro}" title="{title_pro}">{title_pro0}</a></h3>

                <!-- BEGIN: product_code -->
                <p class="label label-default">{PRODUCT_CODE}</p>
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
                
                        
						<div class="caption text-center">
                <!-- BEGIN: contact -->
                <p class="price">
                    {LANG.detail_pro_price}: <span class="money">{LANG.price_contact}</span>
                </p>
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
								<a href="javascript:void(0)" title="S?n ph?m ua thích" ><button type="button" onclick="wishlist({ID}, this)" class="btn btn-icon btn-xs <!-- BEGIN: disabled -->disabled<!-- END: disabled -->"><i class="fa fa-heart"></i></button></a>
								<!-- END: wishlist -->
                                
					       </div>
            </div>
                
            </div>
        </div>
    </div>
	<!-- END: grid_rows -->
	</div>
	<div class="clearfix">
	</div>
	<div class="text-center">
		{pages}
	</div>
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

<div class="msgshow" id="msgshow">
</div>
<!-- END: main -->
