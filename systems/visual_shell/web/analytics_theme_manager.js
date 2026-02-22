/**
 * AnalyticsThemeManager - Theme Management for Neural Heatmap Analytics
 *
 * Provides theme configuration, switching, and persistence for analytics views.
 * Supports light/dark themes with smooth transitions and custom theme support.
 *
 * Part of: Neural Heatmap Phase 2.2 - UI/UX Theme System
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-2-theme-system.md
 *
 * @class AnalyticsThemeManager
 * @example
 * const themeManager = new AnalyticsThemeManager();
 * themeManager.init();
 * themeManager.setTheme('dark');
 * themeManager.addEventListener('themechange', (event) => {
 *     console.log('Theme changed to:', event.detail.theme);
 * });
 */

class AnalyticsThemeManager {
    /**
     * Create a new AnalyticsThemeManager
     * @param {Object} options - Configuration options
     * @param {string} options.storageKey - localStorage key (default: 'analytics-theme')
     * @param {string} options.defaultTheme - Default theme (default: 'dark')
     * @param {boolean} options.persist - Persist to localStorage (default: true)
     */
    constructor(options = {}) {
        this.options = {
            storageKey: 'analytics-theme',
            defaultTheme: 'dark',
            persist: true,
            transitionDuration: 300,
            ...options
        };

        // Current theme state
        this.currentTheme = this.options.defaultTheme;
        this.previousTheme = null;

        // Event listeners for theme changes
        this.listeners = [];

        // Built-in theme definitions
        this.themes = {
            // Dark theme - optimized for low-light environments
            dark: {
                name: 'Dark',
                description: 'Dark theme for low-light environments',
                colors: {
                    // Background colors
                    background: {
                        primary: 0x0a0a1a,
                        secondary: 0x141428,
                        tertiary: 0x1e1e38,
                        panel: 0x0a0a1a,
                        panelTransparent: 0x0a0a1a,
                        panelOpacity: 0.95
                    },
                    // Border colors
                    border: {
                        primary: 0x00FF00,
                        secondary: 0xFF00FF,
                        tertiary: 0x00FFFF,
                        subtle: 0x333333
                    },
                    // Text colors
                    text: {
                        primary: 0xFFFFFF,
                        secondary: 0xCCCCCC,
                        tertiary: 0xAAAAAA,
                        muted: 0x666666,
                        inverse: 0x000000
                    },
                    // Accent colors
                    accent: {
                        green: 0x00FF00,
                        magenta: 0xFF00FF,
                        cyan: 0x00FFFF,
                        yellow: 0xFFFF00,
                        orange: 0xFFAA00
                    },
                    // Status colors
                    status: {
                        success: 0x00FF88,
                        warning: 0xFFAA00,
                        error: 0xFF4444,
                        info: 0x4488ff,
                        neutral: 0x888888
                    },
                    // Correlation heatmap colors
                    correlation: {
                        negative: { r: 0, g: 100, b: 255 },
                        neutral: { r: 240, g: 240, b: 240 },
                        positive: { r: 255, g: 50, b: 50 }
                    },
                    // Intensity colors
                    intensity: {
                        low: 0x00FF00,
                        medium: 0xFFFF00,
                        high: 0xFF0000
                    }
                },
                // Theme-specific UI settings
                ui: {
                    cornerRadius: 8,
                    spacing: 10,
                    fontSize: {
                        title: 14,
                        label: 11,
                        small: 9
                    }
                }
            },

            // Light theme - optimized for well-lit environments
            light: {
                name: 'Light',
                description: 'Light theme for well-lit environments',
                colors: {
                    // Background colors
                    background: {
                        primary: 0xF5F5F5,
                        secondary: 0xE8E8E8,
                        tertiary: 0xDDDDDD,
                        panel: 0xFFFFFF,
                        panelTransparent: 0xFFFFFF,
                        panelOpacity: 0.98
                    },
                    // Border colors
                    border: {
                        primary: 0x228B22,      // Forest green
                        secondary: 0x9932CC,    // Dark orchid
                        tertiary: 0x008B8B,     // Dark cyan
                        subtle: 0xCCCCCC
                    },
                    // Text colors
                    text: {
                        primary: 0x222222,
                        secondary: 0x444444,
                        tertiary: 0x666666,
                        muted: 0x999999,
                        inverse: 0xFFFFFF
                    },
                    // Accent colors
                    accent: {
                        green: 0x228B22,
                        magenta: 0x9932CC,
                        cyan: 0x008B8B,
                        yellow: 0xDAA520,      // Goldenrod
                        orange: 0xD2691E       // Chocolate
                    },
                    // Status colors
                    status: {
                        success: 0x228B22,
                        warning: 0xDAA520,
                        error: 0xDC143C,
                        info: 0x4169E1,
                        neutral: 0x808080
                    },
                    // Correlation heatmap colors
                    correlation: {
                        negative: { r: 0, g: 80, b: 200 },
                        neutral: { r: 200, g: 200, b: 200 },
                        positive: { r: 200, g: 40, b: 40 }
                    },
                    // Intensity colors
                    intensity: {
                        low: 0x228B22,
                        medium: 0xDAA520,
                        high: 0xDC143C
                    }
                },
                // Theme-specific UI settings
                ui: {
                    cornerRadius: 8,
                    spacing: 10,
                    fontSize: {
                        title: 14,
                        label: 11,
                        small: 9
                    }
                }
            },

            // High contrast theme - for accessibility
            highContrast: {
                name: 'High Contrast',
                description: 'High contrast theme for accessibility',
                colors: {
                    // Background colors
                    background: {
                        primary: 0x000000,
                        secondary: 0x111111,
                        tertiary: 0x222222,
                        panel: 0x000000,
                        panelTransparent: 0x000000,
                        panelOpacity: 1.0
                    },
                    // Border colors
                    border: {
                        primary: 0xFFFFFF,
                        secondary: 0xFFFFFF,
                        tertiary: 0xFFFFFF,
                        subtle: 0x888888
                    },
                    // Text colors
                    text: {
                        primary: 0xFFFFFF,
                        secondary: 0xFFFFFF,
                        tertiary: 0xFFFFFF,
                        muted: 0xCCCCCC,
                        inverse: 0x000000
                    },
                    // Accent colors
                    accent: {
                        green: 0x00FF00,
                        magenta: 0xFF00FF,
                        cyan: 0x00FFFF,
                        yellow: 0xFFFF00,
                        orange: 0xFFAA00
                    },
                    // Status colors
                    status: {
                        success: 0x00FF00,
                        warning: 0xFFFF00,
                        error: 0xFF0000,
                        info: 0x00FFFF,
                        neutral: 0xFFFFFF
                    },
                    // Correlation heatmap colors
                    correlation: {
                        negative: { r: 0, g: 0, b: 255 },
                        neutral: { r: 128, g: 128, b: 128 },
                        positive: { r: 255, g: 0, b: 0 }
                    },
                    // Intensity colors
                    intensity: {
                        low: 0x00FF00,
                        medium: 0xFFFF00,
                        high: 0xFF0000
                    }
                },
                // Theme-specific UI settings
                ui: {
                    cornerRadius: 4,
                    spacing: 12,
                    fontSize: {
                        title: 16,
                        label: 13,
                        small: 11
                    }
                }
            }
        };

        // Initialize theme from storage or default
        this._loadTheme();

        console.log('[AnalyticsThemeManager] Initialized');
    }

