<?php
/**
 * Logs page template for ASCII Desktop Control.
 *
 * Displays execution logs with filtering and pagination.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

// Get filter values from GET parameters
$current_status = isset($_GET['log_status']) ? sanitize_text_field(wp_unslash($_GET['log_status'])) : '';
$current_date_from = isset($_GET['date_from']) ? sanitize_text_field(wp_unslash($_GET['date_from'])) : '';
$current_date_to = isset($_GET['date_to']) ? sanitize_text_field(wp_unslash($_GET['date_to'])) : '';
$current_search = isset($_GET['s']) ? sanitize_text_field(wp_unslash($_GET['s'])) : '';
$current_paged = isset($_GET['paged']) ? max(1, intval($_GET['paged'])) : 1;
$per_page = 20;

// Build query args for logs (placeholder - actual data will come from AJAX)
// This template provides the HTML structure; JS handles data loading
?>
<div class="wrap">
    <h1><?php echo esc_html(get_admin_page_title()); ?></h1>

    <!-- Filter Form -->
    <div class="ascii-logs-filter">
        <form id="ascii-logs-filter-form" class="filter-form" method="get">
            <input type="hidden" name="page" value="<?php echo esc_attr(isset($_GET['page']) ? sanitize_text_field(wp_unslash($_GET['page'])) : 'ascii-desktop-control-logs'); ?>" />

            <div class="filter-row">
                <!-- Status Filter -->
                <div class="filter-group">
                    <label for="log_status"><?php esc_html_e('Status:', 'ascii-desktop-control'); ?></label>
                    <select name="log_status" id="log_status">
                        <option value="" <?php selected($current_status, ''); ?>><?php esc_html_e('All Statuses', 'ascii-desktop-control'); ?></option>
                        <option value="pending" <?php selected($current_status, 'pending'); ?>><?php esc_html_e('Pending', 'ascii-desktop-control'); ?></option>
                        <option value="processing" <?php selected($current_status, 'processing'); ?><?php esc_html_e('Processing', 'ascii-desktop-control'); ?></option>
                        <option value="completed" <?php selected($current_status, 'completed'); ?><?php esc_html_e('Completed', 'ascii-desktop-control'); ?></option>
                        <option value="failed" <?php selected($current_status, 'failed'); ?><?php esc_html_e('Failed', 'ascii-desktop-control'); ?></option>
                    </select>
                </div>

                <!-- Date Range Filter -->
                <div class="filter-group">
                    <label for="date_from"><?php esc_html_e('From:', 'ascii-desktop-control'); ?></label>
                    <input type="date" name="date_from" id="date_from" value="<?php echo esc_attr($current_date_from); ?>" />
                </div>

                <div class="filter-group">
                    <label for="date_to"><?php esc_html_e('To:', 'ascii-desktop-control'); ?></label>
                    <input type="date" name="date_to" id="date_to" value="<?php echo esc_attr($current_date_to); ?>" />
                </div>

                <!-- Search Filter -->
                <div class="filter-group filter-search">
                    <label for="log_search"><?php esc_html_e('Search:', 'ascii-desktop-control'); ?></label>
                    <input type="search" name="s" id="log_search" value="<?php echo esc_attr($current_search); ?>" placeholder="<?php esc_attr_e('Search directives...', 'ascii-desktop-control'); ?>" />
                </div>

                <!-- Filter Actions -->
                <div class="filter-actions">
                    <button type="submit" class="button button-secondary"><?php esc_html_e('Filter', 'ascii-desktop-control'); ?></button>
                    <a href="<?php echo esc_url(remove_query_arg(['log_status', 'date_from', 'date_to', 's', 'paged'])); ?>" class="button"><?php esc_html_e('Clear', 'ascii-desktop-control'); ?></a>
                </div>
            </div>
        </form>
    </div>

    <!-- Logs Table -->
    <div class="ascii-logs-container">
        <table id="ascii-logs-table" class="logs-table wp-list-table widefat fixed striped">
            <thead>
                <tr>
                    <th scope="col" class="column-cb check-column">
                        <input type="checkbox" id="cb-select-all" />
                    </th>
                    <th scope="col" class="column-id"><?php esc_html_e('ID', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-directive"><?php esc_html_e('Directive', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-status"><?php esc_html_e('Status', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-actions"><?php esc_html_e('Actions', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-result"><?php esc_html_e('Result', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-timestamp"><?php esc_html_e('Timestamp', 'ascii-desktop-control'); ?></th>
                </tr>
            </thead>
            <tbody id="ascii-logs-body">
                <!-- Placeholder row - JS will populate -->
                <tr class="placeholder-row">
                    <td colspan="7"><?php esc_html_e('Loading logs...', 'ascii-desktop-control'); ?></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th scope="col" class="column-cb check-column">
                        <input type="checkbox" />
                    </th>
                    <th scope="col" class="column-id"><?php esc_html_e('ID', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-directive"><?php esc_html_e('Directive', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-status"><?php esc_html_e('Status', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-actions"><?php esc_html_e('Actions', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-result"><?php esc_html_e('Result', 'ascii-desktop-control'); ?></th>
                    <th scope="col" class="column-timestamp"><?php esc_html_e('Timestamp', 'ascii-desktop-control'); ?></th>
                </tr>
            </tfoot>
        </table>

        <!-- Expandable Row Details Template (hidden, cloned by JS) -->
        <script type="text/template" id="ascii-log-details-template">
            <div class="log-details-content">
                <div class="log-detail-section">
                    <h4><?php esc_html_e('Directive Content', 'ascii-desktop-control'); ?></h4>
                    <div class="log-directive-full"></div>
                </div>
                <div class="log-detail-section log-actions-section">
                    <h4><?php esc_html_e('Actions Taken', 'ascii-desktop-control'); ?></h4>
                    <div class="log-actions-full"></div>
                </div>
                <div class="log-detail-section log-result-section">
                    <h4><?php esc_html_e('Full Result', 'ascii-desktop-control'); ?></h4>
                    <div class="log-result-full"></div>
                </div>
                <div class="log-detail-section log-snapshot-section" style="display: none;">
                    <h4><?php esc_html_e('ASCII Snapshots', 'ascii-desktop-control'); ?></h4>
                    <div class="log-snapshots">
                        <div class="snapshot-before">
                            <h5><?php esc_html_e('Before', 'ascii-desktop-control'); ?></h5>
                            <pre class="ascii-snapshot"></pre>
                        </div>
                        <div class="snapshot-after">
                            <h5><?php esc_html_e('After', 'ascii-desktop-control'); ?></h5>
                            <pre class="ascii-snapshot"></pre>
                        </div>
                    </div>
                </div>
            </div>
        </script>
    </div>

    <!-- Pagination Controls -->
    <div class="ascii-logs-pagination pagination tablenav bottom">
        <div class="tablenav-pages">
            <span class="displaying-num">
                <span id="ascii-logs-total">0</span> <?php esc_html_e('items', 'ascii-desktop-control'); ?>
            </span>
            <span class="pagination-links">
                <a href="#" class="first-page button disabled" data-page="1" aria-label="<?php esc_attr_e('First page', 'ascii-desktop-control'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('First page', 'ascii-desktop-control'); ?></span>
                    <span aria-hidden="true">&laquo;</span>
                </a>
                <a href="#" class="prev-page button disabled" data-page="0" aria-label="<?php esc_attr_e('Previous page', 'ascii-desktop-control'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('Previous page', 'ascii-desktop-control'); ?></span>
                    <span aria-hidden="true">&lsaquo;</span>
                </a>
                <span class="paging-input">
                    <span id="ascii-logs-current-page" class="current-page"><?php echo esc_html($current_paged); ?></span>
                    <?php esc_html_e('of', 'ascii-desktop-control'); ?>
                    <span id="ascii-logs-total-pages" class="total-pages">1</span>
                </span>
                <a href="#" class="next-page button disabled" data-page="2" aria-label="<?php esc_attr_e('Next page', 'ascii-desktop-control'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('Next page', 'ascii-desktop-control'); ?></span>
                    <span aria-hidden="true">&rsaquo;</span>
                </a>
                <a href="#" class="last-page button disabled" data-page="1" aria-label="<?php esc_attr_e('Last page', 'ascii-desktop-control'); ?>">
                    <span class="screen-reader-text"><?php esc_html_e('Last page', 'ascii-desktop-control'); ?></span>
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </span>
        </div>
        <br class="clear" />
    </div>

    <!-- Loading Overlay -->
    <div id="ascii-logs-loading" class="ascii-loading-overlay" style="display: none;">
        <span class="spinner is-active"></span>
        <span class="loading-text"><?php esc_html_e('Loading...', 'ascii-desktop-control'); ?></span>
    </div>

    <!-- No Results Message -->
    <div id="ascii-logs-empty" class="ascii-logs-empty" style="display: none;">
        <p><?php esc_html_e('No logs found matching your criteria.', 'ascii-desktop-control'); ?></p>
    </div>
</div>

<style>
/* Logs page specific styles */
.ascii-logs-filter {
    background: #fff;
    padding: 10px 20px;
    margin: 10px 0 20px;
    border: 1px solid #ccd0d4;
    box-shadow: 0 1px 1px rgba(0,0,0,.04);
}

