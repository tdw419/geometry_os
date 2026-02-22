<?php
/**
 * Control Page Template
 *
 * Main dashboard for ASCII Desktop Control plugin.
 * Displays ASCII grid, directive posting form, queue, and daemon status.
 *
 * @package ASCII_Desktop_Control
 * @since 1.0.0
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}
?>
<div class="wrap ascii-control-wrap">
    <h1 class="ascii-control-title">
        <span class="dashicons dashicons-desktop"></span>
        <?php echo esc_html__('ASCII Desktop Control', 'ascii-desktop-control'); ?>
    </h1>

    <!-- Daemon Status Section -->
    <div class="ascii-section daemon-status" id="daemon-status">
        <h2>
            <span class="dashicons dashicons-admin-generic"></span>
            <?php echo esc_html__('Daemon Status', 'ascii-desktop-control'); ?>
        </h2>
        <div class="daemon-status-content">
            <span class="daemon-indicator" id="daemon-indicator">
                <span class="daemon-dot daemon-dot-unknown"></span>
                <span class="daemon-label"><?php echo esc_html__('Checking...', 'ascii-desktop-control'); ?></span>
            </span>
            <span class="daemon-pid" id="daemon-pid"></span>
            <button type="button" class="button daemon-refresh" id="daemon-refresh">
                <span class="dashicons dashicons-update"></span>
                <?php echo esc_html__('Refresh', 'ascii-desktop-control'); ?>
            </button>
        </div>
    </div>

    <!-- Main Content Grid -->
    <div class="ascii-main-grid">
        <!-- ASCII View Section -->
        <div class="ascii-section ascii-view-section">
            <h2>
                <span class="dashicons dashicons-visibility"></span>
                <?php echo esc_html__('Desktop View', 'ascii-desktop-control'); ?>
            </h2>
            <div class="ascii-grid-container">
                <pre class="ascii-grid" id="ascii-grid"><?php
                    // Placeholder ASCII art
                    echo esc_html(str_repeat(". \n", 10));
                ?></pre>
                <div class="ascii-grid-overlay" id="ascii-grid-overlay">
                    <!-- Clickable bindings rendered via JS -->
                </div>
            </div>
            <div class="ascii-view-controls">
                <button type="button" class="button button-primary" id="ascii-poll-toggle">
                    <span class="dashicons dashicons-controls-play"></span>
                    <?php echo esc_html__('Start Polling', 'ascii-desktop-control'); ?>
                </button>
                <span class="ascii-poll-status" id="ascii-poll-status">
                    <?php echo esc_html__('Polling stopped', 'ascii-desktop-control'); ?>
                </span>
                <span class="ascii-last-update" id="ascii-last-update"></span>
            </div>
        </div>

        <!-- Directive Form Section -->
        <div class="ascii-section directive-form-section">
            <h2>
                <span class="dashicons dashicons-megaphone"></span>
                <?php echo esc_html__('Post Directive', 'ascii-desktop-control'); ?>
            </h2>
            <form class="directive-form" id="directive-form" method="post">
                <?php wp_nonce_field('ascii_directive_nonce', 'directive_nonce'); ?>
                <div class="form-group">
                    <label for="directive-title">
                        <?php echo esc_html__('Title', 'ascii-desktop-control'); ?>
                        <span class="required">*</span>
                    </label>
                    <input
                        type="text"
                        id="directive-title"
                        name="directive_title"
                        class="regular-text"
                        placeholder="<?php echo esc_attr__('Enter directive title...', 'ascii-desktop-control'); ?>"
                        required
                    />
                </div>
                <div class="form-group">
                    <label for="directive-content">
                        <?php echo esc_html__('Content', 'ascii-desktop-control'); ?>
                    </label>
                    <textarea
                        id="directive-content"
                        name="directive_content"
                        rows="6"
                        placeholder="<?php echo esc_attr__('Describe the directive in detail...', 'ascii-desktop-control'); ?>"
                    ></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit" class="button button-primary">
                        <span class="dashicons dashicons-upload"></span>
                        <?php echo esc_html__('Submit Directive', 'ascii-desktop-control'); ?>
                    </button>
                    <button type="reset" class="button">
                        <?php echo esc_html__('Clear', 'ascii-desktop-control'); ?>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Directive Queue Section -->
    <div class="ascii-section directive-queue-section">
        <h2>
            <span class="dashicons dashicons-list-view"></span>
            <?php echo esc_html__('Directive Queue', 'ascii-desktop-control'); ?>
        </h2>
        <div class="queue-controls">
            <button type="button" class="button" id="queue-refresh">
                <span class="dashicons dashicons-update"></span>
                <?php echo esc_html__('Refresh', 'ascii-desktop-control'); ?>
            </button>
            <select id="queue-limit">
                <option value="5">5</option>
                <option value="10" selected>10</option>
                <option value="20">20</option>
                <option value="50">50</option>
            </select>
            <span class="queue-label"><?php echo esc_html__('items', 'ascii-desktop-control'); ?></span>
        </div>
        <table class="wp-list-table widefat fixed striped directive-queue-table" id="directive-queue-table">
            <thead>
                <tr>
                    <th scope="col" class="column-id"><?php echo esc_html__('ID', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-title"><?php echo esc_html__('Title', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-status"><?php echo esc_html__('Status', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-timestamp"><?php echo esc_html__('Created', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-actions"><?php echo esc_html__('Actions', 'ascii-desktop-control'); ?></th>
                </tr>
            </thead>
            <tbody id="directive-queue-body">
                <tr class="queue-placeholder">
                    <td colspan="5">
                        <span class="spinner is-active"></span>
                        <?php echo esc_html__('Loading directives...', 'ascii-desktop-control'); ?>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Loading Spinner Overlay -->
    <div class="ascii-loading-overlay" id="ascii-loading-overlay" style="display: none;">
        <div class="ascii-loading-spinner">
            <span class="spinner is-active"></span>
            <span class="loading-text"><?php echo esc_html__('Loading...', 'ascii-desktop-control'); ?></span>
        </div>
    </div>

    <!-- Error Toast Container -->
    <div class="ascii-toast-container" id="ascii-toast-container">
        <!-- Toasts inserted here via JS -->
    </div>

    <!-- Success Toast Template -->
    <script type="text/template" id="toast-template">
        <div class="ascii-toast ascii-toast-{{type}}" role="alert">
            <span class="dashicons dashicons-{{icon}}"></span>
            <span class="toast-message">{{message}}</span>
            <button type="button" class="toast-dismiss" aria-label="<?php echo esc_attr__('Dismiss', 'ascii-desktop-control'); ?>">
                <span class="dashicons dashicons-no-alt"></span>
            </button>
        </div>
    </script>
</div>
