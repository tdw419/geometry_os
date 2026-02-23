<?php
/**
 * Unit tests for Daemon_Monitor class
 *
 * @package Geometry_OS_Daemons
 * @subpackage Tests
 */

declare(strict_types=1);

/**
 * Test Daemon_Monitor class
 */
class Test_Daemon_Monitor {

    /**
     * Set up test environment before each test
     */
    private function setup(): void {
        geometry_os_daemons_clear_transients();
    }

    /**
     * Test that get_configured_daemons() returns an array
     */
    public function test_get_configured_daemons_returns_array(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();
        $daemons = $monitor->get_configured_daemons();

        $is_array = is_array($daemons);

        if ($is_array) {
            echo "✓ test_get_configured_daemons_returns_array: Returns array with " . count($daemons) . " daemons\n";
        } else {
            echo "✗ test_get_configured_daemons_returns_array: Did not return array\n";
        }
        return $is_array;
    }

    /**
     * Test that each daemon config has required keys
     */
    public function test_daemon_config_has_required_keys(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();
        $daemons = $monitor->get_configured_daemons();

        $required_keys = ['id', 'name', 'description', 'process_name'];
        $all_valid = true;

        foreach ($daemons as $daemon_id => $config) {
            foreach ($required_keys as $key) {
                if (!array_key_exists($key, $config)) {
                    echo "✗ test_daemon_config_has_required_keys: Missing key '$key' in daemon '$daemon_id'\n";
                    $all_valid = false;
                }
            }
        }

        if ($all_valid) {
            echo "✓ test_daemon_config_has_required_keys: All daemons have required keys (id, name, description, process_name)\n";
        }
        return $all_valid;
    }

    /**
     * Test that get_all_status() returns cached data
     */
    public function test_get_all_daemon_status_returns_cached_data(): bool {
        $this->setup();

        // Pre-populate cache with test data
        $test_data = [
            'evolution' => [
                'id' => 'evolution',
                'running' => true,
                'pid' => 12345,
                'last_check' => '2026-02-23 12:00:00',
            ],
        ];
        set_transient('geometry_os_all_daemons', $test_data, 30);

        $monitor = new Daemon_Monitor();
        $status = $monitor->get_all_status();

        // Check if cached data was returned
        $is_cached = isset($status['evolution']) && $status['evolution']['pid'] === 12345;

        if ($is_cached) {
            echo "✓ test_get_all_daemon_status_returns_cached_data: Returns cached data when available\n";
        } else {
            echo "✗ test_get_all_daemon_status_returns_cached_data: Did not return cached data\n";
        }
        return $is_cached;
    }

    /**
     * Test that get_daemon_status() returns null/empty for unknown daemon
     */
    public function test_get_daemon_status_returns_null_for_unknown(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();
        $status = $monitor->get_daemon_status('nonexistent_daemon');

        // Should return array with error key for unknown daemon
        $has_error = isset($status['error']) && $status['error'] === 'Unknown daemon';

        if ($has_error) {
            echo "✓ test_get_daemon_status_returns_null_for_unknown: Returns error for unknown daemon\n";
        } else {
            echo "✗ test_get_daemon_status_returns_null_for_unknown: Did not return proper error for unknown daemon\n";
        }
        return $has_error;
    }

    /**
     * Test that clear_cache() deletes transients
     */
    public function test_clear_cache_deletes_transient(): bool {
        $this->setup();

        // Pre-populate some cache data
        set_transient('geometry_os_daemon_evolution', ['test' => 'data'], 30);
        set_transient('geometry_os_all_daemons', ['test' => 'all'], 30);

        $monitor = new Daemon_Monitor();
        $monitor->clear_cache();

        // Verify transients are deleted
        $evolution_cache = get_transient('geometry_os_daemon_evolution');
        $all_cache = get_transient('geometry_os_all_daemons');

        $cleared = ($evolution_cache === false) && ($all_cache === false);

        if ($cleared) {
            echo "✓ test_clear_cache_deletes_transient: Cache cleared successfully\n";
        } else {
            echo "✗ test_clear_cache_deletes_transient: Cache not fully cleared\n";
        }
        return $cleared;
    }

