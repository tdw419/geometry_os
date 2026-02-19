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

describe('VCC Stability', () => {
    it('should initialize building with stability score', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', { memory: 100 });
        assert.ok(building.stability !== undefined);
        assert.ok(building.stability.pas >= 0 && building.stability.pas <= 1);
    });

    it('should update stability score', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});
        orch.updateStability('agent-01', 0.45);
        const building = orch.getBuilding('agent-01');
        assert.equal(building.stability.pas, 0.45);
    });

    it('should classify stability states correctly', () => {
        const orch = new CityOrchestrator();
        assert.equal(orch._classifyStability(0.9), 'stable');
        assert.equal(orch._classifyStability(0.6), 'degraded');
        assert.equal(orch._classifyStability(0.3), 'critical');
    });

    it('should return critical buildings', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});
        orch.spawnBuilding('agent-02', 'metabolic', {});
        // Set first to critical
        orch.updateStability('agent-01', 0.3);
        // Set second to stable
        orch.updateStability('agent-02', 0.9);
        const critical = orch.getCriticalBuildings();
        assert.equal(critical.length, 1);
        assert.equal(critical[0].id, 'agent-01');
    });
});

// ===== Fluid Layout Tests (Phase 28: Tectonic Realignment) =====

describe('Fluid Layout - Drift', () => {
    it('should apply drift offset to building position', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        const driftResult = orch.applyDrift('agent-01', { dx: 10, dy: 20, magnitude: 22.36 });

        assert.ok(driftResult);
        assert.deepEqual(driftResult.drift, { dx: 10, dy: 20, magnitude: 22.36 });

        const building = orch.getBuilding('agent-01');
        assert.deepEqual(building.drift, { dx: 10, dy: 20, magnitude: 22.36 });
    });

    it('should trigger onBuildingUpdate callback when drift is applied', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        let callbackCalled = false;
        let updatedBuilding = null;
        orch.onBuildingUpdate = (b) => {
            callbackCalled = true;
            updatedBuilding = b;
        };

        orch.applyDrift('agent-01', { dx: 5, dy: -5, magnitude: 7.07 });

        assert.ok(callbackCalled);
        assert.equal(updatedBuilding.id, 'agent-01');
        assert.deepEqual(updatedBuilding.drift, { dx: 5, dy: -5, magnitude: 7.07 });
    });

    it('should return null when applying drift to non-existent building', () => {
        const orch = new CityOrchestrator();
        const result = orch.applyDrift('non-existent', { dx: 10, dy: 10, magnitude: 14.14 });
        assert.equal(result, null);
    });
});

describe('Fluid Layout - Rendered Position', () => {
    it('should calculate rendered position with drift', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', {});
        const basePos = { ...building.position };

        orch.applyDrift('agent-01', { dx: 15, dy: 25, magnitude: 29.15 });

        const renderedPos = orch.getRenderedPosition('agent-01');

        assert.equal(renderedPos.x, basePos.x + 15);
        assert.equal(renderedPos.y, basePos.y + 25);
    });

    it('should return base position when no drift is applied', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', {});

        const renderedPos = orch.getRenderedPosition('agent-01');

        assert.equal(renderedPos.x, building.position.x);
        assert.equal(renderedPos.y, building.position.y);
    });

    it('should return lerpPosition when building is migrating', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        // Set up migration state
        const building = orch.getBuilding('agent-01');
        building.isMigrating = true;
        building.lerpPosition = { x: 100, y: 200 };

        const renderedPos = orch.getRenderedPosition('agent-01');

        assert.deepEqual(renderedPos, { x: 100, y: 200 });
    });

    it('should return null for non-existent building', () => {
        const orch = new CityOrchestrator();
        const pos = orch.getRenderedPosition('non-existent');
        assert.equal(pos, null);
    });
});

describe('Fluid Layout - Lerp to Target', () => {
    it('should lerp building to target position', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        // Set up migration to target
        orch.setTargetPosition('agent-01', { x: 200, y: 300 });

        // Lerp by 0.5 (50% of the way)
        orch.lerpToTarget('agent-01', 0.5);

        const building = orch.getBuilding('agent-01');
        assert.ok(building.lerpPosition);
        assert.ok(building.lerpProgress > 0);
    });

    it('should complete migration glide smoothly', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        const targetPos = { x: 200, y: 300 };
        orch.setTargetPosition('agent-01', targetPos);

        // Lerp to completion (progress goes to 1.0)
        orch.lerpToTarget('agent-01', 1.0);

        const building = orch.getBuilding('agent-01');

        // Migration should be complete
        assert.equal(building.position.x, targetPos.x);
        assert.equal(building.position.y, targetPos.y);

        // Migration state should be cleared
        assert.equal(building.drift, undefined);
        assert.equal(building.isMigrating, undefined);
        assert.equal(building.targetPosition, undefined);
        assert.equal(building.lerpPosition, undefined);
        assert.equal(building.lerpProgress, undefined);
    });

    it('should return null when lerping non-existent building', () => {
        const orch = new CityOrchestrator();
        const result = orch.lerpToTarget('non-existent', 0.5);
        assert.equal(result, null);
    });
});

describe('Fluid Layout - Phase Shift Migration', () => {
    it('should handle Phase Shift (district migration)', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', {});

        // Migrate to metabolic district
        const result = orch.migrateBuilding('agent-01', 'metabolic');

        assert.ok(result);
        assert.equal(result.district, 'metabolic');
        assert.equal(result.isMigrating, true);
        assert.ok(result.targetPosition);
        assert.ok(result.lerpPosition);
    });

    it('should reject invalid district for migration', () => {
        const orch = new CityOrchestrator();
        orch.spawnBuilding('agent-01', 'cognitive', {});

        const result = orch.migrateBuilding('agent-01', 'invalid_district');

        assert.equal(result, null);

        // Building should remain unchanged
        const building = orch.getBuilding('agent-01');
        assert.equal(building.district, 'cognitive');
        assert.equal(building.isMigrating, undefined);
    });

    it('should return null when migrating non-existent building', () => {
        const orch = new CityOrchestrator();
        const result = orch.migrateBuilding('non-existent', 'metabolic');
        assert.equal(result, null);
    });

    it('should calculate new position in target district', () => {
        const orch = new CityOrchestrator();
        const building = orch.spawnBuilding('agent-01', 'cognitive', {});
        const originalPos = { ...building.position };

        orch.migrateBuilding('agent-01', 'substrate');

        const targetPos = orch.getBuilding('agent-01').targetPosition;

        // Target position should be different from original
        // (different district means different angle)
        assert.ok(
            targetPos.x !== originalPos.x || targetPos.y !== originalPos.y
        );
    });
});
