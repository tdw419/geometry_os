/**
 * Accessibility Layer for Neural Heatmap Phase 2.3
 *
 * Provides comprehensive accessibility features including:
 * - ARIA labels and roles for all interactive elements
 * - Full keyboard navigation (Tab, Arrow keys, Enter, Escape, Space)
 * - Screen reader announcements for state changes
 * - Focus management for modals and dynamic content
 * - Skip links for keyboard users
 * - High contrast mode support
 *
 * Part of: Neural Heatmap Phase 2.3 - Accessibility Layer
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2.3-accessibility.md
 *
 * @class AccessibilityManager
 */

class AccessibilityManager {
    /**
     * Create a new AccessibilityManager
     * @param {Object} options - Configuration options
     * @param {HTMLElement} options.rootElement - Root element for accessibility (default: document.body)
     * @param {boolean} options.enabled - Start enabled (default: true)
     * @param {boolean} options.highContrastMode - Start in high contrast mode (default: false)
     * @param {boolean} options.reducedMotion - Start with reduced motion (default: false)
     * @param {string} options.language - Language code (default: 'en')
     */
    constructor(options = {}) {
        this.options = {
            rootElement: options.rootElement || document.body,
            enabled: options.enabled !== false,
            highContrastMode: options.highContrastMode || false,
            reducedMotion: options.reducedMotion || false,
            language: options.language || 'en',
            ...options
        };

        // State management
        this.state = {
            enabled: this.options.enabled,
            highContrastMode: this.options.highContrastMode,
            reducedMotion: this.options.reducedMotion,
            focusedElement: null,
            currentFocusStack: [],
            keyboardNavigationActive: false,
            screenReaderEnabled: this._detectScreenReader()
        };

        // Focus history for back navigation
        this.focusHistory = [];

        // Keyboard shortcuts registry
        this.keyboardShortcuts = new Map();

        // ARIA live regions
        this.liveRegions = {
            polite: null,
            assertive: null,
            status: null
        };

        // Focus trap stack for modals
        this.focusTrapStack = [];

        // Event listeners
        this.eventHandlers = new Map();

        // Component registry for a11y updates
        this.componentRegistry = new Map();

        console.log('[AccessibilityManager] Initialized');
    }

    /**
     * Initialize the accessibility layer
     */
    initialize() {
        if (!this.state.enabled) {
            console.log('[AccessibilityManager] Accessibility disabled');
            return;
        }

        // Create live regions
        this._createLiveRegions();

        // Set up skip links
        this._createSkipLinks();

        // Initialize keyboard navigation
        this._initializeKeyboardNavigation();

        // Detect and apply system preferences
        this._detectSystemPreferences();

        // Initialize high contrast mode if enabled
        if (this.state.highContrastMode) {
            this.enableHighContrastMode();
        }

        // Initialize screen reader announcer
        this.screenReaderAnnouncer = new ScreenReaderAnnouncer({
            politeRegion: this.liveRegions.polite,
            assertiveRegion: this.liveRegions.assertive
        });

        // Initialize keyboard navigation controller
        this.keyboardController = new KeyboardNavigationController({
            manager: this,
            rootElement: this.options.rootElement
        });

        // Initialize focus trap manager
        this.focusTrapManager = new FocusTrapManager({
            manager: this
        });

        // Register default keyboard shortcuts
        this._registerDefaultShortcuts();

        // Announce initialization to screen readers
        this.screenReaderAnnouncer.announce(
            'Geometry OS Neural Heatmap accessibility features initialized. Press question mark for keyboard shortcuts.',
            'polite'
        );

        console.log('[AccessibilityManager] Accessibility layer initialized');
    }

    /**
     * Create ARIA live regions for announcements
     * @private
     */
    _createLiveRegions() {
        // Polite region (non-critical announcements)
        this.liveRegions.polite = this._createLiveRegion('a11y-live-polite', 'polite');

        // Assertive region (critical announcements)
        this.liveRegions.assertive = this._createLiveRegion('a11y-live-assertive', 'assertive');

        // Status region (status updates)
        this.liveRegions.status = this._createLiveRegion('a11y-live-status', 'polite');
    }

    /**
     * Create a single live region element
     * @private
     */
    _createLiveRegion(id, politeness) {
        const region = document.createElement('div');
        region.id = id;
        region.setAttribute('role', 'status');
        region.setAttribute('aria-live', politeness);
        region.setAttribute('aria-atomic', 'true');
        region.className = 'sr-only';
        region.style.position = 'absolute';
        region.style.left = '-10000px';
        region.style.width = '1px';
        region.style.height = '1px';
        region.style.overflow = 'hidden';

        document.body.appendChild(region);
        return region;
    }

