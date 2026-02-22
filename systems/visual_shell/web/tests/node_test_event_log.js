/**
 * Node.js test runner for EventLog
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
        this._innerHTML = '';
        this.style = { display: 'block' };
        this.dataset = {};
        this.classList = {
            add: (c) => { if (!this.className.includes(c)) this.className += ' ' + c; },
            remove: (c) => { this.className = this.className.replace(c, '').trim(); }
        };
    }
    get textContent() { 
        if (this._textContent) return this._textContent;
        return this.children.map(c => c.textContent).join(' ');
    }
    set textContent(v) { this._textContent = v; }
    
    get innerHTML() { return this._innerHTML; }
    set innerHTML(v) { 
        this._innerHTML = v;
        // Super simple parser for tests
        if (v.includes('events-list')) {
            const list = new MockElement('div');
            list.className = 'events-list';
            this.appendChild(list);
        }
        if (v.includes('filter-bar')) {
            const bar = new MockElement('div');
            bar.className = 'filter-bar';
            ['all', 'info', 'warn', 'error'].forEach(f => {
                const btn = new MockElement('button');
                btn.dataset.filter = f;
                bar.appendChild(btn);
            });
            this.appendChild(bar);
        }
    }
    
    appendChild(c) { this.children.push(c); c.parentNode = this; }
    prepend(c) { this.children.unshift(c); c.parentNode = this; }
    removeChild(c) { 
        const idx = this.children.indexOf(c);
        if (idx >= 0) this.children.splice(idx, 1);
        c.parentNode = null;
    }
    
    get lastChild() { return this.children[this.children.length - 1]; }
    
    querySelector(sel) {
        const parts = sel.trim().split(/\s+/);
        let current = [this];
        
        for (const part of parts) {
            let next = [];
            for (const el of current) {
                const found = this._findAll(el, (e) => {
                    if (part.startsWith('.')) {
                        const classes = part.substring(1).split('.');
                        return classes.every(cls => e.className.includes(cls));
                    }
                    if (part.startsWith('[')) { // data attribute
                        const m = part.match(/\[data-(.+)="(.+)"\]/);
                        if (m) return e.dataset[m[1]] === m[2];
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
    
    querySelectorAll(sel) {
        const found = this._findAll(this, (e) => {
            if (sel.startsWith('.')) {
                return e.className.includes(sel.substring(1));
            }
            return e.tag === sel;
        });
        return found;
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

global.document = {
    createElement: (tag) => new MockElement(tag),
    body: new MockElement('body')
};

const eventLogCode = fs.readFileSync(path.join(__dirname, '../js/swarm/EventLog.js'), 'utf8');
const EventLog = (function() {
    let window = {};
    eval(eventLogCode);
    return window.EventLog;
})();
global.EventLog = EventLog;

const testCode = fs.readFileSync(path.join(__dirname, 'test_event_log.js'), 'utf8');
const EventLogTests = (function() {
    let window = {};
    eval(testCode);
    return window.EventLogTests;
})();
global.EventLogTests = EventLogTests;

async function runTests() {
    const tests = new EventLogTests();
    const success = await tests.execute();
    process.exit(success ? 0 : 1);
}

runTests();
