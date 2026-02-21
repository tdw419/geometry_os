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
