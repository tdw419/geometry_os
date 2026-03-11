/**
 * VisualVerificationBridge - Phase 50: Advanced Visual Tools
 *
 * Bridge between Python VisualVerificationService and JS visual_shell.
 * Enables real-time visualization of AI's verification process.
 *
 * Features:
 * - WebSocket connection to EvolutionDaemon
 * - Event dispatching for VisualDebugOverlay
 * - Intent/result serialization
 * - Scene capture from mirror neuron
 * - Retry suggestion visualization
 *
 * @class VisualVerificationBridge
 */

class VisualVerificationBridge {
    constructor(config = {}) {
        this.config = {
            wsUrl: config.wsUrl || 'ws://localhost:8766',
            reconnectInterval: config.reconnectInterval || 3000,
            maxReconnectAttempts: config.maxReconnectAttempts || 10,
            debugMode: config.debugMode || false,
            ...config
        };

        // State
        this.ws = null;
        this.connected = false;
        this.reconnectAttempts = 0;
        this.messageQueue = [];

        // Callbacks
        this.onConnected = null;
        this.onDisconnected = null;
        this.onVerificationResult = null;
        this.onIntentUpdate = null;
        this.onSceneUpdate = null;

        // References
        this.debugOverlay = null;
        this.sceneCapturer = null;

        // Performance tracking
        this.stats = {
            messagesReceived: 0,
            messagesSent: 0,
            reconnects: 0,
            lastLatency: 0
        };
    }

    /**
     * Initialize the bridge
     */
    async initialize() {
        console.log('[VisualVerificationBridge] Initializing...');

        // Find or create debug overlay
        if (window.VisualDebugOverlay) {
            this.debugOverlay = new window.VisualDebugOverlay();
            window.visualDebugOverlay = this.debugOverlay;
        }

        // Connect to WebSocket
        await this._connect();

        console.log('[VisualVerificationBridge] Ready');
    }

