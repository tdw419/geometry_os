/**
 * Geometry OS: WebGPU Semantic Expansion Demo
 * 
 * Demonstrates GPU-accelerated code expansion from semantic pixels.
 */

async function runWebGPUExpansionDemo() {
    console.log('🚀 Starting WebGPU Semantic Expansion Demo...');

    // 1. Initialize WebGPU
    if (!navigator.gpu) {
        console.error('❌ WebGPU not supported in this browser.');
        return;
    }

    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    console.log('✅ WebGPU Device Initialized');

    // 2. Load Geometric Dictionary
    const dictionary = new GeometricDictionary({ cacheVRAM: true });
    const dictResult = await dictionary.loadFromManifest('geometric_codebook.json');
    if (!dictResult.success) {
        // Create a mock codebook if file doesn't exist
        console.log('⚠️  Codebook not found, creating mock dictionary...');
        dictionary.tokens.set(0x000001, new SemanticToken({
            token_id: 0x000001,
            name: 'Init_Sequence',
            code_bytes: '130101001302020033030201' // 3 instructions
        }));
        dictionary.isLoaded = true;
    }

    // 3. Initialize Semantic Manager
    const manager = new WebGPUSemanticManager(device, dictionary);
    await manager.initialize();

    // 4. Create a Mock Semantic Texture (16x16)
    // Pixel (0,0) will be TokenID 0x000001
    const width = 16;
    const height = 16;
    const texture = device.createTexture({
        size: [width, height],
        format: 'rgba8unorm',
        usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST
    });

    const pixelData = new Uint8Array(width * height * 4);
    // Set first pixel to TokenID 1 (R=0, G=0, B=1)
    pixelData[0] = 0;
    pixelData[1] = 0;
    pixelData[2] = 1;
    pixelData[3] = 255;

    device.queue.writeTexture(
        { texture },
        pixelData,
        { bytesPerRow: width * 4 },
        { width, height }
    );
    console.log('🎨 Mock semantic texture created');

    // 5. RUN EXPANSION
    console.log('⚡ Running GPU expansion pass...');
    const resultBuffer = await manager.expand(texture);
    console.log('✅ Expansion kernel finished execution');

    // 6. Read back first few instructions for verification
    const stagingBuffer = device.createBuffer({
        size: 1024,
        usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
    });

    const commandEncoder = device.createCommandEncoder();
    commandEncoder.copyBufferToBuffer(resultBuffer, 0, stagingBuffer, 0, 1024);
    device.queue.submit([commandEncoder.finish()]);

    await stagingBuffer.mapAsync(GPUMapMode.READ);
    const expandedCode = new Uint32Array(stagingBuffer.getMappedRange());

    console.log('🔍 Verification (First 4 instructions):');
    for (let i = 0; i < 4; i++) {
        console.log(`  [${i}] 0x${expandedCode[i].toString(16).padStart(8, '0')}`);
    }

    if (expandedCode[0] === 0x00010113) { // addi x1, x2, 0 (or similar depending on hex)
        console.log('✨ SUCCESS! Semantic expansion verified on GPU substrate.');
    }

    stagingBuffer.unmap();
}

if (typeof window !== 'undefined') {
    window.runWebGPUExpansionDemo = runWebGPUExpansionDemo;
}