    /**
     * Create skip links for keyboard navigation
     * @private
     */
    _createSkipLinks() {
        const skipLinksContainer = document.createElement('div');
        skipLinksContainer.className = 'a11y-skip-links';
        skipLinksContainer.setAttribute('role', 'navigation');
        skipLinksContainer.setAttribute('aria-label', 'Skip navigation links');

        const skipLinks = [
            { href: '#main-content', text: 'Skip to main content' },
            { href: '#heatmap-canvas', text: 'Skip to heatmap' },
            { href: '#filters', text: 'Skip to filters' },
            { href: '#analytics', text: 'Skip to analytics' }
        ];

        skipLinks.forEach(link => {
            const a = document.createElement('a');
            a.href = link.href;
            a.textContent = link.text;
            a.className = 'skip-link';
            a.style.cssText = `
                position: absolute;
                left: -10000px;
                top: 0;
                z-index: 99999;
                padding: 8px 16px;
                background: #000;
                color: #fff;
                text-decoration: none;
                font-size: 14px;
                font-family: Arial, sans-serif;
            `;
            a.onfocus = function() { this.style.left = '0'; };
            a.onblur = function() { this.style.left = '-10000px'; };

            skipLinksContainer.appendChild(a);
        });

        document.body.insertBefore(skipLinksContainer, document.body.firstChild);
    }

    /**
     * Initialize keyboard navigation
     * @private
     */
    _initializeKeyboardNavigation() {
        document.addEventListener('keydown', (event) => {
            // Track keyboard navigation
            if (event.key === 'Tab' || event.key.startsWith('Arrow')) {
                this.state.keyboardNavigationActive = true;
                setTimeout(() => {
                    this.state.keyboardNavigationActive = false;
                }, 100);
            }

            // Handle keyboard shortcuts
            this._handleKeyboardShortcut(event);
        });

        // Track focus
        document.addEventListener('focusin', (event) => {
            this.state.focusedElement = event.target;
            this.focusHistory.push(event.target);

            // Limit history size
            if (this.focusHistory.length > 50) {
                this.focusHistory.shift();
            }
        }, true);
    }

    /**
     * Detect system accessibility preferences
     * @private
     */
    _detectSystemPreferences() {
        // Check for reduced motion preference
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
            this.enableReducedMotion();
        }

        // Check for high contrast preference
        if (window.matchMedia('(prefers-contrast: high)').matches) {
            this.enableHighContrastMode();
        }

        // Listen for changes
        window.matchMedia('(prefers-reduced-motion: reduce)')
            .addEventListener('change', (e) => {
                if (e.matches) {
                    this.enableReducedMotion();
                } else {
                    this.disableReducedMotion();
                }
            });

