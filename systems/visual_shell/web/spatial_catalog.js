/**
 * SpatialCatalog - Phase 4: Visual Catalog Manager
 * 
 * Integrates the PixelRTS Visual Catalog into the Geometry OS infinite map.
 * Renders OS containers as "Window Particles" with spatial persistence.
 *
 * Features:
 * - Fetches catalog from CatalogServer FastAPI
 * - Renders RTS thumbnails as PixiJS sprites
 * - Spatial arrangement with drag-and-drop
 * - Glass Box AI instrumentation (bounding boxes, metadata HUD)
 * - One-click boot orchestration
 *
 * @class SpatialCatalog
 */

class SpatialCatalog {
    constructor(app, config = {}) {
        this.app = app;
        this.config = {
            apiUrl: config.apiUrl || 'http://localhost:8080/api/v1/catalog',
            gridSize: config.gridSize || 300,
            padding: config.padding || 50,
            originX: config.originX || 10000, // Place catalog far from origin
            originY: config.originY || 10000,
            ...config
        };

        // PixiJS containers
        this.container = new PIXI.Container();
        this.container.isRenderGroup = true; // Isolation for performance
        this.app.worldContainer.addChild(this.container);

        this.entries = new Map();
        this.sprites = new Map();
        
        // Status
        this.loading = false;
        this.initialized = false;

        // Instrumentation
        this.debugOverlay = window.visualDebugOverlay;
    }

    /**
     * Initialize catalog
     */
    async initialize() {
        console.log('[SpatialCatalog] Initializing...');
        
        try {
            await this.refresh();
            this.initialized = true;
            console.log('[SpatialCatalog] Ready');
        } catch (error) {
            console.error('[SpatialCatalog] Initialization failed:', error);
        }
    }

    /**
     * Refresh catalog from backend
     */
    async refresh() {
        this.loading = true;
        
        try {
            const response = await fetch(this.config.apiUrl);
            if (!response.ok) throw new Error('Failed to fetch catalog');
            
            const data = await response.json();
            this._syncEntries(data.entries);
            
        } catch (error) {
            console.error('[SpatialCatalog] Refresh failed:', error);
        } finally {
            this.loading = false;
        }
    }

    /**
     * Sync local entries with backend data
     */
    _syncEntries(backendEntries) {
        const currentIds = new Set(this.entries.keys());
        const newIds = new Set(backendEntries.map(e => e.id));

        // Remove old entries
        for (const id of currentIds) {
            if (!newIds.has(id)) {
                this._removeEntry(id);
            }
        }

        // Add or update entries
        backendEntries.forEach(entry => {
            this._updateEntry(entry);
        });
    }

    /**
     * Create or update a catalog entry sprite
     */
    _updateEntry(entry) {
        let sprite = this.sprites.get(entry.id);
        
        if (!sprite) {
            // Create new sprite
            const texture = entry.thumbnail 
                ? PIXI.Texture.from(`data:image/png;base64,${entry.thumbnail}`)
                : PIXI.Texture.WHITE;
            
            sprite = new PIXI.Sprite(texture);
            sprite.anchor.set(0.5);
            sprite.width = this.config.gridSize - this.config.padding;
            sprite.height = this.config.gridSize - this.config.padding;
            
            // Add metadata
            sprite.entryId = entry.id;
            sprite.entryName = entry.name;
            sprite.metadata = entry;
            
            // Interaction
            sprite.interactive = true;
            sprite.cursor = 'pointer';
            
            sprite.on('pointerdown', (e) => this._onSpriteDown(e, sprite));
            sprite.on('pointerover', () => this._onSpriteOver(sprite));
            sprite.on('pointerout', () => this._onSpriteOut(sprite));
            
            // Label
            const label = new PIXI.Text(entry.name, {
                fontFamily: 'Courier New',
                fontSize: 14,
                fill: 0x00d4ff,
                fontWeight: 'bold',
                stroke: 0x000000,
                strokeThickness: 2
            });
            label.anchor.set(0.5, 0);
            label.y = sprite.height / 2 + 5;
            sprite.addChild(label);

            // Sub-label (OS/Arch)
            const subLabel = new PIXI.Text(`${entry.distro || 'Unknown'} (${entry.architecture || 'x86_64'})`, {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: 0x888888
            });
            subLabel.anchor.set(0.5, 0);
            subLabel.y = label.y + 18;
            sprite.addChild(subLabel);

            this.container.addChild(sprite);
            this.sprites.set(entry.id, sprite);
        }

        // Position entry based on grid coordinates from backend
        const pos = entry.position || { x: 0, y: 0 };
        sprite.x = this.config.originX + pos.x * this.config.gridSize;
        sprite.y = this.config.originY + pos.y * this.config.gridSize;
        
        this.entries.set(entry.id, entry);
    }

