<?php get_header(); ?>
<div class="box">
<div class="header">

<div class="buscador">
<form method="get" id="searchform" action="<?php bloginfo('url'); ?>">
<div class="imputo">
<input class="buscar" TYPE="text" placeholder="<?php _e('Search..', 'mundothemes'); ?>" name="s" id="s">
</div>
</form>
</div>
</div>
<div class="box_item">
<div class="peliculas">
<div id="revel2" class="skl">
<?php slk(); ?>
</div>
<h1><?php single_cat_title(); ?></h1>
<?php if ($dato = category_description( $category_id )){ ?> 
<?php } ?>
<?php $activar_ads = get_option('activar-anuncio-728-90'); if ($activar_ads == "true") { ?>
<div class="ads_728">
<?php $ads = get_option('anuncio-728-90'); if (!empty($ads)) echo stripslashes(get_option('anuncio-728-90')); ?>
</div>
<?php } ?>
<div class="<?php $dato = get_option('item_category'); echo stripslashes ($dato); ?> items">
<?php  if (have_posts()) : ?>
<?php post_movies_true(); ?>
<?php while (have_posts()) : the_post(); 
if(get_option('edd_sample_theme_license_key')) {
?>
<?php  if (has_post_thumbnail()) {
$imgsrc = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID),'medium');
$imgsrc = $imgsrc[0];
} elseif ($postimages = get_children("post_parent=$post->ID&post_type=attachment&post_mime_type=image&numberposts=0")) {
foreach($postimages as $postimage) {
$imgsrc = wp_get_attachment_image_src($postimage->ID, 'medium');
$imgsrc = $imgsrc[0];
}
} elseif (preg_match('/<img [^>]*src=["|\']([^"|\']+)/i', get_the_content(), $match) != FALSE) {
$imgsrc = $match[1];
} else {
if($img = get_post_custom_values($imagefix)){
$imgsrc = $img[0];
} else {
$img = get_template_directory_uri().'/images/noimg.png';
$imgsrc = $img;
} 
} ?>

<?php 
if($item = get_option('item_category')) {
include 'includes/home/'.$item.'.php'; 
} else {
include 'includes/home/item_1.php';
}
?>
<?php } endwhile; ?>						
<?php else : ?>
<div class="no_contenido_home"><?php _e('No content available', 'mundothemes'); ?></div>
<?php endif; ?>
<?php $activar_ads = get_option('activar-scroll'); if ($activar_ads == "true") { ?>
<div class="nav-previous alignleft"><?php next_posts_link( '' ); ?></div>
<div class="nav-next alignright"><?php previous_posts_link( '' ); ?></div>
<?php } ?>
<?php $activar_ads = get_option('activar-scroll'); if ($activar_ads == "true") {  } else { ?>
<div id="paginador">
<?php pagination($additional_loop->max_num_pages);?>
</div>
<div class="respo_pag">
<div class="pag_a"><?php previous_posts_link( __('Previous','mundothemes') ); ?></div>
<div class="pag_b"><?php next_posts_link( __('Next','mundothemes') ); ?></div>
</div>
<?php } ?>
</div>
</div>
<div class="lateral">
<?php $active = get_option('widget_cat'); if ($active == "true") {  dynamic_sidebar( 'Category' );  } else { ?>
<div id="fixer">
<?php get_template_part('loop/sidebar-home'); ?>
</div>
<?php } ?>
</div>
</div>
</div>
<!-- Contenido -->
<?php  get_footer(); ?>