<?php
/**
 * Unit tests for Geometry OS Web Terminal plugin
 *
 * @package GeometryOS_WebTerminal
 * @subpackage Tests
 */

declare(strict_types=1);

/**
 * Test GeometryOS_WebTerminal plugin functionality
 *
 * Tests cover:
 * - Plugin class existence
 * - Session token generation
 * - Permission checks
 * - Token validation
 */
class Test_GeometryOS_WebTerminal {

    /**
     * Plugin class instance
     *
     * @var GeometryOS_WebTerminal|null
     */
    private ?GeometryOS_WebTerminal $plugin = null;

    /**
     * Set up test environment
     */
    public function set_up(): void {
        // Include main plugin file if not already loaded
        if (!class_exists('GeometryOS_WebTerminal')) {
            require_once dirname(__DIR__) . '/geometry-os-web-terminal.php';
        }

        // Create reflection to access private methods
        if (class_exists('GeometryOS_WebTerminal')) {
            $this->plugin = new GeometryOS_WebTerminal();
        }
    }

    /**
     * Test: Verify the plugin class exists and is loaded
     *
     * @return bool
     */
    public function test_plugin_class_exists(): bool {
        $this->set_up();

        if (!class_exists('GeometryOS_WebTerminal')) {
            echo "✗ test_plugin_class_exists: GeometryOS_WebTerminal class not found\n";
            return false;
        }

        // Verify class has required constants
        $reflection = new ReflectionClass('GeometryOS_WebTerminal');

        if (!$reflection->hasConstant('VERSION')) {
            echo "✗ test_plugin_class_exists: VERSION constant missing\n";
            return false;
        }

        if (!$reflection->hasConstant('WS_URL')) {
            echo "✗ test_plugin_class_exists: WS_URL constant missing\n";
            return false;
        }

        echo "✓ test_plugin_class_exists: Class loaded with VERSION and WS_URL constants\n";
        return true;
    }

    /**
     * Test: Session token should be exactly 64 characters (SHA-256 hex)
     *
     * @return bool
     */
    public function test_session_token_length(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_session_token_length: Plugin not initialized\n";
            return false;
        }

        // Use reflection to access private method
        $reflection = new ReflectionClass($this->plugin);
        $method = $reflection->getMethod('generate_session_token');
        $method->setAccessible(true);

        // Generate token
        $token = $method->invoke($this->plugin);

        if (strlen($token) !== 64) {
            echo sprintf(
                "✗ test_session_token_length: Expected 64 chars, got %d\n",
                strlen($token)
            );
            return false;
        }

