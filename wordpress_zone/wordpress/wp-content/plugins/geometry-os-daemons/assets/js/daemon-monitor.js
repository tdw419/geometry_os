/**
 * Geometry OS Daemons Dashboard - Auto-Refresh Monitor
 *
 * Handles automatic and manual refresh of daemon status cards.
 *
 * @package Geometry_OS_Daemons
 * @since 1.0.0
 */
(function($) {
    'use strict';

    /**
     * Refresh interval in milliseconds (30 seconds)
     */
    var REFRESH_INTERVAL = 30000;

    /**
     * Auto-refresh timer reference
     */
    var autoRefreshTimer = null;

    /**
     * Whether a refresh is currently in progress
     */
    var isRefreshing = false;

    /**
     * Initialize the daemon monitor on document ready
     */
    $(document).ready(function() {
        initDaemonMonitor();
    });

    /**
     * Initialize the daemon monitor
     */
    function initDaemonMonitor() {
        // Bind manual refresh button
        $('#geometry-os-refresh-daemons').on('click', function(e) {
            e.preventDefault();
            refreshDaemons(true);
        });

        // Start auto-refresh
        startAutoRefresh();

        // Initial refresh to ensure data is current
        refreshDaemons(false);
    }

    /**
     * Start auto-refresh timer
     */
    function startAutoRefresh() {
        // Clear any existing timer
        stopAutoRefresh();

        // Set new timer
        autoRefreshTimer = setInterval(function() {
            refreshDaemons(false);
        }, REFRESH_INTERVAL);
    }

    /**
     * Stop auto-refresh timer
     */
    function stopAutoRefresh() {
        if (autoRefreshTimer) {
            clearInterval(autoRefreshTimer);
            autoRefreshTimer = null;
        }
    }

    /**
     * Main refresh function - fetches daemon status and updates UI
     *
     * @param {boolean} forceRefresh Whether to force a cache bypass
     */
    function refreshDaemons(forceRefresh) {
        // Prevent concurrent refreshes
        if (isRefreshing) {
            return;
        }

        isRefreshing = true;

        // Show loading state on button if manual refresh
        if (forceRefresh) {
            setRefreshButtonState(true);
        }

        fetchDaemonStatus(forceRefresh)
            .done(function(response) {
                if (response.success && response.data) {
                    updateDaemonCards(response.data);
                    updateLastUpdatedTime();
                } else {
                    handleRefreshError(response.data ? response.data.message : 'Unknown error');
                }
            })
            .fail(function(xhr, status, error) {
                handleRefreshError(error || 'Network error');
            })
            .always(function() {
                isRefreshing = false;
                if (forceRefresh) {
                    setRefreshButtonState(false);
                }
            });
    }

    /**
     * Fetch daemon status via AJAX
     *
     * @param {boolean} forceRefresh Whether to force cache bypass
     * @return {jQuery.Promise} AJAX promise
     */
    function fetchDaemonStatus(forceRefresh) {
        return $.ajax({
            url: geometryOSDaemons.ajaxUrl,
            type: 'POST',
            data: {
                action: 'geometry_os_daemon_status',
                nonce: geometryOSDaemons.nonce,
                force: forceRefresh ? 'true' : 'false'
            }
        });
    }

    /**
     * Update all daemon cards with new data
     *
     * @param {Object} data Daemon status data from server
     */
    function updateDaemonCards(data) {
        var daemons = data.daemons || data;

        $.each(daemons, function(daemonId, daemon) {
            updateDaemonCard(daemonId, daemon);
        });
    }

    /**
     * Update a single daemon card in the DOM
     *
     * @param {string} daemonId Daemon identifier
     * @param {Object} daemon Daemon status object
     */
    function updateDaemonCard(daemonId, daemon) {
        var $card = $('.geometry-os-daemon-card[data-daemon-id="' + daemonId + '"]');

        if ($card.length === 0) {
            return;
        }

        // Update status indicator
        var $indicator = $card.find('.geometry-os-daemon-status-indicator');
        var isRunning = daemon.running === true || daemon.status === 'running';

        $indicator
            .removeClass('geometry-os-daemon-status-running geometry-os-daemon-status-stopped')
            .addClass(isRunning ? 'geometry-os-daemon-status-running' : 'geometry-os-daemon-status-stopped')
            .html(isRunning ? '&#x1F7E2;' : '&#x1F534;');

        // Update metrics container
        var $body = $card.find('.geometry-os-daemon-card-body');
        var metricsHtml = buildMetricsHtml(daemon, isRunning);
        $body.find('.geometry-os-daemon-metrics').html(metricsHtml);

        // Update last check time
        $card.find('.geometry-os-daemon-last-check').html(
            'Checked: ' + (daemon.last_check || 'Just now')
        );

        // Add visual feedback for status change
        $card.addClass('geometry-os-daemon-updated');
        setTimeout(function() {
            $card.removeClass('geometry-os-daemon-updated');
        }, 500);
    }

    /**
     * Build metrics HTML for a daemon card
     *
     * @param {Object} daemon Daemon status object
     * @param {boolean} isRunning Whether daemon is running
     * @return {string} HTML string for metrics
     */
    function buildMetricsHtml(daemon, isRunning) {
        if (isRunning) {
            return '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">Status:</span>' +
                '<span class="geometry-os-daemon-metric-value geometry-os-status-running">Running</span>' +
                '</div>' +
                '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">PID:</span>' +
                '<span class="geometry-os-daemon-metric-value">' + escapeHtml(daemon.pid || 'N/A') + '</span>' +
                '</div>' +
                '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">Uptime:</span>' +
                '<span class="geometry-os-daemon-metric-value">' + escapeHtml(daemon.uptime || 'N/A') + '</span>' +
                '</div>' +
                '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">CPU:</span>' +
                '<span class="geometry-os-daemon-metric-value">' + escapeHtml(daemon.cpu || 'N/A') + '</span>' +
                '</div>' +
                '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">Memory:</span>' +
                '<span class="geometry-os-daemon-metric-value">' + escapeHtml(daemon.memory || 'N/A') + '</span>' +
                '</div>';
        } else {
            return '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">Status:</span>' +
                '<span class="geometry-os-daemon-metric-value geometry-os-status-stopped">Stopped</span>' +
                '</div>' +
                '<div class="geometry-os-daemon-metric">' +
                '<span class="geometry-os-daemon-metric-label">Process:</span>' +
                '<span class="geometry-os-daemon-metric-value geometry-os-process-name">' + escapeHtml(daemon.process_name || 'Unknown') + '</span>' +
                '</div>';
        }
    }

    /**
     * Update the last updated timestamp display
     */
    function updateLastUpdatedTime() {
        var now = new Date();
        var timeString = now.toLocaleTimeString();
        $('#geometry-os-last-updated').text(timeString);
    }

    /**
     * Set refresh button loading state
     *
     * @param {boolean} isLoading Whether to show loading state
     */
    function setRefreshButtonState(isLoading) {
        var $button = $('#geometry-os-refresh-daemons');
        var $icon = $button.find('.dashicons');

        if (isLoading) {
            $button.prop('disabled', true);
            $icon.addClass('geometry-os-spinning');
        } else {
            $button.prop('disabled', false);
            $icon.removeClass('geometry-os-spinning');
        }
    }

    /**
     * Handle refresh errors
     *
     * @param {string} message Error message
     */
    function handleRefreshError(message) {
        // Log error to console for debugging
        console.error('Geometry OS Daemons refresh error:', message);

        // Could show admin notice here if needed
    }

    /**
     * Escape HTML special characters
     *
     * @param {string} str String to escape
     * @return {string} Escaped string
     */
    function escapeHtml(str) {
        if (typeof str !== 'string') {
            return str;
        }
        var map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return str.replace(/[&<>"']/g, function(m) { return map[m]; });
    }

    // Expose refresh function for external use (e.g., console debugging)
    window.geometryOSRefreshDaemons = refreshDaemons;

})(jQuery);
