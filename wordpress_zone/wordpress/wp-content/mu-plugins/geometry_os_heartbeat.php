<?php
/**
 * Plugin Name: Geometry OS Heartbeat Integration
 * Description: Enqueues MetricsCollector and heartbeat script for Infinite Map integration
 * Version: 1.0
 * Author: Geometry OS
 *
 * This mu-plugin connects the Infinite Map's metrics collection to WordPress.
 * The heartbeat sends health metrics every 60 seconds to the WordPress REST API.
 */

// Prevent direct access
if (!defined('ABSPATH')) exit;

/**
 * Enqueue heartbeat scripts on admin pages
 */
add_action('admin_enqueue_scripts', function($hook) {
    // Only load on dashboard and specific Geometry OS pages
    $load_on = ['index.php', 'toplevel_page_geometry-os', 'tools_page_geometry-os-analysis'];

    if (!in_array($hook, $load_on)) {
        return;
    }

    // Option 1: Load from local WordPress copy (copy files to theme/mu-plugins)
    // wp_enqueue_script('geometry-os-metrics', plugins_url('js/MetricsCollector.js', __FILE__), [], '1.0', true);
    // wp_enqueue_script('geometry-os-heartbeat', plugins_url('js/wp_health_bridge.js', __FILE__), ['geometry-os-metrics'], '1.0', true);

    // Option 2: Load from Infinite Map development server (for development)
    $map_server = 'http://localhost:8888'; // Change to your Infinite Map server

    wp_enqueue_script(
        'geometry-os-metrics',
        $map_server . '/MetricsCollector.js',
        [],
        '1.0',
        true
    );

    wp_enqueue_script(
        'geometry-os-heartbeat',
        $map_server . '/wp_health_bridge.js',
        ['geometry-os-metrics'],
        '1.0',
        true
    );

    // Pass configuration to JavaScript
    // Use rest_route format for compatibility with PHP built-in server
    $api_url = home_url('/?rest_route=/geometry-os/v1');
    wp_localize_script('geometry-os-heartbeat', 'geometryOSConfig', [
        'apiUrl' => $api_url,
        'heartbeatInterval' => 60000, // 60 seconds
        'mapServer' => $map_server,
    ]);
});

/**
 * Also enqueue on frontend if Infinite Map is embedded
 */
add_action('wp_enqueue_scripts', function() {
    // Check if this page has the Infinite Map embedded
    // You can customize this condition based on your setup
    $has_map = false;

    // Example: Check for shortcode or specific page
    global $post;
    if ($post && (has_shortcode($post->post_content, 'geometry_map') || has_shortcode($post->post_content, 'infinite_map'))) {
        $has_map = true;
    }

    // Or always load on specific pages
    // $has_map = is_page('mission-control');

    if (!$has_map) {
        return;
    }

    $map_server = 'http://localhost:8888';

    wp_enqueue_script(
        'geometry-os-metrics',
        $map_server . '/MetricsCollector.js',
        [],
        '1.0',
        true
    );

    wp_enqueue_script(
        'geometry-os-heartbeat',
        $map_server . '/wp_health_bridge.js',
        ['geometry-os-metrics'],
        '1.0',
        true
    );

    wp_localize_script('geometry-os-heartbeat', 'geometryOSConfig', [
        'apiUrl' => rest_url('geometry-os/v1'),
        'heartbeatInterval' => 60000,
        'mapServer' => $map_server,
    ]);
});

/**
 * Add a test button to the admin bar for quick testing
 */
