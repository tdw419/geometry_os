/**
 * Node.js test runner for SynapticQueryUI
 */

const fs = require('fs');
const path = require('path');

// Simple Mock Element for DOM simulation
class MockElement {
    constructor(tag) {
        this.tag = tag;
        this.className = '';
        this._innerHTML = '';
        this.children = [];
        this.parentNode = null;
        this._textContent = '';
        this.style = {};
        this._attributes = {};
        this._dataset = {};
    }

    get textContent() { return this._textContent; }
    set textContent(v) { this._textContent = v; }

    get innerHTML() { return this._innerHTML; }
    set innerHTML(v) {
        this._innerHTML = v;
        this._parseInnerHTML(v);
    }

    get dataset() { return this._dataset; }

    setAttribute(name, value) {
        this._attributes[name] = value;
        if (name === 'class') this.className = value;
        if (name === 'data-x') this._dataset.x = value;
        if (name === 'data-y') this._dataset.y = value;
        if (name === 'data-index') this._dataset.index = value;
    }

    getAttribute(name) {
        return this._attributes[name];
    }

    appendChild(c) {
        this.children.push(c);
        c.parentNode = this;
    }

    prepend(c) {
        this.children.unshift(c);
        c.parentNode = this;
    }

    removeChild(c) {
        const idx = this.children.indexOf(c);
        if (idx >= 0) this.children.splice(idx, 1);
        c.parentNode = null;
    }

    remove() {
        if (this.parentNode) {
            this.parentNode.removeChild(this);
        }
    }

    querySelector(sel) {
        return this._findAll(this, (e) => {
            if (sel.startsWith('.')) {
                const classes = sel.substring(1).split('.');
                return classes.every(cls => e.className.includes(cls));
            }
            return e.tag === sel;
        })[0] || null;
    }

    querySelectorAll(sel) {
        return this._findAll(this, (e) => {
            if (sel.startsWith('.')) {
                const classes = sel.substring(1).split('.');
                return classes.every(cls => e.className.includes(cls));
            }
            return e.tag === sel;
        });
    }

    contains(el) {
        if (this === el) return true;
        for (const child of this.children) {
            if (child.contains && child.contains(el)) return true;
        }
        return false;
    }

    _findAll(el, predicate) {
        let results = [];
        for (const child of el.children) {
            if (predicate(child)) results.push(child);
            if (child._findAll) {
                results = results.concat(child._findAll(child, predicate));
            }
        }
        return results;
    }

    _parseInnerHTML(html) {
        // Simple parser for basic HTML structures
        const tagRegex = /<(\w+)([^>]*)>([^<]*)/g;
        let match;
        this.children = [];

        while ((match = tagRegex.exec(html)) !== null) {
            const tag = match[1];
            const attrs = match[2];
            const text = match[3];

            const el = new MockElement(tag);

            // Parse attributes
            const classMatch = attrs.match(/class="([^"]+)"/);
            if (classMatch) el.className = classMatch[1];

            const placeholderMatch = attrs.match(/placeholder="([^"]+)"/);
            if (placeholderMatch) el._attributes.placeholder = placeholderMatch[1];

            const typeMatch = attrs.match(/type="([^"]+)"/);
            if (typeMatch) el._attributes.type = typeMatch[1];

            const dataXMatch = attrs.match(/data-x="([^"]+)"/);
            if (dataXMatch) el._dataset.x = dataXMatch[1];

            const dataYMatch = attrs.match(/data-y="([^"]+)"/);
            if (dataYMatch) el._dataset.y = dataYMatch[1];

            const dataIndexMatch = attrs.match(/data-index="([^"]+)"/);
            if (dataIndexMatch) el._dataset.index = dataIndexMatch[1];

            // Set text content
            if (text && !attrs.includes('class=')) {
                el._textContent = text.trim();
            }

            this.children.push(el);
        }
    }

    dispatchEvent(event) {
        // Simplified event dispatch
        if (this._listeners && this._listeners[event.type]) {
            this._listeners[event.type].forEach(fn => fn(event));
        }
    }

    addEventListener(type, fn) {
        if (!this._listeners) this._listeners = {};
        if (!this._listeners[type]) this._listeners[type] = [];
        this._listeners[type].push(fn);
    }

    removeEventListener(type, fn) {
        if (this._listeners && this._listeners[type]) {
            const idx = this._listeners[type].indexOf(fn);
            if (idx >= 0) this._listeners[type].splice(idx, 1);
        }
    }

    click() {
        this.dispatchEvent({ type: 'click', target: this });
    }

    focus() {}
}

// Mock KeyboardEvent
class MockKeyboardEvent {
    constructor(type, options = {}) {
        this.type = type;
        this.key = options.key || '';
    }
}

