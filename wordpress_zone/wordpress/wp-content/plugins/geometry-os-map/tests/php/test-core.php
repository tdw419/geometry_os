<?php
/**
 * Unit tests for Geometry_OS_Map_Core class
 *
 * Run with: php tests/php/test-core.php
 *
 * @package Geometry_OS_Map
 */

// Define ABSPATH for WordPress mock
if (!defined('ABSPATH')) {
    define('ABSPATH', '/tmp/');
}

// Mock WordPress functions for standalone testing
if (!function_exists('get_option')) {
    function get_option($key, $default = false) {
        global $mock_options;
        return isset($mock_options[$key]) ? $mock_options[$key] : $default;
    }
}

if (!function_exists('update_option')) {
    function update_option($key, $value) {
        global $mock_options;
        $mock_options[$key] = $value;
        return true;
    }
}

if (!function_exists('apply_filters')) {
    function apply_filters($tag, $value, ...$args) {
        global $mock_filters;
        if (isset($mock_filters[$tag])) {
            return call_user_func($mock_filters[$tag], $value);
        }
        return $value;
    }
}

if (!function_exists('esc_attr')) {
    function esc_attr($text) {
        return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    }
}

if (!function_exists('esc_html')) {
    function esc_html($text) {
        return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    }
}

if (!function_exists('esc_js')) {
    function esc_js($text) {
        return addslashes($text);
    }
}

if (!function_exists('esc_url')) {
    function esc_url($url) {
        return filter_var($url, FILTER_SANITIZE_URL);
    }
}

if (!function_exists('shortcode_atts')) {
    function shortcode_atts($defaults, $atts, $shortcode = '') {
        $atts = (array) $atts;
        return array_merge($defaults, array_intersect_key($atts, $defaults));
    }
}

if (!function_exists('wp_enqueue_script')) {
    function wp_enqueue_script($handle, $src = '', $deps = [], $ver = false, $in_footer = false) {
        return true;
    }
}

if (!function_exists('uniqid')) {
    // PHP's uniqid exists, this is just documentation
}

// Initialize mock state
global $mock_options, $mock_filters;
$mock_options = [];
$mock_filters = [];

/**
 * Simple test runner
 */
class TestRunner {
    private $passed = 0;
    private $failed = 0;
    private $errors = [];

    public function assert($condition, $message) {
        if ($condition) {
            $this->passed++;
            echo "✅ PASS: {$message}\n";
        } else {
            $this->failed++;
            $this->errors[] = $message;
            echo "❌ FAIL: {$message}\n";
        }
    }

    public function assertEqual($expected, $actual, $message) {
        $this->assert($expected === $actual, "{$message} (expected: " . var_export($expected, true) . ", got: " . var_export($actual, true) . ")");
    }

    public function assertContains($needle, $haystack, $message) {
        $this->assert(strpos($haystack, $needle) !== false, "{$message} (expected to contain: {$needle})");
    }

    public function assertNotEqual($expected, $actual, $message) {
        $this->assert($expected !== $actual, "{$message} (should not be equal)");
    }

    public function summary() {
        echo "\n" . str_repeat('=', 50) . "\n";
        echo "Results: {$this->passed} passed, {$this->failed} failed\n";
        if ($this->failed > 0) {
            echo "\nFailed tests:\n";
            foreach ($this->errors as $error) {
                echo "  - {$error}\n";
            }
        }
        echo str_repeat('=', 50) . "\n";
        return $this->failed === 0 ? 0 : 1;
    }
}

// Load the Core class
require_once dirname(__DIR__, 2) . '/includes/class-core.php';

// Reset singleton for testing
function reset_core_singleton() {
    $reflection = new ReflectionClass('Geometry_OS_Map_Core');
    $property = $reflection->getProperty('instance');
    $property->setAccessible(true);
    $property->setValue(null, null);
}

// Run tests
$test = new TestRunner();

echo "\n" . str_repeat('=', 50) . "\n";
echo "Geometry OS Map - Core Class Unit Tests\n";
echo str_repeat('=', 50) . "\n\n";

