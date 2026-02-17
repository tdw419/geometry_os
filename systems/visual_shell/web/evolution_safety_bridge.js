
/**
 * Evolution Safety Bridge for WebMCP
 *
 * Connects browser to Evolution Daemon V13 safety HTTP API.
 * Exposes safety tools for AI agents via WebMCP.
 *
 * @version 1.0.0
 */

const SAFETY_API_BASE = 'http://localhost:31338/api/v1/safety';

const EvolutionSafetyBridge = {
    /**
     * Get current system metabolism state (CPU/MEM/GPU).
     * Used by AdaptiveRateLimiter for load-based throttling.
     */
    async safety_get_metabolism() {
        try {
            const response = await fetch(`${SAFETY_API_BASE}/get_metabolism`);
            if (!response.ok) {
                return { error: `HTTP ${response.status}`, throttle_level: 'none' };
            }
            return await response.json();
        } catch (error) {
            console.warn('EvolutionSafetyBridge: Failed to get metabolism', error);
            return { error: error.message, throttle_level: 'none' };
        }
    },

    /**
     * Check RTS file integrity (SHA256/Hilbert/entropy).
     * @param {string} rtsPath - Path to .rts.png file
     */
    async safety_check_rts_integrity(rtsPath) {
        try {
            const response = await fetch(`${SAFETY_API_BASE}/check_rts_integrity`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ path: rtsPath })
            });
            if (!response.ok) {
                return { error: `HTTP ${response.status}`, checks_passed: false };
            }
            return await response.json();
        } catch (error) {
            console.warn('EvolutionSafetyBridge: Failed to check integrity', error);
            return { error: error.message, checks_passed: false };
        }
    },

    /**
     * Predict RTS file health using ML.
     * @param {string} rtsPath - Path to .rts.png file
     * @param {number} horizonHours - Prediction horizon (default 24)
     */
    async safety_predict_health(rtsPath, horizonHours = 24) {
        try {
            const response = await fetch(`${SAFETY_API_BASE}/predict_health`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ path: rtsPath, horizon_hours: horizonHours })
            });
            if (!response.ok) {
                return { error: `HTTP ${response.status}` };
            }
            return await response.json();
        } catch (error) {
            console.warn('EvolutionSafetyBridge: Failed to predict health', error);
            return { error: error.message };
        }
    },

    /**
     * Trigger RTS healing (re-generate/defragment).
     * @param {string} rtsPath - Path to .rts.png file
     * @param {string} action - Healing action ('re_generate', 'defragment', 'quarantine')
     */
    async safety_heal_rts(rtsPath, action = 'defragment') {
        try {
            const response = await fetch(`${SAFETY_API_BASE}/heal_rts`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ path: rtsPath, action })
            });
            if (!response.ok) {
                return { error: `HTTP ${response.status}`, success: false };
            }
            return await response.json();
        } catch (error) {
            console.warn('EvolutionSafetyBridge: Failed to heal RTS', error);
            return { error: error.message, success: false };
        }
    },

    /**
     * Get historical prognostics data for an RTS file.
     * @param {string} rtsPath - Path to .rts.png file
     */
    async safety_get_prognostics(rtsPath) {
        try {
            const response = await fetch(`${SAFETY_API_BASE}/get_prognostics`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ path: rtsPath })
            });
            if (!response.ok) {
                return { error: `HTTP ${response.status}` };
            }
            return await response.json();
        } catch (error) {
            console.warn('EvolutionSafetyBridge: Failed to get prognostics', error);
            return { error: error.message };
        }
    }
};

// Export for Node.js testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = EvolutionSafetyBridge;
}

// Expose globally for browser
if (typeof window !== 'undefined') {
    window.EvolutionSafetyBridge = EvolutionSafetyBridge;
}

