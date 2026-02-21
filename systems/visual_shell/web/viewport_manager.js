/**
 * Geometry OS: Viewport Manager Module
 * 
 * Manages camera tracking and viewport calculations for the infinite map.
 * Handles coordinate transformations and viewport bounds calculations.
 * 
 * Key features:
 * - Camera position and zoom tracking
 * - World-to-screen and screen-to-world coordinate conversion
 * - Viewport bounds calculation for culling
 * - Smooth camera interpolation
 * - WebSocket camera sync with compositor
 * 
 * @module viewport_manager
 */

/**
 * ViewportManager - Manages camera and viewport state
 * 
 * @class ViewportManager
 */
class ViewportManager {
    /**
     * @param {Object} config - Configuration
     * @param {PIXI.DisplayObject} config.target - Target PIXI object to track
     * @param {number} config.initialX - Initial camera X position (default: 0)
     * @param {number} config.initialY - Initial camera Y position (default: 0)
     * @param {number} config.initialZoom - Initial zoom level (default: 1.0)
     * @param {number} config.minZoom - Minimum zoom level (default: 0.1)
     * @param {number} config.maxZoom - Maximum zoom level (default: 10.0)
     * @param {boolean} config.enableSmoothing - Enable smooth camera interpolation (default: true)
     * @param {number} config.smoothingFactor - Camera smoothing factor 0-1 (default: 0.1)
     * @param {string} config.websocketUrl - WebSocket URL for camera sync (optional)
     */
    constructor(config = {}) {
        this.config = {
            target: null,
            initialX: 0,
            initialY: 0,
            initialZoom: 1.0,
            minZoom: 0.1,
            maxZoom: 10.0,
            enableSmoothing: true,
            smoothingFactor: 0.1,
            websocketUrl: null,
            ...config
        };

        // Camera state
        this.camera = {
            x: this.config.initialX,
            y: this.config.initialY,
            zoom: this.config.initialZoom,
            targetX: this.config.initialX,
            targetY: this.config.initialY,
            targetZoom: this.config.initialZoom
        };

        // Screen dimensions
        this.screenWidth = window.innerWidth;
        this.screenHeight = window.innerHeight;

        // Viewport bounds cache
        this.cachedBounds = null;
        this.boundsDirty = true;

        // WebSocket connection
        this.ws = null;
        this.wsReconnectAttempts = 0;
        this.maxReconnectAttempts = 10;

        // Event listeners
        this.eventListeners = new Map();

        // Bind window resize
        this._bindResize();

        // Connect to WebSocket if configured
        if (this.config.websocketUrl) {
            this.connectToCompositor();
        }

        console.log('📷 ViewportManager initialized', {
            camera: this.camera,
            screen: { width: this.screenWidth, height: this.screenHeight }
        });
    }

    /**
     * Bind window resize handler
     */
    _bindResize() {
        this._handleResize = () => {
            this.screenWidth = window.innerWidth;
            this.screenHeight = window.innerHeight;
            this.boundsDirty = true;
            this.emit('resize', { width: this.screenWidth, height: this.screenHeight });
        };

        window.addEventListener('resize', this._handleResize);
    }

    /**
     * Get current viewport bounds in world coordinates
     */
    getVisibleBounds() {
        if (!this.boundsDirty && this.cachedBounds) {
            return this.cachedBounds;
        }

        const halfWidth = (this.screenWidth / 2) / this.camera.zoom;
        const halfHeight = (this.screenHeight / 2) / this.camera.zoom;

        const bounds = {
            minX: this.camera.x - halfWidth,
            minY: this.camera.y - halfHeight,
            maxX: this.camera.x + halfWidth,
            maxY: this.camera.y + halfHeight,
            width: this.screenWidth / this.camera.zoom,
            height: this.screenHeight / this.camera.zoom
        };

        this.cachedBounds = bounds;
        this.boundsDirty = false;

        return bounds;
    }

    /**
     * Get viewport bounds with padding (for preloading)
     */
    getVisibleBoundsWithPadding(paddingFactor = 1.5) {
        const bounds = this.getVisibleBounds();
        const extraWidth = bounds.width * (paddingFactor - 1);
        const extraHeight = bounds.height * (paddingFactor - 1);

        return {
            minX: bounds.minX - extraWidth / 2,
            minY: bounds.minY - extraHeight / 2,
            maxX: bounds.maxX + extraWidth / 2,
            maxY: bounds.maxY + extraHeight / 2,
            width: bounds.width * paddingFactor,
            height: bounds.height * paddingFactor
        };
    }

