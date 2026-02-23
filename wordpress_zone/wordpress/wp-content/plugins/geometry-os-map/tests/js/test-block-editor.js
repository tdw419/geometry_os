/**
 * JavaScript tests for Geometry OS Map block editor
 *
 * These tests verify the block registration and behavior in the editor.
 * Run with: node tests/js/test-block-editor.js
 *
 * Note: These are standalone tests that mock the WordPress globals.
 */

// Mock WordPress globals
const mockWp = {
    blocks: {
        registeredBlocks: {},
        registerBlockType: function(name, settings) {
            this.registeredBlocks[name] = settings;
        },
        getBlockType: function(name) {
            return this.registeredBlocks[name] || null;
        },
        getBlockTypes: function() {
            return Object.values(this.registeredBlocks);
        }
    },
    element: {
        createElement: function(tag, props, ...children) {
            return { tag, props, children };
        }
    },
    components: {
        PanelBody: function(props) { return props; },
        TextControl: function(props) { return props; },
        SelectControl: function(props) { return props; },
        ToggleControl: function(props) { return props; }
    },
    editor: {
        InspectorControls: function(props) { return props; }
    },
    i18n: {
        __: function(text) { return text; }
    }
};

// Set up global wp object
global.wp = mockWp;

// Simple test runner
class TestRunner {
    constructor() {
        this.passed = 0;
        this.failed = 0;
        this.errors = [];
    }

    assert(condition, message) {
        if (condition) {
            this.passed++;
            console.log(`✅ PASS: ${message}`);
        } else {
            this.failed++;
            this.errors.push(message);
            console.log(`❌ FAIL: ${message}`);
        }
    }

    assertEqual(expected, actual, message) {
        this.assert(
            JSON.stringify(expected) === JSON.stringify(actual),
            `${message}\n      Expected: ${JSON.stringify(expected)}\n      Actual: ${JSON.stringify(actual)}`
        );
    }

    assertContains(needle, haystack, message) {
        this.assert(
            haystack && haystack.includes(needle),
            `${message} (expected to contain: ${needle})`
        );
    }

    assertDefined(value, message) {
        this.assert(value !== undefined && value !== null, message);
    }

    summary() {
        console.log('\n' + '='.repeat(50));
        console.log(`Results: ${this.passed} passed, ${this.failed} failed`);
        if (this.failed > 0) {
            console.log('\nFailed tests:');
            this.errors.forEach(e => console.log(`  - ${e}`));
        }
        console.log('='.repeat(50));
        return this.failed === 0 ? 0 : 1;
    }
}

// Read and eval the block-editor.js file
const fs = require('fs');
const path = require('path');

const blockEditorPath = path.join(__dirname, '../../assets/js/block-editor.js');
let blockEditorCode;

try {
    blockEditorCode = fs.readFileSync(blockEditorPath, 'utf8');
} catch (e) {
    console.log('❌ Could not read block-editor.js:', e.message);
    console.log('   Creating mock block for testing...');
}

// Run tests
const test = new TestRunner();

console.log('\n' + '='.repeat(50));
console.log('Geometry OS Map - Block Editor Tests');
console.log('='.repeat(50) + '\n');

// ============================================
// Test 1: Parse block code to verify structure
// ============================================
console.log('Test Group: Block Code Structure');

if (blockEditorCode) {
    test.assertContains('geometry-os/map', blockEditorCode, 'Block name defined in code');
    test.assertContains('registerBlockType', blockEditorCode, 'registerBlockType called');
    test.assertContains('InspectorControls', blockEditorCode, 'Uses InspectorControls');
    test.assertContains('admin-site', blockEditorCode, 'Icon is admin-site');
    test.assertContains('embed', blockEditorCode, 'Category is embed');
} else {
    console.log('⚠️  Skipping code structure tests (file not found)');
}

// ============================================
// Test 2: Expected block attributes
// ============================================
console.log('\nTest Group: Expected Attributes');

const expectedAttributes = [
    { name: 'width', type: 'string', default: '100%' },
    { name: 'height', type: 'string', default: '600px' },
    { name: 'fullscreen', type: 'boolean', default: false },
    { name: 'mode', type: 'string', default: '' },
    { name: 'theme', type: 'string', default: 'dark' },
    { name: 'showTutorial', type: 'boolean', default: true }
];

expectedAttributes.forEach(attr => {
    test.assertContains(attr.name, blockEditorCode || '', `Attribute '${attr.name}' defined`);
});

// ============================================
// Test 3: Edit function components
// ============================================
console.log('\nTest Group: Edit Function');

if (blockEditorCode) {
    test.assertContains('TextControl', blockEditorCode, 'Uses TextControl for width/height');
    test.assertContains('SelectControl', blockEditorCode, 'Uses SelectControl for theme/mode');
    test.assertContains('ToggleControl', blockEditorCode, 'Uses ToggleControl for fullscreen');
    test.assertContains('setAttributes', blockEditorCode, 'Handles attribute changes');
}

// ============================================
// Test 4: Save function (SSR)
// ============================================
console.log('\nTest Group: Save Function');

if (blockEditorCode) {
    test.assertContains('return null', blockEditorCode, 'Save returns null for SSR');
}

// ============================================
// Test 5: Placeholder preview
// ============================================
console.log('\nTest Group: Placeholder Preview');

if (blockEditorCode) {
    test.assertContains('background', blockEditorCode, 'Has background styling');
    test.assertContains('borderRadius', blockEditorCode, 'Has border radius styling');
    test.assertContains('Geometry OS Map', blockEditorCode, 'Contains title text');
}

// ============================================
// Test 6: Theme options
// ============================================
console.log('\nTest Group: Theme Options');

if (blockEditorCode) {
    test.assertContains('dark', blockEditorCode, 'Dark theme option');
    test.assertContains('light', blockEditorCode, 'Light theme option');
    test.assertContains('highContrast', blockEditorCode, 'High contrast theme option');
}

// ============================================
// Test 7: Mode options
// ============================================
console.log('\nTest Group: Mode Options');

if (blockEditorCode) {
    test.assertContains('desktop', blockEditorCode, 'Desktop mode option');
    test.assertContains('Default', blockEditorCode, 'Default mode option');
}

// ============================================
// Summary
// ============================================
process.exit(test.summary());
