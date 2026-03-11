/**
 * Tests for GlassBoxOverlay component
 *
 * Run with:
 * - Browser: Open neural_city_demo.html with test runner
 * - Node: mocha systems/visual_shell/web/tests/test_glass_box_overlay.js
 */

describe('GlassBoxOverlay', () => {
    let overlay;

    beforeEach(() => {
        // Create a clean document body for each test
        if (typeof document !== 'undefined') {
            const existingOverlay = document.querySelector('.glass-box-overlay');
            if (existingOverlay) {
                existingOverlay.remove();
            }
        }
        overlay = new GlassBoxOverlay({ width: 400 });
    });

    afterEach(() => {
        if (overlay && overlay.destroy) {
            overlay.destroy();
        }
    });

    describe('Construction', () => {
        it('should create overlay element on construction', () => {
            assert.ok(overlay.element, 'Overlay element should exist');
            assert.ok(
                overlay.element.classList.contains('glass-box-overlay'),
                'Element should have glass-box-overlay class'
            );
        });

        it('should append element to document body', () => {
            if (typeof document === 'undefined') return;
            assert.ok(
                document.body.contains(overlay.element),
                'Element should be in document body'
            );
        });

        it('should be hidden by default', () => {
            assert.equal(
                overlay.isVisible(),
                false,
                'Overlay should not be visible initially'
            );
            assert.equal(
                overlay.element.style.right,
                '-400px',
                'Overlay should be positioned off-screen'
            );
        });

        it('should accept custom width configuration', () => {
            const customOverlay = new GlassBoxOverlay({ width: 500 });
            assert.equal(customOverlay.config.width, 500);
            customOverlay.destroy();
        });
    });

    describe('Opening', () => {
        it('should show overlay when open() is called', () => {
            overlay.open({ agentId: 'test-agent' });
            assert.equal(
                overlay.isVisible(),
                true,
                'Overlay should be visible after open()'
            );
        });

        it('should move overlay on-screen when opened', () => {
            overlay.open({ agentId: 'test-agent' });
            assert.equal(
                overlay.element.style.right,
                '0px',
                'Overlay should slide into view'
            );
        });

        it('should store agent data when opened', () => {
            const agentData = { agentId: 'agent-01', name: 'Test Agent' };
            overlay.open(agentData);
            assert.deepEqual(
                overlay.currentAgent,
                agentData,
                'Agent data should be stored'
            );
        });

        it('should render content when opened', () => {
            overlay.open({ agentId: 'test-agent' });
            assert.ok(
                overlay.element.querySelector('.glass-box-header'),
                'Header should be rendered'
            );
            assert.ok(
                overlay.element.querySelector('.glass-box-content'),
                'Content area should be rendered'
            );
        });

        it('should display agent ID in header', () => {
            overlay.open({ agentId: 'agent-123' });
            const agentIdEl = overlay.element.querySelector('.agent-id');
            assert.ok(agentIdEl, 'Agent ID element should exist');
            assert.ok(
                agentIdEl.textContent.includes('agent-123'),
                'Agent ID should be displayed'
            );
        });

        it('should have close button', () => {
            overlay.open({ agentId: 'test-agent' });
            const closeBtn = overlay.element.querySelector('.close-btn');
            assert.ok(closeBtn, 'Close button should exist');
            assert.equal(
                closeBtn.getAttribute('aria-label'),
                'Close overlay',
                'Close button should have aria-label'
            );
        });
    });

    describe('Closing', () => {
        it('should hide overlay when close() is called', () => {
            overlay.open({ agentId: 'test-agent' });
            overlay.close();
            assert.equal(
                overlay.isVisible(),
                false,
                'Overlay should not be visible after close()'
            );
        });

        it('should move overlay off-screen when closed', () => {
            overlay.open({ agentId: 'test-agent' });
            overlay.close();
            assert.equal(
                overlay.element.style.right,
                '-400px',
                'Overlay should slide out of view'
            );
        });

        it('should clear agent data when closed', () => {
            overlay.open({ agentId: 'test-agent' });
            overlay.close();
            assert.equal(
                overlay.currentAgent,
                null,
                'Agent data should be cleared'
            );
        });

        it('should call onClose callback if provided', () => {
            let callbackCalled = false;
            overlay.onClose = () => { callbackCalled = true; };
            overlay.open({ agentId: 'test-agent' });
            overlay.close();
            assert.equal(
                callbackCalled,
                true,
                'onClose callback should be invoked'
            );
        });

        it('should close when close button is clicked', () => {
            overlay.open({ agentId: 'test-agent' });
            const closeBtn = overlay.element.querySelector('.close-btn');
            closeBtn.click();
            assert.equal(
                overlay.isVisible(),
                false,
                'Clicking close button should hide overlay'
            );
        });
    });

    describe('Click Outside to Close', () => {
        it('should emit close event when clicking outside overlay', () => {
            let closed = false;
            overlay.onClose = () => { closed = true; };
            overlay.open({ agentId: 'test' });

            // Simulate click outside
            const mockEvent = {
                target: document.body
            };
            overlay._handleOutsideClick(mockEvent);

            assert.equal(
                closed,
                true,
                'Clicking outside should trigger close'
            );
        });

        it('should NOT close when clicking inside overlay', () => {
            let closed = false;
            overlay.onClose = () => { closed = true; };
            overlay.open({ agentId: 'test' });

            // Simulate click inside
            const mockEvent = {
                target: overlay.element
            };
            overlay._handleOutsideClick(mockEvent);

            assert.equal(
                closed,
                false,
                'Clicking inside should not trigger close'
            );
        });

        it('should add click listener after opening', (done) => {
            if (typeof document === 'undefined') {
                done();
                return;
            }

            const originalAdd = document.addEventListener;
            let listenerAdded = false;
            document.addEventListener = function(name, fn) {
                if (name === 'click') listenerAdded = true;
                return originalAdd.call(this, name, fn);
            };

            overlay.open({ agentId: 'test' });

            setTimeout(() => {
                assert.equal(
                    listenerAdded,
                    true,
                    'Click listener should be added'
                );
                document.addEventListener = originalAdd;
                done();
            }, 150);
        });

        it('should remove click listener after closing', () => {
            if (typeof document === 'undefined') return;

            const originalRemove = document.removeEventListener;
            let listenerRemoved = false;
            document.removeEventListener = function(name, fn) {
                if (name === 'click') listenerRemoved = true;
                return originalRemove.call(this, name, fn);
            };

            overlay.open({ agentId: 'test' });
            overlay.close();

            assert.equal(
                listenerRemoved,
                true,
                'Click listener should be removed'
            );
            document.removeEventListener = originalRemove;
        });
    });

    describe('Rendering', () => {
        it('should render header with title', () => {
            overlay.open({ agentId: 'test' });
            const header = overlay.element.querySelector('.glass-box-header h2');
            assert.ok(header, 'Header title should exist');
        });

        it('should render content area', () => {
            overlay.open({ agentId: 'test' });
            const content = overlay.element.querySelector('.glass-box-content');
            assert.ok(content, 'Content area should exist');
        });

        it('should handle missing agent data gracefully', () => {
            overlay.open({});
            const agentIdEl = overlay.element.querySelector('.agent-id');
            assert.ok(
                agentIdEl.textContent.includes('Unknown'),
                'Should show "Unknown" for missing agent ID'
            );
        });
    });

    describe('Destruction', () => {
        it('should remove element from DOM when destroyed', () => {
            if (typeof document === 'undefined') return;

            overlay.destroy();
            assert.ok(
                !document.body.contains(overlay.element),
                'Element should be removed from DOM'
            );
        });

        it('should remove event listeners when destroyed', () => {
            if (typeof document === 'undefined') return;

            overlay.open({ agentId: 'test' });
            overlay.destroy();

            // Should not throw error or cause issues
            const mockEvent = { target: document.body };
            overlay._handleOutsideClick(mockEvent);
            assert.ok(true, 'No error after destruction');
        });
    });

    describe('Styling', () => {
        it('should have correct CSS classes', () => {
            assert.ok(
                overlay.element.classList.contains('glass-box-overlay'),
                'Should have glass-box-overlay class'
            );
        });

        it('should have fixed positioning', () => {
            assert.equal(
                overlay.element.style.position,
                'fixed',
                'Should use fixed positioning'
            );
        });

        it('should have high z-index', () => {
            assert.ok(
                overlay.element.style.zIndex >= 1000,
                'Should have high z-index for overlay'
            );
        });

        it('should have cyan border', () => {
            assert.ok(
                overlay.element.style.borderLeft.includes('#0ff'),
                'Should have cyan left border'
            );
        });
    });
});

// Export for Node.js test runners
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GlassBoxOverlay };
}