        window.matchMedia('(prefers-contrast: high)')
            .addEventListener('change', (e) => {
                if (e.matches) {
                    this.enableHighContrastMode();
                } else {
                    this.disableHighContrastMode();
                }
            });
    }

    /**
     * Detect if screen reader is active
     * @private
     */
    _detectScreenReader() {
        // Basic detection - not foolproof but helpful
        if (window.speechSynthesis) {
            const utterance = new SpeechSynthesisUtterance('');
            window.speechSynthesis.speak(utterance);
            window.speechSynthesis.cancel();
            return true;
        }
        return false;
    }

    /**
     * Register default keyboard shortcuts
     * @private
     */
    _registerDefaultShortcuts() {
        this.registerShortcut({
            key: '?',
            description: 'Show keyboard shortcuts help',
            action: () => this.showKeyboardShortcutsHelp(),
            category: 'help'
        });

        this.registerShortcut({
            key: 'Escape',
            description: 'Close modal or dialog',
            action: () => this.handleEscape(),
            category: 'navigation'
        });

        this.registerShortcut({
            key: 'h',
            description: 'Toggle high contrast mode',
            action: () => this.toggleHighContrastMode(),
            category: 'display'
        });

        this.registerShortcut({
            key: 's',
            description: 'Toggle reduced motion',
            action: () => this.toggleReducedMotion(),
            category: 'display'
        });

        this.registerShortcut({
            key: 'f',
            description: 'Focus on heatmap',
            action: () => this.focusOnHeatmap(),
            category: 'navigation'
        });

        this.registerShortcut({
            key: 'ArrowLeft',
            description: 'Navigate left in data',
            action: (event) => this.handleArrowNavigation('left', event),
            category: 'navigation'
        });

        this.registerShortcut({
            key: 'ArrowRight',
            description: 'Navigate right in data',
            action: (event) => this.handleArrowNavigation('right', event),
            category: 'navigation'
        });

        this.registerShortcut({
            key: 'ArrowUp',
            description: 'Navigate up in data',
            action: (event) => this.handleArrowNavigation('up', event),
            category: 'navigation'
        });

        this.registerShortcut({
            key: 'ArrowDown',
            description: 'Navigate down in data',
            action: (event) => this.handleArrowNavigation('down', event),
            category: 'navigation'
        });
    }

    /**
     * Handle keyboard shortcuts
     * @private
     */
    _handleKeyboardShortcut(event) {
        const key = event.key;

        // Check for registered shortcuts
        for (const [shortcutKey, shortcut] of this.keyboardShortcuts) {
            if (shortcutKey === key || shortcutKey === event.code) {
                // Don't trigger if in input field
                if (event.target.tagName === 'INPUT' ||
                    event.target.tagName === 'TEXTAREA' ||
                    event.target.contentEditable === 'true') {
                    continue;
                }

                event.preventDefault();
                shortcut.action(event);
                return;
            }
        }
    }

    /**
     * Register a keyboard shortcut
     * @param {Object} shortcut - Shortcut configuration
     */
    registerShortcut(shortcut) {
        this.keyboardShortcuts.set(shortcut.key, shortcut);
        console.log(`[AccessibilityManager] Registered shortcut: ${shortcut.key} - ${shortcut.description}`);
    }

    /**
     * Unregister a keyboard shortcut
     * @param {string} key - Shortcut key
     */
    unregisterShortcut(key) {
        this.keyboardShortcuts.delete(key);
    }

    /**
     * Handle escape key
     */
    handleEscape() {
        // Close any open modals
        if (this.focusTrapStack.length > 0) {
            const topTrap = this.focusTrapStack[this.focusTrapStack.length - 1];
            topTrap.deactivate();
            return;
        }

        // Close keyboard shortcuts help if open
        const helpDialog = document.getElementById('a11y-shortcuts-help');
        if (helpDialog) {
            this.closeKeyboardShortcutsHelp();
            return;
        }
    }

    /**
     * Handle arrow key navigation
     * @param {string} direction - Direction ('left', 'right', 'up', 'down')
     * @param {KeyboardEvent} event - Keyboard event
     */
    handleArrowNavigation(direction, event) {
        // Find current focusable element and navigate
        const currentElement = this.state.focusedElement;

        if (!currentElement) return;

        // Check if current element is in a heatmap view
        const heatmapView = currentElement.closest('[data-heatmap-view]');
        if (heatmapView) {
            event.preventDefault();
            this.keyboardController.navigateHeatmap(direction, heatmapView);
        }
    }

    /**
     * Show keyboard shortcuts help dialog
     */
    showKeyboardShortcutsHelp() {
        // Check if already open
        if (document.getElementById('a11y-shortcuts-help')) {
            return;
        }

        const dialog = document.createElement('div');
        dialog.id = 'a11y-shortcuts-help';
        dialog.setAttribute('role', 'dialog');
        dialog.setAttribute('aria-labelledby', 'a11y-shortcuts-title');
        dialog.setAttribute('aria-modal', 'true');
        dialog.style.cssText = `
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #1a1a2e;
            color: #fff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
            z-index: 99999;
            max-width: 600px;
            max-height: 80vh;
            overflow-y: auto;
        `;

        dialog.innerHTML = `
            <h2 id="a11y-shortcuts-title" style="margin: 0 0 16px 0; font-size: 20px;">
                Keyboard Shortcuts
            </h2>
            <div id="a11y-shortcuts-content"></div>
            <button id="a11y-shortcuts-close" style="margin-top: 16px; padding: 8px 16px;">
                Close (Escape)
            </button>
        `;

        // Group shortcuts by category
        const categories = new Map();
        for (const [key, shortcut] of this.keyboardShortcuts) {
            if (!categories.has(shortcut.category)) {
                categories.set(shortcut.category, []);
            }
            categories.get(shortcut.category).push({ key, ...shortcut });
        }

        // Build content
        const content = dialog.querySelector('#a11y-shortcuts-content');
        for (const [category, shortcuts] of categories) {
            const categoryTitle = document.createElement('h3');
            categoryTitle.textContent = category.charAt(0).toUpperCase() + category.slice(1);
            categoryTitle.style.cssText = 'margin: 16px 0 8px 0; font-size: 14px; text-transform: uppercase;';
            content.appendChild(categoryTitle);

            const list = document.createElement('dl');
            list.style.cssText = 'margin: 0; padding: 0;';

            shortcuts.forEach(shortcut => {
                const dt = document.createElement('dt');
                dt.style.cssText = 'margin: 4px 0; font-weight: bold;';
                dt.innerHTML = `<kbd style="background: #333; padding: 2px 6px; border-radius: 3px;">${this._formatShortcutKey(shortcut.key)}</kbd>`;
                list.appendChild(dt);

                const dd = document.createElement('dd');
                dd.style.cssText = 'margin: 0 0 8px 16px; font-size: 14px;';
                dd.textContent = shortcut.description;
                list.appendChild(dd);
            });

            content.appendChild(list);
        }

        document.body.appendChild(dialog);

        // Set up focus trap
        this.focusTrapManager.trap(dialog);

        // Focus close button
        const closeBtn = dialog.querySelector('#a11y-shortcuts-close');
        closeBtn.focus();

        // Set up close handlers
        closeBtn.addEventListener('click', () => this.closeKeyboardShortcutsHelp());

        // Announce to screen readers
        this.screenReaderAnnouncer.announce('Keyboard shortcuts help dialog opened', 'polite');
    }

    /**
     * Format shortcut key for display
     * @private
     */
    _formatShortcutKey(key) {
        if (key === 'Escape') return 'Esc';
        if (key.startsWith('Arrow')) return key.replace('Arrow', '');
        return key;
    }

    /**
     * Close keyboard shortcuts help dialog
     */
    closeKeyboardShortcutsHelp() {
        const dialog = document.getElementById('a11y-shortcuts-help');
        if (dialog) {
            // Remove focus trap
            this.focusTrapManager.untrap(dialog);

            dialog.remove();
            this.screenReaderAnnouncer.announce('Keyboard shortcuts help dialog closed', 'polite');
        }
    }

    /**
     * Enable high contrast mode
     */
    enableHighContrastMode() {
        this.state.highContrastMode = true;
        document.body.classList.add('a11y-high-contrast');

        // Apply high contrast styles
        const style = document.getElementById('a11y-high-contrast-styles') ||
            this._createHighContrastStyles();

        this.screenReaderAnnouncer.announce('High contrast mode enabled', 'polite');

        // Dispatch event for components to update
        this._dispatchEvent('a11y:highcontrastchange', { enabled: true });
    }

    /**
     * Disable high contrast mode
     */
    disableHighContrastMode() {
        this.state.highContrastMode = false;
        document.body.classList.remove('a11y-high-contrast');

        this.screenReaderAnnouncer.announce('High contrast mode disabled', 'polite');

        // Dispatch event for components to update
        this._dispatchEvent('a11y:highcontrastchange', { enabled: false });
    }

    /**
     * Toggle high contrast mode
     */
    toggleHighContrastMode() {
        if (this.state.highContrastMode) {
            this.disableHighContrastMode();
        } else {
            this.enableHighContrastMode();
        }
    }

    /**
     * Create high contrast styles
     * @private
     */
    _createHighContrastStyles() {
        const style = document.createElement('style');
        style.id = 'a11y-high-contrast-styles';
        style.textContent = `
            body.a11y-high-contrast {
                --background: #000000;
                --foreground: #ffffff;
                --primary: #ffff00;
                --secondary: #00ffff;
                --border: #ffffff;
            }

            body.a11y-high-contrast * {
                background-color: #000000 !important;
                color: #ffffff !important;
                border-color: #ffffff !important;
            }

            body.a11y-high-contrast [role="button"],
            body.a11y-high-contrast button,
            body.a11y-high-contrast a {
                outline: 2px solid #ffffff;
                outline-offset: 2px;
            }

            body.a11y-high-contrast [role="button"]:focus,
            body.a11y-high-contrast button:focus,
            body.a11y-high-contrast a:focus {
                outline: 3px solid #ffff00;
                outline-offset: 2px;
            }

            body.a11y-high-contrast canvas {
                filter: contrast(1.5) saturate(0);
            }
        `;

        document.head.appendChild(style);
        return style;
    }

    /**
     * Enable reduced motion
     */
    enableReducedMotion() {
        this.state.reducedMotion = true;
        document.documentElement.style.setProperty('--animation-duration', '0.01ms');
        document.body.classList.add('a11y-reduced-motion');

        this.screenReaderAnnouncer.announce('Reduced motion enabled', 'polite');

        this._dispatchEvent('a11y:reducedmotionchange', { enabled: true });
    }

    /**
     * Disable reduced motion
     */
    disableReducedMotion() {
        this.state.reducedMotion = false;
        document.documentElement.style.removeProperty('--animation-duration');
        document.body.classList.remove('a11y-reduced-motion');

        this.screenReaderAnnouncer.announce('Reduced motion disabled', 'polite');

        this._dispatchEvent('a11y:reducedmotionchange', { enabled: false });
    }

    /**
     * Toggle reduced motion
     */
    toggleReducedMotion() {
        if (this.state.reducedMotion) {
            this.disableReducedMotion();
        } else {
            this.enableReducedMotion();
        }
    }

    /**
     * Focus on heatmap element
     */
    focusOnHeatmap() {
        const heatmap = document.querySelector('[data-heatmap-view]') ||
                       document.querySelector('canvas') ||
                       document.querySelector('#main-content');

        if (heatmap) {
            heatmap.setAttribute('tabindex', '-1');
            heatmap.focus();
            this.screenReaderAnnouncer.announce('Focused on heatmap view', 'polite');
        }
    }

    /**
     * Announce message to screen readers
     * @param {string} message - Message to announce
     * @param {string} priority - 'polite' or 'assertive'
     */
    announce(message, priority = 'polite') {
        if (this.screenReaderAnnouncer) {
            this.screenReaderAnnouncer.announce(message, priority);
        }
    }

    /**
     * Register a component for accessibility updates
     * @param {string} id - Component ID
     * @param {Object} component - Component instance
     */
    registerComponent(id, component) {
        this.componentRegistry.set(id, component);
        console.log(`[AccessibilityManager] Registered component: ${id}`);
    }

    /**
     * Unregister a component
     * @param {string} id - Component ID
     */
    unregisterComponent(id) {
        this.componentRegistry.delete(id);
    }

    /**
     * Update ARIA attributes for a component
     * @param {string} componentId - Component ID
     * @param {Object} attributes - ARIA attributes to update
     */
    updateARIA(componentId, attributes) {
        const component = this.componentRegistry.get(componentId);
        if (component && component.container) {
            const element = component.container;
            for (const [key, value] of Object.entries(attributes)) {
                element.setAttribute(`aria-${key}`, value);
            }
        }
    }

    /**
     * Set focus on an element
     * @param {HTMLElement} element - Element to focus
     */
    setFocus(element) {
        if (element && typeof element.focus === 'function') {
            element.focus();
        }
    }

    /**
     * Restore focus to previous element
     */
    restoreFocus() {
        if (this.focusHistory.length > 1) {
            this.focusHistory.pop(); // Remove current
            const previous = this.focusHistory.pop();
            if (previous && typeof previous.focus === 'function') {
                previous.focus();
            }
        }
    }

    /**
     * Create a focus trap for a modal
     * @param {HTMLElement} element - Element to trap focus in
     * @returns {Object} Focus trap controller
     */
    trapFocus(element) {
        return this.focusTrapManager.trap(element);
    }

    /**
     * Remove focus trap
     * @param {HTMLElement} element - Element to untrap
     */
    untrapFocus(element) {
        this.focusTrapManager.untrap(element);
    }

    /**
     * Dispatch accessibility event
     * @private
     */
    _dispatchEvent(name, detail) {
        const event = new CustomEvent(name, { detail });
        document.dispatchEvent(event);
    }

    /**
     * Destroy the accessibility manager
     */
    destroy() {
        // Remove event listeners
        for (const [event, handler] of this.eventHandlers) {
            document.removeEventListener(event, handler);
        }

        // Remove live regions
        Object.values(this.liveRegions).forEach(region => {
            if (region && region.parentNode) {
                region.parentNode.removeChild(region);
            }
        });

        // Remove skip links
        const skipLinks = document.querySelector('.a11y-skip-links');
        if (skipLinks) {
            skipLinks.remove();
        }

        // Clear registries
        this.keyboardShortcuts.clear();
        this.componentRegistry.clear();

        console.log('[AccessibilityManager] Destroyed');
    }
}

