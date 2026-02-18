/**
 * Geometry OS: Morphological Workbench (Geometric IDE)
 * 
 * A UI component for authoring GeoScript (V1) directly on the infinite map.
 * This component provides "painting" tools that generate executable pixels
 * backed by the GPUExecutionSystem.
 */

class MorphologicalWorkbench {
    constructor(app, gpuSystem, dictionary) {
        this.app = app;
        this.gpuSystem = gpuSystem;
        this.dictionary = dictionary;

        this.container = new PIXI.Container();
        this.container.isRenderGroup = true;
        this.container.visible = false;

        this.brushSize = 1;
        this.currentBrush = 'SYSTEM_INIT'; // Default brush

        // Brushes mapped to GeoScript Spec V1.0
        this.brushes = {
            'SYSTEM_INIT': { r: 255, g: 0, b: 0, a: 255, label: 'Init' },
            'HALT': { r: 136, g: 0, b: 0, a: 255, label: 'Halt' },
            'ADD': { r: 0, g: 1, b: 255, a: 255, label: 'Add' },
            'PRINT': { r: 0, g: 255, b: 0, a: 255, label: 'Print' },
            'BRANCH': { r: 255, g: 0, b: 255, a: 255, label: 'Branch' },
            'MEMORY': { r: 0, g: 255, b: 255, a: 255, label: 'Memory' },
            'ERASER': { r: 0, g: 0, b: 0, a: 0, label: 'Eraser' }
        };

        this.canvasSize = 64; // Small 64x64 logic grid for the POC
        this.pixelData = new Uint8Array(this.canvasSize * this.canvasSize * 4);

        this.texture = PIXI.Texture.fromBuffer(
            this.pixelData,
            this.canvasSize,
            this.canvasSize,
            { format: 'rgba8unorm', scaleMode: 'nearest' }
        );

        this.sprite = new PIXI.Sprite(this.texture);
        this.sprite.interactive = true;
        this.sprite.on('pointerdown', (e) => this._onPaint(e));
        this.sprite.on('pointermove', (e) => {
            if (e.buttons === 1) this._onPaint(e);
        });

        this._setupUI();
        this.container.addChild(this.sprite);

        console.log('✨ Morphological Workbench initialized');
    }

    /**
     * Set up the IDE overlay/controls
     * @private
     */
    _setupUI() {
        const ui = new PIXI.Container();
        ui.y = -40; // Above the canvas

        let xOffset = 0;
        for (const [key, brush] of Object.entries(this.brushes)) {
            const btn = new PIXI.Graphics();
            btn.beginFill(this._rgbToHex(brush.r, brush.g, brush.b));
            btn.drawRoundedRect(0, 0, 30, 30, 4);
            btn.endFill();
            btn.x = xOffset;
            btn.interactive = true;
            btn.on('pointerdown', () => {
                this.currentBrush = key;
                console.log(`🖌️ Selected Brush: ${key}`);
            });

            const label = new PIXI.Text(brush.label, { fontSize: 8, fill: 0xffffff });
            label.y = 35;
            btn.addChild(label);

            ui.addChild(btn);
            xOffset += 40;
        }

        const runBtn = new PIXI.Text('▶ RUN', { fontSize: 14, fill: 0x00ff00, fontWeight: 'bold' });
        runBtn.x = xOffset + 10;
        runBtn.interactive = true;
        runBtn.on('pointerdown', () => this.execute());
        ui.addChild(runBtn);

        this.container.addChild(ui);
    }

    _onPaint(e) {
        const localPos = e.getLocalPosition(this.sprite);
        const x = Math.floor(localPos.x);
        const y = Math.floor(localPos.y);

        if (x < 0 || x >= this.canvasSize || y < 0 || y >= this.canvasSize) return;

        const brush = this.brushes[this.currentBrush];
        const idx = (y * this.canvasSize + x) * 4;

        this.pixelData[idx] = brush.r;
        this.pixelData[idx + 1] = brush.g;
        this.pixelData[idx + 2] = brush.b;
        this.pixelData[idx + 3] = brush.a;

        this.texture.update();
    }

    async execute() {
        console.log('⚡ Morphological Workbench: Preparing GPU Execution...');

        // 1. Upload the "Painted" texture to the GPU System
        const kernelId = `workbench_${Date.now()}`;

        // This is a bridge: convert local canvas to a WebGPU texture source
        // Ideally, the workbench works directly in a shared GPU texture
        const base64 = this._canvasToBase64();
        await this.gpuSystem.deploy(base64, kernelId);

        console.log(`🚀 Kernel ${kernelId} deployed. Executing...`);
        await this.gpuSystem.tick(kernelId, 100);

        const state = await this.gpuSystem.readState(kernelId);
        console.log(`📊 Result Registers:`, state.registers);
    }

    _canvasToBase64() {
        // Simple conversion for the POC bridge
        const canvas = document.createElement('canvas');
        canvas.width = this.canvasSize;
        canvas.height = this.canvasSize;
        const ctx = canvas.getContext('2d');
        const imgData = ctx.createImageData(this.canvasSize, this.canvasSize);
        imgData.data.set(this.pixelData);
        ctx.putImageData(imgData, 0, 0);
        return canvas.toDataURL();
    }

    _rgbToHex(r, g, b) {
        return (r << 16) | (g << 8) | b;
    }

    show(x = 100, y = 100) {
        this.container.x = x;
        this.container.y = y;
        this.container.visible = true;
    }

    hide() {
        this.container.visible = false;
    }
}

if (typeof window !== 'undefined') {
    window.MorphologicalWorkbench = MorphologicalWorkbench;
}
