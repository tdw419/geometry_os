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

// Load the filter class
const { NeuralCityFilter } = require('../NeuralCityFilter.js');

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

test('NeuralCityRenderer - applyFilter creates filter', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Mock sprite
    renderer.lowResSprite = { filters: null, texture: {} };
    renderer.applyFilter();

    assert.ok(renderer.filter);
    assert.ok(Array.isArray(renderer.lowResSprite.filters));
    assert.strictEqual(renderer.lowResSprite.filters.length, 1);
});

test('NeuralCityRenderer - applyFilter warns when sprite not loaded', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    let warningLogged = false;
    const originalWarn = console.warn;
    console.warn = (msg) => {
        if (msg.includes('Cannot apply filter')) {
            warningLogged = true;
        }
    };

    renderer.applyFilter();

    console.warn = originalWarn;
    assert.ok(warningLogged);
});

test('NeuralCityRenderer - tick updates filter time', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.filter = {
        uniforms: { uTime: 0 },
        updateTime: (t) => { renderer.filter.uniforms.uTime = t; }
    };

    renderer.tick(0.016);
    assert.strictEqual(renderer.filter.uniforms.uTime, 0.016);
});

test('NeuralCityRenderer - tick does nothing when no filter', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Should not throw
    assert.doesNotThrow(() => renderer.tick(0.016));
});

test('NeuralCityRenderer - setFocus updates district', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    // Use the format that setFocus expects: districtMetadata.districts with id property
    renderer.districtMetadata = {
        districts: [
            { id: '1_3', dominant_q: 0.1, max_mag: 0.9, entropy: 0.3 }
        ]
    };
    renderer.filter = { setFocusDistrict: () => {} };

    await renderer.setFocus(1000, 2000);

    assert.deepStrictEqual(renderer.focusDistrict, { x: 1, y: 3 });
    assert.strictEqual(renderer.stats.focusMaterial, 0.1);
});

test('NeuralCityRenderer - setFocus detects Steel material', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.districtMetadata = {
        districts: [
            { id: '0_0', dominant_q: 0.3, max_mag: 0.7, entropy: 0.5 }
        ]
    };
    renderer.filter = { setFocusDistrict: () => {} };

    await renderer.setFocus(100, 100);

    assert.strictEqual(renderer.stats.focusMaterial, 0.3);
});

test('NeuralCityRenderer - setFocus detects Rust material', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.districtMetadata = {
        districts: [
            { id: '0_0', dominant_q: 0.6, max_mag: 0.5, entropy: 0.7 }
        ]
    };
    renderer.filter = { setFocusDistrict: () => {} };

    await renderer.setFocus(100, 100);

    assert.strictEqual(renderer.stats.focusMaterial, 0.6);
});

test('NeuralCityRenderer - setFocus detects Dust material', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.districtMetadata = {
        districts: [
            { id: '0_0', dominant_q: 0.8, max_mag: 0.2, entropy: 0.9 }
        ]
    };
    renderer.filter = { setFocusDistrict: () => {} };

    await renderer.setFocus(100, 100);

    assert.strictEqual(renderer.stats.focusMaterial, 0.8);
});

test('NeuralCityRenderer - setFocus handles missing metadata', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    renderer.districtMetadata = [];
    renderer.filter = { setFocusDistrict: () => {} };

    // Should not throw
    await assert.doesNotReject(async () => renderer.setFocus(100, 100));
});

test('NeuralCityRenderer - resize updates filter resolution', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });
    let capturedRes = null;
    renderer.filter = { setResolution: (w, h) => { capturedRes = [w, h]; } };

    renderer.resize(1920, 1080);

    assert.deepStrictEqual(capturedRes, [1920, 1080]);
});

test('NeuralCityRenderer - resize does nothing when no filter', () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Should not throw
    assert.doesNotThrow(() => renderer.resize(1920, 1080));
});

test('NeuralCityRenderer - loadDistrict caches tile', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp, maxCacheSize: 3 });

    // Mock extractTile to return a fake texture
    renderer.extractTile = async () => ({ mocked: 'texture' });

    const tile = await renderer.loadDistrict(1, 2);

    assert.ok(tile);
    assert.ok(renderer.atlasCache.has('1_2'));
    assert.strictEqual(renderer.stats.loaded, 1);
});

test('NeuralCityRenderer - LRU eviction when cache full', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp, maxCacheSize: 3 });

    // Mock extractTile to return a fake texture
    renderer.extractTile = async () => ({ mocked: 'texture' });

    await renderer.loadDistrict(0, 0);
    await renderer.loadDistrict(1, 0);
    await renderer.loadDistrict(2, 0);
    await renderer.loadDistrict(3, 0); // Should evict 0_0

    assert.strictEqual(renderer.atlasCache.size, 3);
    assert.ok(!renderer.atlasCache.has('0_0'));
    assert.ok(renderer.atlasCache.has('3_0'));
});

test('NeuralCityRenderer - getHiResTexture returns cached tile', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Mock extractTile to return a fake texture
    renderer.extractTile = async () => ({ mocked: 'texture' });

    await renderer.loadDistrict(2, 3);
    renderer.focusDistrict = { x: 2, y: 3 };

    const texture = renderer.getHiResTexture();
    assert.ok(texture);
});

test('NeuralCityRenderer - calculateVRAM tracks usage', async () => {
    const mockApp = {
        renderer: { type: 'webgpu' },
        stage: { addChild: () => {} },
        screen: { width: 1920, height: 1080 }
    };

    const renderer = new NeuralCityRenderer({ app: mockApp });

    // Mock extractTile to return a fake texture
    renderer.extractTile = async () => ({ mocked: 'texture' });

    await renderer.loadDistrict(0, 0);
    const vram = renderer.calculateVRAM();

    assert.ok(vram > 0);
    assert.strictEqual(renderer.stats.vramMB, vram);
});
