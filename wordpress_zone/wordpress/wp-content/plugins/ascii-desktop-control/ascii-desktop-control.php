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
        add_action('init', [$this, 'register_directive_cpt']);
        add_action('add_meta_boxes_directive', [$this, 'add_directive_meta_boxes']);
        add_action('save_post_directive', [$this, 'save_directive_meta']);
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
}

// Initialize plugin
new ASCII_Desktop_Control();

// Register activation/deactivation hooks
register_activation_hook(__FILE__, [ASCII_Desktop_Control::class, 'activate']);
register_deactivation_hook(__FILE__, [ASCII_Desktop_Control::class, 'deactivate']);
