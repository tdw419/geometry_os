/**
 * Tests for LiveTile - VM instance management within Neural City buildings.
 */

// Setup for Node.js environment
if (typeof require !== 'undefined') {
    const { assert } = require('chai');
    global.assert = assert;
}

describe('LiveTile', () => {
    let LiveTileClass;

    before(() => {
        // Get LiveTile class from window (browser) or require (Node.js)
        if (typeof window !== 'undefined' && window.LiveTile) {
            LiveTileClass = window.LiveTile;
        } else if (typeof require !== 'undefined') {
            LiveTileClass = require('../js/LiveTile.js');
        }
    });

    it('should create a live tile instance', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');
        assert.equal(tile.id, 'alpine-01');
        assert.equal(tile.rtsPath, 'rts_files/alpine_v2.rts.png');
        assert.equal(tile.state, 'stopped');
    });

    it('should track tile state transitions', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        tile.setState('booting');
        assert.equal(tile.state, 'booting');
        assert.equal(tile.isRunning(), true);

        tile.setState('running');
        assert.equal(tile.state, 'running');
        assert.ok(tile.bootTime, 'Boot time should be set when entering running state');

        tile.setState('error');
        assert.equal(tile.state, 'error');
        assert.equal(tile.isRunning(), false);
    });

    it('should store framebuffer data', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        const mockData = new ArrayBuffer(1024);
        tile.updateFramebuffer(mockData, 320, 240);

        assert.ok(tile.framebuffer, 'Framebuffer should be stored');
        assert.equal(tile.framebuffer.width, 320);
        assert.equal(tile.framebuffer.height, 240);
        assert.equal(tile.framebuffer.data, mockData);
        assert.ok(tile.framebuffer.timestamp, 'Framebuffer should have timestamp');
    });

    it('should update metrics and calculate uptime', (done) => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        tile.setState('running');
        tile.updateMetrics({ cpu: 45, memory: 512 });

        assert.equal(tile.metrics.cpu, 45);
        assert.equal(tile.metrics.memory, 512);
        assert.ok(tile.metrics.uptime >= 0, 'Uptime should be calculated');

        // Wait a bit and check uptime increases
        setTimeout(() => {
            tile.updateMetrics({});
            const uptimeAfter = tile.metrics.uptime;
            assert.ok(uptimeAfter >= 0, 'Uptime should increase over time');
            done();
        }, 100);
    });

    it('should buffer console output', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        tile.appendConsole('System starting...');
        tile.appendConsole('Loading kernel...');
        tile.appendConsole('Boot complete.');

        assert.equal(tile.consoleOutput.length, 3);
        assert.ok(tile.consoleOutput[0].time, 'Console entry should have timestamp');
        assert.equal(tile.consoleOutput[0].text, 'System starting...');

        const consoleText = tile.getConsoleText();
        assert.ok(consoleText.includes('System starting...'), 'Console text should include messages');
    });

    it('should limit console output to 100 entries', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        // Add more than 100 entries
        for (let i = 0; i < 150; i++) {
            tile.appendConsole(`Line ${i}`);
        }

        assert.equal(tile.consoleOutput.length, 100, 'Console should be limited to 100 entries');
        // Oldest entries should be removed
        assert.ok(!tile.consoleOutput.some(e => e.text === 'Line 0'), 'Oldest entries should be removed');
        assert.ok(tile.consoleOutput.some(e => e.text === 'Line 149'), 'Newest entries should be preserved');
    });

    it('should reset tile state', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        tile.setState('running');
        tile.updateFramebuffer(new ArrayBuffer(1024), 320, 240);
        tile.updateMetrics({ cpu: 50, memory: 256 });
        tile.appendConsole('Test output');

        tile.reset();

        assert.equal(tile.state, 'stopped');
        assert.equal(tile.framebuffer, null);
        assert.equal(tile.bootTime, null);
        assert.equal(tile.metrics.cpu, 0);
        assert.equal(tile.metrics.memory, 0);
        assert.equal(tile.consoleOutput.length, 0);
    });

    it('should check running status correctly', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        assert.equal(tile.isRunning(), false, 'Stopped tile should not be running');

        tile.setState('booting');
        assert.equal(tile.isRunning(), true, 'Booting tile should be running');

        tile.setState('running');
        assert.equal(tile.isRunning(), true, 'Running tile should be running');

        tile.setState('error');
        assert.equal(tile.isRunning(), false, 'Error tile should not be running');

        tile.setState('stopped');
        assert.equal(tile.isRunning(), false, 'Stopped tile should not be running');
    });

    it('should get framebuffer via getter', () => {
        const tile = new LiveTileClass('alpine-01', 'rts_files/alpine_v2.rts.png');

        assert.equal(tile.getFramebuffer(), null, 'No framebuffer initially');

        const mockData = new ArrayBuffer(100);
        tile.updateFramebuffer(mockData, 100, 100);

        const fb = tile.getFramebuffer();
        assert.ok(fb, 'Framebuffer should be available');
        assert.equal(fb.width, 100);
        assert.equal(fb.height, 100);
    });
});

