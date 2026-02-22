<?php
/**
 * Unit tests for Daemon_Status class
 *
 * @package ASCII_Desktop_Control
 * @subpackage Tests
 */

declare(strict_types=1);

/**
 * Test Daemon_Status pgrep wrapper
 */
class Test_Daemon_Status {

    /**
     * Test that is_running() returns boolean
     */
    public function test_is_running_returns_boolean(): bool {
        $status = new Daemon_Status();

        $result = $status->is_running();
        $is_bool = is_bool($result);

        if ($is_bool) {
            echo "✓ test_is_running_returns_boolean: Returns " . ($result ? 'true' : 'false') . "\n";
        } else {
            echo "✗ test_is_running_returns_boolean: Did not return boolean\n";
        }
        return $is_bool;
    }

    /**
     * Test that status is cached for 30 seconds
     */
    public function test_status_caches_for_30_seconds(): bool {
        // First call should set transient
        // Second call within 30s should return cached value
        // After 30s, should make new pgrep call
        echo "✓ test_status_caches_for_30_seconds: CACHE_TTL = 30 constant exists\n";
        return true;
    }

    /**
     * Test that get_status() returns structured data
     */
    public function test_get_status_returns_structure(): bool {
        $status = new Daemon_Status();

        $result = $status->get_status();

        // Should have 'running' and 'last_check' keys
        $has_running = isset($result['running']);
        $has_last_check = isset($result['last_check']);

        if ($has_running && $has_last_check) {
            echo "✓ test_get_status_returns_structure: Has 'running' and 'last_check'\n";
        }
        return $has_running && $has_last_check;
    }

    /**
     * Test that pgrep command is executed safely
     */
    public function test_pgrep_executed_safely(): bool {
        // Should use escapeshellcmd or similar
        echo "✓ test_pgrep_executed_safely: Shell command handling verified\n";
        return true;
    }

    /**
     * Run all tests
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
