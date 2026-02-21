<?php
/**
 * Plugin Name: Geometry OS Area Agent Bridge
 * Description: Telemetry bridge for Geometry OS integration.
 * Version: 0.1
 * Author: Geometry OS Agent
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_Bridge {
    private $bridge_url = 'ws://localhost:8768';
    private $zone_id = 'wordpress_zone';

    public function __construct() {
        // Core telemetry hooks
        add_action('init', array($this, 'heartbeat'));
        add_action('wp_login', array($this, 'on_login'), 10, 2);
        add_action('save_post', array($this, 'on_post_update'), 10, 3);
        add_action('activated_plugin', array($this, 'on_plugin_change'));
        add_action('deactivated_plugin', array($this, 'on_plugin_change'));

        // Error logging
        add_action('wp_error_added', array($this, 'on_error'), 10, 4);

        // Script enqueuing for Mission Control
        add_action('wp_enqueue_scripts', array($this, 'enqueue_health_scripts'));

        // REST API for health metrics
        add_action('rest_api_init', array($this, 'register_health_api'));
    }

    public function heartbeat() {
        // Log initialization for verification
        if (is_admin() && !wp_doing_ajax()) {
            $this->log_to_os('district_upgrade', array(
                'district_id' => $this->zone_id,
                'upgrade_type' => 'heartbeat',
                'status' => 'ACTIVE',
                'url' => $_SERVER['REQUEST_URI']
            ));
        }
    }

    public function on_login($user_login, $user) {
        $this->log_to_os('thought_journal', array(
            'agent_id' => 'guardian',
            'thought_type' => 'inference',
            'text' => "WordPress Zone login detected: $user_login"
        ));
    }

    public function on_post_update($post_ID, $post, $update) {
        if (wp_is_post_revision($post_ID)) return;

        $this->log_to_os('evolution_event', array(
            'event_type' => 'CONTENT_MUTATION',
            'district_id' => $this->zone_id,
            'details' => "Post #$post_ID updated: " . $post->post_title
        ));
    }

    public function on_plugin_change($plugin) {
        $this->log_to_os('diagnostic_pulse', array(
            'district_id' => $this->zone_id,
            'status' => 'WARNING',
            'matched_pattern' => "PLUGIN_ALTERATION: $plugin"
        ));
    }

    public function on_error($code, $message, $data, $wp_error) {
        $this->log_to_os('diagnostic_pulse', array(
            'district_id' => $this->zone_id,
            'status' => 'CRITICAL',
            'matched_pattern' => "WP_ERROR: $code",
            'error_message' => strip_tags($message)
        ));
    }

    private function log_to_os($type, $data) {
        $payload = array(
            'type' => $type,
            'timestamp' => time(),
            'source' => 'wordpress_plugin',
            'data' => $data
        );

        // Absolute path for predictability
        $telemetry_dir = '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/telemetry';
        if (!file_exists($telemetry_dir)) {
            @mkdir($telemetry_dir, 0777, true);
        }

        $file = $telemetry_dir . '/events.jsonl';
        $json = json_encode($payload);
        @file_put_contents($file, $json . "\n", FILE_APPEND | LOCK_EX);
    }

    /**
     * Enqueue System Health Dashboard scripts for Mission Control
     */
    public function enqueue_health_scripts() {
        // Check if on Mission Control page or has shortcode
        $is_mission_control = $this->is_mission_control_page();

        if (!$is_mission_control) {
            return;
        }

        // Base URL for Geometry OS visual shell web assets
        $base_url = 'http://localhost:8080';

        // Enqueue in order: metrics -> dashboard -> bridge
        wp_enqueue_script(
            'geometry-os-metrics',
            $base_url . '/MetricsCollector.js',
            array(),
            '1.0.0',
            true
        );

        wp_enqueue_script(
            'geometry-os-health-dashboard',
            $base_url . '/SystemHealthDashboard.js',
            array('geometry-os-metrics'),
            '1.0.0',
            true
        );

        wp_enqueue_script(
            'geometry-os-health-bridge',
            $base_url . '/wp_health_bridge.js',
            array('geometry-os-health-dashboard'),
            '1.0.0',
            true
        );
    }

    /**
     * Check if current page is Mission Control
     *
     * @return bool True if Mission Control page or has shortcode
     */
    private function is_mission_control_page() {
        // Check for shortcode in content
        if (function_exists('has_shortcode')) {
            global $post;
            if ($post && has_shortcode($post->post_content, 'geometry_os_mission_control')) {
                return true;
            }
        }

        // Check for query var or page slug
        if (function_exists('get_query_var')) {
            if (get_query_var('geometry_os_mission_control') === '1') {
                return true;
            }
        }

        // Check page slug
        if (function_exists('is_page')) {
            if (is_page('mission-control') || is_page('geometry-os-mission-control')) {
                return true;
            }
        }

        // Check for custom indicator (data attribute or body class)
        if (isset($_GET['mission_control']) || isset($_GET['geometry_os'])) {
            return true;
        }

        return false;
    }

    /**
     * Register REST API routes for health metrics
     */
    public function register_health_api() {
        register_rest_route('geometry-os/v1', '/health', array(
            array(
                'methods' => 'POST',
                'callback' => array($this, 'handle_health_update'),
                'permission_callback' => array($this, 'verify_local_request'),
            ),
            array(
                'methods' => 'GET',
                'callback' => array($this, 'get_health_status'),
                'permission_callback' => array($this, 'verify_local_request'),
            ),
        ));
    }

    /**
     * Verify request is from localhost only (security)
     *
     * @param WP_REST_Request $request Request object
     * @return bool|WP_Error True if local, WP_Error otherwise
     */
    public function verify_local_request($request) {
        $allowed_ips = array('127.0.0.1', '::1');

        // Get client IP
        $client_ip = $_SERVER['REMOTE_ADDR'] ?? '';

        // Check for proxied IPs (X-Forwarded-For)
        if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $forwarded_ips = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $client_ip = trim($forwarded_ips[0]);
        }

        if (!in_array($client_ip, $allowed_ips)) {
            return new WP_Error(
                'rest_forbidden',
                __('Health endpoints are restricted to localhost only.', 'geometry-os'),
                array('status' => 403)
            );
        }

        return true;
    }

    /**
     * Handle POST request to update health metrics
     *
     * @param WP_REST_Request $request Request object
     * @return WP_REST_Response Response with status
     */
    public function handle_health_update($request) {
        $metrics = array(
            'latency_ms' => (float) $request->get_param('latency_ms'),
            'swarm_count' => (int) $request->get_param('swarm_count'),
            'health_score' => (float) $request->get_param('health_score'),
            'buffer_drops' => (int) $request->get_param('buffer_drops'),
            'reconnects' => (int) $request->get_param('reconnects'),
            'timestamp' => time(),
        );

        // Validate required fields
        if ($metrics['health_score'] < 0 || $metrics['health_score'] > 100) {
            return new WP_REST_Response(array(
                'success' => false,
                'error' => 'health_score must be between 0 and 100',
            ), 400);
        }

        // Store in WordPress options
        update_option('geometry_os_health_metrics', $metrics);

        // Log to OS telemetry
        $this->log_to_os('health_pulse', $metrics);

        return new WP_REST_Response(array(
            'success' => true,
            'stored' => $metrics,
        ), 200);
    }

    /**
     * Handle GET request to retrieve health status
     *
     * @param WP_REST_Request $request Request object
     * @return WP_REST_Response Response with health metrics
     */
    public function get_health_status($request) {
        $metrics = get_option('geometry_os_health_metrics', array());

        if (empty($metrics)) {
            return new WP_REST_Response(array(
                'success' => true,
                'metrics' => null,
                'message' => 'No health metrics recorded yet',
            ), 200);
        }

        return new WP_REST_Response(array(
            'success' => true,
            'metrics' => $metrics,
        ), 200);
    }
}

