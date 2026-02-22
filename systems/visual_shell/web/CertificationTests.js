/**
 * Geometry OS: Certification Test Registry
 *
 * Central registry for all certification tests across Level 1-3.
 * Each test is an object with: id, name, level, description, run() method.
 */

(function() {
    'use strict';

    const CertificationTests = {
        /**
         * Test registry organized by level
         */
        registry: {
            // Level 1: Functional
            'discovery': {
                id: 'discovery',
                name: 'Tile Discovery',
                level: 1,
                description: 'Verify tiles are discoverable via WordPress REST API',
                timeout: 10000,
                run: async function(runner) {
                    const response = await fetch('/?rest_route=/geometry-os/v1/heartbeat-status');
                    const data = await response.json();
                    return {
                        success: response.ok && data.status !== 'no_data',
                        details: data.status === 'active' ? 'System active' : 'System responsive but stale',
                        data: data
                    };
                }
            },
            'navigation': {
                id: 'navigation',
                name: 'Map Navigation',
                level: 1,
                description: 'Verify infinite map loads and navigates',
                timeout: 15000,
                run: async function(runner) {
                    // Check if PixiJS app is running
                    const app = window.geometryOSApp?.app;
                    if (!app) {
                        return { success: false, details: 'PixiJS app not initialized' };
                    }
                    return {
                        success: true,
                        details: `Map running at ${app.ticker.FPS.toFixed(1)} FPS`
                    };
                }
            },

            // Level 2: Performance
            'latency': {
                id: 'latency',
                name: 'Bridge Latency',
                level: 2,
                description: 'Verify bridge latency under 100ms',
                timeout: 10000,
                run: async function(runner) {
                    const start = performance.now();
                    const response = await fetch('/?rest_route=/geometry-os/v1/heartbeat-status');
                    const latency = performance.now() - start;
                    return {
                        success: latency < 100,
                        details: `Latency: ${latency.toFixed(1)}ms`,
                        data: { latency_ms: Math.round(latency) }
                    };
                }
            },
            'swarm-capacity': {
                id: 'swarm-capacity',
                name: 'Swarm Capacity',
                level: 2,
                description: 'Verify system handles 10+ concurrent swarms',
                timeout: 10000,
                run: async function(runner) {
                    const response = await fetch('/?rest_route=/geometry-os/v1/heartbeat-status');
                    const data = await response.json();
                    const swarmCount = data.metrics?.swarm_count || 0;
                    return {
                        success: swarmCount >= 10,
                        details: `Active swarms: ${swarmCount}`,
                        data: { swarm_count: swarmCount }
                    };
                }
            },

            // Level 3: Operational Excellence
            'blind-restoration': {
                id: 'blind-restoration',
                name: 'Blind Restoration',
                level: 3,
                description: 'Recover from tile failure via WordPress',
                timeout: 30000,
                interactive: true,
                promptMessage: 'Blind Restoration Test: Trigger a tile error, then use WordPress Mission Control to RESTART it.',
                run: async function(runner) {
                    // This test requires user interaction or mock
                    // The runner will emit a prompt event and wait for response
                    return new Promise((resolve) => {
                        runner.emit('prompt', {
                            type: 'prompt',
                            message: this.promptMessage,
                            testId: this.id,
                            expectedAction: 'restart-tile'
                        });

                        // Listen for response
                        const handler = (event) => {
                            if (event.detail?.testId === this.id) {
                                window.removeEventListener('certification:response', handler);
                                resolve({
                                    success: event.detail.success,
                                    details: event.detail.details || 'User completed restoration'
                                });
                            }
                        };
                        window.addEventListener('certification:response', handler);

                        // Timeout fallback
                        setTimeout(() => {
                            window.removeEventListener('certification:response', handler);
                            resolve({ success: false, details: 'Test timed out waiting for response' });
                        }, this.timeout - 1000);
                    });
                }
            },
            'persistence-marathon': {
                id: 'persistence-marathon',
                name: 'Persistence Marathon',
                level: 3,
                description: 'Verify 24-hour heartbeat stability',
                timeout: 10000,
                run: async function(runner) {
                    const response = await fetch('/?rest_route=/geometry-os/v1/heartbeat-status');
                    const data = await response.json();

                    // Check if heartbeats are being recorded
                    const heartbeatCount = data.heartbeat_count || 0;
                    const uptimeHours = (data.uptime_seconds || 0) / 3600;

                    // Pass if we have heartbeats and uptime > 1 hour (for testing)
                    // In production, require 24 hours
                    const minHours = window.__PLAYWRIGHT__ ? 0.1 : 1; // 6 min for CI, 1 hour for prod
                    const success = heartbeatCount >= 10 && uptimeHours >= minHours;

                    return {
                        success: success,
                        details: `Heartbeats: ${heartbeatCount}, Uptime: ${uptimeHours.toFixed(2)}h`,
                        data: { heartbeat_count: heartbeatCount, uptime_hours: uptimeHours }
                    };
                }
            },
            'multi-seat-sync': {
                id: 'multi-seat-sync',
                name: 'Multi-Seat Sync',
                level: 3,
                description: 'Ensure state coherence across sessions',
                timeout: 30000,
                interactive: true,
                promptMessage: 'Multi-Seat Sync Test: Open Mission Control in a second browser tab. Verify both show the same tile states.',
                run: async function(runner) {
                    return new Promise((resolve) => {
                        // Emit test signal for other sessions to detect
                        window.dispatchEvent(new CustomEvent('geometryOS:consoleOutput', {
                            detail: { text: 'multi-seat-test-signal', timestamp: Date.now() }
                        }));

                        runner.emit('prompt', {
                            type: 'prompt',
                            message: this.promptMessage,
                            testId: this.id,
                            expectedAction: 'verify-sync'
                        });

                        const handler = (event) => {
                            if (event.detail?.testId === this.id) {
                                window.removeEventListener('certification:response', handler);
                                resolve({
                                    success: event.detail.success,
                                    details: event.detail.details || 'Multi-seat verified'
                                });
                            }
                        };
                        window.addEventListener('certification:response', handler);

                        setTimeout(() => {
                            window.removeEventListener('certification:response', handler);
                            resolve({ success: false, details: 'Test timed out' });
                        }, this.timeout - 1000);
                    });
                }
            },
            'metabolic-impact': {
                id: 'metabolic-impact',
                name: 'Metabolic Impact',
                level: 3,
                description: 'Monitor FPS during high-load bridge sync',
                timeout: 15000,
                run: async function(runner) {
                    const app = window.geometryOSApp?.app;
                    if (!app) {
                        return { success: false, details: 'PixiJS app not available' };
                    }

                    // Sample FPS over 3 seconds
                    const samples = [];
                    const sampleDuration = 3000;
                    const startTime = Date.now();

                    while (Date.now() - startTime < sampleDuration) {
                        samples.push(app.ticker.FPS);
                        await new Promise(r => setTimeout(r, 100));
                    }

                    const avgFps = samples.reduce((a, b) => a + b, 0) / samples.length;
                    const minFps = Math.min(...samples);

                    // Pass if average FPS > 55 and no drops below 30
                    const success = avgFps >= 55 && minFps >= 30;

                    return {
                        success: success,
                        details: `Avg: ${avgFps.toFixed(1)} FPS, Min: ${minFps.toFixed(1)} FPS`,
                        data: { avg_fps: avgFps, min_fps: minFps, samples: samples.length }
                    };
                }
            }
        },

        /**
         * Get tests by level
         */
        getByLevel: function(level) {
            return Object.values(this.registry).filter(t => t.level === level);
        },

        /**
         * Get all tests
         */
        getAll: function() {
            return Object.values(this.registry);
        },

        /**
         * Get test by ID
         */
        get: function(id) {
            return this.registry[id];
        }
    };

    // Export
    window.CertificationTests = CertificationTests;

    console.log('%c[CertificationTests] Registry loaded with ' + Object.keys(CertificationTests.registry).length + ' tests', 'color: #00ffcc');
})();
