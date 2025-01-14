<?php
/*
Template Name: Most Favorite Page
*/
define('WPAS_DEBUG', false); get_header();  

$ppp = get_option('archive_posts');
$args = array();
$args['wp_query'] = array('post_type'=>array('post','tvshows','episodes',), 'meta_key' => '_post_like_count', 'orderby' => 'meta_value_num',
'posts_per_page' => $ppp,
'order' => 'DESC',
'orderby' => 'date');

 $args['fields'][] = array( 'type' => 'post_type', 
'format' => 'radio', 
'label' => 'Search Type', 
'values' => array('post' => 'Movies', 'tvshows' => 'TV-Series'),
'default' => 'post'
);

$args['fields'][] = array('type' => 'taxonomy',
'label' => __( 'Quality', 'psythemes' ),
'taxonomy' => 'quality',
'format' => 'checkbox',
'operator' => 'IN');


$args['fields'][] = array('type' => 'taxonomy',
'label' => __( 'Genre', 'psythemes' ),
'taxonomy' => 'category',
'format' => 'checkbox',
'operator' => 'AND');

$args['fields'][] = array('type' => 'taxonomy',
'label' => __( 'Country', 'psythemes' ),
'taxonomy' => 'country',
'format' => 'checkbox',
'operator' => 'IN');

$args['fields'][] = array('type' => 'taxonomy',
'label' => __( 'Release Year', 'psythemes' ),
'taxonomy' => 'release-year',
'format' => 'radio',
'operator' => 'IN');

$args['fields'][] = array('type' => 'submit', 'value' => __('Filter results', 'psythemes'));
$my_search_object = new WP_Advanced_Search($args);
$temp_query = $wp_query;

$wp_query = $my_search_object->query();
?>
<div class="header-pad"></div>
<!-- main -->
<div id="main" class="page-category">
<div class="container">
<div class="pad"></div>
<div class="main-content main-category">
<?php if(get_option("notice_location") == "global" ){?>
<?php get_template_part('includes/aviso'); ?>
<?php }?>
<!--category-->
<div class="movies-list-wrap mlw-category">

<div class="ml-title ml-title-page">
<span><?php _e('Most Favorite', 'psythemes'); ?></span>
<div class="filter-toggle"><i class="fa fa-sort mr5"></i><?php _e('Filter', 'psythemes'); ?></div>
<div class="clearfix"></div>
</div>

<div id="filter">
<div class="filter-content row">
<div class="col-sm-2 fc-main">
<span class="fc-title"><?php _e('Sort by', 'psythemes'); ?></span>
<ul class="fc-main-list">
<li><a class="" href="<?php echo get_option('mov_archive'); ?>"><i class="fa fa-clock-o mr5"></i><?php _e('Latest', 'psythemes'); ?></a></li>
<li><a class="" href="<?php echo get_option('mviewed_archive'); ?>"><i class="fa fa-eye mr5"></i><?php _e('Most Viewed', 'psythemes'); ?></a></li>
<li><a class="active" href="<?php echo get_option('mfav_archive'); ?>"><i class="fa fa-heart mr5"></i><?php _e('Most Favorite', 'psythemes'); ?></a></li>
<li><a class="" href="<?php echo get_option('mrat_archive'); ?>"><i class="fa fa-star mr5"></i><?php _e('Most Rating', 'psythemes'); ?></a></li>
<li><a class="" href="<?php echo get_option('topimdb_archive'); ?>"><i class="fa fa-fire mr5"></i><?php _e('Top IMDb', 'psythemes'); ?></a></li>
</ul>
</div>
<div class="col-sm-10">
<?php $my_search_object->the_form(); ?>
<div class="clearfix"></div>
</div>
</div>
</div>
<?php $active = get_option('top-most-ad-1'); if ($active == "true") { ?>

            <div class="content-kuss" style="margin: 0;">
<?php if ($note = get_option('ads_mains_1_title')) { ?>
                <div id="content-kuss-title"> <span><?php echo $note; ?></span></div>
<?php }?>
				<?php if ($ads = get_option('ads_mains_1_code')) { ?><div class="content-kuss-ads"><?php echo stripslashes($ads); ?></div><?php }?>
            </div>
<?php }?>


<div id="pagination" style="margin: 0;">
<?php pagination($additional_loop->max_num_pages);?>                    
</div>

<div class="movies-list movies-list-full">
				<?php 
if ( have_posts() ): while ( have_posts() ): the_post(); ?>
<?php   if (has_post_thumbnail()) {
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
}
} ?>			
                 <?php include 'includes/home/item.php'; ?>          
            
    <?php endwhile; endif; ?>

<div class="clearfix"></div>
</div>
<?php pagination($additional_loop->max_num_pages);?>
</div>


<?php $active = get_option('top-most-ad-2'); if ($active == "true") { ?>

            <div class="content-kuss" style="margin: 0;">
<?php if ($note = get_option('ads_mains_2_title')) { ?>
                <div id="content-kuss-title"> <span><?php echo $note; ?></span></div>
<?php }?>
				<?php if ($ads = get_option('ads_mains_2_code')) { ?><div class="content-kuss-ads"><?php echo stripslashes($ads); ?></div><?php }?>
            </div>
<?php }?>

        </div>
    </div>
</div>
<!--/main -->
<?php  get_footer(); ?>