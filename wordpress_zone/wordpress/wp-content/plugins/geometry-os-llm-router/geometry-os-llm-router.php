<?php
/**
 * Plugin Name: Geometry OS LLM Router
 * Plugin URI: https://geometry.os/llm-router
 * Description: Management dashboard for the hybrid LLM proxy with health monitoring, token tracking, and analytics
 * Version: 1.0.0
 * Author: Geometry OS Team
 * Author URI: https://geometry.os
 * License: MIT
 * Text Domain: geometry-os-llm-router
 * Domain Path: /languages
 *
 * @package Geometry_OS_LLM_Router
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Main Geometry OS LLM Router Plugin Class
 *
 * Handles plugin initialization, menu registration, and AJAX handlers
 * for monitoring the hybrid LLM proxy service.
 *
 * @since 1.0.0
 */
class Geometry_OS_LLM_Router
{
    /**
     * Plugin version
     *
     * @var string
     */
    const VERSION = '1.0.0';

    /**
     * Proxy default port
     *
     * @var int
     */
    const PROXY_PORT = 4000;

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
     * @var Geometry_OS_LLM_Router|null
     */
    private static $instance = null;

    /**
     * Get singleton instance
     *
     * @return Geometry_OS_LLM_Router
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
        $includes = [
            'class-proxy-status.php',
            'class-token-tracker.php',
            'class-fallback-logger.php',
            'class-model-selector.php',
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
        // Admin menu registration - add to existing Geometry OS menu
        add_action('admin_menu', [$this, 'register_admin_menu']);

        // AJAX handlers
        add_action('wp_ajax_geometry_os_router_status', [$this, 'ajax_get_router_status']);
        add_action('wp_ajax_geometry_os_router_analytics', [$this, 'ajax_get_analytics']);
        add_action('wp_ajax_geometry_os_router_models', [$this, 'ajax_get_models']);
        add_action('wp_ajax_geometry_os_router_set_model', [$this, 'ajax_set_model']);

        // Admin scripts and styles
        add_action('admin_enqueue_scripts', [$this, 'enqueue_admin_assets']);

        // Plugin activation/deactivation
        register_activation_hook(__FILE__, [$this, 'activate']);
        register_deactivation_hook(__FILE__, [$this, 'deactivate']);
    }

    /**
     * Plugin activation
     *
     * @since 1.0.0
     */
    public function activate()
    {
        // Create database table
        if (class_exists('Geometry_OS_Token_Tracker')) {
            $tracker = new Geometry_OS_Token_Tracker();
            $tracker->create_table();
        }

        // Set default options
        add_option('geometry_os_llm_router_port', self::PROXY_PORT);
        add_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514');
        add_option('geometry_os_llm_router_fallback_model', 'lm-studio-local');
        add_option('geometry_os_llm_router_fallback_enabled', true);
    }

    /**
     * Plugin deactivation
     *
     * @since 1.0.0
     */
    public function deactivate()
    {
        // Clean up scheduled events
        wp_clear_scheduled_hook('geometry_os_llm_prune_usage_logs');
    }

    /**
     * Register admin menu
     *
     * Adds submenu items under the existing "Geometry OS" menu.
     *
     * @since 1.0.0
     */
    public function register_admin_menu()
    {
        // Add LLM Router submenu to Geometry OS menu
        add_submenu_page(
            'geometry-os-daemons',
            __('LLM Router Dashboard', 'geometry-os-llm-router'),
            __('LLM Router', 'geometry-os-llm-router'),
            'manage_options',
            'geometry-os-llm-router',
            [$this, 'render_router_page']
        );

        // Add Analytics submenu
        add_submenu_page(
            'geometry-os-daemons',
            __('LLM Analytics', 'geometry-os-llm-router'),
            __('Analytics', 'geometry-os-llm-router'),
            'manage_options',
            'geometry-os-llm-analytics',
            [$this, 'render_analytics_page']
        );

        // Add Settings submenu
        add_submenu_page(
            'geometry-os-daemons',
            __('LLM Router Settings', 'geometry-os-llm-router'),
            __('Router Settings', 'geometry-os-llm-router'),
            'manage_options',
            'geometry-os-llm-settings',
            [$this, 'render_settings_page']
        );
    }

