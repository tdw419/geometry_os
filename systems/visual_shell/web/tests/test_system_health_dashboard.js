/**
 * Geometry OS: SystemHealthDashboard Unit Tests
 *
 * Tests the SystemHealthDashboard class for rendering,
 * event handling, and status evaluation.
 *
 * Usage:
 *   1. Include SystemHealthDashboard.js and this test file in the browser.
 *   2. Run: const tester = new SystemHealthDashboardTester(); await tester.runAll();
 */

class SystemHealthDashboardTester {
    constructor() {
        this.results = [];
        this.dashboard = null;
        this.testContainer = null;
    }

    /**
     * Run all tests
     */
    async runAll() {
        console.log('%c[SystemHealthDashboard Tests] Starting...', 'color: #00ffcc; font-size: 16px; font-weight: bold;');

        // Setup
        this.setup();

        // Run tests
        await this.test_render_table();
        await this.test_update_on_event();
        await this.test_pass_status_low_latency();
        await this.test_warn_status_high_latency();

        // Report
        this.report();

        // Cleanup
        this.teardown();
    }

    setup() {
        // Create a test container
        this.testContainer = document.createElement('div');
        this.testContainer.id = 'test-dashboard-container';
        document.body.appendChild(this.testContainer);

        // Create dashboard instance
        this.dashboard = new SystemHealthDashboard(this.testContainer, {
            latencyTarget: 100,
            tileTarget: 100
        });

        this.results = [];
    }

    teardown() {
        if (this.dashboard) {
            this.dashboard.destroy();
            this.dashboard = null;
        }

        if (this.testContainer && this.testContainer.parentNode) {
            this.testContainer.parentNode.removeChild(this.testContainer);
            this.testContainer = null;
        }
    }

    /**
     * Test 1: Verify table elements exist after render
     */
    async test_render_table() {
        console.log('%c  Test: render_table', 'color: #ffcc00;');

        try {
            // Verify container has content
            const container = this.testContainer;
            if (!container.innerHTML) {
                throw new Error('Container is empty after render');
            }

            // Verify dashboard wrapper exists
            const dashboard = container.querySelector('.system-health-dashboard');
            if (!dashboard) {
                throw new Error('Dashboard wrapper not found');
            }

            // Verify header exists
            const header = container.querySelector('.shd-header');
            if (!header) {
                throw new Error('Header not found');
            }

            // Verify title
            const title = container.querySelector('.shd-title');
            if (!title || title.textContent !== 'SYSTEM HEALTH') {
                throw new Error('Title not found or incorrect');
            }

            // Verify table exists
            const table = container.querySelector('.shd-table');
            if (!table) {
                throw new Error('Table not found');
            }

            // Verify rows exist (5 metrics)
            const rows = table.querySelectorAll('tbody tr');
            if (rows.length !== 5) {
                throw new Error(`Expected 5 metric rows, got ${rows.length}`);
            }

            // Verify metric names
            const expectedMetrics = ['Bridge Latency', 'Tile Count', 'Sync Coherence', 'Buffer Drops', 'Reconnects'];
            const metricCells = table.querySelectorAll('.shd-metric-name');
            expectedMetrics.forEach((expected, i) => {
                if (metricCells[i] && metricCells[i].textContent !== expected) {
                    throw new Error(`Expected metric "${expected}", got "${metricCells[i].textContent}"`);
                }
            });

            this.logResult('render_table', true, 'All table elements rendered correctly');
        } catch (error) {
            this.logResult('render_table', false, error.message);
        }
    }

