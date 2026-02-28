/**
 * Geometry OS: Session State Manager
 *
 * Coordinates visual persistence across the system.
 * Handles:
 * - Glyph registry persistence
 * - Viewport state persistence
 * - Terminal positions persistence
 * - Auto-save with debouncing
 * - Session restoration
 *
 * Epoch 1: Visual Persistence
 */

export class SessionStateManager {
    /**
     * @param {Object} options - Configuration options
     */
    constructor(options = {}) {
        this.options = {
            autoSave: options.autoSave ?? true,
            autoSaveInterval: options.autoSaveInterval ?? 5000, // 5 seconds
            storagePrefix: options.storagePrefix ?? 'gos_session_',
            maxSessionAge: options.maxSessionAge ?? 24 * 60 * 60 * 1000, // 24 hours
            ...options
        };

        // Component references (set via setComponent)
        this.glyphExecutor = null;
        this.viewportManager = null;
        this.terminalManager = null;

        // State
        this.lastSave = 0;
        this.autoSaveTimer = null;
        this.pendingChanges = false;
        this.sessionId = this._generateSessionId();
    }

    /**
     * Generate a unique session ID.
     */
    _generateSessionId() {
        return `session_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    }

    /**
     * Set component reference for persistence.
     * @param {string} name - Component name (glyphExecutor, viewportManager, terminalManager)
     * @param {Object} component - Component instance
     */
    setComponent(name, component) {
        switch (name) {
            case 'glyphExecutor':
                this.glyphExecutor = component;
                break;
            case 'viewportManager':
                this.viewportManager = component;
                break;
            case 'terminalManager':
                this.terminalManager = component;
                break;
            default:
                console.warn(`[SessionStateManager] Unknown component: ${name}`);
        }
    }

    // ============================================
    // SAVE OPERATIONS
    // ============================================

    /**
     * Save all session state to localStorage.
     * @returns {Object} Saved state summary
     */
    saveAll() {
        const state = {
            version: 1,
            sessionId: this.sessionId,
            timestamp: Date.now(),
            components: {}
        };

        // Save glyph registry
        if (this.glyphExecutor?.serializeGlyphRegistry) {
            state.components.glyphs = JSON.parse(this.glyphExecutor.serializeGlyphRegistry());
        }

        // Save viewport state
        if (this.viewportManager) {
            state.components.viewport = this._saveViewportState();
        }

        // Save terminal positions
        if (this.terminalManager) {
            state.components.terminals = this._saveTerminalPositions();
        }

        // Save buildings and wires
        if (this.glyphExecutor?.serializeBuildings) {
            state.components.buildings = this.glyphExecutor.serializeBuildings();
        }

        if (this.glyphExecutor?.wireManager) {
            state.components.wires = this.glyphExecutor.wireManager.serialize();
        }

        // Write to localStorage
        try {
            localStorage.setItem(
                `${this.options.storagePrefix}state`,
                JSON.stringify(state)
            );
            localStorage.setItem(
                `${this.options.storagePrefix}timestamp`,
                Date.now().toString()
            );

            this.lastSave = Date.now();
            this.pendingChanges = false;

            console.log('[SessionStateManager] Saved session state:', {
                glyphs: state.components.glyphs?.glyphs?.length || 0,
                viewport: state.components.viewport ? 'saved' : 'none',
                terminals: state.components.terminals ? 'saved' : 'none'
            });

            return {
                success: true,
                timestamp: this.lastSave,
                components: Object.keys(state.components)
            };
        } catch (e) {
            console.error('[SessionStateManager] Failed to save state:', e);
            return { success: false, error: e.message };
        }
    }

    /**
     * Save viewport state.
     */
    _saveViewportState() {
        if (!this.viewportManager) return null;

        const bounds = this.viewportManager.getVisibleBounds?.() || {};
        const zoom = this.viewportManager.getZoom?.() || 1;

        return {
            x: bounds.x || 0,
            y: bounds.y || 0,
            width: bounds.width || 800,
            height: bounds.height || 600,
            zoom: zoom
        };
    }

    /**
     * Save terminal positions.
     */
    _saveTerminalPositions() {
        if (!this.terminalManager?.windows) return null;

        const positions = {};
        for (const [id, window] of this.terminalManager.windows) {
            if (window.getPosition) {
                positions[id] = window.getPosition();
            }
        }
        return positions;
    }

    // ============================================
    // LOAD OPERATIONS
    // ============================================

    /**
     * Load all session state from localStorage.
     * @returns {Object} Load result summary
     */
    loadAll() {
        try {
            const stateJson = localStorage.getItem(`${this.options.storagePrefix}state`);

            if (!stateJson) {
                console.log('[SessionStateManager] No saved session found');
                return { success: false, reason: 'no_saved_state' };
            }

            const state = JSON.parse(stateJson);

            // Check session age
            const age = Date.now() - (state.timestamp || 0);
            if (age > this.options.maxSessionAge) {
                console.log('[SessionStateManager] Saved session too old, discarding');
                this.clearAll();
                return { success: false, reason: 'session_expired' };
            }

            // Restore components
            const results = {
                glyphs: null,
                viewport: null,
                terminals: null
            };

            // Restore glyph registry
            if (state.components?.glyphs && this.glyphExecutor) {
                const glyphCount = this.glyphExecutor.deserializeGlyphRegistry(
                    JSON.stringify(state.components.glyphs)
                );
                results.glyphs = { restored: glyphCount };
            }

            // Restore viewport state
            if (state.components?.viewport && this.viewportManager) {
                this._loadViewportState(state.components.viewport);
                results.viewport = { restored: true };
            }

            // Restore terminal positions
            if (state.components?.terminals && this.terminalManager) {
                this._loadTerminalPositions(state.components.terminals);
                results.terminals = { restored: Object.keys(state.components.terminals).length };
            }

            // Restore buildings and wires
            if (state.components?.buildings && this.glyphExecutor?.deserializeBuildings) {
                this.glyphExecutor.deserializeBuildings(state.components.buildings);
                results.buildings = { restored: state.components.buildings.length };
            }

            console.log('[SessionStateManager] Restored session from',
                new Date(state.timestamp).toLocaleString());

            return {
                success: true,
                sessionId: state.sessionId,
                age: Math.round(age / 1000),
                results
            };
        } catch (e) {
            console.error('[SessionStateManager] Failed to load state:', e);
            return { success: false, error: e.message };
        }
    }

    /**
     * Load viewport state.
     */
    _loadViewportState(viewport) {
        if (!this.viewportManager) return;

        if (this.viewportManager.setPosition && viewport.x !== undefined) {
            this.viewportManager.setPosition(viewport.x, viewport.y);
        }

        if (this.viewportManager.setZoom && viewport.zoom) {
            this.viewportManager.setZoom(viewport.zoom);
        }
    }

    /**
     * Load terminal positions.
     */
    _loadTerminalPositions(positions) {
        if (!this.terminalManager?._restorePositions) return;

        this.terminalManager._restorePositions(positions);
    }

    // ============================================
    // AUTO-SAVE
    // ============================================

    /**
     * Start auto-save timer.
     */
    startAutoSave() {
        if (this.autoSaveTimer) return;

        this.autoSaveTimer = setInterval(() => {
            if (this.pendingChanges) {
                this.saveAll();
            }
        }, this.options.autoSaveInterval);

        console.log('[SessionStateManager] Auto-save started (interval:',
            this.options.autoSaveInterval, 'ms)');
    }

    /**
     * Stop auto-save timer.
     */
    stopAutoSave() {
        if (this.autoSaveTimer) {
            clearInterval(this.autoSaveTimer);
            this.autoSaveTimer = null;
            console.log('[SessionStateManager] Auto-save stopped');
        }
    }

    /**
     * Mark that changes need to be saved.
     */
    markChanged() {
        this.pendingChanges = true;
    }

    /**
     * Check if auto-save is running.
     */
    isAutoSaveRunning() {
        return this.autoSaveTimer !== null;
    }

    // ============================================
    // UTILITY
    // ============================================

    /**
     * Clear all persisted state.
     */
    clearAll() {
        localStorage.removeItem(`${this.options.storagePrefix}state`);
        localStorage.removeItem(`${this.options.storagePrefix}timestamp`);

        if (this.glyphExecutor?.clearPersistedState) {
            this.glyphExecutor.clearPersistedState();
        }

        console.log('[SessionStateManager] Cleared all persisted state');
    }

    /**
     * Get session info.
     */
    getSessionInfo() {
        const timestamp = localStorage.getItem(`${this.options.storagePrefix}timestamp`);

        return {
            sessionId: this.sessionId,
            lastSave: this.lastSave || (timestamp ? parseInt(timestamp) : null),
            pendingChanges: this.pendingChanges,
            autoSaveRunning: this.isAutoSaveRunning(),
            components: {
                glyphExecutor: !!this.glyphExecutor,
                viewportManager: !!this.viewportManager,
                terminalManager: !!this.terminalManager
            }
        };
    }

    /**
     * Export session state as JSON string.
     * Useful for debugging or external backup.
     */
    exportState() {
        const state = localStorage.getItem(`${this.options.storagePrefix}state`);
        return state;
    }

    /**
     * Import session state from JSON string.
     * @param {string} stateJson - JSON state to import
     */
    importState(stateJson) {
        try {
            const state = JSON.parse(stateJson);

            if (state.version !== 1) {
                throw new Error('Unsupported state version');
            }

            localStorage.setItem(`${this.options.storagePrefix}state`, stateJson);
            localStorage.setItem(`${this.options.storagePrefix}timestamp`, Date.now().toString());

            return this.loadAll();
        } catch (e) {
            console.error('[SessionStateManager] Failed to import state:', e);
            return { success: false, error: e.message };
        }
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SessionStateManager };
}
