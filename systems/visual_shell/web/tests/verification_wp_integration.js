/**
 * Geometry OS WordPress Integration Verification Script
 * 
 * Automates the 5 Golden Path Tests to prove bidirectional 
 * communication between the PixiJS Map and WordPress.
 * 
 * Usage:
 *   1. Open the Mission Control page in WordPress.
 *   2. Paste this script into the browser console.
 *   3. Run: const verifier = new WPIntegrationVerifier(); await verifier.runAll();
 */

class WPIntegrationVerifier {
    constructor() {
        this.results = [];
        this.testDelay = 1000;
    }

    async runAll() {
        console.log("%c🚀 Starting Geometry OS Integration Verification...", "color: #00ffcc; font-size: 16px; font-weight: bold;");

        await this.test1_ZeroConfigDiscovery();
        await this.test2_BlindPilotNavigation();
        await this.test3_EchoLoopDuplex();
        await this.test4_SwarmHeartbeat();
        await this.test5_LateJoinerHistory();
        await this.test6_MetricsCollectorIntegration();
        await this.test7_HealthDashboardRender();

        this.report();
    }

    async test1_ZeroConfigDiscovery() {
        console.log("\n%cTest 1: Zero-Config Discovery", "color: #ffcc00; font-weight: bold;");
        const testId = 'test-agent-' + Math.floor(Math.random() * 1000);
        
        // Action: Register a new mock tile
        if (window.geometryOS?.registerTile) {
            window.geometryOS.registerTile(testId, { x: 100, y: 100, state: 'running' });
            
            // Verification: Check if button exists in WordPress DOM
            await this.sleep(500);
            const btn = document.querySelector(`[data-tile-id="${testId}"]`);
            const success = !!btn;
            
            this.logResult("Discovery", success, success ? `Button for ${testId} appeared in UI` : `Button for ${testId} not found`);
        } else {
            this.logResult("Discovery", false, "window.geometryOS.registerTile not found");
        }
    }

    async test2_BlindPilotNavigation() {
        console.log("\n%cTest 2: Blind Pilot Navigation", "color: #ffcc00; font-weight: bold;");
        
        // Setup: Ensure a tile exists
        const testId = 'nav-test-tile';
        window.geometryOS?.registerTile(testId, { x: 500, y: 500, state: 'running' });
        
        // Action: Trigger navigation from WordPress bridge
        if (window.geometryOSPulse?.navigateTo) {
            window.geometryOSPulse.navigateTo(testId);
            
            // Verification: Check map viewport coords
            await this.sleep(500);
            const camera = window.geometryOSApp?.viewport?.getCamera();
            const success = camera && Math.round(camera.x) === 50000 && Math.round(camera.y) === 50000; // 500 * gridSize(100)
            
            this.logResult("Navigation", success, success ? `Viewport moved to (${camera.x}, ${camera.y})` : `Viewport at incorrect position`);
        } else {
            this.logResult("Navigation", false, "window.geometryOSPulse.navigateTo not found");
        }
    }

    async test3_EchoLoopDuplex() {
        console.log("\n%cTest 3: Echo Loop Duplex", "color: #ffcc00; font-weight: bold;");
        
        const testId = 'echo-tile';
        const testMsg = "PING_" + Math.random();
        
        // Setup mock tile that echos back
        window.geometryOS?.registerTile(testId, { x: 0, y: 0, state: 'running' });
        
        // Action: Send command
        let outputReceived = false;
        const listener = (e) => {
            if (e.detail.tileId === testId && e.detail.text.includes(testMsg)) {
                outputReceived = true;
            }
        };
        window.addEventListener('geometryOS:consoleOutput', listener);
        
        window.geometryOSPulse?.sendCommand(testId, `echo ${testMsg}`);
        
        // Verification: Wait for output event
        await this.sleep(1000);
        window.removeEventListener('geometryOS:consoleOutput', listener);
        
        this.logResult("Echo Loop", outputReceived, outputReceived ? "Output received back in WordPress" : "No output detected for command");
    }

