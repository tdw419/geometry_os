/**
 * Geometry OS: GeoScript Transpiler (Text -> Pixel)
 * 
 * Phase 27: The Morphological Bridge
 * 
 * Converts symbolic GeoScript text into the morphological substrate
 * of pixels and semantic tokens.
 * 
 * @module geoscript_transpiler
 */

class GeoScriptTranspiler {
    constructor(dictionary) {
        this.dictionary = dictionary;
        this.variables = new Map(); // name -> {x, y}
        this.brushes = {
            // RED: Foundation
            'SYSTEM_INIT': 0xFF0000,
            'CRIMSON': 0xDC143C,
            'STACK_FRAME': 0xDC143C,
            'MAROON': 0x800000,
            'MEMORY_BLOCK': 0x800000,
            // GREEN: I/O
            'LIME_GREEN': 0x32CD32,
            'FOREST_GREEN': 0x228B22,
            'SEA_GREEN': 0x2E8B57,
            // BLUE: Computation
            'AZURE': 0x007FFF,
            'DEEP_SKY_BLUE': 0x00BFFF,
            'DODGER_BLUE': 0x1E90FF,
            'ROYAL_BLUE': 0x4169E1,
            // PURPLE: Logic
            'INDIGO': 0x4B0082,
            'PURPLE': 0x800080,
            'MAGENTA': 0xFF00FF,
            'VIOLET': 0xEE82EE,
            'BLACK': 0x000000
        };
    }

    /**
     * Transpile GeoScript text to a pixel map
     * @param {string} text - GeoScript source code
     * @returns {Object} { pixels, width, height }
     */
    transpile(text) {
        console.log('🚀 Transpiling GeoScript...');
        const lines = text.split('\n');
        const pixels = new Map();
        let maxX = 0;
        let maxY = 0;

        for (let line of lines) {
            line = line.trim();
            if (!line || line.startsWith('#')) continue;

            // Simple parser for spec commands
            const assignMatch = line.match(/assign\((\d+),\s*(\d+),\s*(\w+)\)/);
            const paintMatch = line.match(/paint\((\d+),\s*(\d+),\s*(\w+)\)/);
            const regionMatch = line.match(/region\((\d+),\s*(\d+),\s*(\d+),\s*(\d+)\)/);

            if (assignMatch) {
                const [_, x, y, name] = assignMatch;
                this.variables.set(name, { x: parseInt(x), y: parseInt(y) });
                console.log(`📍 Assigned variable ${name} to (${x}, ${y})`);
            } else if (paintMatch) {
                const [_, x, y, colorName] = paintMatch;
                const px = parseInt(x);
                const py = parseInt(y);
                const color = this.brushes[colorName] || 0xFFFFFF;

                pixels.set(`${px},${py}`, { x: px, y: py, color });
                maxX = Math.max(maxX, px);
                maxY = Math.max(maxY, py);
            }
            // More complex patterns (region, loop) would go here
        }

        console.log(`✅ Transpilation complete: ${pixels.size} pixels generated.`);
        return {
            pixels,
            width: maxX + 1,
            height: maxY + 1
        };
    }

    /**
     * Convert transpiled pixels to a Data URL PNG
     */
    pixelsToPNG(transpiled) {
        const canvas = document.createElement('canvas');
        canvas.width = Math.max(transpiled.width, 64);
        canvas.height = Math.max(transpiled.height, 64);
        const ctx = canvas.getContext('2d');
        const imgData = ctx.createImageData(canvas.width, canvas.height);

        for (const [key, p] of transpiled.pixels) {
            const idx = (p.y * canvas.width + p.x) * 4;
            const r = (p.color >> 16) & 0xFF;
            const g = (p.color >> 8) & 0xFF;
            const b = p.color & 0xFF;
            imgData.data[idx] = r;
            imgData.data[idx + 1] = g;
            imgData.data[idx + 2] = b;
            imgData.data[idx + 3] = 255;
        }

        ctx.putImageData(imgData, 0, 0);
        return canvas.toDataURL();
    }
}

if (typeof window !== 'undefined') {
    window.GeoScriptTranspiler = GeoScriptTranspiler;
}