    /**
     * Connect to WebSocket
     */
    async _connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.config.wsUrl);

                this.ws.onopen = () => {
                    console.log('[VisualVerificationBridge] Connected to EvolutionDaemon');
                    this.connected = true;
                    this.reconnectAttempts = 0;

                    // Send queued messages
                    this._flushMessageQueue();

                    // Subscribe to verification events
                    this._subscribeToEvents();

                    if (this.onConnected) {
                        this.onConnected();
                    }

                    resolve();
                };

                this.ws.onclose = () => {
                    console.log('[VisualVerificationBridge] Disconnected');
                    this.connected = false;

                    if (this.onDisconnected) {
                        this.onDisconnected();
                    }

                    // Attempt reconnect
                    this._scheduleReconnect();
                };

                this.ws.onerror = (error) => {
                    console.error('[VisualVerificationBridge] WebSocket error:', error);
                    reject(error);
                };

                this.ws.onmessage = (event) => {
                    this._handleMessage(event);
                };

            } catch (error) {
                console.error('[VisualVerificationBridge] Connection failed:', error);
                this._scheduleReconnect();
                reject(error);
            }
        });
    }

    /**
     * Schedule reconnection attempt
     */
    _scheduleReconnect() {
        if (this.reconnectAttempts >= this.config.maxReconnectAttempts) {
            console.error('[VisualVerificationBridge] Max reconnect attempts reached');
            return;
        }

        this.reconnectAttempts++;
        this.stats.reconnects++;

        console.log(`[VisualVerificationBridge] Reconnecting in ${this.config.reconnectInterval}ms (attempt ${this.reconnectAttempts})`);

        setTimeout(() => {
            this._connect().catch(() => {});
        }, this.config.reconnectInterval);
    }

    /**
     * Subscribe to verification events from backend
     */
    _subscribeToEvents() {
        this._send({
            type: 'subscribe',
            events: [
                'verification_result',
                'intent_update',
                'scene_update',
                'retry_suggested',
                'escalation_required'
            ]
        });
    }

    /**
     * Handle incoming message
     */
    _handleMessage(event) {
        const startTime = performance.now();
        this.stats.messagesReceived++;

        try {
            const message = JSON.parse(event.data);

            if (this.config.debugMode) {
                console.log('[VisualVerificationBridge] Received:', message);
            }

            // Route message to appropriate handler
            switch (message.type) {
                case 'verification_result':
                    this._handleVerificationResult(message.data);
                    break;

                case 'intent_update':
                    this._handleIntentUpdate(message.data);
                    break;

                case 'scene_update':
                    this._handleSceneUpdate(message.data);
                    break;

                case 'retry_suggested':
                    this._handleRetrySuggested(message.data);
                    break;

                case 'escalation_required':
                    this._handleEscalationRequired(message.data);
                    break;

                default:
                    if (this.config.debugMode) {
                        console.log('[VisualVerificationBridge] Unknown message type:', message.type);
                    }
            }

            // Track latency
            this.stats.lastLatency = performance.now() - startTime;

        } catch (error) {
            console.error('[VisualVerificationBridge] Failed to parse message:', error);
        }
    }

    /**
     * Handle verification result
     */
    _handleVerificationResult(data) {
        // Dispatch to window event
        window.dispatchEvent(new CustomEvent('VISUAL_VERIFICATION_RESULT', {
            detail: data
        }));

        // Update debug overlay
        if (this.debugOverlay) {
            this.debugOverlay.handleVerificationResult(data);
        }

        // Callback
        if (this.onVerificationResult) {
            this.onVerificationResult(data);
        }

        // Log significant results
        if (!data.success || data.should_escalate) {
            console.log('[VisualVerificationBridge] Verification result:', {
                success: data.success,
                confidence: data.overall_confidence,
                shouldRetry: data.should_retry,
                shouldEscalate: data.should_escalate,
                summary: data.summary
            });
        }
    }

    /**
     * Handle intent update
     */
    _handleIntentUpdate(data) {
        window.dispatchEvent(new CustomEvent('VISUAL_INTENT_UPDATE', {
            detail: data
        }));

        if (this.debugOverlay) {
            this.debugOverlay.handleIntentUpdate(data);
        }

        if (this.onIntentUpdate) {
            this.onIntentUpdate(data);
        }
    }

    /**
     * Handle scene update
     */
    _handleSceneUpdate(data) {
        window.dispatchEvent(new CustomEvent('VISUAL_SCENE_UPDATE', {
            detail: data
        }));

        if (this.debugOverlay) {
            this.debugOverlay.handleSceneUpdate(data);
        }

        if (this.onSceneUpdate) {
            this.onSceneUpdate(data);
        }
    }

    /**
     * Handle retry suggestion
     */
    _handleRetrySuggested(data) {
        console.log('[VisualVerificationBridge] Retry suggested:', data.suggestions);

        window.dispatchEvent(new CustomEvent('VISUAL_RETRY_SUGGESTED', {
            detail: data
        }));
    }

    /**
     * Handle escalation requirement
     */
    _handleEscalationRequired(data) {
        console.warn('[VisualVerificationBridge] Human review required:', data);

        window.dispatchEvent(new CustomEvent('VISUAL_ESCALATION_REQUIRED', {
            detail: data
        }));

        // Could show a notification here
        if (window.visualShellNotification) {
            window.visualShellNotification({
                type: 'warning',
                title: 'Human Review Required',
                message: data.summary || 'Visual verification needs human attention',
                timeout: 10000
            });
        }
    }

    /**
     * Send message to backend
     */
    _send(message) {
        if (!this.connected) {
            this.messageQueue.push(message);
            return false;
        }

        try {
            this.ws.send(JSON.stringify(message));
            this.stats.messagesSent++;
            return true;
        } catch (error) {
            console.error('[VisualVerificationBridge] Send failed:', error);
            return false;
        }
    }

    /**
     * Flush queued messages
     */
    _flushMessageQueue() {
        while (this.messageQueue.length > 0) {
            const message = this.messageQueue.shift();
            this._send(message);
        }
    }

    /**
     * Request current scene from mirror neuron
     */
    requestScene() {
        this._send({
            type: 'get_scene'
        });
    }

    /**
     * Request verification for an element
     */
    requestVerification(elementId) {
        this._send({
            type: 'request_verification',
            elementId
        });
    }

    /**
     * Acknowledge escalation (human reviewed)
     */
    acknowledgeEscalation(taskId, approved) {
        this._send({
            type: 'acknowledge_escalation',
            taskId,
            approved
        });
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            connected: this.connected,
            queuedMessages: this.messageQueue.length,
            debugOverlayEnabled: this.debugOverlay?.config?.enabled || false
        };
    }

    /**
     * Disconnect
     */
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
        this.connected = false;
    }

    /**
     * Destroy the bridge
     */
    destroy() {
        this.disconnect();

        if (this.debugOverlay) {
            this.debugOverlay.destroy();
            this.debugOverlay = null;
        }

        this.messageQueue = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.VisualVerificationBridge = VisualVerificationBridge;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VisualVerificationBridge };
}
