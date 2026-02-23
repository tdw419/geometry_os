<?php
/**
 * Plugin Name: Geometry OS Daemons
 * Plugin URI: https://geometry.os/daemons
 * Description: Dashboard for monitoring and managing Geometry OS daemon processes
 * Version: 1.0.0
 * Author: Geometry OS Team
 * Author URI: https://geometry.os
 * License: MIT
 * Text Domain: geometry-os-daemons
 * Domain Path: /languages
 *
 * @package Geometry_OS_Daemons
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Main Geometry OS Daemons Plugin Class
 *
 * Handles plugin initialization, menu registration, and AJAX handlers
 * for monitoring and controlling Geometry OS daemon processes.
 *
 * @since 1.0.0
 */
class Geometry_OS_Daemons
{
    /**
     * Plugin version
     *
     * @var string
     */
    const VERSION = '1.0.0';

    /**
     * Plugin directory path
     *
     * @var string
     */
    private $plugin_dir;

    /**
     * Plugin URL
     *
     * @var string
     */
    private $plugin_url;

    /**
     * Singleton instance
     *
     * @var Geometry_OS_Daemons|null
     */
    private static $instance = null;

    /**
     * Get singleton instance
     *
     * @return Geometry_OS_Daemons
     */
    public static function get_instance()
    {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Constructor
     *
     * Initialize plugin properties and register hooks.
     *
     * @since 1.0.0
     */
    private function __construct()
    {
        $this->plugin_dir = plugin_dir_path(__FILE__);
        $this->plugin_url = plugin_dir_url(__FILE__);

        $this->load_includes();
        $this->register_hooks();
    }

    /**
     * Load include files
     *
     * @since 1.0.0
     */
    private function load_includes()
    {
        // Load class files
        $includes = [
            'class-daemon-status.php',
            'class-daemon-api.php',
        ];

        foreach ($includes as $file) {
            $path = $this->plugin_dir . 'includes/' . $file;
            if (file_exists($path)) {
                require_once $path;
            }
        }
    }

    /**
     * Register WordPress hooks
     *
     * @since 1.0.0
     */
    private function register_hooks()
    {
        // Admin menu registration
        add_action('admin_menu', [$this, 'register_admin_menu']);

        // AJAX handlers
        add_action('wp_ajax_geometry_os_daemon_status', [$this, 'ajax_get_daemon_status']);
        add_action('wp_ajax_geometry_os_daemon_start', [$this, 'ajax_start_daemon']);
        add_action('wp_ajax_geometry_os_daemon_stop', [$this, 'ajax_stop_daemon']);
        add_action('wp_ajax_geometry_os_daemon_restart', [$this, 'ajax_restart_daemon']);

        // Admin scripts and styles
        add_action('admin_enqueue_scripts', [$this, 'enqueue_admin_assets']);
    }

    /**
     * Register admin menu
     *
     * Creates a top-level "Geometry OS" menu with daemons dashboard submenu.
     *
     * @since 1.0.0
     */
    public function register_admin_menu()
    {
        // Add top-level menu
        add_menu_page(
            __('Geometry OS Daemons', 'geometry-os-daemons'),
            __('Geometry OS', 'geometry-os-daemons'),
            'manage_options',
            'geometry-os-daemons',
            [$this, 'render_daemons_page'],
            $this->get_menu_icon(),
            30
        );

        // Add daemons submenu (default page)
        add_submenu_page(
            'geometry-os-daemons',
            __('Daemons Dashboard', 'geometry-os-daemons'),
            __('Daemons', 'geometry-os-daemons'),
            'manage_options',
            'geometry-os-daemons',
            [$this, 'render_daemons_page']
        );

        // Add settings submenu
        add_submenu_page(
            'geometry-os-daemons',
            __('Daemon Settings', 'geometry-os-daemons'),
            __('Settings', 'geometry-os-daemons'),
            'manage_options',
            'geometry-os-daemons-settings',
            [$this, 'render_settings_page']
        );
    }

    /**
     * Get menu icon (base64 SVG)
     *
     * @return string Base64 encoded SVG data URI
     */
    private function get_menu_icon()
    {
        // Hexagon icon representing geometry
        $svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M12 2l9 5.25v9.5L12 22l-9-5.25v-9.5L12 2z"/>
        </svg>';

        return 'data:image/svg+xml;base64,' . base64_encode($svg);
    }

    /**
     * Render daemons dashboard page
     *
     * @since 1.0.0
     */
    public function render_daemons_page()
    {
        if (!current_user_can('manage_options')) {
            wp_die(__('You do not have sufficient permissions to access this page.', 'geometry-os-daemons'));
        }

        include $this->plugin_dir . 'views/daemons-dashboard.php';
    }

    /**
     * Render settings page
     *
     * @since 1.0.0
     */
    public function render_settings_page()
    {
        if (!current_user_can('manage_options')) {
            wp_die(__('You do not have sufficient permissions to access this page.', 'geometry-os-daemons'));
        }

        include $this->plugin_dir . 'views/settings.php';
    }

    /**
     * Enqueue admin scripts and styles
     *
     * @param string $hook Current admin page hook
     */
    public function enqueue_admin_assets($hook)
    {
        // Only load on our plugin pages
        if (strpos($hook, 'geometry-os-daemons') === false) {
            return;
        }

        // Enqueue styles
        wp_enqueue_style(
            'geometry-os-daemons-admin',
            $this->plugin_url . 'assets/css/admin.css',
            [],
            self::VERSION
        );

        // Enqueue scripts
        wp_enqueue_script(
            'geometry-os-daemons-admin',
            $this->plugin_url . 'assets/js/admin.js',
            ['jquery'],
            self::VERSION,
            true
        );

        // Localize script with AJAX URL and nonce
        wp_localize_script('geometry-os-daemons-admin', 'geometryOSDaemons', [
            'ajaxUrl' => admin_url('admin-ajax.php'),
            'nonce'   => wp_create_nonce('geometry_os_daemons_nonce'),
            'i18n'    => [
                'starting'  => __('Starting...', 'geometry-os-daemons'),
                'stopping'  => __('Stopping...', 'geometry-os-daemons'),
                'restarting'=> __('Restarting...', 'geometry-os-daemons'),
                'error'     => __('Error occurred', 'geometry-os-daemons'),
                'confirmStop'=> __('Are you sure you want to stop this daemon?', 'geometry-os-daemons'),
            ],
        ]);
    }

    /**
     * AJAX handler: Get daemon status
     *
     * Returns status information for all or specific daemons.
     *
     * @since 1.0.0
     */
    public function ajax_get_daemon_status()
    {
        // Verify nonce
        check_ajax_referer('geometry_os_daemons_nonce', 'nonce');

        // Check permissions
        if (!current_user_can('manage_options')) {
            wp_send_json_error(['message' => __('Permission denied', 'geometry-os-daemons')]);
        }

        // Get specific daemon or all daemons
        $daemon_id = isset($_POST['daemon_id']) ? sanitize_text_field($_POST['daemon_id']) : null;

        try {
            $status = $this->get_daemon_status($daemon_id);
            wp_send_json_success($status);
        } catch (Exception $e) {
            wp_send_json_error(['message' => $e->getMessage()]);
        }
    }

    /**
     * AJAX handler: Start daemon
     *
     * @since 1.0.0
     */
    public function ajax_start_daemon()
    {
        check_ajax_referer('geometry_os_daemons_nonce', 'nonce');

        if (!current_user_can('manage_options')) {
            wp_send_json_error(['message' => __('Permission denied', 'geometry-os-daemons')]);
        }

        $daemon_id = isset($_POST['daemon_id']) ? sanitize_text_field($_POST['daemon_id']) : null;
        if (!$daemon_id) {
            wp_send_json_error(['message' => __('Daemon ID required', 'geometry-os-daemons')]);
        }

        try {
            $result = $this->start_daemon($daemon_id);
            wp_send_json_success($result);
        } catch (Exception $e) {
            wp_send_json_error(['message' => $e->getMessage()]);
        }
    }

    /**
     * AJAX handler: Stop daemon
     *
     * @since 1.0.0
     */
    public function ajax_stop_daemon()
    {
        check_ajax_referer('geometry_os_daemons_nonce', 'nonce');

        if (!current_user_can('manage_options')) {
            wp_send_json_error(['message' => __('Permission denied', 'geometry-os-daemons')]);
        }

        $daemon_id = isset($_POST['daemon_id']) ? sanitize_text_field($_POST['daemon_id']) : null;
        if (!$daemon_id) {
            wp_send_json_error(['message' => __('Daemon ID required', 'geometry-os-daemons')]);
        }

        try {
            $result = $this->stop_daemon($daemon_id);
            wp_send_json_success($result);
        } catch (Exception $e) {
            wp_send_json_error(['message' => $e->getMessage()]);
        }
    }

    /**
     * AJAX handler: Restart daemon
     *
     * @since 1.0.0
     */
    public function ajax_restart_daemon()
    {
        check_ajax_referer('geometry_os_daemons_nonce', 'nonce');

        if (!current_user_can('manage_options')) {
            wp_send_json_error(['message' => __('Permission denied', 'geometry-os-daemons')]);
        }

        $daemon_id = isset($_POST['daemon_id']) ? sanitize_text_field($_POST['daemon_id']) : null;
        if (!$daemon_id) {
            wp_send_json_error(['message' => __('Daemon ID required', 'geometry-os-daemons')]);
        }

        try {
            $result = $this->restart_daemon($daemon_id);
            wp_send_json_success($result);
        } catch (Exception $e) {
            wp_send_json_error(['message' => $e->getMessage()]);
        }
    }

    /**
     * Get daemon status
     *
     * @param string|null $daemon_id Specific daemon ID or null for all
     * @return array Daemon status data
     */
    private function get_daemon_status($daemon_id = null)
    {
        // Check if Daemon_Status class exists
        if (class_exists('Geometry_OS_Daemon_Status')) {
            $status_checker = new Geometry_OS_Daemon_Status();
            return $status_checker->get_status($daemon_id);
        }

        // Fallback: Return placeholder data for skeleton
        $daemons = [
            'evolution' => [
                'id'       => 'evolution',
                'name'     => __('Evolution Daemon', 'geometry-os-daemons'),
                'status'   => 'unknown',
                'uptime'   => 0,
                'cycles'   => 0,
                'pid'      => null,
            ],
            'tectonic' => [
                'id'       => 'tectonic',
                'name'     => __('Tectonic Simulator', 'geometry-os-daemons'),
                'status'   => 'unknown',
                'uptime'   => 0,
                'cycles'   => 0,
                'pid'      => null,
            ],
            'neb' => [
                'id'       => 'neb',
                'name'     => __('Neural Event Bus', 'geometry-os-daemons'),
                'status'   => 'unknown',
                'uptime'   => 0,
                'cycles'   => 0,
                'pid'      => null,
            ],
        ];

        if ($daemon_id && isset($daemons[$daemon_id])) {
            return $daemons[$daemon_id];
        }

        return ['daemons' => $daemons];
    }

    /**
     * Start a daemon
     *
     * @param string $daemon_id Daemon identifier
     * @return array Result with status
     */
    private function start_daemon($daemon_id)
    {
        // Placeholder - will be implemented with Daemon_API class
        return [
            'success' => true,
            'message' => sprintf(__('Daemon %s start command sent', 'geometry-os-daemons'), $daemon_id),
            'daemon_id' => $daemon_id,
        ];
    }

    /**
     * Stop a daemon
     *
     * @param string $daemon_id Daemon identifier
     * @return array Result with status
     */
    private function stop_daemon($daemon_id)
    {
        // Placeholder - will be implemented with Daemon_API class
        return [
            'success' => true,
            'message' => sprintf(__('Daemon %s stop command sent', 'geometry-os-daemons'), $daemon_id),
            'daemon_id' => $daemon_id,
        ];
    }

    /**
     * Restart a daemon
     *
     * @param string $daemon_id Daemon identifier
     * @return array Result with status
     */
    private function restart_daemon($daemon_id)
    {
        // Placeholder - will be implemented with Daemon_API class
        return [
            'success' => true,
            'message' => sprintf(__('Daemon %s restart command sent', 'geometry-os-daemons'), $daemon_id),
            'daemon_id' => $daemon_id,
        ];
    }

    /**
     * Get plugin directory path
     *
     * @return string
     */
    public function get_plugin_dir()
    {
        return $this->plugin_dir;
    }

    /**
     * Get plugin URL
     *
     * @return string
     */
    public function get_plugin_url()
    {
        return $this->plugin_url;
    }
}

/**
 * Initialize the plugin
 *
 * @return Geometry_OS_Daemons
 */
function geometry_os_daemons()
{
    return Geometry_OS_Daemons::get_instance();
}

// Fire it up!
geometry_os_daemons();
