<?php 
if($this->registry->has('theme_options') == false) { 
	header("location: themeinstall/index.php"); 
	exit; 
} 

require_once( DIR_TEMPLATE.$this->config->get('config_template')."/lib/module.php" );
$modules = new Modules($this->registry);
?>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="<?php echo $lang; ?>" class="ie7 <?php if($this->theme_options->get( 'responsive_design' ) == '0') { echo 'no-'; } ?>responsive"> <![endif]-->  
<!--[if IE 8]> <html lang="<?php echo $lang; ?>" class="ie8 <?php if($this->theme_options->get( 'responsive_design' ) == '0') { echo 'no-'; } ?>responsive"> <![endif]-->  
<!--[if IE 9]> <html lang="<?php echo $lang; ?>" class="ie9 <?php if($this->theme_options->get( 'responsive_design' ) == '0') { echo 'no-'; } ?>responsive"> <![endif]-->  
<!--[if !IE]><!--> <html lang="<?php echo $lang; ?>" class="<?php if($this->theme_options->get( 'responsive_design' ) == '0') { echo 'no-'; } ?>responsive"> <!--<![endif]-->  
<head>
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />

	<!-- Meta -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<?php if($this->theme_options->get( 'responsive_design' ) != '0') { ?>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<?php } ?>
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	
	<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	
	<link href="//fonts.googleapis.com/css?family=Goudy+Bookletter+1911" rel="stylesheet" type="text/css">
	
	<?php 
	if( $this->theme_options->get( 'font_status' ) == '1' ) {
		$lista_fontow = array();
		if( $this->theme_options->get( 'body_font' ) != '' && $this->theme_options->get( 'body_font' ) != 'standard' && $this->theme_options->get( 'body_font' ) != 'Arial' && $this->theme_options->get( 'body_font' ) != 'Georgia' && $this->theme_options->get( 'body_font' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'body_font' );
			$lista_fontow[$font] = $font;
		}
		
		if( $this->theme_options->get( 'categories_bar' ) != '' && $this->theme_options->get( 'categories_bar' ) != 'standard' && $this->theme_options->get( 'categories_bar' ) != 'Arial' && $this->theme_options->get( 'categories_bar' ) != 'Georgia' && $this->theme_options->get( 'categories_bar' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'categories_bar' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		if( $this->theme_options->get( 'headlines' ) != '' && $this->theme_options->get( 'headlines' ) != 'standard' && $this->theme_options->get( 'headlines' ) != 'Arial' && $this->theme_options->get( 'headlines' ) != 'Georgia' && $this->theme_options->get( 'headlines' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'headlines' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		if( $this->theme_options->get( 'footer_headlines' ) != '' && $this->theme_options->get( 'footer_headlines' ) != 'standard'  && $this->theme_options->get( 'footer_headlines' ) != 'Arial' && $this->theme_options->get( 'footer_headlines' ) != 'Georgia' && $this->theme_options->get( 'footer_headlines' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'footer_headlines' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		if( $this->theme_options->get( 'page_name' ) != '' && $this->theme_options->get( 'page_name' ) != 'standard' && $this->theme_options->get( 'page_name' ) != 'Arial' && $this->theme_options->get( 'page_name' ) != 'Georgia' && $this->theme_options->get( 'page_name' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'page_name' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		if( $this->theme_options->get( 'button_font' ) != '' && $this->theme_options->get( 'button_font' ) != 'standard' && $this->theme_options->get( 'button_font' ) != 'Arial' && $this->theme_options->get( 'button_font' ) != 'Georgia' && $this->theme_options->get( 'button_font' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'button_font' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		if( $this->theme_options->get( 'custom_price' ) != '' && $this->theme_options->get( 'custom_price' ) != 'standard' && $this->theme_options->get( 'custom_price' ) != 'Arial' && $this->theme_options->get( 'custom_price' ) != 'Georgia' && $this->theme_options->get( 'custom_price' ) != 'Times New Roman' ) {
			$font = $this->theme_options->get( 'custom_price' );
			if(!isset($lista_fontow[$font])) {
				$lista_fontow[$font] = $font;
			}
		}
		
		foreach($lista_fontow as $font) {
			echo '<link href="//fonts.googleapis.com/css?family=' . $font . ':700,600,500,400,300" rel="stylesheet" type="text/css">';
			echo "\n";
		}
	}
	?>
	
	<?php $lista_plikow = array(
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/bootstrap.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/bootstrap-theme.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/stylesheet.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/responsive.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/slider.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/camera_slider.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/blog.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/menu.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/filter_product.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/font-awesome.min.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/magnific-popup.css',
			'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/jquery-ui.css'
	); 
		
	if($this->theme_options->get( 'page_width' ) == 1) {
		$lista_plikow[] = 'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/wide-grid.css';
	} 
	
	if($this->theme_options->get( 'page_width' ) == 3) {
		$lista_plikow[] = 'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/standard-grid.css';
	} 
		
	if($this->theme_options->get( 'colors_status' ) == 1 || $this->theme_options->get( 'font_status' ) == 1) {
		$url = false;
		if($this->theme_options->get( 'colors_status' ) == 1) {
			$array = array(
					'body_font_text',
					'body_font_links',
					'body_font_links_hover',
					'body_price_text',
					'body_background_color',
					'top_bar_text',
					'top_bar_links',
					'top_text',
					'top_border_color',
					'top_cart_icon_background_gradient_top',
					'top_cart_icon_background_gradient_bottom',
					'top_cart_block_price',
					'menu_main_links',
					'menu_main_hover_links',
					'menu_background_gradient_top',
					'menu_background_gradient_bottom',
					'slider_bullets_background_color',
					'slider_bullet_active_background_color',
					'header_background_color',
					'sale_color_text',
					'sale_background_gradient_top',
					'sale_background_gradient_bottom',
					'ratings_background_gradient_top',
					'ratings_background_gradient_bottom',
					'ratings_active_background_gradient_top',
					'ratings_active_background_gradient_bottom',
					'buttons_color_text',
					'buttons_background_gradient_top',
					'buttons_background_gradient_bottom',
					'button_hover_color_text',
					'button_hover_background_gradient_top',
					'button_hover_background_gradient_bottom',
					'carousel_bullets_background_gradient_top',
					'carousel_bullets_background_gradient_bottom',
					'carousel_active_bullets_background_gradient_top',
					'carousel_active_bullets_background_gradient_bottom',
					'footer_color_text',
					'footer_color_bullets',
					'footer_color_heading',
					'footer_border_color',
					'footer_icons_color',
					'footer_background_color',
					'hover_product_border_color',
					'inputs_focus_border_color'
			);
				
			$i = 0;
			foreach($array as $color) {
				if($i != 0) {
					$url .= '&';
				} 
				$url .= $color.'='.str_replace(array('#', ' '), '', $this->theme_options->get( $color ));
				$i++;
			}
		} else {
			$url = 'color_status=0';
		}
		
		if( $this->theme_options->get( 'font_status' ) == '1' ) {
			$url .= '&font_status=1';
			if( $this->theme_options->get( 'body_font' ) != '' && $this->theme_options->get( 'body_font' ) != 'standard' ) {
				$url .= '&body_font=' . str_replace(" ", "+", $this->theme_options->get( 'body_font' ));
			}
			
			if( $this->theme_options->get( 'categories_bar' ) != '' && $this->theme_options->get( 'categories_bar' ) != 'standard' ) {
				$url .= '&categories_bar_font=' . str_replace(" ", "+", $this->theme_options->get( 'categories_bar' ));
			}
			
			if( $this->theme_options->get( 'headlines' ) != '' && $this->theme_options->get( 'headlines' ) != 'standard' ) {
				$url .= '&headlines_font=' . str_replace(" ", "+", $this->theme_options->get( 'headlines' ));
			}
			
			if( $this->theme_options->get( 'footer_headlines' ) != '' && $this->theme_options->get( 'footer_headlines' ) != 'standard' ) {
				$url .= '&footer_headlines_font=' . str_replace(" ", "+", $this->theme_options->get( 'footer_headlines' ));
			}
			
			if( $this->theme_options->get( 'page_name' ) != '' && $this->theme_options->get( 'page_name' ) != 'standard' ) {
				$url .= '&page_name_font=' . str_replace(" ", "+", $this->theme_options->get( 'page_name' ));
			}
			
			if( $this->theme_options->get( 'button_font' ) != '' && $this->theme_options->get( 'button_font' ) != 'standard' ) {
				$url .= '&button_font=' . str_replace(" ", "+", $this->theme_options->get( 'button_font' ));
			}
			
			if( $this->theme_options->get( 'custom_price' ) != '' && $this->theme_options->get( 'custom_price' ) != 'standard' ) {
				$url .= '&custom_price_font=' . str_replace(" ", "+", $this->theme_options->get( 'custom_price' ));
			}
			
			$url .= '&body_font_px=' . $this->theme_options->get( 'body_font_px' );
			$url .= '&body_font_weight=' . $this->theme_options->get( 'body_font_weight' );
			$url .= '&body_font_smaller_px=' . $this->theme_options->get( 'body_font_smaller_px' );
			$url .= '&categories_bar_weight=' . $this->theme_options->get( 'categories_bar_weight' );
			$url .= '&categories_bar_px=' . $this->theme_options->get( 'categories_bar_px' );
			$url .= '&headlines_weight=' . $this->theme_options->get( 'headlines_weight' );
			$url .= '&headlines_px=' . $this->theme_options->get( 'headlines_px' );
			$url .= '&footer_headlines_weight=' . $this->theme_options->get( 'footer_headlines_weight' );
			$url .= '&footer_headlines_px=' . $this->theme_options->get( 'footer_headlines_px' );
			$url .= '&page_name_weight=' . $this->theme_options->get( 'page_name_weight' );
			$url .= '&page_name_px=' . $this->theme_options->get( 'page_name_px' );
			$url .= '&button_font_weight=' . $this->theme_options->get( 'button_font_weight' );
			$url .= '&button_font_px=' . $this->theme_options->get( 'button_font_px' );
			$url .= '&custom_price_weight=' . $this->theme_options->get( 'custom_price_weight' );
			$url .= '&custom_price_px=' . $this->theme_options->get( 'custom_price_px' );
			$url .= '&custom_price_px_medium=' . $this->theme_options->get( 'custom_price_px_medium' );
			$url .= '&custom_price_px_small=' . $this->theme_options->get( 'custom_price_px_small' );
			$url .= '&custom_price_px_old_price=' . $this->theme_options->get( 'custom_price_px_old_price' );
		}
			
		$lista_plikow[] = 'catalog/view/theme/'.$this->config->get( 'config_template' ).'/css/custom_color.css.php?'.$url;
	} ?>
		
	<?php echo $this->theme_options->compressorCodeCss( $this->config->get( 'config_template' ), $lista_plikow, $this->theme_options->get( 'compressor_code_status' ), HTTP_SERVER ); ?>
	
	<?php if($this->theme_options->get( 'background_status' ) == 1) { ?>
	<style type="text/css">
		<?php if($this->theme_options->get( 'body_background_background' ) == '1') { ?> 
		body { background-image:none !important; }
		<?php } ?>
		<?php if($this->theme_options->get( 'body_background_background' ) == '2') { ?> 
		body { background-image:url(image/<?php echo $this->theme_options->get( 'body_background' ); ?>);background-position:<?php echo $this->theme_options->get( 'body_background_position' ); ?>;background-repeat:<?php echo $this->theme_options->get( 'body_background_repeat' ); ?> !important;background-attachment:<?php echo $this->theme_options->get( 'body_background_attachment' ); ?> !important; }
		<?php } ?>
		<?php if($this->theme_options->get( 'body_background_background' ) == '3') { ?> 
		body { background-image:url(image/subtle_patterns/<?php echo $this->theme_options->get( 'body_background_subtle_patterns' ); ?>);background-position:<?php echo $this->theme_options->get( 'body_background_position' ); ?>;background-repeat:<?php echo $this->theme_options->get( 'body_background_repeat' ); ?> !important;background-attachment:<?php echo $this->theme_options->get( 'body_background_attachment' ); ?> !important; }
		<?php } ?>
		
		<?php if($this->theme_options->get( 'header_background_background' ) == '1') { ?> 
		header { background-image:none !important; }
		<?php } ?>
		<?php if($this->theme_options->get( 'header_background_background' ) == '2') { ?> 
		header { background-image:url(image/<?php echo $this->theme_options->get( 'header_background' ); ?>);background-position:<?php echo $this->theme_options->get( 'header_background_position' ); ?>;background-repeat:<?php echo $this->theme_options->get( 'header_background_repeat' ); ?> !important;background-attachment:<?php echo $this->theme_options->get( 'header_background_attachment' ); ?> !important; }
		<?php } ?>
		<?php if($this->theme_options->get( 'header_background_background' ) == '3') { ?> 
		header { background-image:url(image/subtle_patterns/<?php echo $this->theme_options->get( 'header_background_subtle_patterns' ); ?>);background-position:<?php echo $this->theme_options->get( 'header_background_position' ); ?>;background-repeat:<?php echo $this->theme_options->get( 'header_background_repeat' ); ?> !important;background-attachment:<?php echo $this->theme_options->get( 'header_background_attachment' ); ?> !important; }
		<?php } ?>
	</style>
	<?php } ?>
	
	<?php if($this->theme_options->get( 'custom_code_css_status' ) == 1) { ?>
	<link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/skins/store_<?php echo $this->theme_options->get( 'store' ); ?>/<?php echo $this->theme_options->get( 'skin' ); ?>/css/custom_code.css">
	<?php } ?>
	
	<?php foreach ($styles as $style) { ?>
	<?php if($style['href'] == 'catalog/view/theme/default/stylesheet/slideshow.css') { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/css/slideshow.css" media="<?php echo $style['media']; ?>" />
	<?php } elseif($style['href'] == 'catalog/view/theme/default/stylesheet/carousel.css') { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/css/carousel.css" media="<?php echo $style['media']; ?>" />
	<?php } else { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<?php } ?>
	
	<?php if($this->theme_options->get( 'page_width' ) == 2 && $this->theme_options->get( 'max_width' ) > 900) { ?>
	<style type="text/css">
		.standard-body .full-width > div > div > .container {
			max-width: <?php echo $this->theme_options->get( 'max_width' ); ?>px;
			<?php if($this->theme_options->get( 'responsive_design' ) == '0') { ?>
			width: <?php echo $this->theme_options->get( 'max_width' ); ?>px;
			<?php } ?>
		}
		
		.standard-body .fixed .background,
		.main-fixed {
			max-width: <?php echo $this->theme_options->get( 'max_width' )-40; ?>px;
			<?php if($this->theme_options->get( 'responsive_design' ) == '0') { ?>
			width: <?php echo $this->theme_options->get( 'max_width' )-40; ?>px;
			<?php } ?>
		}
		
		<?php if($this->theme_options->get( 'responsive_design' ) == '0') { ?>
		body {
			min-width: <?php echo $this->theme_options->get( 'max_width' ); ?>px;
		}
		<?php } ?>
	</style>
	<?php } ?>
    
    <?php $lista_plikow = array(
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery-migrate-1.2.1.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery-ui.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/bootstrap.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/twitter-bootstrap-hover-dropdown.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.themepunch.plugins.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.themepunch.revolution.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/camera.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/products.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/common.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.cookie.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.magnific-popup.min.js',
    		'catalog/view/theme/'.$this->config->get( 'config_template' ).'/js/jquery.elevateZoom-3.0.3.min.js'
    ); ?>
    	
    <?php echo $this->theme_options->compressorCodeJs( $this->config->get( 'config_template' ), $lista_plikow, $this->theme_options->get( 'compressor_code_status' ), HTTP_SERVER ); ?>
	
	<script type="text/javascript">
	var transition = 'slide';
	var animation_time = 300;
	var checkout_text = '<?php if($this->theme_options->get( 'button_checkout', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'button_checkout', $this->config->get( 'config_language_id' ) ); } else { echo 'Finalizar compra'; } ?>';
	var continue_shopping_text = '<?php if($this->theme_options->get( 'button_shopping', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'button_shopping', $this->config->get( 'config_language_id' ) ); } else { echo 'Continuar comprando'; } ?>';
	var checkout_url = '<?php echo $checkout; ?>';
	var responsive_design = '<?php if($this->theme_options->get( 'responsive_design' ) == '0') { echo 'no'; } else { echo 'yes'; } ?>';
	</script>
	<?php foreach ($scripts as $script) { ?>
	<?php if($script == 'catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js') { ?>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/js/jquery.nivo.slider.pack.js"></script>
	<?php } else { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>
	<?php } ?>
	<?php if($this->theme_options->get( 'custom_code_javascript_status' ) == 1) { ?>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/skins/store_<?php echo $this->theme_options->get( 'store' ); ?>/<?php echo $this->theme_options->get( 'skin' ); ?>/js/custom_code.js"></script>
	<?php } ?>
	
	<?php if ($stores) { ?>
	<script type="text/javascript"><!--
	$(document).ready(function() {
	<?php foreach ($stores as $store) { ?>
	$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
	<?php } ?>
	});
	//--></script>
	<?php } ?>
	<?php echo $google_analytics; ?>    
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script src="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/js/respond.min.js"></script>
	<![endif]-->
</head>	
<body>
<div class="<?php if($this->theme_options->get( 'main_layout' ) == 2) { echo 'fixed-body'; } else { echo 'standard-body'; } ?>">
	<div id="main" class="<?php if($this->theme_options->get( 'main_layout' ) == 2) { echo 'main-fixed'; } ?>">
		<!-- HEADER
			================================================== -->
		<header>
			<div class="background-header"></div>
			<div class="slider-header">
				<!-- Top Bar -->
				<div id="top-bar" class="<?php if($this->theme_options->get( 'top_bar_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
					<div class="background-top-bar"></div>
					<div class="background">
						<div class="shadow"></div>
						<div class="pattern">
							<div class="container">
								<div class="row">
									<!-- Top Bar Left -->
									<div class="col-sm-6">
										<!-- Welcome text -->
										<div class="welcome-text">
											<?php if (!$logged) { ?>
											<?php echo $text_welcome; ?>
											<?php } else { ?>
											<?php echo $text_logged; ?>
											<?php } ?>
										</div>
									</div>
									
									<!-- Top Bar Right -->
									<div class="col-sm-6" id="top-bar-right">
										<?php echo $currency.$language; ?>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Top of pages -->
				<div id="top" class="<?php if($this->theme_options->get( 'header_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
					<div class="background-top"></div>
					<div class="background">
						<div class="shadow"></div>
						<div class="pattern">
							<div class="container">
								<div class="row">
									<!-- Header Left -->
									<div class="col-sm-3" id="header-left">
										<?php if ($logo) { ?>
										<!-- Logo -->
										<h1><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></h1>
										<?php } ?>
									</div>
									
									<!-- Header Center -->
									<div class="col-sm-5" id="header-center">
										<?php if($this->theme_options->get( 'internal_modules_top', $this->config->get( 'config_language_id' ), 'status' ) == 1) { 
											echo html_entity_decode($this->theme_options->get( 'internal_modules_top', $this->config->get( 'config_language_id' ), 'text' ));  
										} else { ?>									
											<!-- Search -->
											<div class="search_form">
												<div class="button-search"></div>
												<input type="text" class="input-block-level search-query" name="search" placeholder="<?php echo $text_search; ?>" id="search_query" value="<?php echo $search; ?>" />
												<div id="autocomplete-results" class="autocomplete-results"></div>
												
												<script type="text/javascript">
												$(document).ready(function() {
													$('#search_query').autocomplete({
														delay: 0,
														appendTo: "#autocomplete-results",
														source: function(request, response) {		
															$.ajax({
																url: 'index.php?route=search/autocomplete&filter_name=' +  encodeURIComponent(request.term),
																dataType: 'json',
																success: function(json) {
																	response($.map(json, function(item) {
																		return {
																			label: item.name,
																			value: item.product_id,
																			href: item.href,
																			thumb: item.thumb,
																			desc: item.desc,
																			price: item.price
																		}
																	}));
																}
															});
														},
														select: function(event, ui) {
															document.location.href = ui.item.href;
															
															return false;
														},
														focus: function(event, ui) {
													      	return false;
													   	},
													   	minLength: 2
													})
													.data( "ui-autocomplete" )._renderItem = function( ul, item ) {
													  return $( "<li>" )
													    .append( "<a><img src='" + item.thumb + "' alt=''>" + item.label + "<br><span class='description'>" + item.desc + "</span><br><span class='price'>" + item.price + "</span></a>" )
													    .appendTo( ul );
													};
												});
												</script>
											</div>
										<?php } ?>
									</div>
									
									<!-- Header Right -->
									<div class="col-sm-4" id="header-right">
										<?php echo $cart; ?>
									</div>
								</div>
							</div>
							
							<?php 
							$menu = $modules->getModules('menu');
							if( count($menu) ) {
								foreach ($menu as $module) {
									echo $module;
								}
							} elseif($categories) {
							?>
							<div class="container-megamenu horizontal">
								<div id="megaMenuToggle">
									<div class="megamenuToogle-wrapper">
										<div class="megamenuToogle-pattern">
											<div class="container">
												<div><span></span><span></span><span></span></div>
												Navigation
											</div>
										</div>
									</div>
								</div>
								
								<div class="megamenu-wrapper">
									<div class="megamenu-pattern">
										<div class="container">
											<ul class="megamenu">
												<?php foreach ($categories as $category) { ?>
												<?php if ($category['children']) { ?>
												<li class="with-sub-menu hover"><p class="close-menu"></p>
													<a href="<?php echo $category['href'];?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
												<?php } else { ?>
												<li>
													<a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
												<?php } ?>
													<?php if ($category['children']) { ?>
													<?php 
														$width = '100%';
														$row_fluid = 3;
														if($category['column'] == 1) { $width = '220px'; $row_fluid = 12; }
														if($category['column'] == 2) { $width = '500px'; $row_fluid = 6; }
														if($category['column'] == 3) { $width = '700px'; $row_fluid = 4; }
													?>
													<div class="sub-menu" style="width: <?php echo $width; ?>">
														<div class="content">
															<div class="row hover-menu">
																<?php for ($i = 0; $i < count($category['children']);) { ?>
																<div class="col-sm-<?php echo $row_fluid; ?>">
																	<div class="menu">
																		<ul>
																		  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
																		  <?php for (; $i < $j; $i++) { ?>
																		  <?php if (isset($category['children'][$i])) { ?>
																		  <li><a href="<?php echo $category['children'][$i]['href']; ?>" onclick="window.location = '<?php echo $category['children'][$i]['href']; ?>';"><?php echo $category['children'][$i]['name']; ?></a></li>
																		  <?php } ?>
																		  <?php } ?>
																		</ul>
																	</div>
																</div>
																<?php } ?>
															</div>
														</div>
													</div>
													<?php } ?>
												</li>
												<?php } ?>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<?php
							}
							?>
						</div>
					</div>
				</div>
			</div>
			
			<?php $slideshow = $modules->getModules('slideshow'); ?>
			<?php  if(count($slideshow)) { ?>
			<!-- Slider -->
			<div id="slider" class="<?php if($this->theme_options->get( 'slideshow_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
				<div class="background-slider"></div>
				<div class="background">
					<div class="shadow"></div>
					<div class="pattern">
						<?php foreach($slideshow as $module) { ?>
						<?php echo $module; ?>
						<?php } ?>
					</div>
				</div>
			</div>
			<?php } ?>
		</header>
		
		<?php if ($error) { ?>
		 <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
		<?php } ?>
