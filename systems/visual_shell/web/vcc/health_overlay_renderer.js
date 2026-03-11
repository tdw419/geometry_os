/**
 * Health Overlay Renderer
 * 
 * PixiJS-based visual feedback system for the Visual Consistency Contract.
 * Renders health indicators, fracture maps, and distortion effects on tiles.
 * 
 * Effects:
 * - Border glow: Color-coded by health status
 * - Fracture overlay: Red highlights on detected artifact coordinates
 * - Chromatic aberration: RGB split for low V-PAS scores
 * - Scanlines: Visual degradation indicator
 * - Entropy visualization: Noise overlay based on texture entropy
 */

/**
 * Color scheme for health statuses (RGBA)
 */
const HEALTH_COLORS = {
    [HealthStatus.OPTIMAL]: { border: 0x00FF88, glow: 0x00FF8833, fill: 0x00FF8808 },
    [HealthStatus.STABLE]: { border: 0x00CCFF, glow: 0x00CCFF33, fill: 0x00CCFF08 },
    [HealthStatus.WARNING]: { border: 0xFFAA00, glow: 0xFFAA0033, fill: 0xFFAA0010 },
    [HealthStatus.CRITICAL]: { border: 0xFF3300, glow: 0xFF330055, fill: 0xFF330020 },
    [HealthStatus.CORRUPTED]: { border: 0xFF0000, glow: 0xFF000088, fill: 0xFF000040 }
};

/**
 * HealthOverlayRenderer
 * 
 * Manages visual overlays for tile health in the PixiJS infinite map.
 */
class HealthOverlayRenderer {
    constructor(infiniteMap, options = {}) {
        this.map = infiniteMap;
        this.config = {
            enableBorders: true,
            enableFractureOverlays: true,
            enableChromaticAberration: true,
            enableEntropyVisualization: true,
            enableScanlines: true,
            borderThickness: 2,
            glowRadius: 8,
            fractureMarkerSize: 4,
            scanlineCount: 10,
            aberrationIntensity: 2.0, // Pixels of RGB split at V-PAS = 0
            ...options
        };

        // Overlay container (rendered above tiles)
        this.overlayContainer = new PIXI.Container();
        this.overlayContainer.name = 'healthOverlays';
        
        // Insert overlay container into the map's scene graph
        if (this.map.world) {
            this.map.world.addChild(this.overlayContainer);
        }

        // Track overlay sprites per tile
        this.overlays = new Map(); // tileKey -> { border, fractures, effects, scanlines }
        
        // Chromatic aberration filter (shared)
        this._initShaders();
        
        // Pool for reusable graphics objects
        this.graphicsPool = [];
        this.maxPoolSize = 100;

        console.log('🔍 HealthOverlayRenderer initialized');
    }

    /**
     * Initialize WebGL shaders for advanced effects
     */
    _initShaders() {
        // Chromatic aberration shader
        this.chromaticShader = `
            precision mediump float;
            varying vec2 vTextureCoord;
            uniform sampler2D uSampler;
            uniform vec2 uResolution;
            uniform float uIntensity;
            uniform vec2 uCenter;
            
            void main(void) {
                vec2 uv = vTextureCoord;
                vec2 center = uCenter;
                vec2 direction = uv - center;
                float dist = length(direction);
                vec2 offset = direction * uIntensity * dist * 0.01;
                
                float r = texture2D(uSampler, uv + offset).r;
                float g = texture2D(uSampler, uv).g;
                float b = texture2D(uSampler, uv - offset).b;
                
                gl_FragColor = vec4(r, g, b, 1.0);
            }
        `;

        // Entropy noise shader
        this.entropyShader = `
            precision mediump float;
            varying vec2 vTextureCoord;
            uniform sampler2D uSampler;
            uniform float uEntropy;
            uniform float uTime;
            
            float random(vec2 st) {
                return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
            }
            
            void main(void) {
                vec4 color = texture2D(uSampler, vTextureCoord);
                float noise = random(vTextureCoord + uTime) * uEntropy * 0.3;
                gl_FragColor = vec4(color.rgb + noise, color.a);
            }
        `;

        // Compile shaders if WebGL is available
        if (PIXI.RendererType.WEBGL && this.map.app?.renderer?.gl) {
            this._compileShaders();
        }
    }

