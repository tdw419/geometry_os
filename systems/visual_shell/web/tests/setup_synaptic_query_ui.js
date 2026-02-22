/**
 * Mocha test setup for SynapticQueryUI component tests.
 * Provides DOM environment via jsdom and loads required classes.
 */

const { JSDOM } = require('jsdom');
const fs = require('fs');
const path = require('path');

// Create DOM environment
const dom = new JSDOM('<!DOCTYPE html><html><body></body></html>', {
    runScripts: 'dangerously',
    resources: 'usable'
});

// Make DOM available globally
global.window = dom.window;
global.document = dom.window.document;
global.navigator = dom.window.navigator;
global.assert = require('assert');

// Helper to load a JS file into the global scope
function loadJSFile(filePath) {
    const absolutePath = path.resolve(__dirname, '../../' + filePath);
    const code = fs.readFileSync(absolutePath, 'utf8');

    // Execute the code
    eval(code);

    // Export window globals to global scope for tests
    const classNames = [
        'SynapticQueryUI'
    ];

    classNames.forEach(name => {
        if (window[name]) {
            global[name] = window[name];
        }
    });
}

// Load required components
loadJSFile('web/SynapticQueryUI.js');

// Export for use in tests
global.loadJSFile = loadJSFile;