// ============================================
// Test 1: Default settings
// ============================================
echo "Test Group: Default Settings\n";
reset_core_singleton();
global $mock_options;
$mock_options = [];

$core = Geometry_OS_Map_Core::get_instance();
$test->assertEqual('http://localhost:8000', $core->get_asset_base(), 'Asset base returns default');
$test->assertEqual('100%', $core->get_setting('default_width'), 'Default width is 100%');
$test->assertEqual('600px', $core->get_setting('default_height'), 'Default height is 600px');
$test->assertEqual('dark', $core->get_setting('default_theme'), 'Default theme is dark');

// ============================================
// Test 2: Settings from options
// ============================================
echo "\nTest Group: Settings from Options\n";
reset_core_singleton();
$mock_options = [
    'geometry_os_map_asset_base' => 'https://cdn.example.com',
    'geometry_os_map_default_width' => '80%',
    'geometry_os_map_default_height' => '800px',
    'geometry_os_map_default_theme' => 'light',
];

$core = Geometry_OS_Map_Core::get_instance();
$test->assertEqual('https://cdn.example.com', $core->get_asset_base(), 'Asset base from option');
$test->assertEqual('80%', $core->get_setting('default_width'), 'Width from option');
$test->assertEqual('800px', $core->get_setting('default_height'), 'Height from option');
$test->assertEqual('light', $core->get_setting('default_theme'), 'Theme from option');

// ============================================
// Test 3: Filter overrides option
// ============================================
echo "\nTest Group: Filter Overrides\n";
reset_core_singleton();
$mock_options = [
    'geometry_os_map_asset_base' => 'https://option.example.com',
];
$mock_filters = [
    'geometry_os_asset_base_url' => function($value) {
        return 'https://filter.example.com';
    }
];

$core = Geometry_OS_Map_Core::get_instance();
$test->assertEqual('https://filter.example.com', $core->get_asset_base(), 'Filter overrides option');

// Clear filter
$mock_filters = [];

// ============================================
// Test 4: Render container outputs HTML
// ============================================
echo "\nTest Group: Container Rendering\n";
reset_core_singleton();
$mock_options = [];

$core = Geometry_OS_Map_Core::get_instance();
$html = $core->render_container(['height' => '500px']);

$test->assertContains('geometry-os-map-', $html, 'Output contains container ID prefix');
$test->assertContains('height: 500px', $html, 'Output contains custom height');
$test->assertContains('BOOTING GEOMETRY KERNEL', $html, 'Output contains loading message');
$test->assertContains('GeometryOSApplication', $html, 'Output contains app initialization');

// ============================================
// Test 5: Unique container IDs
// ============================================
echo "\nTest Group: Unique Container IDs\n";
reset_core_singleton();

$core = Geometry_OS_Map_Core::get_instance();
$html1 = $core->render_container([]);
$html2 = $core->render_container([]);

preg_match('/id="(geometry-os-map-[^"]+)"/', $html1, $m1);
preg_match('/id="(geometry-os-map-[^"]+)"/', $html2, $m2);

$test->assertNotEqual($m1[1], $m2[1], 'Each container has unique ID');

// ============================================
// Test 6: Fullscreen mode
// ============================================
echo "\nTest Group: Fullscreen Mode\n";
reset_core_singleton();

$core = Geometry_OS_Map_Core::get_instance();
$html = $core->render_container(['fullscreen' => 'true']);

$test->assertContains('position: fixed', $html, 'Fullscreen has fixed position');
$test->assertContains('100vw', $html, 'Fullscreen has 100vw width');
$test->assertContains('100vh', $html, 'Fullscreen has 100vh height');
$test->assertContains('z-index: 9999', $html, 'Fullscreen has high z-index');

// ============================================
// Test 7: Mode parameter
// ============================================
echo "\nTest Group: Mode Parameter\n";
reset_core_singleton();

$core = Geometry_OS_Map_Core::get_instance();
$html = $core->render_container(['mode' => 'desktop']);

$test->assertContains('mode=desktop', $html, 'Mode parameter in output');

// ============================================
// Summary
// ============================================
exit($test->summary());
