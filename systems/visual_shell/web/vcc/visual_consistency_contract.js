/**
 * Visual Consistency Contract (VCC)
 * 
 * Enforces PAS scores across the entire infinite map in the PixiJS shell.
 * Bridges Tectonic Canary health analysis with real-time visual feedback.
 * 
 * Core principle: "The screen is the hard drive, and the canary is the eye."
 * 
 * Architecture:
 * - ConsistencyOracle: Central registry for tile health scores
 * - TileIntegrityContract: Per-tile validation and policy enforcement
 * - HealthOverlayRenderer: Visual feedback (overlays, aberration, chromatic effects)
 * - VisualContractPolicy: Decision engine for auto-retranspile and alerts
 */

/**
 * Health status enumeration aligned with Tectonic Canary thresholds
 */
const HealthStatus = {
    OPTIMAL: 'OPTIMAL',   // V-PAS >= 0.95
    STABLE: 'STABLE',     // V-PAS >= 0.90
    WARNING: 'WARNING',   // V-PAS >= 0.85
    CRITICAL: 'CRITICAL', // V-PAS >= 0.70
    CORRUPTED: 'CORRUPTED' // V-PAS < 0.70
};

/**
 * V-PAS Thresholds (mirrors TectonicCanary constants)
 */
const VPAS_THRESHOLDS = {
    OPTIMAL: 0.95,
    STABLE: 0.90,
    WARNING: 0.85,
    CRITICAL: 0.70
};

/**
 * ConsistencyOracle
 * 
 * Central registry that maintains the health state of all visible tiles.
 * Receives streaming health data from Tectonic Canary via WebSocket.
 * Provides content-addressable lookup by tile coordinates and texture hash.
 */
class ConsistencyOracle {
    constructor(options = {}) {
        this.config = {
            maxCacheSize: 10000,        // Maximum tiles to track
            ttlMs: 300000,              // 5 minute TTL for health entries
            enablePersistence: true,    // Save to localStorage
            persistenceKey: 'vcc_oracle_state',
            ...options
        };

        // Health registry: Map<tileKey, HealthEntry>
        // tileKey format: "x,y,zoom" or "textureHash"
        this.registry = new Map();
        
        // Reverse index: textureHash -> Set<tileKeys>
        this.textureIndex = new Map();
        
        // Event listeners for health state changes
        this.listeners = new Set();
        
        // Statistics
        this.stats = {
            totalAnalyzed: 0,
            currentStatuses: {
                [HealthStatus.OPTIMAL]: 0,
                [HealthStatus.STABLE]: 0,
                [HealthStatus.WARNING]: 0,
                [HealthStatus.CRITICAL]: 0,
                [HealthStatus.CORRUPTED]: 0
            }
        };

        // Load persisted state if available
        if (this.config.enablePersistence) {
            this._loadPersistedState();
        }

        // Start TTL cleanup
        this._startCleanupInterval();
    }

    /**
     * Register or update health data for a tile
     */
    updateHealth(tileKey, healthReport) {
        const existing = this.registry.get(tileKey);
        const oldStatus = existing?.status;
        
        // Parse V-PAS score into status
        const status = this._scoreToStatus(healthReport.v_pas_score);
        
        const entry = {
            tileKey,
            timestamp: Date.now(),
            vPasScore: healthReport.v_pas_score,
            semanticCoherence: healthReport.semantic_coherence,
            spectralStability: healthReport.spectral_stability,
            textureEntropy: healthReport.texture_entropy,
            artifacts: healthReport.artifacts || [],
            status,
            textureHash: healthReport.texture_hash || null
        };

        // Update registry
        this.registry.set(tileKey, entry);

        // Update texture index if hash provided
        if (entry.textureHash) {
            if (!this.textureIndex.has(entry.textureHash)) {
                this.textureIndex.set(entry.textureHash, new Set());
            }
            this.textureIndex.get(entry.textureHash).add(tileKey);
        }

        // Update statistics
        if (existing) {
            this.stats.currentStatuses[existing.status]--;
        } else {
            this.stats.totalAnalyzed++;
        }
        this.stats.currentStatuses[status]++;

        // Notify listeners if status changed
        if (oldStatus !== status) {
            this._notifyListeners('statusChange', { tileKey, oldStatus, newStatus: status, entry });
        }

        // Enforce cache size limit (LRU eviction)
        this._enforceCacheLimit();

        return entry;
    }

    /**
     * Get health entry for a specific tile
     */
    getHealth(tileKey) {
        const entry = this.registry.get(tileKey);
        if (!entry) return null;
        
        // Check TTL
        if (Date.now() - entry.timestamp > this.config.ttlMs) {
            this.registry.delete(tileKey);
            return null;
        }
        
        return entry;
    }

    /**
     * Get all tiles using a specific texture hash
     */
    getTilesByTexture(textureHash) {
        const keys = this.textureIndex.get(textureHash);
        if (!keys) return [];
        
        const entries = [];
        for (const key of keys) {
            const entry = this.getHealth(key);
            if (entry) entries.push(entry);
        }
        return entries;
    }