/**
 * Screen Reader Announcer
 *
 * Manages ARIA live regions for screen reader announcements
 */
class ScreenReaderAnnouncer {
    constructor(options = {}) {
        this.politeRegion = options.politeRegion;
        this.assertiveRegion = options.assertiveRegion;
        this.announcementQueue = [];
        this.isAnnouncing = false;
    }

    /**
     * Announce a message to screen readers
     * @param {string} message - Message to announce
     * @param {string} priority - 'polite' or 'assertive'
     */
    announce(message, priority = 'polite') {
        // Queue announcement
        this.announcementQueue.push({ message, priority });

        // Process queue if not already announcing
        if (!this.isAnnouncing) {
            this._processQueue();
        }
    }

    /**
     * Process the announcement queue
     * @private
     */
    _processQueue() {
        if (this.announcementQueue.length === 0) {
            this.isAnnouncing = false;
            return;
        }

        this.isAnnouncing = true;
        const { message, priority } = this.announcementQueue.shift();

        const region = priority === 'assertive' ? this.assertiveRegion : this.politeRegion;

        if (region) {
            // Clear and announce
            region.textContent = '';

            // Use setTimeout to ensure screen reader picks up the change
            setTimeout(() => {
                region.textContent = message;

                // Clear after announcement
                setTimeout(() => {
                    region.textContent = '';
                    this._processQueue();
                }, 1000);
            }, 100);
        } else {
            this._processQueue();
        }
    }
}

