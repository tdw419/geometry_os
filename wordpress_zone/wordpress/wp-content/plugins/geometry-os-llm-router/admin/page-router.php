<?php
/**
 * LLM Router Dashboard Page
 *
 * Displays status cards for the LLM router service.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

// Get router status
$port = get_option('geometry_os_llm_router_port', 4000);
$proxy_url = "http://localhost:{$port}";
$primary_model = get_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514');
$fallback_model = get_option('geometry_os_llm_router_fallback_model', 'lm-studio-local');
$fallback_enabled = get_option('geometry_os_llm_router_fallback_enabled', true);
?>

<div class="wrap geometry-os-llm-router-wrap">
    <h1 class="geometry-os-llm-router-title">
        <span class="dashicons dashicons-admin-network"></span>
        <?php esc_html_e('LLM Router Dashboard', 'geometry-os-llm-router'); ?>
    </h1>

    <div class="geometry-os-llm-router-header">
        <div class="geometry-os-llm-router-actions">
            <button type="button" class="button button-secondary" id="geometry-os-refresh-router">
                <span class="dashicons dashicons-update"></span>
                <?php esc_html_e('Refresh', 'geometry-os-llm-router'); ?>
            </button>
            <a href="<?php echo esc_url($proxy_url); ?>" target="_blank" class="button button-secondary">
                <span class="dashicons dashicons-external"></span>
                <?php esc_html_e('Open Proxy', 'geometry-os-llm-router'); ?>
            </a>
        </div>
        <div class="geometry-os-llm-router-last-updated">
            <?php
            printf(
                /* translators: %s: last updated time */
                esc_html__('Last updated: %s', 'geometry-os-llm-router'),
                '<span id="geometry-os-llm-last-updated">' . esc_html(current_time('mysql')) . '</span>'
            );
            ?>
        </div>
    </div>

    <!-- Status Overview Cards -->
    <div class="geometry-os-llm-router-grid" id="geometry-os-llm-router-grid">

        <!-- Proxy Status Card -->
        <div class="geometry-os-llm-card">
            <div class="geometry-os-llm-card-header">
                <span class="geometry-os-llm-status-indicator" id="geometry-os-proxy-status-indicator">
                    <span class="geometry-os-llm-status-dot"></span>
                </span>
                <h3 class="geometry-os-llm-card-title">
                    <?php esc_html_e('Proxy Service', 'geometry-os-llm-router'); ?>
                </h3>
            </div>
            <div class="geometry-os-llm-card-body">
                <div class="geometry-os-llm-metrics">
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Status:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-proxy-status-text">
                            <?php esc_html_e('Checking...', 'geometry-os-llm-router'); ?>
                        </span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Port:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value"><?php echo esc_html($port); ?></span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Endpoint:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value"><?php echo esc_html($proxy_url); ?></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Claude API Card -->
        <div class="geometry-os-llm-card">
            <div class="geometry-os-llm-card-header">
                <span class="geometry-os-llm-status-indicator" id="geometry-os-claude-status-indicator">
                    <span class="geometry-os-llm-status-dot"></span>
                </span>
                <h3 class="geometry-os-llm-card-title">
                    <?php esc_html_e('Claude API', 'geometry-os-llm-router'); ?>
                </h3>
            </div>
            <div class="geometry-os-llm-card-body">
                <div class="geometry-os-llm-metrics">
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Status:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-claude-status-text">
                            <?php esc_html_e('Checking...', 'geometry-os-llm-router'); ?>
                        </span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Model:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-claude-model-text">
                            <?php echo esc_html($primary_model); ?>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- LM Studio Card -->
        <div class="geometry-os-llm-card">
            <div class="geometry-os-llm-card-header">
                <span class="geometry-os-llm-status-indicator geometry-os-llm-status-local" id="geometry-os-local-status-indicator">
                    <span class="geometry-os-llm-status-dot"></span>
                </span>
                <h3 class="geometry-os-llm-card-title">
                    <?php esc_html_e('Local Fallback', 'geometry-os-llm-router'); ?>
                </h3>
            </div>
            <div class="geometry-os-llm-card-body">
                <div class="geometry-os-llm-metrics">
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Status:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value geometry-os-llm-value-local" id="geometry-os-local-status-text">
                            <?php esc_html_e('Available', 'geometry-os-llm-router'); ?>
                        </span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Model:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-local-model-text">
                            <?php echo esc_html($fallback_model); ?>
                        </span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Enabled:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-fallback-enabled-text">
                            <?php echo $fallback_enabled ? __('Yes', 'geometry-os-llm-router') : __('No', 'geometry-os-llm-router'); ?>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fallback Events Card -->
        <div class="geometry-os-llm-card">
            <div class="geometry-os-llm-card-header">
                <span class="dashicons dashicons-warning"></span>
                <h3 class="geometry-os-llm-card-title">
                    <?php esc_html_e('Fallback Events', 'geometry-os-llm-router'); ?>
                </h3>
            </div>
            <div class="geometry-os-llm-card-body">
                <div class="geometry-os-llm-metrics">
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('Today:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-fallback-today">
                            0
                        </span>
                    </div>
                    <div class="geometry-os-llm-metric">
                        <span class="geometry-os-llm-metric-label"><?php esc_html_e('This Week:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-metric-value" id="geometry-os-fallback-week">
                            0
                        </span>
                    </div>
                </div>
                <?php if ($fallback_enabled) : ?>
                <div class="geometry-os-llm-card-footer-link">
                    <a href="<?php echo admin_url('admin.php?page=geometry-os-llm-analytics'); ?>">
                        <?php esc_html_e('View Analytics &rarr;', 'geometry-os-llm-router'); ?>
                    </a>
                </div>
                <?php endif; ?>
            </div>
        </div>

        <!-- Token Usage Card -->
        <div class="geometry-os-llm-card geometry-os-llm-card-wide">
            <div class="geometry-os-llm-card-header">
                <span class="dashicons dashicons-chart-bar"></span>
                <h3 class="geometry-os-llm-card-title">
                    <?php esc_html_e('Token Usage', 'geometry-os-llm-router'); ?>
                </h3>
            </div>
            <div class="geometry-os-llm-card-body">
                <div class="geometry-os-llm-token-usage">
                    <div class="geometry-os-llm-token-period">
                        <span class="geometry-os-llm-token-label"><?php esc_html_e('Current Hour:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-token-value" id="geometry-os-tokens-hour">0</span>
                    </div>
                    <div class="geometry-os-llm-token-period">
                        <span class="geometry-os-llm-token-label"><?php esc_html_e('Today:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-token-value" id="geometry-os-tokens-day">0</span>
                    </div>
                    <div class="geometry-os-llm-token-period">
                        <span class="geometry-os-llm-token-label"><?php esc_html_e('This Week:', 'geometry-os-llm-router'); ?></span>
                        <span class="geometry-os-llm-token-value" id="geometry-os-tokens-week">0</span>
                    </div>
                </div>
                <div class="geometry-os-llm-token-gauge">
                    <div class="geometry-os-llm-token-gauge-bar">
                        <div class="geometry-os-llm-token-gauge-fill" id="geometry-os-token-gauge-fill" style="width: 0%"></div>
                    </div>
                    <div class="geometry-os-llm-token-gauge-label">
                        <?php esc_html_e('Hourly Usage', 'geometry-os-llm-router'); ?>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="geometry-os-llm-router-footer">
        <p class="description">
            <?php
            printf(
                /* translators: %s: refresh interval */
                esc_html__('Status refreshes automatically every %s seconds.', 'geometry-os-llm-router'),
                '30'
            );
            ?>
        </p>
        <p class="description">
            <?php
            printf(
                /* translators: 1: settings page URL, 2: analytics page URL */
                esc_html__('Configure router settings or view detailed analytics on the %1$sSettings%2$s and %3$sAnalytics%4$s pages.', 'geometry-os-llm-router'),
                '<a href="' . admin_url('admin.php?page=geometry-os-llm-settings') . '">',
                '</a>',
                '<a href="' . admin_url('admin.php?page=geometry-os-llm-analytics') . '">',
                '</a>'
            );
            ?>
        </p>
    </div>
</div>
