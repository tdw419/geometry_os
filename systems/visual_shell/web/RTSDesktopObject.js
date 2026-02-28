/**
 * RTSDesktopObject - Visual representation of a .rts.png container on the desktop
 *
 * Displays container thumbnail, name, and status as an interactive sprite
 * on the infinite canvas. Users can click to select, double-click to boot.
 *
 * Visual design:
 * - Thumbnail: 128x128 pixels (scaled from 256x256 API thumbnail)
 * - Name label: below thumbnail, max 2 lines, centered, white text
 * - Status indicator: 12px circle in top-right
 * - Background: dark semi-transparent (0x1a1a1a, 0.9 alpha)
 * - Hover: cyan border (0x00ffff, 2px)
 * - Total size: approximately 140x180 pixels
 *
 * @module RTSDesktopObject
 */

class RTSDesktopObject extends PIXI.Container {
    /**
     * Status colors for the indicator
     * @static
     */
    static STATUS_COLORS = {
        idle: 0x888888,      // Gray
        booting: 0xffff00,   // Yellow
        running: 0x00ff00,   // Green
        error: 0xff0000,     // Red
        stopped: 0x666666,   // Dark gray
        unknown: 0x444444,   // Darker gray
        downloading: 0x00aaff, // Cyan for downloading
        retrying: 0xffaa00   // Orange for retrying
    };

    /**
     * Cache verification status colors for the cache indicator
     * @static
     */
    static CACHE_STATUS_COLORS = {
        verified: 0x00ff00,  // Green - hash verified successfully
        failed: 0xff0000,    // Red - hash verification failed
        pending: 0xffa500,   // Orange - verification in progress
        uncached: 0x666666   // Gray - not in cache
    };

    /**
     * Boot stages with labels and timing percentages
     * @static
     */
    static BOOT_STAGES = {
        STARTING: { label: 'Starting QEMU...', startPercent: 0, endPercent: 25 },
        LOADING: { label: 'Loading kernel...', startPercent: 25, endPercent: 60 },
        INITIALIZING: { label: 'Initializing...', startPercent: 60, endPercent: 90 },
        READY: { label: 'Ready', startPercent: 90, endPercent: 100 }
    };

    /**
     * Download stages with labels
     * @static
     */
    static DOWNLOAD_STAGES = {
        CONNECTING: { label: 'Connecting...', percent: 0 },
        DOWNLOADING: { label: 'Downloading...', percent: 1 },
        VERIFYING: { label: 'Verifying...', percent: 95 },
        COMPLETE: { label: 'Complete', percent: 100 }
    };

    /**
     * Progress bar dimensions
     * @static
     */
    static PROGRESS = {
        BAR_HEIGHT: 4,
        BAR_PADDING: 2,
        BACKGROUND_COLOR: 0x333333,
        FILL_COLOR: 0x00aaff,
        TEXT_COLOR: 0xffffff,
        TIMEOUT_MS: 30000  // 30 second boot timeout
    };

    /**
     * Error guidance messages for common failure modes
     * Maps error patterns to actionable suggestions
     * @static
     */
    static ERROR_GUIDANCE = {
        timeout: {
            pattern: /timeout|timed out|30 seconds/i,
            guidance: 'Boot took too long. Try increasing memory or use a lighter kernel.',
            action: 'Increase memory allocation or check kernel compatibility.',
            category: 'TIMEOUT'
        },
        network: {
            pattern: /network|connection|fetch|failed to fetch|ECONNREFUSED|ENOTFOUND|offline|unreachable/i,
            guidance: 'Network connection failed. Check your internet connection.',
            action: 'Check network connection and try again.',
            category: 'NETWORK'
        },
        notfound: {
            pattern: /not found|404|does not exist|no such file/i,
            guidance: 'Container not found. It may have been removed.',
            action: 'Refresh catalog to get latest container list.',
            category: 'NOT FOUND'
        },
        memory: {
            pattern: /memory|oom|out of memory|cannot allocate/i,
            guidance: 'Insufficient memory for boot. Increase memory allocation.',
            action: 'Increase memory to at least 2G for most distributions.',
            category: 'MEMORY'
        },
        kernel: {
            pattern: /kernel|vmlinuz|bzImage|boot failed/i,
            guidance: 'Kernel failed to load. Check kernel compatibility.',
            action: 'Verify the kernel is compatible with this architecture.',
            category: 'KERNEL'
        },
        fuse: {
            pattern: /fuse|mount|failed to mount/i,
            guidance: 'FUSE mount failed. Check if FUSE is installed.',
            action: 'Ensure fuse3 or fuse is installed: sudo apt install fuse3',
            category: 'MOUNT'
        },
        qemu: {
            pattern: /qemu|kvm|accelerator|hv_error/i,
            guidance: 'QEMU or KVM error. Check virtualization support.',
            action: 'Enable virtualization in BIOS or install qemu-system-x86',
            category: 'QEMU'
        },
        permission: {
            pattern: /permission|denied|access|eacces/i,
            guidance: 'Permission denied. Check file permissions.',
            action: 'Ensure the .rts.png file is readable and executable.',
            category: 'PERMISSION'
        },
        hash: {
            pattern: /hash|checksum|verification failed|integrity/i,
            guidance: 'Container verification failed. File may be corrupted.',
            action: 'Clear cache and re-download the container.',
            category: 'VERIFICATION'
        },
        default: {
            pattern: /.*/,
            guidance: 'Boot failed. Check logs for details.',
            action: 'Try different boot options or check system compatibility.',
            category: 'ERROR'
        }
    };

    /**
     * Error category badge colors
     * @static
     */
    static ERROR_CATEGORY_COLORS = {
        'TIMEOUT': 0xffaa00,     // Orange
        'NETWORK': 0xff6600,     // Darker orange
        'NOT FOUND': 0x888888,   // Gray
        'MEMORY': 0xff4444,      // Light red
        'KERNEL': 0xff00ff,      // Magenta
        'MOUNT': 0x00aaff,       // Cyan
        'QEMU': 0xff0088,        // Pink
        'PERMISSION': 0xffff00,  // Yellow
        'VERIFICATION': 0xaa44ff,// Purple
        'ERROR': 0xff0000        // Red
    };

    /**
     * Dimensions for the object
     * @static
     */
    static DIMENSIONS = {
        THUMBNAIL_SIZE: 128,
        OBJECT_WIDTH: 140,
        OBJECT_HEIGHT: 180,
        PADDING: 6,
        STATUS_INDICATOR_SIZE: 12,
        BORDER_WIDTH: 2
    };

    /**
     * Server source badge configuration
     * @static
     */
    static SERVER_BADGE = {
        SIZE: 8,           // Small colored dot
        OFFSET_X: 4,       // From left edge
        OFFSET_Y: 4        // From top edge
    };

    /**
     * Offline availability badge configuration
     * @static
     */
    static OFFLINE_BADGE = {
        SIZE: 6,              // Small indicator
        OFFSET_X: 4,          // Bottom-left corner
        OFFSET_Y: -10,        // Below the name label
        COLOR_AVAILABLE: 0x00ff00,  // Green - cached and available offline
        COLOR_UNAVAILABLE: 0x666666 // Gray - not cached, network required
    };

    /**
     * PXE boot availability badge configuration
     * @static
     */
    static PXE_BADGE = {
        SIZE: 6,
        OFFSET_X: 14,         // Next to offline badge
        OFFSET_Y: -10,        // Same Y as offline badge
        COLOR_ENABLED: 0xff6600,   // Orange - PXE available
        COLOR_DISABLED: 0x666666  // Gray - not available
    };