    /**
     * Get health summary for current viewport
     */
    getViewportHealth(tileKeys) {
        const summary = {
            total: tileKeys.length,
            analyzed: 0,
            statuses: {
                [HealthStatus.OPTIMAL]: 0,
                [HealthStatus.STABLE]: 0,
                [HealthStatus.WARNING]: 0,
                [HealthStatus.CRITICAL]: 0,
                [HealthStatus.CORRUPTED]: 0
            },
            averageVPas: 0,
            minVPas: 1.0,
            maxVPas: 0.0,
            riskScore: 0.0 // 0-1, higher = more risk
        };

        let totalVPas = 0;

        for (const key of tileKeys) {
            const entry = this.getHealth(key);
            if (entry) {
                summary.analyzed++;
                summary.statuses[entry.status]++;
                totalVPas += entry.vPasScore;
                summary.minVPas = Math.min(summary.minVPas, entry.vPasScore);
                summary.maxVPas = Math.max(summary.maxVPas, entry.vPasScore);
            }
        }

        if (summary.analyzed > 0) {
            summary.averageVPas = totalVPas / summary.analyzed;
        }

        // Calculate risk score based on status distribution
        summary.riskScore = this._calculateRiskScore(summary.statuses, summary.total);

        return summary;
    }

    /**
     * Subscribe to health state changes
     */
    subscribe(callback) {
        this.listeners.add(callback);
        return () => this.listeners.delete(callback);
    }

    /**
     * Convert V-PAS score to health status
     */
    _scoreToStatus(score) {
        if (score >= VPAS_THRESHOLDS.OPTIMAL) return HealthStatus.OPTIMAL;
        if (score >= VPAS_THRESHOLDS.STABLE) return HealthStatus.STABLE;
        if (score >= VPAS_THRESHOLDS.WARNING) return HealthStatus.WARNING;
        if (score >= VPAS_THRESHOLDS.CRITICAL) return HealthStatus.CRITICAL;
        return HealthStatus.CORRUPTED;
    }

    /**
     * Calculate overall risk score from status distribution
     */
    _calculateRiskScore(statuses, total) {
        const weights = {
            [HealthStatus.OPTIMAL]: 0.0,
            [HealthStatus.STABLE]: 0.1,
            [HealthStatus.WARNING]: 0.4,
            [HealthStatus.CRITICAL]: 0.8,
            [HealthStatus.CORRUPTED]: 1.0
        };

        let weightedSum = 0;
        for (const [status, count] of Object.entries(statuses)) {
            weightedSum += count * weights[status];
        }

        return total > 0 ? weightedSum / total : 0;
    }

    _notifyListeners(event, data) {
        for (const listener of this.listeners) {
            try {
                listener(event, data);
            } catch (e) {
                console.error('VCC Oracle listener error:', e);
            }
        }
    }

    _enforceCacheLimit() {
        if (this.registry.size <= this.config.maxCacheSize) return;

        // LRU eviction: remove oldest entries
        const entries = Array.from(this.registry.entries());
        entries.sort((a, b) => a[1].timestamp - b[1].timestamp);
        
        const toRemove = entries.slice(0, entries.length - this.config.maxCacheSize);
        for (const [key, entry] of toRemove) {
            this.registry.delete(key);
            this.stats.currentStatuses[entry.status]--;
            
            // Clean up texture index
            if (entry.textureHash && this.textureIndex.has(entry.textureHash)) {
                this.textureIndex.get(entry.textureHash).delete(key);
            }
        }
    }

    _startCleanupInterval() {
        setInterval(() => {
            const now = Date.now();
            const expired = [];
            
            for (const [key, entry] of this.registry.entries()) {
                if (now - entry.timestamp > this.config.ttlMs) {
                    expired.push(key);
                }
            }
            
            for (const key of expired) {
                const entry = this.registry.get(key);
                if (entry) {
                    this.registry.delete(key);
                    this.stats.currentStatuses[entry.status]--;
                }
            }
        }, 60000); // Run every minute
    }

    _loadPersistedState() {
        try {
            const saved = localStorage.getItem(this.config.persistenceKey);
            if (saved) {
                const data = JSON.parse(saved);
                // Restore only entries that aren't expired
                const now = Date.now();
                for (const [key, entry] of Object.entries(data.registry || {})) {
                    if (now - entry.timestamp <= this.config.ttlMs) {
                        this.registry.set(key, entry);
                        this.stats.currentStatuses[entry.status]++;
                    }
                }
            }
        } catch (e) {
            console.warn('VCC: Failed to load persisted state:', e);
        }
    }

    _savePersistedState() {
        if (!this.config.enablePersistence) return;
        
        try {
            const data = {
                registry: Object.fromEntries(this.registry),
                stats: this.stats,
                savedAt: Date.now()
            };
            localStorage.setItem(this.config.persistenceKey, JSON.stringify(data));
        } catch (e) {
            console.warn('VCC: Failed to save state:', e);
        }
    }

    /**
     * Get current statistics
     */
    getStats() {
        return { ...this.stats, cacheSize: this.registry.size };
    }

    /**
     * Clear all health data
     */
    clear() {
        this.registry.clear();
        this.textureIndex.clear();
        this.stats = {
            totalAnalyzed: 0,
            currentStatuses: {
                [HealthStatus.OPTIMAL]: 0,
                [HealthStatus.STABLE]: 0,
                [HealthStatus.WARNING]: 0,
                [HealthStatus.CRITICAL]: 0,
                [HealthStatus.CORRUPTED]: 0
            }
        };
        this._notifyListeners('cleared', {});
    }
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ConsistencyOracle, HealthStatus, VPAS_THRESHOLDS };
}
