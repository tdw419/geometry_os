/**
 * DistrictOverlay - Real-time district visualization on Infinite Map
 *
 * Phase 49: Neural District Coalescence
 * Connects to district_server on port 8773
 * Renders TectonicPlates as colored regions with:
 * - PixelBrain color scheme (#00F0FF, #FF3333, etc.)
 * - Animated borders (glow effect)
 * - Ghost layer for temporal history
 * - Click to inspect district details
 */

export class DistrictOverlay {
    /**
     * Create a DistrictOverlay
     * @param {PIXI.Application} pixiApp - The PixiJS application instance
     * @param {Object} options - Configuration options
     * @param {number} options.ghostDepth - Number of historical frames to render (default: 60)
     * @param {boolean} options.showLabels - Whether to show district labels (default: true)
     * @param {number} options.borderGlowIntensity - Border glow intensity 0-1 (default: 0.8)
     */
    constructor(pixiApp, options = {}) {
        this.app = pixiApp;
        this.ws = null;
        this.districts = new Map();
        this.container = new PIXI.Container();
        this.container.label = 'DistrictOverlay';
        this.ghostLayer = [];
        this.ghostDepth = options.ghostDepth || 60;
        this.showLabels = options.showLabels !== false;
        this.borderGlowIntensity = options.borderGlowIntensity || 0.8;

        // Animation state
        this.time = 0;
        this.connected = false;
        this.reconnectAttempts = 0;
        this.maxReconnectAttempts = 5;

        // Graphics containers
        this.districtGraphics = new PIXI.Container();
        this.districtGraphics.label = 'DistrictGraphics';
        this.ghostContainer = new PIXI.Container();
        this.ghostContainer.label = 'GhostLayer';
        this.labelContainer = new PIXI.Container();
        this.labelContainer.label = 'DistrictLabels';

        // Layer ordering: ghost (back) -> districts (middle) -> labels (front)
        this.container.addChild(this.ghostContainer);
        this.container.addChild(this.districtGraphics);
        this.container.addChild(this.labelContainer);

        // PixelBrain color scheme (state -> hex color)
        this.stateColors = {
            'high_cohesion': 0x00F0FF,  // Cyan
            'low_cohesion': 0x4A4A4A,   // Gray
            'active': 0xFF4500,         // Orange-Red
            'dormant': 0x1A1A1A,        // Dark
            'conflict': 0xFF3333        // Red
        };

        // Event handlers
        this.onDistrictClick = null;
        this.onDistrictFormed = null;
        this.onDistrictConflict = null;

        // Click detection
        this._setupInteraction();

        // Ghost frame history
        this.ghostFrames = [];
        this.ghostUpdateInterval = 10; // frames between ghost captures
        this.frameCount = 0;
    }

    /**
     * Setup mouse/touch interaction for district clicks
     * @private
     */
    _setupInteraction() {
        this.container.eventMode = 'static';
        this.container.cursor = 'pointer';

        this.container.on('pointerdown', (event) => {
            const localPos = event.data.getLocalPosition(this.container);
            const clickedDistrict = this._findDistrictAtPoint(localPos);
            if (clickedDistrict) {
                this._handleDistrictClick(clickedDistrict);
            }
        });
    }

    /**
     * Find district containing the given point
     * @private
     * @param {PIXI.Point} point - Point to test
     * @returns {Object|null} District data or null
     */
    _findDistrictAtPoint(point) {
        for (const [id, district] of this.districts) {
            if (this._pointInDistrict(point, district)) {
                return district;
            }
        }
        return null;
    }

    /**
     * Check if a point is inside a district's tiles
     * @private
     * @param {PIXI.Point} point - Point to test
     * @param {Object} district - District data
     * @returns {boolean}
     */
    _pointInDistrict(point, district) {
        if (!district.tiles || district.tiles.length === 0) {
            return false;
        }

        // Simple bounding box check for now
        const bounds = this._getDistrictBounds(district);
        return point.x >= bounds.x &&
               point.x <= bounds.x + bounds.width &&
               point.y >= bounds.y &&
               point.y <= bounds.y + bounds.height;
    }

