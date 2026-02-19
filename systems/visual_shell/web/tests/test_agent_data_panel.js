/**
 * Tests for AgentDataPanel - Four-section data display for Glass Box introspection.
 */

describe('AgentDataPanel', () => {
    it('should create panel with 4 data sections', () => {
        const panel = new AgentDataPanel();
        assert.ok(panel.element);
        assert.equal(panel.element.querySelectorAll('.data-section').length, 4);
    });

    it('should have correct section IDs', () => {
        const panel = new AgentDataPanel();
        const sections = panel.element.querySelectorAll('.data-section');
        const ids = Array.from(sections).map(s => s.id);
        assert.deepEqual(ids, ['thought-stream', 'intent-map', 'metabolic-pulse', 'communication-log']);
    });

    it('should render thought stream with timestamps', () => {
        const panel = new AgentDataPanel();
        panel.setThoughts([
            { time: '14:32:01', text: 'Analyzing request', type: 'inference' },
            { time: '14:32:02', text: 'Querying knowledge base', type: 'inference' }
        ]);
        assert.ok(panel.element.innerHTML.includes('Analyzing request'));
        assert.ok(panel.element.innerHTML.includes('14:32:01'));
    });

    it('should color thought items by type', () => {
        const panel = new AgentDataPanel();
        panel.setThoughts([
            { time: '14:32:01', text: 'Executing action', type: 'action' },
            { time: '14:32:02', text: 'Making inference', type: 'inference' }
        ]);
        assert.ok(panel.element.querySelector('.thought-item.type-action'));
        assert.ok(panel.element.querySelector('.thought-item.type-inference'));
    });

    it('should render intent map with goal and trajectory', () => {
        const panel = new AgentDataPanel();
        panel.setIntent({
            goal: 'Optimize rendering',
            steps: [
                { text: 'Profile FPS', complete: true },
                { text: 'Find bottleneck', complete: false }
            ]
        });
        assert.ok(panel.element.innerHTML.includes('Optimize rendering'));
        assert.ok(panel.element.innerHTML.includes('Profile FPS'));
    });

    it('should show checkmarks for completed intent steps', () => {
        const panel = new AgentDataPanel();
        panel.setIntent({
            goal: 'Test goal',
            steps: [
                { text: 'Complete step', complete: true },
                { text: 'Incomplete step', complete: false }
            ]
        });
        const html = panel.element.innerHTML;
        assert.ok(html.includes('✓') || html.includes('check'));
        assert.ok(html.includes('○') || html.querySelector('.complete'));
    });

    it('should render metabolic pulse with IPC metric', () => {
        const panel = new AgentDataPanel();
        panel.setMetabolism({
            ipc: 0.78,
            memory: { used: 248, total: 512 },
            activity: 0.85
        });
        assert.ok(panel.element.innerHTML.includes('0.78'));
    });

    it('should render metabolic pulse with memory metric', () => {
        const panel = new AgentDataPanel();
        panel.setMetabolism({
            ipc: 0.5,
            memory: { used: 256, total: 512 },
            activity: 0.5
        });
        assert.ok(panel.element.innerHTML.includes('256'));
        assert.ok(panel.element.innerHTML.includes('512'));
    });

    it('should render communication log with direction arrows', () => {
        const panel = new AgentDataPanel();
        panel.setCommunications([
            { direction: 'out', target: 'agent-2', type: 'request' },
            { direction: 'in', target: 'agent-3', type: 'response' }
        ]);
        assert.ok(panel.element.innerHTML.includes('agent-2'));
        assert.ok(panel.element.querySelector('.comm-item'));
    });

    it('should show outbound arrow for outgoing messages', () => {
        const panel = new AgentDataPanel();
        panel.setCommunications([
            { direction: 'out', target: 'agent-2', type: 'request' }
        ]);
        const html = panel.element.innerHTML;
        assert.ok(html.includes('→') || html.includes('out'));
    });

    it('should show inbound arrow for incoming messages', () => {
        const panel = new AgentDataPanel();
        panel.setCommunications([
            { direction: 'in', target: 'agent-1', type: 'response' }
        ]);
        const html = panel.element.innerHTML;
        assert.ok(html.includes('←') || html.includes('in'));
    });

    it('should set all data at once via setAllData', () => {
        const panel = new AgentDataPanel();
        panel.setAllData({
            thoughts: [{ time: '12:00:00', text: 'Test thought', type: 'inference' }],
            intent: { goal: 'Test goal', steps: [] },
            metabolism: { ipc: 0.5, memory: { used: 100, total: 512 }, activity: 0.3 },
            communications: []
        });
        assert.ok(panel.element.innerHTML.includes('Test thought'));
        assert.ok(panel.element.innerHTML.includes('Test goal'));
    });

    it('should handle empty data gracefully', () => {
        const panel = new AgentDataPanel();
        assert.doesNotThrow(() => {
            panel.setThoughts([]);
            panel.setIntent({ goal: '', steps: [] });
            panel.setMetabolism({ ipc: 0, memory: { used: 0, total: 0 }, activity: 0 });
            panel.setCommunications([]);
        });
    });

    it('should update existing data when methods called again', () => {
        const panel = new AgentDataPanel();
        panel.setThoughts([{ time: '12:00:00', text: 'First thought', type: 'inference' }]);
        assert.ok(panel.element.innerHTML.includes('First thought'));

        panel.setThoughts([{ time: '12:00:01', text: 'Second thought', type: 'action' }]);
        assert.ok(panel.element.innerHTML.includes('Second thought'));
        // First thought should be replaced
        assert.ok(!panel.element.innerHTML.includes('First thought') ||
                  panel.element.querySelectorAll('.thought-item').length === 1);
    });
});
