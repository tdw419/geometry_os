/**
 * DesktopObjectManager - Lifecycle manager for RTSDesktopObject instances
 *
 * Creates, tracks, and destroys desktop objects on the infinite canvas.
 * Coordinates with CatalogBridge for data and SpatialLayoutManager for positions.
 *
 * Grid-to-world conversion: World X = grid.x * 160, World Y = grid.y * 200
 * Events: 'object-selected', 'object-booted', 'object-moved'
 *
 * @module DesktopObjectManager
 */

class DesktopObjectManager extends PIXI.utils.EventEmitter {
    /**
     * Grid spacing constants
     * @static
     */
    static GRID_SPACING = {
        X: 160,
        Y: 200
    };

    /**
     * Create a DesktopObjectManager instance
     * @param {PIXI.Container} worldContainer - The world container to add objects to
     * @param {CatalogBridge} catalogBridge - API client for catalog data
     * @param {Object} options - Configuration options
     * @param {boolean} options.autoLoad - Automatically load catalog on init (default: true)
     * @param {Function} options.onObjectCreated - Callback when object is created
     * @param {Function} options.onObjectDestroyed - Callback when object is destroyed
     */
    constructor(worldContainer, catalogBridge, options = {}) {
        super();

        this.worldContainer = worldContainer;
        this.bridge = catalogBridge;
        this.options = options;

        // Object tracking
        this.objects = new Map(); // entryId -> RTSDesktopObject

        // Status polling tracking
        this._statusPollers = new Map(); // entryId -> pollId

        // Create dedicated layer for desktop objects
        this.objectLayer = new PIXI.Container();
        this.objectLayer.label = 'desktopObjectLayer';
        this.objectLayer.sortableChildren = true;
        this.worldContainer.addChild(this.objectLayer);

        // Selection state
        this.selectedObjectId = null;

        // Auto-load if enabled
        if (options.autoLoad !== false) {
            this.loadCatalog().catch(err => {
                console.warn('[DesktopObjectManager] Auto-load failed:', err);
            });
        }
    }

    /**
     * Load catalog data and create objects for all entries
     * @returns {Promise<number>} Number of objects created
     */
    async loadCatalog() {
        console.log('[DesktopObjectManager] Loading catalog...');

        const catalog = await this.bridge.getCatalog();

        if (!catalog || !catalog.entries) {
            console.warn('[DesktopObjectManager] No catalog data received');
            return 0;
        }

        // Clear existing objects
        this.clearAll();

        // Create objects for each entry
        let created = 0;
        for (const entry of catalog.entries) {
            try {
                this.createObject(entry);
                created++;
            } catch (error) {
                console.error(`[DesktopObjectManager] Failed to create object for ${entry.id}:`, error);
            }
        }

        console.log(`[DesktopObjectManager] Created ${created} objects from catalog`);
        this.emit('catalog-loaded', { count: created });

        return created;
    }

    /**
     * Create a new desktop object from a catalog entry
     * @param {Object} entry - Catalog entry data
     * @returns {RTSDesktopObject} The created object
     */
    createObject(entry) {
        if (this.objects.has(entry.id)) {
            console.warn(`[DesktopObjectManager] Object ${entry.id} already exists, updating instead`);
            return this.updateObject(entry);
        }

        // Create the object
        const obj = new RTSDesktopObject(entry, this.options);

        // Calculate world position from grid
        const worldPos = obj.getWorldPosition();
        obj.x = worldPos.x;
        obj.y = worldPos.y;

        // Set up event forwarding
        obj.on('clicked', (data) => this._onObjectClicked(obj, data));
        obj.on('double-clicked', (data) => this._onObjectDoubleClicked(obj, data));
        obj.on('boot-requested', (data) => this._onBootRequested(obj, data));
        obj.on('hover', (data) => this._onObjectHover(obj, data));
        obj.on('hover-end', (data) => this._onObjectHoverEnd(obj, data));

        // Drag event handlers
        obj.on('drag-start', (data) => this._handleDragStart(obj, data));
        obj.on('drag-move', (data) => this._handleDragMove(obj, data));
        obj.on('drag-end', (data) => this._handleDragEnd(obj, data));

        // Add to tracking and layer
        this.objects.set(entry.id, obj);
        this.objectLayer.addChild(obj);

        // Callback if provided
        if (this.options.onObjectCreated) {
            this.options.onObjectCreated(obj);
        }

        this.emit('object-created', { object: obj, entryId: entry.id });

        return obj;
    }