    _compileShaders() {
        // Store shader programs for later use
        this.shaders = {
            chromatic: null, // Would be compiled PIXI.Filter
            entropy: null
        };
    }

    /**
     * Create or update health overlay for a tile
     */
    renderTileHealth(tileKey, tileSprite, healthEntry) {
        const existing = this.overlays.get(tileKey);
        const colors = HEALTH_COLORS[healthEntry.status];
        
        // Calculate aberration intensity based on V-PAS score
        const aberrationIntensity = this._calculateAberrationIntensity(healthEntry.vPasScore);
        
        if (!existing) {
            // Create new overlay set
            const overlay = {
                tileKey,
                tileSprite,
                border: this._createBorder(tileSprite, colors),
                fractures: this._createFractureOverlay(tileSprite, healthEntry.artifacts, colors),
                scanlines: this.config.enableScanlines ? this._createScanlines(tileSprite, healthEntry.status) : null,
                aberrationFilter: aberrationIntensity > 0 ? this._applyChromaticAberration(tileSprite, aberrationIntensity) : null,
                entropyOverlay: this.config.enableEntropyVisualization ? this._createEntropyOverlay(tileSprite, healthEntry.textureEntropy) : null
            };
            
            this.overlays.set(tileKey, overlay);
            this.overlayContainer.addChild(overlay.border);
            if (overlay.fractures) this.overlayContainer.addChild(overlay.fractures);
            if (overlay.scanlines) this.overlayContainer.addChild(overlay.scanlines);
            if (overlay.entropyOverlay) this.overlayContainer.addChild(overlay.entropyOverlay);
        } else {
            // Update existing overlay
            this._updateBorderColor(existing.border, colors);
            
            if (healthEntry.artifacts?.length > 0) {
                if (existing.fractures) {
                    existing.fractures.clear();
                    this._drawFractures(existing.fractures, tileSprite, healthEntry.artifacts, colors);
                } else {
                    existing.fractures = this._createFractureOverlay(tileSprite, healthEntry.artifacts, colors);
                    this.overlayContainer.addChild(existing.fractures);
                }
            }
            
            // Update chromatic aberration
            if (aberrationIntensity > 0) {
                this._updateChromaticAberration(existing, tileSprite, aberrationIntensity);
            } else if (existing.aberrationFilter) {
                this._removeChromaticAberration(existing);
            }
            
            // Update scanline intensity
            if (existing.scanlines) {
                this._updateScanlineIntensity(existing.scanlines, healthEntry.status);
            }
        }

        // Animate entrance if new
        if (!existing) {
            this._animateEntrance(this.overlays.get(tileKey));
        }
    }

    /**
     * Remove health overlay for a tile
     */
    removeTileHealth(tileKey) {
        const overlay = this.overlays.get(tileKey);
        if (!overlay) return;

        // Remove chromatic aberration filter
        if (overlay.aberrationFilter && overlay.tileSprite) {
            overlay.tileSprite.filters = (overlay.tileSprite.filters || [])
                .filter(f => f !== overlay.aberrationFilter);
        }

        // Remove graphics from container
        this.overlayContainer.removeChild(overlay.border);
        if (overlay.fractures) this.overlayContainer.removeChild(overlay.fractures);
        if (overlay.scanlines) this.overlayContainer.removeChild(overlay.scanlines);
        if (overlay.entropyOverlay) this.overlayContainer.removeChild(overlay.entropyOverlay);

        // Return graphics to pool
        this._returnToPool(overlay.border);
        if (overlay.fractures) this._returnToPool(overlay.fractures);
        if (overlay.scanlines) this._returnToPool(overlay.scanlines);
        if (overlay.entropyOverlay) this._returnToPool(overlay.entropyOverlay);

        this.overlays.delete(tileKey);
    }

    /**
     * Create border graphic for tile
     */
    _createBorder(tileSprite, colors) {
        const border = this._getFromPool();
        border.lineStyle(this.config.borderThickness, colors.border, 1);
        border.drawRect(0, 0, tileSprite.width, tileSprite.height);
        border.endFill();
        
        // Position at tile location
        border.position.set(tileSprite.x, tileSprite.y);
        
        // Add glow effect via multiple strokes
        border.lineStyle(this.config.borderThickness + 2, colors.glow, 0.5);
        border.drawRect(-1, -1, tileSprite.width + 2, tileSprite.height + 2);
        border.lineStyle(this.config.borderThickness + 4, colors.glow, 0.25);
        border.drawRect(-2, -2, tileSprite.width + 4, tileSprite.height + 4);
        
        return border;
    }

