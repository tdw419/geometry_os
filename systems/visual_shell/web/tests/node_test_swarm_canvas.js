/**
 * Node.js test runner for SwarmCanvas
 * Mocks browser and PIXI environment
 */

// Mock Browser globals
global.window = {
    innerWidth: 1024,
    innerHeight: 768
};

global.document = {
    createElement: (tag) => ({
        clientWidth: 800,
        clientHeight: 600,
        appendChild: () => {},
        querySelector: () => ({}),
        style: {},
        id: '',
        parentNode: { removeChild: () => {} },
        addEventListener: () => {}
    }),
    body: {
        appendChild: () => {},
        removeChild: () => {}
    }
};

// Mock PIXI v8
global.PIXI = {
    Application: class {
        constructor() {
            this.stage = new PIXI.Container();
            this.canvas = {};
            this.ticker = { 
                add: (fn, ctx) => { 
                    this._tickerFns = this._tickerFns || [];
                    this._tickerFns.push({fn, ctx});
                } 
            };
        }
        async init(config) { this.config = config; return this; }
        destroy() {}
        simulateFrame() {
            if (this._tickerFns) {
                this._tickerFns.forEach(({fn, ctx}) => fn.call(ctx, { deltaTime: 1 }));
            }
        }
    },
    Container: class {
        constructor() {
            this.children = [];
            this.x = 0;
            this.y = 0;
            this.scale = { x: 1, y: 1, set: (s) => { this.scale.x = s; this.scale.y = s; } };
            this.interactive = false;
        }
        addChild(child) { 
            this.children.push(child); 
            child.parent = this;
        }
        removeChild(child) {
            const idx = this.children.indexOf(child);
            if (idx >= 0) this.children.splice(idx, 1);
        }
        on() {} // Mock event listener
    },
    Graphics: class {
        constructor() {
            this.parent = null;
            this.x = 0;
            this.y = 0;
        }
        beginFill() { return this; }
        endFill() { return this; }
        lineStyle() { return this; }
        drawCircle() { return this; }
        drawRoundedRect() { return this; }
        clear() { return this; }
        addChild(child) { child.parent = this; }
    },
    Text: class {
        constructor(text, style) {
            this.text = text;
            this.style = style || {};
            this.x = 0;
            this.y = 0;
            this.parent = null;
        }
    },
    filters: {
        GlowFilter: class {}
    }
};

// Load the class
const fs = require('fs');
const path = require('path');

// Mock a browser environment where scripts just run and define globals
const swarmCanvasCode = fs.readFileSync(path.join(__dirname, '../js/swarm/SwarmCanvas.js'), 'utf8');
const SwarmCanvas = (function() {
    let window = {};
    eval(swarmCanvasCode);
    return window.SwarmCanvas;
})();
global.SwarmCanvas = SwarmCanvas;

const testCode = fs.readFileSync(path.join(__dirname, 'test_swarm_canvas.js'), 'utf8');
const SwarmCanvasTests = (function() {
    let window = {};
    eval(testCode);
    return window.SwarmCanvasTests;
})();
global.SwarmCanvasTests = SwarmCanvasTests;

async function runTests() {
    const tests = new SwarmCanvasTests();
    const success = await tests.execute();
    process.exit(success ? 0 : 1);
}

runTests();
