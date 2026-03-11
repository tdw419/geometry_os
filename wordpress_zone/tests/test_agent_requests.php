<?php
/**
 * Test WordPress agent request handling
 *
 * Tests for geometry_os_send_agent_request() and geometry_os_get_task_status()
 * functions in the Geometry OS Bridge plugin.
 */

// Mock WordPress functions for standalone testing
if (!function_exists('wp_remote_post')) {
    function wp_remote_post($url, $args = []) {
        global $mock_wp_response;
        if (isset($mock_wp_response)) {
            return $mock_wp_response;
        }
        // Default mock response
        return [
            'response' => ['code' => 200],
            'body' => json_encode(['status' => 'queued', 'task_id' => 'test-task-123'])
        ];
    }
}

if (!function_exists('wp_remote_get')) {
    function wp_remote_get($url, $args = []) {
        global $mock_wp_response;
        if (isset($mock_wp_response)) {
            return $mock_wp_response;
        }
        return [
            'response' => ['code' => 200],
            'body' => json_encode(['status' => 'completed', 'result' => ['tags' => ['AI', 'evolution']]])
        ];
    }
}

if (!function_exists('wp_remote_retrieve_body')) {
    function wp_remote_retrieve_body($response) {
        return $response['body'] ?? '';
    }
}

