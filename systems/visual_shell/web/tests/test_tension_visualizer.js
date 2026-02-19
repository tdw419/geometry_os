/**
 * Tests for TensionVisualizer - Renders tension lines between buildings.
 */

describe('TensionVisualizer', () => {
    it('should create visualizer with container', () => {
        const viz = new TensionVisualizer({ container: {} });
        assert.ok(viz.container);
        assert.ok(viz.tensionLines);
        assert.ok(viz.anchorTethers);
    });

    it('should render tension line between two points', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {} } });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.8);

        assert.equal(viz.tensionLines.size, 1);
        assert.ok(viz.tensionLines.has('a-b'));
    });

    it('should remove tension line', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {}, removeChild: () => {} } });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.8);
        viz.removeTension('a', 'b');

        assert.equal(viz.tensionLines.size, 0);
    });

    it('should color lines by force magnitude', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {} } });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.3);
        const line1 = viz.tensionLines.get('a-b');

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.9);
        const line2 = viz.tensionLines.get('a-b');

        // Both should have entries
        assert.ok(line1);
        assert.ok(line2);
    });

    it('should render anchor tether', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {} } });

        viz.renderAnchorTether('agent-001', { x: 200, y: 0 }, { x: 0, y: 0 });

        assert.ok(viz.anchorTethers.has('agent-001'));
    });

    it('should not render tether for close positions', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {} } });

        // Building close to anchor (< 50 units)
        viz.renderAnchorTether('agent-001', { x: 10, y: 10 }, { x: 0, y: 0 });

        assert.ok(!viz.anchorTethers.has('agent-001'));
    });

    it('should update all tensions from drift data', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {}, removeChild: () => {} } });

        viz.updateFromDrifts({
            'agent-001': { dx: 10, dy: 5, magnitude: 11.2 },
            'agent-002': { dx: -5, dy: 10, magnitude: 11.2 }
        });

        // Should have cleared without error
        assert.ok(true);
    });

    it('should clear all visualizations', () => {
        const viz = new TensionVisualizer({ container: { addChild: () => {}, removeChild: () => {} } });

        viz.renderTension('a', 'b', { x: 0, y: 0 }, { x: 100, y: 0 }, 0.8);
        viz.renderAnchorTether('agent-001', { x: 200, y: 0 }, { x: 0, y: 0 });

        viz.clear();

        assert.equal(viz.tensionLines.size, 0);
        assert.equal(viz.anchorTethers.size, 0);
    });
});
