/**
 * Living Tile Executor - Phase 42: Micro-Compiler Bridge
 * 
 * Enables "Living Tiles" - tiles that contain executable code which is
 * dynamically injected into the running PixiJS Visual Shell.
 * 
 * This bridges the gap between:
 * - The Substrate (.rts.png storage)
 * - The Consciousness (PixiJS reactive UI)
 * 
 * Usage:
 * 1. Create a tile with PixelRTS metadata containing JavaScript code
 * 2. Place it on the Infinite Map
 * 3. The executor detects it and "wakes up" the tile
 * 4. The tile's script runs within the PixiJS context
 */

class LivingTileExecutor {
    constructor(infiniteMap, pixiApp) {
        this.map = infiniteMap;
        this.app = pixiApp;
        this.activeTiles = new Map(); // tileKey -> { script, container, cleanup }
        this.watchedTiles = new Set();
        
        // Configuration
        this.config = {
            checkInterval: 1000, // Check for new tiles every second
            enableAutoWake: true, // Automatically execute tiles with scripts
            sandboxMode: false, // If true, runs in isolated context
        };
        
        console.log('🧬 LivingTileExecutor: Phase 42 Micro-Compiler Bridge initialized');
    }
    
    /**
     * Start watching the map for living tiles
     */
    start() {
        console.log('👁️  LivingTileExecutor: Watching for living tiles...');
        this._scheduleScan();
    }
    
    /**
     * Scan the map for tiles with executable content
     */
    async scanForLivingTiles() {
        // Get all visible tiles from the map
        const visibleTiles = this.map.getVisibleTiles ? 
            this.map.getVisibleTiles() : 
            this._getTilesFromSpatialIndex();
        
        for (const tile of visibleTiles) {
            const tileKey = `${tile.x},${tile.y}`;
            
            // Skip already active tiles
            if (this.activeTiles.has(tileKey)) continue;
            
            // Check if tile has executable content
            const executable = await this._extractExecutableContent(tile);
            if (executable) {
                console.log(`🔮 Found living tile at ${tileKey}: ${executable.type}`);
                await this._wakeTile(tile, tileKey, executable);
            }
        }
    }
    
    /**
     * Extract executable content from a tile
     */
    async _extractExecutableContent(tile) {
        // Check PixelRTS metadata for executable content
        if (tile.metadata?.executable) {
            return {
                type: tile.metadata.executable.type || 'javascript',
                code: tile.metadata.executable.code,
                entryPoint: tile.metadata.executable.entryPoint || 'main',
                permissions: tile.metadata.executable.permissions || ['render']
            };
        }
        
        // Check for Hybrid DNA in the texture data
        if (tile.texture && tile.texture.source_code) {
            return {
                type: 'hybrid_dna',
                code: tile.texture.source_code,
                entryPoint: 'main',
                permissions: ['render', 'compute']
            };
        }
        
        // Check for special file extensions in tile name
        if (tile.name) {
            if (tile.name.endsWith('.js.tile')) {
                // Extract JS from tile data
                const code = await this._extractCodeFromTile(tile);
                return { type: 'javascript', code, entryPoint: 'main' };
            }
            if (tile.name.endsWith('.wgsl.tile')) {
                const code = await this._extractCodeFromTile(tile);
                return { type: 'wgsl', code, entryPoint: 'main' };
            }
        }
        
        return null;
    }
    
    /**
     * Extract code from tile's texture data
     */
    async _extractCodeFromTile(tile) {
        // If tile has a texture, we can read pixels from it
        if (tile.sprite && tile.sprite.texture) {
            // Use PixelExecutor to extract from texture
            const extractor = new PixelExecutor ? new PixelExecutor() : null;
            if (extractor) {
                const instructions = await extractor.extractFromTexture(tile.sprite.texture);
                // Convert instructions back to code (simplified)
                return this._instructionsToCode(instructions);
            }
        }
        
        // Fallback: return placeholder
        return '// Code extraction from tile texture';
    }
    
    /**
     * Wake up a living tile - execute its script
     */
    async _wakeTile(tile, tileKey, executable) {
        console.log(`🌟 Waking up tile ${tileKey}...`);
        
        try {
            let cleanup = null;
            
            switch (executable.type) {
                case 'javascript':
                    cleanup = await this._executeJavaScript(tile, executable);
                    break;
                case 'wgsl':
                    cleanup = await this._executeWGSL(tile, executable);
                    break;
                case 'hybrid_dna':
                    cleanup = await this._executeHybridDNA(tile, executable);
                    break;
                default:
                    console.warn(`Unknown executable type: ${executable.type}`);
                    return;
            }
            
            // Track the active tile
            this.activeTiles.set(tileKey, {
                tile,
                executable,
                cleanup,
                awakenedAt: Date.now()
            });
            
            // Visual feedback - tile glows when awake
            this._setTileAwake(tile, true);
            
        } catch (err) {
            console.error(`Failed to wake tile ${tileKey}:`, err);
            this._setTileError(tile, err.message);
        }
    }
    