new GeometryOS_Bridge();

/**
 * Send agent request to Evolution Daemon via Visual Bridge
 *
 * @param string $agent_type content_intelligence|evolution_publish|plugin_analysis
 * @param array $payload Task-specific data
 * @return array Response with status and task_id
 */
function geometry_os_send_agent_request(string $agent_type, array $payload): array {
    $request = [
        'type' => 'agent_request',
        'agent_type' => $agent_type,
        'payload' => $payload,
        'source' => 'wordpress',
        'timestamp' => time(),
        'request_id' => function_exists('wp_generate_uuid4') ? wp_generate_uuid4() : uniqid('wp-', true)
    ];

    // Send via HTTP to Visual Bridge (localhost only for security)
    $response = function_exists('wp_remote_post')
        ? wp_remote_post('http://127.0.0.1:8768/agent/request', [
            'timeout' => 5,
            'body' => json_encode($request),
            'headers' => [
                'Content-Type' => 'application/json'
            ]
        ])
        : null;

    if (function_exists('is_wp_error') && is_wp_error($response)) {
        return [
            'status' => 'error',
            'message' => $response->get_error_message()
        ];
    }

    if ($response === null) {
        return [
            'status' => 'error',
            'message' => 'WordPress HTTP functions not available'
        ];
    }

    $body = function_exists('wp_remote_retrieve_body')
        ? json_decode(wp_remote_retrieve_body($response), true)
        : json_decode($response['body'] ?? '', true);

    return $body ?? ['status' => 'unknown'];
}

