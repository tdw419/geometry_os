/**
 * DesktopObjectManager - Lifecycle manager for RTSDesktopObject instances
 *
 * Creates, tracks, and destroys desktop objects on the infinite canvas.
 * Coordinates with CatalogBridge for data and SpatialLayoutManager for positions.
 * Integrates with RemoteCatalogClient for loading remote catalog entries.
 *
 * Grid-to-world conversion: World X = grid.x * 160, World Y = grid.y * 200
 * Events: 'object-selected', 'object-booted', 'object-moved', 'remote-catalog-loaded'
 *
 * @module DesktopObjectManager
 */

import { RemoteCatalogClient } from './RemoteCatalogClient.js';
import { ServerRegistry } from './ServerRegistry.js';
import { RemoteBootFetcher } from './RemoteBootFetcher.js';

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

        // Remote catalog support
        this.remoteClient = new RemoteCatalogClient();
        this.serverRegistry = this.remoteClient.getRegistry();

        // Track which objects are from remote servers
        this._remoteEntryIds = new Set();

        // Store remote entries for retry lookup
        this._remoteEntries = [];

        // Track active downloads (entryId -> RemoteBootFetcher instance)
        this._activeDownloads = new Map();

        // Retry tracking per object
        this._retryState = new Map(); // entryId -> { attempts: number, maxAttempts: 3 }

        // Source filter state
        this._sourceFilter = 'all'; // 'all' | 'local' | 'remote'

        // Search filter state
        this._searchQuery = '';

        // Create dedicated layer for desktop objects
        this.objectLayer = new PIXI.Container();
        this.objectLayer.label = 'desktopObjectLayer';
        this.objectLayer.sortableChildren = true;
        this.worldContainer.addChild(this.objectLayer);

        // Selection state
        this.selectedObjectId = null;

        // Set up network status listeners for offline badge updates
        this._setupNetworkListeners();

        // Auto-load if enabled
        if (options.autoLoad !== false) {
            this.loadCatalog().catch(err => {
                console.warn('[DesktopObjectManager] Auto-load failed:', err);
            });
        }
    }

    /**
     * Load catalog data and create objects for all entries
     * Also loads remote catalogs after local catalog is loaded.
     * @returns {Promise<number>} Number of objects created
     */
    async loadCatalog() {
        console.log('[DesktopObjectManager] Loading catalog...');

        const catalog = await this.bridge.getCatalog();

        if (!catalog || !catalog.entries) {
            console.warn('[DesktopObjectManager] No catalog data received');
            return 0;
        }

        // Clear existing objects (but not remote ones yet - they'll be refreshed)
        this.clearAll();

        // Create objects for each local entry
        let created = 0;
        for (const entry of catalog.entries) {
            try {
                this.createObject(entry);
                created++;
            } catch (error) {
                console.error(`[DesktopObjectManager] Failed to create object for ${entry.id}:`, error);
            }
        }

        console.log(`[DesktopObjectManager] Created ${created} objects from local catalog`);
        this.emit('catalog-loaded', { count: created });

        // Load remote catalogs in background (non-blocking)
        this.loadRemoteCatalogs().catch(err => {
            console.warn('[DesktopObjectManager] Remote catalog load failed:', err);
        });

        return created;
    }

    /**
     * Load remote catalogs with stale-while-revalidate pattern
     *
     * Shows stale cached data immediately if available, then fetches
     * fresh data in the background and updates the UI.
     *
     * @returns {Promise<Object>} Result with entries and errors
     */
    async loadRemoteCatalogs() {
        console.log('[DesktopObjectManager] Loading remote catalogs...');

        // Show stale cached data immediately if available
        const cached = this.remoteClient.getAggregatedCatalog();
        if (cached.entries.length > 0) {
            console.log(`[DesktopObjectManager] Showing ${cached.entries.length} cached remote entries`);
            await this._createRemoteObjects(cached.entries);
        }

        // Fetch fresh data
        const result = await this.remoteClient.fetchAllCatalogs();

        // Sync UI with fresh data
        await this._syncRemoteObjects(result.entries);

        // Update server statuses based on errors
        if (result.errors && result.errors.length > 0) {
            for (const err of result.errors) {
                this.serverRegistry.setServerStatus(err.serverId, 'error', err.error);
                console.warn(`[DesktopObjectManager] Server ${err.serverName} error: ${err.error}`);
            }
        }

        console.log(`[DesktopObjectManager] Remote catalogs loaded: ${result.entries.length} entries, ${result.errors.length} errors`);
        this.emit('remote-catalog-loaded', {
            entries: result.entries.length,
            errors: result.errors.length
        });

        return result;
    }

    /**
     * Create objects for remote catalog entries
     * @param {Array<Object>} entries - Remote catalog entries
     * @private
     */
    async _createRemoteObjects(entries) {
        let created = 0;
        const cache = this.bridge?.cache;

        for (const entry of entries) {
            // Skip if already exists
            if (this.objects.has(entry.id)) {
                continue;
            }

            try {
                // Mark as remote entry
                entry._isRemote = true;
                this.createObject(entry);
                this._remoteEntryIds.add(entry.id);

                // Initialize offline availability badge
                const obj = this.objects.get(entry.id);
                if (obj && cache) {
                    const isOfflineCapable = await cache.isOfflineCapable(entry.id);
                    obj.setOfflineAvailable(isOfflineCapable);
                }

                created++;
            } catch (error) {
                console.error(`[DesktopObjectManager] Failed to create remote object for ${entry.id}:`, error);
            }
        }
        console.log(`[DesktopObjectManager] Created ${created} remote objects`);
    }

    /**
     * Sync remote objects with current entries (add/update/remove)
     * @param {Array<Object>} entries - Current remote catalog entries
     * @private
     */
    async _syncRemoteObjects(entries) {
        const currentRemoteIds = new Set(entries.map(e => e.id));
        const cache = this.bridge?.cache;

        // Store remote entries for retry lookup
        this._remoteEntries = entries;

        // Remove objects that no longer exist
        for (const entryId of [...this._remoteEntryIds]) {
            if (!currentRemoteIds.has(entryId)) {
                this.removeObject(entryId);
                this._remoteEntryIds.delete(entryId);
            }
        }

        // Add or update objects
        for (const entry of entries) {
            entry._isRemote = true;

            if (this.objects.has(entry.id)) {
                // Update existing object
                this.updateObject(entry);
            } else {
                // Create new object
                this.createObject(entry);
            }

            this._remoteEntryIds.add(entry.id);

            // Update offline availability badge
            const obj = this.objects.get(entry.id);
            if (obj && cache) {
                const isOfflineCapable = await cache.isOfflineCapable(entry.id);
                obj.setOfflineAvailable(isOfflineCapable);
            }
        }

        // Apply source filter after syncing remote objects
        this._applySourceFilter();

        console.log(`[DesktopObjectManager] Synced ${entries.length} remote objects`);
    }

    /**
     * Get the remote catalog client instance
     * @returns {RemoteCatalogClient}
     */
    getRemoteClient() {
        return this.remoteClient;
    }

    /**
     * Get the server registry instance
     * @returns {ServerRegistry}
     */
    getServerRegistry() {
        return this.serverRegistry;
    }

    /**
     * Check if an entry is from a remote server
     * @param {string} entryId - Entry ID to check
     * @returns {boolean}
     */
    isRemoteEntry(entryId) {
        return this._remoteEntryIds.has(entryId);
    }

    /**
     * Set the source filter and update object visibility
     * @param {string} filter - 'all' | 'local' | 'remote'
     */
    setSourceFilter(filter) {
        this._sourceFilter = filter;
        this._applySourceFilter();
        this.emit('filter-changed', { filter });
    }

    /**
     * Get the current source filter
     * @returns {string}
     */
    getSourceFilter() {
        return this._sourceFilter;
    }

    /**
     * Set the search query and update object visibility
     * @param {string} query - Search query (empty string shows all)
     */
    setSearchQuery(query) {
        this._searchQuery = query.toLowerCase().trim();
        this._applySourceFilter();
        this.emit('search-changed', { query });
    }

    /**
     * Get the current search query
     * @returns {string}
     */
    getSearchQuery() {
        return this._searchQuery;
    }

    /**
     * Check if an object matches the current search query
     * @param {RTSDesktopObject} obj - The object to check
     * @returns {boolean}
     * @private
     */
    _matchesSearch(obj) {
        if (!this._searchQuery) return true;

        // Get name from entry data
        const entry = obj.entryData || obj.entry;
        const name = (entry?.name || entry?.id || '').toLowerCase();
        return name.includes(this._searchQuery);
    }

    /**
     * Apply source filter to all objects
     * @private
     */
    _applySourceFilter() {
        for (const [entryId, obj] of this.objects) {
            this._applySourceFilterToObject(obj, entryId);
        }
    }

    /**
     * Apply source filter to a single object
     * @param {RTSDesktopObject} obj - The object to filter
     * @param {string} entryId - The entry ID
     * @private
     */
    _applySourceFilterToObject(obj, entryId) {
        const isRemote = this._remoteEntryIds.has(entryId);

        // Check source filter
        let passesSourceFilter = true;
        switch (this._sourceFilter) {
            case 'local':
                passesSourceFilter = !isRemote;
                break;
            case 'remote':
                passesSourceFilter = isRemote;
                break;
            case 'all':
            default:
                passesSourceFilter = true;
        }

        // Check search filter
        const passesSearch = this._matchesSearch(obj);

        // Object is visible only if it passes both filters
        obj.visible = passesSourceFilter && passesSearch;
    }

    /**
     * Get counts for filter UI
     * @returns {{local: number, remote: number, all: number}}
     */
    getFilterCounts() {
        const local = this.objects.size - this._remoteEntryIds.size;
        const remote = this._remoteEntryIds.size;
        return { local, remote, all: this.objects.size };
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

        // Apply source filter visibility
        this._applySourceFilterToObject(obj, entry.id);

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

        // Store boot config for error context
        obj._lastBootConfig = {
            memory: options.memory || '2G',
            cpus: options.cpus || 2,
            cmdline: options.cmdline
        };

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

        // Get previous status for transition detection
        const previousStatus = obj.getStatus();

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

        // Handle status transitions
        if (status.status === 'running' && previousStatus === 'booting') {
            // Boot completed successfully
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
            this.stopStatusPolling(entryId);
        } else if (status.status === 'error') {
            // Boot failed - capture context
            console.warn(`[DesktopObjectManager] Boot failed for ${entryId}: ${status.error_message}`);

            // Get boot config from last boot attempt
            const bootConfig = obj._lastBootConfig || {};

            obj.failBootProgress(status.error_message, {
                stage: this._estimateFailedStage(status),
                elapsedTime: status.uptime_seconds || 0,
                config: bootConfig
            });

            this.emit('boot-failed', {
                object: obj,
                entryId,
                status,
                error: status.error_message
            });
            this.stopStatusPolling(entryId);
        } else if (status.status === 'stopped') {
            // Process stopped
            this.stopStatusPolling(entryId);
        }

        // Store additional status info on object
        obj._statusInfo = status;

        this.emit('status-updated', { entryId, status, object: obj });
    }

    /**
     * Estimate which boot stage failed based on timing
     * @private
     * @param {Object} status - Status object with timing info
     * @returns {string} Stage label
     */
    _estimateFailedStage(status) {
        const elapsed = status.uptime_seconds || 0;

        if (elapsed < 5) {
            return 'Starting QEMU...';
        } else if (elapsed < 15) {
            return 'Loading kernel...';
        } else if (elapsed < 25) {
            return 'Initializing...';
        } else {
            return 'Ready';
        }
    }

    /**
     * Boot a remote container - download if not cached, then boot
     * Implements cache-first pattern with offline support
     * @private
     * @param {string} entryId - Entry ID to boot
     * @param {Object} entry - Catalog entry data
     */
    async _bootRemoteContainer(entryId, entry) {
        const obj = this.objects.get(entryId);
        if (!obj) {
            console.warn(`[DesktopObjectManager] Cannot boot non-existent remote object ${entryId}`);
            return;
        }

        // Check if already downloading
        if (this._activeDownloads.has(entryId)) {
            console.log(`[DesktopObjectManager] Download already in progress for ${entryId}`);
            return;
        }

        // Check if already cached and verified (offline capable)
        const cache = this.bridge?.cache;
        if (cache) {
            const isOfflineCapable = await cache.isOfflineCapable(entryId);
            if (isOfflineCapable) {
                // Boot from cache immediately
                console.log(`[DesktopObjectManager] Booting ${entryId} from cache (offline capable)`);
                await this._bootFromCache(entryId);

                // Check if cache is stale and revalidate in background
                const cachedEntry = await cache.get(entryId);
                if (cachedEntry && cache.isStale && cache.isStale(cachedEntry)) {
                    console.log(`[DesktopObjectManager] Cache stale for ${entryId}, revalidating in background`);
                    this._revalidateInBackground(entryId, cachedEntry, entry);
                }
                return;
            }

            // Check if entry exists but not verified
            const hasEntry = await cache.has(entryId);
            if (hasEntry) {
                console.log(`[DesktopObjectManager] Entry ${entryId} exists but not verified, verifying...`);
                // Entry exists - try to verify and boot
                const cachedEntry = await cache.get(entryId);
                if (cachedEntry && cachedEntry.data) {
                    // Re-verify the hash
                    if (cachedEntry.hash) {
                        const computedHash = await cache.computeHash(cachedEntry.data);
                        if (computedHash === cachedEntry.hash) {
                            // Verification passed, boot from cache
                            await cache.updateVerificationStatus(entryId, 'verified');
                            obj.setCacheStatus('verified');
                            obj.setOfflineAvailable(true);
                            await this._bootFromCache(entryId);
                            return;
                        }
                    }
                }
            }
        }

        // Not cached or not verified - need to download
        // Check if offline
        if (!navigator.onLine) {
            console.warn(`[DesktopObjectManager] Cannot download ${entryId} - offline and not cached`);
            obj.setStatus('error');
            obj.showError({
                message: 'Not cached - network required',
                stage: 'Offline',
                elapsedTime: 0,
                config: {}
            });
            return;
        }

        // Get download URL
        const downloadUrl = this._getRemoteDownloadUrl(entry);
        if (!downloadUrl) {
            console.error(`[DesktopObjectManager] No download URL for remote container ${entryId}`);
            obj.setStatus('error');
            return;
        }

        // Start download with progress
        console.log(`[DesktopObjectManager] Starting remote boot download for ${entryId}`);
        this._startRemoteDownload(entryId, downloadUrl, entry);
    }

    /**
     * Boot a container from cached data
     * @private
     * @param {string} entryId - Entry ID to boot
     */
    async _bootFromCache(entryId) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        const cache = this.bridge?.cache;
        if (!cache) {
            console.warn(`[DesktopObjectManager] No cache available for ${entryId}`);
            return;
        }

        const cached = await cache.get(entryId);
        if (cached && cached.data) {
            console.log(`[DesktopObjectManager] Booting ${entryId} from cache (${cached.data.byteLength} bytes)`);

            // Update last accessed
            obj.setOfflineAvailable(true);
            obj.setCacheStatus('verified');

            // Start boot with cached data
            await this._startBootWithData(entryId, cached.data);
        } else {
            console.warn(`[DesktopObjectManager] Cache entry ${entryId} has no data`);
        }
    }

    /**
     * Revalidate cache entry in background (non-blocking)
     * @private
     * @param {string} entryId - Entry ID to revalidate
     * @param {Object} cachedEntry - Current cached entry
     * @param {Object} entry - Catalog entry data
     */
    async _revalidateInBackground(entryId, cachedEntry, entry) {
        // Don't block - run async in background
        (async () => {
            try {
                const downloadUrl = this._getRemoteDownloadUrl(entry);
                if (!downloadUrl) {
                    console.log(`[DesktopObjectManager] No download URL for revalidation of ${entryId}`);
                    return;
                }

                // Check with ETag if available
                const headers = {};
                if (cachedEntry.etag) {
                    headers['If-None-Match'] = cachedEntry.etag;
                }

                const response = await fetch(downloadUrl, { method: 'HEAD', headers });

                if (response.status === 304) {
                    console.log(`[DesktopObjectManager] Cache still valid for ${entryId} (304)`);
                    // Update lastAccessed but don't re-download
                } else if (response.ok) {
                    const newEtag = response.headers.get('ETag');
                    if (newEtag && newEtag !== cachedEntry.etag) {
                        console.log(`[DesktopObjectManager] Update available for ${entryId} (new ETag)`);
                        // Emit event so UI can show update available indicator
                        this.emit('cache-update-available', {
                            entryId,
                            oldEtag: cachedEntry.etag,
                            newEtag
                        });
                    }
                }
            } catch (error) {
                // Silently fail - background revalidation shouldn't interrupt user
                console.log(`[DesktopObjectManager] Background revalidation failed for ${entryId}: ${error.message}`);
            }
        })();
    }

    /**
     * Set up network status listeners to update offline badges
     * @private
     */
    _setupNetworkListeners() {
        if (this._networkListenersSet) return;

        window.addEventListener('online', () => {
            console.log('[DesktopObjectManager] Network online - updating offline badges');
            this._updateOfflineBadges();
        });

        window.addEventListener('offline', () => {
            console.log('[DesktopObjectManager] Network offline - updating offline badges');
            this._updateOfflineBadges();
        });

        this._networkListenersSet = true;
    }

    /**
     * Update offline availability badges on all remote objects
     * @private
     */
    async _updateOfflineBadges() {
        const cache = this.bridge?.cache;
        if (!cache) return;

        for (const entryId of this._remoteEntryIds) {
            const obj = this.objects.get(entryId);
            if (obj) {
                const isOfflineCapable = await cache.isOfflineCapable(entryId);
                obj.setOfflineAvailable(isOfflineCapable);
            }
        }
    }

    /**
     * Get the download URL for a remote container
     * @private
     * @param {Object} entry - Catalog entry with sourceServerId
     * @returns {string|null} Download URL or null if unavailable
     */
    _getRemoteDownloadUrl(entry) {
        if (!entry.sourceServerId) {
            return null;
        }

        // Get server info from registry
        const server = this.serverRegistry.getServer(entry.sourceServerId);
        if (!server || !server.url) {
            console.warn(`[DesktopObjectManager] Server not found for ${entry.sourceServerId}`);
            return null;
        }

        // Construct download URL
        // Assumes server provides containers at /api/container/{id}/download
        const baseUrl = server.url.replace(/\/$/, '');
        return `${baseUrl}/api/container/${entry.id}/download`;
    }

    /**
     * Initiate remote boot - get download URL and start download
     * @private
     * @param {string} entryId - Entry ID
     * @param {Object} entry - Catalog entry data
     */
    async _initiateRemoteBoot(entryId, entry) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        // Get download URL
        const downloadUrl = this._getRemoteDownloadUrl(entry);
        if (!downloadUrl) {
            console.error(`[DesktopObjectManager] No download URL for remote container ${entryId}`);
            obj.setStatus('error');
            obj.showError({
                message: 'No download URL available',
                stage: 'Connecting',
                type: 'network',
                retryable: false
            });
            return;
        }

        // Start download with progress
        console.log(`[DesktopObjectManager] Initiating remote boot download for ${entryId}`);
        await this._startRemoteDownload(entryId, downloadUrl, entry);
    }

    /**
     * Start remote container download with progress tracking
     * Uses fetchWithRetry for automatic retry with exponential backoff
     * @private
     * @param {string} entryId - Entry ID
     * @param {string} url - Download URL
     * @param {Object} entry - Catalog entry data
     */
    async _startRemoteDownload(entryId, url, entry) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        // Create fetcher instance
        const fetcher = new RemoteBootFetcher({ timeout: 120000 }); // 2 minute timeout for large containers
        this._activeDownloads.set(entryId, fetcher);

        // Set downloading state on object
        obj.setDownloading(true);

        // Wire up cancel-download event
        const cancelHandler = (data) => {
            if (data.entryId === entryId) {
                this.cancelDownload(entryId);
            }
        };
        obj.once('cancel-download', cancelHandler);

        try {
            const result = await fetcher.fetchWithRetry(url, {
                expectedHash: entry.hash || null,  // Use hash from entry if available

                onProgress: (progress) => {
                    this._handleDownloadProgress(entryId, progress);
                },

                onComplete: (result) => {
                    this._handleDownloadComplete(entryId, result, entry);
                    obj.off('cancel-download', cancelHandler);
                },

                onError: (errorInfo) => {
                    this._handleDownloadError(entryId, errorInfo);
                    obj.off('cancel-download', cancelHandler);
                },

                onCancel: (cancelInfo) => {
                    console.log(`[DesktopObjectManager] Download cancelled for ${entryId}: ${cancelInfo.bytesLoaded} bytes`);
                    obj.off('cancel-download', cancelHandler);
                }
            }, {
                maxRetries: RemoteBootFetcher.MAX_RETRIES,

                onRetry: ({ attempt, delay, error }) => {
                    console.log(`[DesktopObjectManager] Auto-retry ${attempt} for ${entryId} after ${Math.round(delay)}ms`);

                    // Update retry state
                    const retryState = this._retryState.get(entryId) || { attempts: 0, maxAttempts: 3 };
                    retryState.attempts = attempt;
                    this._retryState.set(entryId, retryState);

                    // Show retrying status on object
                    obj.showDownloadRetrying(attempt, Math.round(delay / 1000));
                }
            });

            // Result is also returned directly
            if (result && result.data) {
                // Clear retry state on success
                this._clearRetryState(entryId);

                // Store in cache (if cache manager available)
                this._storeDownloadInCache(entryId, result.data, result.hash, entry);

                // Start boot after short delay (let verification status show)
                setTimeout(() => {
                    this._startBootWithData(entryId, result.data);
                }, 1500);
            }

        } catch (error) {
            console.error(`[DesktopObjectManager] Download error for ${entryId}:`, error);
            this._handleDownloadError(entryId, {
                error,
                type: 'network',
                message: error.message || 'Download failed',
                retryable: true
            });
        } finally {
            this._activeDownloads.delete(entryId);
            obj.setDownloading(false);
        }
    }

    /**
     * Handle download progress update
     * @private
     * @param {string} entryId - Entry ID being downloaded
     * @param {Object} progress - Progress info { loaded, total, percent, speed, timeRemaining }
     */
    _handleDownloadProgress(entryId, progress) {
        const obj = this.objects.get(entryId);
        if (obj) {
            obj.setDownloadProgress(progress);
        }
    }

    /**
     * Handle download completion
     * @private
     * @param {string} entryId - Entry ID that completed
     * @param {Object} result - Download result { data, hash, verified, expectedHash }
     * @param {Object} entry - Catalog entry data
     */
    _handleDownloadComplete(entryId, result, entry) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        console.log(`[DesktopObjectManager] Download complete for ${entryId}: verified=${result.verified}, hash=${result.hash?.substring(0, 12)}...`);

        // Clear retry state on success
        this._clearRetryState(entryId);

        // Show verification status
        obj.showVerificationStatus(result.verified, result.hash);

        // Clean up download state
        obj.setDownloading(false);
        this._activeDownloads.delete(entryId);

        // If verification failed, show error but don't boot
        if (!result.verified && result.expectedHash) {
            console.warn(`[DesktopObjectManager] Hash verification failed for ${entryId}`);
            obj.setStatus('error');
            obj.setOfflineAvailable(false);
            // Error details shown via cache status indicator
            return;
        }

        // Update offline availability badge
        if (result.verified) {
            obj.setOfflineAvailable(true);
        }

        // Store in cache and boot
        this._storeDownloadInCache(entryId, result.data, result.hash, entry);

        // Boot after delay to show verification success
        setTimeout(() => {
            this._startBootWithData(entryId, result.data);
        }, 1500);
    }

    /**
     * Handle download error
     * @private
     * @param {string} entryId - Entry ID that failed
     * @param {Object} errorInfo - Error information
     */
    _handleDownloadError(entryId, errorInfo) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        console.error(`[DesktopObjectManager] Download error for ${entryId}:`, errorInfo.message);

        // Clean up download state
        obj.setDownloading(false);
        this._activeDownloads.delete(entryId);

        // Get retry state
        const retryState = this._retryState.get(entryId) || { attempts: 0, maxAttempts: 3 };
        const canRetry = errorInfo.retryable && retryState.attempts < retryState.maxAttempts;

        // Show error with retry option
        obj.showError({
            message: errorInfo.message || 'Download failed',
            stage: errorInfo.stage || 'Downloading',
            elapsedTime: 0,
            config: {},
            type: errorInfo.type,
            httpStatus: errorInfo.httpStatus,
            retryable: canRetry,
            onRetry: canRetry ? () => this.retryDownload(entryId) : null
        });

        // Emit download failed event
        this.emit('download-failed', {
            entryId,
            error: errorInfo,
            canRetry
        });
    }

    /**
     * Store downloaded data in cache
     * @private
     * @param {string} entryId - Entry ID
     * @param {ArrayBuffer} data - Container data
     * @param {string} hash - Computed hash
     * @param {Object} entry - Catalog entry data
     */
    async _storeDownloadInCache(entryId, data, hash, entry) {
        // Check if cache manager is available
        if (window.catalogBridge?.cache) {
            try {
                await window.catalogBridge.cache.setContainerData(entryId, data, {
                    hash: hash,
                    size: data.byteLength,
                    metadata: {
                        name: entry.name,
                        sourceServerId: entry.sourceServerId
                    }
                });
                console.log(`[DesktopObjectManager] Cached ${entryId} (${data.byteLength} bytes)`);

                // Update cache status on object
                const obj = this.objects.get(entryId);
                if (obj) {
                    obj.setCacheStatus('verified');
                }
            } catch (e) {
                console.warn(`[DesktopObjectManager] Failed to cache ${entryId}:`, e);
            }
        }
    }

    /**
     * Start boot with container data (for remote containers)
     * @private
     * @param {string} entryId - Entry ID to boot
     * @param {ArrayBuffer} data - Container data
     */
    async _startBootWithData(entryId, data) {
        const obj = this.objects.get(entryId);
        if (!obj) return;

        // For remote containers, we need to pass data to the boot endpoint
        // This requires server support for receiving container data
        // For now, we use the standard boot flow (server may have cached it)
        console.log(`[DesktopObjectManager] Starting boot for ${entryId} with downloaded data`);

        // Update status
        obj.setStatus('booting');

        // Emit boot-ready event with data (for custom handling)
        this.emit('boot-ready', {
            entryId,
            data,
            entry: obj.entryData
        });

        // Try standard boot (server may have received data during download)
        try {
            await this.bootObject(entryId);
        } catch (error) {
            console.error(`[DesktopObjectManager] Boot failed for ${entryId}:`, error);
        }
    }

    /**
     * Cancel an active download
     * @param {string} entryId - Entry ID to cancel download for
     */
    cancelDownload(entryId) {
        const fetcher = this._activeDownloads.get(entryId);
        if (fetcher) {
            fetcher.cancel();
            this._activeDownloads.delete(entryId);

            const obj = this.objects.get(entryId);
            if (obj) {
                obj.setDownloading(false);
                obj.setStatus('idle');
                obj.hideProgress();
            }

            console.log(`[DesktopObjectManager] Cancelled download for ${entryId}`);
            this.emit('download-cancelled', { entryId });
        }
    }

    /**
     * Retry a failed download
     * @param {string} entryId - Entry ID to retry
     * @returns {Promise<boolean>} True if retry was initiated
     */
    async retryDownload(entryId) {
        const obj = this.objects.get(entryId);
        if (!obj) {
            console.warn(`[DesktopObjectManager] Cannot retry: object not found for ${entryId}`);
            return false;
        }

        // Get current retry state
        const retryState = this._retryState.get(entryId) || { attempts: 0, maxAttempts: 3 };

        if (retryState.attempts >= retryState.maxAttempts) {
            console.log(`[DesktopObjectManager] Max retries (${retryState.maxAttempts}) reached for ${entryId}`);
            return false;
        }

        // Get remote entry info
        const remoteEntry = this._remoteEntries?.find(e => e.id === entryId);
        if (!remoteEntry) {
            console.warn(`[DesktopObjectManager] Cannot retry: no remote entry for ${entryId}`);
            return false;
        }

        // Clear error state and restart download
        obj.hideError(); // Clear error

        // Increment retry count
        retryState.attempts++;
        this._retryState.set(entryId, retryState);

        console.log(`[DesktopObjectManager] Manual retry ${retryState.attempts}/${retryState.maxAttempts} for ${entryId}`);

        // Re-initiate download
        await this._initiateRemoteBoot(entryId, remoteEntry);

        return true;
    }

    /**
     * Get retry state for an entry
     * @param {string} entryId - Entry ID
     * @returns {Object} Retry state { attempts, maxAttempts }
     */
    getRetryState(entryId) {
        return this._retryState.get(entryId) || { attempts: 0, maxAttempts: 3 };
    }

    /**
     * Clear retry state for an entry (called on success)
     * @param {string} entryId - Entry ID
     * @private
     */
    _clearRetryState(entryId) {
        this._retryState.delete(entryId);
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
        const entryId = obj.entryId;

        // Check if this is a remote container
        if (this._remoteEntryIds.has(entryId)) {
            this._bootRemoteContainer(entryId, obj.entryData);
        } else {
            this.bootObject(entryId);
        }
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