    /**
     * Render router dashboard page
     *
     * @since 1.0.0
     */
    public function render_router_page()
    {
        if (!current_user_can('manage_options')) {
            wp_die(__('You do not have sufficient permissions to access this page.', 'geometry-os-llm-router'));
        }

        include $this->plugin_dir . 'admin/page-router.php';
    }

    /**
     * Render analytics page
     *
     * @since 1.0.0
     */
    public function render_analytics_page()
    {
        if (!current_user_can('manage_options')) {
            wp_die(__('You do not have sufficient permissions to access this page.', 'geometry-os-llm-router'));
        }

        include $this->plugin_dir . 'admin/page-analytics.php';
    }

    /**
     * Render settings page
     *
     * @since 1.0.0
     */
    public function render_settings_page()
    {
        if (!current_user_can('manage_options')) {
            wp_die(__('You do not have sufficient permissions to access this page.', 'geometry-os-llm-router'));
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
        if (strpos($hook, 'geometry-os-llm') === false) {
            return;
        }

        // Enqueue styles
        wp_enqueue_style(
            'geometry-os-llm-router-admin',
            $this->plugin_url . 'assets/css/admin.css',
            [],
            self::VERSION
        );

        // Enqueue scripts
        wp_enqueue_script(
            'geometry-os-llm-router-monitor',
            $this->plugin_url . 'assets/js/router-monitor.js',
            ['jquery'],
            self::VERSION,
            true
        );

        // Enqueue Chart.js for analytics page
        if (strpos($hook, 'geometry-os-llm-analytics') !== false) {
            wp_enqueue_script(
                'chart-js',
                'https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js',
                [],
                '4.4.0',
                true
            );
            wp_enqueue_script(
                'geometry-os-llm-router-analytics',
                $this->plugin_url . 'assets/js/analytics.js',
                ['jquery', 'chart-js'],
                self::VERSION,
                true
            );
        }

        // Localize script with AJAX URL and nonce
        wp_localize_script('geometry-os-llm-router-monitor', 'geometryOSLLMRouter', [
            'ajaxUrl'   => admin_url('admin-ajax.php'),
            'nonce'     => wp_create_nonce('geometry_os_llm_router_nonce'),
            'proxyPort' => get_option('geometry_os_llm_router_port', self::PROXY_PORT),
            'i18n'      => [
                'refreshing' => __('Refreshing...', 'geometry-os-llm-router'),
                'error'      => __('Error occurred', 'geometry-os-llm-router'),
                'online'     => __('Online', 'geometry-os-llm-router'),
                'offline'    => __('Offline', 'geometry-os-llm-router'),
            ],
        ]);
    }

    /**
     * AJAX handler: Get router status
     *
     * @since 1.0.0
     */
    public function ajax_get_router_status()
    {
        try {
            check_ajax_referer('geometry_os_llm_router_nonce', 'nonce');

            if (!current_user_can('manage_options')) {
                wp_send_json_error([
                    'message' => __('Permission denied', 'geometry-os-llm-router'),
                    'code'    => 'permission_denied',
                ]);
                return;
            }

            $status = $this->get_router_status();

            if (is_wp_error($status)) {
                wp_send_json_error([
                    'message' => $status->get_error_message(),
                    'code'    => $status->get_error_code(),
                ]);
                return;
            }

            wp_send_json_success($status);

        } catch (\Exception $e) {
            $this->log_error('ajax_get_router_status', $e->getMessage());

            wp_send_json_error([
                'message' => __('An error occurred while fetching router status', 'geometry-os-llm-router'),
                'code'    => 'internal_error',
                'debug'   => (defined('WP_DEBUG') && WP_DEBUG) ? $e->getMessage() : null,
            ]);
        }
    }

    /**
     * AJAX handler: Get analytics data
     *
     * @since 1.0.0
     */
    public function ajax_get_analytics()
    {
        try {
            check_ajax_referer('geometry_os_llm_router_nonce', 'nonce');

            if (!current_user_can('manage_options')) {
                wp_send_json_error([
                    'message' => __('Permission denied', 'geometry-os-llm-router'),
                    'code'    => 'permission_denied',
                ]);
                return;
            }

            $period = isset($_POST['period']) ? sanitize_text_field($_POST['period']) : '24h';

            $analytics = $this->get_analytics($period);

            wp_send_json_success($analytics);

        } catch (\Exception $e) {
            $this->log_error('ajax_get_analytics', $e->getMessage());

            wp_send_json_error([
                'message' => __('An error occurred while fetching analytics', 'geometry-os-llm-router'),
                'code'    => 'internal_error',
            ]);
        }
    }

    /**
     * AJAX handler: Get available models
     *
     * @since 1.0.0
     */
    public function ajax_get_models()
    {
        try {
            check_ajax_referer('geometry_os_llm_router_nonce', 'nonce');

            if (!current_user_can('manage_options')) {
                wp_send_json_error([
                    'message' => __('Permission denied', 'geometry-os-llm-router'),
                    'code'    => 'permission_denied',
                ]);
                return;
            }

            $models = $this->get_available_models();

            wp_send_json_success($models);

        } catch (\Exception $e) {
            $this->log_error('ajax_get_models', $e->getMessage());

            wp_send_json_error([
                'message' => __('An error occurred while fetching models', 'geometry-os-llm-router'),
                'code'    => 'internal_error',
            ]);
        }
    }

    /**
     * AJAX handler: Set active model
     *
     * @since 1.0.0
     */
    public function ajax_set_model()
    {
        try {
            check_ajax_referer('geometry_os_llm_router_nonce', 'nonce');

            if (!current_user_can('manage_options')) {
                wp_send_json_error([
                    'message' => __('Permission denied', 'geometry-os-llm-router'),
                    'code'    => 'permission_denied',
                ]);
                return;
            }

            $model = isset($_POST['model']) ? sanitize_text_field($_POST['model']) : null;
            $type = isset($_POST['type']) ? sanitize_text_field($_POST['type']) : 'primary';

            if (!$model) {
                wp_send_json_error([
                    'message' => __('Model name required', 'geometry-os-llm-router'),
                    'code'    => 'missing_model',
                ]);
                return;
            }

            $result = $this->set_model($model, $type);

            wp_send_json_success($result);

        } catch (\Exception $e) {
            $this->log_error('ajax_set_model', $e->getMessage());

            wp_send_json_error([
                'message' => __('An error occurred while setting model', 'geometry-os-llm-router'),
                'code'    => 'internal_error',
            ]);
        }
    }

    /**
     * Get router status
     *
     * @return array Router status data
     */
    private function get_router_status()
    {
        $port = get_option('geometry_os_llm_router_port', self::PROXY_PORT);

        $status = [
            'proxy' => [
                'status'    => 'unknown',
                'port'      => $port,
                'url'       => "http://localhost:{$port}",
            ],
            'claude' => [
                'status'    => 'unknown',
                'model'     => get_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514'),
            ],
            'lm_studio' => [
                'status'    => 'unknown',
                'model'     => get_option('geometry_os_llm_router_fallback_model', 'lm-studio-local'),
            ],
            'fallback' => [
                'enabled'   => (bool) get_option('geometry_os_llm_router_fallback_enabled', true),
                'today'     => 0,
                'week'      => 0,
            ],
            'tokens' => [
                'hour'      => 0,
                'day'       => 0,
                'week'      => 0,
            ],
        ];

        // Check proxy status
        if (class_exists('Geometry_OS_Proxy_Status')) {
            $proxy_status = new Geometry_OS_Proxy_Status($port);
            $status['proxy']['status'] = $proxy_status->check() ? 'online' : 'offline';
        }

        // Check Claude API
        $claude_key = get_option('geometry_os_claude_api_key', '');
        if (!empty($claude_key)) {
            $status['claude']['status'] = 'configured';
        }

        // Check LM Studio
        $status['lm_studio']['status'] = 'available';

        // Get fallback stats
        if (class_exists('Geometry_OS_Fallback_Logger')) {
            $logger = new Geometry_OS_Fallback_Logger();
            $status['fallback']['today'] = $logger->get_count_today();
            $status['fallback']['week'] = $logger->get_count_week();
        }

        // Get token usage
        if (class_exists('Geometry_OS_Token_Tracker')) {
            $tracker = new Geometry_OS_Token_Tracker();
            $status['tokens']['hour'] = $tracker->get_usage_current_hour();
            $status['tokens']['day'] = $tracker->get_usage_today();
            $status['tokens']['week'] = $tracker->get_usage_week();
        }

        return $status;
    }

    /**
     * Get analytics data
     *
     * @param string $period Time period (24h, 7d, 30d)
     * @return array Analytics data
     */
    private function get_analytics($period = '24h')
    {
        if (!class_exists('Geometry_OS_Token_Tracker')) {
            return ['error' => 'Token tracker not available'];
        }

        $tracker = new Geometry_OS_Token_Tracker();

        $periods = [
            '24h' => 24 * HOUR_IN_SECONDS,
            '7d'  => 7 * DAY_IN_SECONDS,
            '30d' => 30 * DAY_IN_SECONDS,
        ];

        $seconds = $periods[$period] ?? $periods['24h'];

        return [
            'period'        => $period,
            'total_requests' => $tracker->get_request_count($seconds),
            'total_tokens'  => $tracker->get_token_usage($seconds),
            'by_model'      => $tracker->get_usage_by_model($seconds),
            'by_hour'       => $tracker->get_usage_by_hour($seconds),
            'fallback_rate' => $tracker->get_fallback_rate($seconds),
        ];
    }

    /**
     * Get available models
     *
     * @return array List of available models
     */
    private function get_available_models()
    {
        $claude_models = [
            'claude-opus-4-20250514' => 'Claude Opus 4',
            'claude-sonnet-4-20250514' => 'Claude Sonnet 4',
            'claude-haiku-4-20250514' => 'Claude Haiku 4',
        ];

        $local_models = [
            'lm-studio-local' => 'LM Studio (Local)',
            'ollama-local' => 'Ollama (Local)',
        ];

        return [
            'claude' => $claude_models,
            'local'  => $local_models,
            'current' => [
                'primary'  => get_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514'),
                'fallback' => get_option('geometry_os_llm_router_fallback_model', 'lm-studio-local'),
            ],
        ];
    }

    /**
     * Set active model
     *
     * @param string $model Model identifier
     * @param string $type Model type (primary or fallback)
     * @return array Result
     */
    private function set_model($model, $type = 'primary')
    {
        $option = $type === 'fallback'
            ? 'geometry_os_llm_router_fallback_model'
            : 'geometry_os_llm_router_primary_model';

        update_option($option, $model);

        return [
            'success' => true,
            'model'   => $model,
            'type'    => $type,
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

    /**
     * Log error for debugging
     *
     * @param string $context Context where error occurred
     * @param string $message Error message
     * @return void
     */
    private function log_error($context, $message)
    {
        if (defined('WP_DEBUG') && WP_DEBUG) {
            error_log(sprintf(
                'Geometry OS LLM Router [%s]: %s',
                $context,
                $message
            ));
        }
    }
}

/**
 * Initialize the plugin
 *
 * @return Geometry_OS_LLM_Router
 */
function geometry_os_llm_router()
{
    return Geometry_OS_LLM_Router::get_instance();
}

// Fire it up!
geometry_os_llm_router();
