/**
 * Tests for NeuralCityEngine - Main controller for Neural City visualization.
 * Run with: mocha tests/test_neural_city_engine.js or open in browser test runner
 */

describe('NeuralCityEngine', () => {
    it('should initialize with TelemetryBus and CityOrchestrator', () => {
        const engine = new NeuralCityEngine({ app: null });
        assert.ok(engine.telemetryBus);
        assert.ok(engine.orchestrator);
        assert.equal(engine.running, false);
    });

    it('should have correct initial spire state', () => {
        const engine = new NeuralCityEngine({ app: null });
        assert.equal(engine.spire.ipc, 0.5);
        assert.equal(engine.spire.throttleLevel, 'NONE');
        assert.equal(engine.spire.tectonicActive, false);
    });

    it('should setup orchestrator callbacks on start', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupOrchestratorCallbacks();
        assert.ok(engine.orchestrator.onBuildingSpawn);
        assert.ok(engine.orchestrator.onBuildingUpdate);
        assert.ok(engine.orchestrator.onBridgeCreate);
        assert.ok(engine.orchestrator.onDistrictPulse);
    });

    it('should setup telemetry handlers for all event types', () => {
        const engine = new NeuralCityEngine({ app: null });
        let handlerCalled = false;

        // Test metabolism_update subscription
        engine.telemetryBus.subscribe('metabolism_update', (data) => {
            handlerCalled = true;
            assert.equal(data.ipc, 0.75);
        });

        engine.telemetryBus.emit('metabolism_update', { ipc: 0.75 });
        assert.equal(handlerCalled, true);
    });

    it('should update spire on metabolism_update event', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        // Emit metabolism update
        engine.telemetryBus.emit('metabolism_update', {
            ipc: 0.85,
            throttle_level: 'MODERATE'
        });

        assert.equal(engine.spire.ipc, 0.85);
        assert.equal(engine.spire.throttleLevel, 'MODERATE');
    });

    it('should set tectonic active on tectonic_shift event', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        engine.telemetryBus.emit('tectonic_shift', { success: true });

        assert.equal(engine.spire.tectonicActive, true);
    });

    it('should spawn building on agent_spawn event', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        engine.telemetryBus.emit('agent_spawn', {
            agent_id: 'test-agent',
            role: 'cognitive',
            metrics: { memory: 200, activity: 0.5 }
        });

        const building = engine.orchestrator.getBuilding('test-agent');
        assert.ok(building);
        assert.equal(building.id, 'test-agent');
        assert.equal(building.role, 'cognitive');
    });

    it('should create bridge on agent_comm event', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        // Spawn two agents first
        engine.telemetryBus.emit('agent_spawn', { agent_id: 'agent-a', role: 'cognitive' });
        engine.telemetryBus.emit('agent_spawn', { agent_id: 'agent-b', role: 'metabolic' });

        // Emit agent_comm event
        engine.telemetryBus.emit('agent_comm', {
            from: 'agent-a',
            to: 'agent-b',
            event_type: 'llm_inference'
        });

        const bridges = engine.orchestrator.getBridges();
        assert.ok(bridges.length > 0);
        assert.equal(bridges[0].eventType, 'llm_inference');
    });

    it('should update building on agent_metrics event', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        // Spawn agent first
        engine.telemetryBus.emit('agent_spawn', {
            agent_id: 'metrics-agent',
            role: 'cognitive',
            metrics: { memory: 100, activity: 0.2 }
        });

        // Update with new metrics
        engine.telemetryBus.emit('agent_metrics', {
            agent_id: 'metrics-agent',
            activity: 0.9,
            memory: 350
        });

        const building = engine.orchestrator.getBuilding('metrics-agent');
        assert.equal(building.activity, 0.9);
        assert.equal(building.memory, 350);
    });

    it('should get correct spire color for healthy state', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine.spire.throttleLevel = 'NONE';
        engine.spire.tectonicActive = false;
        const color = engine._getSpireColor();
        assert.equal(color, 0x00ffff); // Cyan for healthy
    });

    it('should get correct spire color for aggressive throttle', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine.spire.throttleLevel = 'AGGRESSIVE';
        const color = engine._getSpireColor();
        assert.equal(color, 0xff0000); // Red for aggressive
    });

    it('should get correct spire color for moderate throttle', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine.spire.throttleLevel = 'MODERATE';
        const color = engine._getSpireColor();
        assert.equal(color, 0xff8800); // Orange for moderate
    });

    it('should get correct spire color for tectonic active', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine.spire.tectonicActive = true;
        const color = engine._getSpireColor();
        assert.equal(color, 0xff4400); // Red-orange for tectonic
    });

    it('should return correct district color', () => {
        const engine = new NeuralCityEngine({ app: null });
        assert.equal(engine._getDistrictColor('cognitive'), 0x00aaff);
        assert.equal(engine._getDistrictColor('metabolic'), 0xff8800);
        assert.equal(engine._getDistrictColor('substrate'), 0x00ff88);
    });

    it('should return state summary', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine._setupTelemetryHandlers();

        // Add some test data
        engine.telemetryBus.emit('agent_spawn', { agent_id: 'a', role: 'cognitive' });
        engine.telemetryBus.emit('agent_spawn', { agent_id: 'b', role: 'metabolic' });

        const state = engine.getState();
        assert.equal(state.buildings, 2);
        assert.equal(state.connected, false);
        assert.ok(state.spire);
    });

    it('should stop engine cleanly', () => {
        const engine = new NeuralCityEngine({ app: null });
        engine.running = true;
        engine.stop();
        assert.equal(engine.running, false);
    });

    it('should render building graphic when building spawns', () => {
        const engine = new NeuralCityEngine({ app: {} });
        engine._setupOrchestratorCallbacks();

        // Mock dynamic layer
        engine.dynamicLayer = {
            addChild: (child) => {
                engine.lastAddedChild = child;
            }
        };

        const building = {
            id: 'test',
            district: 'cognitive',
            position: { x: 100, y: 200 },
            height: 150,
            luminance: 0.8
        };

        engine._renderBuilding(building);
        assert.ok(engine.lastAddedChild);
    });

    it('should render bridge graphic when bridge is created', () => {
        const engine = new NeuralCityEngine({ app: {} });
        engine._setupOrchestratorCallbacks();

        // Mock dynamic layer
        engine.dynamicLayer = {
            addChild: (child) => {
                engine.lastAddedChild = child;
            }
        };

        const bridge = {
            fromPos: { x: 0, y: 0 },
            toPos: { x: 100, y: 100 },
            color: 0x00ffff,
            ttl: 2000,
            createdAt: Date.now()
        };

        engine._renderBridge(bridge);
        assert.ok(engine.lastAddedChild);
    });

    it('should create static and dynamic render layers', () => {
        const mockContainer = {
            addChild: () => {}
        };

        const engine = new NeuralCityEngine({
            app: {},
            container: mockContainer
        });

        engine._createRenderLayers();
        assert.ok(engine.staticLayer);
        assert.ok(engine.dynamicLayer);
        assert.ok(engine.particleLayer);
    });

    it('should connect to telemetry on start', async () => {
        const engine = new NeuralCityEngine({
            app: null,
            wsUrl: 'ws://localhost:8768'
        });

        // Mock the connect method
        let connected = false;
        engine.telemetryBus.connect = async () => {
            connected = true;
            return true;
        };

        await engine.start();
        assert.equal(connected, true);
        assert.equal(engine.running, true);
    });

    it('should handle telemetry connection failure gracefully', async () => {
        const engine = new NeuralCityEngine({
            app: null,
            wsUrl: 'ws://invalid:9999'
        });

        // Mock failed connect
        engine.telemetryBus.connect = async () => {
            throw new Error('Connection failed');
        };

        // Should not throw
        let error = null;
        try {
            await engine.start();
        } catch (e) {
            error = e;
        }

        assert.equal(error, null);
        assert.equal(engine.running, true); // Still runs in standalone mode
    });
});
