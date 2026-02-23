<?php
/**
 * LLM Analytics Page
 *
 * Displays usage charts and statistics.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

$periods = [
    '24h' => __('Last 24 Hours', 'geometry-os-llm-router'),
    '7d'  => __('Last 7 Days', 'geometry-os-llm-router'),
    '30d' => __('Last 30 Days', 'geometry-os-llm-router'),
];
?>

<div class="wrap geometry-os-llm-analytics-wrap">
    <h1 class="geometry-os-llm-analytics-title">
        <span class="dashicons dashicons-chart-area"></span>
        <?php esc_html_e('LLM Usage Analytics', 'geometry-os-llm-router'); ?>
    </h1>

    <div class="geometry-os-llm-analytics-header">
        <div class="geometry-os-llm-analytics-period-selector">
            <?php foreach ($periods as $key => $label) : ?>
                <button type="button" class="button<?php echo $key === '24h' ? ' button-primary' : ''; ?>"
                        data-period="<?php echo esc_attr($key); ?>">
                    <?php echo esc_html($label); ?>
                </button>
            <?php endforeach; ?>
        </div>
        <div class="geometry-os-llm-analytics-actions">
            <button type="button" class="button button-secondary" id="geometry-os-refresh-analytics">
                <span class="dashicons dashicons-update"></span>
                <?php esc_html_e('Refresh', 'geometry-os-llm-router'); ?>
            </button>
        </div>
    </div>

    <div class="geometry-os-llm-analytics-content">
        <!-- Summary Stats -->
        <div class="geometry-os-llm-stats-grid">
            <div class="geometry-os-llm-stat-card">
                <div class="geometry-os-llm-stat-icon">
                    <span class="dashicons dashicons-cloud"></span>
                </div>
                <div class="geometry-os-llm-stat-content">
                    <div class="geometry-os-llm-stat-label"><?php esc_html_e('Total Requests', 'geometry-os-llm-router'); ?></div>
                    <div class="geometry-os-llm-stat-value" id="geometry-os-stat-requests">-</div>
                </div>
            </div>
            <div class="geometry-os-llm-stat-card">
                <div class="geometry-os-llm-stat-icon">
                    <span class="dashicons dashicons-editor-alignleft"></span>
                </div>
                <div class="geometry-os-llm-stat-content">
                    <div class="geometry-os-llm-stat-label"><?php esc_html_e('Total Tokens', 'geometry-os-llm-router'); ?></div>
                    <div class="geometry-os-llm-stat-value" id="geometry-os-stat-tokens">-</div>
                </div>
            </div>
            <div class="geometry-os-llm-stat-card">
                <div class="geometry-os-llm-stat-icon">
                    <span class="dashicons dashicons-update-alt"></span>
                </div>
                <div class="geometry-os-llm-stat-content">
                    <div class="geometry-os-llm-stat-label"><?php esc_html_e('Fallback Rate', 'geometry-os-llm-router'); ?></div>
                    <div class="geometry-os-llm-stat-value" id="geometry-os-stat-fallback-rate">-</div>
                </div>
            </div>
            <div class="geometry-os-llm-stat-card">
                <div class="geometry-os-llm-stat-icon">
                    <span class="dashicons dashicons-calculator"></span>
                </div>
                <div class="geometry-os-llm-stat-content">
                    <div class="geometry-os-llm-stat-label"><?php esc_html_e('Avg Tokens/Request', 'geometry-os-llm-router'); ?></div>
                    <div class="geometry-os-llm-stat-value" id="geometry-os-stat-avg-tokens">-</div>
                </div>
            </div>
        </div>

        <!-- Charts Grid -->
        <div class="geometry-os-llm-charts-grid">
            <!-- Token Usage Over Time -->
            <div class="geometry-os-llm-chart-container">
                <div class="geometry-os-llm-chart-header">
                    <h3><?php esc_html_e('Token Usage Over Time', 'geometry-os-llm-router'); ?></h3>
                </div>
                <div class="geometry-os-llm-chart-wrapper">
                    <canvas id="geometry-os-token-chart"></canvas>
                </div>
            </div>

            <!-- Usage by Model -->
            <div class="geometry-os-llm-chart-container">
                <div class="geometry-os-llm-chart-header">
                    <h3><?php esc_html_e('Usage by Model', 'geometry-os-llm-router'); ?></h3>
                </div>
                <div class="geometry-os-llm-chart-wrapper">
                    <canvas id="geometry-os-model-chart"></canvas>
                </div>
            </div>
        </div>

        <!-- Model Breakdown Table -->
        <div class="geometry-os-llm-table-container">
            <div class="geometry-os-llm-table-header">
                <h3><?php esc_html_e('Model Usage Details', 'geometry-os-llm-router'); ?></h3>
            </div>
            <table class="wp-list-table widefat fixed striped">
                <thead>
                    <tr>
                        <th><?php esc_html_e('Model', 'geometry-os-llm-router'); ?></th>
                        <th><?php esc_html_e('Requests', 'geometry-os-llm-router'); ?></th>
                        <th><?php esc_html_e('Tokens', 'geometry-os-llm-router'); ?></th>
                        <th><?php esc_html_e('Fallbacks', 'geometry-os-llm-router'); ?></th>
                        <th><?php esc_html_e('Avg Tokens', 'geometry-os-llm-router'); ?></th>
                    </tr>
                </thead>
                <tbody id="geometry-os-model-table-body">
                    <tr>
                        <td colspan="5" class="geometry-os-llm-loading">
                            <?php esc_html_e('Loading data...', 'geometry-os-llm-router'); ?>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Fallback Events -->
        <div class="geometry-os-llm-fallback-section">
            <div class="geometry-os-llm-fallback-header">
                <h3><?php esc_html_e('Recent Fallback Events', 'geometry-os-llm-router'); ?></h3>
            </div>
            <div class="geometry-os-llm-fallback-content">
                <table class="wp-list-table widefat fixed striped">
                    <thead>
                        <tr>
                            <th><?php esc_html_e('Time', 'geometry-os-llm-router'); ?></th>
                            <th><?php esc_html_e('Reason', 'geometry-os-llm-router'); ?></th>
                            <th><?php esc_html_e('Original Model', 'geometry-os-llm-router'); ?></th>
                            <th><?php esc_html_e('Fallback Model', 'geometry-os-llm-router'); ?></th>
                        </tr>
                    </thead>
                    <tbody id="geometry-os-fallback-table-body">
                        <tr>
                            <td colspan="4" class="geometry-os-llm-loading">
                                <?php esc_html_e('No fallback events recorded.', 'geometry-os-llm-router'); ?>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <input type="hidden" id="geometry-os-current-period" value="24h">
</div>
