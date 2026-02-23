<?php
/**
 * Plugin Name: Geometry OS Web Terminal
 * Plugin URI: https://geometry.os/plugins/geometry-os-web-terminal
 * Description: Browser-based terminal interface for Geometry OS with xterm.js integration.
 * Version: 1.0.0
 * Author: Geometry OS
 * Author URI: https://geometry.os
 * License: MIT
 * Text Domain: geometry-os-web-terminal
 * Requires at least: 6.0
 * Requires PHP: 8.0
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Main plugin class for Geometry OS Web Terminal.
 */
class GeometryOS_WebTerminal {

    /**
     * Plugin version.
     */
    public const VERSION = '1.0.0';

    /**
     * Visual Bridge WebSocket URL.
     */
    public const WS_URL = 'ws://localhost:8768';

    /**
     * Plugin directory path.
     */
    private string $plugin_dir;

    /**
     * Plugin URL.
     */
    private string $plugin_url;

    /**
     * Constructor. Initialize hooks.
     */
    public function __construct() {
        $this->plugin_dir = plugin_dir_path(__FILE__);
        $this->plugin_url = plugin_dir_url(__FILE__);

        // Register hooks
        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_assets']);

        // AJAX handlers
        add_action('wp_ajax_goterminal_create_session', [$this, 'ajax_create_session']);
        add_action('wp_ajax_goterminal_destroy_session', [$this, 'ajax_destroy_session']);
    }

    /**
     * Register admin menu pages.
     */
    public function add_menu(): void {
        add_menu_page(
            __('GO Terminal', 'geometry-os-web-terminal'),
            __('GO Terminal', 'geometry-os-web-terminal'),
            'manage_options',
            'geometry-os-web-terminal',
            [$this, 'render_terminal_page'],
            'dashicons-terminal',
            31
        );
    }

    /**
     * Render terminal page.
     */
    public function render_terminal_page(): void {
        $session_token = $this->generate_session_token();
        ?>
        <div class="wrap goterminal-wrap">
            <h1 class="goterminal-title">
                <span class="dashicons dashicons-terminal"></span>
                <?php esc_html_e('Geometry OS Terminal', 'geometry-os-web-terminal'); ?>
            </h1>

            <div class="goterminal-status-bar">
                <div class="goterminal-connection-status">
                    <span class="goterminal-status-dot" id="goterminal-status-dot"></span>
                    <span id="goterminal-status-text"><?php esc_html_e('Connecting...', 'geometry-os-web-terminal'); ?></span>
                </div>
                <div class="goterminal-session-info">
                    <span class="goterminal-label"><?php esc_html_e('Session:', 'geometry-os-web-terminal'); ?></span>
                    <code id="goterminal-session-id"><?php echo esc_html(substr($session_token, 0, 8)); ?></code>
                </div>
            </div>

            <div class="goterminal-container">
                <div id="goterminal-terminal"></div>
            </div>

            <div class="goterminal-info-bar">
                <p class="description">
                    <?php esc_html_e('Web terminal connected to Geometry OS Visual Bridge. Type commands and press Enter to execute.', 'geometry-os-web-terminal'); ?>
                </p>
            </div>
        </div>

        <input type="hidden" id="goterminal-session-token" value="<?php echo esc_attr($session_token); ?>">
        <?php
    }

    /**
     * Enqueue admin assets only on plugin pages.
     *
     * @param string $hook Current admin page hook.
     */
    public function enqueue_assets(string $hook): void {
        // Only load on our plugin pages
        if (strpos($hook, 'geometry-os-web-terminal') === false) {
            return;
        }

        // Enqueue xterm.js from CDN
        wp_enqueue_style(
            'xterm-css',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/css/xterm.css',
            [],
            '5.3.0'
        );

        wp_enqueue_script(
            'xterm-js',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/lib/xterm.min.js',
            [],
            '5.3.0',
            true
        );

        // Enqueue xterm.js addons
        wp_enqueue_script(
            'xterm-fit',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/addons-fit/lib/xterm-addon-fit.min.js',
            ['xterm-js'],
            '5.3.0',
            true
        );

        wp_enqueue_script(
            'xterm-web-links',
            'https://cdn.jsdelivr.net/npm/xterm@5.3.0/addons-web-links/lib/xterm-addon-web-links.min.js',
            ['xterm-js'],
            '5.3.0',
            true
        );

        // Enqueue plugin styles
        wp_enqueue_style(
            'geometry-os-web-terminal',
            $this->plugin_url . 'assets/css/terminal.css',
            ['xterm-css'],
            self::VERSION
        );

        // Enqueue plugin script
        wp_enqueue_script(
            'geometry-os-web-terminal',
            $this->plugin_url . 'assets/js/terminal.js',
            ['xterm-js', 'xterm-fit', 'xterm-web-links'],
            self::VERSION,
            true
        );

        // Localize script with data
        wp_localize_script('geometry-os-web-terminal', 'GOTerminal', [
            'ajaxurl' => admin_url('admin-ajax.php'),
            'nonce' => wp_create_nonce('goterminal_nonce'),
            'wsUrl' => self::WS_URL,
            'sessionToken' => $this->generate_session_token(),
        ]);
    }

