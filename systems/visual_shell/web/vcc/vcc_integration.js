/**
 * VCC Integration Module
 * 
 * Main integration point for the Visual Consistency Contract.
 * Orchestrates ConsistencyOracle, HealthOverlayRenderer, VisualContractPolicy,
 * and CanaryWebSocketBridge to provide real-time health monitoring.
 * 
 * Usage:
 *   const vcc = new VCCIntegration(infiniteMap);
 *   await vcc.initialize();
 *   vcc.enableForViewport();
 */

/**
 * VCC Integration Configuration
 */
const VCC_DEFAULT_CONFIG = {
    // WebSocket connection
    canaryUrl: 'ws://localhost:8766/vcc',
    
    // Oracle settings
    maxCachedTiles: 10000,
    healthTTL: 300000, // 5 minutes
    
    // Visual settings
    enableOverlays: true,
    enableChromaticAberration: true,
    enableFractureOverlays: true,
    
    // Policy settings
    autoRetranspile: true,
    retranspileThreshold: 0.85,
    circuitBreakerEnabled: true,
    
    // Analysis settings
    analyzeOnLoad: true,
    batchAnalysisSize: 5,
    analysisDebounceMs: 500,
    
    // Debug
    debug: false,
    logLevel: 'warn' // 'debug' | 'info' | 'warn' | 'error'
};

/**
 * VCC Integration
 * 
 * Main class that wires together all VCC components.
 */
class VCCIntegration {
    constructor(infiniteMap, options = {}) {
        this.map = infiniteMap;
        this.config = { ...VCC_DEFAULT_CONFIG, ...options };
        
        // Components (initialized in initialize())
        this.oracle = null;
        this.renderer = null;
        this.policy = null;
        this.bridge = null;
        
        // State
        this.initialized = false;
        this.enabled = false;
        this.viewportSubscribed = false;
        
        // Debounce timer for analysis requests
        this.analysisTimer = null;
        
        // Tile tracking for current viewport
        this.visibleTiles = new Set();
        
        // Debug logging
        this._log('VCCIntegration created');
    }

    /**
     * Initialize all VCC components
     */
    async initialize() {
        if (this.initialized) return;
        
        this._log('Initializing VCC Integration...');
        
        // 1. Initialize ConsistencyOracle
        this.oracle = new ConsistencyOracle({
            maxCacheSize: this.config.maxCachedTiles,
            ttlMs: this.config.healthTTL,
            enablePersistence: true
        });
        
        // 2. Initialize HealthOverlayRenderer
        if (this.config.enableOverlays) {
            this.renderer = new HealthOverlayRenderer(this.map, {
                enableChromaticAberration: this.config.enableChromaticAberration,
                enableFractureOverlays: this.config.enableFractureOverlays
            });
        }
        
        // 3. Initialize VisualContractPolicy
        this.policy = new VisualContractPolicy(this.oracle, {
            retranspile: {
                enabled: this.config.autoRetranspile,
                threshold: this.config.retranspileThreshold
            },
            circuitBreaker: {
                enabled: this.config.circuitBreakerEnabled
            }
        });
        
        // 4. Initialize CanaryWebSocketBridge
        this.bridge = new CanaryWebSocketBridge({
            websocketUrl: this.config.canaryUrl,
            batchSize: this.config.batchAnalysisSize
        });
        
        // 5. Wire up event handlers
        this._wireEventHandlers();
        
        // 6. Connect to Canary
        try {
            await this.bridge.connect();
            this._log('Connected to Tectonic Canary');
        } catch (e) {
            this._warn('Failed to connect to Canary, will retry:', e.message);
            // Continue - will retry automatically
        }
        
        this.initialized = true;
        this._log('VCC Integration initialized');
        
        return this;
    }

    /**
     * Enable VCC for the current viewport
     */
    enableForViewport() {
        if (!this.initialized) {
            throw new Error('VCC not initialized. Call initialize() first.');
        }
        
        if (this.enabled) return;
        
        this._log('Enabling VCC for viewport...');
        
        // Hook into infinite map's tile loading
        this._hookTileLoading();
        
        // Subscribe to current visible tiles
        this._subscribeVisibleTiles();
        
        // Start viewport monitoring
        this._startViewportMonitoring();
        
        this.enabled = true;
        this._log('VCC enabled for viewport');
    }