/**
 * Keyboard Navigation Controller
 *
 * Manages keyboard navigation for complex UI components
 */
class KeyboardNavigationController {
    constructor(options = {}) {
        this.manager = options.manager;
        this.rootElement = options.rootElement || document.body;
        this.currentFocus = null;
        this.navigationMap = new Map();
        this.directionHandlers = new Map();
    }

    /**
     * Navigate heatmap with arrow keys
     * @param {string} direction - Direction to navigate
     * @param {HTMLElement} container - Heatmap container
     */
    navigateHeatmap(direction, container) {
        // Find all focusable cells in the heatmap
        const cells = container.querySelectorAll('[data-heatmap-cell], [role="gridcell"]');

        if (cells.length === 0) {
            // Announce no cells available
            this.manager.announce('No cells available to navigate', 'polite');
            return;
        }

        const currentIndex = this.currentFocus ?
            Array.from(cells).indexOf(this.currentFocus) : -1;

        let nextIndex;

        // Get grid dimensions from container
        const cols = parseInt(container.dataset.gridCols || cells.length);
        const rows = Math.ceil(cells.length / cols);

        switch (direction) {
            case 'right':
                nextIndex = currentIndex < cells.length - 1 ? currentIndex + 1 : 0;
                break;
            case 'left':
                nextIndex = currentIndex > 0 ? currentIndex - 1 : cells.length - 1;
                break;
            case 'down':
                nextIndex = currentIndex + cols < cells.length ? currentIndex + cols :
                    currentIndex % cols;
                break;
            case 'up':
                nextIndex = currentIndex - cols >= 0 ? currentIndex - cols :
                    cells.length - cols + (currentIndex % cols);
                break;
        }

        if (nextIndex >= 0 && nextIndex < cells.length) {
            const nextCell = cells[nextIndex];
            nextCell.focus();
            this.currentFocus = nextCell;

            // Announce cell info
            const label = nextCell.getAttribute('aria-label') ||
                         nextCell.textContent ||
                         `Cell ${nextIndex + 1}`;
            this.manager.announce(label, 'polite');
        }
    }

