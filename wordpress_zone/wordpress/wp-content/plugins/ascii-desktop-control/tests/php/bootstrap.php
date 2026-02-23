<?php
/**
 * PHPUnit Test Bootstrap for ASCII Desktop Control
 *
 * This bootstrap file sets up the WordPress testing environment.
 * Run tests with: vendor/bin/phpunit
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__, 5) . '/');
}

// Test constants
define('ASCII_DC_TESTS_DIR', __DIR__);
define('ASCII_DC_PLUGIN_DIR', dirname(__DIR__, 2));

// Include main plugin file for testing
require_once ASCII_DC_PLUGIN_DIR . '/ascii-desktop-control.php';

// Include test classes
require_once __DIR__ . '/class-test-directive-api.php';
require_once __DIR__ . '/class-test-ascii-view.php';
require_once __DIR__ . '/class-test-daemon-status.php';
require_once __DIR__ . '/class-test-ajax-handlers.php';
require_once __DIR__ . '/class-test-api-keys.php';