/**
 * Check agent task status
 *
 * @param string $task_id Task identifier from previous request
 * @return array Status and result if complete
 */
function geometry_os_get_task_status(string $task_id): array {
    $response = function_exists('wp_remote_get')
        ? wp_remote_get("http://127.0.0.1:8768/agent/status/{$task_id}", [
            'timeout' => 5
        ])
        : null;

    if (function_exists('is_wp_error') && is_wp_error($response)) {
        return ['status' => 'error', 'message' => $response->get_error_message()];
    }

    if ($response === null) {
        return ['status' => 'error', 'message' => 'WordPress HTTP functions not available'];
    }

    $body = function_exists('wp_remote_retrieve_body')
        ? json_decode(wp_remote_retrieve_body($response), true)
        : json_decode($response['body'] ?? '', true);

    return $body ?? ['status' => 'unknown'];
}

// ============================================================================
// AUTOMATIC HOOKS
// ============================================================================

/**
 * Automatic hook: Auto-tag posts on publish (draft -> publish transition)
 *
 * Triggers content_intelligence agent when a post is published without tags.
 */
add_action('transition_post_status', function($new_status, $old_status, $post) {
    // Only trigger on publish transition
    if ($new_status !== 'publish' || $old_status === 'publish') {
        return;
    }

    // Skip revisions and autosaves
    if (function_exists('wp_is_post_revision') && wp_is_post_revision($post->ID)) {
        return;
    }

    // Skip if already has tags
    if (function_exists('wp_get_post_tags')) {
        $tags = wp_get_post_tags($post->ID);
        if (!empty($tags)) {
            return;
        }
    }

    // Queue auto-tag task
    $result = geometry_os_send_agent_request('content_intelligence', [
        'post_id' => $post->ID,
        'action' => 'auto_tag'
    ]);

    // Store task ID for tracking
    if ($result['status'] === 'queued' && function_exists('update_post_meta')) {
        update_post_meta($post->ID, '_geo_agent_task', $result['task_id']);
    }
}, 10, 3);

/**
 * Handle evolution event from Visual Bridge
 *
 * @param array $event Event data with type, commit_hash, message
 * @return array Status of handling
 */
function geometry_os_handle_evolution_event($event) {
    if (!isset($event['type']) || $event['type'] !== 'evolution_commit') {
        return ['status' => 'ignored'];
    }

    $commit_hash = $event['commit_hash'] ?? '';

    // Check if already published (avoid duplicates)
    if (function_exists('get_posts')) {
        $existing = get_posts([
            'meta_key' => '_evolution_commit',
            'meta_value' => $commit_hash,
            'post_type' => 'post',
            'post_status' => 'any',
            'posts_per_page' => 1
        ]);

        if (!empty($existing)) {
            return ['status' => 'duplicate'];
        }
    }

    // Queue evolution publish task
    $result = geometry_os_send_agent_request('evolution_publish', [
        'commit_hash' => $commit_hash,
        'message' => $event['message'] ?? ''
    ]);

    return ['status' => 'published', 'task_id' => $result['task_id'] ?? null];
}

/**
 * Register custom cron interval for 5-minute polling
 */
add_filter('cron_schedules', function($schedules) {
    $schedules['five_minutes'] = [
        'interval' => 300,
        'display' => 'Every 5 Minutes'
    ];
    return $schedules;
});

/**
 * Schedule evolution polling cron on init
 */
add_action('init', function() {
    if (!function_exists('wp_next_scheduled') || !function_exists('wp_schedule_event')) {
        return;
    }

    if (!wp_next_scheduled('geometry_os_poll_evolution')) {
        wp_schedule_event(time(), 'five_minutes', 'geometry_os_poll_evolution');
    }
});

/**
 * Poll Visual Bridge for evolution events (runs every 5 minutes via cron)
 */
add_action('geometry_os_poll_evolution', function() {
    if (!function_exists('wp_remote_get')) {
        return;
    }

    // Query Visual Bridge for recent evolution events
    $response = wp_remote_get('http://127.0.0.1:8768/evolution/events', [
        'timeout' => 5
    ]);

    if (function_exists('is_wp_error') && is_wp_error($response)) {
        return;
    }

    $body = function_exists('wp_remote_retrieve_body')
        ? wp_remote_retrieve_body($response)
        : ($response['body'] ?? '');

    $events = json_decode($body, true);

    if (is_array($events)) {
        foreach ($events as $event) {
            geometry_os_handle_evolution_event($event);
        }
    }
});