    /**
     * Generate a secure session token using WordPress patterns.
     *
     * Uses wp_generate_uuid4() combined with user ID and timestamp,
     * then hashed with SHA-256 for a 64-character hex output.
     * Token hash is stored in user meta for validation.
     *
     * @return string 64-character hex token.
     */
    private function generate_session_token(): string {
        $user_id = get_current_user_id();
        $timestamp = time();
        $uuid = wp_generate_uuid4();

        // Combine entropy sources for uniqueness
        $token_data = sprintf(
            '%d:%d:%s:%s',
            $user_id,
            $timestamp,
            $uuid,
            wp_salt('auth')
        );

        // Generate 64-char hex token
        $token = hash('sha256', $token_data);

        // Store hash in user meta for validation
        $this->store_token_hash($user_id, $token);

        return $token;
    }

    /**
     * Store token hash in user meta for validation.
     *
     * @param int    $user_id User ID.
     * @param string $token   Session token.
     */
    private function store_token_hash(int $user_id, string $token): void {
        $hash = hash('sha256', $token . wp_salt('secure_auth'));
        update_user_meta($user_id, 'goterminal_session_hash', $hash);
        update_user_meta($user_id, 'goterminal_session_time', time());
    }

    /**
     * Validate a session token against stored hash.
     *
     * @param int    $user_id User ID.
     * @param string $token   Session token to validate.
     * @return bool True if valid, false otherwise.
     */
    public function validate_session_token(int $user_id, string $token): bool {
        if (strlen($token) !== 64 || !ctype_xdigit($token)) {
            return false;
        }

        $stored_hash = get_user_meta($user_id, 'goterminal_session_hash', true);
        $session_time = (int) get_user_meta($user_id, 'goterminal_session_time', true);

        // Sessions expire after 24 hours
        if (time() - $session_time > DAY_IN_SECONDS) {
            $this->clear_session($user_id);
            return false;
        }

        $expected_hash = hash('sha256', $token . wp_salt('secure_auth'));

        return hash_equals($expected_hash, $stored_hash);
    }

    /**
     * Clear session data for a user.
     *
     * @param int $user_id User ID.
     */
    private function clear_session(int $user_id): void {
        delete_user_meta($user_id, 'goterminal_session_hash');
        delete_user_meta($user_id, 'goterminal_session_time');
    }

    /**
     * AJAX handler: Create a terminal session.
     */
    public function ajax_create_session(): void {
        // Verify nonce
        check_ajax_referer('goterminal_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'geometry-os-web-terminal'),
            ], 403);
        }

        // Generate new session token
        $token = $this->generate_session_token();

        wp_send_json_success([
            'token' => $token,
            'wsUrl' => self::WS_URL . '/terminal?token=' . $token,
        ]);
    }

    /**
     * AJAX handler: Destroy a terminal session.
     */
    public function ajax_destroy_session(): void {
        // Verify nonce
        check_ajax_referer('goterminal_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'geometry-os-web-terminal'),
            ], 403);
        }

        // Session destruction is handled by Visual Bridge
        wp_send_json_success([
            'message' => __('Session destroyed', 'geometry-os-web-terminal'),
        ]);
    }

    /**
     * Plugin activation hook.
     */
    public static function activate(): void {
        // No special activation logic needed
    }

    /**
     * Plugin deactivation hook.
     */
    public static function deactivate(): void {
        // No special deactivation logic needed
    }
}

// Initialize plugin
new GeometryOS_WebTerminal();

// Register activation/deactivation hooks
register_activation_hook(__FILE__, [GeometryOS_WebTerminal::class, 'activate']);
register_deactivation_hook(__FILE__, [GeometryOS_WebTerminal::class, 'deactivate']);