    /**
     * Register a navigation handler for a direction
     * @param {string} direction - Direction ('up', 'down', 'left', 'right')
     * @param {Function} handler - Handler function
     */
    registerDirectionHandler(direction, handler) {
        this.directionHandlers.set(direction, handler);
    }

    /**
     * Create a roving tabindex pattern for a list
     * @param {NodeList|Array} items - List of focusable items
     * @param {Object} options - Options
     */
    createRovingTabindex(items, options = {}) {
        const { initialIndex = 0, orientation = 'horizontal' } = options;

        // Set up roving tabindex
        items.forEach((item, index) => {
            item.setAttribute('tabindex', index === initialIndex ? '0' : '-1');

            item.addEventListener('keydown', (event) => {
                let targetIndex = null;

                if (orientation === 'horizontal') {
                    if (event.key === 'ArrowRight') {
                        targetIndex = index < items.length - 1 ? index + 1 : 0;
                    } else if (event.key === 'ArrowLeft') {
                        targetIndex = index > 0 ? index - 1 : items.length - 1;
                    }
                } else {
                    if (event.key === 'ArrowDown') {
                        targetIndex = index < items.length - 1 ? index + 1 : 0;
                    } else if (event.key === 'ArrowUp') {
                        targetIndex = index > 0 ? index - 1 : items.length - 1;
                    }
                }

                if (targetIndex !== null) {
                    event.preventDefault();
                    items[targetIndex].focus();
                }
            });

            item.addEventListener('focus', () => {
                items.forEach(i => i.setAttribute('tabindex', '-1'));
                item.setAttribute('tabindex', '0');
            });
        });
    }
}

/**
 * Focus Trap Manager
 *
 * Manages focus traps for modals and dialogs
 */
class FocusTrapManager {
    constructor(options = {}) {
        this.manager = options.manager;
        this.activeTraps = new Map();
    }

    /**
     * Create a focus trap for an element
     * @param {HTMLElement} element - Element to trap focus in
     * @returns {Object} Focus trap controller
     */
    trap(element) {
        // Find all focusable elements
        const focusableElements = this._getFocusableElements(element);

        if (focusableElements.length === 0) {
            console.warn('[FocusTrapManager] No focusable elements found');
            return null;
        }

        const firstElement = focusableElements[0];
        const lastElement = focusableElements[focusableElements.length - 1];

        // Store previous focus
        const previousFocus = document.activeElement;

        // Focus first element
        firstElement.focus();

        // Create trap handler
        const trapHandler = (event) => {
            if (event.key !== 'Tab') return;

            if (event.shiftKey) {
                // Shift + Tab
                if (document.activeElement === firstElement) {
                    event.preventDefault();
                    lastElement.focus();
                }
            } else {
                // Tab
                if (document.activeElement === lastElement) {
                    event.preventDefault();
                    firstElement.focus();
                }
            }
        };

        // Add listener
        element.addEventListener('keydown', trapHandler);

        // Store trap info
        const trap = {
            element,
            focusableElements,
            firstElement,
            lastElement,
            previousFocus,
            handler: trapHandler,
            deactivate: () => this.untrap(element)
        };

        this.activeTraps.set(element, trap);

        // Add to manager stack
        this.manager.focusTrapStack.push(trap);

        return trap;
    }

    /**
     * Remove focus trap from an element
     * @param {HTMLElement} element - Element to untrap
     */
    untrap(element) {
        const trap = this.activeTraps.get(element);
        if (!trap) return;

        // Remove event listener
        element.removeEventListener('keydown', trap.handler);

        // Restore previous focus
        if (trap.previousFocus && typeof trap.previousFocus.focus === 'function') {
            trap.previousFocus.focus();
        }

        // Remove from manager stack
        const stackIndex = this.manager.focusTrapStack.indexOf(trap);
        if (stackIndex > -1) {
            this.manager.focusTrapStack.splice(stackIndex, 1);
        }

        // Remove from registry
        this.activeTraps.delete(element);
    }

