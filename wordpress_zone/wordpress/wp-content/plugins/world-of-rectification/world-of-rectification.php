<?php
/**
 * Plugin Name: World of Rectification
 * Description: Gamify Tikkun Olam - Repair the World through quests, CTRM scoring, and real-world impact
 * Version: 1.0.0
 * Author: Geometry OS
 * Requires at least: 6.0
 * Requires PHP: 8.0
 */

if (!defined('ABSPATH')) exit;

define('WOR_PATH', plugin_dir_path(__FILE__));
define('WOR_URL', plugin_dir_url(__FILE__));
define('WOR_VERSION', '1.0.0');

class World_of_Rectification {
    private static $instance = null;

    public static function get_instance(): self {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private function __construct() {
        $this->load_dependencies();
        $this->init_hooks();
    }

    private function load_dependencies(): void {
        require_once WOR_PATH . 'includes/class-wor-quest.php';
        require_once WOR_PATH . 'includes/class-wor-sefirah.php';
        require_once WOR_PATH . 'includes/class-wor-credits.php';
        require_once WOR_PATH . 'includes/class-wor-ctrm.php';
        require_once WOR_PATH . 'includes/class-wor-truth-engine.php';
        require_once WOR_PATH . 'includes/class-scribe-db.php';
        require_once WOR_PATH . 'api/class-quest-api.php';
        require_once WOR_PATH . 'api/class-player-api.php';
        require_once WOR_PATH . 'api/class-verify-api.php';
        require_once WOR_PATH . 'templates/quest-single.php';
        require_once WOR_PATH . 'templates/player-dashboard.php';
        require_once WOR_PATH . 'data/seed-scenarios.php';
    }

    private function init_hooks(): void {
        add_action('plugins_loaded', [$this, 'init']);
        add_action('rest_api_init', [$this, 'init_rest_api']);
        add_action('wp_enqueue_scripts', [$this, 'enqueue_frontend_assets']);
    }

    public function init(): void {
        WOR_Quest();
        WOR_Sefirah();
        WOR_Truth_Engine();
        do_action('wor_init');
    }

    public function init_rest_api(): void {
        new WOR_Quest_API();
        new WOR_Player_API();
        new WOR_Verify_API();
    }

    /**
     * Enqueue frontend CSS and JavaScript assets.
     */
    public function enqueue_frontend_assets(): void {
        // Only enqueue on frontend
        if (is_admin()) {
            return;
        }

        // Enqueue frontend CSS
        wp_enqueue_style(
            'wor-frontend',
            WOR_URL . 'assets/css/wor-frontend.css',
            [],
            WOR_VERSION
        );

        // Enqueue frontend JS
        wp_enqueue_script(
            'wor-game',
            WOR_URL . 'assets/js/wor-game.js',
            ['jquery'],
            WOR_VERSION,
            true
        );

        // Localize script with data
        wp_localize_script('wor-game', 'worData', [
            'restUrl' => rest_url('wor/v1'),
            'nonce' => wp_create_nonce('wp_rest'),
            'isLoggedIn' => is_user_logged_in(),
            'userId' => get_current_user_id(),
            'ajaxUrl' => admin_url('admin-ajax.php'),
        ]);

        // Add inline CSS variables for theming
        wp_add_inline_style('wor-frontend', '
            :root {
                --wor-primary: #667eea;
                --wor-primary-dark: #764ba2;
                --wor-success: #10b981;
                --wor-warning: #f97316;
                --wor-text: #1e293b;
                --wor-text-muted: #64748b;
                --wor-bg: #f8fafc;
                --wor-border: #e2e8f0;
            }
        ');
    }
}

function WOR(): World_of_Rectification {
    return World_of_Rectification::get_instance();
}

WOR();

/**
 * Activation hook - seed initial scenarios and create scribe tables
 */
register_activation_hook(__FILE__, function() {
    // Ensure post types are registered first
    WOR_Quest();

    // Seed scenarios
    require_once WOR_PATH . 'data/seed-scenarios.php';
    $created = WoR_SeedScenarios::run();

    // Create Scribe Protocol database tables
    require_once WOR_PATH . 'includes/class-scribe-db.php';
    WOR_Scribe_DB::create_tables();

    // Log activation
    error_log("World of Rectification activated. Created $created scenarios.");
});
