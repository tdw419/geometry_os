<?php
/**
 * Plugin Name: Geometry OS Map
 * Description: Embed the PixiJS Infinite Map in WordPress pages via shortcode, block, or template
 * Version: 1.1.0
 * Author: Geometry OS
 * License: MIT
 * Text Domain: geometry-os-map
 */

if (!defined('ABSPATH')) exit;

// Plugin constants
define('GEOMETRY_OS_MAP_PATH', plugin_dir_path(__FILE__));
define('GEOMETRY_OS_MAP_URL', plugin_dir_url(__FILE__));

// Require class files
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-core.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-shortcode.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-settings.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-block.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-template.php';

/**
 * Initialize plugin on plugins_loaded
 *
 * @return void
 */
function geometry_os_map_init() {
    // Initialize shortcode handler
    new Geometry_OS_Map_Shortcode();

    // Initialize block handler
    new Geometry_OS_Map_Block();

    // Initialize template handler
    new Geometry_OS_Map_Template();

    // Initialize settings page (admin only)
    if (is_admin()) {
        new Geometry_OS_Map_Settings();
    }
}
add_action('plugins_loaded', 'geometry_os_map_init');

/**
 * Helper function to render map programmatically
 *
 * @param array $args Map arguments
 * @return string HTML output
 */
function geometry_os_render_map($args = []) {
    return do_shortcode('[geometry_os_map ' . http_build_query($args, '', ' ') . ']');
}