add_action('admin_bar_menu', function($wp_admin_bar) {
    if (!current_user_can('manage_options')) {
        return;
    }

    $wp_admin_bar->add_node([
        'id' => 'geometry-os-heartbeat',
        'title' => '<span style="color: #00ffcc;">●</span> Geometry OS',
        'href' => '#',
        'meta' => [
            'class' => 'geometry-os-admin-bar',
            'html' => '<style>#wp-admin-bar-geometry-os-heartbeat a { background: #1a1a2e !important; }</style>'
        ]
    ]);

    $wp_admin_bar->add_node([
        'id' => 'geometry-os-send-heartbeat',
        'parent' => 'geometry-os-heartbeat',
        'title' => 'Send Heartbeat Now',
        'href' => '#',
        'meta' => [
            'onclick' => 'if(window.geometryOSApp && window.geometryOSApp.wpHealthBridge) { window.geometryOSApp.wpHealthBridge.sendHeartbeat && window.geometryOSApp.wpHealthBridge.sendHeartbeat(); alert("Heartbeat sent!"); } else { alert("Heartbeat not initialized. Open browser console and check for errors."); }'
        ]
    ]);

    $wp_admin_bar->add_node([
        'id' => 'geometry-os-view-metrics',
        'parent' => 'geometry-os-heartbeat',
        'title' => 'View Health Dashboard',
        'href' => admin_url('index.php#geometry_os_health_hud'),
    ]);
});

/**
 * Shortcode to embed the health dashboard on frontend
 */
add_shortcode('geometry_health_dashboard', function($atts) {
    $atts = shortcode_atts([
        'width' => '100%',
        'height' => '300px',
    ], $atts);

    $map_server = 'http://localhost:8888';

    // Enqueue scripts if not already loaded
    if (!wp_script_is('geometry-os-metrics', 'enqueued')) {
        wp_enqueue_script('geometry-os-metrics', $map_server . '/MetricsCollector.js', [], '1.0', true);
        wp_enqueue_script('geometry-os-heartbeat', $map_server . '/wp_health_bridge.js', ['geometry-os-metrics'], '1.0', true);
        wp_localize_script('geometry-os-heartbeat', 'geometryOSConfig', [
            'apiUrl' => rest_url('geometry-os/v1'),
            'heartbeatInterval' => 60000,
            'mapServer' => $map_server,
        ]);
    }

    ob_start();
    ?>
    <div id="geometry-os-health-dashboard" style="width: <?php echo esc_attr($atts['width']); ?>; height: <?php echo esc_attr($atts['height']); ?>;">
        <p style="color: #888; font-family: monospace;">Loading health dashboard...</p>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // The wp_health_bridge.js will auto-initialize
        console.log('[Geometry OS] Health dashboard container ready');
    });
    </script>
    <?php
    return ob_get_clean();
});

/**
 * Admin notice for quick testing
 */
add_action('admin_notices', function() {
    $screen = get_current_screen();
    if ($screen && $screen->id === 'dashboard') {
        ?>
        <div class="notice notice-info is-dismissible" style="background: #1a1a2e; border-left-color: #00ffcc; color: #e0e0e0;">
            <p style="font-family: monospace;">
                <span style="color: #00ffcc;">●</span>
                <strong>Geometry OS Heartbeat:</strong>
                <span id="geo-heartbeat-status">Initializing...</span>
                | <a href="#" onclick="if(window.geometryOSMetrics) { alert(JSON.stringify(window.geometryOSMetrics.getAllMetrics(), null, 2)); } return false;" style="color: #00ffcc;">View Metrics</a>
            </p>
            <script>
            document.addEventListener('DOMContentLoaded', function() {
                setTimeout(function() {
                    var status = document.getElementById('geo-heartbeat-status');
                    if (window.MetricsCollector) {
                        status.innerHTML = '<span style="color: #00ff00;">Active</span>';
                    } else {
                        status.innerHTML = '<span style="color: #ffcc00;">Waiting for Infinite Map...</span>';
                    }
                }, 2000);
            });
            </script>
        </div>
        <?php
    }
});

/**
 * REST endpoint for frontend to check heartbeat status
 */
add_action('rest_api_init', function() {
    register_rest_route('geometry-os/v1', '/heartbeat-status', [
        'methods' => 'GET',
        'callback' => function() {
            $metrics = get_option('geometry_os_health_metrics', []);
            $last_update = get_option('geometry_os_health_last_update', 0);
            $seconds_ago = time() - $last_update;

            return [
                'status' => empty($metrics) ? 'no_data' : ($seconds_ago < 120 ? 'active' : 'stale'),
                'last_update' => $last_update,
                'seconds_ago' => $seconds_ago,
                'metrics' => $metrics,
            ];
        },
        'permission_callback' => '__return_true', // Public endpoint
    ]);
});

// Log activation
error_log('[Geometry OS] Heartbeat integration plugin loaded');
