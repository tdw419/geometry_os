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
        unknown: 0x444444    // Darker gray
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
            action: 'Increase memory allocation or check kernel compatibility.'
        },
        memory: {
            pattern: /memory|oom|out of memory|cannot allocate/i,
            guidance: 'Insufficient memory for boot. Increase memory allocation.',
            action: 'Increase memory to at least 2G for most distributions.'
        },
        kernel: {
            pattern: /kernel|vmlinuz|bzImage|boot failed/i,
            guidance: 'Kernel failed to load. Check kernel compatibility.',
            action: 'Verify the kernel is compatible with this architecture.'
        },
        fuse: {
            pattern: /fuse|mount|failed to mount/i,
            guidance: 'FUSE mount failed. Check if FUSE is installed.',
            action: 'Ensure fuse3 or fuse is installed: sudo apt install fuse3'
        },
        qemu: {
            pattern: /qemu|kvm|accelerator|hv_error/i,
            guidance: 'QEMU or KVM error. Check virtualization support.',
            action: 'Enable virtualization in BIOS or install qemu-system-x86'
        },
        permission: {
            pattern: /permission|denied|access|eacces/i,
            guidance: 'Permission denied. Check file permissions.',
            action: 'Ensure the .rts.png file is readable and executable.'
        },
        default: {
            pattern: /.*/,
            guidance: 'Boot failed. Check logs for details.',
            action: 'Try different boot options or check system compatibility.'
        }
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
        this.errorIcon.y = 20;
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
        this.errorTitle.y = 75;
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
        this.errorMessage.y = 92;
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
        this.errorGuidance.y = 115;
        this.errorGuidance.anchor.set(0.5, 0);
        this.errorContainer.addChild(this.errorGuidance);

        // Store error details for tooltip
        this._errorDetails = null;
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
            this.border.stroke({ color: 0x00ffff, width: 2, alpha: 0.8 });
        }
        this.emit('hover', { target: this });
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
            this.emit('clicked', { target: this, event });
            this.emit('selected', { target: this, event });
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
     * @param {string} status - Status value (idle, booting, running, error, stopped, unknown)
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
     */
    failBootProgress(errorMessage) {
        if (this._progressAnimationId) {
            cancelAnimationFrame(this._progressAnimationId);
            this._progressAnimationId = null;
        }

        this._bootStartTime = null;
        this.setStatus('error');

        // Show error on progress bar
        this.progressFill.clear();
        this.progressFill.rect(0, 0, RTSDesktopObject.DIMENSIONS.THUMBNAIL_SIZE, RTSDesktopObject.PROGRESS.BAR_HEIGHT);
        this.progressFill.fill({ color: 0xff0000, alpha: 0.9 });  // Red for error

        this.progressLabel.text = errorMessage || 'Boot failed';
        this.progressLabel.style.fill = 0xff6666;
        this.progressContainer.visible = true;
    }

    /**
     * Show error overlay with detailed message and guidance
     * @param {Object} errorInfo - Error information
     * @param {string} errorInfo.message - Error message from server
     * @param {string} errorInfo.stage - Boot stage where error occurred
     * @param {number} errorInfo.elapsedTime - Time elapsed before failure
     * @param {Object} errorInfo.config - Boot configuration used
     */
    showError(errorInfo) {
        const { message, stage, elapsedTime, config } = errorInfo;

        // Store details for tooltip
        this._errorDetails = {
            message,
            stage: stage || 'Unknown',
            elapsedTime: elapsedTime || 0,
            config: config || {},
            timestamp: Date.now()
        };

        // Find matching guidance
        const guidance = this._getErrorGuidance(message);

        // Update error display
        this.errorTitle.text = 'Boot Failed';
        this.errorMessage.text = this._truncateText(message || 'Unknown error', 80);

        // Show guidance if available
        if (guidance) {
            this.errorGuidance.text = guidance.action;
        } else {
            this.errorGuidance.text = RTSDesktopObject.ERROR_GUIDANCE.default.action;
        }

        // Show overlay
        this.errorContainer.visible = true;
        this.progressContainer.visible = false;

        // Set error status
        this.setStatus('error');
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
    }

    /**
     * Get error details for tooltip
     * @returns {Object|null} Error details
     */
    getErrorDetails() {
        return this._errorDetails;
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
