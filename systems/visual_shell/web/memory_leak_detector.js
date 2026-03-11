/**
 * MemoryLeakDetector - Detect and prevent memory leaks in heatmap system
 *
 * Features:
 * - Object tracking with lifecycle
 * - Reference counting
 * - Leak detection alerts
 * - Auto-cleanup recommendations
 */

class MemoryLeakDetector {
    constructor(options = {}) {
        this.options = {
            enabled: true,
            trackWeakRefs: true,
            leakThreshold: 1000, // Objects of same type
            checkInterval: 30000, // 30 seconds
            ...options
        };

        // Tracked objects: Map<objectId, {type, created, refs, released}>
        this.trackedObjects = new Map();
        this._objectIdCounter = 0;

        // Type counters
        this.typeCounts = new Map();

        // Detected leaks
        this.leaks = [];

        // Check interval
        this._checkTimer = null;
        this._startPeriodicCheck();

        console.log('[MemoryLeakDetector] Initialized');
    }

    /**
     * Track an object
     * @param {Object} obj - Object to track
     * @param {string} type - Object type
     * @returns {string} Object ID
     */
    track(obj, type) {
        if (!this.options.enabled) return null;

        const id = `obj_${this._objectIdCounter++}`;
        this.trackedObjects.set(id, {
            obj,
            type,
            created: performance.now(),
            refs: 1,
            released: false
        });

        this._incrementTypeCount(type);
        return id;
    }

    /**
     * Add reference to tracked object
     * @param {string} id - Object ID
     */
    addRef(id) {
        const tracked = this.trackedObjects.get(id);
        if (tracked && !tracked.released) {
            tracked.refs++;
        }
    }

    /**
     * Release reference to tracked object
     * @param {string} id - Object ID
     */
    release(id) {
        const tracked = this.trackedObjects.get(id);
        if (tracked) {
            tracked.refs--;
            if (tracked.refs <= 0) {
                tracked.released = true;
                this._decrementTypeCount(tracked.type);
            }
        }
    }

    /**
     * Increment type count
     * @private
     */
    _incrementTypeCount(type) {
        const count = this.typeCounts.get(type) || 0;
        this.typeCounts.set(type, count + 1);

        // Check threshold
        if (count > this.options.leakThreshold) {
            this._reportPotentialLeak(type, count);
        }
    }

    /**
     * Decrement type count
     * @private
     */
    _decrementTypeCount(type) {
        const count = this.typeCounts.get(type) || 0;
        if (count > 0) {
            this.typeCounts.set(type, count - 1);
        }
    }

    /**
     * Report potential leak
     * @private
     */
    _reportPotentialLeak(type, count) {
        const leak = {
            type,
            count,
            timestamp: Date.now(),
            severity: count > this.options.leakThreshold * 2 ? 'critical' : 'warning'
        };

        this.leaks.push(leak);
        console.warn(`[MemoryLeakDetector] Potential leak detected: ${type} (${count} objects)`, leak);
    }

    /**
     * Start periodic leak check
     * @private
     */
    _startPeriodicCheck() {
        if (typeof window === 'undefined') return;

        this._checkTimer = setInterval(() => {
            this.checkForLeaks();
        }, this.options.checkInterval);
    }

    /**
     * Check for memory leaks
     * @returns {Array} Detected leaks
     */
    checkForLeaks() {
        const detectedLeaks = [];
        const now = performance.now();

        // Check for long-lived unreleased objects
        for (const [id, tracked] of this.trackedObjects) {
            if (!tracked.released) {
                const age = now - tracked.created;
                if (age > 60000) { // 1 minute
                    detectedLeaks.push({
                        id,
                        type: tracked.type,
                        age,
                        refs: tracked.refs
                    });
                }
            }
        }

        // Check type counts
        for (const [type, count] of this.typeCounts) {
            if (count > this.options.leakThreshold) {
                detectedLeaks.push({
                    type,
                    count,
                    severity: 'threshold'
                });
            }
        }

        return detectedLeaks;
    }

    /**
     * Generate leak report
     * @returns {Object} Leak report
     */
    generateReport() {
        const leaks = this.checkForLeaks();

        return {
            timestamp: Date.now(),
            trackedObjects: this.trackedObjects.size,
            typeCounts: Object.fromEntries(this.typeCounts),
            detectedLeaks: leaks,
            totalLeaks: this.leaks.length
        };
    }

    /**
     * Cleanup old tracked objects
     */
    cleanup() {
        const now = performance.now();
        const toRemove = [];

        for (const [id, tracked] of this.trackedObjects) {
            if (tracked.released && (now - tracked.created) > 300000) { // 5 minutes
                toRemove.push(id);
            }
        }

        for (const id of toRemove) {
            this.trackedObjects.delete(id);
        }

        console.log(`[MemoryLeakDetector] Cleaned up ${toRemove.length} old objects`);
    }

    /**
     * Destroy detector
     */
    destroy() {
        if (this._checkTimer) {
            clearInterval(this._checkTimer);
            this._checkTimer = null;
        }
        this.trackedObjects.clear();
        this.typeCounts.clear();
        this.leaks = [];
    }
}

// Export
if (typeof window !== 'undefined') {
    window.MemoryLeakDetector = MemoryLeakDetector;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MemoryLeakDetector };
}