    /**
     * Convert screen coordinates to world coordinates
     */
    screenToWorld(screenX, screenY) {
        const centerX = this.screenWidth / 2;
        const centerY = this.screenHeight / 2;

        const worldX = this.camera.x + (screenX - centerX) / this.camera.zoom;
        const worldY = this.camera.y + (screenY - centerY) / this.camera.zoom;

        return { x: worldX, y: worldY };
    }

    /**
     * Convert world coordinates to screen coordinates
     */
    worldToScreen(worldX, worldY) {
        const centerX = this.screenWidth / 2;
        const centerY = this.screenHeight / 2;

        const screenX = centerX + (worldX - this.camera.x) * this.camera.zoom;
        const screenY = centerY + (worldY - this.camera.y) * this.camera.zoom;

        return { x: screenX, y: screenY };
    }

    /**
     * Set camera position
     */
    setPosition(x, y, immediate = false) {
        if (immediate || !this.config.enableSmoothing) {
            this.camera.x = x;
            this.camera.y = y;
            this.camera.targetX = x;
            this.camera.targetY = y;
        } else {
            this.camera.targetX = x;
            this.camera.targetY = y;
        }

        this.boundsDirty = true;
        this.emit('move', { x: this.camera.x, y: this.camera.y });
    }

    /**
     * Set camera zoom
     */
    setZoom(zoom, immediate = false) {
        const clampedZoom = Math.max(
            this.config.minZoom,
            Math.min(this.config.maxZoom, zoom)
        );

        if (immediate || !this.config.enableSmoothing) {
            this.camera.zoom = clampedZoom;
            this.camera.targetZoom = clampedZoom;
        } else {
            this.camera.targetZoom = clampedZoom;
        }

        this.boundsDirty = true;
        this.emit('zoom', { zoom: this.camera.zoom });
    }

    /**
     * Move camera to center on a world position
     */
    moveCenter(x, y, immediate = false) {
        this.setPosition(x, y, immediate);
    }

    /**
     * Move camera to center on a world position (alias for moveCenter)
     */
    moveTo(x, y, immediate = false) {
        this.setPosition(x, y, immediate);
    }

    /**
     * Set camera zoom level
     */
    zoomTo(zoom, immediate = false) {
        this.setZoom(zoom, immediate);
    }

    /**
     * Pan camera by offset
     */
    pan(deltaX, deltaY, immediate = false) {
        this.setPosition(
            this.camera.x + deltaX,
            this.camera.y + deltaY,
            immediate
        );
    }

    /**
     * Zoom camera by factor
     */
    zoomBy(factor, immediate = false) {
        this.setZoom(this.camera.zoom * factor, immediate);
    }

    /**
     * Update camera (call this every frame for smoothing)
     */
    update(deltaTime) {
        if (!this.config.enableSmoothing) {
            return;
        }

        const factor = this.config.smoothingFactor;
        const needsUpdate =
            Math.abs(this.camera.x - this.camera.targetX) > 0.01 ||
            Math.abs(this.camera.y - this.camera.targetY) > 0.01 ||
            Math.abs(this.camera.zoom - this.camera.targetZoom) > 0.001;

        if (needsUpdate) {
            this.camera.x += (this.camera.targetX - this.camera.x) * factor;
            this.camera.y += (this.camera.targetY - this.camera.y) * factor;
            this.camera.zoom += (this.camera.targetZoom - this.camera.zoom) * factor;
            this.boundsDirty = true;
        }
    }

    /**
     * Get current camera state
     */
    getCamera() {
        return {
            x: this.camera.x,
            y: this.camera.y,
            zoom: this.camera.zoom
        };
    }

    /**
     * Get target camera state
     */
    getTargetCamera() {
        return {
            x: this.camera.targetX,
            y: this.camera.targetY,
            zoom: this.camera.targetZoom
        };
    }

    /**
     * Check if a point is visible in the viewport
     */
    isVisible(x, y) {
        const bounds = this.getVisibleBounds();
        return x >= bounds.minX && x <= bounds.maxX &&
            y >= bounds.minY && y <= bounds.maxY;
    }

    /**
     * Check if a rectangle intersects with the viewport
     */
    intersects(minX, minY, maxX, maxY) {
        const bounds = this.getVisibleBounds();
        return !(maxX < bounds.minX || minX > bounds.maxX ||
            maxY < bounds.minY || minY > bounds.maxY);
    }