    /**
     * Initialize the theme manager
     * @returns {AnalyticsThemeManager} This instance for chaining
     */
    init() {
        // Apply initial theme
        this._applyTheme(this.currentTheme);

        // Listen for system theme changes if supported
        this._initSystemThemeListener();

        console.log(`[AnalyticsThemeManager] Initialized with theme: ${this.currentTheme}`);

        return this;
    }

    /**
     * Get the current theme configuration
     * @returns {Object} Current theme configuration
     */
    getTheme() {
        return this.themes[this.currentTheme];
    }

    /**
     * Get a specific color from the current theme
     * @param {string} category - Color category (e.g., 'background', 'text', 'accent')
     * @param {string} shade - Color shade (e.g., 'primary', 'secondary')
     * @returns {number|Object} Color value (0xRRGGBB or RGB object)
     */
    getColor(category, shade) {
        const theme = this.getTheme();
        if (theme && theme.colors && theme.colors[category]) {
            return theme.colors[category][shade];
        }
        return 0x000000;
    }

    /**
     * Set the current theme
     * @param {string} themeName - Theme name ('dark', 'light', 'highContrast', or custom)
     * @returns {boolean} True if theme was set successfully
     */
    setTheme(themeName) {
        if (!this.themes[themeName]) {
            console.warn(`[AnalyticsThemeManager] Unknown theme: ${themeName}`);
            return false;
        }

        this.previousTheme = this.currentTheme;
        this.currentTheme = themeName;

        // Apply the theme
        this._applyTheme(themeName);

        // Persist to localStorage
        if (this.options.persist) {
            this._saveTheme();
        }

        // Emit theme change event
        this._emitChangeEvent();

        console.log(`[AnalyticsThemeManager] Theme changed: ${this.previousTheme} -> ${themeName}`);

        return true;
    }

    /**
     * Toggle between light and dark themes
     * @returns {string} New theme name
     */
    toggleTheme() {
        const newTheme = this.currentTheme === 'dark' ? 'light' : 'dark';
        this.setTheme(newTheme);
        return newTheme;
    }

    /**
     * Register a custom theme
     * @param {string} themeName - Unique theme name
     * @param {Object} themeConfig - Theme configuration matching the built-in theme structure
     * @returns {boolean} True if theme was registered successfully
     */
    registerTheme(themeName, themeConfig) {
        if (this.themes[themeName]) {
            console.warn(`[AnalyticsThemeManager] Theme already exists: ${themeName}`);
            return false;
        }

        // Validate theme structure
        if (!themeConfig.colors || !themeConfig.ui) {
            console.error('[AnalyticsThemeManager] Invalid theme configuration');
            return false;
        }

        this.themes[themeName] = themeConfig;
        console.log(`[AnalyticsThemeManager] Registered custom theme: ${themeName}`);

        return true;
    }

