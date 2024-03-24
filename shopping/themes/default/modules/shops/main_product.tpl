<!-- BEGIN: main -->
<div id="products" class="clearfix">
    <!-- BEGIN: displays -->
    <div class="form-group form-inline pull-right lineshops" >
        <label class="control-label">{LANG.displays_product}</label>
        <select name="sort" id="sort" class="form-control input-sm" onchange="nv_chang_price();">
            <!-- BEGIN: sorts -->
                <option value="{key}" {se}> {value}</option>
            <!-- END: sorts -->
        </select>
    </div>
    <div class="clearfix">&nbsp;</div>
    <!-- END: displays -->

    <!-- BEGIN: items -->
    <div class="col-sm-12 col-md-{num}">
    <div class="grid">
    <a href="{LINK}" title="{TITLE}">
					<figure class="effect-zoe">
						<img src="{IMG_SRC}" alt="{TITLE}">
						<figcaption>
							<h2>{TITLE0}</h2>
							
                            <p class="description">Đọc tiếp</p>
						</figcaption>			
					</figure>
			
       </a>
            </div>
            </div>
    <!-- END: items -->
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

<!-- BEGIN: pages -->
<div class="text-center">
    {generate_page}
</div>
<!-- END: pages -->
<div class="msgshow" id="msgshow">&nbsp;</div>

<!-- END: main -->