if (!function_exists('wp_generate_uuid4')) {
    function wp_generate_uuid4() {
        return sprintf(
            '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }
}

if (!function_exists('is_wp_error')) {
    function is_wp_error($thing) {
        return $thing instanceof WP_Error;
    }
}

if (!function_exists('wp_is_post_revision')) {
    function wp_is_post_revision($post) {
        return false;
    }
}

if (!function_exists('wp_get_post_tags')) {
    function wp_get_post_tags($post_id, $args = []) {
        return [];
    }
}

if (!function_exists('update_post_meta')) {
    function update_post_meta($post_id, $meta_key, $meta_value) {
        global $post_meta_storage;
        if (!isset($post_meta_storage)) {
            $post_meta_storage = [];
        }
        $post_meta_storage[$post_id][$meta_key] = $meta_value;
        return true;
    }
}

if (!function_exists('get_post_meta')) {
    function get_post_meta($post_id, $key = '', $single = false) {
        global $post_meta_storage;
        if (!isset($post_meta_storage) || !isset($post_meta_storage[$post_id])) {
            return $single ? '' : [];
        }
        if (empty($key)) {
            return $post_meta_storage[$post_id];
        }
        return $single ? ($post_meta_storage[$post_id][$key] ?? '') : [$post_meta_storage[$post_id][$key] ?? ''];
    }
}

if (!function_exists('get_posts')) {
    function get_posts($args = []) {
        return [];
    }
}

if (!function_exists('wp_next_scheduled')) {
    function wp_next_scheduled($hook) {
        return false;
    }
}

if (!function_exists('wp_schedule_event')) {
    function wp_schedule_event($timestamp, $recurrence, $hook) {
        return true;
    }
}

if (!function_exists('add_action')) {
    $GLOBALS['registered_actions'] = [];
    function add_action($hook, $callback, $priority = 10, $accepted_args = 1) {
        $GLOBALS['registered_actions'][$hook] = [
            'callback' => $callback,
            'priority' => $priority,
            'accepted_args' => $accepted_args
        ];
    }
}

if (!function_exists('add_filter')) {
    $GLOBALS['registered_filters'] = [];
    function add_filter($hook, $callback, $priority = 10, $accepted_args = 1) {
        $GLOBALS['registered_filters'][$hook] = [
            'callback' => $callback,
            'priority' => $priority,
            'accepted_args' => $accepted_args
        ];
    }
}

if (!class_exists('WP_Post')) {
    class WP_Post {
        public $ID;
        public $post_title;
        public $post_content;
        public $post_status;

        public function __construct($id = 1, $title = 'Test Post', $content = 'Test content') {
            $this->ID = $id;
            $this->post_title = $title;
            $this->post_content = $content;
            $this->post_status = 'publish';
        }
    }
}

if (!class_exists('WP_Error')) {
    class WP_Error {
        private $errors = [];
        private $error_data = [];

        public function __construct($code = '', $message = '', $data = '') {
            if (!empty($code)) {
                $this->errors[$code][] = $message;
                if (!empty($data)) {
                    $this->error_data[$code] = $data;
                }
            }
        }

        public function get_error_message($code = '') {
            if (empty($code)) {
                $code = array_key_first($this->errors);
            }
            return $this->errors[$code][0] ?? '';
        }
    }
}

// Include the bridge functions
require_once __DIR__ . '/../wordpress/wp-content/mu-plugins/geometry_os_bridge.php';

/**
 * Test class for agent request functions
 */
class TestAgentRequests {

    /**
     * Test sending content intelligence request
     */
    public static function test_send_content_intelligence_request() {
        global $mock_wp_response;
        $mock_wp_response = [
            'response' => ['code' => 200],
            'body' => json_encode(['status' => 'queued', 'task_id' => 'wp-content_intelligence-1-' . time()])
        ];

        $result = geometry_os_send_agent_request('content_intelligence', [
            'post_id' => 1,
            'action' => 'auto_tag'
        ]);

        if (!is_array($result)) {
            echo "FAIL: test_send_content_intelligence_request - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if (!array_key_exists('status', $result)) {
            echo "FAIL: test_send_content_intelligence_request - Missing 'status' key\n";
            return false;
        }
        if ($result['status'] !== 'queued') {
            echo "FAIL: test_send_content_intelligence_request - Expected 'queued', got '{$result['status']}'\n";
            return false;
        }

        echo "PASS: test_send_content_intelligence_request\n";
        return true;
    }

    /**
     * Test sending evolution publish request
     */
    public static function test_send_evolution_publish_request() {
        global $mock_wp_response;
        $mock_wp_response = [
            'response' => ['code' => 200],
            'body' => json_encode([
                'status' => 'queued',
                'task_id' => 'wp-evolution_publish-abc123-' . time()
            ])
        ];

        $result = geometry_os_send_agent_request('evolution_publish', [
            'commit_hash' => 'abc123',
            'message' => 'Test commit'
        ]);

        if (!is_array($result)) {
            echo "FAIL: test_send_evolution_publish_request - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if (!array_key_exists('task_id', $result)) {
            echo "FAIL: test_send_evolution_publish_request - Missing 'task_id' key\n";
            return false;
        }

        echo "PASS: test_send_evolution_publish_request\n";
        return true;
    }

    /**
     * Test sending plugin analysis request
     */
    public static function test_send_plugin_analysis_request() {
        global $mock_wp_response;
        $mock_wp_response = [
            'response' => ['code' => 200],
            'body' => json_encode(['status' => 'queued', 'task_id' => 'wp-plugin_analysis-' . time()])
        ];

        $result = geometry_os_send_agent_request('plugin_analysis', [
            'scan_type' => 'security'
        ]);

        if (!is_array($result)) {
            echo "FAIL: test_send_plugin_analysis_request - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if ($result['status'] !== 'queued') {
            echo "FAIL: test_send_plugin_analysis_request - Expected 'queued', got '{$result['status']}'\n";
            return false;
        }

        echo "PASS: test_send_plugin_analysis_request\n";
        return true;
    }

    /**
     * Test get task status
     */
    public static function test_get_task_status() {
        global $mock_wp_response;
        $mock_wp_response = [
            'response' => ['code' => 200],
            'body' => json_encode([
                'status' => 'completed',
                'result' => ['tags' => ['AI', 'evolution']]
            ])
        ];

        $result = geometry_os_get_task_status('wp-content_intelligence-1-1234567890');

        if (!is_array($result)) {
            echo "FAIL: test_get_task_status - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if ($result['status'] !== 'completed') {
            echo "FAIL: test_get_task_status - Expected 'completed', got '{$result['status']}'\n";
            return false;
        }

        echo "PASS: test_get_task_status\n";
        return true;
    }

    /**
     * Test error handling for connection failure
     */
    public static function test_error_handling() {
        global $mock_wp_response;
        $mock_wp_response = new WP_Error('http_request_failed', 'Connection refused');

        $result = geometry_os_send_agent_request('content_intelligence', [
            'post_id' => 1,
            'action' => 'auto_tag'
        ]);

        if (!is_array($result)) {
            echo "FAIL: test_error_handling - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if ($result['status'] !== 'error') {
            echo "FAIL: test_error_handling - Expected 'error', got '{$result['status']}'\n";
            return false;
        }

        echo "PASS: test_error_handling\n";
        return true;
    }

    /**
     * Test auto-publish on evolution commit event
     */
    public static function test_auto_publish_on_evolution_commit() {
        global $mock_wp_response, $post_meta_storage;
        $post_meta_storage = [];

        // Mock for checking duplicates (no existing posts)
        $mock_wp_response = [
            'response' => ['code' => 200],
            'body' => json_encode([
                'status' => 'queued',
                'task_id' => 'wp-evolution_publish-test-' . time()
            ])
        ];

        // Simulate evolution daemon writing commit event
        $event = [
            'type' => 'evolution_commit',
            'commit_hash' => 'abc123def',
            'message' => 'feat: add new feature'
        ];

        $result = geometry_os_handle_evolution_event($event);

        if (!is_array($result)) {
            echo "FAIL: test_auto_publish_on_evolution_commit - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if ($result['status'] !== 'published') {
            echo "FAIL: test_auto_publish_on_evolution_commit - Expected 'published', got '{$result['status']}'\n";
            return false;
        }
        if (!isset($result['task_id'])) {
            echo "FAIL: test_auto_publish_on_evolution_commit - Missing 'task_id' key\n";
            return false;
        }

        echo "PASS: test_auto_publish_on_evolution_commit\n";
        return true;
    }

    /**
     * Test evolution event handler ignores non-commit events
     */
    public static function test_evolution_event_ignores_non_commit() {
        $event = [
            'type' => 'other_event',
            'data' => 'something'
        ];

        $result = geometry_os_handle_evolution_event($event);

        if (!is_array($result)) {
            echo "FAIL: test_evolution_event_ignores_non_commit - Expected array, got " . gettype($result) . "\n";
            return false;
        }
        if ($result['status'] !== 'ignored') {
            echo "FAIL: test_evolution_event_ignores_non_commit - Expected 'ignored', got '{$result['status']}'\n";
            return false;
        }

        echo "PASS: test_evolution_event_ignores_non_commit\n";
        return true;
    }

    /**
     * Test cron schedule registration
     */
    public static function test_cron_schedule_registered() {
        global $registered_filters;

        if (!isset($registered_filters['cron_schedules'])) {
            echo "FAIL: test_cron_schedule_registered - 'cron_schedules' filter not registered\n";
            return false;
        }

        // Call the filter callback to verify it adds the five_minutes schedule
        $callback = $registered_filters['cron_schedules']['callback'];
        $schedules = $callback([]);

        if (!isset($schedules['five_minutes'])) {
            echo "FAIL: test_cron_schedule_registered - 'five_minutes' schedule not added\n";
            return false;
        }
        if ($schedules['five_minutes']['interval'] !== 300) {
            echo "FAIL: test_cron_schedule_registered - Expected interval 300, got '{$schedules['five_minutes']['interval']}'\n";
            return false;
        }

        echo "PASS: test_cron_schedule_registered\n";
        return true;
    }

    /**
     * Test auto-tag hook is registered
     */
    public static function test_auto_tag_hook_registered() {
        global $registered_actions;

        if (!isset($registered_actions['transition_post_status'])) {
            echo "FAIL: test_auto_tag_hook_registered - 'transition_post_status' action not registered\n";
            return false;
        }

        echo "PASS: test_auto_tag_hook_registered\n";
        return true;
    }

    /**
     * Test evolution polling hook is registered
     */
    public static function test_evolution_polling_hooks_registered() {
        global $registered_actions;

        if (!isset($registered_actions['init'])) {
            echo "FAIL: test_evolution_polling_hooks_registered - 'init' action not registered\n";
            return false;
        }
        if (!isset($registered_actions['geometry_os_poll_evolution'])) {
            echo "FAIL: test_evolution_polling_hooks_registered - 'geometry_os_poll_evolution' action not registered\n";
            return false;
        }

        echo "PASS: test_evolution_polling_hooks_registered\n";
        return true;
    }

    /**
     * Run all tests
     */
    public static function run_all() {
        $tests = [
            'test_send_content_intelligence_request',
            'test_send_evolution_publish_request',
            'test_send_plugin_analysis_request',
            'test_get_task_status',
            'test_error_handling',
            'test_auto_publish_on_evolution_commit',
            'test_evolution_event_ignores_non_commit',
            'test_cron_schedule_registered',
            'test_auto_tag_hook_registered',
            'test_evolution_polling_hooks_registered'
        ];

        $passed = 0;
        $failed = 0;

        echo "Running Agent Request Tests\n";
        echo str_repeat("=", 50) . "\n\n";

        foreach ($tests as $test) {
            try {
                if (self::$test()) {
                    $passed++;
                } else {
                    $failed++;
                }
            } catch (Exception $e) {
                echo "FAIL: $test - Exception: " . $e->getMessage() . "\n";
                $failed++;
            }
        }

        echo "\n" . str_repeat("=", 50) . "\n";
        echo "Results: $passed passed, $failed failed\n";

        return $failed === 0;
    }
}

// Run tests if executed directly
if (php_sapi_name() === 'cli' && basename(__FILE__) === basename($_SERVER['SCRIPT_NAME'] ?? '')) {
    $success = TestAgentRequests::run_all();
    exit($success ? 0 : 1);
}
