<?php
/**
 * Integration tests for Geometry OS Map plugin
 *
 * Tests WordPress integration: shortcode registration, block registration,
 * settings API, and template loading.
 *
 * Run with: php tests/php/test-integration.php
 *
 * @package Geometry_OS_Map
 */

// Define ABSPATH for WordPress mock
if (!defined('ABSPATH')) {
    define('ABSPATH', '/tmp/');
}

// Mock WordPress functions for standalone testing
global $mock_options, $mock_filters, $mock_shortcodes, $mock_blocks, $mock_actions, $mock_scripts;

$mock_options = [];
$mock_filters = [];
$mock_shortcodes = [];
$mock_blocks = [];
$mock_actions = [];
$mock_scripts = [];

// WordPress function mocks
function get_option($key, $default = false) {
    global $mock_options;
    return isset($mock_options[$key]) ? $mock_options[$key] : $default;
}

function update_option($key, $value) {
    global $mock_options;
    $mock_options[$key] = $value;
    return true;
}

function apply_filters($tag, $value, ...$args) {
    global $mock_filters;
    if (isset($mock_filters[$tag])) {
        return call_user_func($mock_filters[$tag], $value);
    }
    return $value;
}

function add_filter($tag, $callback, $priority = 10, $accepted_args = 1) {
    global $mock_filters;
    $mock_filters[$tag] = $callback;
    return true;
}

function add_action($tag, $callback, $priority = 10, $accepted_args = 1) {
    global $mock_actions;
    if (!isset($mock_actions[$tag])) {
        $mock_actions[$tag] = [];
    }
    $mock_actions[$tag][] = $callback;
    return true;
}

function do_action($tag, ...$args) {
    global $mock_actions;
    if (isset($mock_actions[$tag])) {
        foreach ($mock_actions[$tag] as $callback) {
            call_user_func_array($callback, $args);
        }
    }
}

function add_shortcode($tag, $callback) {
    global $mock_shortcodes;
    $mock_shortcodes[$tag] = $callback;
    return true;
}

function do_shortcode($content, $ignore_html = false) {
    global $mock_shortcodes;

    // Simple shortcode parser
    foreach ($mock_shortcodes as $tag => $callback) {
        $pattern = '/\[' . preg_quote($tag, '/') . '([^\]]*)\]/';
        if (preg_match_all($pattern, $content, $matches, PREG_SET_ORDER)) {
            foreach ($matches as $match) {
                $full_match = $match[0];
                $atts_str = isset($match[1]) ? trim($match[1]) : '';

                // Parse attributes (simple key=value format)
                $atts = [];
                if ($atts_str) {
                    $parts = preg_split('/\s+/', $atts_str);
                    foreach ($parts as $part) {
                        if (strpos($part, '=') !== false) {
                            list($key, $val) = explode('=', $part, 2);
                            $atts[$key] = trim($val, '"\'');
                        }
                    }
                }

                $output = $callback($atts, '', $tag);
                $content = str_replace($full_match, $output, $content);
            }
        }
    }
    return $content;
}

function shortcode_atts($defaults, $atts, $shortcode = '') {
    return array_merge($defaults, (array) $atts);
}

function has_shortcode($content, $tag) {
    return strpos($content, '[' . $tag) !== false;
}

function wp_enqueue_script($handle, $src = '', $deps = [], $ver = false, $in_footer = false) {
    global $mock_scripts;
    $mock_scripts[$handle] = [
        'src' => $src,
        'deps' => $deps,
        'ver' => $ver,
        'in_footer' => $in_footer,
    ];
    return true;
}

function wp_register_script($handle, $src = '', $deps = [], $ver = false, $in_footer = false) {
    return wp_enqueue_script($handle, $src, $deps, $ver, $in_footer);
}

function wp_enqueue_style($handle, $src = '', $deps = [], $ver = false, $media = 'all') {
    return true;
}

function register_block_type($name, $args = []) {
    global $mock_blocks;
    $mock_blocks[$name] = $args;
    return true;
}

function register_setting($option_group, $option_name, $args = []) {
    return true;
}

function add_settings_section($id, $title, $callback, $page) {
    return true;
}

function add_settings_field($id, $title, $callback, $page, $section = 'default', $args = []) {
    return true;
}

function esc_attr($text) { return htmlspecialchars($text, ENT_QUOTES, 'UTF-8'); }
function esc_html($text) { return htmlspecialchars($text, ENT_QUOTES, 'UTF-8'); }
function esc_js($text) { return addslashes($text); }
function esc_url($text) { return filter_var($text, FILTER_SANITIZE_URL); }
function esc_url_raw($text) { return esc_url($text); }
function sanitize_text_field($text) { return strip_tags($text); }
function __($text, $domain = 'default') { return $text; }
function esc_html__($text, $domain = 'default') { return esc_html($text); }
function current_user_can($capability) { return true; }
function is_admin() { return isset($_ENV['IS_ADMIN']) ? $_ENV['IS_ADMIN'] : false; }
function plugin_dir_path($file) { return dirname($file) . '/'; }
function plugin_dir_url($file) { return 'http://localhost:8080/wp-content/plugins/geometry-os-map/'; }
function add_options_page($page_title, $menu_title, $capability, $menu_slug, $callback) { return true; }
function selected($selected, $current, $echo = true) { return $selected === $current ? 'selected="selected"' : ''; }
function checked($checked, $current, $echo = true) { return $checked === $current ? 'checked="checked"' : ''; }

