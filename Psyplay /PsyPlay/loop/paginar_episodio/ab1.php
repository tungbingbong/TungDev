<?php 
// This is the first episode of the first season.
echo '<a class="btn bp-btn-next" href="'; bloginfo('url');
echo '/';
echo get_option('episodios-slug').'/';
echo sanitize_title(episodios_get_meta('serie')); 
echo '-season-';
echo episodios_get_meta('temporada');
echo '-episode-';
echo episodios_get_meta('episodio')+1;
echo '/">';
echo '<i class="fa fa-forward"></i>';
echo '<span></span></a>';
?>