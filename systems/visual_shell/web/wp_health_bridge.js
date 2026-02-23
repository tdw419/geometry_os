/**
 * Geometry OS: WordPress Health Bridge
 *
 * IIFE that initializes the SystemHealthDashboard in WordPress Mission Control.
 * Waits for DOM and SystemHealthDashboard class availability.
 *
 * Dependencies:
 *   - MetricsCollector.js (geometry-os-metrics)
 *   - SystemHealthDashboard.js (geometry-os-health-dashboard)
 */

(function() {
    'use strict';

    /**
     * Initialize the System Health Dashboard in WordPress Mission Control
     */
    function initHealthDashboard() {
        // Check for SystemHealthDashboard class
        if (typeof SystemHealthDashboard === 'undefined') {
            console.warn('%c[System Health] SystemHealthDashboard class not found. Ensure script is enqueued.', 'color: #ffcc00');
            return false;
        }

        // Find or create container
        let container = document.querySelector('#geometry-os-health-dashboard');

        if (!container) {
            // Create container if it doesn't exist
            container = document.createElement('div');
            container.id = 'geometry-os-health-dashboard';
            container.setAttribute('data-geometry-os-component', 'health-dashboard');
        }

        // Find Mission Control widget area
        // Common WordPress widget selectors to try
        const widgetSelectors = [
            '#geometry-os-mission-control',
            '#mission-control-widget',
            '.geometry-os-widget',
            '#wpbody-content .wrap',
            '#dashboard-widgets',
            '.wp-dashboard-metabox'
        ];

        let targetArea = null;
        for (const selector of widgetSelectors) {
            targetArea = document.querySelector(selector);
            if (targetArea) break;
        }

        // Insert at top of widget area or append to body
        if (targetArea) {
            targetArea.insertBefore(container, targetArea.firstChild);
        } else {
            // Fallback: append to body
            document.body.appendChild(container);
        }

        // Initialize dashboard
        try {
            window.geometryOSHealthDashboard = new SystemHealthDashboard(container, {
                latencyTarget: 100,
                tileTarget: 100
            });

            console.log('%c[System Health] Dashboard initialized', 'color: #00ffcc');
            return true;
        } catch (err) {
            console.error('%c[System Health] Failed to initialize dashboard:', 'color: #ff4444', err);
            return false;
        }
    }

    /**
     * Calculate health score from metrics
     *
     * @param {Object} metrics - Health metrics object
     * @returns {number} Health score 0-100
     */
    function calculateHealthScore(metrics) {
        if (!metrics) return 100;

        let score = 100;

        // Latency penalty (target: <100ms)
        const latency = metrics.avgLatency || 0;
        if (latency > 200) score -= 20;
        else if (latency > 100) score -= 10;

        // Buffer drops penalty
        const drops = metrics.bufferDrops || 0;
        if (drops > 10) score -= 15;
        else if (drops > 0) score -= 5;

        // Reconnect penalty
        const reconnects = metrics.reconnects || 0;
        if (reconnects > 5) score -= 15;
        else if (reconnects > 0) score -= 5;

        return Math.max(0, Math.min(100, score));
    }

    /**
     * Start health heartbeat to WordPress
     * Sends metrics every 60 seconds
     */
    function startHealthHeartbeat() {
        // Check for MetricsCollector availability
        if (!window.geometryOSMetrics) {
            console.warn('%c[System Health] MetricsCollector not available for heartbeat.', 'color: #ffcc00');
            return false;
        }

        /**
         * Send heartbeat to WordPress REST API
         */
        function sendHeartbeat() {
            const metrics = window.geometryOSMetrics.getAllMetrics();

            if (!metrics) {
                console.warn('%c[System Health] No metrics available for heartbeat.', 'color: #ffcc00');
                return;
            }

            const healthScore = calculateHealthScore(metrics);

            const payload = {
                latency_ms: metrics.avgLatency || 0,
                swarm_count: metrics.tileCount || 0,
                health_score: healthScore,
                buffer_drops: metrics.bufferDrops || 0,
                reconnects: metrics.reconnects || 0
            };

            // Send to WordPress REST API
            const endpoint = '/wp-json/geometry-os/v1/health';

            fetch(endpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('%c[System Health] Heartbeat sent', 'color: #00ffcc', payload);
                } else {
                    console.warn('%c[System Health] Heartbeat failed:', 'color: #ffcc00', data);
                }
            })
            .catch(err => {
                console.warn('%c[System Health] Heartbeat error:', 'color: #ffcc00', err.message);
            });
        }

        // Send initial heartbeat
        sendHeartbeat();

        // Set up 60-second interval
        setInterval(sendHeartbeat, 60000);

        console.log('%c[System Health] Heartbeat started (60s interval)', 'color: #00ffcc');
        return true;
    }

    /**
     * Wait for DOM and required classes, then initialize
     */
    function onReady() {
        // Check if DOM is ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function() {
                initHealthDashboard();
                startHealthHeartbeat();
            });
        } else {
            // DOM already loaded
            initHealthDashboard();
            startHealthHeartbeat();
        }
    }

    // Start initialization
    onReady();
})();
