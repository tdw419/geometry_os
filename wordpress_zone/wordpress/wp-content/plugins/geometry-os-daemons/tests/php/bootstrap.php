<?php
/**
 * PHPUnit Test Bootstrap for Geometry OS Daemons
 *
 * This bootstrap file sets up the WordPress testing environment.
 * Run tests with: php tests/php/run-tests.php
 *
 * @package Geometry_OS_Daemons
 * @subpackage Tests
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__, 5) . '/');
}

// Test constants
define('GEOMETRY_OS_DAEMONS_TESTS_DIR', __DIR__);
define('GEOMETRY_OS_DAEMONS_PLUGIN_DIR', dirname(__DIR__, 2));

// Mock WordPress functions for testing

/**
 * Mock current_time() function
 *
 * @param string $type Type of time to return.
 * @return string|int Current time.
 */
if (!function_exists('current_time')) {
    function current_time(string $type) {
        static $mock_time = null;

        if ($mock_time !== null) {
            if ($type === 'mysql') {
                return $mock_time;
            }
            if ($type === 'timestamp') {
                return strtotime($mock_time);
            }
        }

        if ($type === 'mysql') {
            return date('Y-m-d H:i:s');
        }
        if ($type === 'timestamp') {
            return time();
        }
        return time();
    }
}

/**
 * Set mock time for current_time() function
 *
 * @param string|null $time MySQL time string or null to reset.
 */
function geometry_os_daemons_set_mock_time(?string $time): void {
    global $geometry_os_daemons_mock_time;
    $geometry_os_daemons_mock_time = $time;
}

/**
 * Mock transient storage
 */
$GLOBALS['geometry_os_daemons_transients'] = [];

/**
 * Mock get_transient() function
 *
 * @param string $transient Transient name.
 * @return mixed|false Transient value or false if not set.
 */
if (!function_exists('get_transient')) {
    function get_transient(string $transient) {
        global $geometry_os_daemons_transients;

        if (isset($geometry_os_daemons_transients[$transient])) {
            return $geometry_os_daemons_transients[$transient];
        }

        return false;
    }
}

/**
 * Mock set_transient() function
 *
 * @param string $transient Transient name.
 * @param mixed  $value     Transient value.
 * @param int    $expiration Expiration time in seconds.
 * @return bool Always returns true.
 */
if (!function_exists('set_transient')) {
    function set_transient(string $transient, $value, int $expiration = 0): bool {
        global $geometry_os_daemons_transients;
        $geometry_os_daemons_transients[$transient] = $value;
        return true;
    }
}

/**
 * Mock delete_transient() function
 *
 * @param string $transient Transient name.
 * @return bool Always returns true.
 */
if (!function_exists('delete_transient')) {
    function delete_transient(string $transient): bool {
        global $geometry_os_daemons_transients;
        unset($geometry_os_daemons_transients[$transient]);
        return true;
    }
}

/**
 * Mock __() translation function
 *
 * @param string $text Text to translate.
 * @param string $domain Text domain.
 * @return string The original text.
 */
if (!function_exists('__')) {
    function __(string $text, string $domain = 'default'): string {
        return $text;
    }
}

/**
 * Mock esc_html() function
 *
 * @param string $text Text to escape.
 * @return string Escaped text.
 */
if (!function_exists('esc_html')) {
    function esc_html(string $text): string {
        return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    }
}

/**
 * Mock esc_attr() function
 *
 * @param string $text Text to escape.
 * @return string Escaped text.
 */
if (!function_exists('esc_attr')) {
    function esc_attr(string $text): string {
        return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    }
}

/**
 * Clear all mock transients
 */
function geometry_os_daemons_clear_transients(): void {
    global $geometry_os_daemons_transients;
    $geometry_os_daemons_transients = [];
}

// Include the Daemon_Monitor class for testing
require_once GEOMETRY_OS_DAEMONS_PLUGIN_DIR . '/includes/class-daemon-monitor.php';

// Include test classes
require_once __DIR__ . '/class-test-daemon-monitor.php';
