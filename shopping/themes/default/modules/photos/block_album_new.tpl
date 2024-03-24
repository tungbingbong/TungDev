<!-- BEGIN: main -->
<div id="{BLOCK_ID}"> 


		<div class="box-item">
			
				<div class="panel-body" style="background:#fff;padding: 10px;">
				<!-- BEGIN: loop_album -->
					<div class="col-xs-24 col-sm-12 col-md-6 col-lg-6 album-album">
						<div class="panel">
							<div class="album-image pd5">
                            <div class="grid">
                            <a title="{ALBUM.name}" href="{ALBUM.link}">
                            <figure class="effect-zoe gioihandolon">
								
									<img class="lazy img-responsive" data-original="{ALBUM.thumb}" data-src="{ALBUM.thumb}" src="{ALBUM.thumb}"/>
								
                                <figcaption class="hieuungtrangchu">
                                <h2><a title="{ALBUM.name}" href="{ALBUM.link}">{ALBUM.name}</a></h2>
                                    
                                   
                               </figcaption>
                             
                               </figure>
                                 </a>
                               </div>
							</div>
                            
							
						</div>
					</div>
				<!-- END: loop_album -->
				
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
$(function() {
    $("img.lazy").lazyload({
	effect : "fadeIn"
	});
});
</script>
<script src="{NV_BASE_SITEURL}themes/default/modules/photos/plugins/lazy/jquery.lazyload.min.js" type="text/javascript" ></script>
<!-- END: main -->