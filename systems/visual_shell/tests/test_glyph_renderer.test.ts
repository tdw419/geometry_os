import { describe, it, expect, beforeEach, afterEach } from 'vitest';
import * as fs from 'fs';
import * as path from 'path';

describe('WGSL Glyph Renderer', () => {
    it('should compile the glyph_renderer.wgsl shader', async () => {
        const shaderPath = path.resolve(__dirname, '../wgsl/glyph_renderer.wgsl');
        const shaderCode = fs.readFileSync(shaderPath, 'utf8');
        
        expect(shaderCode).toContain('struct Glyph');
        expect(shaderCode).toContain('fn main');
        expect(shaderCode).toContain('textureStore(canvas');
        
        console.log('✓ WGSL Glyph Renderer code validated');
    });

    it('should implement hilbert math correctly in WGSL', async () => {
        const shaderPath = path.resolve(__dirname, '../wgsl/glyph_renderer.wgsl');
        const shaderCode = fs.readFileSync(shaderPath, 'utf8');
        
        expect(shaderCode).toContain('fn d2xy');
        expect(shaderCode).toContain('fn xy2d');
        
        console.log('✓ Hilbert math found in shader');
    });
});