// Mock DOM
global.document = {
    createElement: (tag) => new MockElement(tag),
    body: new MockElement('body'),
    querySelector: (sel) => null,
    addEventListener: () => {},
    removeEventListener: () => {}
};

global.KeyboardEvent = MockKeyboardEvent;

// Load SynapticQueryUI
const synapticQueryUICode = fs.readFileSync(path.join(__dirname, '../SynapticQueryUI.js'), 'utf8');
const SynapticQueryUI = (function() {
    let window = {};
    let module = { exports: {} };
    eval(synapticQueryUICode);
    return window.SynapticQueryUI || module.exports.SynapticQueryUI;
})();
global.SynapticQueryUI = SynapticQueryUI;

// Test class
class SynapticQueryUITests {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.tests = [];
    }

    test(name, fn) {
        this.tests.push({ name, fn });
    }

    assertEqual(actual, expected, msg) {
        if (actual !== expected) {
            throw new Error(`${msg}: expected ${expected}, got ${actual}`);
        }
    }

    assertOk(value, msg) {
        if (!value) {
            throw new Error(`${msg}: expected truthy value, got ${value}`);
        }
    }

    async run() {
        console.log('Running SynapticQueryUI Tests\n');
        console.log('=' .repeat(50));

        // Collect tests
        this.setupTests();

        // Run each test
        for (const test of this.tests) {
            try {
                // Setup fresh mocks for each test
                this.beforeEach();
                await test.fn.call(this);
                console.log(`  [PASS] ${test.name}`);
                this.passed++;
            } catch (e) {
                console.log(`  [FAIL] ${test.name}`);
                console.log(`         Error: ${e.message}`);
                this.failed++;
            }
        }

        console.log('=' .repeat(50));
        console.log(`\nResults: ${this.passed} passed, ${this.failed} failed`);

        return this.failed === 0;
    }

    beforeEach() {
        // Clean up
        global.document.body = new MockElement('body');
    }

    setupTests() {
        this.test('constructor initializes bridge and input', () => {
            const mockBridge = { send: () => {}, lastMessage: null };
            const ui = new SynapticQueryUI({
                bridge: mockBridge,
                onNavigate: () => {},
                onHighlight: () => {}
            });

            this.assertOk(ui.bridge, 'Bridge should be stored');
            this.assertEqual(ui.bridge, mockBridge, 'Bridge should be the mock bridge');
            this.assertOk(ui.element, 'UI element should be created');
            this.assertOk(ui.input, 'Input element should be created');
            this.assertOk(ui.resultsPanel, 'Results panel should be created');

            ui.destroy();
        });

        this.test('query sends message to bridge', () => {
            const mockBridge = {
                send: function(msg) { this.lastMessage = msg; },
                lastMessage: null
            };
            const ui = new SynapticQueryUI({ bridge: mockBridge });

            ui.executeQuery('test query');

            this.assertOk(mockBridge.lastMessage, 'Message should be sent to bridge');
            this.assertEqual(mockBridge.lastMessage.type, 'synaptic_query', 'Message type should be synaptic_query');
            this.assertEqual(mockBridge.lastMessage.query, 'test query', 'Query text should be in message');

            ui.destroy();
        });

        this.test('displayResults renders results', () => {
            const ui = new SynapticQueryUI({ bridge: {} });
            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'result1', type: 'memory' },
                { x: 300, y: 400, similarity: 0.85, token: 'result2', type: 'code' }
            ];

            ui.displayResults(results);

            const resultItems = ui.resultsPanel.querySelectorAll('.query-result-item');
            this.assertEqual(resultItems.length, 2, 'Should render 2 result items');

            ui.destroy();
        });

        this.test('navigateToBestMatch triggers callback', () => {
            let navigateCalled = false;
            let navigateCoords = null;

            const ui = new SynapticQueryUI({
                bridge: {},
                onNavigate: (coords) => {
                    navigateCalled = true;
                    navigateCoords = coords;
                }
            });

            const results = [
                { x: 100, y: 200, similarity: 0.95, token: 'best', type: 'memory' },
                { x: 300, y: 400, similarity: 0.85, token: 'second', type: 'code' }
            ];

            ui.displayResults(results);
            ui.navigateToBestMatch();

            this.assertOk(navigateCalled, 'Navigate callback should be triggered');
            this.assertEqual(navigateCoords.x, 100, 'Should navigate to best match x');
            this.assertEqual(navigateCoords.y, 200, 'Should navigate to best match y');

            ui.destroy();
        });
    }
}

// Run tests
async function main() {
    const tests = new SynapticQueryUITests();
    const success = await tests.run();
    process.exit(success ? 0 : 1);
}

main();