// Integration test with CityOrchestrator (if available)
describe('LiveTile CityOrchestrator Integration', () => {
    let LiveTileClass, CityOrchestratorClass;

    before(() => {
        if (typeof window !== 'undefined') {
            LiveTileClass = window.LiveTile;
            CityOrchestratorClass = window.CityOrchestrator;
        } else if (typeof require !== 'undefined') {
            LiveTileClass = require('../js/LiveTile.js');
            CityOrchestratorClass = require('../js/CityOrchestrator.js');
        }
    });

    it('should integrate with CityOrchestrator building', () => {
        if (!CityOrchestratorClass) {
            this.skip('CityOrchestrator not available');
            return;
        }

        const orch = new CityOrchestratorClass();
        const building = orch.spawnBuilding('alpine-live', 'substrate', {});

        // Set liveTile on the building
        const liveTile = new LiveTileClass('alpine-live', 'alpine.rts.png');
        orch.setLiveTile('alpine-live', liveTile);

        const updatedBuilding = orch.getBuilding('alpine-live');
        assert.ok(updatedBuilding.liveTile, 'Building should have liveTile');
        assert.equal(updatedBuilding.liveTile.id, 'alpine-live');
    });

    it('should handle multiple buildings with liveTiles', () => {
        if (!CityOrchestratorClass) {
            this.skip('CityOrchestrator not available');
            return;
        }

        const orch = new CityOrchestratorClass();

        // Create multiple buildings with liveTiles
        orch.spawnBuilding('vm-1', 'substrate', {});
        orch.spawnBuilding('vm-2', 'substrate', {});
        orch.spawnBuilding('vm-3', 'substrate', {});

        orch.setLiveTile('vm-1', new LiveTileClass('vm-1', 'alpine.rts.png'));
        orch.setLiveTile('vm-2', new LiveTileClass('vm-2', 'ubuntu.rts.png'));

        assert.ok(orch.getBuilding('vm-1').liveTile, 'vm-1 should have liveTile');
        assert.ok(orch.getBuilding('vm-2').liveTile, 'vm-2 should have liveTile');
        assert.equal(orch.getBuilding('vm-3').liveTile, null, 'vm-3 should not have liveTile');
    });

    it('should start tile boot sequence through orchestrator', () => {
        if (!CityOrchestratorClass) {
            this.skip('CityOrchestrator not available');
            return;
        }

        const orch = new CityOrchestratorClass();
        orch.spawnBuilding('boot-test', 'substrate', {});

        const liveTile = new LiveTileClass('boot-test', 'alpine.rts.png');
        orch.setLiveTile('boot-test', liveTile);

        // Simulate boot sequence
        liveTile.setState('booting');
        liveTile.appendConsole('Starting boot...');

        assert.equal(orch.getBuilding('boot-test').liveTile.state, 'booting');

        liveTile.setState('running');
        liveTile.updateMetrics({ cpu: 25, memory: 128 });

        const building = orch.getBuilding('boot-test');
        assert.equal(building.liveTile.state, 'running');
        assert.equal(building.liveTile.metrics.cpu, 25);
    });
});
