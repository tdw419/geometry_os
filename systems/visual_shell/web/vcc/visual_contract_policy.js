/**
 * Visual Contract Policy (VCP)
 * 
 * Decision engine for the Visual Consistency Contract.
 * Defines policies for auto-retranspile, alerts, and system responses
 * based on V-PAS scores and health status transitions.
 * 
 * Policies:
 * - Auto-retranspile: Trigger rebuild when V-PAS < threshold
 * - Alert escalation: Notify agents of health degradation
 * - Visual feedback: Activate effects based on status
 * - Circuit breaker: Disable corrupted tiles from execution
 */

/**
 * Policy action types
 */
const PolicyAction = {
    RETRANSMPILE: 'RETRANSMPILE',       // Rebuild the texture
    ALERT: 'ALERT',                     // Notify monitoring system
    VISUAL_EFFECT: 'VISUAL_EFFECT',     // Activate visual feedback
    CIRCUIT_BREAK: 'CIRCUIT_BREAK',     // Disable execution on tile
    QUARANTINE: 'QUARANTINE',           // Isolate corrupted tile
    ROLLBACK: 'ROLLBACK',               // Revert to previous version
    INSPECT: 'INSPECT'                  // Request detailed analysis
};

/**
 * Policy severity levels
 */
const PolicySeverity = {
    INFO: 'INFO',
    LOW: 'LOW',
    MEDIUM: 'MEDIUM',
    HIGH: 'HIGH',
    CRITICAL: 'CRITICAL'
};

/**
 * Default policy configuration
 */
const DEFAULT_POLICIES = {
    // Auto-retranspile triggers
    retranspile: {
        enabled: true,
        threshold: VPAS_THRESHOLDS.WARNING, // < 0.85 triggers retranspile
        cooldownMs: 30000,                   // Min 30s between retranspiles
        maxAttempts: 3,                      // Max retranspile attempts
        backoffMultiplier: 2                 // Exponential backoff
    },
    
    // Alert configuration
    alerts: {
        enabled: true,
        onStatusChange: true,
        onThresholdCross: true,
        thresholds: {
            [HealthStatus.WARNING]: PolicySeverity.LOW,
            [HealthStatus.CRITICAL]: PolicySeverity.HIGH,
            [HealthStatus.CORRUPTED]: PolicySeverity.CRITICAL
        }
    },
    
    // Visual feedback rules
    visualFeedback: {
        enabled: true,
        effects: {
            [HealthStatus.OPTIMAL]: ['border_glow_optimal'],
            [HealthStatus.STABLE]: ['border_glow_stable'],
            [HealthStatus.WARNING]: ['border_glow_warning', 'scanlines_light'],
            [HealthStatus.CRITICAL]: ['border_glow_critical', 'scanlines_heavy', 'chromatic_aberration'],
            [HealthStatus.CORRUPTED]: ['border_glow_corrupted', 'scanlines_heavy', 'chromatic_aberration', 'fracture_overlay']
        }
    },
    
    // Circuit breaker configuration
    circuitBreaker: {
        enabled: true,
        triggerThreshold: VPAS_THRESHOLDS.CRITICAL, // Disable execution below 0.70
        recoveryThreshold: VPAS_THRESHOLDS.WARNING,  // Re-enable at 0.85
        failureCountThreshold: 3,                    // Consecutive failures before break
        recoveryTimeoutMs: 60000                     // Auto-recovery attempt after 60s
    },
    
    // Quarantine settings
    quarantine: {
        enabled: true,
        triggerThreshold: VPAS_THRESHOLDS.CRITICAL,
        isolateNeighbors: true,    // Also quarantine adjacent tiles
        neighborRadius: 1
    },
    
    // Viewport-wide policies
    viewport: {
        maxCorruptedRatio: 0.1,    // Max 10% corrupted tiles in viewport
        maxWarningRatio: 0.3,      // Max 30% warning+critical+corrupted
        panicThreshold: 0.5        // >50% corrupted triggers system alert
    }
};

/**
 * VisualContractPolicy
 * 
 * Evaluates health entries and enforces policies.
 */
