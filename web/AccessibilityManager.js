/**
 * Geometry OS Accessibility Manager
 *
 * Provides comprehensive accessibility support for the visual shell:
 * - ARIA labels and live regions
 * - Keyboard navigation with focus management
 * - Screen reader announcements
 * - High contrast mode support
 * - Reduced motion support
 *
 * WCAG 2.1 Level AA compliant
 */

// Keyboard navigation modes
const FOCUS_MODES = {
    DEFAULT: 'default',
    NAVIGATION: 'navigation',
    INTERACTION: 'interaction'
};

// Focus trap areas
const FOCUS_ZONES = {
    HEADER: 'header',
    TASKBAR: 'taskbar',
    SIDEBAR_LEFT: 'sidebar-left',
    SIDEBAR_RIGHT: 'sidebar-right',
    CANVAS: 'canvas',
    TERMINAL: 'terminal',
    MODAL: 'modal'
};

/**
 * AccessibilityManager - Handles all accessibility features
 */
export class AccessibilityManager {
    constructor(os) {
        this.os = os;

        // ARIA live region for announcements
        this.liveRegion = null;
        this.politeRegion = null;

        // Focus management
        this.focusMode = FOCUS_MODES.DEFAULT;
        this.currentZone = FOCUS_ZONES.CANVAS;
        this.focusHistory = [];
        this.focusableElements = new Map();

        // Keyboard state
        this.isKeyboardUser = false;
        this.lastKeyTime = 0;

        // Accessibility preferences
        this.preferences = {
            highContrast: false,
            reducedMotion: false,
            screenReaderMode: false,
            keyboardFocusIndicator: true
        };

        // Callbacks
        this.onFocusChange = null;
        this.onZoneChange = null;
        this.onAnnouncement = null;
    }

    /**
     * Initialize accessibility features
     */
    async init() {
        this._detectPreferences();
        this._createLiveRegions();
        this._wireEvents();
        this._setupKeyboardNavigation();
        this._applyPreferences();

        console.log('[Accessibility] Manager initialized');
        return this;
    }

    /**
     * Detect user preferences from system settings
     */
    _detectPreferences() {
        // Check for reduced motion preference
        if (window.matchMedia) {
            const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
            this.preferences.reducedMotion = reducedMotion.matches;
            reducedMotion.addEventListener('change', (e) => {
                this.preferences.reducedMotion = e.matches;
                this._applyPreferences();
            });

            // Check for high contrast preference
            const highContrast = window.matchMedia('(prefers-contrast: more)');
            this.preferences.highContrast = highContrast.matches;
            highContrast.addEventListener('change', (e) => {
                this.preferences.highContrast = e.matches;
                this._applyPreferences();
            });

            // Check for forced colors (Windows high contrast mode)
            const forcedColors = window.matchMedia('(forced-colors: active)');
            if (forcedColors.matches) {
                this.preferences.highContrast = true;
                this._applyPreferences();
            }
        }
    }

    /**
     * Create ARIA live regions for announcements
     */
    _createLiveRegions() {
        // Assertive region for urgent announcements
        this.liveRegion = document.createElement('div');
        this.liveRegion.id = 'a11y-live-region';
        this.liveRegion.setAttribute('role', 'status');
        this.liveRegion.setAttribute('aria-live', 'assertive');
        this.liveRegion.setAttribute('aria-atomic', 'true');
        this.liveRegion.className = 'sr-only';
        this.liveRegion.style.cssText = `
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        `;
        document.body.appendChild(this.liveRegion);

        // Polite region for non-urgent announcements
        this.politeRegion = document.createElement('div');
        this.politeRegion.id = 'a11y-polite-region';
        this.politeRegion.setAttribute('role', 'status');
        this.politeRegion.setAttribute('aria-live', 'polite');
        this.politeRegion.setAttribute('aria-atomic', 'true');
        this.politeRegion.className = 'sr-only';
        this.politeRegion.style.cssText = this.liveRegion.style.cssText;
        document.body.appendChild(this.politeRegion);
    }