    /**
     * Update an existing object with new entry data
     * @param {Object} entry - Updated catalog entry
     * @returns {RTSDesktopObject} The updated object
     */
    updateObject(entry) {
        const obj = this.objects.get(entry.id);

        if (!obj) {
            console.warn(`[DesktopObjectManager] Cannot update non-existent object ${entry.id}`);
            return null;
        }

        obj.updateEntry(entry);

        // Update world position if grid changed
        const worldPos = obj.getWorldPosition();
        obj.x = worldPos.x;
        obj.y = worldPos.y;

        this.emit('object-updated', { object: obj, entryId: entry.id });

        return obj;
    }

    /**
     * Remove and destroy a desktop object
     * @param {string} entryId - Entry ID to remove
     * @returns {boolean} True if object was removed
     */
    removeObject(entryId) {
        const obj = this.objects.get(entryId);

        if (!obj) {
            return false;
        }

        // Callback if provided
        if (this.options.onObjectDestroyed) {
            this.options.onObjectDestroyed(obj);
        }

        // Clear selection if this was selected
        if (this.selectedObjectId === entryId) {
            this.selectedObjectId = null;
        }

        // Stop status polling if active
        this.stopStatusPolling(entryId);

        // Remove from tracking and layer
        this.objects.delete(entryId);
        this.objectLayer.removeChild(obj);
        obj.destroy();

        this.emit('object-destroyed', { entryId });

        return true;
    }

    /**
     * Get an object by entry ID
     * @param {string} entryId
     * @returns {RTSDesktopObject|null}
     */
    getObject(entryId) {
        return this.objects.get(entryId) || null;
    }

    /**
     * Get all objects
     * @returns {Map<string, RTSDesktopObject>}
     */
    getAllObjects() {
        return new Map(this.objects);
    }

    /**
     * Get object count
     * @returns {number}
     */
    getObjectCount() {
        return this.objects.size;
    }

    /**
     * Find an object at a world position
     * @param {number} x - World X coordinate
     * @param {number} y - World Y coordinate
     * @returns {RTSDesktopObject|null}
     */
    getObjectAtPosition(x, y) {
        // Iterate in reverse order (top-most first)
        const children = [...this.objectLayer.children].reverse();

        for (const obj of children) {
            if (obj instanceof RTSDesktopObject) {
                const bounds = obj.getBounds();
                if (bounds.contains(x, y)) {
                    return obj;
                }
            }
        }

        return null;
    }

    /**
     * Select an object (highlight it)
     * @param {string} entryId - Entry ID to select
     * @returns {boolean} True if selection changed
     */
    selectObject(entryId) {
        // Deselect previous
        if (this.selectedObjectId && this.selectedObjectId !== entryId) {
            const prevObj = this.objects.get(this.selectedObjectId);
            if (prevObj) {
                prevObj.setHighlighted(false);
            }
        }

        // Select new
        const obj = this.objects.get(entryId);
        if (obj) {
            obj.setHighlighted(true);
            this.selectedObjectId = entryId;

            // Bring to front
            this.objectLayer.addChild(obj);

            this.emit('object-selected', { object: obj, entryId });
            return true;
        }

        this.selectedObjectId = null;
        return false;
    }

    /**
     * Clear selection
     */
    clearSelection() {
        if (this.selectedObjectId) {
            const obj = this.objects.get(this.selectedObjectId);
            if (obj) {
                obj.setHighlighted(false);
            }
            this.selectedObjectId = null;
            this.emit('selection-cleared');
        }
    }

    /**
     * Get the currently selected object
     * @returns {RTSDesktopObject|null}
     */
    getSelectedObject() {
        return this.selectedObjectId ? this.objects.get(this.selectedObjectId) : null;
    }