    /**
     * Create an RTSDesktopObject instance
     * @param {Object} entry - Catalog entry data
     * @param {string} entry.id - Unique entry ID
     * @param {string} entry.name - Display name
     * @param {string} entry.thumbnail - Base64 thumbnail data (optional)
     * @param {string} entry.status - Current status (idle, booting, running, error)
     * @param {Object} entry.layout - Layout position { gridX, gridY }
     * @param {Object} options - Configuration options
     */
    constructor(entry, options = {}) {
        super();

        this.entryId = entry.id;
        this.entryData = entry;
        this.options = options;
        this._highlighted = false;
        this._status = entry.status || 'unknown';
        this._cacheStatus = 'uncached';  // Cache verification status

        // Drag state
        this.dragging = false;
        this.dragData = null;
        this.dragOffset = { x: 0, y: 0 };

        // Pulse animation state
        this._pulseActive = false;
        this._pulseTime = 0;

        // Progress tracking state
        this._progressPercent = 0;
        this._progressStage = null;
        this._bootStartTime = null;
        this._progressAnimationId = null;

        // Download tracking state
        this._isDownloading = false;
        this._downloadProgress = null; // { loaded, total, percent, speed, timeRemaining }

        // PXE boot availability state
        this._pxeEnabled = false;

        // Set up interactivity
        this.eventMode = 'static';
        this.cursor = 'pointer';

        // Calculate position from grid if layout exists
        if (entry.layout) {
            this.gridX = entry.layout.gridX || 0;
            this.gridY = entry.layout.gridY || 0;
        } else if (entry.position) {
            // Fallback: handle server's position.{x,y} format
            this.gridX = entry.position.x || 0;
            this.gridY = entry.position.y || 0;
        } else {
            this.gridX = 0;
            this.gridY = 0;
        }

        // Build the visual components
        this._createBackground();
        this._createThumbnail(entry.thumbnail);
        this._createNameLabel(entry.name || entry.id);
        this._createStatusIndicator();
        this._createCacheStatusIndicator();
        this._createServerSourceBadge(entry);
        this._createOfflineBadge(entry);
        this._createPXEBadge(entry);
        this._createProgressBar();
        this._createErrorOverlay();
        this._createBorder();

        // Set up event handlers
        this._setupEventHandlers();

        // Set initial status
        this.setStatus(this._status);
    }

    /**
     * Create the background graphics
     * @private
     */
    _createBackground() {
        const { OBJECT_WIDTH, OBJECT_HEIGHT } = RTSDesktopObject.DIMENSIONS;

        this.background = new PIXI.Graphics();
        this.background.rect(0, 0, OBJECT_WIDTH, OBJECT_HEIGHT);
        this.background.fill({ color: 0x1a1a1a, alpha: 0.9 });
        this.addChild(this.background);
    }

    /**
     * Create the thumbnail sprite
     * @private
     * @param {string} thumbnailData - Base64 thumbnail data
     */
    _createThumbnail(thumbnailData) {
        const { THUMBNAIL_SIZE, OBJECT_WIDTH, PADDING } = RTSDesktopObject.DIMENSIONS;

        // Create thumbnail container
        this.thumbnailContainer = new PIXI.Container();
        this.thumbnailContainer.x = (OBJECT_WIDTH - THUMBNAIL_SIZE) / 2;
        this.thumbnailContainer.y = PADDING + 4;
        this.addChild(this.thumbnailContainer);

        // Placeholder while loading
        this.thumbnailPlaceholder = new PIXI.Graphics();
        this.thumbnailPlaceholder.rect(0, 0, THUMBNAIL_SIZE, THUMBNAIL_SIZE);
        this.thumbnailPlaceholder.fill({ color: 0x333333, alpha: 1 });
        this.thumbnailPlaceholder.rect(1, 1, THUMBNAIL_SIZE - 2, THUMBNAIL_SIZE - 2);
        this.thumbnailPlaceholder.stroke({ color: 0x555555, width: 1 });
        this.thumbnailContainer.addChild(this.thumbnailPlaceholder);

        // Load thumbnail if provided
        if (thumbnailData) {
            this._loadThumbnail(thumbnailData);
        }
    }

    /**
     * Load a thumbnail from base64 data
     * @private
     * @param {string} base64Data - Base64 encoded image data
     */
    _loadThumbnail(base64Data) {
        const { THUMBNAIL_SIZE } = RTSDesktopObject.DIMENSIONS;

        try {
            // Handle both data URL and raw base64
            const dataUrl = base64Data.startsWith('data:')
                ? base64Data
                : `data:image/png;base64,${base64Data}`;

            const texture = PIXI.Texture.from(dataUrl);

            if (this.thumbnailSprite) {
                this.thumbnailSprite.destroy();
            }

            this.thumbnailSprite = new PIXI.Sprite(texture);
            this.thumbnailSprite.width = THUMBNAIL_SIZE;
            this.thumbnailSprite.height = THUMBNAIL_SIZE;

            // Hide placeholder, show sprite
            this.thumbnailPlaceholder.visible = false;
            this.thumbnailContainer.addChild(this.thumbnailSprite);

        } catch (error) {
            console.warn(`[RTSDesktopObject] Failed to load thumbnail for ${this.entryId}:`, error);
        }
    }

    /**
     * Create the name label below the thumbnail
     * @private
     * @param {string} name - Display name
     */
    _createNameLabel(name) {
        const { OBJECT_WIDTH, THUMBNAIL_SIZE, PADDING } = RTSDesktopObject.DIMENSIONS;

        // Truncate long names
        let displayName = name;
        if (displayName.length > 18) {
            displayName = displayName.substring(0, 15) + '...';
        }

        this.nameLabel = new PIXI.Text({
            text: displayName,
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 11,
                fill: 0xffffff,
                align: 'center',
                wordWrap: true,
                wordWrapWidth: OBJECT_WIDTH - 8,
                lineHeight: 14
            }
        });

