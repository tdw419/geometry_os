/**
 * Geometry OS LLM Router Dashboard - Auto-Refresh Monitor
 *
 * Handles automatic and manual refresh of router status.
 *
 * @package Geometry_OS_LLM_Router
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
     * Initialize the monitor on document ready
     */
    $(document).ready(function() {
        initRouterMonitor();
    });

    /**
     * Initialize the router monitor
     */
    function initRouterMonitor() {
        // Bind manual refresh button
        $('#geometry-os-refresh-router').on('click', function(e) {
            e.preventDefault();
            refreshRouterStatus(true);
        });

        // Start auto-refresh
        startAutoRefresh();

        // Initial refresh
        refreshRouterStatus(false);
    }

    /**
     * Start auto-refresh timer
     */
    function startAutoRefresh() {
        stopAutoRefresh();
        autoRefreshTimer = setInterval(function() {
            refreshRouterStatus(false);
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
     * Main refresh function
     *
     * @param {boolean} forceRefresh Whether to force a cache bypass
     */
    function refreshRouterStatus(forceRefresh) {
        if (isRefreshing) {
            return;
        }

        isRefreshing = true;

        if (forceRefresh) {
            setRefreshButtonState(true);
        }

        fetchRouterStatus()
            .done(function(response) {
                if (response.success && response.data) {
                    updateRouterStatus(response.data);
                    updateLastUpdatedTime();
                }
            })
            .fail(function() {
                handleRefreshError();
            })
            .always(function() {
                isRefreshing = false;
                if (forceRefresh) {
                    setRefreshButtonState(false);
                }
            });
    }

    /**
     * Fetch router status via AJAX
     *
     * @return {jQuery.Promise}
     */
    function fetchRouterStatus() {
        return $.ajax({
            url: geometryOSLLMRouter.ajaxUrl,
            type: 'POST',
            data: {
                action: 'geometry_os_router_status',
                nonce: geometryOSLLMRouter.nonce
            }
        });
    }

    /**
     * Update router status display
     *
     * @param {Object} data Status data
     */
    function updateRouterStatus(data) {
        // Update proxy status
        updateStatusIndicator('proxy', data.proxy && data.proxy.status);

        $('#geometry-os-proxy-status-text').text(
            data.proxy && data.proxy.status === 'online'
                ? geometryOSLLMRouter.i18n.online
                : geometryOSLLMRouter.i18n.offline
        );

        // Update Claude status
        updateStatusIndicator('claude', data.claude && data.claude.status);

        $('#geometry-os-claude-status-text').text(
            data.claude && data.claude.status === 'configured'
                ? 'Configured'
                : 'Not Configured'
        );

        if (data.claude && data.claude.model) {
            $('#geometry-os-claude-model-text').text(data.claude.model);
        }

        // Update local status
        $('#geometry-os-local-status-text').text(
            data.lm_studio && data.lm_studio.status === 'available'
                ? 'Available'
                : 'Unavailable'
        );

        if (data.lm_studio && data.lm_studio.model) {
            $('#geometry-os-local-model-text').text(data.lm_studio.model);
        }

        // Update fallback counts
        if (data.fallback) {
            $('#geometry-os-fallback-today').text(formatNumber(data.fallback.today || 0));
            $('#geometry-os-fallback-week').text(formatNumber(data.fallback.week || 0));
        }

        // Update token usage
        if (data.tokens) {
            $('#geometry-os-tokens-hour').text(formatNumber(data.tokens.hour || 0));
            $('#geometry-os-tokens-day').text(formatNumber(data.tokens.day || 0));
            $('#geometry-os-tokens-week').text(formatNumber(data.tokens.week || 0));

            // Update gauge (assume 100k tokens per hour as max for visualization)
            var maxTokens = 100000;
            var percentage = Math.min((data.tokens.hour || 0) / maxTokens * 100, 100);
            $('#geometry-os-token-gauge-fill').css('width', percentage + '%');
        }
    }

    /**
     * Update status indicator
     *
     * @param {string} service Service name
     * @param {string} status Status value
     */
    function updateStatusIndicator(service, status) {
        var $indicator = $('#geometry-os-' + service + '-status-indicator');
        var isOnline = status === 'online' || status === 'configured' || status === 'available';

        $indicator
            .toggleClass('geometry-os-llm-status-online', isOnline)
            .toggleClass('geometry-os-llm-status-offline', !isOnline);
    }

    /**
     * Update last updated timestamp
     */
    function updateLastUpdatedTime() {
        var now = new Date();
        $('#geometry-os-llm-last-updated').text(
            now.toLocaleTimeString()
        );
    }

    /**
     * Set refresh button loading state
     *
     * @param {boolean} isLoading
     */
    function setRefreshButtonState(isLoading) {
        var $button = $('#geometry-os-refresh-router');
        var $icon = $button.find('.dashicons');

        $button.prop('disabled', isLoading);
        $icon.toggleClass('geometry-os-spinning', isLoading);
    }

    /**
     * Handle refresh errors
     */
    function handleRefreshError() {
        console.error('Geometry OS LLM Router: Refresh failed');
    }

    /**
     * Format number with commas
     *
     * @param {number} num
     * @return {string}
     */
    function formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    // Expose for external use
    window.geometryOSRefreshRouter = refreshRouterStatus;

})(jQuery);