    /**
     * Execute JavaScript in the PixiJS context
     */
    async _executeJavaScript(tile, executable) {
        const code = executable.code;
        const entryPoint = executable.entryPoint;
        
        // Create execution context
        const context = {
            // APIs available to the tile
            PIXI,
            app: this.app,
            map: this.map,
            tile: tile,
            container: new PIXI.Container(),
            
            // Utility functions
            log: (...args) => console.log(`[Tile ${tile.x},${tile.y}]`, ...args),
            createSprite: (texture) => new PIXI.Sprite(texture),
            createGraphics: () => new PIXI.Graphics(),
            createText: (text, style) => new PIXI.Text(text, style),
            
            // Tile can spawn children
            spawnChild: (x, y, type) => this._spawnChildTile(tile, x, y, type),
        };
        
        // Add tile's container to the world
        context.container.x = tile.x * this.map.config?.gridSize || tile.x;
        context.container.y = tile.y * this.map.config?.gridSize || tile.y;
        this.app.stage.addChild(context.container);
        
        // Execute the script
        const wrappedCode = `
            (async function(${Object.keys(context).join(', ')}) {
                ${code}
                if (typeof ${entryPoint} === 'function') {
                    return await ${entryPoint}();
                }
            })
        `;
        
        const fn = eval(wrappedCode);
        const result = await fn(...Object.values(context));
        
        console.log(`✅ JavaScript tile ${tile.x},${tile.y} executed successfully`, result);
        
        // Return cleanup function
        return () => {
            this.app.stage.removeChild(context.container);
            context.container.destroy({ children: true });
        };
    }
    
    /**
     * Execute WGSL shader
     */
    async _executeWGSL(tile, executable) {
        if (!navigator.gpu) {
            throw new Error('WebGPU not supported');
        }
        
        const adapter = await navigator.gpu.requestAdapter();
        const device = await adapter.requestDevice();
        
        // Create shader module
        const shaderModule = device.createShaderModule({
            code: executable.code,
            label: `Tile_${tile.x}_${tile.y}_Shader`
        });
        
        // Create compute pipeline (simplified)
        const pipeline = device.createComputePipeline({
            layout: 'auto',
            compute: {
                module: shaderModule,
                entryPoint: executable.entryPoint
            }
        });
        
        console.log(`✅ WGSL tile ${tile.x},${tile.y} compiled successfully`);
        
        // Return cleanup
        return () => {
            device.destroy();
        };
    }
    
    /**
     * Execute Hybrid DNA (decompress and run)
     */
    async _executeHybridDNA(tile, executable) {
        // Hybrid DNA contains source code that we can transpile
        console.log(`🧬 Executing Hybrid DNA tile ${tile.x},${tile.y}`);
        
        // For now, treat as JavaScript
        return this._executeJavaScript(tile, {
            ...executable,
            type: 'javascript'
        });
    }
    
    /**
     * Spawn a child tile from a parent
     */
    async _spawnChildTile(parentTile, offsetX, offsetY, type) {
        const childX = parentTile.x + offsetX;
        const childY = parentTile.y + offsetY;
        
        console.log(`🌱 Spawning child tile at ${childX},${childY} (type: ${type})`);
        
        // Request tile creation via the map's API
        if (this.map.createTile) {
            return await this.map.createTile(childX, childY, {
                type,
                parent: `${parentTile.x},${parentTile.y}`
            });
        }
        
        return null;
    }
    
    /**
     * Set visual state - tile is awake
     */
    _setTileAwake(tile, isAwake) {
        if (tile.sprite) {
            if (isAwake) {
                // Add glow effect
                const glow = new PIXI.Graphics();
                glow.beginFill(0x00FF00, 0.3);
                glow.drawCircle(0, 0, 60);
                glow.endFill();
                tile.sprite.addChild(glow);
                tile._awakeGlow = glow;
                
                // Pulse animation
                const ticker = () => {
                    if (glow) {
                        glow.alpha = 0.2 + Math.sin(Date.now() / 500) * 0.1;
                    }
                };
                this.app.ticker.add(ticker);
                tile._awakeTicker = ticker;
            } else {
                // Remove glow
                if (tile._awakeGlow) {
                    tile.sprite.removeChild(tile._awakeGlow);
                    tile._awakeGlow.destroy();
                }
                if (tile._awakeTicker) {
                    this.app.ticker.remove(tile._awakeTicker);
                }
            }
        }
    }
    
    /**
     * Set visual state - tile has error
     */
    _setTileError(tile, message) {
        if (tile.sprite) {
            const errorIndicator = new PIXI.Text('⚠️', {
                fontSize: 24,
                fill: 0xFF0000
            });
            errorIndicator.anchor.set(0.5);
            tile.sprite.addChild(errorIndicator);
        }
        console.error(`[Tile ${tile.x},${tile.y}] Error: ${message}`);
    }
    
    /**
     * Schedule periodic scan
     */
    _scheduleScan() {
        setInterval(() => {
            this.scanForLivingTiles();
        }, this.config.checkInterval);
    }
    
    /**
     * Get tiles from spatial index (fallback)
     */
    _getTilesFromSpatialIndex() {
        // Fallback implementation
        if (this.map.spatialIndex) {
            return this.map.spatialIndex.getAllItems ? 
                this.map.spatialIndex.getAllItems() : [];
        }
        return [];
    }
    
    /**
     * Convert CPU instructions back to code (placeholder)
     */
    _instructionsToCode(instructions) {
        // This would disassemble RISC-V instructions back to pseudocode
        return '// Disassembled from RISC-V bytecode\n' +
            instructions.map((inst, i) => `// PC ${i}: ${inst.toString(16)}`).join('\n');
    }
    
    /**
     * Stop all living tiles
     */
    stopAll() {
        console.log('🛑 Stopping all living tiles...');
        for (const [key, active] of this.activeTiles) {
            if (active.cleanup) {
                active.cleanup();
            }
            this._setTileAwake(active.tile, false);
        }
        this.activeTiles.clear();
    }
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LivingTileExecutor };
}

// Auto-initialize if global context available
if (typeof window !== 'undefined') {
    window.LivingTileExecutor = LivingTileExecutor;
    console.log('🧬 LivingTileExecutor registered globally');
}