class VisualContractPolicy {
    constructor(consistencyOracle, options = {}) {
        this.oracle = consistencyOracle;
        this.config = this._mergeConfig(DEFAULT_POLICIES, options);
        
        // Action history for cooldown tracking
        this.actionHistory = new Map(); // tileKey -> { action, timestamp, attemptCount }
        
        // Circuit breaker state
        this.circuitBreakers = new Map(); // tileKey -> { open, failureCount, lastFailure }
        
        // Quarantine registry
        this.quarantineRegistry = new Set();
        
        // Policy violation listeners
        this.violationListeners = new Set();
        
        // Subscribe to oracle events
        this._unsubscribe = this.oracle.subscribe((event, data) => {
            this._handleOracleEvent(event, data);
        });
        
        console.log('📜 VisualContractPolicy initialized');
    }

    /**
     * Evaluate health entry and trigger appropriate policies
     */
    evaluate(tileKey, healthEntry, previousEntry = null) {
        const actions = [];
        
        // Check for status change
        const previousStatus = previousEntry?.status || null;
        const currentStatus = healthEntry.status;
        
        if (previousStatus !== currentStatus) {
            actions.push(...this._evaluateStatusChange(tileKey, healthEntry, previousStatus));
        }
        
        // Check threshold crossings
        actions.push(...this._evaluateThresholdCrossings(tileKey, healthEntry, previousEntry));
        
        // Check circuit breaker
        actions.push(...this._evaluateCircuitBreaker(tileKey, healthEntry));
        
        // Check quarantine rules
        actions.push(...this._evaluateQuarantine(tileKey, healthEntry));
        
        // Filter out actions on cooldown
        const executableActions = actions.filter(a => this._canExecute(tileKey, a));
        
        // Execute actions
        for (const action of executableActions) {
            this._executeAction(tileKey, action, healthEntry);
        }
        
        return executableActions;
    }

    /**
     * Evaluate viewport-wide policies
     */
    evaluateViewport(viewportSummary) {
        const actions = [];
        const { corrupted, warning, critical } = viewportSummary.statuses;
        const total = viewportSummary.total;
        
        const corruptedRatio = corrupted / total;
        const warningRatio = (corrupted + warning + critical) / total;
        
        // Check max corrupted ratio
        if (corruptedRatio > this.config.viewport.maxCorruptedRatio) {
            actions.push({
                type: PolicyAction.ALERT,
                severity: PolicySeverity.HIGH,
                message: `Viewport corrupted ratio ${(corruptedRatio * 100).toFixed(1)}% exceeds threshold`,
                metadata: { corruptedRatio, threshold: this.config.viewport.maxCorruptedRatio }
            });
        }
        
        // Check panic threshold
        if (corruptedRatio > this.config.viewport.panicThreshold) {
            actions.push({
                type: PolicyAction.ALERT,
                severity: PolicySeverity.CRITICAL,
                message: `VIEWPORT PANIC: ${(corruptedRatio * 100).toFixed(1)}% tiles corrupted`,
                metadata: { corruptedRatio }
            });
        }
        
        // Check max warning ratio
        if (warningRatio > this.config.viewport.maxWarningRatio) {
            actions.push({
                type: PolicyAction.INSPECT,
                severity: PolicySeverity.MEDIUM,
                message: `Viewport health degraded: ${(warningRatio * 100).toFixed(1)}% tiles at risk`,
                metadata: { warningRatio }
            });
        }
        
        // Execute viewport actions
        for (const action of actions) {
            this._notifyViolation('viewport', action);
        }
        
        return actions;
    }

    /**
     * Check if a tile is circuit-broken (execution disabled)
     */
    isCircuitBroken(tileKey) {
        const breaker = this.circuitBreakers.get(tileKey);
        if (!breaker) return false;
        
        // Check if recovery threshold is met
        const entry = this.oracle.getHealth(tileKey);
        if (entry && entry.vPasScore >= this.config.circuitBreaker.recoveryThreshold) {
            this._recoverCircuitBreaker(tileKey);
            return false;
        }
        
        return breaker.open;
    }

    /**
     * Check if a tile is quarantined
     */
    isQuarantined(tileKey) {
        return this.quarantineRegistry.has(tileKey);
    }