    /**
     * Update border color
     */
    _updateBorderColor(borderGraphic, colors) {
        borderGraphic.clear();
        borderGraphic.lineStyle(this.config.borderThickness, colors.border, 1);
        
        const width = borderGraphic.width || 100;
        const height = borderGraphic.height || 100;
        
        borderGraphic.drawRect(0, 0, width, height);
        borderGraphic.lineStyle(this.config.borderThickness + 2, colors.glow, 0.5);
        borderGraphic.drawRect(-1, -1, width + 2, height + 2);
    }

    /**
     * Create fracture overlay showing artifact coordinates
     */
    _createFractureOverlay(tileSprite, artifacts, colors) {
        if (!artifacts || artifacts.length === 0) return null;
        
        const container = new PIXI.Container();
        container.position.set(tileSprite.x, tileSprite.y);
        
        const gfx = this._getFromPool();
        this._drawFractures(gfx, tileSprite, artifacts, colors);
        container.addChild(gfx);
        
        return container;
    }

    /**
     * Draw fracture markers on graphic
     */
    _drawFractures(gfx, tileSprite, artifacts, colors) {
        gfx.beginFill(0xFF0000, 0.7);
        
        const tileWidth = tileSprite.width;
        const tileHeight = tileSprite.height;
        
        for (const [x, y] of artifacts) {
            // Convert normalized coordinates (0-1) to pixel coordinates
            const px = x * tileWidth;
            const py = y * tileHeight;
            const size = this.config.fractureMarkerSize;
            
            // Draw X marker
            gfx.lineStyle(2, 0xFF0000, 1);
            gfx.moveTo(px - size, py - size);
            gfx.lineTo(px + size, py + size);
            gfx.moveTo(px + size, py - size);
            gfx.lineTo(px - size, py + size);
            
            // Draw circle around
            gfx.drawCircle(px, py, size + 2);
        }
        
        gfx.endFill();
    }

    /**
     * Create scanline effect for degraded tiles
     */
    _createScanlines(tileSprite, status) {
        const container = new PIXI.Container();
        container.position.set(tileSprite.x, tileSprite.y);
        
        const gfx = this._getFromPool();
        const alpha = this._statusToScanlineAlpha(status);
        
        gfx.beginFill(0x000000, alpha);
        
        const lineHeight = tileSprite.height / this.config.scanlineCount;
        for (let i = 0; i < this.config.scanlineCount; i += 2) {
            gfx.drawRect(0, i * lineHeight, tileSprite.width, lineHeight * 0.5);
        }
        
        gfx.endFill();
        container.addChild(gfx);
        
        return container;
    }

    /**
     * Update scanline intensity based on health status
     */
    _updateScanlineIntensity(scanlineContainer, status) {
        if (!scanlineContainer.children[0]) return;
        
        const gfx = scanlineContainer.children[0];
        const alpha = this._statusToScanlineAlpha(status);
        gfx.alpha = alpha;
    }

    _statusToScanlineAlpha(status) {
        const alphas = {
            [HealthStatus.OPTIMAL]: 0,
            [HealthStatus.STABLE]: 0.05,
            [HealthStatus.WARNING]: 0.15,
            [HealthStatus.CRITICAL]: 0.3,
            [HealthStatus.CORRUPTED]: 0.5
        };
        return alphas[status] || 0;
    }

    /**
     * Create entropy visualization overlay
     */
    _createEntropyOverlay(tileSprite, entropy) {
        if (entropy < 0.3) return null; // Low entropy = no visual noise
        
        const container = new PIXI.Container();
        container.position.set(tileSprite.x, tileSprite.y);
        
        // Create noise texture
        const canvas = document.createElement('canvas');
        canvas.width = tileSprite.width;
        canvas.height = tileSprite.height;
        const ctx = canvas.getContext('2d');
        
        const imageData = ctx.createImageData(canvas.width, canvas.height);
        const data = imageData.data;
        
        for (let i = 0; i < data.length; i += 4) {
            const noise = Math.random() * 255 * entropy * 0.3;
            data[i] = noise;     // R
            data[i + 1] = noise; // G
            data[i + 2] = noise; // B
            data[i + 3] = 30;    // A (subtle)
        }
        
        ctx.putImageData(imageData, 0, 0);
        
        const texture = PIXI.Texture.from(canvas);
        const sprite = new PIXI.Sprite(texture);
        sprite.blendMode = PIXI.BLEND_MODES.OVERLAY;
        
        container.addChild(sprite);
        return container;
    }

