
const assert = require('assert');

// Mock PIXI
global.PIXI = {
    Container: class {
        constructor() { this.children = []; }
        addChild(c) { this.children.push(c); }
        removeChild(c) { this.children = this.children.filter(child => child !== c); }
    },
    Sprite: class {
        constructor(texture) {
            this.texture = texture;
            this.x = 0;
            this.y = 0;
            this.width = 0;
            this.height = 0;
            this.events = {};
        }
        on(event, fn) { this.events[event] = fn; }
        destroy() { }
    },
    Texture: {
        from: (canvas) => ({ canvas })
    }
};

// Mock Browser Environment
global.document = {
    createElement: (tag) => {
        if (tag === 'canvas') {
            return {
                getContext: () => ({
                    putImageData: () => { }
                })
            };
        }
    }
};
global.ImageData = class { };
global.Uint8ClampedArray = Uint8Array;

const ThinkingField = require('./ThinkingField.js');

function testThinkingField() {
    console.log('Testing ThinkingField...');

    // 1. Instantiation
    const parent = new PIXI.Container();
    const field = new ThinkingField(parent);

    assert(field.thoughts instanceof Map);
    assert.strictEqual(parent.children.length, 1);
    console.log('✓ Instantiation passed');

    // 2. Render Thought (Flat Array)
    const pixelData = new Array(32 * 32 * 4).fill(255);
    const thought1 = {
        thought_id: 't1',
        pixel_data: pixelData,
        x: 100,
        y: 200,
        label: 'Test'
    };

    field.renderThought(thought1);

    assert(field.thoughts.has('t1'));
    assert.strictEqual(field.container.children.length, 1);
    const sprite = field.thoughts.get('t1').sprite;
    assert.strictEqual(sprite.x, 100);
    assert.strictEqual(sprite.y, 200);
    console.log('✓ Render single thought passed');

    // 3. Update Existing Thought
    const thought1_update = { ...thought1, x: 150 };
    field.renderThought(thought1_update);
    assert.strictEqual(field.thoughts.get('t1').sprite.x, 150);
    assert.strictEqual(field.container.children.length, 1); // Should invoke remove then add
    console.log('✓ Update thought passed');

    // 4. Clear
    field.clear();
    assert.strictEqual(field.thoughts.size, 0);
    assert.strictEqual(field.container.children.length, 0);
    console.log('✓ Clear passed');

    console.log('All ThinkingField tests passed!');
}

try {
    testThinkingField();
} catch (e) {
    console.error('Test Failed:', e);
    process.exit(1);
}