    /**
     * Manually trigger retranspile for a tile
     */
    async triggerRetranspile(tileKey, texturePath) {
        const action = {
            type: PolicyAction.RETRANSMPILE,
            severity: PolicySeverity.MEDIUM,
            message: `Manual retranspile triggered for ${tileKey}`,
            metadata: { tileKey, texturePath }
        };
        
        return this._executeRetranspile(tileKey, action);
    }

    /**
     * Get visual effects for a health status
     */
    getVisualEffects(status) {
        if (!this.config.visualFeedback.enabled) return [];
        return this.config.visualFeedback.effects[status] || [];
    }

    /**
     * Evaluate status change policies
     */
    _evaluateStatusChange(tileKey, healthEntry, previousStatus) {
        const actions = [];
        const currentStatus = healthEntry.status;
        
        if (!this.config.alerts.enabled || !this.config.alerts.onStatusChange) {
            return actions;
        }
        
        // Alert on degradation
        const severityOrder = [HealthStatus.OPTIMAL, HealthStatus.STABLE, HealthStatus.WARNING, HealthStatus.CRITICAL, HealthStatus.CORRUPTED];
        const prevIndex = severityOrder.indexOf(previousStatus);
        const currIndex = severityOrder.indexOf(currentStatus);
        
        if (currIndex > prevIndex) {
            // Status degraded
            const severity = this.config.alerts.thresholds[currentStatus] || PolicySeverity.LOW;
            actions.push({
                type: PolicyAction.ALERT,
                severity,
                message: `Health degraded: ${previousStatus} → ${currentStatus} (V-PAS: ${healthEntry.vPasScore.toFixed(4)})`,
                metadata: { previousStatus, currentStatus, vPasScore: healthEntry.vPasScore }
            });
        }
        
        return actions;
    }

    /**
     * Evaluate threshold crossing policies
     */
    _evaluateThresholdCrossings(tileKey, healthEntry, previousEntry) {
        const actions = [];
        const vPas = healthEntry.vPasScore;
        const prevVPas = previousEntry?.vPasScore || 1.0;
        
        // Auto-retranspile policy
        if (this.config.retranspile.enabled && vPas < this.config.retranspile.threshold) {
            // Only trigger if crossing below threshold
            if (prevVPas >= this.config.retranspile.threshold) {
                actions.push({
                    type: PolicyAction.RETRANSMPILE,
                    severity: PolicySeverity.HIGH,
                    message: `V-PAS ${vPas.toFixed(4)} crossed below threshold ${this.config.retranspile.threshold}`,
                    metadata: { vPas, threshold: this.config.retranspile.threshold }
                });
            }
        }
        
        return actions;
    }

    /**
     * Evaluate circuit breaker policy
     */
    _evaluateCircuitBreaker(tileKey, healthEntry) {
        const actions = [];
        
        if (!this.config.circuitBreaker.enabled) return actions;
        
        const vPas = healthEntry.vPasScore;
        const threshold = this.config.circuitBreaker.triggerThreshold;
        
        // Check if we should open circuit
        if (vPas < threshold) {
            let breaker = this.circuitBreakers.get(tileKey);
            
            if (!breaker) {
                breaker = { open: false, failureCount: 0, lastFailure: null };
                this.circuitBreakers.set(tileKey, breaker);
            }
            
            breaker.failureCount++;
            breaker.lastFailure = Date.now();
            
            if (breaker.failureCount >= this.config.circuitBreaker.failureCountThreshold && !breaker.open) {
                breaker.open = true;
                actions.push({
                    type: PolicyAction.CIRCUIT_BREAK,
                    severity: PolicySeverity.HIGH,
                    message: `Circuit breaker opened for ${tileKey} (${breaker.failureCount} failures)`,
                    metadata: { tileKey, failureCount: breaker.failureCount, vPas }
                });
            }
        }
        
        return actions;
    }