    async test4_SwarmHeartbeat() {
        console.log("\n%cTest 4: Swarm Heartbeat (Batch)", "color: #ffcc00; font-weight: bold;");
        
        // Setup: Multiple tiles
        window.geometryOS?.registerTile('t1', { x: 0, y: 0, state: 'running' });
        window.geometryOS?.registerTile('t2', { x: 0, y: 0, state: 'running' });
        
        // Action: Broadcast
        const count = window.geometryOS?.broadcastCommand("uptime");
        const success = count >= 2;
        
        this.logResult("Swarm Batch", success, success ? `Command broadcast to ${count} tiles` : "Broadcast failed to target multiple tiles");
    }

    async test5_LateJoinerHistory() {
        console.log("\n%cTest 5: Late Joiner History Sync", "color: #ffcc00; font-weight: bold;");

        // Action: Fetch history from a tile
        if (window.geometryOS?.getConsoleOutput) {
            const output = window.geometryOS.getConsoleOutput('system-console', 1);
            const success = Array.isArray(output);

            this.logResult("History Sync", success, success ? `Retrieved ${output.length} lines of history` : "Failed to retrieve history buffer");
        } else {
            this.logResult("History Sync", false, "window.geometryOS.getConsoleOutput not found");
        }
    }

    async test6_MetricsCollectorIntegration() {
        console.log("\n%cTest 6: Metrics Collector Integration", "color: #ffcc00; font-weight: bold;");

        const hasCollector = !!window.geometryOS?.metrics;
        if (!hasCollector) {
            this.logResult("Metrics", false, "window.geometryOS.metrics not found");
            return;
        }

        const t0 = window.geometryOS.metrics.startLatencyMeasure('test-6');
        await this.sleep(50);
        const latency = window.geometryOS.metrics.endLatencyMeasure('test-6', t0);

        const success = latency >= 50 && latency < 200;
        this.logResult("Metrics", success, success ? `Latency measurement: ${latency.toFixed(1)}ms` : `Latency out of range: ${latency}`);
    }

    async test7_HealthDashboardRender() {
        console.log("\n%cTest 7: Health Dashboard Render", "color: #ffcc00; font-weight: bold;");

        const dashboard = document.querySelector('#geometry-os-health-dashboard');
        if (!dashboard) {
            this.logResult("Health Dashboard", false, "#geometry-os-health-dashboard not found in DOM");
            return;
        }

        const html = dashboard.innerHTML;
        const hasLatency = html.includes('Latency') || html.includes('latency');
        const hasStatus = html.includes('PASS') || html.includes('WARN') || html.includes('OK');

        const success = hasLatency && hasStatus;
        this.logResult("Health Dashboard", success,
            success ? "Dashboard rendering correctly" : `Missing elements - latency: ${hasLatency}, status: ${hasStatus}`);
    }

    logResult(name, success, details) {
        const symbol = success ? "✅" : "❌";
        console.log(`${symbol} ${name}: ${details}`);
        this.results.push({ name, success, details });
    }

    report() {
        console.log("\n" + "=".repeat(40));
        console.log("%cGEOMETRY OS INTEGRATION REPORT", "color: #00ffcc; font-weight: bold;");
        console.log("=".repeat(40));
        
        const passed = this.results.filter(r => r.success).length;
        const color = passed === this.results.length ? "color: #00ff00" : "color: #ff4444";
        
        console.log(`%cPASSED: ${passed}/${this.results.length}`, `${color}; font-weight: bold;`);
        
        this.results.forEach(r => {
            console.log(`${r.success ? "✅" : "❌"} ${r.name.padEnd(15)} | ${r.details}`);
        });
        console.log("=".repeat(40));
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
}

console.log("Verifier loaded. Run 'await new WPIntegrationVerifier().runAll()' to start.");