    /**
     * Get all focusable elements within an element
     * @private
     */
    _getFocusableElements(element) {
        const selector = [
            'a[href]',
            'button:not([disabled])',
            'textarea:not([disabled])',
            'input:not([disabled])',
            'select:not([disabled])',
            '[tabindex]:not([tabindex="-1"])',
            '[contenteditable="true"]'
        ].join(', ');

        return Array.from(element.querySelectorAll(selector))
            .filter(el => this._isElementVisible(el));
    }

    /**
     * Check if element is visible
     * @private
     */
    _isElementVisible(element) {
        return !!(element.offsetWidth ||
                 element.offsetHeight ||
                 element.getClientRects().length);
    }
}

/**
 * ARIA Utilities
 *
 * Helper functions for managing ARIA attributes
 */
class ARIAUtils {
    /**
     * Set ARIA attribute on an element
     * @param {HTMLElement} element - Target element
     * @param {string} attribute - ARIA attribute name (without 'aria-' prefix)
     * @param {string} value - Attribute value
     */
    static set(element, attribute, value) {
        if (element) {
            element.setAttribute(`aria-${attribute}`, value);
        }
    }

    /**
     * Remove ARIA attribute from an element
     * @param {HTMLElement} element - Target element
     * @param {string} attribute - ARIA attribute name (without 'aria-' prefix)
     */
    static remove(element, attribute) {
        if (element) {
            element.removeAttribute(`aria-${attribute}`);
        }
    }

    /**
     * Set ARIA label
     * @param {HTMLElement} element - Target element
     * @param {string} label - Label text
     */
    static label(element, label) {
        ARIAUtils.set(element, 'label', label);
    }

    /**
     * Set ARIA describedby
     * @param {HTMLElement} element - Target element
     * @param {string} id - ID of describing element
     */
    static describedBy(element, id) {
        ARIAUtils.set(element, 'describedby', id);
    }

    /**
     * Set ARIA labelledby
     * @param {HTMLElement} element - Target element
     * @param {string} id - ID of labelling element
     */
    static labelledBy(element, id) {
        ARIAUtils.set(element, 'labelledby', id);
    }

    /**
     * Set ARIA expanded state
     * @param {HTMLElement} element - Target element
     * @param {boolean} expanded - Expanded state
     */
    static expanded(element, expanded) {
        ARIAUtils.set(element, 'expanded', String(expanded));
    }

    /**
     * Set ARIA checked state
     * @param {HTMLElement} element - Target element
     * @param {boolean} checked - Checked state
     */
    static checked(element, checked) {
        ARIAUtils.set(element, 'checked', String(checked));
    }

    /**
     * Set ARIA disabled state
     * @param {HTMLElement} element - Target element
     * @param {boolean} disabled - Disabled state
     */
    static disabled(element, disabled) {
        ARIAUtils.set(element, 'disabled', String(disabled));
    }

    /**
     * Set ARIA hidden state
     * @param {HTMLElement} element - Target element
     * @param {boolean} hidden - Hidden state
     */
    static hidden(element, hidden) {
        ARIAUtils.set(element, 'hidden', String(hidden));
    }

    /**
     * Set ARIA live region
     * @param {HTMLElement} element - Target element
     * @param {string} politeness - 'polite' or 'assertive'
     */
    static live(element, politeness = 'polite') {
        ARIAUtils.set(element, 'live', politeness);
    }

    /**
     * Set ARIA role
     * @param {HTMLElement} element - Target element
     * @param {string} role - ARIA role
     */
    static role(element, role) {
        if (element) {
            element.setAttribute('role', role);
        }
    }

