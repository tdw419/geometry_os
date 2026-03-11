/**
 * Node.js test runner for HealthPanel
 */

const fs = require('fs');
const path = require('path');

class MockElement {
    constructor(tag) {
        this.tag = tag;
        this.className = '';
        this.children = [];
        this.parentNode = null;
        this._textContent = '';
        this.style = {};
    }
    get textContent() { return this._textContent; }
    set textContent(v) { this._textContent = v; }
    
    appendChild(c) { this.children.push(c); c.parentNode = this; }
    prepend(c) { this.children.unshift(c); c.parentNode = this; }
    removeChild(c) { 
        const idx = this.children.indexOf(c);
        if (idx >= 0) this.children.splice(idx, 1);
        c.parentNode = null;
    }
    
    querySelector(sel) {
        const parts = sel.trim().split(/\s+/);
        let current = [this];
        
        for (const part of parts) {
            let next = [];
            
            for (const el of current) {
                const found = this._findAll(el, (e) => {
                    // Handle .class1.class2
                    if (part.startsWith('.')) {
                        const classes = part.substring(1).split('.');
                        return classes.every(cls => e.className.includes(cls));
                    }
                    return e.tag === part;
                });
                next = next.concat(found);
            }
            current = next;
            if (current.length === 0) return null;
        }
        return current[0];
    }
    
    _findAll(el, predicate) {
        let results = [];
        for (const child of el.children) {
            if (predicate(child)) results.push(child);
            results = results.concat(this._findAll(child, predicate));
        }
        return results;
    }
}

// Mock DOM
global.document = {
    createElement: (tag) => {
        return new MockElement(tag);
    },
    body: new MockElement('body')
};

const healthPanelCode = fs.readFileSync(path.join(__dirname, '../js/swarm/HealthPanel.js'), 'utf8');
const HealthPanel = (function() {
    let window = {};
    eval(healthPanelCode);
    return window.HealthPanel;
})();
global.HealthPanel = HealthPanel;

const testCode = fs.readFileSync(path.join(__dirname, 'test_health_panel.js'), 'utf8');
const HealthPanelTests = (function() {
    let window = {};
    eval(testCode);
    return window.HealthPanelTests;
})();
global.HealthPanelTests = HealthPanelTests;

async function runTests() {
    const tests = new HealthPanelTests();
    const success = await tests.execute();
    process.exit(success ? 0 : 1);
}

runTests();