    /**
     * Wire up accessibility-related events
     */
    _wireEvents() {
        // Detect keyboard vs mouse users
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Tab') {
                this.isKeyboardUser = true;
                document.body.classList.add('keyboard-navigation');
            }
            this.lastKeyTime = Date.now();
        });

        document.addEventListener('mousedown', () => {
            this.isKeyboardUser = false;
            document.body.classList.remove('keyboard-navigation');
        });

        // Global keyboard shortcuts
        document.addEventListener('keydown', (e) => this._handleGlobalKeydown(e));

        // Focus tracking
        document.addEventListener('focusin', (e) => this._handleFocusIn(e));
        document.addEventListener('focusout', (e) => this._handleFocusOut(e));
    }

    /**
     * Setup keyboard navigation zones
     */
    _setupKeyboardNavigation() {
        // Register default focusable zones
        this.registerFocusZone(FOCUS_ZONES.HEADER, {
            selector: '#desktop-header button, #desktop-header [tabindex]',
            ariaLabel: 'Desktop header',
            onEnter: () => this.announce('Entered header area. Use arrow keys to navigate.'),
            onExit: () => {}
        });

        this.registerFocusZone(FOCUS_ZONES.TASKBAR, {
            selector: '#task-bar button, #task-bar [tabindex]',
            ariaLabel: 'Task bar',
            onEnter: () => this.announce('Entered task bar. Use arrow keys to navigate.'),
            onExit: () => {}
        });

        this.registerFocusZone(FOCUS_ZONES.SIDEBAR_LEFT, {
            selector: '#spawner-panel button, #spawner-panel [tabindex], #spawner-panel .process-item',
            ariaLabel: 'Process spawner panel',
            onEnter: () => this.announce('Entered process spawner panel. Use arrow keys to navigate processes.'),
            onExit: () => {}
        });

        this.registerFocusZone(FOCUS_ZONES.SIDEBAR_RIGHT, {
            selector: '#dashboard-panel button, #dashboard-panel [tabindex], #dashboard-panel input',
            ariaLabel: 'System dashboard panel',
            onEnter: () => this.announce('Entered system dashboard. Use Tab to navigate.'),
            onExit: () => {}
        });

        this.registerFocusZone(FOCUS_ZONES.CANVAS, {
            selector: '#gpu-canvas',
            ariaLabel: 'Geometry OS visual canvas',
            onEnter: () => this.announce('Entered visual canvas. Use arrow keys to pan, plus/minus to zoom.'),
            onExit: () => {}
        });

        this.registerFocusZone(FOCUS_ZONES.TERMINAL, {
            selector: '.glyph-terminal input, .glyph-terminal button',
            ariaLabel: 'Glyph terminal',
            onEnter: () => this.announce('Entered terminal. Type commands and press Enter to execute.'),
            onExit: () => {}
        });
    }

    /**
     * Register a focus zone for keyboard navigation
     */
    registerFocusZone(zoneId, config) {
        this.focusableElements.set(zoneId, {
            id: zoneId,
            selector: config.selector,
            ariaLabel: config.ariaLabel,
            onEnter: config.onEnter || (() => {}),
            onExit: config.onExit || (() => {}),
            elements: []
        });
    }

    /**
     * Update focusable elements in a zone
     */
    updateFocusableElements(zoneId) {
        const zone = this.focusableElements.get(zoneId);
        if (!zone) return;

        zone.elements = Array.from(document.querySelectorAll(zone.selector))
            .filter(el => !el.hidden && el.offsetParent !== null);
    }

    /**
     * Handle global keyboard shortcuts
     */
    _handleGlobalKeydown(e) {
        // Skip if in input field
        if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') {
            return;
        }

        // F6 - Cycle through zones
        if (e.key === 'F6') {
            e.preventDefault();
            this._cycleZone(e.shiftKey ? -1 : 1);
            return;
        }

        // Escape - Return to previous zone or cancel
        if (e.key === 'Escape') {
            this._handleEscape();
            return;
        }

        // Alt+number - Jump to specific zone
        if (e.altKey && /^[1-6]$/.test(e.key)) {
            e.preventDefault();
            const zones = Object.values(FOCUS_ZONES);
            const targetZone = zones[parseInt(e.key) - 1];
            if (targetZone) {
                this.focusZone(targetZone);
            }
            return;
        }

        // Arrow key navigation within canvas
        if (this.currentZone === FOCUS_ZONES.CANVAS) {
            this._handleCanvasNavigation(e);
        }

        // Screen reader mode toggle
        if (e.ctrlKey && e.shiftKey && e.key === 'S') {
            e.preventDefault();
            this.toggleScreenReaderMode();
        }

        // High contrast toggle
        if (e.ctrlKey && e.shiftKey && e.key === 'H') {
            e.preventDefault();
            this.toggleHighContrast();
        }
    }

    /**
     * Handle Escape key
     */
    _handleEscape() {
        // Close any open modals first
        const modal = document.querySelector('[role="dialog"]');
        if (modal) {
            const closeBtn = modal.querySelector('[data-dismiss="modal"], .close-picker');
            if (closeBtn) closeBtn.click();
            this.announce('Dialog closed');
            return;
        }

        // Return to previous zone
        if (this.focusHistory.length > 0) {
            const previousZone = this.focusHistory.pop();
            this.focusZone(previousZone, false);
            this.announce(`Returned to ${this._getZoneLabel(previousZone)}`);
        }
    }

    /**
     * Handle canvas keyboard navigation
     */
    _handleCanvasNavigation(e) {
        if (!this.os) return;

        const panAmount = e.shiftKey ? 50 : 10;

        switch (e.key) {
            case 'ArrowLeft':
                e.preventDefault();
                this.os.cameraPosition.x -= panAmount;
                this.announce(`Panned left. Position: ${Math.round(this.os.cameraPosition.x)}, ${Math.round(this.os.cameraPosition.y)}`);
                break;
            case 'ArrowRight':
                e.preventDefault();
                this.os.cameraPosition.x += panAmount;
                this.announce(`Panned right. Position: ${Math.round(this.os.cameraPosition.x)}, ${Math.round(this.os.cameraPosition.y)}`);
                break;
            case 'ArrowUp':
                e.preventDefault();
                this.os.cameraPosition.y += panAmount;
                this.announce(`Panned up. Position: ${Math.round(this.os.cameraPosition.x)}, ${Math.round(this.os.cameraPosition.y)}`);
                break;
            case 'ArrowDown':
                e.preventDefault();
                this.os.cameraPosition.y -= panAmount;
                this.announce(`Panned down. Position: ${Math.round(this.os.cameraPosition.x)}, ${Math.round(this.os.cameraPosition.y)}`);
                break;
            case '+':
            case '=':
                e.preventDefault();
                this.os.cameraPosition.z = Math.max(10, this.os.cameraPosition.z - 10);
                this.announce(`Zoomed in. Level: ${Math.round(this.os.cameraPosition.z)}`);
                break;
            case '-':
            case '_':
                e.preventDefault();
                this.os.cameraPosition.z = Math.min(500, this.os.cameraPosition.z + 10);
                this.announce(`Zoomed out. Level: ${Math.round(this.os.cameraPosition.z)}`);
                break;
            case 'Home':
                e.preventDefault();
                this.os.cameraPosition = { x: 0, y: 0, z: 100 };
                this.announce('Camera reset to home position');
                break;
        }
    }

    /**
     * Cycle through focus zones
     */
    _cycleZone(direction = 1) {
        const zones = Object.values(FOCUS_ZONES);
        const currentIndex = zones.indexOf(this.currentZone);
        let newIndex = (currentIndex + direction + zones.length) % zones.length;

        // Skip zones with no focusable elements
        let attempts = 0;
        while (attempts < zones.length) {
            this.updateFocusableElements(zones[newIndex]);
            const zone = this.focusableElements.get(zones[newIndex]);
            if (zone && zone.elements.length > 0) {
                break;
            }
            newIndex = (newIndex + direction + zones.length) % zones.length;
            attempts++;
        }

        this.focusZone(zones[newIndex]);
    }

    /**
     * Focus a specific zone
     */
    focusZone(zoneId, addToHistory = true) {
        const zone = this.focusableElements.get(zoneId);
        if (!zone) return;

        if (addToHistory && this.currentZone !== zoneId) {
            this.focusHistory.push(this.currentZone);
            // Limit history size
            if (this.focusHistory.length > 10) {
                this.focusHistory.shift();
            }
        }

        this.currentZone = zoneId;
        this.updateFocusableElements(zoneId);

        if (zone.elements.length > 0) {
            zone.elements[0].focus();
            zone.onEnter();

            if (this.onZoneChange) {
                this.onZoneChange(zoneId, zone);
            }
        }
    }

    /**
     * Handle focus in event
     */
    _handleFocusIn(e) {
        // Determine which zone the focused element belongs to
        for (const [zoneId, zone] of this.focusableElements) {
            if (zone.elements.includes(e.target)) {
                if (this.currentZone !== zoneId) {
                    const prevZone = this.currentZone;
                    this.currentZone = zoneId;

                    if (this.onFocusChange) {
                        this.onFocusChange(e.target, zoneId, prevZone);
                    }
                }
                break;
            }
        }
    }

    /**
     * Handle focus out event
     */
    _handleFocusOut(e) {
        // Will be handled by focus in to new element
    }

    /**
     * Apply accessibility preferences
     */
    _applyPreferences() {
        const root = document.documentElement;

        // Reduced motion
        if (this.preferences.reducedMotion) {
            root.style.setProperty('--transition-duration', '0ms');
            root.classList.add('reduced-motion');
        } else {
            root.style.removeProperty('--transition-duration');
            root.classList.remove('reduced-motion');
        }

        // High contrast
        if (this.preferences.highContrast) {
            root.classList.add('high-contrast');
        } else {
            root.classList.remove('high-contrast');
        }

        // Screen reader mode
        if (this.preferences.screenReaderMode) {
            root.classList.add('screen-reader-mode');
        } else {
            root.classList.remove('screen-reader-mode');
        }
    }

    /**
     * Announce a message to screen readers
     */
    announce(message, priority = 'polite') {
        const region = priority === 'assertive' ? this.liveRegion : this.politeRegion;

        // Clear previous announcement
        region.textContent = '';

        // Set new announcement after a brief delay
        setTimeout(() => {
            region.textContent = message;

            if (this.onAnnouncement) {
                this.onAnnouncement(message, priority);
            }
        }, 100);

        console.log(`[Accessibility] Announced (${priority}): ${message}`);
    }

    /**
     * Toggle high contrast mode
     */
    toggleHighContrast() {
        this.preferences.highContrast = !this.preferences.highContrast;
        this._applyPreferences();
        this.announce(`High contrast mode ${this.preferences.highContrast ? 'enabled' : 'disabled'}`);
    }

    /**
     * Toggle screen reader mode
     */
    toggleScreenReaderMode() {
        this.preferences.screenReaderMode = !this.preferences.screenReaderMode;
        this._applyPreferences();
        this.announce(`Screen reader mode ${this.preferences.screenReaderMode ? 'enabled' : 'disabled'}`);
    }

    /**
     * Toggle reduced motion
     */
    toggleReducedMotion() {
        this.preferences.reducedMotion = !this.preferences.reducedMotion;
        this._applyPreferences();
        this.announce(`Reduced motion ${this.preferences.reducedMotion ? 'enabled' : 'disabled'}`);
    }

    /**
     * Get human-readable zone label
     */
    _getZoneLabel(zoneId) {
        const labels = {
            [FOCUS_ZONES.HEADER]: 'header',
            [FOCUS_ZONES.TASKBAR]: 'task bar',
            [FOCUS_ZONES.SIDEBAR_LEFT]: 'process spawner',
            [FOCUS_ZONES.SIDEBAR_RIGHT]: 'system dashboard',
            [FOCUS_ZONES.CANVAS]: 'visual canvas',
            [FOCUS_ZONES.TERMINAL]: 'terminal',
            [FOCUS_ZONES.MODAL]: 'dialog'
        };
        return labels[zoneId] || zoneId;
    }

    /**
     * Decorate HTML elements with ARIA attributes
     */
    static enhanceElement(element, config) {
        if (config.role) {
            element.setAttribute('role', config.role);
        }
        if (config.label) {
            element.setAttribute('aria-label', config.label);
        }
        if (config.labelledBy) {
            element.setAttribute('aria-labelledby', config.labelledBy);
        }
        if (config.describedBy) {
            element.setAttribute('aria-describedby', config.describedBy);
        }
        if (config.expanded !== undefined) {
            element.setAttribute('aria-expanded', config.expanded);
        }
        if (config.selected !== undefined) {
            element.setAttribute('aria-selected', config.selected);
        }
        if (config.checked !== undefined) {
            element.setAttribute('aria-checked', config.checked);
        }
        if (config.disabled !== undefined) {
            element.setAttribute('aria-disabled', config.disabled);
        }
        if (config.hasPopup) {
            element.setAttribute('aria-haspopup', config.hasPopup);
        }
        if (config.controls) {
            element.setAttribute('aria-controls', config.controls);
        }
        if (config.owns) {
            element.setAttribute('aria-owns', config.owns);
        }
        if (config.live) {
            element.setAttribute('aria-live', config.live);
        }
        if (config.tabIndex !== undefined) {
            element.setAttribute('tabindex', config.tabIndex);
        }
    }

    /**
     * Create an accessible button
     */
    static createButton(text, options = {}) {
        const button = document.createElement('button');
        button.textContent = text;
        button.type = 'button';

        AccessibilityManager.enhanceElement(button, {
            role: 'button',
            label: options.label || text,
            tabIndex: options.tabIndex || 0
        });

        if (options.onClick) {
            button.addEventListener('click', options.onClick);
        }

        if (options.className) {
            button.className = options.className;
        }

        return button;
    }

    /**
     * Create an accessible dialog
     */
    static createDialog(id, title, content, options = {}) {
        const dialog = document.createElement('div');
        dialog.id = id;
        dialog.setAttribute('role', 'dialog');
        dialog.setAttribute('aria-modal', 'true');
        dialog.setAttribute('aria-labelledby', `${id}-title`);
        dialog.setAttribute('aria-describedby', `${id}-desc`);

        dialog.innerHTML = `
            <div class="dialog-header">
                <h2 id="${id}-title">${title}</h2>
                <button class="dialog-close" aria-label="Close dialog" data-dismiss="modal">×</button>
            </div>
            <div class="dialog-content" id="${id}-desc">
                ${content}
            </div>
        `;

        // Setup focus trap
        dialog.addEventListener('keydown', (e) => {
            if (e.key === 'Tab') {
                const focusable = dialog.querySelectorAll(
                    'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
                );
                const first = focusable[0];
                const last = focusable[focusable.length - 1];

                if (e.shiftKey && document.activeElement === first) {
                    e.preventDefault();
                    last.focus();
                } else if (!e.shiftKey && document.activeElement === last) {
                    e.preventDefault();
                    first.focus();
                }
            }
        });

        return dialog;
    }

    /**
     * Create a skip link
     */
    static createSkipLink(targetId, text = 'Skip to main content') {
        const link = document.createElement('a');
        link.href = `#${targetId}`;
        link.className = 'skip-link';
        link.textContent = text;

        link.style.cssText = `
            position: absolute;
            top: -40px;
            left: 0;
            background: #00ffcc;
            color: #000;
            padding: 8px 16px;
            z-index: 10000;
            text-decoration: none;
            font-weight: bold;
            transition: top 0.2s;
        `;

        link.addEventListener('focus', () => {
            link.style.top = '0';
        });

        link.addEventListener('blur', () => {
            link.style.top = '-40px';
        });

        return link;
    }

    /**
     * Get accessibility stats
     */
    getStats() {
        return {
            isKeyboardUser: this.isKeyboardUser,
            currentZone: this.currentZone,
            focusHistoryDepth: this.focusHistory.length,
            preferences: { ...this.preferences },
            registeredZones: this.focusableElements.size
        };
    }

    /**
     * Create accessible tooltip
     */
    static createTooltip(element, text, position = 'top') {
        const tooltip = document.createElement('div');
        tooltip.className = 'a11y-tooltip';
        tooltip.setAttribute('role', 'tooltip');
        tooltip.textContent = text;
        tooltip.style.cssText = `
            position: absolute;
            background: rgba(0, 20, 20, 0.95);
            color: #00ffcc;
            padding: 6px 10px;
            font-size: 12px;
            border: 1px solid #00ffcc;
            border-radius: 4px;
            pointer-events: none;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.2s;
        `;

        element.setAttribute('aria-describedby', tooltip.id = `tooltip-${Date.now()}`);

        element.addEventListener('focus', () => {
            document.body.appendChild(tooltip);
            const rect = element.getBoundingClientRect();
            tooltip.style.left = `${rect.left}px`;
            tooltip.style.top = `${position === 'top' ? rect.top - tooltip.offsetHeight - 8 : rect.bottom + 8}px`;
            tooltip.style.opacity = '1';
        });

        element.addEventListener('blur', () => {
            tooltip.style.opacity = '0';
            setTimeout(() => tooltip.remove(), 200);
        });

        return tooltip;
    }

    /**
     * Enhance form field with label and error handling
     */
    static enhanceFormField(input, label, options = {}) {
        const container = document.createElement('div');
        container.className = 'form-field';

        const labelEl = document.createElement('label');
        labelEl.textContent = label;
        labelEl.htmlFor = input.id || (input.id = `input-${Date.now()}`);

        container.appendChild(labelEl);
        container.appendChild(input);

        if (options.required) {
            input.setAttribute('aria-required', 'true');
            labelEl.innerHTML += ' <span aria-label="required" style="color: #ff4444;">*</span>';
        }

        if (options.description) {
            const desc = document.createElement('div');
            desc.className = 'field-description sr-only';
            desc.id = `${input.id}-desc`;
            desc.textContent = options.description;
            input.setAttribute('aria-describedby', desc.id);
            container.appendChild(desc);
        }

        if (options.onError) {
            input.addEventListener('invalid', (e) => {
                const error = document.createElement('div');
                error.className = 'field-error';
                error.setAttribute('role', 'alert');
                error.id = `${input.id}-error`;
                error.textContent = options.onError(e);
                input.setAttribute('aria-invalid', 'true');
                input.setAttribute('aria-describedby', error.id);

                const existing = container.querySelector('.field-error');
                if (existing) existing.remove();
                container.appendChild(error);
            });
        }

        return container;
    }

    /**
     * Create accessible data table
     */
    static createDataTable(caption, columns, data) {
        const table = document.createElement('table');
        table.setAttribute('role', 'table');
        table.setAttribute('aria-label', caption);

        const captionEl = document.createElement('caption');
        captionEl.textContent = caption;
        captionEl.className = 'sr-only';
        table.appendChild(captionEl);

        // Header
        const thead = document.createElement('thead');
        const headerRow = document.createElement('tr');
        columns.forEach(col => {
            const th = document.createElement('th');
            th.setAttribute('scope', 'col');
            th.setAttribute('role', 'columnheader');
            th.textContent = col.label;
            if (col.sortable) {
                th.setAttribute('aria-sort', 'none');
                th.style.cursor = 'pointer';
            }
            headerRow.appendChild(th);
        });
        thead.appendChild(headerRow);
        table.appendChild(thead);

        // Body
        const tbody = document.createElement('tbody');
        data.forEach((row, index) => {
            const tr = document.createElement('tr');
            tr.setAttribute('role', 'row');
            columns.forEach(col => {
                const cell = document.createElement('td');
                cell.setAttribute('role', 'cell');
                cell.textContent = row[col.key];
                tr.appendChild(cell);
            });
            tbody.appendChild(tr);
        });
        table.appendChild(tbody);

        return table;
    }

    /**
     * Create accessible live clock
     */
    static createLiveClock() {
        const clock = document.createElement('time');
        clock.setAttribute('role', 'timer');
        clock.setAttribute('aria-live', 'polite');
        clock.setAttribute('aria-atomic', 'true');

        const update = () => {
            const now = new Date();
            clock.textContent = now.toLocaleTimeString();
            clock.setAttribute('datetime', now.toISOString());
        };

        update();
        setInterval(update, 1000);

        return clock;
    }

    /**
     * Announce dynamic content changes
     */
    announceContentChange(region, summary) {
        const message = `${region} updated: ${summary}`;
        this.announce(message, 'polite');
    }

    /**
     * Create accessible status indicator
     */
    static createStatusIndicator(label, status = 'idle') {
        const indicator = document.createElement('div');
        indicator.className = `status-indicator status-${status}`;
        indicator.setAttribute('role', 'status');
        indicator.setAttribute('aria-label', `${label}: ${status}`);

        indicator.innerHTML = `
            <span class="status-dot" aria-hidden="true"></span>
            <span class="status-label">${label}</span>
            <span class="sr-only">${status}</span>
        `;

        indicator.setStatus = (newStatus) => {
            indicator.className = `status-indicator status-${newStatus}`;
            indicator.setAttribute('aria-label', `${label}: ${newStatus}`);
            indicator.querySelector('.sr-only').textContent = newStatus;
        };

        return indicator;
    }
}

// Export constants
export { FOCUS_MODES, FOCUS_ZONES };
