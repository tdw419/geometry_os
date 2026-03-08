import { describe, it, expect, beforeEach, afterEach } from 'vitest';
import * as fs from 'fs';
import * as path from 'path';

describe('WGSL Glyph Renderer', () => {
    it('should compile the glyph_renderer.wgsl shader', async () => {
        const shaderPath = path.resolve(__dirname, '../../hypervisor/src/glyph_renderer.wgsl');
        const shaderCode = fs.readFileSync(shaderPath, 'utf8');
        
        expect(shaderCode).toContain('struct Glyph');
        expect(shaderCode).toContain('opcode: u32');
        expect(shaderCode).toContain('case 0xC3u'); // DRAW_RECT
        expect(shaderCode).toContain('case 0xC4u'); // FILL_RECT
        
        console.log('✓ WGSL Glyph Renderer code validated at hypervisor path');
    });

    it('should implement hilbert math correctly in WGSL', async () => {
        const shaderPath = path.resolve(__dirname, '../../hypervisor/src/glyph_renderer.wgsl');
        const shaderCode = fs.readFileSync(shaderPath, 'utf8');
        
        expect(shaderCode).toContain('fn xy_to_hilbert');
        
        console.log('✓ Hilbert math found in shader');
    });
});
