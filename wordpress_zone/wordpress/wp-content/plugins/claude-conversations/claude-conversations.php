<?php
/**
 * Plugin Name: Claude Conversations
 * Description: Import Claude Code CLI conversations from ~/.claude/projects/ into WordPress as formatted posts with syntax highlighting
 * Version: 1.0.0
 * Author: Geometry OS
 *
 * This plugin imports Claude Code CLI conversation sessions (JSONL format)
 * into WordPress posts with:
 * - User and assistant message formatting
 * - Thinking block extraction and display
 * - Prism.js syntax highlighting for code blocks
 * - Session metadata preservation (project, branch, timestamps)
 *
 * "Every conversation is a learning artifact worth preserving."
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

class Claude_Conversations_Admin {

    /**
     * Initialize the plugin
     */
    public function __construct() {
        add_action('admin_menu', array($this, 'add_menu'));
    }

    /**
     * Add admin menu page
     */
    public function add_menu() {
        add_menu_page(
            'Claude Chats',
            'Claude Chats',
            'manage_options',
            'claude-conversations',
            array($this, 'render_page'),
            'dashicons-format-chat',
            30
        );
    }

    /**
     * Render the admin page
     */
    public function render_page() {
        ?>
        <div class="wrap">
            <h1>Claude Conversations Importer</h1>

            <div class="card" style="max-width: 800px; margin-top: 20px;">
                <h2>Status</h2>
                <p>Import Claude Code CLI conversations into WordPress posts.</p>

                <table class="form-table">
                    <tr>
                        <th scope="row">Claude Directory</th>
                        <td><code>~/.claude/projects/</code></td>
                    </tr>
                    <tr>
                        <th scope="row">Session Count</th>
                        <td>Not yet scanned</td>
                    </tr>
                    <tr>
                        <th scope="row">Imported Count</th>
                        <td>0</td>
                    </tr>
                </table>

                <h3>Actions</h3>
                <p>Import actions will be available after parser implementation.</p>

                <p class="description">
                    Plugin skeleton active. Use "Test Parse" and "Import All" once parser is implemented.
                </p>
            </div>
        </div>
        <?php
    }
}

// Initialize the plugin
new Claude_Conversations_Admin();