    /**
     * Make an element accessible as a button
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asButton(element, options = {}) {
        ARIAUtils.role(element, 'button');
        ARIAUtils.label(element, options.label || '');
        element.setAttribute('tabindex', options.tabindex || '0');

        if (options.disabled) {
            ARIAUtils.disabled(element, true);
            element.setAttribute('tabindex', '-1');
        }
    }

    /**
     * Make an element accessible as a checkbox
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asCheckbox(element, options = {}) {
        ARIAUtils.role(element, 'checkbox');
        ARIAUtils.label(element, options.label || '');
        ARIAUtils.checked(element, options.checked || false);
        element.setAttribute('tabindex', options.tabindex || '0');
    }

    /**
     * Make an element accessible as a dialog
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asDialog(element, options = {}) {
        ARIAUtils.role(element, 'dialog');
        ARIAUtils.labelledBy(element, options.titleId);
        ARIAUtils.describedBy(element, options.descriptionId);
        ARIAUtils.set(element, 'modal', 'true');
    }

    /**
     * Make an element accessible as a grid
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asGrid(element, options = {}) {
        ARIAUtils.role(element, 'grid');
        ARIAUtils.label(element, options.label || 'Data grid');
        ARIAUtils.set(element, 'rowcount', options.rowCount || 0);
        ARIAUtils.set(element, 'colcount', options.colCount || 0);
    }

    /**
     * Make an element accessible as a gridcell
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asGridCell(element, options = {}) {
        ARIAUtils.role(element, 'gridcell');
        ARIAUtils.set(element, 'colindex', options.colIndex);
        ARIAUtils.set(element, 'rowindex', options.rowIndex);
        if (options.label) {
            ARIAUtils.label(element, options.label);
        }
        if (options.selected !== undefined) {
            ARIAUtils.set(element, 'selected', String(options.selected));
        }
    }

    /**
     * Make an element accessible as a listbox
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asListbox(element, options = {}) {
        ARIAUtils.role(element, 'listbox');
        ARIAUtils.label(element, options.label || 'List');
        ARIAUtils.set(element, 'orientation', options.orientation || 'vertical');
    }

    /**
     * Make an element accessible as an option
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asOption(element, options = {}) {
        ARIAUtils.role(element, 'option');
        ARIAUtils.set(element, 'selected', String(options.selected || false));
        if (options.label) {
            ARIAUtils.label(element, options.label);
        }
    }

    /**
     * Make an element accessible as a tab
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asTab(element, options = {}) {
        ARIAUtils.role(element, 'tab');
        ARIAUtils.set(element, 'selected', String(options.selected || false));
        ARIAUtils.set(element, 'controls', options.controls);
        if (options.label) {
            ARIAUtils.label(element, options.label);
        }
    }

    /**
     * Make an element accessible as a tablist
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asTabList(element, options = {}) {
        ARIAUtils.role(element, 'tablist');
        ARIAUtils.label(element, options.label || 'Tabs');
    }

    /**
     * Make an element accessible as a tabpanel
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asTabPanel(element, options = {}) {
        ARIAUtils.role(element, 'tabpanel');
        ARIAUtils.set(element, 'labelledby', options.labelledBy);
    }

    /**
     * Make an element accessible as a slider
     * @param {HTMLElement} element - Target element
     * @param {Object} options - Options
     */
    static asSlider(element, options = {}) {
        ARIAUtils.role(element, 'slider');
        ARIAUtils.set(element, 'valuemin', options.min || 0);
        ARIAUtils.set(element, 'valuemax', options.max || 100);
        ARIAUtils.set(element, 'valuenow', options.value || 0);
        if (options.label) {
            ARIAUtils.label(element, options.label);
        }
    }

    /**
     * Update slider value
     * @param {HTMLElement} element - Target element
     * @param {number} value - New value
     */
    static updateSlider(element, value) {
        ARIAUtils.set(element, 'valuenow', value);
    }
}

/**
 * Accessibility mixin for heatmap components
 *
 * Provides accessibility features to existing components
 */
const AccessibilityMixin = {
    /**
     * Initialize accessibility for a component
     * @param {Object} component - Component instance
     * @param {Object} options - Accessibility options
     */
    initAccessibility(component, options = {}) {
        component._a11y = {
            id: options.id || component.constructor.name,
            label: options.label || component.constructor.name,
            description: options.description || '',
            role: options.role || 'region'
        };

        // Apply ARIA attributes to container
        if (component.container) {
            ARIAUtils.role(component.container, component._a11y.role);
            ARIAUtils.label(component.container, component._a11y.label);

            if (component._a11y.description) {
                const descId = `${component._a11y.id}-desc`;
                const desc = document.createElement('span');
                desc.id = descId;
                desc.textContent = component._a11y.description;
                desc.className = 'sr-only';
                desc.style.cssText = 'position: absolute; left: -10000px; width: 1px; height: 1px; overflow: hidden;';
                component.container.element?.appendChild(desc) ||
                    component.container.appendChild?.(desc);
                ARIAUtils.describedBy(component.container, descId);
            }
        }

        // Register with accessibility manager
        if (window.accessibilityManager) {
            window.accessibilityManager.registerComponent(component._a11y.id, component);
        }
    },

    /**
     * Make a button accessible
     * @param {PIXI.DisplayObject|HTMLElement} element - Button element
     * @param {Object} options - Button options
     */
    accessibleButton(element, options = {}) {
        if (element.element) {
            // PIXI.DisplayObject with HTML element
            ARIAUtils.asButton(element.element, options);
        } else {
            // Direct HTML element
            ARIAUtils.asButton(element, options);
        }
    },

    /**
     * Announce state change
     * @param {Object} component - Component instance
     * @param {string} message - Message to announce
     * @param {string} priority - 'polite' or 'assertive'
     */
    announce(component, message, priority = 'polite') {
        if (window.accessibilityManager) {
            window.accessibilityManager.announce(message, priority);
        }
    }
};

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.AccessibilityManager = AccessibilityManager;
    window.ScreenReaderAnnouncer = ScreenReaderAnnouncer;
    window.KeyboardNavigationController = KeyboardNavigationController;
    window.FocusTrapManager = FocusTrapManager;
    window.ARIAUtils = ARIAUtils;
    window.AccessibilityMixin = AccessibilityMixin;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        AccessibilityManager,
        ScreenReaderAnnouncer,
        KeyboardNavigationController,
        FocusTrapManager,
        ARIAUtils,
        AccessibilityMixin
    };
}
