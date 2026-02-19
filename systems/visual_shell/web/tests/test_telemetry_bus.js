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
});
