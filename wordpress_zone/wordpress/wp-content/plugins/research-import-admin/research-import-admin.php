<?php
/**
 * Plugin Name: Research Import Admin
 * Description: Admin interface for importing research documents into WordPress for AI semantic search access
 * Version: 1.0.0
 * Author: Geometry OS
 *
 * This plugin provides an admin UI under Tools for managing research document imports:
 * - Manual import triggers
 * - Import progress tracking
 * - Document status overview
 *
 * @package Research_Import_Admin
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Research_Import_Admin
 *
 * Main admin class for the Research Import plugin.
 */
class Research_Import_Admin {

    /**
     * Initialize the plugin
     */
    public function __construct() {
        add_action('admin_menu', array($this, 'add_menu'));
    }

    /**
     * Add admin menu page under Tools
     */
    public function add_menu() {
        add_submenu_page(
            'tools.php',
            'Research Import',
            'Research Import',
            'manage_options',
            'research-import-admin',
            array($this, 'render_page')
        );
    }

    /**
     * Render the admin page
     */
    public function render_page() {
        ?>
        <div class="wrap">
            <h1>Research Document Import</h1>
            <p>Import research documents from /home/jericho/zion/docs/research into WordPress for AI semantic search access.</p>
        </div>
        <?php
    }
}

// Initialize the plugin
new Research_Import_Admin();