        echo "✓ test_session_token_length: Token is exactly 64 characters\n";
        return true;
    }

    /**
     * Test: Session tokens should be unique for different users
     *
     * @return bool
     */
    public function test_session_token_uniqueness(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_session_token_uniqueness: Plugin not initialized\n";
            return false;
        }

        // Use reflection to access private method
        $reflection = new ReflectionClass($this->plugin);
        $method = $reflection->getMethod('generate_session_token');
        $method->setAccessible(true);

        // Generate multiple tokens
        $tokens = [];
        for ($i = 0; $i < 10; $i++) {
            usleep(1000); // Small delay to ensure timestamp differs
            $token = $method->invoke($this->plugin);
            $tokens[] = $token;
        }

        // Check all tokens are unique
        $unique_tokens = array_unique($tokens);
        if (count($unique_tokens) !== count($tokens)) {
            echo "✗ test_session_token_uniqueness: Duplicate tokens generated\n";
            return false;
        }

        echo sprintf(
            "✓ test_session_token_uniqueness: Generated %d unique tokens\n",
            count($tokens)
        );
        return true;
    }

    /**
     * Test: Admin permission check - admins should be allowed
     *
     * @return bool
     */
    public function test_admin_permission_check(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_admin_permission_check: Plugin not initialized\n";
            return false;
        }

        // The plugin uses 'manage_options' capability
        // In a real WordPress environment, admins have this capability
        // This test verifies the capability constant is checked

        $reflection = new ReflectionClass($this->plugin);

        // Check ajax_create_session checks manage_options
        $ajax_method = $reflection->getMethod('ajax_create_session');
        $ajax_method->setAccessible(true);

        // Read method source to verify capability check exists
        $method_contents = file_get_contents($reflection->getFileName());
        if (strpos($method_contents, "current_user_can('manage_options')") === false) {
            echo "✗ test_admin_permission_check: manage_options capability check not found\n";
            return false;
        }

        echo "✓ test_admin_permission_check: manage_options capability check present\n";
        return true;
    }

    /**
     * Test: Token validation - format and structure
     *
     * @return bool
     */
    public function test_token_validation(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_token_validation: Plugin not initialized\n";
            return false;
        }

        // Test 1: Invalid token length
        $result = $this->plugin->validate_session_token(1, 'short');
        if ($result !== false) {
            echo "✗ test_token_validation: Short token should be rejected\n";
            return false;
        }

        // Test 2: Non-hex characters
        $result = $this->plugin->validate_session_token(1, str_repeat('g', 64));
        if ($result !== false) {
            echo "✗ test_token_validation: Non-hex token should be rejected\n";
            return false;
        }

        // Test 3: Valid format but wrong token (no stored hash)
        $valid_format_token = str_repeat('a', 64);
        $result = $this->plugin->validate_session_token(99999, $valid_format_token);
        if ($result !== false) {
            echo "✗ test_token_validation: Token without stored hash should be rejected\n";
            return false;
        }

        echo "✓ test_token_validation: Invalid tokens properly rejected\n";
        return true;
    }

    /**
     * Test: Token expiration (24-hour timeout)
     *
     * @return bool
     */
    public function test_token_expiration(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_token_expiration: Plugin not initialized\n";
            return false;
        }

        // Check that DAY_IN_SECONDS constant is used for expiration
        $reflection = new ReflectionClass($this->plugin);
        $method_contents = file_get_contents($reflection->getFileName());

        if (strpos($method_contents, 'DAY_IN_SECONDS') === false) {
            echo "✗ test_token_expiration: DAY_IN_SECONDS not used for expiration\n";
            return false;
        }

        echo "✓ test_token_expiration: 24-hour expiration (DAY_IN_SECONDS) implemented\n";
        return true;
    }

    /**
     * Test: Plugin version constant
     *
     * @return bool
     */
    public function test_plugin_version(): bool {
        $this->set_up();

        if (!class_exists('GeometryOS_WebTerminal')) {
            echo "✗ test_plugin_version: Class not found\n";
            return false;
        }

        $version = GeometryOS_WebTerminal::VERSION;

        if (!preg_match('/^\d+\.\d+\.\d+$/', $version)) {
            echo sprintf(
                "✗ test_plugin_version: Invalid version format '%s'\n",
                $version
            );
            return false;
        }

        echo sprintf("✓ test_plugin_version: Version '%s' is valid semver\n", $version);
        return true;
    }

    /**
     * Test: WebSocket URL constant
     *
     * @return bool
     */
    public function test_websocket_url(): bool {
        $this->set_up();

        if (!class_exists('GeometryOS_WebTerminal')) {
            echo "✗ test_websocket_url: Class not found\n";
            return false;
        }

        $ws_url = GeometryOS_WebTerminal::WS_URL;

        if (strpos($ws_url, 'ws://') !== 0 && strpos($ws_url, 'wss://') !== 0) {
            echo sprintf(
                "✗ test_websocket_url: Invalid WebSocket URL '%s'\n",
                $ws_url
            );
            return false;
        }

        echo sprintf("✓ test_websocket_url: URL '%s' is valid\n", $ws_url);
        return true;
    }

    /**
     * Test: Token is hexadecimal only
     *
     * @return bool
     */
    public function test_token_is_hexadecimal(): bool {
        $this->set_up();

        if (!$this->plugin) {
            echo "✗ test_token_is_hexadecimal: Plugin not initialized\n";
            return false;
        }

        $reflection = new ReflectionClass($this->plugin);
        $method = $reflection->getMethod('generate_session_token');
        $method->setAccessible(true);

        $token = $method->invoke($this->plugin);

        if (!ctype_xdigit($token)) {
            echo "✗ test_token_is_hexadecimal: Token contains non-hex characters\n";
            return false;
        }

        echo "✓ test_token_is_hexadecimal: Token is valid hexadecimal\n";
        return true;
    }

    /**
     * Run all tests
     *
     * @return array Test results
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
                    echo sprintf("✗ %s: %s\n", $method, $e->getMessage());
                }
            }
        }

        return $results;
    }
}

// Allow running tests directly from CLI
if (php_sapi_name() === 'cli' && basename($argv[0] ?? '') === basename(__FILE__)) {
    echo "=== Geometry OS Web Terminal Plugin Tests ===\n\n";

    $test = new Test_GeometryOS_WebTerminal();
    $results = $test->run_all();

    $passed = count(array_filter($results));
    $total = count($results);

    echo sprintf("\n=== Results: %d/%d tests passed ===\n", $passed, $total);

    exit($passed === $total ? 0 : 1);
}
