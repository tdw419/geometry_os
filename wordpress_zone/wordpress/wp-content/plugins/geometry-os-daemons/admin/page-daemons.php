<?php
/**
 * Daemons Dashboard Admin Page
 *
 * Displays status cards for all Geometry OS daemon processes.
 *
 * @package Geometry_OS_Daemons
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

// Get the monitor instance
$monitor = $this->get_daemon_monitor();
$daemons = $monitor->get_all_status();
$last_updated = current_time('mysql');
$cache_ttl = $monitor->get_cache_ttl();
?>

<div class="wrap geometry-os-daemons-wrap">
    <h1 class="geometry-os-daemons-title">
        <span class="dashicons dashicons-admin-generic"></span>
        <?php esc_html_e('Geometry OS Daemons', 'geometry-os-daemons'); ?>
    </h1>

    <div class="geometry-os-daemons-header">
        <div class="geometry-os-daemons-actions">
            <button type="button" class="button button-secondary" id="geometry-os-refresh-daemons">
                <span class="dashicons dashicons-update"></span>
                <?php esc_html_e('Refresh', 'geometry-os-daemons'); ?>
            </button>
        </div>
        <div class="geometry-os-daemons-last-updated">
            <?php
            printf(
                /* translators: %s: last updated time */
                esc_html__('Last updated: %s', 'geometry-os-daemons'),
                '<span id="geometry-os-last-updated">' . esc_html($last_updated) . '</span>'
            );
            ?>
        </div>
    </div>

    <div class="geometry-os-daemons-grid" id="geometry-os-daemons-grid">
        <?php foreach ($daemons as $daemon_id => $daemon) : ?>
            <div class="geometry-os-daemon-card" data-daemon-id="<?php echo esc_attr($daemon_id); ?>">
                <div class="geometry-os-daemon-card-header">
                    <span class="geometry-os-daemon-status-indicator geometry-os-daemon-status-<?php echo $daemon['running'] ? 'running' : 'stopped'; ?>">
                        <?php echo $daemon['running'] ? '&#x1F7E2;' : '&#x1F534;'; ?>
                    </span>
                    <h3 class="geometry-os-daemon-card-title">
                        <?php echo esc_html($daemon['name']); ?>
                    </h3>
                </div>

                <div class="geometry-os-daemon-card-body">
                    <p class="geometry-os-daemon-description">
                        <?php echo esc_html($daemon['description']); ?>
                    </p>

                    <?php if ($daemon['running']) : ?>
                        <div class="geometry-os-daemon-metrics">
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('Status:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value geometry-os-status-running">
                                    <?php esc_html_e('Running', 'geometry-os-daemons'); ?>
                                </span>
                            </div>
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('PID:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value"><?php echo esc_html($daemon['pid']); ?></span>
                            </div>
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('Uptime:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value"><?php echo esc_html($daemon['uptime']); ?></span>
                            </div>
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('CPU:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value"><?php echo esc_html($daemon['cpu']); ?></span>
                            </div>
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('Memory:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value"><?php echo esc_html($daemon['memory']); ?></span>
                            </div>
                        </div>
                    <?php else : ?>
                        <div class="geometry-os-daemon-metrics">
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('Status:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value geometry-os-status-stopped">
                                    <?php esc_html_e('Stopped', 'geometry-os-daemons'); ?>
                                </span>
                            </div>
                            <div class="geometry-os-daemon-metric">
                                <span class="geometry-os-daemon-metric-label"><?php esc_html_e('Process:', 'geometry-os-daemons'); ?></span>
                                <span class="geometry-os-daemon-metric-value geometry-os-process-name">
                                    <?php echo esc_html($daemon['process_name']); ?>
                                </span>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="geometry-os-daemon-card-footer">
                    <span class="geometry-os-daemon-last-check">
                        <?php
                        printf(
                            /* translators: %s: last check time */
                            esc_html__('Checked: %s', 'geometry-os-daemons'),
                            esc_html($daemon['last_check'])
                        );
                        ?>
                    </span>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="geometry-os-daemons-footer">
        <p class="description">
            <?php
            printf(
                esc_html(
                    sprintf(
                        /* translators: %d: cache TTL in seconds */
                        _n(
                            'Status refreshes automatically every %d second.',
                            'Status refreshes automatically every %d seconds.',
                            $cache_ttl,
                            'geometry-os-daemons'
                        ),
                        $cache_ttl
                    )
                ),
                $cache_ttl
            );
            ?>
        </p>
    </div>
</div>
