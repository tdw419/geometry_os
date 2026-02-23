<?php
/**
 * Generate Test API Key for E2E Testing
 *
 * This script generates a test API key for use in end-to-end testing.
 * Run via WP-CLI or with WordPress bootstrap.
 *
 * Usage:
 *   # Via WP-CLI (recommended)
 *   wp eval-file wp-content/plugins/ascii-desktop-control/tests/php/generate-test-api-key.php
 *
 *   # Or with direct PHP (requires WordPress bootstrap)
 *   php generate-test-api-key.php --bootstrap=/path/to/wp-load.php
 */

// Check if running via WP-CLI
if (defined('WP_CLI') && WP_CLI) {
    generate_test_key_wp_cli();
    return;
}

// Check for direct PHP execution with bootstrap
$options = getopt('', ['bootstrap::']);
if (isset($options['bootstrap'])) {
    require_once $options['bootstrap'];
    generate_test_key();
    return;
}

// Fallback - output usage
echo "Generate Test API Key for E2E Testing\n";
echo "=====================================\n\n";
echo "Usage:\n";
echo "  wp eval-file wp-content/plugins/ascii-desktop-control/tests/php/generate-test-api-key.php\n\n";
echo "Or with bootstrap:\n";
echo "  php generate-test-api-key.php --bootstrap=/path/to/wp-load.php\n";

/**
 * Generate and output test API key (WP-CLI version)
 */
function generate_test_key_wp_cli(): void {
    $result = generate_test_key();

    if ($result['success']) {
        WP_CLI::success($result['message']);
        WP_CLI::line("API Key: " . $result['api_key']);
        WP_CLI::line("Key ID:  " . $result['key_id']);
    } else {
        WP_CLI::error($result['error']);
    }
}

/**
 * Generate and output test API key
 *
 * @return array Result with success status and key details
 */
function generate_test_key(): array {
    // Ensure API_Keys class is loaded
    if (!class_exists('API_Keys')) {
        $class_file = dirname(__FILE__, 3) . '/includes/class-api-keys.php';
        if (file_exists($class_file)) {
            require_once $class_file;
        } else {
            return [
                'success' => false,
                'error'   => 'API_Keys class not found. Make sure the plugin is active.',
            ];
        }
    }

    $api_keys = new API_Keys();

    // Generate a new key
    $plain_key = $api_keys->generate();
    $key_hash = $api_keys->hash($plain_key);

    // Store with test label
    $key_id = $api_keys->store('E2E Test Key', $key_hash);

    if ($key_id === null) {
        return [
            'success' => false,
            'error'   => 'Failed to store API key.',
        ];
    }

    return [
        'success' => true,
        'message' => 'Test API key generated successfully.',
        'api_key' => $plain_key,
        'key_id'  => $key_id,
    ];
}

// If included via WP-CLI, the function returns above
// If running directly, show usage
if (php_sapi_name() === 'cli' && !defined('WP_CLI')) {
    echo "Note: This script must be run via WP-CLI or with WordPress bootstrap.\n";
}
