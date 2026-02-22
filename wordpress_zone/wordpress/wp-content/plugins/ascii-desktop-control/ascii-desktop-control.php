<?php
/**
 * Plugin Name: ASCII Desktop Control
 * Plugin URI: https://geometry.os/plugins/ascii-desktop-control
 * Description: Real-time ASCII visualization of desktop with directive posting for AI agent control.
 * Version: 1.0.0
 * Author: Geometry OS
 * Author URI: https://geometry.os
 * License: MIT
 * Text Domain: ascii-desktop-control
 * Requires at least: 6.0
 * Requires PHP: 8.0
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Main plugin class for ASCII Desktop Control.
 */
class ASCII_Desktop_Control {

    /**
     * Plugin version.
     */
    public const VERSION = '1.0.0';

    /**
     * Plugin directory path.
     */
    private string $plugin_dir;

    /**
     * Plugin URL.
     */
    private string $plugin_url;

    /**
     * ASCII_View instance.
     */
    private ?ASCII_View $ascii_view = null;

    /**
     * Directive_API instance.
     */
    private ?Directive_API $directive_api = null;

    /**
     * Constructor. Initialize hooks.
     */
    public function __construct() {
        $this->plugin_dir = plugin_dir_path(__FILE__);
        $this->plugin_url = plugin_dir_url(__FILE__);

        // Load includes
        $this->load_includes();

        // Register hooks
        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_init', [$this, 'admin_init']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_assets']);
    }

    /**
     * Load include files.
     */
    private function load_includes(): void {
        require_once $this->plugin_dir . 'includes/class-ascii-view.php';
        require_once $this->plugin_dir . 'includes/class-directive-api.php';
    }

    /**
     * Get ASCII_View instance.
     */
    public function get_ascii_view(): ASCII_View {
        if ($this->ascii_view === null) {
            $this->ascii_view = new ASCII_View();
        }
        return $this->ascii_view;
    }

    /**
     * Get Directive_API instance.
     */
    public function get_directive_api(): Directive_API {
        if ($this->directive_api === null) {
            $this->directive_api = new Directive_API();
        }
        return $this->directive_api;
    }

    /**
     * Register admin menu pages.
     */
    public function add_menu(): void {
        // Main control page (toplevel)
        add_menu_page(
            __('ASCII Control', 'ascii-desktop-control'),
            __('ASCII Control', 'ascii-desktop-control'),
            'manage_options',
            'ascii-desktop-control',
            [$this, 'render_control_page'],
            'dashicons-desktop',
            30
        );
    }

    /**
     * Admin init callback.
     */
    public function admin_init(): void {
        // Settings registration will be added in later tasks
    }

    /**
     * Render control page (placeholder for now).
     */
    public function render_control_page(): void {
        echo '<div class="wrap"><h1>ASCII Desktop Control</h1>';
        echo '<p>Control page will be implemented in Phase 2.</p>';
        echo '</div>';
    }

    /**
     * Enqueue admin assets only on plugin pages.
     *
     * @param string $hook Current admin page hook.
     */
    public function enqueue_assets(string $hook): void {
        // Only load on our plugin pages
        if (strpos($hook, 'ascii-desktop-control') === false) {
            return;
        }

        wp_enqueue_style(
            'ascii-desktop-control-admin',
            $this->plugin_url . 'assets/css/admin.css',
            [],
            self::VERSION
        );

        wp_enqueue_script(
            'ascii-desktop-control',
            $this->plugin_url . 'assets/js/control.js',
            ['jquery'],
            self::VERSION,
            true
        );

        wp_localize_script('ascii-desktop-control', 'asciiControl', [
            'ajaxurl' => admin_url('admin-ajax.php'),
            'nonce' => wp_create_nonce('ascii_control_nonce'),
        ]);
    }

    /**
     * Plugin activation hook.
     */
    public static function activate(): void {
        // Flush rewrite rules for CPT (will be added in later tasks)
        flush_rewrite_rules();
    }

    /**
     * Plugin deactivation hook.
     */
    public static function deactivate(): void {
        flush_rewrite_rules();
    }
}

// Initialize plugin
new ASCII_Desktop_Control();

// Register activation/deactivation hooks
register_activation_hook(__FILE__, [ASCII_Desktop_Control::class, 'activate']);
register_deactivation_hook(__FILE__, [ASCII_Desktop_Control::class, 'deactivate']);
