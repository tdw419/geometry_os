<?php
/**
 * Gutenberg block for Geometry OS Map plugin
 *
 * Registers and renders the 'geometry-os/map' block with server-side rendering.
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;

/**
 * Block class for Geometry OS Map
 */
class Geometry_OS_Map_Block {

    /**
     * Initialize the block
     */
    public function __construct() {
        add_action('init', [$this, 'register_block']);
    }

    /**
     * Register the Gutenberg block
     *
     * @return void
     */
    public function register_block() {
        // Register the editor script
        wp_register_script(
            'geometry-os-map-block-editor',
            GEOMETRY_OS_MAP_URL . 'assets/js/block-editor.js',
            ['wp-blocks', 'wp-element', 'wp-components', 'wp-editor'],
            '1.1.0',
            true
        );

        // Get default settings from Core
        $core = Geometry_OS_Map_Core::get_instance();
        $default_width = $core->get_setting('default_width');
        $default_height = $core->get_setting('default_height');
        $default_theme = $core->get_setting('default_theme');
        $show_tutorial = $core->get_setting('show_tutorial');

        // Register the block type with server-side rendering
        register_block_type('geometry-os/map', [
            'editor_script'   => 'geometry-os-map-block-editor',
            'render_callback' => [$this, 'render_block'],
            'attributes'      => [
                'width' => [
                    'type'    => 'string',
                    'default' => $default_width,
                ],
                'height' => [
                    'type'    => 'string',
                    'default' => $default_height,
                ],
                'fullscreen' => [
                    'type'    => 'boolean',
                    'default' => false,
                ],
                'mode' => [
                    'type'    => 'string',
                    'default' => '',
                ],
                'theme' => [
                    'type'    => 'string',
                    'default' => $default_theme,
                ],
                'showTutorial' => [
                    'type'    => 'boolean',
                    'default' => (bool) $show_tutorial,
                ],
            ],
            'supports' => [
                'align' => ['wide', 'full'],
            ],
        ]);
    }

    /**
     * Render the block on the frontend
     *
     * @param array $attributes Block attributes.
     * @return string HTML output.
     */
    public function render_block($attributes) {
        $core = Geometry_OS_Map_Core::get_instance();

        // Enqueue the required scripts
        $core->enqueue_modules();

        // Prepare attributes for render_container
        $atts = [
            'width'      => isset($attributes['width']) ? $attributes['width'] : $core->get_setting('default_width'),
            'height'     => isset($attributes['height']) ? $attributes['height'] : $core->get_setting('default_height'),
            'fullscreen' => isset($attributes['fullscreen']) ? ($attributes['fullscreen'] ? 'true' : 'false') : 'false',
            'mode'       => isset($attributes['mode']) ? $attributes['mode'] : '',
        ];

        // Render the container
        return $core->render_container($atts);
    }
}