    /**
     * Get bounding box for a district
     * @private
     * @param {Object} district - District data
     * @returns {Object} Bounds {x, y, width, height}
     */
    _getDistrictBounds(district) {
        if (!district.tiles || district.tiles.length === 0) {
            return { x: 0, y: 0, width: 0, height: 0 };
        }

        let minX = Infinity, minY = Infinity;
        let maxX = -Infinity, maxY = -Infinity;

        for (const [tx, ty] of district.tiles) {
            minX = Math.min(minX, tx * 32);
            minY = Math.min(minY, ty * 32);
            maxX = Math.max(maxX, tx * 32 + 32);
            maxY = Math.max(maxY, ty * 32 + 32);
        }

        return {
            x: minX,
            y: minY,
            width: maxX - minX,
            height: maxY - minY
        };
    }

    /**
     * Handle district click event
     * @private
     * @param {Object} district - Clicked district
     */
    _handleDistrictClick(district) {
        if (this.onDistrictClick) {
            this.onDistrictClick(district);
        }
    }

    /**
     * Connect to district WebSocket server
     * @param {string} url - WebSocket URL (default: ws://localhost:8773)
     */
    connect(url = 'ws://localhost:8773') {
        if (this.ws) {
            this.ws.close();
        }

        try {
            this.ws = new WebSocket(url);

            this.ws.onopen = () => {
                console.log('[DistrictOverlay] Connected to', url);
                this.connected = true;
                this.reconnectAttempts = 0;

                // Subscribe to district updates
                this._send({
                    action: 'subscribe_district',
                    district_id: '*'  // Subscribe to all
                });

                // Request initial districts
                this._send({ action: 'get_districts' });
            };

            this.ws.onmessage = (event) => {
                this.onMessage(event);
            };

            this.ws.onclose = (event) => {
                console.log('[DistrictOverlay] Disconnected', event.code, event.reason);
                this.connected = false;
                this._scheduleReconnect(url);
            };

            this.ws.onerror = (error) => {
                console.error('[DistrictOverlay] WebSocket error:', error);
            };
        } catch (error) {
            console.error('[DistrictOverlay] Connection failed:', error);
            this._scheduleReconnect(url);
        }
    }

    /**
     * Schedule a reconnection attempt
     * @private
     * @param {string} url - WebSocket URL
     */
    _scheduleReconnect(url) {
        if (this.reconnectAttempts < this.maxReconnectAttempts) {
            this.reconnectAttempts++;
            const delay = Math.min(1000 * Math.pow(2, this.reconnectAttempts), 30000);
            console.log(`[DistrictOverlay] Reconnecting in ${delay}ms (attempt ${this.reconnectAttempts})`);
            setTimeout(() => this.connect(url), delay);
        }
    }

