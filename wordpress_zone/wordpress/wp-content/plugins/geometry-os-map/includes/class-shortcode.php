<?php
/**
 * Shortcode handler for Geometry OS Map plugin
 *
 * Handles the [geometry_os_map] shortcode rendering and asset loading.
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;

/**
 * Shortcode class for Geometry OS Map
 */
class Geometry_OS_Map_Shortcode {

    /**
     * Constructor - registers hooks
     */
    public function __construct() {
        add_action('wp_enqueue_scripts', [$this, 'maybe_enqueue_assets']);
        add_shortcode('geometry_os_map', [$this, 'render']);
    }

    /**
     * Check if current post has shortcode and enqueue assets if so
     *
     * @return void
     */
    public function maybe_enqueue_assets() {
        global $post;

        // Only load on pages with our shortcode
        if (!is_a($post, 'WP_Post') || !has_shortcode($post->post_content, 'geometry_os_map')) {
            return;
        }

        // Enqueue modules via Core
        Geometry_OS_Map_Core::get_instance()->enqueue_modules();
    }

    /**
     * Render the shortcode
     *
     * @param array $atts Shortcode attributes
     * @return string HTML output
     */
    public function render($atts) {
        return Geometry_OS_Map_Core::get_instance()->render_container($atts);
    }
}