    /**
     * Disable VCC
     */
    disable() {
        if (!this.enabled) return;
        
        this._log('Disabling VCC...');
        
        // Unsubscribe from tiles
        if (this.bridge) {
            this.bridge.unsubscribeTiles(Array.from(this.visibleTiles));
        }
        
        // Clear overlays
        if (this.renderer) {
            this.renderer.clear();
        }
        
        // Stop viewport monitoring
        this._stopViewportMonitoring();
        
        this.enabled = false;
        this.visibleTiles.clear();
        
        this._log('VCC disabled');
    }

    /**
     * Manually request analysis for specific tiles
     */
    async analyzeTiles(tileConfigs) {
        if (!this.initialized) {
            throw new Error('VCC not initialized');
        }
        
        await this.bridge.requestAnalysis(tileConfigs);
    }

    /**
     * Get health summary for current viewport
     */
    getViewportHealth() {
        if (!this.oracle) return null;
        return this.oracle.getViewportHealth(Array.from(this.visibleTiles));
    }

    /**
     * Get VCC statistics
     */
    getStats() {
        return {
            oracle: this.oracle?.getStats(),
            bridge: this.bridge?.getStats(),
            visibleTiles: this.visibleTiles.size,
            enabled: this.enabled,
            initialized: this.initialized
        };
    }

    /**
     * Set configuration option
     */
    setConfig(key, value) {
        this.config[key] = value;
        
        // Propagate to components
        if (key === 'enableOverlays' && this.renderer) {
            this.renderer.setVisible(value);
        }
    }

    /**
     * Wire up event handlers between components
     */
    _wireEventHandlers() {
        // Bridge -> Oracle: Update health data
        this.bridge.on('healthReport', (report) => {
            this._handleHealthReport(report);
        });
        
        // Bridge -> Batch complete
        this.bridge.on('batchComplete', (data) => {
            this._log('Batch analysis complete:', data.results.length, 'tiles');
        });
        
        // Oracle -> Policy: Evaluate on status change
        this.oracle.subscribe((event, data) => {
            if (event === 'statusChange') {
                this._handleStatusChange(data);
            }
        });
        
        // Policy -> Visual feedback
        this.policy.subscribe((tileKey, action) => {
            this._handlePolicyViolation(tileKey, action);
        });
        
        // Bridge connection events
        this.bridge.on('connect', () => {
            this._log('Connected to Tectonic Canary');
            if (this.enabled) {
                this._resubscribeVisibleTiles();
            }
        });
        
        this.bridge.on('disconnect', () => {
            this._warn('Disconnected from Tectonic Canary');
        });
    }

    /**
     * Handle health report from Canary
     */
    _handleHealthReport(report) {
        const { tileKey, vPasScore, status, artifacts, semanticCoherence, spectralStability, textureEntropy, textureHash } = report;
        
        // Update oracle
        const entry = this.oracle.updateHealth(tileKey, {
            v_pas_score: vPasScore,
            status,
            artifacts,
            semantic_coherence: semanticCoherence,
            spectral_stability: spectralStability,
            texture_entropy: textureEntropy,
            texture_hash: textureHash
        });
        
        // Update visual overlay
        if (this.renderer && this.visibleTiles.has(tileKey)) {
            const tileSprite = this.map.tiles.get(tileKey)?.sprite;
            if (tileSprite) {
                this.renderer.renderTileHealth(tileKey, tileSprite, entry);
            }
        }
        
        // Evaluate policy
        this.policy.evaluate(tileKey, entry);
        
        this._log(`Health update for ${tileKey}: ${status} (V-PAS: ${vPasScore.toFixed(4)})`);
    }

    /**
     * Handle status change
     */
    _handleStatusChange(data) {
        const { tileKey, oldStatus, newStatus, entry } = data;
        
        this._log(`Status change for ${tileKey}: ${oldStatus} -> ${newStatus}`);
        
        // Send visual feedback to Canary (bidirectional)
        this.bridge.sendVisualFeedback(tileKey, {
            effectActivated: true,
            statusChange: { from: oldStatus, to: newStatus },
            timestamp: Date.now()
        });
    }

    /**
     * Handle policy violation
     */
    _handlePolicyViolation(tileKey, action) {
        this._log(`Policy violation on ${tileKey}:`, action.type, action.severity);
        
        // Additional visual feedback for critical violations
        if (action.severity === 'CRITICAL' && this.renderer) {
            // Could trigger additional visual effects here
        }
    }