    /**
     * Unregister a custom theme
     * @param {string} themeName - Theme name to unregister
     * @returns {boolean} True if theme was unregistered
     */
    unregisterTheme(themeName) {
        // Don't allow unregistering built-in themes
        if (['dark', 'light', 'highContrast'].includes(themeName)) {
            console.warn(`[AnalyticsThemeManager] Cannot unregister built-in theme: ${themeName}`);
            return false;
        }

        if (!this.themes[themeName]) {
            console.warn(`[AnalyticsThemeManager] Theme not found: ${themeName}`);
            return false;
        }

        // Switch to default theme if current theme is being unregistered
        if (this.currentTheme === themeName) {
            this.setTheme(this.options.defaultTheme);
        }

        delete this.themes[themeName];
        console.log(`[AnalyticsThemeManager] Unregistered theme: ${themeName}`);

        return true;
    }

    /**
     * Get list of available themes
     * @returns {Array<string>} Array of theme names
     */
    getAvailableThemes() {
        return Object.keys(this.themes);
    }

    /**
     * Add event listener for theme changes
     * @param {string} event - Event name ('themechange')
     * @param {Function} callback - Callback function
     */
    addEventListener(event, callback) {
        if (event === 'themechange') {
            this.listeners.push(callback);
        }
    }

    /**
     * Remove event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function to remove
     */
    removeEventListener(event, callback) {
        if (event === 'themechange') {
            this.listeners = this.listeners.filter(cb => cb !== callback);
        }
    }

    /**
     * Load theme from localStorage
     * @private
     */
    _loadTheme() {
        if (!this.options.persist) return;

        try {
            const stored = localStorage.getItem(this.options.storageKey);
            if (stored && this.themes[stored]) {
                this.currentTheme = stored;
            }
        } catch (error) {
            console.warn('[AnalyticsThemeManager] Failed to load theme from storage:', error);
        }
    }

    /**
     * Save theme to localStorage
     * @private
     */
    _saveTheme() {
        if (!this.options.persist) return;

        try {
            localStorage.setItem(this.options.storageKey, this.currentTheme);
        } catch (error) {
            console.warn('[AnalyticsThemeManager] Failed to save theme to storage:', error);
        }
    }

    /**
     * Apply theme to document and emit event
     * @private
     */
    _applyTheme(themeName) {
        // Add CSS class to document for CSS-based theming
        if (typeof document !== 'undefined') {
            document.body.classList.remove('theme-dark', 'theme-light', 'theme-highContrast');
            document.body.classList.add(`theme-${themeName}`);

            // Set data attribute for styling hooks
            document.body.dataset.theme = themeName;

            // Apply CSS transition for smooth theme changes
            document.body.style.transition = `background-color ${this.options.transitionDuration}ms ease, color ${this.options.transitionDuration}ms ease`;
        }
    }

    /**
     * Initialize system theme change listener
     * @private
     */
    _initSystemThemeListener() {
        if (typeof window === 'undefined' || !window.matchMedia) return;

        const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');

        const handleSystemThemeChange = (e) => {
            // Only auto-switch if user hasn't manually set a preference
            const hasManualPreference = localStorage.getItem(this.options.storageKey);
            if (!hasManualPreference) {
                const systemTheme = e.matches ? 'dark' : 'light';
                this.setTheme(systemTheme);
            }
        };

        // Listen for system theme changes
        mediaQuery.addEventListener('change', handleSystemThemeChange);

        // Initial check
        if (!localStorage.getItem(this.options.storageKey)) {
            handleSystemThemeChange(mediaQuery);
        }
    }

    /**
     * Emit theme change event to all listeners
     * @private
     */
    _emitChangeEvent() {
        const event = {
            type: 'themechange',
            detail: {
                theme: this.currentTheme,
                previous: this.previousTheme,
                themeConfig: this.getTheme()
            }
        };

        this.listeners.forEach(callback => {
            try {
                callback(event);
            } catch (error) {
                console.error('[AnalyticsThemeManager] Error in theme change listener:', error);
            }
        });

        // Also dispatch DOM event for non-manager listeners
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent('analytics-themechange', {
                detail: event.detail
            }));
        }
    }

    /**
     * Destroy the theme manager
     */
    destroy() {
        this.listeners = [];

        // Remove theme classes from document
        if (typeof document !== 'undefined') {
            document.body.classList.remove('theme-dark', 'theme-light', 'theme-highContrast');
            delete document.body.dataset.theme;
        }

        console.log('[AnalyticsThemeManager] Destroyed');
    }
}

// Global theme manager instance
if (typeof window !== 'undefined') {
    window.AnalyticsThemeManager = AnalyticsThemeManager;

    // Auto-initialize global instance
    window.analyticsTheme = new AnalyticsThemeManager();

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            window.analyticsTheme.init();
        });
    } else {
        window.analyticsTheme.init();
    }
}

// Export for module environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AnalyticsThemeManager };
}