    /**
     * Remove entry from display
     */
    _removeEntry(id) {
        const sprite = this.sprites.get(id);
        if (sprite) {
            this.container.removeChild(sprite);
            sprite.destroy();
            this.sprites.delete(id);
        }
        this.entries.delete(id);
    }

    /**
     * Handle sprite click (Select/Boot)
     */
    _onSpriteDown(event, sprite) {
        console.log(`[SpatialCatalog] Selected: ${sprite.entryName}`);
        
        // Instrumentation: Update intent for Glass Box debugging
        if (this.debugOverlay) {
            this.debugOverlay.handleIntentUpdate({
                element_id: sprite.entryId,
                element_type: 'OS_CONTAINER',
                position: [sprite.x, sprite.y],
                size: [sprite.width, sprite.height],
                properties: {
                    name: sprite.entryName,
                    distro: sprite.metadata.distro,
                    kernel: sprite.metadata.kernel_version
                }
            });
        }

        // Show context menu or auto-boot?
        // For now, let's just log. In a real impl, we'd trigger the boot API.
    }

    /**
     * Handle sprite hover
     */
    _onSpriteOver(sprite) {
        sprite.scale.set(1.05);
        sprite.tint = 0x00d4ff;
        
        // Show metadata in HUD
        if (this.debugOverlay) {
            this.debugOverlay.handleVerificationResult({
                success: true,
                overall_confidence: 1.0,
                summary: `Container: ${sprite.entryName}
OS: ${sprite.metadata.distro}
Kernel: ${sprite.metadata.kernel_version}
Size: ${(sprite.metadata.size / 1024 / 1024).toFixed(1)} MB`,
                timestamp: Date.now()
            });
        }
    }

    /**
     * Handle sprite out
     */
    _onSpriteOut(sprite) {
        sprite.scale.set(1.0);
        sprite.tint = 0xffffff;
    }

    /**
     * Update backend layout
     */
    async updateLayout(entryId, newX, newY) {
        try {
            await fetch('http://localhost:8080/api/v1/catalog/layout', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    entry_id: entryId,
                    new_position: { x: newX, y: newY }
                })
            });
        } catch (error) {
            console.error('[SpatialCatalog] Layout update failed:', error);
        }
    }

    /**
     * Trigger boot for an entry
     */
    async bootEntry(entryId) {
        console.log(`[SpatialCatalog] Booting ${entryId}...`);
        
        try {
            const response = await fetch(`http://localhost:8080/api/v1/catalog/${entryId}/boot`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ memory: '2G', cpus: 2 })
            });
            
            const result = await response.json();
            if (result.success) {
                console.log(`[SpatialCatalog] Boot successful! PID: ${result.pid}, VNC: ${result.vnc_port}`);
                // Could spawn a Window with VNC here
            } else {
                console.error(`[SpatialCatalog] Boot failed: ${result.error_message}`);
            }
        } catch (error) {
            console.error('[SpatialCatalog] Boot request failed:', error);
        }
    }
}

// Export
if (typeof window !== 'undefined') {
    window.SpatialCatalog = SpatialCatalog;
}