    /**
     * Test 2: Verify metrics update when event fires
     */
    async test_update_on_event() {
        console.log('%c  Test: update_on_event', 'color: #ffcc00;');

        return new Promise((resolve) => {
            try {
                // Get initial latency value
                const getLatencyValue = () => {
                    const cell = this.testContainer.querySelector('.shd-value');
                    return cell ? cell.textContent : null;
                };

                const initialValue = getLatencyValue();

                // Dispatch metrics update event
                const newMetrics = {
                    avgLatency: 42.5,
                    tileCount: 10,
                    syncCount: 5,
                    bufferDrops: 0,
                    reconnectCount: 0,
                    timestamp: Date.now()
                };

                window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
                    detail: newMetrics
                }));

                // Wait for render to complete
                setTimeout(() => {
                    try {
                        const updatedValue = getLatencyValue();

                        // Verify value changed
                        if (updatedValue === initialValue) {
                            this.logResult('update_on_event', false, 'Value did not change after event');
                        } else if (updatedValue !== '42.5 ms') {
                            this.logResult('update_on_event', false, `Expected "42.5 ms", got "${updatedValue}"`);
                        } else {
                            // Also check tile count updated
                            const tileValue = this.testContainer.querySelectorAll('.shd-value')[1];
                            if (tileValue && tileValue.textContent === '10') {
                                this.logResult('update_on_event', true, 'Metrics updated correctly on event');
                            } else {
                                this.logResult('update_on_event', false, 'Tile count not updated correctly');
                            }
                        }
                    } catch (e) {
                        this.logResult('update_on_event', false, e.message);
                    }
                    resolve();
                }, 50);
            } catch (error) {
                this.logResult('update_on_event', false, error.message);
                resolve();
            }
        });
    }

    /**
     * Test 3: Verify PASS status for low latency (< 100ms)
     */
    async test_pass_status_low_latency() {
        console.log('%c  Test: pass_status_low_latency', 'color: #ffcc00;');

        try {
            // Test getStatus method directly
            const status = this.dashboard.getStatus(50, 100, true);  // 50ms latency, 100ms target, inverse=true

            if (status !== 'PASS') {
                throw new Error(`Expected PASS for 50ms latency, got ${status}`);
            }

            // Test getStatusColor
            const color = this.dashboard.getStatusColor('PASS');
            if (color !== '#00ff00') {
                throw new Error(`Expected #00ff00 for PASS, got ${color}`);
            }

            // Dispatch event with low latency and verify UI
            window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
                detail: {
                    avgLatency: 50,
                    tileCount: 10,
                    syncCount: 5,
                    bufferDrops: 0,
                    reconnectCount: 0,
                    timestamp: Date.now()
                }
            }));

            // Wait for render
            await this.sleep(50);

            // Check status cell for Bridge Latency row
            const statusCells = this.testContainer.querySelectorAll('.shd-status');
            const latencyStatus = statusCells[0]; // First row is Bridge Latency

            if (!latencyStatus) {
                throw new Error('Status cell not found');
            }

            if (latencyStatus.textContent !== 'PASS') {
                throw new Error(`UI shows ${latencyStatus.textContent} instead of PASS`);
            }

            if (!latencyStatus.classList.contains('shd-status-pass')) {
                throw new Error('Status cell missing shd-status-pass class');
            }

            this.logResult('pass_status_low_latency', true, 'PASS status correctly shown for 50ms latency');
        } catch (error) {
            this.logResult('pass_status_low_latency', false, error.message);
        }
    }

    /**
     * Test 4: Verify WARN status for high latency (> 100ms)
     */
    async test_warn_status_high_latency() {
        console.log('%c  Test: warn_status_high_latency', 'color: #ffcc00;');

        try {
            // Test getStatus method directly
            const status = this.dashboard.getStatus(150, 100, true);  // 150ms latency, 100ms target, inverse=true

            if (status !== 'WARN') {
                throw new Error(`Expected WARN for 150ms latency, got ${status}`);
            }

            // Test getStatusColor
            const color = this.dashboard.getStatusColor('WARN');
            if (color !== '#ffcc00') {
                throw new Error(`Expected #ffcc00 for WARN, got ${color}`);
            }

            // Dispatch event with high latency and verify UI
            window.dispatchEvent(new CustomEvent('geometryOS:metricsUpdate', {
                detail: {
                    avgLatency: 150,
                    tileCount: 10,
                    syncCount: 5,
                    bufferDrops: 0,
                    reconnectCount: 0,
                    timestamp: Date.now()
                }
            }));

            // Wait for render
            await this.sleep(50);

            // Check status cell for Bridge Latency row
            const statusCells = this.testContainer.querySelectorAll('.shd-status');
            const latencyStatus = statusCells[0]; // First row is Bridge Latency

            if (!latencyStatus) {
                throw new Error('Status cell not found');
            }

            if (latencyStatus.textContent !== 'WARN') {
                throw new Error(`UI shows ${latencyStatus.textContent} instead of WARN`);
            }

            if (!latencyStatus.classList.contains('shd-status-warn')) {
                throw new Error('Status cell missing shd-status-warn class');
            }

            this.logResult('warn_status_high_latency', true, 'WARN status correctly shown for 150ms latency');
        } catch (error) {
            this.logResult('warn_status_high_latency', false, error.message);
        }
    }

    logResult(name, success, details) {
        const symbol = success ? '✅' : '❌';
        console.log(`    ${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    report() {
        console.log('\n' + '='.repeat(50));
        console.log('%cSystemHealthDashboard Test Report', 'color: #00ffcc; font-weight: bold;');
        console.log('='.repeat(50));

        const passed = this.results.filter(r => r.success).length;
        const total = this.results.length;
        const color = passed === total ? 'color: #00ff00' : 'color: #ff4444';

        console.log(`%cPASSED: ${passed}/${total}`, `${color}; font-weight: bold;`);

        this.results.forEach(r => {
            console.log(`  ${r.success ? '✅' : '❌'} ${r.name.padEnd(25)} | ${r.details}`);
        });

        console.log('='.repeat(50));
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

// Export for Node.js testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SystemHealthDashboardTester };
}

// Convenience auto-run message
console.log('%c[SystemHealthDashboard Tests] Loaded. Run: const t = new SystemHealthDashboardTester(); await t.runAll();', 'color: #00ffcc');