        this.nameLabel.x = OBJECT_WIDTH / 2;
        this.nameLabel.y = PADDING + THUMBNAIL_SIZE + 8;
        this.nameLabel.anchor.set(0.5, 0);
        this.addChild(this.nameLabel);
    }

    /**
     * Create the status indicator circle
     * @private
     */
    _createStatusIndicator() {
        const { OBJECT_WIDTH, PADDING, STATUS_INDICATOR_SIZE } = RTSDesktopObject.DIMENSIONS;

        this.statusIndicator = new PIXI.Graphics();
        this.statusIndicator.x = OBJECT_WIDTH - PADDING - STATUS_INDICATOR_SIZE - 2;
        this.statusIndicator.y = PADDING + 6;

        // Draw initial circle (will be updated by setStatus)
        this._drawStatusCircle(RTSDesktopObject.STATUS_COLORS.unknown);

        this.addChild(this.statusIndicator);
    }

    /**
     * Draw the status indicator circle
     * @private
     * @param {number} color - Fill color
     */
    _drawStatusCircle(color) {
        const { STATUS_INDICATOR_SIZE } = RTSDesktopObject.DIMENSIONS;
        const radius = STATUS_INDICATOR_SIZE / 2;

        this.statusIndicator.clear();
        this.statusIndicator.circle(radius, radius, radius);
        this.statusIndicator.fill({ color: color, alpha: 1 });

        // Add subtle border
        this.statusIndicator.circle(radius, radius, radius);
        this.statusIndicator.stroke({ color: 0x000000, width: 1 });
    }

    /**
     * Create the cache status indicator circle
     * Positioned below the main status indicator
     * @private
     */
    _createCacheStatusIndicator() {
        const { OBJECT_WIDTH, PADDING, STATUS_INDICATOR_SIZE } = RTSDesktopObject.DIMENSIONS;

        this.cacheStatusIndicator = new PIXI.Graphics();
        this.cacheStatusIndicator.x = OBJECT_WIDTH - PADDING - STATUS_INDICATOR_SIZE - 2;
        this.cacheStatusIndicator.y = PADDING + 6 + STATUS_INDICATOR_SIZE + 4;  // Below main status

        // Draw initial circle (uncached by default)
        this._drawCacheStatusCircle(RTSDesktopObject.CACHE_STATUS_COLORS.uncached);

        // Hidden by default - shown only when container is cached
        this.cacheStatusIndicator.visible = false;

        this.addChild(this.cacheStatusIndicator);

        // Create tooltip (hidden by default)
        this.cacheStatusTooltip = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 10,
                fill: 0xffffff,
                align: 'left',
                backgroundColor: 0x333333,
                padding: 4
            }
        });
        this.cacheStatusTooltip.visible = false;
        this.cacheStatusTooltip.x = OBJECT_WIDTH - PADDING - STATUS_INDICATOR_SIZE - 60;  // Left of indicator
        this.cacheStatusTooltip.y = PADDING + 6 + STATUS_INDICATOR_SIZE + 4;
        this.addChild(this.cacheStatusTooltip);
    }

    /**
     * Draw the cache status indicator circle
     * @private
     * @param {number} color - Fill color
     */
    _drawCacheStatusCircle(color) {
        const { STATUS_INDICATOR_SIZE } = RTSDesktopObject.DIMENSIONS;
        const radius = (STATUS_INDICATOR_SIZE - 2) / 2;  // Slightly smaller than main status

        this.cacheStatusIndicator.clear();
        this.cacheStatusIndicator.circle(radius, radius, radius);
        this.cacheStatusIndicator.fill({ color: color, alpha: 1 });

        // Add subtle border
        this.cacheStatusIndicator.circle(radius, radius, radius);
        this.cacheStatusIndicator.stroke({ color: 0x000000, width: 1 });
    }

    /**
     * Set the cache verification status
     * @param {string} status - Cache status (verified, failed, pending, uncached)
     */
    setCacheStatus(status) {
        this._cacheStatus = status;
        const color = RTSDesktopObject.CACHE_STATUS_COLORS[status] || RTSDesktopObject.CACHE_STATUS_COLORS.uncached;
        this._drawCacheStatusCircle(color);

        // Show indicator only for cached containers (not 'uncached')
        this.cacheStatusIndicator.visible = (status !== 'uncached');

        // Update tooltip text based on status
        const tooltipTexts = {
            verified: 'Cache: Verified',
            failed: 'Cache: FAILED',
            pending: 'Cache: Pending...',
            uncached: ''
        };
        this.cacheStatusTooltip.text = tooltipTexts[status] || '';
    }

    /**
     * Get the current cache verification status
     * @returns {string} Cache status
     */
    getCacheStatus() {
        return this._cacheStatus;
    }

    /**
     * Create the server source badge indicator
     * Small colored circle in top-left corner indicating which server
     * the container comes from. Hidden for local containers.
     * @private
     * @param {Object} entry - Catalog entry with optional sourceServerId
     */
    _createServerSourceBadge(entry) {
        const { SIZE, OFFSET_X, OFFSET_Y } = RTSDesktopObject.SERVER_BADGE;

        // Store server source info
        this._serverSourceId = entry.sourceServerId || null;
        this._serverSourceName = entry.sourceServerName || null;
        this._serverSourceColor = entry.sourceServerColor || '#888888';

        // Create badge graphics
        this.serverSourceBadge = new PIXI.Graphics();
        this.serverSourceBadge.x = OFFSET_X;
        this.serverSourceBadge.y = OFFSET_Y;

        // Draw initial badge (will be updated)
        this._drawServerSourceBadge(this._serverSourceColor);

        // Hide badge for local containers (no sourceServerId)
        this.serverSourceBadge.visible = !!entry.sourceServerId;

        this.addChild(this.serverSourceBadge);

        // Create tooltip for server name (hidden by default)
        this.serverSourceTooltip = new PIXI.Text({
            text: this._serverSourceName || '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 10,
                fill: 0xffffff,
                align: 'left',
                backgroundColor: 0x333333,
                padding: 4
            }
        });
        this.serverSourceTooltip.visible = false;
        this.serverSourceTooltip.x = OFFSET_X + SIZE + 4;  // Right of badge
        this.serverSourceTooltip.y = OFFSET_Y - 2;
        this.addChild(this.serverSourceTooltip);
    }

    /**
     * Draw the server source badge circle
     * @private
     * @param {string} color - Hex color string (e.g., '#00aaff')
     */
    _drawServerSourceBadge(color) {
        const { SIZE } = RTSDesktopObject.SERVER_BADGE;
        const radius = SIZE / 2;

        // Convert hex string to number
        let colorNum = 0x888888;
        if (color && color.startsWith('#')) {
            colorNum = parseInt(color.slice(1), 16);
        } else if (typeof color === 'number') {
            colorNum = color;
        }

        this.serverSourceBadge.clear();
        this.serverSourceBadge.circle(radius, radius, radius);
        this.serverSourceBadge.fill({ color: colorNum, alpha: 1 });

        // Add subtle border
        this.serverSourceBadge.circle(radius, radius, radius);
        this.serverSourceBadge.stroke({ color: 0x000000, width: 1 });
    }

    /**
     * Set the server source for this object
     * @param {string} serverId - Server ID (null for local containers)
     * @param {string} serverName - Display name for the server
     * @param {string} color - Hex color for the badge
     */
    setServerSource(serverId, serverName, color) {
        this._serverSourceId = serverId;
        this._serverSourceName = serverName;
        this._serverSourceColor = color || '#888888';

        // Update badge
        this._drawServerSourceBadge(this._serverSourceColor);
        this.serverSourceBadge.visible = !!serverId;

        // Update tooltip
        this.serverSourceTooltip.text = serverName || '';
    }

    /**
     * Get the server source info
     * @returns {Object} { serverId, serverName, color }
     */
    getServerSource() {
        return {
            serverId: this._serverSourceId,
            serverName: this._serverSourceName,
            color: this._serverSourceColor
        };
    }

    /**
     * Create the offline availability badge indicator
     * Small colored circle in bottom-left corner indicating if container
     * is available offline. Only visible for remote containers.
     * @private
     * @param {Object} entry - Catalog entry with optional sourceServerId
     */
    _createOfflineBadge(entry) {
        const { SIZE, OFFSET_X, OFFSET_Y } = RTSDesktopObject.OFFLINE_BADGE;
        const { OBJECT_HEIGHT } = RTSDesktopObject.DIMENSIONS;

        // Track if this is a remote container
        this._isRemote = !!entry.sourceServerId;
        this._offlineAvailable = false;

        // Create badge graphics
        this.offlineBadge = new PIXI.Graphics();
        this.offlineBadge.x = OFFSET_X;
        this.offlineBadge.y = OBJECT_HEIGHT + OFFSET_Y;

        // Draw initial badge (gray = unavailable)
        this._drawOfflineBadge(false);

        // Hide badge for local containers (always available)
        this.offlineBadge.visible = this._isRemote;

        this.addChild(this.offlineBadge);

        // Create tooltip for offline availability (hidden by default)
        this.offlineBadgeTooltip = new PIXI.Text({
            text: 'Network required',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 10,
                fill: 0xffffff,
                align: 'left',
                backgroundColor: 0x333333,
                padding: 4
            }
        });
        this.offlineBadgeTooltip.visible = false;
        this.offlineBadgeTooltip.x = OFFSET_X + SIZE + 4;  // Right of badge
        this.offlineBadgeTooltip.y = OBJECT_HEIGHT + OFFSET_Y - 2;
        this.addChild(this.offlineBadgeTooltip);
    }

    /**
     * Draw the offline availability badge circle
     * @private
     * @param {boolean} available - Whether container is available offline
     */
    _drawOfflineBadge(available) {
        const { SIZE, COLOR_AVAILABLE, COLOR_UNAVAILABLE } = RTSDesktopObject.OFFLINE_BADGE;
        const radius = SIZE / 2;

        const color = available ? COLOR_AVAILABLE : COLOR_UNAVAILABLE;

        this.offlineBadge.clear();
        this.offlineBadge.circle(radius, radius, radius);
        this.offlineBadge.fill({ color: color, alpha: 1 });

        // Add subtle border
        this.offlineBadge.circle(radius, radius, radius);
        this.offlineBadge.stroke({ color: 0x000000, width: 1 });
    }

    /**
     * Set the offline availability status for this object
     * @param {boolean} available - Whether container is available offline
     */
    setOfflineAvailable(available) {
        this._offlineAvailable = available;
        this._drawOfflineBadge(available);

        // Update tooltip text based on availability
        this.offlineBadgeTooltip.text = available ? 'Available offline' : 'Network required';

        // Badge visibility is controlled by _isRemote (set during creation)
    }

    /**
     * Get the offline availability status
     * @returns {boolean} Whether container is available offline
     */
    getOfflineAvailable() {
        return this._offlineAvailable;
    }

    /**
     * Check if this is a remote container
     * @returns {boolean}
     */
    isRemote() {
        return this._isRemote;
    }

    /**
     * Create the PXE boot availability badge indicator
     * Small colored circle next to offline badge indicating if container
     * is available for PXE network boot.
     * @private
     * @param {Object} entry - Catalog entry with optional pxe_enabled field
     */
    _createPXEBadge(entry) {
        const { SIZE, OFFSET_X, OFFSET_Y } = RTSDesktopObject.PXE_BADGE;
        const { OBJECT_HEIGHT } = RTSDesktopObject.DIMENSIONS;

        // Initialize PXE state from entry data
        this._pxeEnabled = entry.pxe_enabled || false;

        // Create badge graphics
        this.pxeBadge = new PIXI.Graphics();
        this.pxeBadge.x = OFFSET_X;
        this.pxeBadge.y = OBJECT_HEIGHT + OFFSET_Y;

        // Draw initial badge based on entry data
        this._drawPXEBadge(this._pxeEnabled);

        // Hidden by default - shown when pxe_enabled is true
        this.pxeBadge.visible = this._pxeEnabled;

        this.addChild(this.pxeBadge);

        // Create tooltip for PXE availability (hidden by default)
        this.pxeBadgeTooltip = new PIXI.Text({
            text: 'PXE boot available',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 10,
                fill: 0xffffff,
                align: 'left',
                backgroundColor: 0x333333,
                padding: 4
            }
        });
        this.pxeBadgeTooltip.visible = false;
        this.pxeBadgeTooltip.x = OFFSET_X + SIZE + 4;  // Right of badge
        this.pxeBadgeTooltip.y = OBJECT_HEIGHT + OFFSET_Y - 2;
        this.addChild(this.pxeBadgeTooltip);
    }

    /**
     * Draw the PXE availability badge circle
     * @private
     * @param {boolean} enabled - Whether PXE boot is enabled
     */
    _drawPXEBadge(enabled) {
        const { SIZE, COLOR_ENABLED, COLOR_DISABLED } = RTSDesktopObject.PXE_BADGE;
        const radius = SIZE / 2;

        const color = enabled ? COLOR_ENABLED : COLOR_DISABLED;

        this.pxeBadge.clear();
        this.pxeBadge.circle(radius, radius, radius);
        this.pxeBadge.fill({ color: color, alpha: 1 });

        // Add subtle border
        this.pxeBadge.circle(radius, radius, radius);
        this.pxeBadge.stroke({ color: 0x000000, width: 1 });
    }

    /**
     * Set the PXE boot availability status for this object
     * @param {boolean} enabled - Whether PXE boot is available
     */
    setPXEEnabled(enabled) {
        this._pxeEnabled = enabled;
        this._drawPXEBadge(enabled);
        this.pxeBadge.visible = enabled;

        // Update tooltip text
        this.pxeBadgeTooltip.text = enabled ? 'PXE boot available' : 'PXE disabled';
    }

    /**
     * Get the PXE boot availability status
     * @returns {boolean} Whether PXE boot is enabled
     */
    getPXEEnabled() {
        return this._pxeEnabled;
    }

    /**
     * Create the progress bar overlay
     * @private
     */
    _createProgressBar() {
        const { THUMBNAIL_SIZE, OBJECT_WIDTH, PADDING } = RTSDesktopObject.DIMENSIONS;
        const { BAR_HEIGHT, BAR_PADDING, BACKGROUND_COLOR, TEXT_COLOR } = RTSDesktopObject.PROGRESS;

        // Progress bar container (hidden by default)
        this.progressContainer = new PIXI.Container();
        this.progressContainer.visible = false;
        this.progressContainer.x = (OBJECT_WIDTH - THUMBNAIL_SIZE) / 2;
        this.progressContainer.y = PADDING + 4 + THUMBNAIL_SIZE - BAR_HEIGHT - BAR_PADDING;
        this.addChild(this.progressContainer);

        // Background bar
        this.progressBackground = new PIXI.Graphics();
        this.progressBackground.rect(0, 0, THUMBNAIL_SIZE, BAR_HEIGHT);
        this.progressBackground.fill({ color: BACKGROUND_COLOR, alpha: 0.8 });
        this.progressContainer.addChild(this.progressBackground);

        // Fill bar (width updated based on progress)
        this.progressFill = new PIXI.Graphics();
        this.progressContainer.addChild(this.progressFill);

        // Stage label text
        this.progressLabel = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 9,
                fill: TEXT_COLOR,
                align: 'center'
            }
        });
        this.progressLabel.x = THUMBNAIL_SIZE / 2;
        this.progressLabel.y = -14;  // Above the bar
        this.progressLabel.anchor.set(0.5, 0);
        this.progressContainer.addChild(this.progressLabel);

        // Download speed label (smaller font, below bar)
        this.downloadSpeedLabel = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 8,
                fill: 0xaaddff,  // Light blue
                align: 'center'
            }
        });
        this.downloadSpeedLabel.x = THUMBNAIL_SIZE / 2;
        this.downloadSpeedLabel.y = BAR_HEIGHT + 2;  // Below the bar
        this.downloadSpeedLabel.anchor.set(0.5, 0);
        this.downloadSpeedLabel.visible = false;  // Hidden by default
        this.progressContainer.addChild(this.downloadSpeedLabel);

        // Download time remaining label
        this.downloadTimeLabel = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 8,
                fill: 0xaaddff,  // Light blue
                align: 'center'
            }
        });
        this.downloadTimeLabel.x = THUMBNAIL_SIZE / 2;
        this.downloadTimeLabel.y = BAR_HEIGHT + 12;  // Below speed label
        this.downloadTimeLabel.anchor.set(0.5, 0);
        this.downloadTimeLabel.visible = false;  // Hidden by default
        this.progressContainer.addChild(this.downloadTimeLabel);
    }

    /**
     * Create the error overlay container
     * @private
     */
    _createErrorOverlay() {
        const { THUMBNAIL_SIZE, OBJECT_WIDTH, PADDING } = RTSDesktopObject.DIMENSIONS;

        // Error overlay container (hidden by default)
        this.errorContainer = new PIXI.Container();
        this.errorContainer.visible = false;
        this.errorContainer.x = (OBJECT_WIDTH - THUMBNAIL_SIZE) / 2;
        this.errorContainer.y = PADDING + 4;
        this.addChild(this.errorContainer);

        // Semi-transparent red background
        this.errorBackground = new PIXI.Graphics();
        this.errorBackground.rect(0, 0, THUMBNAIL_SIZE, THUMBNAIL_SIZE);
        this.errorBackground.fill({ color: 0x330000, alpha: 0.85 });
        this.errorContainer.addChild(this.errorBackground);

        // Error icon (warning triangle)
        this.errorIcon = new PIXI.Text({
            text: '!',
            style: {
                fontFamily: 'Arial, sans-serif',
                fontSize: 48,
                fill: 0xff4444,
                fontWeight: 'bold',
                align: 'center'
            }
        });
        this.errorIcon.x = THUMBNAIL_SIZE / 2;
        this.errorIcon.y = 15;
        this.errorIcon.anchor.set(0.5, 0);
        this.errorContainer.addChild(this.errorIcon);

        // Error title
        this.errorTitle = new PIXI.Text({
            text: 'Boot Failed',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 11,
                fill: 0xff6666,
                fontWeight: 'bold',
                align: 'center',
                wordWrap: true,
                wordWrapWidth: THUMBNAIL_SIZE - 8
            }
        });
        this.errorTitle.x = THUMBNAIL_SIZE / 2;
        this.errorTitle.y = 68;
        this.errorTitle.anchor.set(0.5, 0);
        this.errorContainer.addChild(this.errorTitle);

        // Error message (truncated)
        this.errorMessage = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 9,
                fill: 0xcccccc,
                align: 'center',
                wordWrap: true,
                wordWrapWidth: THUMBNAIL_SIZE - 8
            }
        });
        this.errorMessage.x = THUMBNAIL_SIZE / 2;
        this.errorMessage.y = 84;
        this.errorMessage.anchor.set(0.5, 0);
        this.errorContainer.addChild(this.errorMessage);

        // Guidance text
        this.errorGuidance = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 8,
                fill: 0x88ccff,
                align: 'center',
                wordWrap: true,
                wordWrapWidth: THUMBNAIL_SIZE - 12
            }
        });
        this.errorGuidance.x = THUMBNAIL_SIZE / 2;
        this.errorGuidance.y = 105;
        this.errorGuidance.anchor.set(0.5, 0);
        this.errorContainer.addChild(this.errorGuidance);

        // Error category badge (small colored tag showing error type)
        this.errorBadge = new PIXI.Graphics();
        this.errorBadge.x = THUMBNAIL_SIZE - 4;
        this.errorBadge.y = 4;
        this.errorBadge.visible = false;  // Hidden by default
        this.errorContainer.addChild(this.errorBadge);

        // Error category label
        this.errorBadgeLabel = new PIXI.Text({
            text: '',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 7,
                fill: 0xffffff,
                fontWeight: 'bold',
                align: 'center'
            }
        });
        this.errorBadgeLabel.visible = false;
        this.errorContainer.addChild(this.errorBadgeLabel);

        // Retry button container (hidden by default, shown for retryable errors)
        this.retryButton = new PIXI.Container();
        this.retryButton.x = THUMBNAIL_SIZE / 2;
        this.retryButton.y = 125;
        this.retryButton.visible = false;
        this.retryButton.eventMode = 'static';
        this.retryButton.cursor = 'pointer';
        this.errorContainer.addChild(this.retryButton);

        // Retry button background
        this.retryButtonBg = new PIXI.Graphics();
        this.retryButtonBg.rect(-30, 0, 60, 16);
        this.retryButtonBg.fill({ color: 0x008844, alpha: 0.9 });
        this.retryButtonBg.rect(-30, 0, 60, 16);
        this.retryButtonBg.stroke({ color: 0x00ff88, width: 1 });
        this.retryButton.addChild(this.retryButtonBg);

        // Retry button text
        this.retryButtonText = new PIXI.Text({
            text: 'Retry',
            style: {
                fontFamily: 'Courier New, monospace',
                fontSize: 9,
                fill: 0xffffff,
                fontWeight: 'bold',
                align: 'center'
            }
        });
        this.retryButtonText.x = 0;
        this.retryButtonText.y = 3;
        this.retryButtonText.anchor.set(0.5, 0);
        this.retryButton.addChild(this.retryButtonText);

        // Set up retry button interaction
        this.retryButton.on('pointerover', () => {
            this.retryButtonBg.clear();
            this.retryButtonBg.rect(-30, 0, 60, 16);
            this.retryButtonBg.fill({ color: 0x00aa55, alpha: 1 });
            this.retryButtonBg.rect(-30, 0, 60, 16);
            this.retryButtonBg.stroke({ color: 0x00ffaa, width: 2 });
        });
        this.retryButton.on('pointerout', () => {
            this.retryButtonBg.clear();
            this.retryButtonBg.rect(-30, 0, 60, 16);
            this.retryButtonBg.fill({ color: 0x008844, alpha: 0.9 });
            this.retryButtonBg.rect(-30, 0, 60, 16);
            this.retryButtonBg.stroke({ color: 0x00ff88, width: 1 });
        });
        this.retryButton.on('pointerdown', (event) => {
            event.stopPropagation();
            if (this._retryCallback) {
                this._retryCallback();
            }
        });

        // Store error details for tooltip
        this._errorDetails = null;
        this._retryCallback = null;
    }

    /**
     * Update progress bar fill
     * @private
     * @param {number} percent - Progress percentage (0-100)
     */
    _drawProgressFill(percent) {
        const { THUMBNAIL_SIZE } = RTSDesktopObject.DIMENSIONS;
        const { BAR_HEIGHT, FILL_COLOR } = RTSDesktopObject.PROGRESS;

        const fillWidth = Math.max(0, Math.min(THUMBNAIL_SIZE, (percent / 100) * THUMBNAIL_SIZE));

        this.progressFill.clear();
        if (fillWidth > 0) {
            this.progressFill.rect(0, 0, fillWidth, BAR_HEIGHT);
            this.progressFill.fill({ color: FILL_COLOR, alpha: 0.9 });
        }
    }

    /**
     * Create the hover border
     * @private
     */
    _createBorder() {
        const { OBJECT_WIDTH, OBJECT_HEIGHT, BORDER_WIDTH } = RTSDesktopObject.DIMENSIONS;

        this.border = new PIXI.Graphics();
        this.border.rect(
            -BORDER_WIDTH / 2,
            -BORDER_WIDTH / 2,
            OBJECT_WIDTH + BORDER_WIDTH,
            OBJECT_HEIGHT + BORDER_WIDTH
        );
        this.border.stroke({ color: 0x00ffff, width: BORDER_WIDTH, alpha: 0 });
        this.addChild(this.border);
    }

    /**
     * Set up mouse/touch event handlers
     * @private
     */
    _setupEventHandlers() {
        this.on('pointerover', this._onPointerOver, this);
        this.on('pointerout', this._onPointerOut, this);
        this.on('pointerdown', this._onPointerDown, this);
        this.on('pointerup', this._onPointerUp, this);
        this.on('pointerupoutside', this._onDragEnd, this);
        this.on('pointermove', this._onDragMove, this);
        this.on('dblclick', this._onDoubleClick, this);
    }

    /**
     * Handle pointer over (hover start)
     * @private
     */
    _onPointerOver() {
        if (!this._highlighted) {
            this.border.alpha = 1;
            this.border.clear();
            this.border.rect(-1, -1, 142, 182);
            // Use red border when downloading to indicate click-to-cancel
            if (this._isDownloading) {
                this.border.stroke({ color: 0xff4444, width: 2, alpha: 0.8 });
            } else {
                this.border.stroke({ color: 0x00ffff, width: 2, alpha: 0.8 });
            }
        }

        // Show cache status tooltip if indicator is visible
        if (this.cacheStatusIndicator.visible) {
            this.cacheStatusTooltip.visible = true;
        }

        // Show server source tooltip if badge is visible
        if (this.serverSourceBadge && this.serverSourceBadge.visible) {
            this.serverSourceTooltip.visible = true;
        }

        // Show offline badge tooltip if badge is visible
        if (this.offlineBadge && this.offlineBadge.visible) {
            this.offlineBadgeTooltip.visible = true;
        }

        // Emit hover with status and error details
        this.emit('hover', {
            target: this,
            status: this._status,
            errorDetails: this._errorDetails,
            statusInfo: this._statusInfo,
            isDownloading: this._isDownloading
        });
    }

    /**
     * Handle pointer out (hover end)
     * @private
     */
    _onPointerOut() {
        if (!this._highlighted) {
            this.border.clear();
            this.border.rect(-1, -1, 142, 182);
            this.border.stroke({ color: 0x00ffff, width: 2, alpha: 0 });
        }

        // Hide cache status tooltip
        this.cacheStatusTooltip.visible = false;

        // Hide server source tooltip
        if (this.serverSourceTooltip) {
            this.serverSourceTooltip.visible = false;
        }

        // Hide offline badge tooltip
        if (this.offlineBadgeTooltip) {
            this.offlineBadgeTooltip.visible = false;
        }

        this.emit('hover-end', { target: this });
    }

    /**
     * Handle pointer down (click start / drag start)
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onPointerDown(event) {
        this._clickStart = Date.now();

        // Start drag
        this._onDragStart(event);

        this.emit('pointer-pressed', { target: this, event });
    }

    /**
     * Handle pointer up (click end)
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onPointerUp(event) {
        const clickDuration = Date.now() - (this._clickStart || 0);

        // Only emit if it was a quick tap (not a drag)
        if (clickDuration < 300 && !this.dragging) {
            // If downloading, emit cancel-download instead of clicked
            if (this._isDownloading) {
                this.emit('cancel-download', { target: this, event, entryId: this.entryId });
            } else {
                this.emit('clicked', { target: this, event });
                this.emit('selected', { target: this, event });
            }
        }
    }

    /**
     * Handle double click
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onDoubleClick(event) {
        this.emit('double-clicked', { target: this, event });
        this.emit('boot-requested', { entryId: this.entryId, target: this });
    }

    /**
     * Handle drag start
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onDragStart(event) {
        // Store drag data and offset
        this.dragging = true;
        this.dragData = event.data;

        // Calculate offset from object position
        const globalPos = event.data.global;
        this.dragOffset.x = globalPos.x - this.x;
        this.dragOffset.y = globalPos.y - this.y;

        // Visual feedback
        this.alpha = 0.7;
        this.cursor = 'grabbing';

        // Bring to front
        if (this.parent) {
            this.parent.addChild(this);
        }

        this.emit('drag-start', { target: this, event, globalPos: { x: globalPos.x, y: globalPos.y } });
    }

    /**
     * Handle drag move
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onDragMove(event) {
        if (!this.dragging || !this.dragData) {
            return;
        }

        const globalPos = this.dragData.global;

        // Update position using drag data and offset
        this.x = globalPos.x - this.dragOffset.x;
        this.y = globalPos.y - this.dragOffset.y;

        this.emit('drag-move', { target: this, event, globalPos: { x: globalPos.x, y: globalPos.y } });
    }

    /**
     * Handle drag end
     * @private
     * @param {PIXI.FederatedPointerEvent} event
     */
    _onDragEnd(event) {
        if (!this.dragging) {
            return;
        }

        // Reset drag state
        this.dragging = false;
        this.dragData = null;
        this.dragOffset = { x: 0, y: 0 };

        // Restore visual state
        this.alpha = 1.0;
        this.cursor = 'pointer';

        // Calculate new grid position
        const gridX = Math.round(this.x / 160);
        const gridY = Math.round(this.y / 200);

        // Update grid position
        this.gridX = gridX;
        this.gridY = gridY;

        this.emit('drag-end', { target: this, event, gridX, gridY, worldPos: { x: this.x, y: this.y } });
    }

    /**
     * Set the highlighted state (selected)
     * @param {boolean} highlighted - Whether to show highlight
     */
    setHighlighted(highlighted) {
        this._highlighted = highlighted;

        if (highlighted) {
            this.border.clear();
            this.border.rect(-1, -1, 142, 182);
            this.border.stroke({ color: 0x00ffff, width: 3, alpha: 1 });
        } else {
            this.border.clear();
            this.border.rect(-1, -1, 142, 182);
            this.border.stroke({ color: 0x00ffff, width: 2, alpha: 0 });
        }
    }

    /**
     * Get the current highlighted state
     * @returns {boolean}
     */
    isHighlighted() {
        return this._highlighted;
    }

    /**
     * Set the status of the object
     * @param {string} status - Status value (idle, booting, running, error, stopped, unknown, downloading)
     */
    setStatus(status) {
        this._status = status;
        const color = RTSDesktopObject.STATUS_COLORS[status] || RTSDesktopObject.STATUS_COLORS.unknown;
        this._drawStatusCircle(color);

        // Handle status-specific behavior
        if (status === 'booting') {
            this._startPulse();
            this.startBootProgress();  // Start progress animation
        } else if (status === 'running') {
            this._stopPulse();
            this.completeBootProgress();  // Complete and hide progress
        } else if (status === 'error') {
            this._stopPulse();
            // Progress bar shows error state via failBootProgress()
        } else if (status === 'downloading') {
            this._startPulse();
            // Progress shown via setDownloadProgress()
        } else {
            this._stopPulse();
            this.hideProgress();  // Hide progress for other states
        }
    }

    /**
     * Set the boot progress
     * @param {number} percent - Progress percentage (0-100)
     * @param {string} stageLabel - Optional stage label to display
     */
    setProgress(percent, stageLabel = null) {
        this._progressPercent = Math.max(0, Math.min(100, percent));

        // Update fill bar
        this._drawProgressFill(this._progressPercent);

        // Update label
        if (stageLabel) {
            this.progressLabel.text = `${stageLabel} ${Math.round(this._progressPercent)}%`;
        } else {
            this.progressLabel.text = `${Math.round(this._progressPercent)}%`;
        }

        // Show progress container
        this.progressContainer.visible = true;
    }

    /**
     * Hide the progress bar
     */
    hideProgress() {
        this.progressContainer.visible = false;
        this._progressPercent = 0;
        this._progressStage = null;

        // Hide download-specific labels
        if (this.downloadSpeedLabel) this.downloadSpeedLabel.visible = false;
        if (this.downloadTimeLabel) this.downloadTimeLabel.visible = false;
    }

    /**
     * Set the download progress
     * Shows progress bar with download-specific information
     * @param {Object} progress - Progress information
     * @param {number} progress.loaded - Bytes loaded so far
     * @param {number} progress.total - Total bytes (may be null)
     * @param {number} progress.percent - Progress percentage (0-100, may be null)
     * @param {number} progress.speed - Download speed in bytes/sec (may be null)
     * @param {number} progress.timeRemaining - Time remaining in seconds (may be null)
     */
    setDownloadProgress(progress) {
        this._downloadProgress = progress;

        // Determine percentage
        let displayPercent = 0;
        if (progress.percent !== null && progress.percent !== undefined) {
            displayPercent = progress.percent;
        } else if (progress.total && progress.total > 0) {
            displayPercent = Math.round((progress.loaded / progress.total) * 100);
        }

        // Update progress bar
        this._progressPercent = Math.max(0, Math.min(100, displayPercent));
        this._drawProgressFill(this._progressPercent);

        // Update progress label with percentage
        this.progressLabel.text = `${Math.round(this._progressPercent)}%`;
        this.progressContainer.visible = true;

        // Show download speed if available
        if (this.downloadSpeedLabel) {
            if (progress.speed !== null && progress.speed !== undefined) {
                const speedText = this._formatSpeed(progress.speed);
                this.downloadSpeedLabel.text = speedText;
                this.downloadSpeedLabel.visible = true;
            } else {
                this.downloadSpeedLabel.visible = false;
            }
        }

        // Show time remaining if available
        if (this.downloadTimeLabel) {
            if (progress.timeRemaining !== null && progress.timeRemaining !== undefined && progress.timeRemaining > 0) {
                const timeText = this._formatTimeRemaining(progress.timeRemaining);
                this.downloadTimeLabel.text = timeText;
                this.downloadTimeLabel.visible = true;
            } else {
                this.downloadTimeLabel.visible = false;
            }
        }
    }

    /**
     * Format download speed for display
     * @param {number} bytesPerSecond - Speed in bytes per second
     * @returns {string} Formatted speed string (e.g., "1.2 MB/s" or "500 KB/s")
     * @private
     */
    _formatSpeed(bytesPerSecond) {
        if (bytesPerSecond >= 1024 * 1024) {
            // MB/s
            const mb = bytesPerSecond / (1024 * 1024);
            return `${mb.toFixed(1)} MB/s`;
        } else if (bytesPerSecond >= 1024) {
            // KB/s
            const kb = bytesPerSecond / 1024;
            return `${Math.round(kb)} KB/s`;
        } else {
            // Bytes/s
            return `${Math.round(bytesPerSecond)} B/s`;
        }
    }

    /**
     * Format time remaining for display
     * @param {number} seconds - Time remaining in seconds
     * @returns {string} Formatted time string (e.g., "2:30 remaining")
     * @private
     */
    _formatTimeRemaining(seconds) {
        if (seconds < 60) {
            return `${Math.round(seconds)}s remaining`;
        } else {
            const mins = Math.floor(seconds / 60);
            const secs = Math.round(seconds % 60);
            return `${mins}:${secs.toString().padStart(2, '0')} remaining`;
        }
    }

    /**
     * Set the downloading state
     * @param {boolean} isDownloading - Whether a download is in progress
     */
    setDownloading(isDownloading) {
        this._isDownloading = isDownloading;

        if (isDownloading) {
            this.setStatus('downloading');
            this.progressContainer.visible = true;

            // Hide download labels initially (will show when progress updates)
            if (this.downloadSpeedLabel) this.downloadSpeedLabel.visible = false;
            if (this.downloadTimeLabel) this.downloadTimeLabel.visible = false;
        }
    }

    /**
     * Check if currently downloading
     * @returns {boolean}
     */
    isDownloading() {
        return this._isDownloading;
    }

    /**
     * Show verification status after download completes
     * @param {boolean} verified - Whether hash verification succeeded
     * @param {string} hash - The computed hash (for display/debug)
     */
    showVerificationStatus(verified, hash) {
        // Update cache status indicator
        this.setCacheStatus(verified ? 'verified' : 'failed');

        // Show brief verification indicator in progress label
        if (verified) {
            this.progressLabel.text = 'Verified!';
            this.progressLabel.style.fill = 0x00ff00;  // Green
        } else {
            this.progressLabel.text = 'Verify Failed';
            this.progressLabel.style.fill = 0xff0000;  // Red
        }

        // Hide download-specific labels
        if (this.downloadSpeedLabel) this.downloadSpeedLabel.visible = false;
        if (this.downloadTimeLabel) this.downloadTimeLabel.visible = false;

        // Emit verification complete event
        this.emit('verification-complete', {
            entryId: this.entryId,
            verified,
            hash
        });

        // Reset progress label color after a delay
        setTimeout(() => {
            this.progressLabel.style.fill = RTSDesktopObject.PROGRESS.TEXT_COLOR;
        }, 2000);
    }

    /**
     * Show retrying status in download overlay
     * @param {number} attempt - Current retry attempt number
     * @param {number} delaySeconds - Delay before retry in seconds
     */
    showDownloadRetrying(attempt, delaySeconds) {
        // Set retrying status
        this._status = 'retrying';
        this._drawStatusCircle(RTSDesktopObject.STATUS_COLORS.retrying);

        // Show progress container with retry status
        this.progressContainer.visible = true;

        // Update progress label to show retry status
        this.progressLabel.text = `Retry ${attempt} in ${delaySeconds}s...`;
        this.progressLabel.style.fill = 0xffaa00;  // Orange

        // Hide download-specific labels
        if (this.downloadSpeedLabel) this.downloadSpeedLabel.visible = false;
        if (this.downloadTimeLabel) this.downloadTimeLabel.visible = false;

        // Emit retry status event
        this.emit('retrying', {
            entryId: this.entryId,
            attempt,
            delaySeconds
        });
    }

    /**
     * Get current progress
     * @returns {number} Progress percentage
     */
    getProgress() {
        return this._progressPercent;
    }

    /**
     * Start pulse animation on status indicator
     * @private
     */
    _startPulse() {
        if (this._pulseActive) return;
        this._pulseActive = true;
        this._pulseTime = 0;
        this._updatePulse();
    }

    /**
     * Update pulse animation frame
     * @private
     */
    _updatePulse() {
        if (!this._pulseActive) return;

        this._pulseTime += 0.1;
        const alpha = 0.5 + Math.sin(this._pulseTime) * 0.5;
        this.statusIndicator.alpha = alpha;

        requestAnimationFrame(() => this._updatePulse());
    }

    /**
     * Stop pulse animation
     * @private
     */
    _stopPulse() {
        this._pulseActive = false;
        this.statusIndicator.alpha = 1;
    }

    /**
     * Start boot progress animation
     * Uses time-based progress estimation
     */
    startBootProgress() {
        this._bootStartTime = Date.now();
        this._progressPercent = 0;
        this._progressStage = RTSDesktopObject.BOOT_STAGES.STARTING;

        // Show progress bar
        this.progressContainer.visible = true;
        this.setProgress(0, this._progressStage.label);

        // Start animation loop
        this._updateBootProgress();
    }

    /**
     * Update boot progress based on elapsed time
     * @private
     */
    _updateBootProgress() {
        if (!this._bootStartTime || this._status !== 'booting') {
            return;
        }

        const elapsed = Date.now() - this._bootStartTime;
        const { TIMEOUT_MS } = RTSDesktopObject.PROGRESS;
        const { BOOT_STAGES } = RTSDesktopObject;

        // Check for timeout
        if (elapsed >= TIMEOUT_MS) {
            this.setStatus('error');
            this.setProgress(100, 'Boot timeout');
            return;
        }

        // Calculate progress based on elapsed time
        const rawPercent = (elapsed / TIMEOUT_MS) * 100;

        // Determine current stage and adjust progress
        let stage = BOOT_STAGES.STARTING;
        let displayPercent = rawPercent;

        if (rawPercent < BOOT_STAGES.STARTING.endPercent) {
            stage = BOOT_STAGES.STARTING;
            displayPercent = rawPercent;
        } else if (rawPercent < BOOT_STAGES.LOADING.endPercent) {
            stage = BOOT_STAGES.LOADING;
            displayPercent = BOOT_STAGES.STARTING.endPercent +
                (rawPercent - BOOT_STAGES.STARTING.endPercent);
        } else if (rawPercent < BOOT_STAGES.INITIALIZING.endPercent) {
            stage = BOOT_STAGES.INITIALIZING;
            displayPercent = BOOT_STAGES.LOADING.endPercent +
                (rawPercent - BOOT_STAGES.LOADING.endPercent);
        } else {
            stage = BOOT_STAGES.READY;
            displayPercent = Math.min(99, rawPercent);  // Cap at 99% until actually ready
        }

        this._progressStage = stage;
        this.setProgress(displayPercent, stage.label);

        // Continue animation
        this._progressAnimationId = requestAnimationFrame(() => this._updateBootProgress());
    }

    /**
     * Complete boot progress (called when boot succeeds)
     */
    completeBootProgress() {
        if (this._progressAnimationId) {
            cancelAnimationFrame(this._progressAnimationId);
            this._progressAnimationId = null;
        }

        this._bootStartTime = null;
        this.setProgress(100, RTSDesktopObject.BOOT_STAGES.READY.label);

        // Hide progress after short delay
        setTimeout(() => {
            this.hideProgress();
        }, 500);
    }

    /**
     * Fail boot progress with error
     * @param {string} errorMessage - Error message to display
     * @param {Object} options - Additional error context
     * @param {string} options.stage - Boot stage where error occurred
     * @param {number} options.elapsedTime - Time elapsed before failure
     * @param {Object} options.config - Boot configuration used
     */
    failBootProgress(errorMessage, options = {}) {
        if (this._progressAnimationId) {
            cancelAnimationFrame(this._progressAnimationId);
            this._progressAnimationId = null;
        }

        // Calculate elapsed time if not provided
        const elapsedTime = options.elapsedTime ||
            (this._bootStartTime ? (Date.now() - this._bootStartTime) / 1000 : 0);

        // Get current stage
        const stage = options.stage ||
            (this._progressStage ? this._progressStage.label : 'Unknown');

        // Show comprehensive error
        this.showError({
            message: errorMessage,
            stage,
            elapsedTime,
            config: options.config || {}
        });

        this._bootStartTime = null;
    }

    /**
     * Show error overlay with detailed message and guidance
     * @param {Object} errorInfo - Error information
     * @param {string} errorInfo.message - Error message from server
     * @param {string} errorInfo.stage - Boot stage where error occurred
     * @param {number} errorInfo.elapsedTime - Time elapsed before failure
     * @param {Object} errorInfo.config - Boot configuration used
     */
    /**
     * Show error overlay with detailed message and guidance
     * @param {Object} errorInfo - Error information
     * @param {string} errorInfo.message - Error message from server
     * @param {string} errorInfo.stage - Boot stage where error occurred
     * @param {number} errorInfo.elapsedTime - Time elapsed before failure
     * @param {Object} errorInfo.config - Boot configuration used
     * @param {string} [errorInfo.type] - Error type (network, timeout, dns, http, etc.)
     * @param {number} [errorInfo.httpStatus] - HTTP status code if applicable
     * @param {boolean} [errorInfo.retryable] - Whether the error is retryable
     * @param {Function} [errorInfo.onRetry] - Callback to trigger retry
     */
    showError(errorInfo) {
        const { message, stage, elapsedTime, config, type, httpStatus, retryable, onRetry } = errorInfo;

        // Store details for tooltip
        this._errorDetails = {
            message,
            stage: stage || 'Unknown',
            elapsedTime: elapsedTime || 0,
            config: config || {},
            type,
            httpStatus,
            retryable,
            timestamp: Date.now()
        };

        // Get guidance based on error type
        const guidance = this._getErrorGuidanceForType(type, httpStatus) || this._getErrorGuidance(message);

        // Update error display
        this.errorTitle.text = 'Download Failed';
        this.errorMessage.text = this._truncateText(message || 'Unknown error', 80);

        // Show guidance if available
        if (guidance) {
            this.errorGuidance.text = guidance;
        } else {
            this.errorGuidance.text = RTSDesktopObject.ERROR_GUIDANCE.default.action;
        }

        // Show retry button if retryable
        if (retryable && onRetry) {
            this._retryCallback = onRetry;
            this.retryButton.visible = true;
        } else {
            this._retryCallback = null;
            this.retryButton.visible = false;
        }

        // Show overlay
        this.errorContainer.visible = true;
        this.progressContainer.visible = false;

        // Set error status
        this.setStatus('error');
    }

    /**
     * Get error guidance based on error type
     * @private
     * @param {string} type - Error type
     * @param {number} httpStatus - HTTP status code
     * @returns {string|null} Guidance message or null
     */
    _getErrorGuidanceForType(type, httpStatus) {
        const ERROR_GUIDANCE_BY_TYPE = {
            'network': 'Check your internet connection',
            'timeout': 'Server is slow or unavailable',
            'dns': 'Server address could not be found',
            'cancelled': 'Download was cancelled',
            'verification': 'Downloaded file is corrupted'
        };

        const ERROR_GUIDANCE_BY_HTTP = {
            404: 'Container not found on server',
            403: 'Access denied by server',
            500: 'Server error, try again later',
            502: 'Bad gateway, try again later',
            503: 'Server unavailable, try again later',
            504: 'Gateway timeout, try again later'
        };

        if (httpStatus && ERROR_GUIDANCE_BY_HTTP[httpStatus]) {
            return ERROR_GUIDANCE_BY_HTTP[httpStatus];
        }

        if (type && ERROR_GUIDANCE_BY_TYPE[type]) {
            return ERROR_GUIDANCE_BY_TYPE[type];
        }

        return null;
    }

    /**
     * Get guidance for an error message
     * @private
     * @param {string} message - Error message
     * @returns {Object|null} Guidance object or null
     */
    _getErrorGuidance(message) {
        if (!message) return null;

        const { ERROR_GUIDANCE } = RTSDesktopObject;

        for (const [key, info] of Object.entries(ERROR_GUIDANCE)) {
            if (key === 'default') continue;
            if (info.pattern.test(message)) {
                return info;
            }
        }

        return ERROR_GUIDANCE.default;
    }

    /**
     * Truncate text to fit in display
     * @private
     * @param {string} text - Text to truncate
     * @param {number} maxLength - Maximum length
     * @returns {string} Truncated text
     */
    _truncateText(text, maxLength) {
        if (!text) return '';
        if (text.length <= maxLength) return text;
        return text.substring(0, maxLength - 3) + '...';
    }

    /**
     * Hide the error overlay
     */
    hideError() {
        this.errorContainer.visible = false;
        this._errorDetails = null;
        this.errorBadge.visible = false;
        this.errorBadgeLabel.visible = false;
    }

    /**
     * Show error with category badge (enhanced error display for boot failures)
     * Shows an error overlay with a colored badge indicating the error category
     * (TIMEOUT, NETWORK, NOT FOUND, etc.)
     * @param {Object} errorInfo - Error information
     * @param {string} errorInfo.message - Error message
     * @param {string} [errorInfo.stage] - Boot stage where error occurred
     * @param {number} [errorInfo.elapsedTime] - Time elapsed before failure
     */
    showErrorWithBadge(errorInfo) {
        const { message, stage, elapsedTime } = errorInfo;

        // Get error category from guidance
        const guidance = this._getErrorGuidance(message);
        const category = guidance?.category || 'ERROR';
        const categoryColor = RTSDesktopObject.ERROR_CATEGORY_COLORS[category] || 0xff0000;

        // Call base showError for boot failures
        this.showError({
            message,
            stage,
            elapsedTime,
            config: {}
        });

        // Update title to reflect boot failure
        this.errorTitle.text = 'Boot Failed';

        // Draw category badge
        this._drawErrorBadge(category, categoryColor);
    }

    /**
     * Draw the error category badge
     * @private
     * @param {string} category - Error category text
     * @param {number} color - Badge color
     */
    _drawErrorBadge(category, color) {
        const { THUMBNAIL_SIZE } = RTSDesktopObject.DIMENSIONS;

        // Set badge label
        this.errorBadgeLabel.text = category;
        this.errorBadgeLabel.visible = true;

        // Calculate badge width based on text
        const textWidth = this.errorBadgeLabel.width;
        const badgeWidth = textWidth + 8;
        const badgeHeight = 11;

        // Position badge at top-right corner
        this.errorBadge.x = THUMBNAIL_SIZE - badgeWidth - 4;
        this.errorBadge.y = 4;
        this.errorBadgeLabel.x = this.errorBadge.x + 4;
        this.errorBadgeLabel.y = 5;

        // Draw badge background
        this.errorBadge.clear();
        this.errorBadge.roundRect(0, 0, badgeWidth, badgeHeight, 2);
        this.errorBadge.fill({ color: color, alpha: 0.9 });
        this.errorBadge.visible = true;
    }

    /**
     * Show offline status indicator
     * Displays a "CACHED" badge for items available offline
     * @param {boolean} isCached - Whether the item is cached locally
     */
    showOfflineStatus(isCached) {
        if (!this._isRemote) {
            // Local containers don't show offline status
            this._cachedBadgeVisible = false;
            return;
        }

        this._cachedBadgeVisible = isCached;

        // Update the offline badge tooltip
        if (this.offlineBadgeTooltip) {
            this.offlineBadgeTooltip.text = isCached ? 'CACHED' : 'Network required';
        }
    }

    /**
     * Check if cached badge is visible
     * @returns {boolean}
     */
    isCachedBadgeVisible() {
        return this._cachedBadgeVisible || false;
    }

    /**
     * Get error details for tooltip
     * @returns {Object|null} Error details
     */
    getErrorDetails() {
        return this._errorDetails;
    }

    /**
     * Format error details for tooltip display
     * @returns {string|null} Formatted error text
     */
    formatErrorForTooltip() {
        if (!this._errorDetails) return null;

        const { message, stage, elapsedTime, config } = this._errorDetails;
        const guidance = this._getErrorGuidance(message);

        let text = `Boot failed at: ${stage}\n`;
        text += `After: ${elapsedTime.toFixed(1)} seconds\n`;
        if (config.memory || config.cpus) {
            text += `Config: Memory=${config.memory || 'default'}, CPUs=${config.cpus || 'default'}\n`;
        }
        text += `\n${guidance.guidance}`;
        text += `\n\nSuggestion: ${guidance.action}`;

        return text;
    }

    /**
     * Get the current status
     * @returns {string}
     */
    getStatus() {
        return this._status;
    }

    /**
     * Update the thumbnail image
     * @param {string} thumbnailData - Base64 encoded image data
     */
    updateThumbnail(thumbnailData) {
        this._loadThumbnail(thumbnailData);
    }

    /**
     * Update the display name
     * @param {string} name - New display name
     */
    updateName(name) {
        let displayName = name;
        if (displayName.length > 18) {
            displayName = displayName.substring(0, 15) + '...';
        }
        this.nameLabel.text = displayName;
    }

    /**
     * Get the grid position
     * @returns {Object} { gridX, gridY }
     */
    getGridPosition() {
        return { gridX: this.gridX, gridY: this.gridY };
    }

    /**
     * Set the grid position (does not update world position)
     * @param {number} gridX
     * @param {number} gridY
     */
    setGridPosition(gridX, gridY) {
        this.gridX = gridX;
        this.gridY = gridY;
    }

    /**
     * Get the world position (calculated from grid)
     * @returns {Object} { x, y }
     */
    getWorldPosition() {
        // Grid-to-world conversion: World X = grid.x * 160, World Y = grid.y * 200
        return {
            x: this.gridX * 160,
            y: this.gridY * 200
        };
    }

    /**
     * Serialize the object state for persistence
     * @returns {Object} Serializable state
     */
    serialize() {
        return {
            entryId: this.entryId,
            gridX: this.gridX,
            gridY: this.gridY,
            status: this._status,
            highlighted: this._highlighted
        };
    }

    /**
     * Update entry data (refresh from catalog)
     * @param {Object} entry - New entry data
     */
    updateEntry(entry) {
        this.entryData = entry;

        if (entry.thumbnail) {
            this.updateThumbnail(entry.thumbnail);
        }

        if (entry.name) {
            this.updateName(entry.name);
        }

        if (entry.status) {
            this.setStatus(entry.status);
        }

        if (entry.layout) {
            this.setGridPosition(entry.layout.gridX || 0, entry.layout.gridY || 0);
        } else if (entry.position) {
            // Fallback: handle server's position.{x,y} format
            this.setGridPosition(entry.position.x || 0, entry.position.y || 0);
        }

        // Update cache verification status from CatalogCacheManager
        this._updateCacheStatus(entry.id);
    }

    /**
     * Update cache status from the CatalogCacheManager
     * @private
     * @param {string} entryId - Entry ID to check
     */
    _updateCacheStatus(entryId) {
        // Check if CatalogBridge and cache are available
        if (window.catalogBridge?.cache?.getVerificationStatus) {
            const cacheStatus = window.catalogBridge.cache.getVerificationStatus(entryId);
            if (cacheStatus) {
                this.setCacheStatus(cacheStatus);
            }
        }
    }

    /**
     * Clean up resources
     */
    destroy() {
        // Stop pulse animation
        this._stopPulse();

        // Cancel progress animation
        if (this._progressAnimationId) {
            cancelAnimationFrame(this._progressAnimationId);
            this._progressAnimationId = null;
        }

        // Remove event listeners
        this.off('pointerover', this._onPointerOver, this);
        this.off('pointerout', this._onPointerOut, this);
        this.off('pointerdown', this._onPointerDown, this);
        this.off('pointerup', this._onPointerUp, this);
        this.off('pointerupoutside', this._onDragEnd, this);
        this.off('pointermove', this._onDragMove, this);
        this.off('dblclick', this._onDoubleClick, this);

        // Destroy sprite texture if it exists
        if (this.thumbnailSprite) {
            this.thumbnailSprite.destroy();
        }

        super.destroy();
    }
}

// ES6 module export
export { RTSDesktopObject };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.RTSDesktopObject = RTSDesktopObject;
}