    /**
     * Evaluate quarantine policy
     */
    _evaluateQuarantine(tileKey, healthEntry) {
        const actions = [];
        
        if (!this.config.quarantine.enabled) return actions;
        
        const vPas = healthEntry.vPasScore;
        
        if (vPas < this.config.quarantine.triggerThreshold && !this.quarantineRegistry.has(tileKey)) {
            this.quarantineRegistry.add(tileKey);
            
            actions.push({
                type: PolicyAction.QUARANTINE,
                severity: PolicySeverity.CRITICAL,
                message: `Tile ${tileKey} quarantined (V-PAS: ${vPas.toFixed(4)})`,
                metadata: { tileKey, vPas }
            });
            
            // Quarantine neighbors if enabled
            if (this.config.quarantine.isolateNeighbors) {
                const neighbors = this._getNeighborTiles(tileKey);
                for (const neighbor of neighbors) {
                    if (!this.quarantineRegistry.has(neighbor)) {
                        this.quarantineRegistry.add(neighbor);
                        actions.push({
                            type: PolicyAction.QUARANTINE,
                            severity: PolicySeverity.HIGH,
                            message: `Neighbor tile ${neighbor} quarantined (proximity to ${tileKey})`,
                            metadata: { tileKey: neighbor, source: tileKey }
                        });
                    }
                }
            }
        }
        
        return actions;
    }

    /**
     * Execute a policy action
     */
    async _executeAction(tileKey, action, healthEntry) {
        // Record action
        this._recordAction(tileKey, action);
        
        switch (action.type) {
            case PolicyAction.RETRANSMPILE:
                await this._executeRetranspile(tileKey, action);
                break;
            case PolicyAction.ALERT:
                this._executeAlert(tileKey, action, healthEntry);
                break;
            case PolicyAction.CIRCUIT_BREAK:
                this._executeCircuitBreak(tileKey, action);
                break;
            case PolicyAction.QUARANTINE:
                this._executeQuarantine(tileKey, action);
                break;
            case PolicyAction.VISUAL_EFFECT:
                // Visual effects are handled by HealthOverlayRenderer
                break;
            default:
                console.warn(`Unknown policy action: ${action.type}`);
        }
        
        this._notifyViolation(tileKey, action);
    }