.filter-row {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    align-items: flex-end;
}

.filter-group {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.filter-group label {
    font-weight: 600;
    font-size: 12px;
    color: #666;
}

.filter-group select,
.filter-group input[type="date"],
.filter-group input[type="search"] {
    min-width: 150px;
}

.filter-search {
    flex: 1;
    max-width: 300px;
}

.filter-search input {
    width: 100%;
}

.filter-actions {
    display: flex;
    gap: 5px;
    align-items: flex-end;
}

/* Logs table styles */
.logs-table {
    margin-top: 0;
}

.logs-table .column-id {
    width: 60px;
}

.logs-table .column-status {
    width: 100px;
}

.logs-table .column-actions {
    width: 200px;
}

.logs-table .column-result {
    width: 200px;
}

.logs-table .column-timestamp {
    width: 150px;
}

.logs-table .column-directive {
    width: auto;
}

/* Status badges */
.status-badge {
    display: inline-block;
    padding: 3px 8px;
    border-radius: 3px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
}

.status-badge.pending {
    background: #fff3cd;
    color: #856404;
}

.status-badge.processing {
    background: #cce5ff;
    color: #004085;
}

.status-badge.completed {
    background: #d4edda;
    color: #155724;
}

.status-badge.failed {
    background: #f8d7da;
    color: #721c24;
}

/* Expandable row styles */
.log-details-row {
    display: none;
}

.log-details-row.expanded {
    display: table-row;
}

.log-details-row td {
    padding: 0;
    background: #f9f9f9;
}

.log-details-content {
    padding: 15px 20px;
    border-top: 2px solid #ddd;
}

.log-detail-section {
    margin-bottom: 15px;
}

.log-detail-section:last-child {
    margin-bottom: 0;
}

.log-detail-section h4 {
    margin: 0 0 8px;
    font-size: 13px;
    color: #555;
}

.log-directive-full,
.log-actions-full,
.log-result-full {
    background: #fff;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 3px;
    white-space: pre-wrap;
    font-family: monospace;
    font-size: 12px;
    max-height: 200px;
    overflow-y: auto;
}

/* ASCII snapshot styles */
.log-snapshots {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

.log-snapshots h5 {
    margin: 0 0 5px;
    font-size: 12px;
    color: #666;
}

.ascii-snapshot {
    background: #1e1e1e;
    color: #d4d4d4;
    padding: 10px;
    border-radius: 3px;
    font-family: 'Courier New', monospace;
    font-size: 10px;
    line-height: 1.2;
    max-height: 150px;
    overflow: auto;
    white-space: pre;
}

/* Loading and empty states */
.ascii-loading-overlay {
    position: relative;
    padding: 40px;
    text-align: center;
    background: rgba(255,255,255,0.8);
}

.ascii-loading-overlay .spinner {
    float: none;
    margin: 0 10px 0 0;
    vertical-align: middle;
}

.loading-text {
    vertical-align: middle;
    color: #666;
}

.ascii-logs-empty {
    text-align: center;
    padding: 40px;
    color: #666;
    background: #fff;
    border: 1px solid #ccd0d4;
}

/* Row expand toggle */
.logs-table tr.main-row {
    cursor: pointer;
}

.logs-table tr.main-row:hover {
    background: #f5f5f5;
}

.row-toggle {
    display: inline-block;
    width: 20px;
    text-align: center;
}

.row-toggle::before {
    content: '\f140';
    font: normal 20px/1 dashicons;
    vertical-align: middle;
    color: #82878c;
    transition: transform 0.1s;
}

tr.main-row.expanded + .log-details-row .row-toggle::before,
.main-row.expanded .row-toggle::before {
    content: '\f142';
}

/* Responsive adjustments */
@media screen and (max-width: 1200px) {
    .filter-row {
        flex-direction: column;
        align-items: stretch;
    }

    .filter-group {
        width: 100%;
    }

    .filter-search {
        max-width: none;
    }

    .log-snapshots {
        grid-template-columns: 1fr;
    }
}
</style>

<script>
// Placeholder for JS functionality - actual implementation in control.js
// This provides the structure; JS will hook into these elements
jQuery(document).ready(function($) {
    // Initialize logs page functionality
    var ASCIILogs = {
        init: function() {
            this.bindEvents();
            this.loadLogs();
        },

        bindEvents: function() {
            // Row expand/collapse
            $(document).on('click', '.logs-table tr.main-row', this.toggleRowDetails);

            // Filter form submission
            $('#ascii-logs-filter-form').on('submit', function(e) {
                e.preventDefault();
                ASCIILogs.loadLogs();
            });

            // Pagination clicks
            $('.pagination-links a').on('click', function(e) {
                e.preventDefault();
                var page = $(this).data('page');
                if (page && !$(this).hasClass('disabled')) {
                    ASCIILogs.goToPage(page);
                }
            });
        },

        toggleRowDetails: function(e) {
            if ($(e.target).is('input[type="checkbox"]')) {
                return; // Don't expand when clicking checkbox
            }
            var $row = $(this);
            var $detailsRow = $row.next('.log-details-row');

            if ($detailsRow.length) {
                $detailsRow.toggle();
                $row.toggleClass('expanded');
            }
        },

        loadLogs: function() {
            // Placeholder - actual AJAX call will be in control.js
            $('#ascii-logs-loading').show();
            $('#ascii-logs-empty').hide();

            // Simulated delay for structure verification
            setTimeout(function() {
                $('#ascii-logs-loading').hide();
                // In production, this would populate the table via AJAX
            }, 500);
        },

        goToPage: function(page) {
            $('#ascii-logs-current-page').text(page);
            // Update URL and reload
            var url = window.location.href.replace(/&paged=\d+/, '') + '&paged=' + page;
            window.history.pushState({}, '', url);
            this.loadLogs();
        }
    };

    // Initialize when DOM ready
    ASCIILogs.init();
});
</script>