    /**
     * Move an object to a new grid position
     * @param {string} entryId - Entry ID to move
     * @param {number} gridX - New grid X
     * @param {number} gridY - New grid Y
     * @param {boolean} persist - Whether to persist to server (default: true)
     * @returns {Promise<boolean>}
     */
    async moveObject(entryId, gridX, gridY, persist = true) {
        const obj = this.objects.get(entryId);

        if (!obj) {
            return false;
        }

        // Update grid position
        obj.setGridPosition(gridX, gridY);

        // Animate to new world position
        const worldPos = obj.getWorldPosition();

        // Simple instant move (can be enhanced with animation)
        obj.x = worldPos.x;
        obj.y = worldPos.y;

        this.emit('object-moved', { object: obj, entryId, gridX, gridY });

        // Persist to server
        if (persist && this.bridge) {
            try {
                await this.bridge.updateLayout(entryId, { gridX, gridY });
            } catch (error) {
                console.error(`[DesktopObjectManager] Failed to persist layout for ${entryId}:`, error);
            }
        }

        return true;
    }

    /**
     * Boot an object (trigger container start)
     * @param {string} entryId - Entry ID to boot
     * @param {Object} options - Boot options
     * @returns {Promise<Object|null>}
     */
    async bootObject(entryId, options = {}) {
        const obj = this.objects.get(entryId);

        if (!obj) {
            console.warn(`[DesktopObjectManager] Cannot boot non-existent object ${entryId}`);
            return null;
        }

        // Update status to booting
        obj.setStatus('booting');

        try {
            const result = await this.bridge.bootEntry(entryId, options);

            if (result && result.success) {
                // Start polling for status updates
                this.startStatusPolling(entryId);
            } else {
                obj.setStatus('error');
            }

            return result;
        } catch (error) {
            obj.setStatus('error');
            console.error(`[DesktopObjectManager] Boot failed for ${entryId}:`, error);
            return null;
        }
    }

    /**
     * Start polling for status updates on an object
     * @param {string} entryId - Entry ID to poll
     * @param {number} interval - Polling interval in ms (default: 1000)
     */
    startStatusPolling(entryId, interval = 1000) {
        // Stop any existing polling for this entry
        this.stopStatusPolling(entryId);

        const pollId = this.bridge.pollStatus(
            entryId,
            (status) => this._handleStatusUpdate(entryId, status),
            { interval, maxAttempts: 120 }
        );

        this._statusPollers.set(entryId, pollId);
        console.log(`[DesktopObjectManager] Started status polling for ${entryId}`);
    }

    /**
     * Stop polling for status updates on an object
     * @param {string} entryId - Entry ID to stop polling
     */
    stopStatusPolling(entryId) {
        if (this._statusPollers.has(entryId)) {
            const pollId = this._statusPollers.get(entryId);
            this.bridge.stopPolling(pollId);
            this._statusPollers.delete(entryId);
            console.log(`[DesktopObjectManager] Stopped status polling for ${entryId}`);
        }
    }

    /**
     * Handle status update from polling
     * @private
     * @param {string} entryId - Entry ID that was updated
     * @param {Object} status - Status data from server
     */
    _handleStatusUpdate(entryId, status) {
        const obj = this.objects.get(entryId);

        if (!obj) {
            // Object was removed, stop polling
            this.stopStatusPolling(entryId);
            return;
        }

        // Update object status
        obj.setStatus(status.status);

        // Store status info on object
        obj.statusInfo = {
            pid: status.pid,
            started_at: status.started_at,
            uptime_seconds: status.uptime_seconds,
            vnc_port: status.vnc_port,
            error_message: status.error_message
        };

        // Handle transitions
        if (status.status === 'running') {
            console.log(`[DesktopObjectManager] Boot completed for ${entryId}, pid=${status.pid}`);
            this.emit('object-booted', {
                object: obj,
                entryId,
                result: {
                    success: true,
                    pid: status.pid,
                    vnc_port: status.vnc_port
                }
            });
            // Polling will stop automatically when status is not 'booting'
        } else if (status.status === 'error') {
            console.warn(`[DesktopObjectManager] Boot failed for ${entryId}: ${status.error_message}`);
            this.emit('boot-error', {
                object: obj,
                entryId,
                error: status.error_message
            });
            // Polling will stop automatically when status is not 'booting'
        }
    }

