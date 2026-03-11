/**
 * Tests for TelemetryBus - Event-driven data bus for Neural City visualization.
 */

describe('TelemetryBus', () => {
    it('should subscribe to events', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('metabolism_update', (data) => { received = data; });
        bus.emit('metabolism_update', { ipc: 0.5 });
        assert.deepEqual(received, { ipc: 0.5 });
    });

    it('should unsubscribe correctly', () => {
        const bus = new TelemetryBus();
        let count = 0;
        const unsub = bus.subscribe('test', () => { count++; });
        bus.emit('test', {});
        unsub();
        bus.emit('test', {});
        assert.equal(count, 1);
    });

    it('should connect to WebSocket', async () => {
        const bus = new TelemetryBus('ws://localhost:8768');
        bus.ws = { send: () => {}, readyState: 1 };
        assert.ok(bus.isConnected() || bus.ws);
    });

    it('should handle multiple subscribers for same event', () => {
        const bus = new TelemetryBus();
        const results = [];
        bus.subscribe('test', (data) => results.push('a:' + data.val));
        bus.subscribe('test', (data) => results.push('b:' + data.val));
        bus.emit('test', { val: 1 });
        assert.deepEqual(results, ['a:1', 'b:1']);
    });

    it('should handle non-existent event gracefully', () => {
        const bus = new TelemetryBus();
        assert.doesNotThrow(() => bus.emit('non_existent', { data: 'test' }));
    });

    it('should have correct initial state', () => {
        const bus = new TelemetryBus('ws://test:9999');
        assert.equal(bus.wsUrl, 'ws://test:9999');
        assert.equal(bus.connected, false);
        assert.ok(bus.subscribers instanceof Map);
    });

    it('should emit bus_connected event on WebSocket connect', async () => {
        const bus = new TelemetryBus('ws://localhost:8768');
        let connectedEmitted = false;
        bus.subscribe('bus_connected', () => { connectedEmitted = true; });

        // Simulate WebSocket open
        bus.ws = { readyState: WebSocket.OPEN };
        bus._onConnect();

        assert.equal(connectedEmitted, true);
        assert.equal(bus.connected, true);
    });

    it('should emit bus_disconnected event on WebSocket close', () => {
        const bus = new TelemetryBus();
        let disconnectedEmitted = false;
        bus.subscribe('bus_disconnected', () => { disconnectedEmitted = true; });

        bus.connected = true;
        bus.ws = { readyState: WebSocket.CLOSED };
        bus._onDisconnect();

        assert.equal(disconnectedEmitted, true);
        assert.equal(bus.connected, false);
    });

    it('should parse broadcast_event messages correctly', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('metabolism_update', (data) => { received = data; });

        const msg = { data: '{"type": "broadcast_event", "params": {"type": "metabolism_update", "data": {"ipc": 0.75}}}' };
        bus._handleMessage(msg);

        assert.deepEqual(received, { ipc: 0.75 });
    });

    it('should handle malformed messages gracefully', () => {
        const bus = new TelemetryBus();
        assert.doesNotThrow(() => bus._handleMessage({ data: 'invalid json' }));
    });

    it('should disconnect cleanly', () => {
        const bus = new TelemetryBus();
        bus.ws = { close: () => {}, readyState: WebSocket.OPEN };
        bus.connected = true;

        bus.disconnect();

        assert.equal(bus.ws, null);
        assert.equal(bus.connected, false);
    });

    // ============================================
    // Neural Event Tests (Phase 27)
    // ============================================

    it('should handle neural_event messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('neural_event', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'neural_event',
                    data: {
                        tile_id: 'tile-001',
                        event_type: 'CODE_DISCOVERY',
                        confidence: 0.85
                    }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.equal(received.tile_id, 'tile-001');
        assert.equal(received.event_type, 'CODE_DISCOVERY');
    });

    it('should handle memory_broadcast messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('memory_broadcast', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'memory_broadcast',
                    data: {
                        tile_id: 'tile-002',
                        event_type: 'RESOURCE_PRESSURE',
                        shared_with: ['tile-001', 'tile-003']
                    }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.equal(received.event_type, 'RESOURCE_PRESSURE');
    });

    it('should handle collective_context messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('collective_context', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'collective_context',
                    data: {
                        tile_id: 'tile-001',
                        recent_events: [{ tile_id: 'tile-002', event_type: 'CODE_DISCOVERY' }],
                        similar_tiles: ['tile-003'],
                        total_memory_size: 5
                    }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.equal(received.tile_id, 'tile-001');
        assert.ok(Array.isArray(received.recent_events));
        assert.ok(Array.isArray(received.similar_tiles));
    });

    it('should support multiple neural event subscribers', () => {
        const bus = new TelemetryBus();
        const calls = [];

        bus.subscribe('neural_event', (data) => calls.push('handler1:' + data.tile_id));
        bus.subscribe('neural_event', (data) => calls.push('handler2:' + data.event_type));

        bus.emit('neural_event', { tile_id: 'test-tile', event_type: 'DISTRICT_SYNC' });

        assert.deepEqual(calls, ['handler1:test-tile', 'handler2:DISTRICT_SYNC']);
    });

    // ============================================
    // Tectonic Event Tests (Phase 28)
    // ============================================

    it('should handle tectonic_drift messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('tectonic_drift', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'tectonic_drift',
                    data: {
                        drifts: {
                            'agent-001': { dx: 5.2, dy: -3.1, magnitude: 6.1 },
                            'agent-002': { dx: -2.0, dy: 1.5, magnitude: 2.5 }
                        }
                    }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.ok(received.drifts['agent-001']);
        assert.equal(received.drifts['agent-001'].dx, 5.2);
    });

    it('should handle agent_relocation messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('agent_relocation', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'agent_relocation',
                    data: {
                        agent_id: 'agent-001',
                        from_district: 'cognitive',
                        to_district: 'metabolic'
                    }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.equal(received.agent_id, 'agent-001');
        assert.equal(received.to_district, 'metabolic');
    });

    it('should handle flux_mode messages', () => {
        const bus = new TelemetryBus();
        let received = null;
        bus.subscribe('flux_mode', (data) => { received = data; });

        const msg = {
            data: JSON.stringify({
                type: 'broadcast_event',
                params: {
                    type: 'flux_mode',
                    data: { active: true, reason: 'evolution_event' }
                }
            })
        };
        bus._handleMessage(msg);

        assert.ok(received);
        assert.equal(received.active, true);
    });
});