    /**
     * Connect to compositor WebSocket for camera sync
     */
    connectToCompositor() {
        console.log('📷 Connecting to compositor WebSocket:', this.config.websocketUrl);

        try {
            this.ws = new WebSocket(this.config.websocketUrl);

            this.ws.onopen = () => {
                console.log('✅ Connected to compositor WebSocket');
                this.wsReconnectAttempts = 0;
                this.emit('connected');
            };

            this.ws.onmessage = (event) => {
                try {
                    const msg = JSON.parse(event.data);
                    this.handleCompositorMessage(msg);
                } catch (e) {
                    console.warn('⚠️  Failed to parse compositor message:', e);
                }
            };

            this.ws.onerror = (error) => {
                console.error('❌ WebSocket error:', error);
                this.emit('error', error);
            };

            this.ws.onclose = () => {
                console.log('📷 Disconnected from compositor WebSocket');
                this.emit('disconnected');

                // Attempt to reconnect
                if (this.wsReconnectAttempts < this.maxReconnectAttempts) {
                    this.wsReconnectAttempts++;
                    const delay = Math.min(1000 * Math.pow(2, this.wsReconnectAttempts), 30000);
                    console.log(`🔄 Reconnecting in ${delay}ms... (attempt ${this.wsReconnectAttempts}/${this.maxReconnectAttempts})`);

                    setTimeout(() => {
                        this.connectToCompositor();
                    }, delay);
                }
            };
        } catch (e) {
            console.error('❌ Failed to create WebSocket connection:', e);
        }
    }

    /**
     * Handle messages from compositor
     */
    handleCompositorMessage(msg) {
        switch (msg.type) {
            case 'camera_update':
                this.handleCameraUpdate(msg);
                break;
            case 'heartbeat':
                // Respond to heartbeat
                if (this.ws && this.ws.readyState === WebSocket.OPEN) {
                    this.ws.send(JSON.stringify({ type: 'heartbeat', timestamp: Date.now() }));
                }
                break;
            default:
                this.emit('message', msg);
        }
    }

    /**
     * Handle camera update from compositor
     */
    handleCameraUpdate(msg) {
        const { x, y, zoom } = msg;
        this.setPosition(x, y, false);
        this.setZoom(zoom, false);
        this.emit('camera_sync', { x, y, zoom });
    }

    /**
     * Send camera state to compositor
     */
    sendCameraUpdate() {
        if (this.ws && this.ws.readyState === WebSocket.OPEN) {
            this.ws.send(JSON.stringify({
                type: 'camera_update',
                x: this.camera.x,
                y: this.camera.y,
                zoom: this.camera.zoom,
                timestamp: Date.now()
            }));
        }
    }

    /**
     * Event handling
     */
    on(event, callback) {
        if (!this.eventListeners.has(event)) {
            this.eventListeners.set(event, new Set());
        }
        this.eventListeners.get(event).add(callback);
    }

    off(event, callback) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).delete(callback);
        }
    }

    emit(event, data) {
        if (this.eventListeners.has(event)) {
            this.eventListeners.get(event).forEach(callback => callback(data));
        }
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            camera: this.getCamera(),
            target: this.getTargetCamera(),
            screen: { width: this.screenWidth, height: this.screenHeight },
            bounds: this.getVisibleBounds(),
            connected: this.ws && this.ws.readyState === WebSocket.OPEN
        };
    }

    /**
     * Destroy the viewport manager
     */
    destroy() {
        // Remove resize listener
        window.removeEventListener('resize', this._handleResize);

        // Close WebSocket
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        // Clear event listeners
        this.eventListeners.clear();

        console.log('📷 ViewportManager destroyed');
    }
}

/**
 * CameraController - High-level camera control with gestures
 * 
 * @class CameraController
 */
class CameraController {
    /**
     * @param {ViewportManager} viewport - ViewportManager instance
     * @param {Object} config - Configuration
     */
    constructor(viewport, config = {}) {
        this.viewport = viewport;
        this.config = {
            enableMouse: true,
            enableKeyboard: true,
            enableWheel: true,
            enableTouch: true,
            panSpeed: 5,
            zoomSpeed: 0.001,
            minZoom: 0.1,
            maxZoom: 10.0,
            ...config
        };

        // Interaction state
        this.isDragging = false;
        this.lastMousePos = { x: 0, y: 0 };
        this.lastTouchDist = 0;

        // Bind event handlers

        console.log('🎮 CameraController initialized');
    }
}

// Global export for browser
if (typeof window !== 'undefined') {
    window.ViewportManager = ViewportManager;
    window.CameraController = CameraController;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        ViewportManager,
        CameraController
    };
}
