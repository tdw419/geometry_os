/**
 * Geometry OS LLM Router Analytics
 *
 * Handles charts and data visualization for the analytics page.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */
(function($) {
    'use strict';

    /**
     * Chart instances
     */
    var tokenChart = null;
    var modelChart = null;

    /**
     * Current period
     */
    var currentPeriod = '24h';

    /**
     * Initialize analytics on document ready
     */
    $(document).ready(function() {
        initAnalytics();
    });

    /**
     * Initialize analytics
     */
    function initAnalytics() {
        // Bind period selector buttons
        $('.geometry-os-llm-analytics-period-selector button').on('click', function() {
            var period = $(this).data('period');
            if (period && period !== currentPeriod) {
                setPeriod(period);
            }
        });

        // Bind refresh button
        $('#geometry-os-refresh-analytics').on('click', function() {
            loadAnalytics(currentPeriod);
        });

        // Load initial data
        loadAnalytics(currentPeriod);
    }

    /**
     * Set time period
     *
     * @param {string} period Period identifier
     */
    function setPeriod(period) {
        currentPeriod = period;
        $('#geometry-os-current-period').val(period);

        // Update button states
        $('.geometry-os-llm-analytics-period-selector button')
            .removeClass('button-primary')
            .filter('[data-period="' + period + '"]')
            .addClass('button-primary');

        loadAnalytics(period);
    }

    /**
     * Load analytics data
     *
     * @param {string} period Period identifier
     */
    function loadAnalytics(period) {
        $.ajax({
            url: geometryOSLLMRouter.ajaxUrl,
            type: 'POST',
            data: {
                action: 'geometry_os_router_analytics',
                nonce: geometryOSLLMRouter.nonce,
                period: period
            },
            beforeSend: function() {
                $('#geometry-os-refresh-analytics').prop('disabled', true);
            },
            success: function(response) {
                if (response.success && response.data) {
                    updateAnalytics(response.data);
                }
            },
            error: function() {
                console.error('Failed to load analytics data');
            },
            complete: function() {
                $('#geometry-os-refresh-analytics').prop('disabled', false);
            }
        });
    }

    /**
     * Update analytics display
     *
     * @param {Object} data Analytics data
     */
    function updateAnalytics(data) {
        // Update summary stats
        updateSummaryStats(data);

        // Update charts
        updateTokenChart(data.by_hour || []);
        updateModelChart(data.by_model || {});

        // Update model table
        updateModelTable(data.by_model || {});

        // Update fallback display
        updateFallbackDisplay(data.fallback_rate || 0);
    }

    /**
     * Update summary statistics
     *
     * @param {Object} data Analytics data
     */
    function updateSummaryStats(data) {
        $('#geometry-os-stat-requests').text(formatNumber(data.total_requests || 0));
        $('#geometry-os-stat-tokens').text(formatNumber(data.total_tokens || 0));
        $('#geometry-os-stat-fallback-rate').text((data.fallback_rate || 0) + '%');

        var avgTokens = data.total_requests > 0
            ? Math.round(data.total_tokens / data.total_requests)
            : 0;
        $('#geometry-os-stat-avg-tokens').text(formatNumber(avgTokens));
    }

    /**
     * Update token usage chart
     *
     * @param {Array} byHour Hourly usage data
     */
    function updateTokenChart(byHour) {
        var ctx = document.getElementById('geometry-os-token-chart');
        if (!ctx) return;

        var labels = [];
        var values = [];

        for (var i = 0; i < 24; i++) {
            labels.push(i + ':00');
            values.push(byHour[i] ? byHour[i].tokens || 0 : 0);
        }

        if (tokenChart) {
            tokenChart.destroy();
        }

        tokenChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Tokens Used',
                    data: values,
                    borderColor: '#2271b1',
                    backgroundColor: 'rgba(34, 113, 177, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return formatNumber(value);
                            }
                        }
                    }
                }
            }
        });
    }

    /**
     * Update model usage chart
     *
     * @param {Object} byModel Model usage data
     */
    function updateModelChart(byModel) {
        var ctx = document.getElementById('geometry-os-model-chart');
        if (!ctx) return;

        var labels = [];
        var values = [];

        for (var model in byModel) {
            labels.push(model);
            values.push(byModel[model].tokens || 0);
        }

        if (modelChart) {
            modelChart.destroy();
        }

        if (labels.length === 0) {
            labels.push('No data');
            values.push(1);
        }

        modelChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    data: values,
                    backgroundColor: [
                        '#2271b1',
                        '#46b450',
                        '#dc3232',
                        '#d54e21',
                        '#096484'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right'
                    }
                }
            }
        });
    }

    /**
     * Update model usage table
     *
     * @param {Object} byModel Model usage data
     */
    function updateModelTable(byModel) {
        var $tbody = $('#geometry-os-model-table-body');
        $tbody.empty();

        var hasData = false;

        for (var model in byModel) {
            hasData = true;
            var data = byModel[model];
            var avgTokens = data.requests > 0
                ? Math.round(data.tokens / data.requests)
                : 0;

            $tbody.append(
                '<tr>' +
                    '<td>' + escapeHtml(model) + '</td>' +
                    '<td>' + formatNumber(data.requests) + '</td>' +
                    '<td>' + formatNumber(data.tokens) + '</td>' +
                    '<td>' + formatNumber(data.fallbacks || 0) + '</td>' +
                    '<td>' + formatNumber(avgTokens) + '</td>' +
                '</tr>'
            );
        }

        if (!hasData) {
            $tbody.append(
                '<tr><td colspan="5" class="geometry-os-llm-no-data">' +
                'No usage data available for this period.' +
                '</td></tr>'
            );
        }
    }

    /**
     * Update fallback display
     *
     * @param {number} rate Fallback rate percentage
     */
    function updateFallbackDisplay(rate) {
        var $rate = $('#geometry-os-stat-fallback-rate');
        $rate.removeClass('geometry-os-fallback-low geometry-os-fallback-high');

        if (rate < 5) {
            $rate.addClass('geometry-os-fallback-low');
        } else if (rate > 20) {
            $rate.addClass('geometry-os-fallback-high');
        }
    }

    /**
     * Format number with commas
     *
     * @param {number} num
     * @return {string}
     */
    function formatNumber(num) {
        return Number(num).toLocaleString();
    }

    /**
     * Escape HTML
     *
     * @param {string} str
     * @return {string}
     */
    function escapeHtml(str) {
        var div = document.createElement('div');
        div.textContent = str;
        return div.innerHTML;
    }

})(jQuery);
