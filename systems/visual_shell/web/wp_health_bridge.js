/**
 * Geometry OS: WordPress Health Bridge
 *
 * IIFE that initializes the SystemHealthDashboard in WordPress Mission Control.
 * Waits for DOM and SystemHealthDashboard class availability.
 *
 * Dependencies:
 *   - MetricsCollector.js (geometry-os-metrics)
 *   - SystemHealthDashboard.js (geometry-os-health-dashboard)
 *
 * WordPress Integration:
 *   1. Copy MetricsCollector.js and wp_health_bridge.js to WordPress
 *   2. Or load from Infinite Map server via geometry_os_heartbeat.php plugin
 *   3. Heartbeat sends metrics to /wp-json/geometry-os/v1/health every 60s
 */

(function() {
    'use strict';

    // Namespace for Geometry OS
    window.geometryOSApp = window.geometryOSApp || {};

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
        const reconnects = metrics.reconnectCount || 0;
        if (reconnects > 5) score -= 15;
        else if (reconnects > 0) score -= 5;

        return Math.max(0, Math.min(100, score));
    }

    /**
     * Start health heartbeat to WordPress
     * Sends metrics every 60 seconds
     */
    function startHealthHeartbeat() {
        // Initialize MetricsCollector if not already created
        if (!window.geometryOSMetrics && typeof MetricsCollector !== 'undefined') {
            window.geometryOSMetrics = new MetricsCollector();
            console.log('%c[System Health] MetricsCollector initialized', 'color: #00ffcc');
        }

        // Check for MetricsCollector availability
        if (!window.geometryOSMetrics && typeof window.MetricsCollector === 'undefined') {
            console.warn('%c[System Health] MetricsCollector not available for heartbeat.', 'color: #ffcc00');
            return false;
        }

        // Use existing instance or create new one
        const metricsInstance = window.geometryOSMetrics ||
            (typeof window.MetricsCollector !== 'undefined' ? new MetricsCollector() : null);

        if (!metricsInstance) {
            console.warn('%c[System Health] No metrics instance available.', 'color: #ffcc00');
            return false;
        }

        window.geometryOSMetrics = metricsInstance;

        /**
         * Send heartbeat to WordPress REST API
         */
        function sendHeartbeat() {
            const metrics = metricsInstance.getAllMetrics();

            if (!metrics) {
                console.warn('%c[System Health] No metrics available for heartbeat.', 'color: #ffcc00');
                return;
            }

            const healthScore = calculateHealthScore(metrics);

            const payload = {
                latency_ms: Math.round(metrics.avgLatency || 0),
                swarm_count: metrics.tileCount || 0,
                health_score: healthScore,
                buffer_drops: metrics.bufferDrops || 0,
                reconnects: metrics.reconnectCount || 0,
                sync_count: metrics.syncCount || 0,
                timestamp: metrics.timestamp || Date.now()
            };

            // Get API URL from WordPress config or use default
            // Support both pretty permalinks (/wp-json/...) and query params (?rest_route=...)
            let endpoint;
            if (window.geometryOSConfig && window.geometryOSConfig.apiUrl) {
                endpoint = window.geometryOSConfig.apiUrl + '/health';
            } else {
                // Use rest_route query param (works with PHP built-in server)
                endpoint = '/?rest_route=/geometry-os/v1/health';
            }

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

        // Set up 60-second interval (configurable via geometryOSConfig)
        const interval = (window.geometryOSConfig && window.geometryOSConfig.heartbeatInterval) || 60000;
        const intervalId = setInterval(sendHeartbeat, interval);

        // Store interval ID for potential cleanup
        window.geometryOSApp.heartbeatIntervalId = intervalId;

        console.log('%c[System Health] Heartbeat started (' + (interval/1000) + 's interval)', 'color: #00ffcc');

        // Expose sendHeartbeat for manual triggering
        window.geometryOSApp.wpHealthBridge = {
            sendHeartbeat: sendHeartbeat,
            stopHeartbeat: function() {
                clearInterval(intervalId);
                console.log('%c[System Health] Heartbeat stopped', 'color: #ffcc00');
            },
            getMetrics: function() {
                return metricsInstance.getAllMetrics();
            }
        };

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
