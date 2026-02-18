/**
 * ErrorRecovery - Handle errors gracefully
 *
 * Features:
 * - Automatic retry with exponential backoff
 * - Graceful degradation when features unavailable
 * - User notification system
 * - State preservation and recovery
 */

class ErrorRecovery {
    constructor(options = {}) {
        this.options = {
            maxRetries: 3,
            baseDelay: 1000,
            maxDelay: 10000,
            notifyUser: true,
            ...options
        };

        this.errorCounts = new Map();
        this.recoveryStrategies = new Map();
        this.notificationCallbacks = [];
    }

    /**
     * Wrap a function with retry logic
     * @param {Function} fn - Function to wrap
     * @param {string} name - Operation name
     * @returns {Function} Wrapped function
     */
    withRetry(fn, name = 'operation') {
        return async (...args) => {
            let lastError;

            for (let attempt = 0; attempt < this.options.maxRetries; attempt++) {
                try {
                    const result = await fn(...args);
                    // Reset error count on success
                    this.errorCounts.set(name, 0);
                    return result;
                } catch (error) {
                    lastError = error;
                    const count = (this.errorCounts.get(name) || 0) + 1;
                    this.errorCounts.set(name, count);

                    const delay = Math.min(
                        this.options.baseDelay * Math.pow(2, attempt),
                        this.options.maxDelay
                    );

                    console.warn(`[ErrorRecovery] ${name} failed (attempt ${attempt + 1}/${this.options.maxRetries}), retrying in ${delay}ms`, error);

                    await this._sleep(delay);
                }
            }

            // All retries failed
            this._notifyUser(`${name} failed after ${this.options.maxRetries} attempts`);
            throw lastError;
        };
    }

    /**
     * Register a recovery strategy
     * @param {string} errorType - Type of error
     * @param {Function} strategy - Recovery function
     */
    registerStrategy(errorType, strategy) {
        this.recoveryStrategies.set(errorType, strategy);
    }

    /**
     * Handle an error with appropriate recovery
     * @param {Error} error - The error
     * @param {string} context - Error context
     * @returns {*} Recovery result or null
     */
    handleError(error, context = 'unknown') {
        console.error(`[ErrorRecovery] Error in ${context}:`, error);

        // Try registered strategy
        const errorType = error.constructor.name;
        const strategy = this.recoveryStrategies.get(errorType);

        if (strategy) {
            try {
                console.log(`[ErrorRecovery] Applying ${errorType} recovery strategy`);
                return strategy(error, context);
            } catch (recoveryError) {
                console.error('[ErrorRecovery] Recovery strategy failed:', recoveryError);
            }
        }

        // Default: notify user
        this._notifyUser(`Error in ${context}: ${error.message}`);

        return null;
    }

    /**
     * Create a degraded mode fallback
     * @param {Object} implementations - Object mapping mode to implementation
     * @returns {Function} Function that tries implementations in order
     */
    createFallback(implementations) {
        return async (...args) => {
            const errors = [];

            for (const [mode, impl] of Object.entries(implementations)) {
                try {
                    console.log(`[ErrorRecovery] Trying ${mode} implementation`);
                    const result = await impl(...args);
                    console.log(`[ErrorRecovery] ${mode} implementation succeeded`);
                    return result;
                } catch (error) {
                    console.warn(`[ErrorRecovery] ${mode} implementation failed:`, error.message);
                    errors.push({ mode, error });
                }
            }

            // All implementations failed
            const errorSummary = errors.map(e => `${e.mode}: ${e.error.message}`).join(', ');
            throw new Error(`All implementations failed: ${errorSummary}`);
        };
    }

    /**
     * Preserve state for recovery
     * @param {string} key - State key
     * @param {*} state - State to preserve
     */
    preserveState(key, state) {
        try {
            const serialized = JSON.stringify(state);
            sessionStorage.setItem(`recovery_${key}`, serialized);
            console.log(`[ErrorRecovery] Preserved state: ${key}`);
        } catch (error) {
            console.error('[ErrorRecovery] Failed to preserve state:', error);
        }
    }

    /**
     * Recover preserved state
     * @param {string} key - State key
     * @returns {*} Recovered state or null
     */
    recoverState(key) {
        try {
            const serialized = sessionStorage.getItem(`recovery_${key}`);
            if (serialized) {
                const state = JSON.parse(serialized);
                console.log(`[ErrorRecovery] Recovered state: ${key}`);
                return state;
            }
        } catch (error) {
            console.error('[ErrorRecovery] Failed to recover state:', error);
        }
        return null;
    }

    /**
     * Clear preserved state
     * @param {string} key - State key
     */
    clearState(key) {
        sessionStorage.removeItem(`recovery_${key}`);
    }

    /**
     * Subscribe to notifications
     * @param {Function} callback - Notification callback
     */
    onNotification(callback) {
        this.notificationCallbacks.push(callback);
    }

    /**
     * Notify user of error
     * @private
     */
    _notifyUser(message) {
        if (!this.options.notifyUser) return;

        console.log('[ErrorRecovery] User notification:', message);

        for (const callback of this.notificationCallbacks) {
            try {
                callback(message);
            } catch (error) {
                console.error('[ErrorRecovery] Notification callback error:', error);
            }
        }
    }

    /**
     * Sleep for delay
     * @private
     */
    _sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * Get error statistics
     * @returns {Object} Error stats
     */
    getErrorStats() {
        return Object.fromEntries(this.errorCounts);
    }

    /**
     * Reset error tracking
     */
    reset() {
        this.errorCounts.clear();
        console.log('[ErrorRecovery] Reset error tracking');
    }
}

// Export
if (typeof window !== 'undefined') {
    window.ErrorRecovery = ErrorRecovery;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ErrorRecovery };
}