// Define constants
define('GEOMETRY_OS_MAP_PATH', dirname(__DIR__, 2) . '/');
define('GEOMETRY_OS_MAP_URL', 'http://localhost:8080/wp-content/plugins/geometry-os-map/');

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

    public function assertArrayHasKey($key, $array, $message) {
        $this->assert(isset($array[$key]), "{$message} (key: {$key})");
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

// Load plugin classes
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-core.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-shortcode.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-block.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-settings.php';
require_once GEOMETRY_OS_MAP_PATH . 'includes/class-template.php';

// Run tests
$test = new TestRunner();

echo "\n" . str_repeat('=', 50) . "\n";
echo "Geometry OS Map - Integration Tests\n";
echo str_repeat('=', 50) . "\n\n";

// Reset state
$mock_options = [];
$mock_filters = [];
$mock_shortcodes = [];
$mock_blocks = [];

// ============================================
// Test 1: Shortcode Registration
// ============================================
echo "Test Group: Shortcode Registration\n";

$shortcode = new Geometry_OS_Map_Shortcode();
$test->assertArrayHasKey('geometry_os_map', $mock_shortcodes, 'Shortcode registered');

// ============================================
// Test 2: Shortcode Rendering
// ============================================
echo "\nTest Group: Shortcode Rendering\n";

$output = do_shortcode('[geometry_os_map height="400px"]');
$test->assertContains('geometry-os-map-', $output, 'Shortcode outputs container');
$test->assertContains('400px', $output, 'Shortcode respects height attribute');

// ============================================
// Test 3: Block Registration
// ============================================
echo "\nTest Group: Block Registration\n";

$block = new Geometry_OS_Map_Block();

// Manually call register_block since init hook won't fire in tests
$block->register_block();

$test->assertArrayHasKey('geometry-os/map', $mock_blocks, 'Block registered');

$block_args = $mock_blocks['geometry-os/map'];
$test->assertArrayHasKey('attributes', $block_args, 'Block has attributes');
$test->assertArrayHasKey('render_callback', $block_args, 'Block has render callback');

// Test block attributes
$attrs = $block_args['attributes'];
$test->assertArrayHasKey('width', $attrs, 'Block has width attribute');
$test->assertArrayHasKey('height', $attrs, 'Block has height attribute');
$test->assertArrayHasKey('fullscreen', $attrs, 'Block has fullscreen attribute');
$test->assertArrayHasKey('mode', $attrs, 'Block has mode attribute');
$test->assertArrayHasKey('theme', $attrs, 'Block has theme attribute');

// ============================================
// Test 4: Block Rendering
// ============================================
echo "\nTest Group: Block Rendering\n";

$render_callback = $block_args['render_callback'];
$output = $render_callback(['height' => '700px', 'fullscreen' => false]);
$test->assertContains('geometry-os-map-', $output, 'Block render outputs container');
$test->assertContains('700px', $output, 'Block respects height attribute');

// ============================================
// Test 5: Settings Registration
// ============================================
echo "\nTest Group: Settings Registration\n";

$_ENV['IS_ADMIN'] = true;
$settings = new Geometry_OS_Map_Settings();
$test->assert(isset($mock_actions['admin_menu']), 'Settings adds admin menu');
$test->assert(isset($mock_actions['admin_init']), 'Settings hooks admin_init');

// ============================================
// Test 6: Template Registration
// ============================================
echo "\nTest Group: Template Registration\n";

$template = new Geometry_OS_Map_Template();
$test->assert(isset($mock_filters['theme_page_templates']), 'Template adds page_templates filter');
$test->assert(isset($mock_filters['template_include']), 'Template adds template_include filter');

// ============================================
// Test 7: Scripts Enqueued on Render
// ============================================
echo "\nTest Group: Script Enqueuing\n";

$mock_scripts = [];
$block = new Geometry_OS_Map_Block();
$block->register_block();
$render_callback = $mock_blocks['geometry-os/map']['render_callback'];
$output = $render_callback(['height' => '500px']);

$test->assertArrayHasKey('pixi-v8', $mock_scripts, 'PixiJS enqueued');
$test->assertArrayHasKey('geometry-os-module-0', $mock_scripts, 'Geometry OS modules enqueued');

// Verify PixiJS source
$test->assertContains('pixijs.download', $mock_scripts['pixi-v8']['src'], 'PixiJS from CDN');

// ============================================
// Test 8: Multiple Renders with Different Configs
// ============================================
echo "\nTest Group: Multiple Renders\n";

$mock_scripts = [];
$output1 = $render_callback(['height' => '300px', 'theme' => 'dark']);
$output2 = $render_callback(['height' => '900px', 'theme' => 'light', 'fullscreen' => true]);

$test->assertContains('300px', $output1, 'First render has correct height');
$test->assertContains('position: fixed', $output2, 'Second render is fullscreen');

// ============================================
// Test 9: Default Values from Settings
// ============================================
echo "\nTest Group: Settings Defaults\n";

$mock_options = [
    'geometry_os_map_default_height' => '800px',
    'geometry_os_map_default_width' => '90%',
];

// Reset Core singleton
$reflection = new ReflectionClass('Geometry_OS_Map_Core');
$property = $reflection->getProperty('instance');
$property->setAccessible(true);
$property->setValue(null, null);

$core = Geometry_OS_Map_Core::get_instance();
$output = $core->render_container([]);

$test->assertContains('800px', $output, 'Uses default height from settings');
$test->assertContains('90%', $output, 'Uses default width from settings');

// ============================================
// Test 10: Output Escaping
// ============================================
echo "\nTest Group: Output Escaping\n";

$core = Geometry_OS_Map_Core::get_instance();
$output = $core->render_container(['height' => '"><script>alert(1)</script>"']);

// Should not contain unescaped script tag
$test->assert(strpos($output, '<script>alert') === false, 'Height value is escaped');

// ============================================
// Summary
// ============================================
exit($test->summary());
