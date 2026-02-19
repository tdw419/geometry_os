// systems/visual_shell/web/tests/test_city_orchestrator.js
/**
 * Tests for CityOrchestrator class
 * Run with: mocha tests/test_city_orchestrator.js or open in browser test runner
 */

describe('CityOrchestrator', () => {
    it('should spawn a building', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', { memory: 100 });
        assert.ok(building);
        assert.equal(building.id, 'agent-01');
    });

    it('should update building state', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});
        orch.updateBuilding('agent-01', { activity: 0.8, memory: 200 });
        const b = orch.getBuilding('agent-01');
        assert.equal(b.memory, 200);
        assert.equal(b.activity, 0.8);
    });

    it('should create bridges between buildings', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('a', 'cognitive', { position: { x: 0, y: 0 } });
        orch.spawnBuilding('b', 'metabolic', { position: { x: 100, y: 0 } });
        const bridge = orch.createBridge('a', 'b', 'llm_inference');
        assert.ok(bridge);
        assert.equal(bridge.eventType, 'llm_inference');
    });

    it('should pulse district', () => {
        const orch = new CityOrchestrator();
        let pulsed = false;
        orch.onDistrictPulse = () => { pulsed = true; };
        orch.pulseDistrict('metabolic');
        assert.ok(pulsed);
    });
});
