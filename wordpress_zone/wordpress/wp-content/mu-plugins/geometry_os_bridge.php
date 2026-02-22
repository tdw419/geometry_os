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

        // Health report post type
        add_action('init', array($this, 'register_health_report_post_type'));

        // Hourly health report cron
        add_action('geometry_os_hourly_health_report', array($this, 'generate_health_report'));
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

        register_rest_route('geometry-os/v1', '/emergency-reset', array(
            'methods' => 'POST',
            'callback' => array($this, 'handle_emergency_reset'),
            'permission_callback' => array($this, 'verify_local_request'),
        ));

        // Heartbeat status endpoint for scorecard
        register_rest_route('geometry-os/v1', '/heartbeat-status', array(
            'methods' => 'GET',
            'callback' => array($this, 'get_heartbeat_status'),
            'permission_callback' => '__return_true',
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

    /**
     * Handle POST request for emergency reset
     *
     * @param WP_REST_Request $request Request object
     * @return WP_REST_Response Response with status
     */
    public function handle_emergency_reset($request) {
        // Collect audit information
        $audit_data = array(
            'timestamp' => time(),
            'ip' => $_SERVER['REMOTE_ADDR'] ?? 'unknown',
            'user_agent' => $_SERVER['HTTP_USER_AGENT'] ?? 'unknown',
            'district_id' => $this->zone_id,
        );

        // Log the reset event to OS telemetry
        $this->log_to_os('emergency_reset', $audit_data);

        // Clear the health metrics option
        delete_option('geometry_os_health_metrics');

        // Send POST to Visual Bridge for map restart
        $bridge_response = function_exists('wp_remote_post')
            ? wp_remote_post('http://127.0.0.1:8768/emergency-reset', array(
                'timeout' => 5,
                'headers' => array('Content-Type' => 'application/json'),
                'body' => json_encode($audit_data),
            ))
            : null;

        // Check if Visual Bridge notification succeeded
        $bridge_success = true;
        $bridge_error = '';

        if (function_exists('is_wp_error') && is_wp_error($bridge_response)) {
            $bridge_success = false;
            $bridge_error = $bridge_response->get_error_message();
        } elseif ($bridge_response === null) {
            // WordPress HTTP functions not available - still succeed locally
            $bridge_success = false;
            $bridge_error = 'WordPress HTTP functions not available';
        } else {
            $response_code = function_exists('wp_remote_retrieve_response_code')
                ? wp_remote_retrieve_response_code($bridge_response)
                : ($bridge_response['response']['code'] ?? 500);

            if ($response_code >= 400) {
                $bridge_success = false;
                $bridge_error = "Visual Bridge returned HTTP $response_code";
            }
        }

        // Return success even if Visual Bridge failed (local reset succeeded)
        if ($bridge_success) {
            return new WP_REST_Response(array(
                'success' => true,
                'message' => 'Emergency reset initiated. Map will restart.',
            ), 200);
        } else {
            // Still return success for local reset, but note bridge issue
            return new WP_REST_Response(array(
                'success' => true,
                'message' => 'Emergency reset completed locally. Visual Bridge notification failed: ' . $bridge_error,
            ), 200);
        }
    }

    /**
     * Register the health report custom post type
     */
    public function register_health_report_post_type() {
        register_post_type('geo_health_report', array(
            'labels' => array(
                'name' => 'Health Reports',
                'singular_name' => 'Health Report',
                'add_new' => 'Add New',
                'add_new_item' => 'Add New Health Report',
                'edit_item' => 'Edit Health Report',
                'new_item' => 'New Health Report',
                'view_item' => 'View Health Report',
                'search_items' => 'Search Health Reports',
                'not_found' => 'No health reports found',
                'not_found_in_trash' => 'No health reports found in trash',
            ),
            'public' => true,
            'has_archive' => true,
            'show_in_rest' => true,
            'supports' => array('title', 'editor', 'custom-fields'),
            'menu_icon' => 'dashicons-heart',
            'capability_type' => 'post',
            'rewrite' => array('slug' => 'health-reports'),
        ));
    }

    /**
     * Generate hourly health report post (called by cron)
     */
    public function generate_health_report() {
        // Get current metrics from option
        $current_metrics = get_option('geometry_os_health_metrics', array());

        // Read last hour's health_pulse events from telemetry file
        $telemetry_dir = '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/telemetry';
        $telemetry_file = $telemetry_dir . '/events.jsonl';

        $events = array();
        $one_hour_ago = time() - 3600;

        if (file_exists($telemetry_file)) {
            $lines = file($telemetry_file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            if ($lines !== false) {
                // Read last 1000 lines (for performance)
                $recent_lines = array_slice($lines, -1000);
                foreach ($recent_lines as $line) {
                    $event = json_decode($line, true);
                    if ($event && isset($event['type']) && $event['type'] === 'health_pulse') {
                        if (isset($event['timestamp']) && $event['timestamp'] >= $one_hour_ago) {
                            $events[] = $event['data'];
                        }
                    }
                }
            }
        }

        // Calculate averages
        $avg_latency = 0;
        $avg_score = 0;
        $max_swarm = 0;

        if (!empty($events)) {
            $total_latency = 0;
            $total_score = 0;
            $count = 0;

            foreach ($events as $event) {
                if (isset($event['latency_ms'])) {
                    $total_latency += (float) $event['latency_ms'];
                }
                if (isset($event['health_score'])) {
                    $total_score += (float) $event['health_score'];
                }
                if (isset($event['swarm_count'])) {
                    $max_swarm = max($max_swarm, (int) $event['swarm_count']);
                }
                $count++;
            }

            if ($count > 0) {
                $avg_latency = round($total_latency / $count, 2);
                $avg_score = round($total_score / $count, 2);
            }
        } elseif (!empty($current_metrics)) {
            // Fallback to current metrics if no events
            $avg_latency = (float) ($current_metrics['latency_ms'] ?? 0);
            $avg_score = (float) ($current_metrics['health_score'] ?? 0);
            $max_swarm = (int) ($current_metrics['swarm_count'] ?? 0);
        }

        // Generate report content
        $content = $this->generate_report_content($events, $avg_latency, $avg_score, $max_swarm);

        // Create post
        $post_data = array(
            'post_title' => 'Health Report - ' . date('Y-m-d H:i'),
            'post_content' => $content,
            'post_type' => 'geo_health_report',
            'post_status' => 'publish',
            'post_date' => current_time('mysql'),
        );

        $post_id = wp_insert_post($post_data);

        // Store metrics as post meta
        if ($post_id && !is_wp_error($post_id)) {
            update_post_meta($post_id, '_health_avg_latency', $avg_latency);
            update_post_meta($post_id, '_health_avg_score', $avg_score);
            update_post_meta($post_id, '_health_max_swarm', $max_swarm);
            update_post_meta($post_id, '_health_event_count', count($events));
            update_post_meta($post_id, '_health_report_time', time());
        }

        return $post_id;
    }

    /**
     * Generate HTML content for health report
     *
     * @param array $events Health pulse events from last hour
     * @param float $avg_latency Average latency in ms
     * @param float $avg_score Average health score
     * @param int $max_swarm Maximum swarm count
     * @return string HTML content
     */
    private function generate_report_content($events, $avg_latency, $avg_score, $max_swarm) {
        // Determine overall status
        if ($avg_score >= 80) {
            $status = 'HEALTHY';
            $status_color = '#00ff00';
        } elseif ($avg_score >= 50) {
            $status = 'DEGRADED';
            $status_color = '#ffcc00';
        } else {
            $status = 'CRITICAL';
            $status_color = '#ff4444';
        }

        $event_count = count($events);
        $timestamp = date('Y-m-d H:i:s T');

        ob_start();
        ?>
<div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, monospace; background: #1a1a2e; color: #e0e0e0; padding: 20px; border-radius: 8px;">
    <h2 style="color: #00ffcc; margin-top: 0; border-bottom: 1px solid #00ffcc; padding-bottom: 10px;">
        Geometry OS - Hourly Health Report
    </h2>

    <div style="margin-bottom: 20px;">
        <span style="font-size: 14px; color: #888;">System Status:</span>
        <span style="font-size: 18px; font-weight: bold; color: <?php echo esc_attr($status_color); ?>; margin-left: 10px;">
            <?php echo esc_html($status); ?>
        </span>
    </div>

    <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
        <thead>
            <tr style="background: #2a2a4e;">
                <th style="padding: 12px; text-align: left; border: 1px solid #00ffcc; color: #00ffcc;">Metric</th>
                <th style="padding: 12px; text-align: right; border: 1px solid #00ffcc; color: #00ffcc;">Value</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="padding: 10px; border: 1px solid #3a3a5e;">Average Health Score</td>
                <td style="padding: 10px; border: 1px solid #3a3a5e; text-align: right; color: <?php echo esc_attr($avg_score >= 80 ? '#00ff00' : ($avg_score >= 50 ? '#ffcc00' : '#ff4444')); ?>;">
                    <?php echo esc_html($avg_score); ?>%
                </td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #3a3a5e;">Average Latency</td>
                <td style="padding: 10px; border: 1px solid #3a3a5e; text-align: right; color: <?php echo esc_attr($avg_latency < 100 ? '#00ff00' : ($avg_latency < 500 ? '#ffcc00' : '#ff4444')); ?>;">
                    <?php echo esc_html($avg_latency); ?>ms
                </td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #3a3a5e;">Peak Swarm Count</td>
                <td style="padding: 10px; border: 1px solid #3a3a5e; text-align: right;">
                    <?php echo esc_html($max_swarm); ?> agents
                </td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #3a3a5e;">Heartbeats This Hour</td>
                <td style="padding: 10px; border: 1px solid #3a3a5e; text-align: right;">
                    <?php echo esc_html($event_count); ?>
                </td>
            </tr>
        </tbody>
    </table>

    <div style="font-size: 12px; color: #666; border-top: 1px solid #3a3a5e; padding-top: 15px;">
        Report generated: <?php echo esc_html($timestamp); ?>
    </div>
</div>
<?php
        return ob_get_clean();
    }

    /**
     * Get heartbeat status for scorecard
     */
    public function get_heartbeat_status($request) {
        $metrics = get_option('geometry_os_health_metrics', array());
        $last_update = get_option('geometry_os_health_last_update', 0);
        $heartbeat_count = get_option('geometry_os_heartbeat_count', 0);
        $start_time = get_option('geometry_os_start_time', time());

        $seconds_ago = $last_update > 0 ? time() - $last_update : 0;
        $status = empty($metrics) ? 'no_data' : ($seconds_ago < 120 ? 'active' : 'stale');

        return new WP_REST_Response(array(
            'status' => $status,
            'last_update' => (int)$last_update,
            'seconds_ago' => $seconds_ago,
            'heartbeat_count' => (int)$heartbeat_count,
            'uptime_seconds' => time() - (int)$start_time,
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
 * Register custom cron intervals for 5-minute polling and hourly health reports
 */
add_filter('cron_schedules', function($schedules) {
    $schedules['five_minutes'] = [
        'interval' => 300,
        'display' => 'Every 5 Minutes'
    ];
    $schedules['hourly'] = [
        'interval' => 3600,
        'display' => 'Once Hourly'
    ];
    return $schedules;
});

/**
 * Schedule evolution polling and health report crons on init
 */
add_action('init', function() {
    if (!function_exists('wp_next_scheduled') || !function_exists('wp_schedule_event')) {
        return;
    }

    if (!wp_next_scheduled('geometry_os_poll_evolution')) {
        wp_schedule_event(time(), 'five_minutes', 'geometry_os_poll_evolution');
    }

    if (!wp_next_scheduled('geometry_os_hourly_health_report')) {
        wp_schedule_event(time(), 'hourly', 'geometry_os_hourly_health_report');
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
