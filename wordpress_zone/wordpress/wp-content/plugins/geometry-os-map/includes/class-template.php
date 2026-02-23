<?php
/**
 * Template class for Geometry OS Map plugin
 *
 * Provides full-screen page template for immersive map view.
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;

/**
 * Template class for full-screen map template
 */
class Geometry_OS_Map_Template {

	/**
	 * Template file name
	 *
	 * @var string
	 */
	const TEMPLATE_NAME = 'geometry-os-map-full.php';

	/**
	 * Template label shown in dropdown
	 *
	 * @var string
	 */
	const TEMPLATE_LABEL = 'Geometry OS Map (Full Screen)';

	/**
	 * Constructor - register hooks
	 */
	public function __construct() {
		// Add template to page attributes dropdown
		add_filter('theme_page_templates', [$this, 'add_template_to_dropdown']);

		// Intercept template loading
		add_filter('template_include', [$this, 'load_template']);

		// Enqueue modules when template is loaded
		add_action('wp_enqueue_scripts', [$this, 'maybe_enqueue_modules']);
	}

	/**
	 * Add template to the page template dropdown
	 *
	 * @param array $templates Existing templates
	 * @return array Modified templates
	 */
	public function add_template_to_dropdown($templates) {
		$templates[self::TEMPLATE_NAME] = self::TEMPLATE_LABEL;
		return $templates;
	}

	/**
	 * Load custom template when our template is selected
	 *
	 * @param string $template Path to template file
	 * @return string Modified template path
	 */
	public function load_template($template) {
		// Get current post
		$post = get_post();

		if (!$post) {
			return $template;
		}

		// Check if this page has our template assigned
		$page_template = get_post_meta($post->ID, '_wp_page_template', true);

		if ($page_template !== self::TEMPLATE_NAME) {
			return $template;
		}

		// Return our custom template
		$custom_template = GEOMETRY_OS_MAP_PATH . 'templates/full-map-template.php';

		if (file_exists($custom_template)) {
			return $custom_template;
		}

		return $template;
	}

	/**
	 * Enqueue modules if the current page uses our template
	 *
	 * @return void
	 */
	public function maybe_enqueue_modules() {
		// Only check on pages
		if (!is_page()) {
			return;
		}

		$post = get_post();

		if (!$post) {
			return;
		}

		// Check if this page has our template assigned
		$page_template = get_post_meta($post->ID, '_wp_page_template', true);

		if ($page_template === self::TEMPLATE_NAME) {
			// Enqueue all required modules
			Geometry_OS_Map_Core::get_instance()->enqueue_modules();
		}
	}
}
