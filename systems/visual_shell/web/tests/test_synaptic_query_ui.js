/**
 * Tests for SynapticQueryUI component
 *
 * Run with:
 * - Browser: Open with test runner
 * - Node: mocha systems/visual_shell/web/tests/test_synaptic_query_ui.js
 */

describe('SynapticQueryUI', () => {
    let ui;
    let mockBridge;
    let navigateCallback;
    let highlightCallback;

    beforeEach(() => {
        // Create mock bridge
        mockBridge = {
            send: function(message) {
                this.lastMessage = message;
            },
            lastMessage: null
        };

        // Create callback spies
        navigateCallback = null;
        highlightCallback = null;

        // Create UI with mock dependencies
        ui = new SynapticQueryUI({
            bridge: mockBridge,
            onNavigate: (coords) => { navigateCallback = coords; },
            onHighlight: (results) => { highlightCallback = results; }
        });
    });

    afterEach(() => {
        if (ui && ui.destroy) {
            ui.destroy();
        }
        // Clean up any DOM elements
        const existingUI = document.querySelector('.synaptic-query-ui');
        if (existingUI) {
            existingUI.remove();
        }
    });

    describe('Construction', () => {
        it('constructor initializes bridge and input', () => {
            assert.ok(ui.bridge, 'Bridge should be stored');
            assert.equal(ui.bridge, mockBridge, 'Bridge should be the mock bridge');
            assert.ok(ui.element, 'UI element should be created');
            assert.ok(ui.input, 'Input element should be created');
            assert.ok(ui.resultsPanel, 'Results panel should be created');
        });

        it('should store callbacks', () => {
            assert.ok(ui.onNavigate, 'onNavigate callback should be stored');
            assert.ok(ui.onHighlight, 'onHighlight callback should be stored');
        });

        it('should be hidden by default', () => {
            assert.equal(ui.isVisible(), false, 'UI should be hidden initially');
        });

        it('should create input with Enter key handler', () => {
            const input = ui.input;
            assert.ok(input, 'Input element should exist');
            assert.equal(input.type, 'text', 'Input should be text type');
            assert.equal(input.placeholder, 'Query the neural substrate...', 'Input should have placeholder');
        });
    });

    describe('Query Execution', () => {
        it('query sends message to bridge', () => {
            ui.executeQuery('test query');

            assert.ok(mockBridge.lastMessage, 'Message should be sent to bridge');
            assert.equal(mockBridge.lastMessage.type, 'synaptic_query', 'Message type should be synaptic_query');
            assert.equal(mockBridge.lastMessage.query, 'test query', 'Query text should be in message');
        });

        it('Enter key triggers query', () => {
            ui.input.value = 'enter key test';
            ui.show();

            // Simulate Enter key press
            const enterEvent = new KeyboardEvent('keydown', { key: 'Enter' });
            ui.input.dispatchEvent(enterEvent);

            assert.ok(mockBridge.lastMessage, 'Enter key should trigger query');
            assert.equal(mockBridge.lastMessage.query, 'enter key test', 'Query should match input value');
        });

        it('empty query does not send message', () => {
            ui.executeQuery('');

            assert.equal(mockBridge.lastMessage, null, 'Empty query should not send message');
        });

        it('whitespace-only query does not send message', () => {
            ui.executeQuery('   ');

            assert.equal(mockBridge.lastMessage, null, 'Whitespace query should not send message');
        });
    });

    describe('Results Display', () => {
        it('displayResults renders results', () => {
            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'result1', type: 'memory' },
                { x: 300, y: 400, similarity: 0.85, token: 'result2', type: 'code' }
            ];

            ui.displayResults(results);

            const resultItems = ui.resultsPanel.querySelectorAll('.query-result-item');
            assert.equal(resultItems.length, 2, 'Should render 2 result items');
        });

        it('displayResults shows similarity percentage', () => {
            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'high_sim', type: 'memory' }
            ];

            ui.displayResults(results);

            const resultItem = ui.resultsPanel.querySelector('.query-result-item');
            assert.ok(resultItem.textContent.includes('95%'), 'Should show 95% similarity');
        });

        it('displayResults shows "No results" for empty array', () => {
            ui.displayResults([]);

            const noResults = ui.resultsPanel.querySelector('.no-results');
            assert.ok(noResults, 'Should show no results message');
        });

        it('handleQueryResponse calls displayResults', () => {
            const response = {
                type: 'synaptic_query_response',
                results: [
                    { x: 100, y: 200, similarity: 0.9, token: 'test', type: 'memory' }
                ]
            };

            ui.handleQueryResponse(response);

            const resultItems = ui.resultsPanel.querySelectorAll('.query-result-item');
            assert.equal(resultItems.length, 1, 'Should render 1 result');
        });
    });

    describe('Navigation', () => {
        it('navigateToBestMatch triggers callback', () => {
            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'best', type: 'memory' },
                { x: 300, y: 400, similarity: 0.85, token: 'second', type: 'code' }
            ];

            ui.displayResults(results);
            ui.navigateToBestMatch();

            assert.ok(navigateCallback, 'Navigate callback should be triggered');
            assert.equal(navigateCallback.x, 100, 'Should navigate to best match x');
            assert.equal(navigateCallback.y, 200, 'Should navigate to best match y');
        });

        it('click on result item triggers navigation', () => {
            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'clickable', type: 'memory' }
            ];

            ui.displayResults(results);
            ui.show();

            // Simulate click on result
            const resultItem = ui.resultsPanel.querySelector('.query-result-item');
            resultItem.click();

            assert.ok(navigateCallback, 'Click should trigger navigate callback');
            assert.equal(navigateCallback.x, 100, 'Should navigate to clicked result x');
            assert.equal(navigateCallback.y, 200, 'Should navigate to clicked result y');
        });

        it('handleQueryResponse auto-navigates to best match', () => {
            const response = {
                type: 'synaptic_query_response',
                results: [
                    { x: 500, y: 600, similarity: 0.99, token: 'auto_navigate', type: 'memory' }
                ]
            };

            ui.handleQueryResponse(response);

            assert.ok(navigateCallback, 'Should auto-navigate to best match');
            assert.equal(navigateCallback.x, 500, 'Auto-navigate to best x');
            assert.equal(navigateCallback.y, 600, 'Auto-navigate to best y');
        });

        it('handleQueryResponse triggers highlight callback', () => {
            const response = {
                type: 'synaptic_query_response',
                results: [
                    { x: 100, y: 200, similarity: 0.9, token: 'highlight_test', type: 'memory' }
                ]
            };

            ui.handleQueryResponse(response);

            assert.ok(highlightCallback, 'Highlight callback should be triggered');
            assert.equal(highlightCallback.length, 1, 'Should highlight 1 result');
        });
    });

    describe('Visibility', () => {
        it('show makes UI visible', () => {
            ui.show();
            assert.equal(ui.isVisible(), true, 'UI should be visible');
            assert.equal(ui.element.style.display !== 'none', true, 'Element should not be hidden');
        });

        it('hide hides UI', () => {
            ui.show();
            ui.hide();
            assert.equal(ui.isVisible(), false, 'UI should be hidden');
        });

        it('toggle switches visibility', () => {
            assert.equal(ui.isVisible(), false, 'Initially hidden');
            ui.toggle();
            assert.equal(ui.isVisible(), true, 'After toggle, visible');
            ui.toggle();
            assert.equal(ui.isVisible(), false, 'After second toggle, hidden');
        });
    });
});

// Export for Node.js test runners
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SynapticQueryUI };
}