    /**
     * Send message to WebSocket server
     * @private
     * @param {Object} data - Data to send
     */
    _send(data) {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify(data));
        }
    }

    /**
     * Handle incoming WebSocket message
     * @param {MessageEvent} event - WebSocket message event
     */
    onMessage(event) {
        try {
            const data = JSON.parse(event.data);

            if (!data.success && data.error) {
                console.error('[DistrictOverlay] Server error:', data.error);
                return;
            }

            // Handle different message types
            if (data.districts) {
                // Initial districts load
                this._loadDistricts(data.districts);
            } else if (data.district) {
                // Single district update
                this._updateDistrict(data.district);
            } else if (data.event_type) {
                // Event-based updates
                this._handleEvent(data);
            }
        } catch (error) {
            console.error('[DistrictOverlay] Parse error:', error);
        }
    }

    /**
     * Load initial districts
     * @private
     * @param {Array} districts - Array of district data
     */
    _loadDistricts(districts) {
        this.districts.clear();
        this._clearGraphics();

        for (const district of districts) {
            this.districts.set(district.plate_id, district);
            this.renderDistrict(district);
        }
    }

    /**
     * Update a single district
     * @private
     * @param {Object} district - District data
     */
    _updateDistrict(district) {
        this.districts.set(district.plate_id, district);
        this._removeDistrictGraphics(district.plate_id);
        this.renderDistrict(district);
    }

    /**
     * Handle server events
     * @private
     * @param {Object} data - Event data
     */
    _handleEvent(data) {
        switch (data.event_type) {
            case 'district_formed':
                if (this.onDistrictFormed) {
                    this.onDistrictFormed(data.district);
                }
                this._updateDistrict(data.district);
                break;

            case 'district_updated':
                this._updateDistrict(data.district);
                break;

            case 'district_conflict':
                if (this.onDistrictConflict) {
                    this.onDistrictConflict(data);
                }
                // Highlight conflict visually
                this._showConflict(data);
                break;

            default:
                console.log('[DistrictOverlay] Unknown event:', data.event_type);
        }
    }

    /**
     * Show visual conflict indicator
     * @private
     * @param {Object} data - Conflict data
     */
    _showConflict(data) {
        // Flash the conflicting districts
        if (data.district_ids) {
            for (const id of data.district_ids) {
                const district = this.districts.get(id);
                if (district) {
                    this._flashDistrict(district, 0xFF3333);
                }
            }
        }
    }

    /**
     * Flash a district with a color
     * @private
     * @param {Object} district - District to flash
     * @param {number} color - Flash color
     */
    _flashDistrict(district, color) {
        const graphics = this.districtGraphics.getChildByName(`district_${district.plate_id}`);
        if (graphics) {
            const originalAlpha = graphics.alpha;
            graphics.tint = color;
            graphics.alpha = 1;

            setTimeout(() => {
                graphics.tint = 0xFFFFFF;
                graphics.alpha = originalAlpha;
            }, 300);
        }
    }

    /**
     * Clear all district graphics
     * @private
     */
    _clearGraphics() {
        this.districtGraphics.removeChildren();
        this.labelContainer.removeChildren();
    }

    /**
     * Remove graphics for a specific district
     * @private
     * @param {string} districtId - District ID
     */
    _removeDistrictGraphics(districtId) {
        const graphics = this.districtGraphics.getChildByName(`district_${districtId}`);
        if (graphics) {
            this.districtGraphics.removeChild(graphics);
            graphics.destroy();
        }

        const label = this.labelContainer.getChildByName(`label_${districtId}`);
        if (label) {
            this.labelContainer.removeChild(label);
            label.destroy();
        }
    }

    /**
     * Render a single district
     * @param {Object} plate - District/plate data
     */
    renderDistrict(plate) {
        if (!plate.tiles || plate.tiles.length === 0) {
            return;
        }

        const graphics = new PIXI.Graphics();
        graphics.label = `district_${plate.plate_id}`;

        // Get color from state
        const color = this.stateColors[plate.state] || this.stateColors['dormant'];

        // Calculate bounds
        const bounds = this._getDistrictBounds(plate);

        // Draw fill with slight transparency
        graphics.rect(bounds.x, bounds.y, bounds.width, bounds.height);
        graphics.fill({ color: color, alpha: 0.3 });

        // Draw glowing border
        this._drawGlowingBorder(graphics, bounds, color);

        // Add to container
        this.districtGraphics.addChild(graphics);

        // Render label
        if (this.showLabels && plate.name) {
            this._renderLabel(plate, bounds);
        }
    }

    /**
     * Draw a glowing border effect
     * @private
     * @param {PIXI.Graphics} graphics - Graphics object
     * @param {Object} bounds - Bounds {x, y, width, height}
     * @param {number} color - Border color
     */
    _drawGlowingBorder(graphics, bounds, color) {
        const intensity = this.borderGlowIntensity;
        const baseAlpha = 0.5 + (intensity * 0.5);

        // Outer glow (wider, more transparent)
        graphics.rect(bounds.x - 2, bounds.y - 2, bounds.width + 4, bounds.height + 4);
        graphics.stroke({ color: color, width: 1, alpha: baseAlpha * 0.3 });

        // Inner border (sharper)
        graphics.rect(bounds.x, bounds.y, bounds.width, bounds.height);
        graphics.stroke({ color: color, width: 2, alpha: baseAlpha });
    }

    /**
     * Render district label
     * @private
     * @param {Object} plate - District data
     * @param {Object} bounds - District bounds
     */
    _renderLabel(plate, bounds) {
        const label = new PIXI.Text({
            text: plate.name,
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 12,
                fill: 0x00FFCC,
                align: 'center'
            }
        });

        label.label = `label_${plate.plate_id}`;
        label.x = bounds.x + bounds.width / 2;
        label.y = bounds.y + bounds.height / 2;
        label.anchor.set(0.5);

        this.labelContainer.addChild(label);
    }

    /**
     * Capture current state for ghost layer
     * @private
     */
    _captureGhostFrame() {
        if (this.ghostFrames.length >= this.ghostDepth) {
            this.ghostFrames.shift();
        }

        // Store a snapshot of current district positions/colors
        const snapshot = [];
        for (const [id, district] of this.districts) {
            snapshot.push({
                plate_id: id,
                state: district.state,
                tiles: district.tiles ? [...district.tiles] : []
            });
        }

        this.ghostFrames.push({
            time: this.time,
            districts: snapshot
        });
    }

    /**
     * Render ghost layer (temporal history with decay)
     */
    renderGhostLayer() {
        this.ghostContainer.removeChildren();

        if (this.ghostFrames.length < 2) {
            return;
        }

        const oldestIndex = 0;
        const newestIndex = this.ghostFrames.length - 1;

        for (let i = oldestIndex; i < newestIndex; i++) {
            const frame = this.ghostFrames[i];
            const age = newestIndex - i;
            const decay = 1 - (age / this.ghostDepth);
            const alpha = decay * 0.15; // Max 15% opacity for ghosts

            if (alpha <= 0.01) continue;

            const ghostGraphics = new PIXI.Graphics();

            for (const district of frame.districts) {
                if (!district.tiles || district.tiles.length === 0) continue;

                const color = this.stateColors[district.state] || this.stateColors['dormant'];
                const bounds = this._getDistrictBounds(district);

                ghostGraphics.rect(bounds.x, bounds.y, bounds.width, bounds.height);
                ghostGraphics.fill({ color: color, alpha: alpha });
            }

            this.ghostContainer.addChild(ghostGraphics);
        }
    }

    /**
     * Handle district click - show details panel
     * @param {string} districtId - Clicked district ID
     */
    onDistrictClick(districtId) {
        const district = this.districts.get(districtId);
        if (!district) return;

        // Create details panel
        this._showDistrictDetails(district);
    }

    /**
     * Show district details panel
     * @private
     * @param {Object} district - District to show
     */
    _showDistrictDetails(district) {
        // Dispatch custom event for other components to handle
        const event = new CustomEvent('districtSelected', {
            detail: {
                district: district
            }
        });
        document.dispatchEvent(event);

        console.log('[DistrictOverlay] District selected:', district.plate_id, {
            name: district.name,
            state: district.state,
            cohesion: district.cohesion,
            agents: district.agents?.length || 0
        });
    }

    /**
     * Update animation frame
     * @param {number} delta - Frame delta time
     */
    update(delta) {
        this.time += delta;
        this.frameCount++;

        // Update border glow animation
        this._updateGlowAnimation();

        // Capture ghost frames periodically
        if (this.frameCount % this.ghostUpdateInterval === 0) {
            this._captureGhostFrame();
            this.renderGhostLayer();
        }
    }

    /**
     * Update glowing border animation
     * @private
     */
    _updateGlowAnimation() {
        const pulse = 0.7 + 0.3 * Math.sin(this.time * 0.05);

        for (const child of this.districtGraphics.children) {
            if (child instanceof PIXI.Graphics) {
                // Subtle alpha pulse for active districts
                const district = this.districts.get(child.label.replace('district_', ''));
                if (district && district.state === 'active') {
                    child.alpha = pulse;
                }
            }
        }
    }

    /**
     * Get district by ID
     * @param {string} districtId - District ID
     * @returns {Object|null} District data
     */
    getDistrict(districtId) {
        return this.districts.get(districtId) || null;
    }

    /**
     * Get all districts
     * @returns {Map} Districts map
     */
    getAllDistricts() {
        return this.districts;
    }

    /**
     * Check if connected to server
     * @returns {boolean}
     */
    isConnected() {
        return this.connected && this.ws?.readyState === WebSocket.OPEN;
    }

    /**
     * Cleanup and destroy overlay
     */
    destroy() {
        // Close WebSocket
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        // Clear data
        this.districts.clear();
        this.ghostFrames = [];

        // Destroy graphics
        this._clearGraphics();
        this.ghostContainer.removeChildren();

        // Destroy container
        if (this.container) {
            this.container.destroy({ children: true });
        }

        this.connected = false;
        console.log('[DistrictOverlay] Destroyed');
    }
}

// Export for module
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DistrictOverlay };
}

// Export for browser
if (typeof window !== 'undefined') {
    window.DistrictOverlay = DistrictOverlay;
}
