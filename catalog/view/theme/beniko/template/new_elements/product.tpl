<!-- Product -->
<div class="product clearfix">
	<div class="left">
		<?php if ($product['thumb']) { ?>
		<?php if($product['special'] && $this->theme_options->get( 'display_text_sale' ) != '0') { ?>
			<?php $text_sale = 'Sale';
			if($this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) ) != '') {
				$text_sale = $this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) );
			} ?>
			<?php if($this->theme_options->get( 'type_sale' ) == '1') { ?>
			<?php $product_detail = $this->theme_options->getDataProduct( $product['product_id'] );
			$roznica_ceny = $product_detail['price']-$product_detail['special'];
			$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
			<div class="sale">-<?php echo round($procent); ?>%</div>
			<?php } else { ?>
			<div class="sale"><?php echo $text_sale; ?></div>
			<?php } ?>
		<?php } ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
		<?php } else { ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a></div>
		<?php } ?>
	</div>
	<div class="right">
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<div class="price">
			<?php if (!$product['special']) { ?>
			<?php echo $product['price']; ?>
			<?php } else { ?>
			<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
			<?php } ?>
		</div>
		<?php if ($product['rating'] && $this->theme_options->get( 'display_rating' ) != '0') { ?>
		<div class="rating"><i class="icon-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
		<?php } ?>
		<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0' || $this->theme_options->get( 'display_add_to_wishlist' ) != '0' || $this->theme_options->get( 'display_add_to_cart' ) != '0') { ?>
		<div class="only-hover">
			<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0' || $this->theme_options->get( 'display_add_to_wishlist' ) != '0') { ?>
			<ul>
				<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0') { ?>
				<li><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span>+</span> <?php if($this->theme_options->get( 'add_to_compare_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_compare_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?></a></li>
				<?php } ?>
				<?php if($this->theme_options->get( 'display_add_to_wishlist' ) != '0') { ?>
				<li><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span>+</span> <?php if($this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?></a></li>
				<?php } ?>
			</ul>
			<?php } ?>
			<?php if($this->theme_options->get( 'display_add_to_cart' ) != '0') { ?>
			<div class="line-button-cart"></div>
			<div class="button-cart">
				<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>