    /**
     * Test that get_all_status() returns proper structure
     */
    public function test_get_all_daemon_status_structure(): bool {
        $this->setup();

        // Pre-populate cache with properly structured test data
        $test_data = [
            'evolution' => [
                'id' => 'evolution',
                'name' => 'Evolution Daemon',
                'description' => 'Autonomous code improvement',
                'process_name' => 'evolution_daemon.py',
                'running' => true,
                'pid' => 12345,
                'uptime' => '2h 30m',
                'uptime_raw' => 9000,
                'cpu' => '4.5%',
                'memory' => '2.1%',
                'last_check' => '2026-02-23 12:00:00',
            ],
            'directive' => [
                'id' => 'directive',
                'name' => 'Directive Daemon',
                'description' => 'Command processing',
                'process_name' => 'directive_daemon.py',
                'running' => false,
                'pid' => null,
                'uptime' => null,
                'uptime_raw' => 0,
                'cpu' => null,
                'memory' => null,
                'last_check' => '2026-02-23 12:00:00',
            ],
            'visual_bridge' => [
                'id' => 'visual_bridge',
                'name' => 'Visual Bridge',
                'description' => 'WebSocket hub',
                'process_name' => 'visual_bridge.py',
                'running' => true,
                'pid' => 12346,
                'uptime' => '1d 4h',
                'uptime_raw' => 100800,
                'cpu' => '1.2%',
                'memory' => '0.8%',
                'last_check' => '2026-02-23 12:00:00',
            ],
        ];
        set_transient('geometry_os_all_daemons', $test_data, 30);

        $monitor = new Daemon_Monitor();
        $status_all = $monitor->get_all_status(); // Use cache (no force check)

        $required_keys = ['id', 'name', 'description', 'process_name', 'running', 'last_check'];
        $all_valid = true;

        foreach ($status_all as $daemon_id => $status) {
            foreach ($required_keys as $key) {
                if (!array_key_exists($key, $status)) {
                    echo "✗ test_get_all_daemon_status_structure: Missing key '$key' in status for '$daemon_id'\n";
                    $all_valid = false;
                }
            }
        }

        if ($all_valid) {
            $daemon_count = count($status_all);
            echo "✓ test_get_all_daemon_status_structure: All $daemon_count daemons have proper structure\n";
        }
        return $all_valid;
    }

    /**
     * Test format_uptime() method
     */
    public function test_format_uptime(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();

        // Test various uptime values (matching actual implementation behavior)
        // Implementation shows: days (if >=1), hours (if >=1 or have days), minutes (if no days/hours or just minutes)
        $test_cases = [
            0 => '0m',
            30 => '0m',
            60 => '1m',
            120 => '2m',
            3600 => '1h',      // Exact hour - no minutes shown
            3661 => '1h 1m',
            7200 => '2h',      // Exact hours - no minutes shown
            86400 => '1d',
            90000 => '1d 1h',  // 1 day + 1 hour
            172800 => '2d',
        ];

        $all_passed = true;
        foreach ($test_cases as $seconds => $expected) {
            $result = $monitor->format_uptime($seconds);
            if ($result !== $expected) {
                echo "✗ test_format_uptime: format_uptime($seconds) returned '$result', expected '$expected'\n";
                $all_passed = false;
            }
        }

        if ($all_passed) {
            echo "✓ test_format_uptime: All uptime formatting tests passed (" . count($test_cases) . " cases)\n";
        }
        return $all_passed;
    }

    /**
     * Test get_daemon_ids() method
     */
    public function test_get_daemon_ids(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();
        $ids = $monitor->get_daemon_ids();

        $expected_ids = ['evolution', 'directive', 'visual_bridge'];
        $has_expected = empty(array_diff($expected_ids, $ids)) && empty(array_diff($ids, $expected_ids));

        if ($has_expected) {
            echo "✓ test_get_daemon_ids: Returns correct daemon IDs (evolution, directive, visual_bridge)\n";
        } else {
            echo "✗ test_get_daemon_ids: IDs mismatch. Got: " . implode(', ', $ids) . "\n";
        }
        return $has_expected;
    }

    /**
     * Test get_cache_ttl() method
     */
    public function test_get_cache_ttl(): bool {
        $this->setup();

        $monitor = new Daemon_Monitor();
        $ttl = $monitor->get_cache_ttl();

        $is_30 = $ttl === 30;

        if ($is_30) {
            echo "✓ test_get_cache_ttl: Returns 30 seconds\n";
        } else {
            echo "✗ test_get_cache_ttl: Expected 30, got $ttl\n";
        }
        return $is_30;
    }

    /**
     * Test is_cache_valid() method
     */
    public function test_is_cache_valid(): bool {
        $this->setup();

        // Set some cached data
        set_transient('geometry_os_daemon_evolution', ['test' => 'data'], 30);

        $monitor = new Daemon_Monitor();
        $is_valid = $monitor->is_cache_valid('evolution');
        $not_valid = !$monitor->is_cache_valid('directive');

        $passed = $is_valid && $not_valid;

        if ($passed) {
            echo "✓ test_is_cache_valid: Returns true for cached, false for uncached daemon\n";
        } else {
            echo "✗ test_is_cache_valid: Failed to correctly detect cache validity\n";
        }
        return $passed;
    }

    /**
     * Run all tests
     *
     * @return array Test results.
     */
    public function run_all(): array {
        $results = [];

        $methods = get_class_methods($this);
        foreach ($methods as $method) {
            if (strpos($method, 'test_') === 0) {
                try {
                    $results[$method] = $this->$method();
                } catch (Exception $e) {
                    $results[$method] = false;
                    echo "✗ $method: " . $e->getMessage() . "\n";
                }
            }
        }

        return $results;
    }
}
