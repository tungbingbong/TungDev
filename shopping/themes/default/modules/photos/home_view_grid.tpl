<!-- BEGIN: main -->
<div id="photo-{OP}"> 
	<div class="row">
		<!-- BEGIN: grid_album -->
		<div class="box-item">
			<div class="row">
				<div class="panel-body">
				<!-- BEGIN: loop_album -->
					<div class="col-xs-24 col-sm-12 col-md-{PER_LINE} col-lg-{PER_LINE} album-album">
						<div class="panel">
							<div class="album-image panel-body pd5">
                            <div class="grid"><a title="{ALBUM.name}" href="{ALBUM.link}">
                            <figure class="effect-zoe">
								
									<img class="lazy img-responsive" data-original="{ALBUM.thumb}" data-src="{ALBUM.thumb}" src="{ALBUM.thumb}"/>
								
                                <figcaption>
                                <h2><a title="{ALBUM.name}" href="{ALBUM.link}">Khách hàng: <span>{ALBUM.name}</span></a></h2>
                                    
                                    <p class="description">{ALBUM.model}</p>
                               </figcaption>
                               </figure>
                               </a>
                               </div>
							</div>
                            
							
						</div>
					</div>
				<!-- END: loop_album -->
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- END: grid_album -->
		<!-- BEGIN: generate_page -->
		<div id="generate_page" class="text-center">
			{GENERATE_PAGE}
		</div>
		<!-- END: generate_page -->
	</div> 
</div>
<script type="text/javascript">
$(function() {
    $("img.lazy").lazyload({
	effect : "fadeIn"
	});
});
</script>
<script src="{NV_BASE_SITEURL}themes/default/modules/{MODULE_FILE}/plugins/lazy/jquery.lazyload.min.js" type="text/javascript" ></script>
<!-- END: main -->