    /**
     * Calculate chromatic aberration intensity from V-PAS score
     */
    _calculateAberrationIntensity(vPasScore) {
        // Inverse relationship: lower score = more aberration
        const normalized = Math.max(0, Math.min(1, (VPAS_THRESHOLDS.STABLE - vPasScore) / VPAS_THRESHOLDS.STABLE));
        return normalized * this.config.aberrationIntensity;
    }

    /**
     * Apply chromatic aberration filter to tile
     */
    _applyChromaticAberration(tileSprite, intensity) {
        // Simplified implementation using PIXI filters
        // In production, use the custom shader
        
        const filter = new PIXI.BlurFilter();
        filter.blur = intensity * 0.5;
        
        if (!tileSprite.filters) tileSprite.filters = [];
        tileSprite.filters.push(filter);
        
        return filter;
    }

    /**
     * Update chromatic aberration intensity
     */
    _updateChromaticAberration(overlay, tileSprite, intensity) {
        if (overlay.aberrationFilter) {
            overlay.aberrationFilter.blur = intensity * 0.5;
        } else {
            overlay.aberrationFilter = this._applyChromaticAberration(tileSprite, intensity);
        }
    }

    /**
     * Remove chromatic aberration filter
     */
    _removeChromaticAberration(overlay) {
        if (overlay.aberrationFilter && overlay.tileSprite) {
            overlay.tileSprite.filters = (overlay.tileSprite.filters || [])
                .filter(f => f !== overlay.aberrationFilter);
            overlay.aberrationFilter = null;
        }
    }

    /**
     * Animate overlay entrance
     */
    _animateEntrance(overlay) {
        if (!overlay) return;
        
        // Fade in border
        overlay.border.alpha = 0;
        
        const animate = () => {
            if (overlay.border.alpha < 1) {
                overlay.border.alpha += 0.1;
                requestAnimationFrame(animate);
            }
        };
        animate();
    }

    /**
     * Graphics object pooling
     */
    _getFromPool() {
        if (this.graphicsPool.length > 0) {
            return this.graphicsPool.pop();
        }
        return new PIXI.Graphics();
    }

    _returnToPool(gfx) {
        if (this.graphicsPool.length < this.maxPoolSize) {
            gfx.clear();
            this.graphicsPool.push(gfx);
        } else {
            gfx.destroy();
        }
    }

    /**
     * Update all overlay positions (call when map pans/zooms)
     */
    syncPositions() {
        for (const [tileKey, overlay] of this.overlays) {
            if (overlay.tileSprite) {
                overlay.border.position.set(overlay.tileSprite.x, overlay.tileSprite.y);
                if (overlay.fractures) {
                    overlay.fractures.position.set(overlay.tileSprite.x, overlay.tileSprite.y);
                }
                if (overlay.scanlines) {
                    overlay.scanlines.position.set(overlay.tileSprite.x, overlay.tileSprite.y);
                }
                if (overlay.entropyOverlay) {
                    overlay.entropyOverlay.position.set(overlay.tileSprite.x, overlay.tileSprite.y);
                }
            }
        }
    }

    /**
     * Clear all overlays
     */
    clear() {
        for (const [tileKey] of this.overlays) {
            this.removeTileHealth(tileKey);
        }
    }

    /**
     * Set global visibility
     */
    setVisible(visible) {
        this.overlayContainer.visible = visible;
    }

    /**
     * Destroy renderer and cleanup
     */
    destroy() {
        this.clear();
        this.overlayContainer.destroy({ children: true });
        this.graphicsPool.forEach(g => g.destroy());
        this.graphicsPool = [];
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { HealthOverlayRenderer, HEALTH_COLORS };
}