    /**
     * Execute retranspile action
     */
    async _executeRetranspile(tileKey, action) {
        console.log(`🔄 Retranspiling ${tileKey}...`);
        
        // Find the SystemServicesAgent endpoint or Foundry API
        const retranspileUrl = '/api/foundry/retranspile';
        
        try {
            const response = await fetch(retranspileUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    tileKey,
                    reason: action.message,
                    urgency: action.severity
                })
            });
            
            if (response.ok) {
                console.log(`✅ Retranspile initiated for ${tileKey}`);
            } else {
                console.error(`❌ Retranspile failed for ${tileKey}:`, await response.text());
            }
        } catch (e) {
            console.error(`❌ Retranspile error for ${tileKey}:`, e);
        }
    }

    /**
     * Execute alert action
     */
    _executeAlert(tileKey, action, healthEntry) {
        // Send to evolution daemon or logging system
        const alertData = {
            timestamp: new Date().toISOString(),
            tileKey,
            severity: action.severity,
            message: action.message,
            vPasScore: healthEntry.vPasScore,
            status: healthEntry.status,
            metadata: action.metadata
        };
        
        // Emit to any connected monitoring systems
        if (window.evolutionBridge) {
            window.evolutionBridge.emit('vcc_alert', alertData);
        }
        
        // Log based on severity
        const logMethod = {
            [PolicySeverity.CRITICAL]: console.error,
            [PolicySeverity.HIGH]: console.warn,
            [PolicySeverity.MEDIUM]: console.warn,
            [PolicySeverity.LOW]: console.info,
            [PolicySeverity.INFO]: console.info
        }[action.severity] || console.log;
        
        logMethod(`[VCC ${action.severity}] ${action.message}`);
    }

    /**
     * Execute circuit break action
     */
    _executeCircuitBreak(tileKey, action) {
        console.warn(`🔒 Circuit breaker activated for ${tileKey}`);
        
        // Notify the infinite map to disable execution
        if (this.map && typeof this.map.disableTileExecution === 'function') {
            this.map.disableTileExecution(tileKey, 'circuit_breaker');
        }
        
        // Set recovery timeout
        setTimeout(() => {
            this._attemptCircuitRecovery(tileKey);
        }, this.config.circuitBreaker.recoveryTimeoutMs);
    }

    /**
     * Execute quarantine action
     */
    _executeQuarantine(tileKey, action) {
        console.error(`🚫 Tile quarantined: ${tileKey}`);
        
        // Notify the infinite map to visually indicate quarantine
        if (this.map && typeof this.map.quarantineTile === 'function') {
            this.map.quarantineTile(tileKey);
        }
    }

    /**
     * Attempt circuit breaker recovery
     */
    _attemptCircuitRecovery(tileKey) {
        const entry = this.oracle.getHealth(tileKey);
        const breaker = this.circuitBreakers.get(tileKey);
        
        if (!breaker || !breaker.open) return;
        
        if (entry && entry.vPasScore >= this.config.circuitBreaker.recoveryThreshold) {
            this._recoverCircuitBreaker(tileKey);
        } else {
            // Schedule another recovery attempt
            setTimeout(() => {
                this._attemptCircuitRecovery(tileKey);
            }, this.config.circuitBreaker.recoveryTimeoutMs);
        }
    }

    /**
     * Recover circuit breaker
     */
    _recoverCircuitBreaker(tileKey) {
        const breaker = this.circuitBreakers.get(tileKey);
        if (breaker) {
            breaker.open = false;
            breaker.failureCount = 0;
            console.log(`🔓 Circuit breaker recovered for ${tileKey}`);
            
            if (this.map && typeof this.map.enableTileExecution === 'function') {
                this.map.enableTileExecution(tileKey);
            }
        }
    }

    /**
     * Check if action can be executed (cooldown check)
     */
    _canExecute(tileKey, action) {
        const key = `${tileKey}:${action.type}`;
        const history = this.actionHistory.get(key);
        
        if (!history) return true;
        
        const cooldown = action.type === PolicyAction.RETRANSMPILE 
            ? this.config.retranspile.cooldownMs 
            : 5000; // Default 5s cooldown
        
        const timeSinceLast = Date.now() - history.timestamp;
        
        // Check attempt limit for retranspile
        if (action.type === PolicyAction.RETRANSMPILE && 
            history.attemptCount >= this.config.retranspile.maxAttempts) {
            return false;
        }
        
        return timeSinceLast > cooldown;
    }

    /**
     * Record action execution
     */
    _recordAction(tileKey, action) {
        const key = `${tileKey}:${action.type}`;
        const existing = this.actionHistory.get(key);
        
        this.actionHistory.set(key, {
            action: action.type,
            timestamp: Date.now(),
            attemptCount: (existing?.attemptCount || 0) + 1
        });
    }

    /**
     * Get neighbor tiles
     */
    _getNeighborTiles(tileKey) {
        const [x, y] = tileKey.split(',').map(Number);
        const radius = this.config.quarantine.neighborRadius;
        const neighbors = [];
        
        for (let dx = -radius; dx <= radius; dx++) {
            for (let dy = -radius; dy <= radius; dy++) {
                if (dx === 0 && dy === 0) continue;
                neighbors.push(`${x + dx},${y + dy}`);
            }
        }
        
        return neighbors;
    }

    /**
     * Handle oracle events
     */
    _handleOracleEvent(event, data) {
        if (event === 'statusChange') {
            this.evaluate(data.tileKey, data.entry, { status: data.oldStatus });
        }
    }

    /**
     * Subscribe to policy violations
     */
    subscribe(callback) {
        this.violationListeners.add(callback);
        return () => this.violationListeners.delete(callback);
    }

    /**
     * Notify violation listeners
     */
    _notifyViolation(tileKey, action) {
        for (const listener of this.violationListeners) {
            try {
                listener(tileKey, action);
            } catch (e) {
                console.error('VCP listener error:', e);
            }
        }
    }

    /**
     * Deep merge configuration
     */
    _mergeConfig(defaults, overrides) {
        const merged = { ...defaults };
        
        for (const key of Object.keys(overrides)) {
            if (typeof overrides[key] === 'object' && !Array.isArray(overrides[key])) {
                merged[key] = this._mergeConfig(defaults[key] || {}, overrides[key]);
            } else {
                merged[key] = overrides[key];
            }
        }
        
        return merged;
    }

    /**
     * Destroy policy engine
     */
    destroy() {
        if (this._unsubscribe) this._unsubscribe();
        this.violationListeners.clear();
        this.actionHistory.clear();
        this.circuitBreakers.clear();
        this.quarantineRegistry.clear();
    }
}

// Export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { 
        VisualContractPolicy, 
        PolicyAction, 
        PolicySeverity,
        DEFAULT_POLICIES 
    };
}
