/**
 * Simple Test Runner for ASCII Desktop Control JS Tests
 *
 * Runs tests using JSDOM for DOM simulation
 */

const { JSDOM } = require('jsdom');
const fs = require('fs');
const path = require('path');

// Setup JSDOM
const dom = new JSDOM('<!DOCTYPE html><html><body><div id="test-container"></div></body></html>', {
    url: 'http://localhost',
    pretendToBeVisual: true
});

global.window = dom.window;
global.document = dom.window.document;
global.XMLHttpRequest = dom.window.XMLHttpRequest;
global.fetch = dom.window.fetch;

// Mock WordPress AJAX
global.ascii_desktop_control_ajax = {
    ajax_url: 'http://localhost/wp-admin/admin-ajax.php',
    nonce: 'test-nonce-123'
};

// Simple test framework
let passCount = 0;
let failCount = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`✓ ${name}`);
        passCount++;
    } catch (e) {
        console.log(`✗ ${name}`);
        console.log(`  Error: ${e.message}`);
        failCount++;
    }
}

function assertEqual(actual, expected, message = '') {
    if (actual !== expected) {
        throw new Error(`${message}\n  Expected: ${expected}\n  Actual: ${actual}`);
    }
}

function assertTrue(condition, message = '') {
    if (!condition) {
        throw new Error(message || 'Assertion failed');
    }
}

function assertContains(str, substring, message = '') {
    if (!str.includes(substring)) {
        throw new Error(`${message}\n  Expected "${str}" to contain "${substring}"`);
    }
}

// Load the test file
const testFile = path.join(__dirname, 'control.test.js');
const testCode = fs.readFileSync(testFile, 'utf8');

// Execute tests
console.log('Running ASCII Desktop Control JS Tests\n');
console.log('='.repeat(50) + '\n');

try {
    // The test file uses module pattern, eval it
    eval(testCode);
} catch (e) {
    console.log(`Error loading test file: ${e.message}`);
}

console.log('\n' + '='.repeat(50));
console.log(`\nResults: ${passCount} passed, ${failCount} failed`);

process.exit(failCount > 0 ? 1 : 0);
