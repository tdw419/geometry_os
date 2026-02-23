<?php
/**
 * Core functionality for Geometry OS Map plugin
 *
 * Provides shared functionality for all embedding methods (shortcode, block, template).
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;

/**
 * Core class for Geometry OS Map
 */
class Geometry_OS_Map_Core {

    /**
     * Singleton instance
     *
     * @var Geometry_OS_Map_Core|null
     */
    private static $instance = null;

    /**
     * Base URL for Geometry OS visual shell assets
     *
     * @var string|null
     */
    private $asset_base = null;

    /**
     * Default settings
     *
     * @var array
     */
    private $default_settings = [
        'asset_base'     => 'http://localhost:8000',
        'default_width'  => '100%',
        'default_height' => '600px',
        'default_theme'  => 'dark',
        'show_tutorial'  => true,
    ];

    /**
     * Get singleton instance
     *
     * @return Geometry_OS_Map_Core
     */
    public static function get_instance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Private constructor for singleton pattern
     */
    private function __construct() {
        // Singleton - use get_instance()
    }

    /**
     * Get asset base URL
     *
     * Priority: filter > option > default
     *
     * @return string Asset base URL
     */
    public function get_asset_base() {
        if ($this->asset_base !== null) {
            return $this->asset_base;
        }

        // Check filter first
        $this->asset_base = apply_filters('geometry_os_asset_base_url', null);

        // If filter returned null, check option
        if ($this->asset_base === null) {
            $this->asset_base = get_option('geometry_os_map_asset_base', $this->default_settings['asset_base']);
        }

        return $this->asset_base;
    }

    /**
     * Get plugin setting with fallback
     *
     * @param string $key Setting key
     * @return mixed Setting value
     */
    public function get_setting($key) {
        $option_name = 'geometry_os_map_' . $key;

        // Map short keys to defaults
        $default_map = [
            'asset_base'     => $this->default_settings['asset_base'],
            'default_width'  => $this->default_settings['default_width'],
            'default_height' => $this->default_settings['default_height'],
            'default_theme'  => $this->default_settings['default_theme'],
            'show_tutorial'  => $this->default_settings['show_tutorial'],
        ];

        $default = isset($default_map[$key]) ? $default_map[$key] : '';

        return get_option($option_name, $default);
    }

    /**
     * Enqueue PixiJS and Geometry OS modules
     *
     * @return void
     */
    public function enqueue_modules() {
        $asset_base = $this->get_asset_base();

        // PixiJS from CDN
        wp_enqueue_script(
            'pixi-v8',
            'https://pixijs.download/v8.1.0/pixi.min.js',
            [],
            '8.1.0',
            false // Load in head - required before modules
        );

        // Core modules in dependency order
        $modules = [
            // Libraries
            'lib/typed-signals.js'        => ['pixi-v8'],
            'lib/pixi-ui.min.js'          => ['lib/typed-signals.js'],

            // Core spatial systems
            'spatial_core.js'             => ['lib/pixi-ui.min.js'],
            'sprite_pool.js'              => ['spatial_core.js'],
            'chunk_manager.js'            => ['sprite_pool.js'],
            'viewport_manager.js'         => ['chunk_manager.js'],
            'lod_system.js'               => ['viewport_manager.js'],

            // Map systems
            'infinite_map_v2.js'          => ['lod_system.js'],
            'infinite_map.js'             => ['infinite_map_v2.js'],
            'brick_loader.js'             => ['infinite_map.js'],

            // Rendering
            'pixi_adapter.js'             => ['brick_loader.js'],
            'visual_boot_loader.js'       => ['pixi_adapter.js'],

            // Main application (loads last)
            'application.js'              => ['visual_boot_loader.js'],
        ];

        $index = 0;
        foreach ($modules as $path => $deps) {
            $handle = "geometry-os-module-{$index}";
            wp_enqueue_script(
                $handle,
                esc_url("{$asset_base}/{$path}"),
                $deps,
                '1.0.0',
                false // Load in head for proper initialization order
            );
            $index++;
        }
    }

    /**
     * Render the map container and initialization script
     *
     * @param array $atts Attributes for the map container
     *   - width: CSS width (default from settings)
     *   - height: CSS height (default from settings)
     *   - fullscreen: Whether to use fullscreen mode (default: false)
     *   - mode: Application mode - 'desktop' or null (default: null)
     * @return string HTML output
     */
    public function render_container($atts) {
        // Get defaults from settings
        $default_width = $this->get_setting('default_width');
        $default_height = $this->get_setting('default_height');

        $atts = shortcode_atts([
            'width'      => $default_width,
            'height'     => $default_height,
            'fullscreen' => 'false',
            'mode'       => '',
        ], $atts, 'geometry_os_map');

        $container_id = 'geometry-os-map-' . uniqid();
        $is_fullscreen = filter_var($atts['fullscreen'], FILTER_VALIDATE_BOOLEAN);
        $mode_param = !empty($atts['mode']) ? '?mode=' . esc_attr($atts['mode']) : '';

        // Build styles
        if ($is_fullscreen) {
            $styles = 'position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; z-index: 9999; background: #111;';
        } else {
            $styles = 'width: ' . esc_attr($atts['width']) . '; height: ' . esc_attr($atts['height']) . '; background: #111; border-radius: 8px; overflow: hidden;';
        }

        ob_start();
        ?>
        <div id="<?php echo esc_attr($container_id); ?>" class="geometry-os-map-container" style="<?php echo esc_attr($styles); ?>">
            <div class="geo-map-loading" style="
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
                color: #00FFFF;
                font-family: 'Courier New', monospace;
                font-size: 18px;
            ">
                <span><?php echo esc_html('BOOTING GEOMETRY KERNEL...'); ?></span>
            </div>
        </div>

        <script>
        (function() {
            var containerId = '<?php echo esc_js($container_id); ?>';
            var modeParam = '<?php echo esc_js($mode_param); ?>';

            // Wait for GeometryOSApplication to be available
            function initMap() {
                if (typeof GeometryOSApplication === 'undefined') {
                    setTimeout(initMap, 100);
                    return;
                }

                // Clear loading indicator
                var container = document.getElementById(containerId);
                if (container) {
                    container.innerHTML = '';
                }

                // Initialize application
                var app = new GeometryOSApplication();
                window.geometryOSApp = app;

                app.initialize(containerId).then(function() {
                    console.log('Geometry OS Map initialized');

                    // Dispatch event for other scripts to hook into
                    window.dispatchEvent(new CustomEvent('geometryOSMapReady', {
                        detail: { app: app, containerId: containerId }
                    }));
                }).catch(function(err) {
                    console.error('Failed to initialize Geometry OS Map:', err);
                    if (container) {
                        container.innerHTML = '<div style="color: #ff4444; padding: 20px;">Failed to load map: ' + err.message + '<\/div>';
                    }
                });
            }

            // Start initialization when DOM is ready
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', initMap);
            } else {
                initMap();
            }
        })();
        </script>

        <style>
        .geometry-os-map-container canvas {
            display: block;
        }
        </style>
        <?php
        return ob_get_clean();
    }
}