    /**
     * Serialize all object states
     * @returns {Object} Serializable state
     */
    serialize() {
        const objects = [];
        for (const [entryId, obj] of this.objects) {
            objects.push(obj.serialize());
        }

        return {
            version: '1.0',
            objectCount: objects.length,
            selectedObjectId: this.selectedObjectId,
            objects
        };
    }

    /**
     * Clear all objects
     */
    clearAll() {
        for (const entryId of [...this.objects.keys()]) {
            this.removeObject(entryId);
        }
        this.selectedObjectId = null;
    }

    /**
     * Refresh catalog data (reload from server)
     * @returns {Promise<number>}
     */
    async refresh() {
        console.log('[DesktopObjectManager] Refreshing catalog...');

        // Refresh server-side catalog
        await this.bridge.refresh();

        // Reload
        return this.loadCatalog();
    }

    // ========================================
    // Private Event Handlers
    // ========================================

    /**
     * Handle object click
     * @private
     */
    _onObjectClicked(obj, data) {
        this.selectObject(obj.entryId);
    }

    /**
     * Handle object double-click
     * @private
     */
    _onObjectDoubleClicked(obj, data) {
        this.emit('object-double-clicked', { object: obj, entryId: obj.entryId });
    }

    /**
     * Handle boot request (from double-click)
     * @private
     */
    _onBootRequested(obj, data) {
        this.bootObject(obj.entryId);
    }

    /**
     * Handle object hover start
     * @private
     */
    _onObjectHover(obj, data) {
        this.emit('object-hover', { object: obj, entryId: obj.entryId });
    }

    /**
     * Handle object hover end
     * @private
     */
    _onObjectHoverEnd(obj, data) {
        this.emit('object-hover-end', { object: obj, entryId: obj.entryId });
    }

    /**
     * Handle drag start
     * @private
     */
    _handleDragStart(obj, data) {
        this.emit('object-drag-start', { object: obj, entryId: obj.entryId, data });
    }

    /**
     * Handle drag move - update spatial tracking
     * @private
     */
    _handleDragMove(obj, data) {
        // Update spatial index during drag (optional, for hit testing)
        this._updateSpatialIndex(obj.entryId, obj.x, obj.y);
    }

    /**
     * Handle drag end - persist position to catalog
     * @private
     */
    async _handleDragEnd(obj, data) {
        const { gridX, gridY, worldPos } = data;

        // Snap to grid position
        obj.x = gridX * DesktopObjectManager.GRID_SPACING.X;
        obj.y = gridY * DesktopObjectManager.GRID_SPACING.Y;

        // Update spatial index
        this._updateSpatialIndex(obj.entryId, obj.x, obj.y);

        // Persist to catalog via bridge
        if (this.bridge) {
            try {
                await this.bridge.updateLayout(obj.entryId, { gridX, gridY });
                console.log(`[DesktopObjectManager] Persisted layout for ${obj.entryId}: grid(${gridX}, ${gridY})`);
            } catch (error) {
                console.error(`[DesktopObjectManager] Failed to persist layout for ${obj.entryId}:`, error);
            }
        }

        this.emit('object-moved', { object: obj, entryId: obj.entryId, gridX, gridY, worldPos });
    }

    /**
     * Update spatial index for an object
     * @private
     * @param {string} entryId
     * @param {number} x - World X coordinate
     * @param {number} y - World Y coordinate
     */
    _updateSpatialIndex(entryId, x, y) {
        // Spatial index can be used for efficient hit testing
        // Currently just updating the object's internal grid position
        const obj = this.objects.get(entryId);
        if (obj) {
            obj.gridX = Math.round(x / DesktopObjectManager.GRID_SPACING.X);
            obj.gridY = Math.round(y / DesktopObjectManager.GRID_SPACING.Y);
        }
    }

    /**
     * Clean up resources
     */
    destroy() {
        // Stop all active status pollers
        for (const entryId of this._statusPollers.keys()) {
            this.stopStatusPolling(entryId);
        }

        this.clearAll();
        this.objectLayer.destroy();
        this.removeAllListeners();
    }
}

// ES6 module export
export { DesktopObjectManager };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.DesktopObjectManager = DesktopObjectManager;
}
