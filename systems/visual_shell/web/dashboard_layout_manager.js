/**
 * DashboardLayoutManager - Layout Management for Neural Heatmap Analytics Dashboard
 *
 * Provides drag-and-drop view rearrangement, layout persistence, and preset management
 * for analytics dashboard views (correlation matrix, temporal view, filters, etc.).
 *
 * Part of: Neural Heatmap Phase 2.3 - Dashboard Layout Manager
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-3-roadmap.md
 *
 * @class DashboardLayoutManager
 * @example
 * const layoutManager = new DashboardLayoutManager();
 * layoutManager.init();
 * layoutManager.addView('correlation-matrix', correlationView);
 * layoutManager.addEventListener('layoutchange', (event) => {
 *     console.log('Layout changed:', event.detail.layout);
 * });
 */

class DashboardLayoutManager {
    /**
     * Create a new DashboardLayoutManager
     * @param {Object} options - Configuration options
     * @param {string} options.storageKey - localStorage key (default: 'dashboard-layout')
     * @param {boolean} options.persist - Persist to localStorage (default: true)
     * @param {boolean} options.autoSave - Auto-save on layout changes (default: true)
     * @param {number} options.autoSaveDelay - Delay before auto-save in ms (default: 500)
     * @param {string} options.defaultPreset - Default preset to load (default: 'default')
     * @param {boolean} options.enableAnimations - Enable drag animations (default: true)
     */
    constructor(options = {}) {
        this.options = {
            storageKey: 'dashboard-layout',
            persist: true,
            autoSave: true,
            autoSaveDelay: 500,
            defaultPreset: 'default',
            enableAnimations: true,
            animationDuration: 300,
            dragHandleHeight: 24,
            ...options
        };

        // Current layout state
        this.currentLayout = null;
        this.currentPreset = this.options.defaultPreset;
        this.views = new Map(); // viewId -> view configuration
        this.viewElements = new Map(); // viewId -> DOM element

        // Event listeners for layout changes
        this.listeners = [];

        // Drag and drop state
        this.dragState = {
            isDragging: false,
            draggedView: null,
            placeholder: null,
            startY: 0,
            startX: 0,
            originalIndex: -1,
            currentIndex: -1
        };

        // Auto-save timer
        this.autoSaveTimer = null;

        // Built-in layout presets
        this.presets = {
            // Default balanced layout
            default: {
                name: 'Default',
                description: 'Balanced layout with all views visible',
                icon: '⚖️',
                views: [
                    {
                        id: 'correlation-matrix',
                        visible: true,
                        order: 0,
                        size: 'medium',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'temporal-view',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 2,
                        size: 'small',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'comparison-view',
                        visible: true,
                        order: 3,
                        size: 'large',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'model-zoo',
                        visible: true,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'performance-monitor',
                        visible: true,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            },

            // Focus on correlations
            focusCorrelations: {
                name: 'Correlation Focus',
                description: 'Emphasizes correlation matrix and related analysis',
                icon: '🔗',
                views: [
                    {
                        id: 'correlation-matrix',
                        visible: true,
                        order: 0,
                        size: 'large',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'cross-layer-analyzer',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 2,
                        size: 'small',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'temporal-view',
                        visible: false,
                        order: 3,
                        size: 'small',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'comparison-view',
                        visible: false,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'model-zoo',
                        visible: false,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            },

            // Focus on temporal patterns
            focusTemporal: {
                name: 'Temporal Focus',
                description: 'Emphasizes temporal analysis and patterns',
                icon: '📈',
                views: [
                    {
                        id: 'temporal-view',
                        visible: true,
                        order: 0,
                        size: 'large',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'anomaly-detector',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'performance-monitor',
                        visible: true,
                        order: 2,
                        size: 'small',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'correlation-matrix',
                        visible: false,
                        order: 3,
                        size: 'small',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'comparison-view',
                        visible: false,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            },

            // Comparison layout
            comparison: {
                name: 'Comparison Mode',
                description: 'Side-by-side model comparison layout',
                icon: '⚖️',
                views: [
                    {
                        id: 'comparison-view',
                        visible: true,
                        order: 0,
                        size: 'large',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'multi-model-tracker',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'model-zoo',
                        visible: true,
                        order: 2,
                        size: 'medium',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 3,
                        size: 'small',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'correlation-matrix',
                        visible: false,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'temporal-view',
                        visible: false,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            },

            // Minimal layout
            minimal: {
                name: 'Minimal',
                description: 'Clean layout with only essential views',
                icon: '✨',
                views: [
                    {
                        id: 'correlation-matrix',
                        visible: true,
                        order: 0,
                        size: 'medium',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'temporal-view',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 2,
                        size: 'small',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'comparison-view',
                        visible: false,
                        order: 3,
                        size: 'small',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'model-zoo',
                        visible: false,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'performance-monitor',
                        visible: false,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            },

            // Research layout
            research: {
                name: 'Research Mode',
                description: 'Comprehensive layout for deep analysis',
                icon: '🔬',
                views: [
                    {
                        id: 'correlation-matrix',
                        visible: true,
                        order: 0,
                        size: 'medium',
                        position: { x: 0, y: 0 }
                    },
                    {
                        id: 'temporal-view',
                        visible: true,
                        order: 1,
                        size: 'medium',
                        position: { x: 0, y: 1 }
                    },
                    {
                        id: 'cross-layer-analyzer',
                        visible: true,
                        order: 2,
                        size: 'medium',
                        position: { x: 1, y: 0 }
                    },
                    {
                        id: 'anomaly-detector',
                        visible: true,
                        order: 3,
                        size: 'medium',
                        position: { x: 1, y: 1 }
                    },
                    {
                        id: 'filter-panel',
                        visible: true,
                        order: 4,
                        size: 'small',
                        position: { x: 2, y: 0 }
                    },
                    {
                        id: 'performance-monitor',
                        visible: true,
                        order: 5,
                        size: 'small',
                        position: { x: 2, y: 1 }
                    }
                ]
            }
        };

        // View size configurations
        this.viewSizes = {
            small: { width: 300, height: 200, gridSpan: 1 },
            medium: { width: 450, height: 300, gridSpan: 2 },
            large: { width: 600, height: 400, gridSpan: 3 },
            fullscreen: { width: '100%', height: '100%', gridSpan: 4 }
        };

        // Initialize layout from storage or preset
        this._loadLayout();

        console.log('[DashboardLayoutManager] Initialized');
    }

    /**
     * Initialize the layout manager
     * @returns {DashboardLayoutManager} This instance for chaining
     */
    init() {
        // Create main dashboard container
        this._createDashboardContainer();

        // Apply initial layout
        this._applyLayout(this.currentLayout);

        // Listen for window resize for responsive layout
        this._initResponsiveHandling();

        // Listen for keyboard shortcuts
        this._initKeyboardShortcuts();

        console.log(`[DashboardLayoutManager] Initialized with preset: ${this.currentPreset}`);

        return this;
    }

    /**
     * Add a view to the dashboard
     * @param {string} viewId - Unique view identifier
     * @param {Object} viewConfig - View configuration
     * @param {HTMLElement} viewConfig.element - DOM element for the view
     * @param {string} viewConfig.title - View title
     * @param {string} viewConfig.size - Initial size ('small', 'medium', 'large', 'fullscreen')
     * @param {boolean} viewConfig.resizable - Whether the view can be resized
     * @param {boolean} viewConfig.collapsible - Whether the view can be collapsed
     * @param {Function} viewConfig.onClose - Callback when view is closed
     * @returns {boolean} True if view was added successfully
     */
    addView(viewId, viewConfig) {
        if (this.views.has(viewId)) {
            console.warn(`[DashboardLayoutManager] View already exists: ${viewId}`);
            return false;
        }

        // Validate view configuration
        if (!viewConfig.element) {
            console.error(`[DashboardLayoutManager] View config must include an element: ${viewId}`);
            return false;
        }

        // Create view wrapper with drag handle
        const wrapper = this._createViewWrapper(viewId, viewConfig);

        // Store view configuration
        this.views.set(viewId, {
            id: viewId,
            ...viewConfig
        });

        // Store wrapper element
        this.viewElements.set(viewId, wrapper);

        // Add view to current layout if not present
        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) {
            this.currentLayout.views.push({
                id: viewId,
                visible: true,
                order: this.currentLayout.views.length,
                size: viewConfig.size || 'medium',
                position: { x: 0, y: 0 }
            });
        }

        // Add wrapper to dashboard container
        const container = document.getElementById('dashboard-views-container');
        if (container) {
            container.appendChild(wrapper);
        }

        console.log(`[DashboardLayoutManager] Added view: ${viewId}`);

        // Emit view add event
        this._emitChangeEvent('viewadd', { viewId, viewConfig });

        return true;
    }

    /**
     * Remove a view from the dashboard
     * @param {string} viewId - View identifier to remove
     * @returns {boolean} True if view was removed successfully
     */
    removeView(viewId) {
        if (!this.views.has(viewId)) {
            console.warn(`[DashboardLayoutManager] View not found: ${viewId}`);
            return false;
        }

        const view = this.views.get(viewId);
        const wrapper = this.viewElements.get(viewId);

        // Call close callback if provided
        if (view.onClose && typeof view.onClose === 'function') {
            view.onClose();
        }

        // Remove from DOM
        if (wrapper && wrapper.parentNode) {
            wrapper.parentNode.removeChild(wrapper);
        }

        // Remove from layout
        this.currentLayout.views = this.currentLayout.views.filter(v => v.id !== viewId);

        // Remove from maps
        this.views.delete(viewId);
        this.viewElements.delete(viewId);

        console.log(`[DashboardLayoutManager] Removed view: ${viewId}`);

        // Emit view remove event
        this._emitChangeEvent('viewremove', { viewId });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this._scheduleAutoSave();
        }

        return true;
    }

    /**
     * Show a view
     * @param {string} viewId - View identifier
     * @returns {boolean} True if view was shown successfully
     */
    showView(viewId) {
        return this._setViewVisibility(viewId, true);
    }

    /**
     * Hide a view
     * @param {string} viewId - View identifier
     * @returns {boolean} True if view was hidden successfully
     */
    hideView(viewId) {
        return this._setViewVisibility(viewId, false);
    }

    /**
     * Toggle view visibility
     * @param {string} viewId - View identifier
     * @returns {boolean} New visibility state
     */
    toggleView(viewId) {
        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) return false;

        const newVisibility = !layoutView.visible;
        this._setViewVisibility(viewId, newVisibility);
        return newVisibility;
    }

    /**
     * Move a view to a new position
     * @param {string} viewId - View identifier
     * @param {number} newIndex - New index position
     * @returns {boolean} True if view was moved successfully
     */
    moveView(viewId, newIndex) {
        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) return false;

        const oldIndex = layoutView.order;
        if (oldIndex === newIndex) return true;

        // Update order of affected views
        this.currentLayout.views.forEach(view => {
            if (view.id === viewId) {
                view.order = newIndex;
            } else if (oldIndex < newIndex) {
                // Moving down: shift views between old and new index up
                if (view.order > oldIndex && view.order <= newIndex) {
                    view.order--;
                }
            } else {
                // Moving up: shift views between new and old index down
                if (view.order >= newIndex && view.order < oldIndex) {
                    view.order++;
                }
            }
        });

        // Reorder DOM elements
        this._reorderViews();

        console.log(`[DashboardLayoutManager] Moved view ${viewId} from ${oldIndex} to ${newIndex}`);

        // Emit layout change event
        this._emitChangeEvent('viewmove', { viewId, oldIndex, newIndex });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this._scheduleAutoSave();
        }

        return true;
    }

    /**
     * Resize a view
     * @param {string} viewId - View identifier
     * @param {string} newSize - New size ('small', 'medium', 'large', 'fullscreen')
     * @returns {boolean} True if view was resized successfully
     */
    resizeView(viewId, newSize) {
        if (!this.viewSizes[newSize]) {
            console.warn(`[DashboardLayoutManager] Invalid size: ${newSize}`);
            return false;
        }

        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) return false;

        layoutView.size = newSize;

        // Apply new size to element
        const wrapper = this.viewElements.get(viewId);
        if (wrapper) {
            this._applyViewSize(wrapper, newSize);
        }

        console.log(`[DashboardLayoutManager] Resized view ${viewId} to ${newSize}`);

        // Emit view resize event
        this._emitChangeEvent('viewresize', { viewId, newSize });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this._scheduleAutoSave();
        }

        return true;
    }

    /**
     * Load a layout preset
     * @param {string} presetName - Preset name
     * @returns {boolean} True if preset was loaded successfully
     */
    loadPreset(presetName) {
        if (!this.presets[presetName]) {
            console.warn(`[DashboardLayoutManager] Unknown preset: ${presetName}`);
            return false;
        }

        const preset = this.presets[presetName];
        this.currentPreset = presetName;

        // Apply preset layout
        this._applyLayout(preset);

        console.log(`[DashboardLayoutManager] Loaded preset: ${presetName}`);

        // Emit preset change event
        this._emitChangeEvent('presetchange', { preset: presetName, presetConfig: preset });

        return true;
    }

    /**
     * Save current layout as a custom preset
     * @param {string} presetName - Name for the custom preset
     * @param {Object} metadata - Optional metadata (name, description, icon)
     * @returns {boolean} True if preset was saved successfully
     */
    saveAsPreset(presetName, metadata = {}) {
        if (this.presets[presetName]) {
            console.warn(`[DashboardLayoutManager] Preset already exists: ${presetName}`);
            return false;
        }

        const preset = {
            name: metadata.name || presetName,
            description: metadata.description || 'Custom layout',
            icon: metadata.icon || '🎨',
            views: JSON.parse(JSON.stringify(this.currentLayout.views))
        };

        this.presets[presetName] = preset;
        this.currentPreset = presetName;

        // Save to localStorage
        this._savePresets();

        console.log(`[DashboardLayoutManager] Saved preset: ${presetName}`);

        // Emit preset save event
        this._emitChangeEvent('presetcreate', { preset: presetName, presetConfig: preset });

        return true;
    }

    /**
     * Delete a custom preset
     * @param {string} presetName - Preset name to delete
     * @returns {boolean} True if preset was deleted successfully
     */
    deletePreset(presetName) {
        // Don't allow deleting built-in presets
        const builtInPresets = ['default', 'focusCorrelations', 'focusTemporal', 'comparison', 'minimal', 'research'];
        if (builtInPresets.includes(presetName)) {
            console.warn(`[DashboardLayoutManager] Cannot delete built-in preset: ${presetName}`);
            return false;
        }

        if (!this.presets[presetName]) {
            console.warn(`[DashboardLayoutManager] Preset not found: ${presetName}`);
            return false;
        }

        // Switch to default preset if current preset is being deleted
        if (this.currentPreset === presetName) {
            this.loadPreset('default');
        }

        delete this.presets[presetName];

        // Save to localStorage
        this._savePresets();

        console.log(`[DashboardLayoutManager] Deleted preset: ${presetName}`);

        // Emit preset delete event
        this._emitChangeEvent('presetdelete', { preset: presetName });

        return true;
    }

    /**
     * Export current layout as JSON
     * @returns {string} JSON string of current layout
     */
    exportLayout() {
        const exportData = {
            version: '1.0',
            timestamp: new Date().toISOString(),
            preset: this.currentPreset,
            layout: this.currentLayout,
            customPresets: this._getCustomPresets()
        };

        return JSON.stringify(exportData, null, 2);
    }

    /**
     * Import layout from JSON
     * @param {string} jsonData - JSON string to import
     * @returns {boolean} True if layout was imported successfully
     */
    importLayout(jsonData) {
        try {
            const importData = JSON.parse(jsonData);

            // Validate import data structure
            if (!importData.layout || !Array.isArray(importData.layout.views)) {
                throw new Error('Invalid layout data structure');
            }

            // Import custom presets
            if (importData.customPresets) {
                Object.assign(this.presets, importData.customPresets);
            }

            // Apply layout
            this.currentPreset = importData.preset || 'custom';
            this._applyLayout(importData.layout);

            console.log('[DashboardLayoutManager] Imported layout successfully');

            // Emit import event
            this._emitChangeEvent('layoutimport', { importData });

            return true;
        } catch (error) {
            console.error('[DashboardLayoutManager] Failed to import layout:', error);
            return false;
        }
    }

    /**
     * Get list of available presets
     * @returns {Array<Object>} Array of preset info objects
     */
    getAvailablePresets() {
        return Object.entries(this.presets).map(([key, preset]) => ({
            key,
            name: preset.name,
            description: preset.description,
            icon: preset.icon,
            isBuiltIn: ['default', 'focusCorrelations', 'focusTemporal', 'comparison', 'minimal', 'research'].includes(key)
        }));
    }

    /**
     * Get current layout configuration
     * @returns {Object} Current layout configuration
     */
    getLayout() {
        return this.currentLayout;
    }

    /**
     * Reset to default layout
     * @returns {boolean} True if reset was successful
     */
    resetToDefault() {
        this.loadPreset('default');
        return true;
    }

    /**
     * Add event listener for layout changes
     * @param {string} event - Event name ('layoutchange', 'viewadd', 'viewremove', etc.)
     * @param {Function} callback - Callback function
     */
    addEventListener(event, callback) {
        const validEvents = [
            'layoutchange', 'viewadd', 'viewremove', 'viewmove',
            'viewresize', 'presetchange', 'presetcreate', 'presetdelete',
            'layoutimport', 'layoutexport', 'dragstart', 'dragend'
        ];

        if (validEvents.includes(event)) {
            this.listeners.push({ event, callback });
        }
    }

    /**
     * Remove event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function to remove
     */
    removeEventListener(event, callback) {
        this.listeners = this.listeners.filter(
            listener => !(listener.event === event && listener.callback === callback)
        );
    }

    /**
     * Load layout from localStorage
     * @private
     */
    _loadLayout() {
        if (!this.options.persist) return;

        try {
            // Load custom presets
            const storedPresets = localStorage.getItem(`${this.options.storageKey}-presets`);
            if (storedPresets) {
                const customPresets = JSON.parse(storedPresets);
                Object.assign(this.presets, customPresets);
            }

            // Load current layout
            const storedLayout = localStorage.getItem(this.options.storageKey);
            if (storedLayout) {
                const layoutData = JSON.parse(storedLayout);
                this.currentLayout = layoutData;
                this.currentPreset = layoutData.preset || this.options.defaultPreset;
            } else {
                // Use default preset
                this.currentLayout = JSON.parse(JSON.stringify(this.presets[this.options.defaultPreset]));
                this.currentPreset = this.options.defaultPreset;
            }
        } catch (error) {
            console.warn('[DashboardLayoutManager] Failed to load layout from storage:', error);
            // Fall back to default preset
            this.currentLayout = JSON.parse(JSON.stringify(this.presets[this.options.defaultPreset]));
            this.currentPreset = this.options.defaultPreset;
        }
    }

    /**
     * Save layout to localStorage
     * @private
     */
    _saveLayout() {
        if (!this.options.persist) return;

        try {
            const layoutData = {
                ...this.currentLayout,
                preset: this.currentPreset
            };
            localStorage.setItem(this.options.storageKey, JSON.stringify(layoutData));
        } catch (error) {
            console.warn('[DashboardLayoutManager] Failed to save layout to storage:', error);
        }
    }

    /**
     * Save custom presets to localStorage
     * @private
     */
    _savePresets() {
        if (!this.options.persist) return;

        try {
            const customPresets = this._getCustomPresets();
            localStorage.setItem(
                `${this.options.storageKey}-presets`,
                JSON.stringify(customPresets)
            );
        } catch (error) {
            console.warn('[DashboardLayoutManager] Failed to save presets to storage:', error);
        }
    }

    /**
     * Get custom (non-built-in) presets
     * @private
     * @returns {Object} Custom presets object
     */
    _getCustomPresets() {
        const builtInPresets = ['default', 'focusCorrelations', 'focusTemporal', 'comparison', 'minimal', 'research'];
        const customPresets = {};

        Object.entries(this.presets).forEach(([key, preset]) => {
            if (!builtInPresets.includes(key)) {
                customPresets[key] = preset;
            }
        });

        return customPresets;
    }

    /**
     * Schedule auto-save with delay
     * @private
     */
    _scheduleAutoSave() {
        if (this.autoSaveTimer) {
            clearTimeout(this.autoSaveTimer);
        }

        this.autoSaveTimer = setTimeout(() => {
            this._saveLayout();
        }, this.options.autoSaveDelay);
    }

    /**
     * Apply layout configuration to DOM
     * @private
     * @param {Object} layout - Layout configuration to apply
     */
    _applyLayout(layout) {
        this.currentLayout = layout;

        // Sort views by order
        const sortedViews = [...layout.views].sort((a, b) => a.order - b.order);

        // Apply visibility and order to each view
        sortedViews.forEach(viewConfig => {
            const wrapper = this.viewElements.get(viewConfig.id);
            if (wrapper) {
                // Set visibility
                wrapper.style.display = viewConfig.visible ? 'block' : 'none';

                // Apply size
                this._applyViewSize(wrapper, viewConfig.size);

                // Update order data attribute
                wrapper.dataset.order = viewConfig.order;
            }
        });

        // Reorder DOM elements
        this._reorderViews();

        // Save to storage
        if (this.options.autoSave) {
            this._scheduleAutoSave();
        }
    }

    /**
     * Apply size configuration to a view wrapper
     * @private
     * @param {HTMLElement} wrapper - View wrapper element
     * @param {string} size - Size name ('small', 'medium', 'large', 'fullscreen')
     */
    _applyViewSize(wrapper, size) {
        const sizeConfig = this.viewSizes[size];
        if (!sizeConfig) return;

        wrapper.dataset.size = size;

        if (size === 'fullscreen') {
            wrapper.style.position = 'fixed';
            wrapper.style.top = '0';
            wrapper.style.left = '0';
            wrapper.style.width = '100%';
            wrapper.style.height = '100%';
            wrapper.style.zIndex = '1000';
        } else {
            wrapper.style.position = '';
            wrapper.style.top = '';
            wrapper.style.left = '';
            wrapper.style.width = typeof sizeConfig.width === 'number' ? `${sizeConfig.width}px` : sizeConfig.width;
            wrapper.style.height = typeof sizeConfig.height === 'number' ? `${sizeConfig.height}px` : sizeConfig.height;
            wrapper.style.zIndex = '';
        }
    }

    /**
     * Reorder view elements in DOM based on order property
     * @private
     */
    _reorderViews() {
        const container = document.getElementById('dashboard-views-container');
        if (!container) return;

        const sortedViews = [...this.currentLayout.views].sort((a, b) => a.order - b.order);

        sortedViews.forEach(viewConfig => {
            const wrapper = this.viewElements.get(viewConfig.id);
            if (wrapper && wrapper.parentNode === container) {
                container.appendChild(wrapper);
            }
        });
    }

    /**
     * Set view visibility
     * @private
     * @param {string} viewId - View identifier
     * @param {boolean} visible - Visibility state
     * @returns {boolean} True if visibility was set successfully
     */
    _setViewVisibility(viewId, visible) {
        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) return false;

        layoutView.visible = visible;

        // Apply to DOM element
        const wrapper = this.viewElements.get(viewId);
        if (wrapper) {
            wrapper.style.display = visible ? 'block' : 'none';
        }

        console.log(`[DashboardLayoutManager] Set view ${viewId} visibility to: ${visible}`);

        // Emit view visibility event
        this._emitChangeEvent('viewvisibility', { viewId, visible });

        // Auto-save if enabled
        if (this.options.autoSave) {
            this._scheduleAutoSave();
        }

        return true;
    }

    /**
     * Create dashboard container
     * @private
     */
    _createDashboardContainer() {
        if (document.getElementById('dashboard-views-container')) return;

        const container = document.createElement('div');
        container.id = 'dashboard-views-container';
        container.className = 'dashboard-views-container';

        // Add styles
        const style = document.createElement('style');
        style.textContent = `
            .dashboard-views-container {
                display: flex;
                flex-wrap: wrap;
                gap: 16px;
                padding: 16px;
                align-items: flex-start;
                align-content: flex-start;
            }

            .dashboard-view-wrapper {
                background: rgba(10, 10, 26, 0.95);
                border: 1px solid #00FF00;
                border-radius: 8px;
                overflow: hidden;
                transition: all ${this.options.animationDuration}ms ease;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            }

            .dashboard-view-wrapper.theme-light {
                background: rgba(255, 255, 255, 0.98);
                border-color: #228B22;
            }

            .dashboard-view-wrapper.theme-highContrast {
                background: #000000;
                border-color: #FFFFFF;
                border-width: 2px;
            }

            .dashboard-view-wrapper.dragging {
                opacity: 0.5;
                transform: scale(1.02);
                box-shadow: 0 8px 32px rgba(0, 255, 0, 0.3);
            }

            .dashboard-view-wrapper.theme-light.dragging {
                box-shadow: 0 8px 32px rgba(34, 139, 34, 0.3);
            }

            .dashboard-view-wrapper.theme-highContrast.dragging {
                box-shadow: 0 8px 32px rgba(255, 255, 255, 0.5);
            }

            .dashboard-view-wrapper.drag-over {
                border-color: #FFFF00;
                border-width: 2px;
            }

            .dashboard-view-wrapper.theme-light.drag-over {
                border-color: #DAA520;
            }

            .dashboard-view-wrapper.theme-highContrast.drag-over {
                border-color: #FFFF00;
                border-width: 3px;
            }

            .dashboard-view-handle {
                height: ${this.options.dragHandleHeight}px;
                background: linear-gradient(90deg, rgba(0, 255, 0, 0.1), rgba(0, 255, 0, 0.05));
                border-bottom: 1px solid rgba(0, 255, 0, 0.3);
                cursor: move;
                display: flex;
                align-items: center;
                padding: 0 12px;
                user-select: none;
                flex-shrink: 0;
            }

            .dashboard-view-wrapper.theme-light .dashboard-view-handle {
                background: linear-gradient(90deg, rgba(34, 139, 34, 0.1), rgba(34, 139, 34, 0.05));
                border-bottom-color: rgba(34, 139, 34, 0.3);
            }

            .dashboard-view-wrapper.theme-highContrast .dashboard-view-handle {
                background: #111111;
                border-bottom-color: #FFFFFF;
            }

            .dashboard-view-handle:hover {
                background: linear-gradient(90deg, rgba(0, 255, 0, 0.2), rgba(0, 255, 0, 0.1));
            }

            .dashboard-view-wrapper.theme-light .dashboard-view-handle:hover {
                background: linear-gradient(90deg, rgba(34, 139, 34, 0.2), rgba(34, 139, 34, 0.1));
            }

            .dashboard-view-title {
                flex: 1;
                font-size: 11px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                color: #00FF00;
            }

            .dashboard-view-wrapper.theme-light .dashboard-view-title {
                color: #228B22;
            }

            .dashboard-view-wrapper.theme-highContrast .dashboard-view-title {
                color: #FFFFFF;
            }

            .dashboard-view-controls {
                display: flex;
                gap: 8px;
                align-items: center;
            }

            .dashboard-view-button {
                width: 16px;
                height: 16px;
                border: 1px solid currentColor;
                border-radius: 2px;
                background: transparent;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 10px;
                color: inherit;
                opacity: 0.7;
                transition: opacity 150ms ease;
            }

            .dashboard-view-button:hover {
                opacity: 1;
            }

            .dashboard-view-content {
                flex: 1;
                overflow: auto;
                min-height: 0;
            }

            .dashboard-view-placeholder {
                border: 2px dashed #00FF00;
                background: rgba(0, 255, 0, 0.05);
                border-radius: 8px;
                min-height: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #00FF00;
                font-size: 12px;
                opacity: 0.5;
            }

            .dashboard-view-wrapper.theme-light .dashboard-view-placeholder {
                border-color: #228B22;
                background: rgba(34, 139, 34, 0.05);
                color: #228B22;
            }

            .dashboard-view-wrapper.theme-highContrast .dashboard-view-placeholder {
                border-color: #FFFFFF;
                background: rgba(255, 255, 255, 0.05);
                color: #FFFFFF;
            }

            /* Responsive layout */
            @media (max-width: 1024px) {
                .dashboard-views-container {
                    gap: 12px;
                    padding: 12px;
                }

                .dashboard-view-wrapper[data-size="large"],
                .dashboard-view-wrapper[data-size="fullscreen"] {
                    width: 100% !important;
                }
            }

            @media (max-width: 768px) {
                .dashboard-views-container {
                    flex-direction: column;
                }

                .dashboard-view-wrapper {
                    width: 100% !important;
                }
            }
        `;

        document.head.appendChild(style);
        document.body.appendChild(container);
    }

    /**
     * Create a view wrapper with drag handle
     * @private
     * @param {string} viewId - View identifier
     * @param {Object} viewConfig - View configuration
     * @returns {HTMLElement} Wrapper element
     */
    _createViewWrapper(viewId, viewConfig) {
        const wrapper = document.createElement('div');
        wrapper.className = 'dashboard-view-wrapper';
        wrapper.dataset.viewId = viewId;
        wrapper.dataset.size = viewConfig.size || 'medium';

        // Create drag handle
        const handle = document.createElement('div');
        handle.className = 'dashboard-view-handle';

        // Title
        const title = document.createElement('span');
        title.className = 'dashboard-view-title';
        title.textContent = viewConfig.title || viewId;
        handle.appendChild(title);

        // Controls
        const controls = document.createElement('div');
        controls.className = 'dashboard-view-controls';

        // Size button (if resizable)
        if (viewConfig.resizable !== false) {
            const sizeBtn = document.createElement('button');
            sizeBtn.className = 'dashboard-view-button';
            sizeBtn.innerHTML = '⤢';
            sizeBtn.title = 'Resize';
            sizeBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                this._cycleViewSize(viewId);
            });
            controls.appendChild(sizeBtn);
        }

        // Collapse button (if collapsible)
        if (viewConfig.collapsible !== false) {
            const collapseBtn = document.createElement('button');
            collapseBtn.className = 'dashboard-view-button';
            collapseBtn.innerHTML = '−';
            collapseBtn.title = 'Collapse';
            collapseBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                this._toggleViewCollapse(viewId);
            });
            controls.appendChild(collapseBtn);
        }

        // Close button
        const closeBtn = document.createElement('button');
        closeBtn.className = 'dashboard-view-button';
        closeBtn.innerHTML = '×';
        closeBtn.title = 'Close';
        closeBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            this.removeView(viewId);
        });
        controls.appendChild(closeBtn);

        handle.appendChild(controls);
        wrapper.appendChild(handle);

        // Content container
        const content = document.createElement('div');
        content.className = 'dashboard-view-content';

        // Move original element into content
        const originalElement = viewConfig.element;
        if (originalElement.parentNode) {
            originalElement.parentNode.removeChild(originalElement);
        }
        content.appendChild(originalElement);

        wrapper.appendChild(content);

        // Add drag functionality
        handle.addEventListener('mousedown', (e) => {
            if (e.target.classList.contains('dashboard-view-button')) return;
            this._startDrag(e, viewId, wrapper);
        });

        // Apply theme class
        if (typeof window !== 'undefined' && window.analyticsTheme) {
            const theme = window.analyticsTheme.currentTheme;
            wrapper.classList.add(`theme-${theme}`);
        }

        return wrapper;
    }

    /**
     * Start drag operation
     * @private
     * @param {MouseEvent} e - Mouse event
     * @param {string} viewId - View identifier
     * @param {HTMLElement} wrapper - Wrapper element
     */
    _startDrag(e, viewId, wrapper) {
        e.preventDefault();

        this.dragState.isDragging = true;
        this.dragState.draggedView = wrapper;
        this.dragState.startY = e.clientY;
        this.dragState.startX = e.clientX;
        this.dragState.originalIndex = parseInt(wrapper.dataset.order || 0);
        this.dragState.currentIndex = this.dragState.originalIndex;

        // Create placeholder
        const placeholder = document.createElement('div');
        placeholder.className = 'dashboard-view-placeholder';
        placeholder.textContent = 'Drop here';
        placeholder.style.width = wrapper.style.width;
        placeholder.style.height = wrapper.style.height;
        this.dragState.placeholder = placeholder;

        // Add dragging styles
        wrapper.classList.add('dragging');

        // Replace wrapper with placeholder in DOM
        wrapper.parentNode.insertBefore(placeholder, wrapper);
        wrapper.style.position = 'fixed';
        wrapper.style.left = `${e.clientX - wrapper.offsetWidth / 2}px`;
        wrapper.style.top = `${e.clientY - this.options.dragHandleHeight / 2}px`;
        wrapper.style.zIndex = '10000';

        // Add global event listeners
        document.addEventListener('mousemove', this._handleDrag);
        document.addEventListener('mouseup', this._endDrag);

        // Emit drag start event
        this._emitChangeEvent('dragstart', { viewId });
    }

    /**
     * Handle drag movement
     * @private
     */
    _handleDrag = (e) => {
        if (!this.dragState.isDragging) return;

        const wrapper = this.dragState.draggedView;
        const placeholder = this.dragState.placeholder;

        // Move wrapper with mouse
        wrapper.style.left = `${e.clientX - wrapper.offsetWidth / 2}px`;
        wrapper.style.top = `${e.clientY - this.options.dragHandleHeight / 2}px`;

        // Find drop target
        const container = document.getElementById('dashboard-views-container');
        const children = Array.from(container.children);
        const draggedRect = wrapper.getBoundingClientRect();

        let newIndex = this.dragState.originalIndex;

        for (let i = 0; i < children.length; i++) {
            const child = children[i];
            if (child === wrapper || child === placeholder) continue;

            const rect = child.getBoundingClientRect();
            const centerY = rect.top + rect.height / 2;
            const centerX = rect.left + rect.width / 2;

            // Check if dragged element is over this child
            if (draggedRect.top < centerY && draggedRect.bottom > centerY &&
                draggedRect.left < centerX && draggedRect.right > centerX) {
                newIndex = i;
                break;
            }
        }

        // Update placeholder position if index changed
        if (newIndex !== this.dragState.currentIndex) {
            this.dragState.currentIndex = newIndex;
            container.insertBefore(placeholder, children[newIndex] || null);
        }
    };

    /**
     * End drag operation
     * @private
     */
    _endDrag = () => {
        if (!this.dragState.isDragging) return;

        const wrapper = this.dragState.draggedView;
        const placeholder = this.dragState.placeholder;
        const viewId = wrapper.dataset.viewId;

        // Remove dragging styles
        wrapper.classList.remove('dragging');

        // Move wrapper to placeholder position
        placeholder.parentNode.insertBefore(wrapper, placeholder);
        placeholder.parentNode.removeChild(placeholder);

        // Reset wrapper styles
        wrapper.style.position = '';
        wrapper.style.left = '';
        wrapper.style.top = '';
        wrapper.style.zIndex = '';

        // Update order in layout
        const newIndex = this.dragState.currentIndex;
        if (newIndex !== this.dragState.originalIndex) {
            this.moveView(viewId, newIndex);
        }

        // Reset drag state
        this.dragState.isDragging = false;
        this.dragState.draggedView = null;
        this.dragState.placeholder = null;

        // Remove global event listeners
        document.removeEventListener('mousemove', this._handleDrag);
        document.removeEventListener('mouseup', this._endDrag);

        // Emit drag end event
        this._emitChangeEvent('dragend', { viewId, newIndex });
    };

    /**
     * Cycle view size through available sizes
     * @private
     * @param {string} viewId - View identifier
     */
    _cycleViewSize(viewId) {
        const layoutView = this.currentLayout.views.find(v => v.id === viewId);
        if (!layoutView) return;

        const sizes = ['small', 'medium', 'large', 'fullscreen'];
        const currentIndex = sizes.indexOf(layoutView.size);
        const nextIndex = (currentIndex + 1) % sizes.length;

        this.resizeView(viewId, sizes[nextIndex]);
    }

    /**
     * Toggle view collapse
     * @private
     * @param {string} viewId - View identifier
     */
    _toggleViewCollapse(viewId) {
        const wrapper = this.viewElements.get(viewId);
        if (!wrapper) return;

        const content = wrapper.querySelector('.dashboard-view-content');
        if (!content) return;

        const isCollapsed = content.style.display === 'none';
        content.style.display = isCollapsed ? '' : 'none';
        wrapper.dataset.collapsed = !isCollapsed;

        console.log(`[DashboardLayoutManager] View ${viewId} ${isCollapsed ? 'expanded' : 'collapsed'}`);
    }

    /**
     * Initialize responsive layout handling
     * @private
     */
    _initResponsiveHandling() {
        if (typeof window === 'undefined') return;

        let resizeTimer;
        window.addEventListener('resize', () => {
            if (resizeTimer) clearTimeout(resizeTimer);

            resizeTimer = setTimeout(() => {
                this._handleResize();
            }, 250);
        });
    }

    /**
     * Handle window resize
     * @private
     */
    _handleResize() {
        // Adjust layout for mobile if needed
        const isMobile = window.innerWidth <= 768;

        this.viewElements.forEach((wrapper, viewId) => {
            if (isMobile) {
                // On mobile, all views are full width
                wrapper.style.width = '100%';
            } else {
                // Restore configured size
                const layoutView = this.currentLayout.views.find(v => v.id === viewId);
                if (layoutView) {
                    this._applyViewSize(wrapper, layoutView.size);
                }
            }
        });

        console.log('[DashboardLayoutManager] Responsive layout adjusted');
    }

    /**
     * Initialize keyboard shortcuts
     * @private
     */
    _initKeyboardShortcuts() {
        if (typeof window === 'undefined') return;

        document.addEventListener('keydown', (e) => {
            // Ctrl/Cmd + Shift + L: Reset to default layout
            if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'L') {
                e.preventDefault();
                this.resetToDefault();
                console.log('[DashboardLayoutManager] Reset to default layout (keyboard shortcut)');
            }

            // Ctrl/Cmd + Shift + S: Save as custom preset
            if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'S') {
                e.preventDefault();
                const presetName = prompt('Enter preset name:', 'custom');
                if (presetName) {
                    this.saveAsPreset(presetName);
                    console.log(`[DashboardLayoutManager] Saved custom preset: ${presetName}`);
                }
            }

            // Ctrl/Cmd + Shift + E: Export layout
            if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'E') {
                e.preventDefault();
                const layoutJson = this.exportLayout();
                console.log('[DashboardLayoutManager] Layout exported:', layoutJson);

                // Trigger download
                const blob = new Blob([layoutJson], { type: 'application/json' });
                const url = URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = `dashboard-layout-${Date.now()}.json`;
                a.click();
                URL.revokeObjectURL(url);
            }
        });
    }

    /**
     * Emit layout change event to all listeners
     * @private
     * @param {string} eventType - Type of event
     * @param {Object} detail - Event detail data
     */
    _emitChangeEvent(eventType, detail) {
        const event = {
            type: eventType,
            detail: {
                ...detail,
                layout: this.currentLayout,
                preset: this.currentPreset
            }
        };

        this.listeners.forEach(({ event: registeredEvent, callback }) => {
            if (registeredEvent === eventType || registeredEvent === 'layoutchange') {
                try {
                    callback(event);
                } catch (error) {
                    console.error(`[DashboardLayoutManager] Error in ${eventType} listener:`, error);
                }
            }
        });

        // Also dispatch DOM event for non-manager listeners
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent(`dashboard-${eventType}`, {
                detail: event.detail
            }));
        }
    }

    /**
     * Update theme class on all view wrappers
     */
    updateTheme(themeName) {
        this.viewElements.forEach(wrapper => {
            wrapper.classList.remove('theme-dark', 'theme-light', 'theme-highContrast');
            wrapper.classList.add(`theme-${themeName}`);
        });

        console.log(`[DashboardLayoutManager] Updated theme to: ${themeName}`);
    }

    /**
     * Destroy the layout manager
     */
    destroy() {
        // Cancel auto-save timer
        if (this.autoSaveTimer) {
            clearTimeout(this.autoSaveTimer);
        }

        // Clear listeners
        this.listeners = [];

        // Remove dashboard container
        const container = document.getElementById('dashboard-views-container');
        if (container && container.parentNode) {
            container.parentNode.removeChild(container);
        }

        // Clear maps
        this.views.clear();
        this.viewElements.clear();

        console.log('[DashboardLayoutManager] Destroyed');
    }
}

// Global layout manager instance
if (typeof window !== 'undefined') {
    window.DashboardLayoutManager = DashboardLayoutManager;

    // Auto-initialize global instance
    window.dashboardLayout = new DashboardLayoutManager();

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            window.dashboardLayout.init();
        });
    } else {
        window.dashboardLayout.init();
    }

    // Listen for theme changes
    if (window.analyticsTheme) {
        window.analyticsTheme.addEventListener('themechange', (event) => {
            if (window.dashboardLayout) {
                window.dashboardLayout.updateTheme(event.detail.theme);
            }
        });
    }
}

// Export for module environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DashboardLayoutManager };
}
