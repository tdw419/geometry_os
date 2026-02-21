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
     * Wait for DOM and required classes, then initialize
     */
    function onReady() {
        // Check if DOM is ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initHealthDashboard);
        } else {
            // DOM already loaded
            initHealthDashboard();
        }
    }

    // Start initialization
    onReady();
})();
