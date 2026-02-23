<?php
/**
 * Template Name: Geometry OS Map (Full Screen)
 *
 * Full-screen immersive map template.
 * No header, footer, or sidebars - just the map.
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo('charset'); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo esc_html(get_the_title()); ?> - <?php echo esc_html(get_bloginfo('name')); ?></title>

	<style>
		/* Reset and full viewport */
		html, body {
			margin: 0;
			padding: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
			background: #0a0a1a;
		}

		/* Hide admin bar */
		#wpadminbar {
			display: none !important;
		}

		/* Ensure map container fills viewport */
		.geometry-os-map-fullscreen {
			position: fixed;
			top: 0;
			left: 0;
			width: 100vw;
			height: 100vh;
			z-index: 1;
		}
	</style>

	<?php wp_head(); ?>
</head>
<body <?php body_class('geometry-os-map-fullscreen-body'); ?>>
	<?php
	// Get theme/mode from post meta if set
	$theme = get_post_meta(get_the_ID(), 'geometry_os_map_theme', true);
	$mode = get_post_meta(get_the_ID(), 'geometry_os_map_mode', true);

	// Build attributes for the map container
	$atts = [
		'fullscreen' => 'true',
		'width'      => '100vw',
		'height'     => '100vh',
	];

	if (!empty($mode)) {
		$atts['mode'] = esc_attr($mode);
	}

	// Render the map container
	echo Geometry_OS_Map_Core::get_instance()->render_container($atts);
	?>

	<?php wp_footer(); ?>
</body>
</html>
