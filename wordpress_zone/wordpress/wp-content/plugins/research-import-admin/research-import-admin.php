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
        add_action('wp_ajax_research_import_start', array($this, 'ajax_import_start'));
        add_action('wp_ajax_research_import_progress', array($this, 'ajax_get_progress'));
        add_action('wp_ajax_research_import_update_progress', array($this, 'ajax_update_progress'));
        add_action('admin_enqueue_scripts', array($this, 'enqueue_scripts'));
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
     * Enqueue admin scripts and styles
     *
     * @param string $hook The current admin page hook
     */
    public function enqueue_scripts($hook) {
        if ($hook !== 'tools_page_research-import-admin') {
            return;
        }

        wp_enqueue_style(
            'research-import-admin-css',
            plugin_dir_url(__FILE__) . 'research-import-admin.css',
            array(),
            '1.0.0'
        );

        wp_enqueue_script(
            'research-import-admin-js',
            plugin_dir_url(__FILE__) . 'research-import-admin.js',
            array('jquery'),
            '1.0.0',
            true
        );

        wp_localize_script('research-import-admin-js', 'researchImport', array(
            'ajax_url' => admin_url('admin-ajax.php'),
            'nonce' => wp_create_nonce('research_import_nonce'),
        ));
    }

    /**
     * Get the Python importer script path
     *
     * @return string Path to import_research_docs.py
     */
    private function get_importer_path(): string {
        // Use ABSPATH to find the wordpress_zone directory
        $wordpress_zone = dirname(ABSPATH) . '/import_research_docs.py';
        return $wordpress_zone;
    }

    /**
     * Get the research documents directory
     *
     * @return string Path to research documents
     */
    private function get_research_dir(): string {
        return '/home/jericho/zion/docs/research';
    }

    /**
     * Count research documents on disk
     *
     * @return int Number of .txt and .md files
     */
    private function count_documents(): int {
        $research_dir = $this->get_research_dir();
        $txt_files = glob($research_dir . '/*.txt');
        $md_files = glob($research_dir . '/*.md');
        return ($txt_files ? count($txt_files) : 0) + ($md_files ? count($md_files) : 0);
    }

    /**
     * Count imported research documents in WordPress
     *
     * @return int Number of research_document posts
     */
    private function count_imported(): int {
        $query = new WP_Query(array(
            'post_type' => 'research_document',
            'post_status' => 'any',
            'posts_per_page' => 1,
            'fields' => 'ids',
        ));
        return $query->found_posts;
    }

    /**
     * Get the last import summary from transient
     *
     * @return array|null Import summary or null if none
     */
    private function get_last_import_summary(): ?array {
        return get_transient('research_import_summary');
    }

    /**
     * Render the admin page
     */
    public function render_page() {
        $research_dir = $this->get_research_dir();
        $doc_count = $this->count_documents();
        $imported_count = $this->count_imported();
        $last_import = $this->get_last_import_summary();
        ?>
        <div class="wrap">
            <h1>Research Document Import</h1>

            <?php
            // Display admin notices from transient
            if (isset($_GET['research_import_status'])) {
                $status = sanitize_key($_GET['research_import_status']);
                $notice_class = ($status === 'success') ? 'notice-success' : 'notice-error';
                echo '<div class="notice ' . esc_attr($notice_class) . ' is-dismissible"><p>';
                if (isset($_GET['research_import_msg'])) {
                    echo esc_html(urldecode(sanitize_text_field($_GET['research_import_msg'])));
                } else {
                    echo ($status === 'success') ? 'Import completed.' : 'Import failed.';
                }
                echo '</p></div>';
            }
            ?>

            <div class="card" style="max-width: 800px; margin-top: 20px;">
                <h2>Status</h2>
                <p>Import research documents from <code><?php echo esc_html($research_dir); ?></code> into WordPress for AI semantic search access.</p>

                <table class="form-table">
                    <tr>
                        <th scope="row">Research Directory</th>
                        <td><code><?php echo esc_html($research_dir); ?></code></td>
                    </tr>
                    <tr>
                        <th scope="row">Documents on Disk</th>
                        <td><?php echo esc_html(number_format($doc_count)); ?> files (.txt and .md)</td>
                    </tr>
                    <tr>
                        <th scope="row">Imported Count</th>
                        <td><?php echo esc_html(number_format($imported_count)); ?> research_document posts</td>
                    </tr>
                </table>

                <h3>Actions</h3>

                <!-- Run Import Form -->
                <form id="research-import-form" method="post">
                    <?php wp_nonce_field('research_import_action', 'research_import_nonce_field'); ?>
                    <input type="hidden" name="action" value="research_import_start">
                    <button type="submit" id="run-import-btn" class="button button-primary">
                        Run Import
                    </button>
                    <p class="description">
                        Import all research documents. Documents are deduplicated by source path and content hash.
                    </p>
                </form>

                <?php if ($last_import): ?>
                <h3>Last Import Summary</h3>
                <table class="form-table">
                    <tr>
                        <th scope="row">Timestamp</th>
                        <td><?php echo esc_html($last_import['timestamp'] ?? 'N/A'); ?></td>
                    </tr>
                    <tr>
                        <th scope="row">Created</th>
                        <td><?php echo esc_html(number_format($last_import['created'] ?? 0)); ?> documents</td>
                    </tr>
                    <tr>
                        <th scope="row">Updated</th>
                        <td><?php echo esc_html(number_format($last_import['updated'] ?? 0)); ?> documents</td>
                    </tr>
                    <tr>
                        <th scope="row">Skipped</th>
                        <td><?php echo esc_html(number_format($last_import['skipped'] ?? 0)); ?> documents (no changes)</td>
                    </tr>
                    <tr>
                        <th scope="row">Errors</th>
                        <td><?php echo esc_html(number_format($last_import['errors'] ?? 0)); ?></td>
                    </tr>
                </table>
                <?php endif; ?>

                <h3>Logs</h3>
                <p>
                    <a href="#" class="button" id="view-logs-link" onclick="alert('Log viewer coming soon. Check /var/log/research_import.log or WordPress debug.log'); return false;">
                        View Logs
                    </a>
                    <span class="description">(placeholder - logs viewer coming in future update)</span>
                </p>
            </div>

            <!-- Import Status Container (for AJAX updates) -->
            <div id="import-status-container" style="display: none; margin-top: 20px;">
                <div class="card" style="max-width: 800px;">
                    <h3>Import Progress</h3>
                    <div id="import-status-message">Starting import...</div>
                    <div id="import-progress-bar" style="background: #f0f0f0; height: 20px; margin: 10px 0; border-radius: 4px;">
                        <div id="import-progress-fill" style="background: #2271b1; height: 100%; width: 0%; border-radius: 4px; transition: width 0.3s;"></div>
                    </div>
                    <div id="import-details"></div>
                </div>
            </div>
        </div>
        <?php
    }

    /**
     * AJAX handler for starting import
     */
    public function ajax_import_start() {
        // Verify nonce
        check_ajax_referer('research_import_nonce', 'nonce');

        // Check capabilities
        if (!current_user_can('manage_options')) {
            wp_send_json_error(array('message' => 'Insufficient permissions'));
        }

        // Get importer path
        $importer_path = $this->get_importer_path();
        if (!file_exists($importer_path)) {
            wp_send_json_error(array('message' => 'Importer script not found: ' . $importer_path));
        }

        // Get Python executable (try python3 first, then python)
        $python = 'python3';
        exec('which python3 2>/dev/null', $output, $return_var);
        if ($return_var !== 0) {
            $python = 'python';
        }

        // Build command - run importer and capture output
        $command = escapeshellcmd($python) . ' ' . escapeshellarg($importer_path) . ' 2>&1';

        // Execute import
        $output = array();
        $return_code = 0;
        exec($command, $output, $return_code);

        // Parse output for stats
        $summary = $this->parse_import_output($output);
        $summary['return_code'] = $return_code;
        $summary['timestamp'] = current_time('mysql');

        // Store summary in transient (expires in 7 days)
        set_transient('research_import_summary', $summary, 7 * DAY_IN_SECONDS);

        // Return result
        if ($return_code === 0) {
            wp_send_json_success(array(
                'message' => sprintf(
                    'Import complete: %d created, %d updated, %d skipped, %d errors',
                    $summary['created'],
                    $summary['updated'],
                    $summary['skipped'],
                    $summary['errors']
                ),
                'summary' => $summary,
            ));
        } else {
            wp_send_json_error(array(
                'message' => 'Import failed. Check logs for details.',
                'output' => implode("\n", $output),
                'summary' => $summary,
            ));
        }
    }

    /**
     * Parse importer output to extract summary stats
     *
     * @param array $output Command output lines
     * @return array Summary with created, updated, skipped, errors counts
     */
    private function parse_import_output(array $output): array {
        $summary = array(
            'created' => 0,
            'updated' => 0,
            'skipped' => 0,
            'errors' => 0,
        );

        // Parse output looking for summary stats
        // The importer outputs lines like: "Created: 5", "Updated: 3", etc.
        foreach ($output as $line) {
            if (preg_match('/created[:\s]+(\d+)/i', $line, $matches)) {
                $summary['created'] = (int) $matches[1];
            }
            if (preg_match('/updated[:\s]+(\d+)/i', $line, $matches)) {
                $summary['updated'] = (int) $matches[1];
            }
            if (preg_match('/skipped[:\s]+(\d+)/i', $line, $matches)) {
                $summary['skipped'] = (int) $matches[1];
            }
            if (preg_match('/error[s]?[:\s]+(\d+)/i', $line, $matches)) {
                $summary['errors'] = (int) $matches[1];
            }
        }

        return $summary;
    }

    /**
     * AJAX handler for getting import progress
     * Called by JavaScript polling every 2 seconds during import
     */
    public function ajax_get_progress() {
        // Verify nonce
        check_ajax_referer('research_import_nonce', 'nonce');

        // Get progress from transient
        $progress = get_transient('research_import_progress');

        if ($progress === false) {
            // No progress data yet
            wp_send_json_success(array(
                'status' => 'pending',
                'message' => 'Waiting for import to start...',
                'percent' => 0,
                'processed' => 0,
                'total' => 0,
                'created' => 0,
                'updated' => 0,
                'skipped' => 0,
                'errors' => 0,
            ));
        }

        wp_send_json_success($progress);
    }

    /**
     * AJAX handler for updating import progress
     * Called by Python importer during batch processing
     */
    public function ajax_update_progress() {
        // Verify nonce
        check_ajax_referer('research_import_nonce', 'nonce');

        // Check capabilities (allow for internal calls from importer)
        $internal_key = isset($_POST['internal_key']) ? sanitize_text_field($_POST['internal_key']) : '';
        $expected_key = wp_hash('research_import_progress_' . get_current_user_id());

        if (!current_user_can('manage_options') && $internal_key !== $expected_key) {
            wp_send_json_error(array('message' => 'Insufficient permissions'));
        }

        // Get progress data from request
        $progress = array(
            'status' => isset($_POST['status']) ? sanitize_text_field($_POST['status']) : 'running',
            'message' => isset($_POST['message']) ? sanitize_text_field($_POST['message']) : '',
            'percent' => isset($_POST['percent']) ? intval($_POST['percent']) : 0,
            'processed' => isset($_POST['processed']) ? intval($_POST['processed']) : 0,
            'total' => isset($_POST['total']) ? intval($_POST['total']) : 0,
            'created' => isset($_POST['created']) ? intval($_POST['created']) : 0,
            'updated' => isset($_POST['updated']) ? intval($_POST['updated']) : 0,
            'skipped' => isset($_POST['skipped']) ? intval($_POST['skipped']) : 0,
            'errors' => isset($_POST['errors']) ? intval($_POST['errors']) : 0,
            'timestamp' => current_time('mysql'),
        );

        // Store in transient (expires in 1 hour)
        set_transient('research_import_progress', $progress, HOUR_IN_SECONDS);

        wp_send_json_success(array('message' => 'Progress updated'));
    }
}

// Initialize the plugin
new Research_Import_Admin();
