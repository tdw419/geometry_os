/**
 * Visual Shell WASM Module - JavaScript Wrapper
 *
 * Provides a high-level API for the WASM rendering.
 * Integrates with PixiJS for display.
 */

// Guild types matching Rust/WASM
const Guild = {
    ATTENTION: 0,
    MEMORY: 1,
    LOGIC: 2,
    SUBSTRATE: 3,
    INTENT: 4
};

// Citizen states matching Rust/WASM
const CitizenState = {
    DORMANT: 0,
    ACTIVE: 1,
    TRADING: 2,
    MIGRATING: 3,
    REPRODUCING: 4,
    DECLINING: 5,
    DEAD: 6
};

/**
 * High-performance Visual Shell renderer.
 * Uses WASM when available.
 */
class VisualShellRenderer {
    constructor(width, height, tileSize = 64, useWasm = true) {
        this.width = width;
        this.height = height;
        this.tileSize = tileSize;
        this.wasm = null;
        this.useWasm = useWasm;
        this.ready = false;

        // Fallback JS implementation
        this.tiles = new Map();
        this.viewport = { x: 0, y: 0, zoom: 1.0 };
        this.frameCount = 0;
        this.lastFrameTime = 0;
        this.fps = 0;

        // Neural City bridge
        this.citizens = new Map();
    }

    /**
     * Initialize WASM module
     */
    async initWasm() {
        if (!this.useWasm) {
            this.ready = true;
            return false;
        }

        try {
            const wasmModule = await import('./pkg/visual_shell_wasm.js');
            await wasmModule.default();
            this.wasm = new wasmModule.InfiniteMapRenderer(
                this.width,
                this.height,
                this.tileSize
            );
            this.ready = true;
            console.log('Visual Shell WASM initialized');
            return true;
        } catch (err) {
            console.warn('WASM not available, using JS fallback:', err.message);
            this.ready = true;
            return false;
        }
    }

    /**
     * Set a tile
     */
    setTile(x, y, tileType, data) {
        if (this.wasm) {
            this.wasm.set_tile(x, y, tileType, data);
        } else {
            const key = `${x},${y}`;
            this.tiles.set(key, { x, y, tileType, data: new Uint8Array(data) });
        }
    }

    /**
     * Remove a tile
     */
    removeTile(x, y) {
        if (this.wasm) {
            this.wasm.remove_tile(x, y);
        } else {
            this.tiles.delete(`${x},${y}`);
        }
    }

    /**
     * Get tile count
     */
    tileCount() {
        if (this.wasm) {
            return this.wasm.tile_count();
        }
        return this.tiles.size;
    }

    /**
     * Pan the viewport
     */
    pan(dx, dy) {
        if (this.wasm) {
            this.wasm.pan(dx, dy);
        } else {
            this.viewport.x += dx / this.viewport.zoom;
            this.viewport.y += dy / this.viewport.zoom;
        }
    }

    /**
     * Zoom the viewport
     */
    zoom(factor, centerX, centerY) {
        if (this.wasm) {
            this.wasm.zoom(factor, centerX, centerY);
        } else {
            const oldZoom = this.viewport.zoom;
            this.viewport.zoom = Math.max(0.1, Math.min(10, this.viewport.zoom * factor));

            // Zoom towards center
            const ratio = this.viewport.zoom / oldZoom;
            this.viewport.x = centerX - (centerX - this.viewport.x) * ratio;
            this.viewport.y = centerY - (centerY - this.viewport.y) * ratio;
        }
    }

    /**
     * Get visible tile coordinates
     */
    getVisibleTileCoords() {
        if (this.wasm) {
            const coords = this.wasm.get_visible_tile_coords();
            const result = [];
            for (let i = 0; i < coords.length; i += 2) {
                result.push({ x: coords[i], y: coords[i + 1] });
            }
            return result;
        }

        // JS fallback
        const halfW = this.width / this.viewport.zoom / 2;
        const halfH = this.height / this.viewport.zoom / 2;

        const minX = Math.floor((this.viewport.x - halfW) / this.tileSize) - 1;
        const maxX = Math.floor((this.viewport.x + halfW) / this.tileSize) + 1;
        const minY = Math.floor((this.viewport.y - halfH) / this.tileSize) - 1;
        const maxY = Math.floor((this.viewport.y + halfH) / this.tileSize) + 1;

        const result = [];
        for (let y = minY; y <= maxY; y++) {
            for (let x = minX; x <= maxX; x++) {
                result.push({ x, y });
            }
        }
        return result;
    }

    /**
     * Process one frame
     */
    tick(timestamp) {
        if (this.wasm) {
            return this.wasm.tick(timestamp);
        }

        // JS fallback
        if (this.lastFrameTime > 0) {
            const delta = timestamp - this.lastFrameTime;
            if (delta > 0) {
                const instantFps = 1000 / delta;
                this.fps = this.fps * 0.9 + instantFps * 0.1;
            }
        }
        this.lastFrameTime = timestamp;
        this.frameCount++;

        return {
            frame: this.frameCount,
            fps: this.fps,
            visible_tiles: this.getVisibleTileCoords().length,
            total_tiles: this.tiles.size
        };
    }

    /**
     * Get viewport state
     */
    getViewport() {
        if (this.wasm) {
            return JSON.parse(this.wasm.get_viewport_json());
        }
        return {
            x: this.viewport.x,
            y: this.viewport.y,
            zoom: this.viewport.zoom,
            width: this.width,
            height: this.height
        };
    }

    // Neural City Integration

    addCitizen(id, x, y, guild, energy, state) {
        this.citizens.set(id, { id, x, y, guild, energy, state });
    }

    updateCitizen(id, x, y, energy, state) {
        const citizen = this.citizens.get(id);
        if (citizen) {
            citizen.x = x;
            citizen.y = y;
            citizen.energy = energy;
            citizen.state = state;
        }
    }

    removeCitizen(id) {
        this.citizens.delete(id);
    }

    getCitizens() {
        return Array.from(this.citizens.values());
    }
}

// Export for different module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VisualShellRenderer, Guild, CitizenState };
}

if (typeof window !== 'undefined') {
    window.VisualShellRenderer = VisualShellRenderer;
    window.VisualShellGuild = Guild;
    window.VisualShellCitizenState = CitizenState;
}

export { VisualShellRenderer, Guild, CitizenState };
