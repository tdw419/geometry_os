// systems/visual_shell/web/tests/test_neural_city_renderer.js

/**
 * Unit Tests for NeuralCityRenderer
 *
 * Run with: node --test systems/visual_shell/web/tests/test_neural_city_renderer.js
 */

const assert = require('node:assert');
const test = require('node:test');

// Mock window for Node.js environment
global.window = {};

// Load the class under test
const { NeuralCityRenderer } = require('../NeuralCityRenderer.js');

test('NeuralCityRenderer - constructor with default config', () => {
    const mockApp = {
        renderer: {
            type: 'webgpu',
            device: { createBindGroupLayout: () => ({}) },
            createBindGroup: () => ({})
        },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    assert.strictEqual(renderer.config.districtSize, 512);
    assert.strictEqual(renderer.config.maxCacheSize, 64);
    assert.strictEqual(renderer.config.atlasPath, '/systems/neural_city/atlases/low_res_overview.rts.png');
});

test('NeuralCityRenderer - constructor with custom atlas path', () => {
    const mockApp = {
        renderer: {
            type: 'webgpu',
            device: { createBindGroupLayout: () => ({}) },
            createBindGroup: () => ({})
        },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({
        app: mockApp,
        atlasPath: '/custom/path/atlas.png'
    });

    assert.strictEqual(renderer.config.atlasPath, '/custom/path/atlas.png');
});

test('NeuralCityRenderer - pixelToDistrict converts coordinates', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const district = renderer.pixelToDistrict(1000, 2000);
    assert.deepStrictEqual(district, { x: 1, y: 3 });
});

test('NeuralCityRenderer - districtToPixel converts coordinates', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const pixel = renderer.districtToPixel(2, 4);
    assert.deepStrictEqual(pixel, { x: 1024, y: 2048 });
});

test('NeuralCityRenderer - getDistrictId generates correct ID', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const id = renderer.getDistrictId(3, 7);
    assert.strictEqual(id, '3_7');
});

test('NeuralCityRenderer - getStats returns expected properties', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const stats = renderer.getStats();
    assert.ok('loaded' in stats);
    assert.ok('total' in stats);
    assert.ok('vramMB' in stats);
    assert.ok('focusMaterial' in stats);
});

test('NeuralCityRenderer - calculateVRAM returns number', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    const vram = renderer.calculateVRAM();
    assert.strictEqual(typeof vram, 'number');
});

test('NeuralCityRenderer - loadMetadata loads district data', async () => {
    global.fetch = (url) => {
        if (url.includes('district_metadata.json')) {
            return Promise.resolve({
                ok: true,
                json: () => Promise.resolve([
                    { x: 0, y: 0, dominant_q: 0.1, max_mag: 0.9, entropy: 0.3 },
                    { x: 1, y: 0, dominant_q: 0.3, max_mag: 0.7, entropy: 0.5 }
                ])
            });
        }
        return Promise.resolve({ ok: false });
    };

    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    await renderer.loadMetadata();

    assert.strictEqual(renderer.totalDistricts, 2);
    assert.strictEqual(renderer.stats.total, 2);
});

test('NeuralCityRenderer - loadMetadata handles fetch failure', async () => {
    global.fetch = () => Promise.resolve({ ok: false });

    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    await renderer.loadMetadata();

    assert.strictEqual(renderer.totalDistricts, 0);
    assert.deepStrictEqual(renderer.districtMetadata, []);
});

test('NeuralCityRenderer - destroy clears resources', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.atlasCache.set('0_0', { texture: {}, lastUsed: Date.now() });
    renderer.destroy();

    assert.strictEqual(renderer.container, null);
    assert.strictEqual(renderer.atlasCache.size, 0);
});