    /**
     * Hook into infinite map's tile loading
     */
    _hookTileLoading() {
        // Store reference to original tile loading method
        const originalLoadTile = this.map._loadTile?.bind(this.map) || this.map.loadTile?.bind(this.map);
        
        if (!originalLoadTile) {
            this._warn('Could not hook tile loading - method not found');
            return;
        }
        
        // Override to track loaded tiles
        this.map._loadTile = async (tileKey, ...args) => {
            const result = await originalLoadTile(tileKey, ...args);
            
            // Track this tile
            this.visibleTiles.add(tileKey);
            
            // Schedule analysis
            this._scheduleAnalysis(tileKey);
            
            return result;
        };
        
        // Hook tile unload
        const originalUnloadTile = this.map._unloadTile?.bind(this.map) || this.map.unloadTile?.bind(this.map);
        if (originalUnloadTile) {
            this.map._unloadTile = (tileKey, ...args) => {
                this.visibleTiles.delete(tileKey);
                this.renderer?.removeTileHealth(tileKey);
                return originalUnloadTile(tileKey, ...args);
            };
        }
    }

    /**
     * Subscribe to currently visible tiles
     */
    _subscribeVisibleTiles() {
        // Get currently visible tiles from map
        for (const [tileKey, tileData] of this.map.tiles) {
            this.visibleTiles.add(tileKey);
        }
        
        if (this.visibleTiles.size > 0) {
            this.bridge.subscribeTiles(Array.from(this.visibleTiles));
            
            // Request analysis for visible tiles
            const tileConfigs = Array.from(this.visibleTiles).map(key => ({
                tileKey: key,
                // Would need to get actual texture path from map
                texturePath: this._getTileTexturePath(key)
            }));
            
            this.bridge.requestAnalysis(tileConfigs);
        }
    }

    /**
     * Resubscribe visible tiles (after reconnection)
     */
    _resubscribeVisibleTiles() {
        if (this.visibleTiles.size > 0) {
            this.bridge.subscribeTiles(Array.from(this.visibleTiles));
        }
    }

    /**
     * Schedule analysis for a tile (debounced)
     */
    _scheduleAnalysis(tileKey) {
        clearTimeout(this.analysisTimer);
        
        this.analysisTimer = setTimeout(() => {
            if (!this.visibleTiles.has(tileKey)) return;
            
            const config = {
                tileKey,
                texturePath: this._getTileTexturePath(tileKey)
            };
            
            this.bridge.requestAnalysis([config]);
        }, this.config.analysisDebounceMs);
    }

    /**
     * Start monitoring viewport changes
     */
    _startViewportMonitoring() {
        // Poll for viewport changes
        this.viewportMonitor = setInterval(() => {
            this._checkViewportHealth();
        }, 5000);
    }

    /**
     * Stop viewport monitoring
     */
    _stopViewportMonitoring() {
        if (this.viewportMonitor) {
            clearInterval(this.viewportMonitor);
            this.viewportMonitor = null;
        }
    }

    /**
     * Check overall viewport health
     */
    _checkViewportHealth() {
        const summary = this.getViewportHealth();
        if (!summary) return;
        
        // Evaluate viewport-wide policies
        this.policy.evaluateViewport(summary);
        
        // Log health status
        if (summary.riskScore > 0.3) {
            this._warn(`Viewport health degraded: risk score ${summary.riskScore.toFixed(2)}`);
        }
    }

    /**
     * Get texture path for a tile (placeholder)
     */
    _getTileTexturePath(tileKey) {
        // This would need to be implemented based on how the map stores texture info
        // For now, return a placeholder
        return `/builder/tiles/${tileKey}.rts.png`;
    }

    /**
     * Debug logging
     */
    _log(...args) {
        if (this.config.debug || this.config.logLevel === 'debug') {
            console.log('[VCC]', ...args);
        }
    }

    _warn(...args) {
        if (['debug', 'info', 'warn'].includes(this.config.logLevel)) {
            console.warn('[VCC]', ...args);
        }
    }

    _error(...args) {
        console.error('[VCC]', ...args);
    }

    /**
     * Destroy VCC integration
     */
    destroy() {
        this.disable();
        
        this.bridge?.disconnect();
        this.policy?.destroy();
        this.renderer?.destroy();
        this.oracle?.clear();
        
        this.initialized = false;
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VCCIntegration, VCC_DEFAULT_CONFIG };
}
