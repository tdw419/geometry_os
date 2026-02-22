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
     * Daemon_Status instance.
     */
    private ?Daemon_Status $daemon_status = null;

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
        add_action('init', [$this, 'register_directive_cpt']);
        add_action('add_meta_boxes_directive', [$this, 'add_directive_meta_boxes']);
        add_action('save_post_directive', [$this, 'save_directive_meta']);

        // AJAX handlers
        add_action('wp_ajax_ascii_get_view', [$this, 'ajax_get_view']);
        add_action('wp_ajax_ascii_post_directive', [$this, 'ajax_post_directive']);
        add_action('wp_ajax_ascii_get_directives', [$this, 'ajax_get_directives']);
        add_action('wp_ajax_ascii_get_logs', [$this, 'ajax_get_logs']);
        add_action('wp_ajax_ascii_daemon_status', [$this, 'ajax_daemon_status']);

        // Admin bar quick link
        add_action('admin_bar_menu', [$this, 'add_admin_bar_link'], 31);
    }

    /**
     * Load include files.
     */
    private function load_includes(): void {
        require_once $this->plugin_dir . 'includes/class-ascii-view.php';
        require_once $this->plugin_dir . 'includes/class-directive-api.php';
        require_once $this->plugin_dir . 'includes/class-daemon-status.php';
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
     * Get Daemon_Status instance.
     */
    public function get_daemon_status(): Daemon_Status {
        if ($this->daemon_status === null) {
            $this->daemon_status = new Daemon_Status();
        }
        return $this->daemon_status;
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

        // Logs submenu under ASCII Control toplevel
        add_submenu_page(
            'ascii-desktop-control',
            __('Directive Logs', 'ascii-desktop-control'),
            __('Logs', 'ascii-desktop-control'),
            'manage_options',
            'ascii-desktop-control-logs',
            [$this, 'render_logs_page']
        );

        // Settings submenu under WordPress Settings menu
        add_options_page(
            __('ASCII Desktop Control Settings', 'ascii-desktop-control'),
            __('ASCII Control', 'ascii-desktop-control'),
            'manage_options',
            'ascii-desktop-control-settings',
            [$this, 'render_settings_page']
        );
    }

    /**
     * Admin init callback.
     */
    public function admin_init(): void {
        $this->register_settings();
    }

    /**
     * Register plugin settings via WordPress Settings API.
     */
    public function register_settings(): void {
        // Register setting group
        register_setting('ascii_desktop_control_settings', 'ascii_polling_interval', [
            'type' => 'integer',
            'description' => __('Polling interval in seconds for ASCII view refresh', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_polling_interval'],
            'default' => 2,
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_grid_width', [
            'type' => 'integer',
            'description' => __('Width of ASCII grid in characters', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_grid_width'],
            'default' => 120,
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_grid_height', [
            'type' => 'integer',
            'description' => __('Height of ASCII grid in characters', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_grid_height'],
            'default' => 40,
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_llm_endpoint', [
            'type' => 'string',
            'description' => __('LLM API endpoint URL', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_llm_endpoint'],
            'default' => 'http://localhost:11434/api/generate',
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_llm_model', [
            'type' => 'string',
            'description' => __('LLM model name for directive processing', 'ascii-desktop-control'),
            'sanitize_callback' => 'sanitize_text_field',
            'default' => 'llama3.2',
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_log_retention_days', [
            'type' => 'integer',
            'description' => __('Number of days to retain directive logs', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_log_retention_days'],
            'default' => 30,
        ]);

        register_setting('ascii_desktop_control_settings', 'ascii_daemon_enabled', [
            'type' => 'boolean',
            'description' => __('Whether the daemon is enabled', 'ascii-desktop-control'),
            'sanitize_callback' => [$this, 'sanitize_daemon_enabled'],
            'default' => false,
        ]);
    }

    /**
     * Sanitize polling interval (1-60 seconds).
     *
     * @param mixed $value Input value.
     * @return int Sanitized value.
     */
    public function sanitize_polling_interval($value): int {
        $int_value = (int) $value;
        return max(1, min(60, $int_value));
    }

    /**
     * Sanitize grid width (40-200 characters).
     *
     * @param mixed $value Input value.
     * @return int Sanitized value.
     */
    public function sanitize_grid_width($value): int {
        $int_value = (int) $value;
        return max(40, min(200, $int_value));
    }

    /**
     * Sanitize grid height (10-60 characters).
     *
     * @param mixed $value Input value.
     * @return int Sanitized value.
     */
    public function sanitize_grid_height($value): int {
        $int_value = (int) $value;
        return max(10, min(60, $int_value));
    }

    /**
     * Sanitize LLM endpoint URL.
     *
     * @param mixed $value Input value.
     * @return string Sanitized URL or empty string.
     */
    public function sanitize_llm_endpoint($value): string {
        $url = esc_url_raw($value);
        // Allow empty or valid HTTP/HTTPS URLs
        if (empty($url) || preg_match('/^https?:\/\//', $url)) {
            return $url;
        }
        return '';
    }

    /**
     * Sanitize log retention days (1-365).
     *
     * @param mixed $value Input value.
     * @return int Sanitized value.
     */
    public function sanitize_log_retention_days($value): int {
        $int_value = (int) $value;
        return max(1, min(365, $int_value));
    }

    /**
     * Sanitize daemon enabled flag.
     *
     * @param mixed $value Input value.
     * @return bool Sanitized boolean.
     */
    public function sanitize_daemon_enabled($value): bool {
        return !empty($value);
    }

    /**
     * Render control page.
     */
    public function render_control_page(): void {
        include $this->plugin_dir . 'admin/page-control.php';
    }

    /**
     * Render logs page (placeholder for now).
     */
    public function render_logs_page(): void {
        echo '<div class="wrap"><h1>' . esc_html__('Directive Logs', 'ascii-desktop-control') . '</h1>';
        echo '<p>' . esc_html__('Logs page will be implemented in Phase 2.', 'ascii-desktop-control') . '</p>';
        echo '</div>';
    }

    /**
     * Render settings page (placeholder for now).
     */
    public function render_settings_page(): void {
        echo '<div class="wrap"><h1>' . esc_html__('ASCII Desktop Control Settings', 'ascii-desktop-control') . '</h1>';
        echo '<p>' . esc_html__('Settings page will be implemented in Phase 2.', 'ascii-desktop-control') . '</p>';
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
     * Add admin bar quick link with daemon status indicator.
     *
     * @param WP_Admin_Bar $admin_bar Admin bar instance.
     */
    public function add_admin_bar_link(\WP_Admin_Bar $admin_bar): void {
        // Only show for users with manage_options capability
        if (!current_user_can('manage_options')) {
            return;
        }

        // Get daemon status for indicator
        $daemon_status = $this->get_daemon_status();
        $status = $daemon_status->get_status();

        // Green dot for running, red dot for stopped
        $indicator = $status['running']
            ? '<span style="color: #46b450; margin-right: 4px;">&#9679;</span>'
            : '<span style="color: #dc3232; margin-right: 4px;">&#9679;</span>';

        // Add node after site name (priority 31 places it after site-name at 30)
        $admin_bar->add_node(['id' => 'ascii-desktop-control',
            'title'  => $indicator . __('ASCII Control', 'ascii-desktop-control'),
            'href'   => admin_url('admin.php?page=ascii-desktop-control'),
            'meta'   => [
                'title' => $status['running']
                    ? __('ASCII Control - Daemon Running', 'ascii-desktop-control')
                    : __('ASCII Control - Daemon Stopped', 'ascii-desktop-control'),
            ],
            'parent' => false, // Top level, positioned after site name by priority
        ]);
    }

    /**
     * Plugin activation hook.
     *
     * - Flushes rewrite rules for directive CPT
     * - Sets default option values if not exists
     */
    public static function activate(): void {
        // Register CPT first to ensure rewrite rules are set correctly
        // Note: This requires the class to be instantiated temporarily
        $instance = new self();

        // Flush rewrite rules for directive CPT
        flush_rewrite_rules();

        // Set default option values if not exists
        $defaults = [
            'ascii_polling_interval'   => 2,
            'ascii_grid_width'         => 120,
            'ascii_grid_height'        => 40,
            'ascii_llm_endpoint'       => 'http://localhost:11434/api/generate',
            'ascii_llm_model'          => 'llama3.2',
            'ascii_log_retention_days' => 30,
            'ascii_daemon_enabled'     => false,
        ];

        foreach ($defaults as $option_name => $default_value) {
            if (get_option($option_name) === false) {
                add_option($option_name, $default_value);
            }
        }
    }

    /**
     * Plugin deactivation hook.
     *
     * - Flushes rewrite rules
     * - Clears plugin transients
     */
    public static function deactivate(): void {
        // Flush rewrite rules
        flush_rewrite_rules();

        // Clear plugin transients
        self::clear_transients();
    }

    /**
     * Clear all plugin transients.
     */
    private static function clear_transients(): void {
        // Clear daemon status cache
        delete_transient('ascii_daemon_status');

        // Clear rate limit transients for all users (best effort)
        // Note: We can't know all user IDs, so we clear the current user's rate limit
        // Other rate limits will expire naturally after 1 second
        $current_user_id = get_current_user_id();
        if ($current_user_id) {
            delete_transient('ascii_rate_limit_' . $current_user_id);
        }
    }

    /**
     * Register the directive custom post type.
     */
    public function register_directive_cpt(): void {
        $labels = [
            'name'               => __('Directives', 'ascii-desktop-control'),
            'singular_name'      => __('Directive', 'ascii-desktop-control'),
            'add_new'            => __('Add New', 'ascii-desktop-control'),
            'add_new_item'       => __('Add New Directive', 'ascii-desktop-control'),
            'edit_item'          => __('Edit Directive', 'ascii-desktop-control'),
            'new_item'           => __('New Directive', 'ascii-desktop-control'),
            'view_item'          => __('View Directive', 'ascii-desktop-control'),
            'search_items'       => __('Search Directives', 'ascii-desktop-control'),
            'not_found'          => __('No directives found', 'ascii-desktop-control'),
            'not_found_in_trash' => __('No directives found in trash', 'ascii-desktop-control'),
            'menu_name'          => __('Directives', 'ascii-desktop-control'),
        ];

        $args = [
            'labels'              => $labels,
            'public'              => false,
            'publicly_queryable'  => false,
            'show_ui'             => true,
            'show_in_menu'        => true,
            'query_var'           => false,
            'rewrite'             => false,
            'capability_type'     => 'post',
            'has_archive'         => false,
            'hierarchical'        => false,
            'menu_position'       => null,
            'menu_icon'           => 'dashicons-megaphone',
            'supports'            => ['title', 'content', 'author'],
            'show_in_rest'        => false,
        ];

        register_post_type('directive', $args);
    }

    /**
     * Add meta boxes for directive CPT.
     */
    public function add_directive_meta_boxes(): void {
        add_meta_box(
            'directive_status_meta',
            __('Directive Status', 'ascii-desktop-control'),
            [$this, 'render_directive_status_meta_box'],
            'directive',
            'side',
            'high'
        );
    }

    /**
     * Render the directive status meta box.
     *
     * @param WP_Post $post Current post object.
     */
    public function render_directive_status_meta_box(\WP_Post $post): void {
        wp_nonce_field('directive_status_nonce', 'directive_status_nonce');

        $status = get_post_meta($post->ID, 'directive_status', true);
        if (empty($status)) {
            $status = 'pending';
        }

        $statuses = [
            'pending'    => __('Pending', 'ascii-desktop-control'),
            'processing' => __('Processing', 'ascii-desktop-control'),
            'completed'  => __('Completed', 'ascii-desktop-control'),
            'failed'     => __('Failed', 'ascii-desktop-control'),
        ];

        echo '<p>';
        echo '<label for="directive_status"><strong>' . esc_html__('Status:', 'ascii-desktop-control') . '</strong></label><br>';
        echo '<select name="directive_status" id="directive_status" style="width: 100%;">';
        foreach ($statuses as $value => $label) {
            printf(
                '<option value="%s" %s>%s</option>',
                esc_attr($value),
                selected($status, $value, false),
                esc_html($label)
            );
        }
        echo '</select>';
        echo '</p>';

        $result = get_post_meta($post->ID, 'directive_result', true);
        echo '<p>';
        echo '<label for="directive_result"><strong>' . esc_html__('Result:', 'ascii-desktop-control') . '</strong></label><br>';
        echo '<textarea name="directive_result" id="directive_result" rows="5" style="width: 100%;">' . esc_textarea($result) . '</textarea>';
        echo '</p>';
    }

    /**
     * Save directive meta data.
     *
     * @param int $post_id Post ID.
     */
    public function save_directive_meta(int $post_id): void {
        // Verify nonce
        if (!isset($_POST['directive_status_nonce']) ||
            !wp_verify_nonce($_POST['directive_status_nonce'], 'directive_status_nonce')) {
            return;
        }

        // Check autosave
        if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
            return;
        }

        // Check permissions
        if (!current_user_can('edit_post', $post_id)) {
            return;
        }

        // Save directive_status
        if (isset($_POST['directive_status'])) {
            $allowed_statuses = ['pending', 'processing', 'completed', 'failed'];
            $status = sanitize_text_field(wp_unslash($_POST['directive_status']));
            if (in_array($status, $allowed_statuses, true)) {
                update_post_meta($post_id, 'directive_status', $status);
            }
        }

        // Save directive_result
        if (isset($_POST['directive_result'])) {
            $result = sanitize_textarea_field(wp_unslash($_POST['directive_result']));
            update_post_meta($post_id, 'directive_result', $result);
        }
    }

    // =========================================================================
    // AJAX HANDLERS
    // =========================================================================

    /**
     * AJAX handler: Get ASCII view.
     *
     * Calls ASCII_View->get_view() and returns JSON response.
     * Rate limited to 1 request per second per user.
     */
    public function ajax_get_view(): void {
        // Verify nonce
        check_ajax_referer('ascii_control_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'ascii-desktop-control'),
            ], 403);
        }

        // Rate limit check: 1 request per second per user
        $user_id = get_current_user_id();
        $rate_limit_key = 'ascii_rate_limit_' . $user_id;
        $rate_limited = get_transient($rate_limit_key);

        if ($rate_limited !== false) {
            // Rate limit exceeded - send 429 status
            header('X-RateLimit-Limit: 1');
            header('X-RateLimit-Remaining: 0');
            header('X-RateLimit-Reset: 1');
            wp_send_json_error([
                'message' => __('Rate limit exceeded. Please wait before requesting again.', 'ascii-desktop-control'),
                'code'    => 'rate_limit_exceeded',
            ], 429);
        }

        // Set rate limit transient (1 second TTL)
        set_transient($rate_limit_key, time(), 1);

        // Add rate limit headers to response
        header('X-RateLimit-Limit: 1');
        header('X-RateLimit-Remaining: 0');
        header('X-RateLimit-Reset: 1');

        // Get optional width/height parameters
        $width = isset($_POST['width']) ? (int) $_POST['width'] : null;
        $height = isset($_POST['height']) ? (int) $_POST['height'] : null;

        // Get ASCII view
        $ascii_view = $this->get_ascii_view();
        $result = $ascii_view->get_view($width, $height);

        if ($result['success']) {
            wp_send_json_success([
                'ascii'    => $result['ascii'],
                'bindings' => $result['bindings'],
                'mode'     => $result['mode'],
                'timestamp' => $result['timestamp'],
            ]);
        } else {
            wp_send_json_error([
                'message' => $result['error'],
            ]);
        }
    }

    /**
     * AJAX handler: Post a new directive.
     *
     * Calls Directive_API->create() and returns JSON response.
     */
    public function ajax_post_directive(): void {
        // Verify nonce
        check_ajax_referer('ascii_control_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'ascii-desktop-control'),
            ], 403);
        }

        // Get title and content from request
        $title = isset($_POST['title']) ? sanitize_text_field(wp_unslash($_POST['title'])) : '';
        $content = isset($_POST['content']) ? sanitize_textarea_field(wp_unslash($_POST['content'])) : '';

        // Create directive
        $directive_api = $this->get_directive_api();
        $result = $directive_api->create($title, $content);

        if ($result['success']) {
            wp_send_json_success([
                'post_id' => $result['post_id'],
                'message' => $result['message'],
            ]);
        } else {
            wp_send_json_error([
                'message'     => $result['error'],
                'is_duplicate' => $result['is_duplicate'] ?? false,
            ]);
        }
    }

    /**
     * AJAX handler: Get recent directives.
     *
     * Calls Directive_API->get_recent() and returns JSON response.
     */
    public function ajax_get_directives(): void {
        // Verify nonce
        check_ajax_referer('ascii_control_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'ascii-desktop-control'),
            ], 403);
        }

        // Get optional limit parameter
        $limit = isset($_POST['limit']) ? (int) $_POST['limit'] : 10;
        $limit = max(1, min(100, $limit));

        // Get directives
        $directive_api = $this->get_directive_api();
        $result = $directive_api->get_recent($limit);

        wp_send_json_success([
            'directives' => $result['directives'],
            'total'      => $result['total'],
            'count'      => $result['count'],
        ]);
    }

    /**
     * AJAX handler: Get directive logs with filtering.
     *
     * Calls Directive_API->get_logs() and returns JSON response.
     */
    public function ajax_get_logs(): void {
        // Verify nonce
        check_ajax_referer('ascii_control_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'ascii-desktop-control'),
            ], 403);
        }

        // Build filters from request
        $filters = [
            'status'    => isset($_POST['status']) ? sanitize_text_field(wp_unslash($_POST['status'])) : '',
            'date_from' => isset($_POST['date_from']) ? sanitize_text_field(wp_unslash($_POST['date_from'])) : '',
            'date_to'   => isset($_POST['date_to']) ? sanitize_text_field(wp_unslash($_POST['date_to'])) : '',
            'search'    => isset($_POST['search']) ? sanitize_text_field(wp_unslash($_POST['search'])) : '',
            'page'      => isset($_POST['page']) ? (int) $_POST['page'] : 1,
            'per_page'  => isset($_POST['per_page']) ? (int) $_POST['per_page'] : 20,
        ];

        // Get logs
        $directive_api = $this->get_directive_api();
        $result = $directive_api->get_logs($filters);

        wp_send_json_success([
            'logs'        => $result['logs'],
            'total'       => $result['total'],
            'page'        => $result['page'],
            'per_page'    => $result['per_page'],
            'total_pages' => $result['total_pages'],
        ]);
    }

    /**
     * AJAX handler: Get daemon status.
     *
     * Calls Daemon_Status->get_status() and returns JSON response.
     */
    public function ajax_daemon_status(): void {
        // Verify nonce
        check_ajax_referer('ascii_control_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error([
                'message' => __('Permission denied', 'ascii-desktop-control'),
            ], 403);
        }

        // Check for force refresh parameter
        $force_check = isset($_POST['force']) && $_POST['force'] === 'true';

        // Get daemon status
        $daemon_status = $this->get_daemon_status();
        $result = $daemon_status->get_status($force_check);

        wp_send_json_success([
            'running'      => $result['running'],
            'last_check'   => $result['last_check'],
            'pid'          => $result['pid'],
            'process_name' => $result['process_name'],
        ]);
    }
}

// Initialize plugin
new ASCII_Desktop_Control();

// Register activation/deactivation hooks
register_activation_hook(__FILE__, [ASCII_Desktop_Control::class, 'activate']);
register_deactivation_hook(__FILE__, [ASCII_Desktop_Control::class, 'deactivate']);
