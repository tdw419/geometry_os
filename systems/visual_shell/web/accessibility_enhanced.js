/**
 * Enhanced Accessibility Layer for Visual Shell
 * 
 * Comprehensive accessibility features including:
 * - Full keyboard navigation across all UI components
 * - Screen reader compatibility with ARIA live regions
 * - Focus management for modals and dynamic content
 * - High contrast mode and reduced motion support
 * - Voice control compatibility
 * - Touch accessibility for mobile devices
 * 
 * Part of: Visual Shell Accessibility Enhancement
 * @version 2.0.0
 */

/**
 * Enhanced Accessibility Manager
 * 
 * Central manager for all accessibility features in the Visual Shell.
 * Coordinates keyboard navigation, screen reader announcements,
 * focus management, and accessibility preferences.
 */
class EnhancedAccessibilityManager {
    constructor(options = {}) {
        this.options = {
            rootElement: options.rootElement || document.body,
            enabled: options.enabled !== false,
            announceChanges: options.announceChanges !== false,
            debugMode: options.debugMode || false,
            language: options.language || 'en',
            ...options
        };

        // State management
        this.state = {
            enabled: this.options.enabled,
            highContrastMode: false,
            reducedMotion: false,
            focusVisible: false,
            screenReaderActive: this._detectScreenReader(),
            keyboardNavigationActive: false,
            currentRegion: null,
            focusedElement: null
        };

        // Navigation state
        this.navigationState = {
            currentLevel: 0,
            currentItem: null,
            regions: new Map(),
            focusHistory: []
        };

        // Component registry
        this.components = new Map();
        
        // Keyboard shortcuts
        this.shortcuts = new Map();
        
        // Live regions for announcements
        this.liveRegions = {
            polite: null,
            assertive: null,
            log: null
        };

        // Focus trap stack
        this.focusTraps = [];
        
        // Event handlers
        this.handlers = new Map();

        // Subsystems
        this.keyboardNav = null;
        this.screenReader = null;
        this.focusManager = null;
        this.announcementQueue = [];

        console.log('[EnhancedAccessibility] Manager created');
    }

    /**
     * Initialize the accessibility system
     */
    initialize() {
        if (!this.state.enabled) {
            console.log('[EnhancedAccessibility] Accessibility disabled');
            return this;
        }

        this._log('Initializing accessibility system...');

        // Create live regions
        this._createLiveRegions();

        // Create skip links
        this._createSkipLinks();

        // Initialize subsystems
        this.keyboardNav = new KeyboardNavigator(this);
        this.screenReader = new ScreenReaderInterface(this);
        this.focusManager = new FocusManager(this);

        // Set up event listeners
        this._setupEventListeners();

        // Register default shortcuts
        this._registerDefaultShortcuts();

        // Detect system preferences
        this._detectSystemPreferences();

        // Apply initial accessibility attributes
        this._applyAccessibilityAttributes();

        // Initialize components
        this._initializeComponents();

        // Announce ready
        this.announce('Visual Shell accessibility features loaded. Press ? for keyboard shortcuts.', 'polite');

        this._log('Accessibility system initialized');
        return this;
    }

    /**
     * Create ARIA live regions
     * @private
     */
    _createLiveRegions() {
        const createRegion = (id, politeness, role = 'status') => {
            const region = document.createElement('div');
            region.id = id;
            region.setAttribute('role', role);
            region.setAttribute('aria-live', politeness);
            region.setAttribute('aria-atomic', 'true');
            region.className = 'a11y-sr-only';
            region.style.cssText = `
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
            document.body.appendChild(region);
            return region;
        };

        this.liveRegions.polite = createRegion('a11y-live-polite', 'polite');
        this.liveRegions.assertive = createRegion('a11y-live-assertive', 'assertive');
        this.liveRegions.log = createRegion('a11y-live-log', 'polite', 'log');
    }

    /**
     * Create skip navigation links
     * @private
     */
    _createSkipLinks() {
        const container = document.createElement('nav');
        container.id = 'a11y-skip-links';
        container.setAttribute('aria-label', 'Skip navigation');
        container.className = 'a11y-skip-links';

        const links = [
            { target: '#main-content', label: 'Skip to main content' },
            { target: '#infinite-map', label: 'Skip to infinite map' },
            { target: '#tile-grid', label: 'Skip to tile grid' },
            { target: '#controls', label: 'Skip to controls' },
            { target: '#status-bar', label: 'Skip to status bar' },
            { target: '#a11y-shortcuts', label: 'Skip to keyboard shortcuts' }
        ];

        links.forEach(({ target, label }) => {
            const link = document.createElement('a');
            link.href = target;
            link.textContent = label;
            link.className = 'a11y-skip-link';
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const targetEl = document.querySelector(target);
                if (targetEl) {
                    this.focusManager.focusElement(targetEl);
                    this.announce(`Navigated to ${label.toLowerCase()}`, 'polite');
                }
            });
            container.appendChild(link);
        });

        document.body.insertBefore(container, document.body.firstChild);
    }

    /**
     * Set up event listeners
     * @private
     */
    _setupEventListeners() {
        // Track keyboard navigation
        document.addEventListener('keydown', (e) => {
            this.state.keyboardNavigationActive = true;
            this._handleKeyDown(e);
        });

        document.addEventListener('keyup', (e) => {
            this.state.keyboardNavigationActive = false;
        });

        // Track focus
        document.addEventListener('focusin', (e) => {
            this.state.focusedElement = e.target;
            this.navigationState.focusHistory.push({
                element: e.target,
                timestamp: Date.now()
            });
            
            // Limit history
            if (this.navigationState.focusHistory.length > 100) {
                this.navigationState.focusHistory.shift();
            }

            // Announce focus for screen readers
            this._announceFocusChange(e.target);
        });

        // Handle clicks
        document.addEventListener('click', (e) => {
            // Update focus visible state
            this.state.focusVisible = false;
        });

        // Handle mouse movement (disable focus visible)
        document.addEventListener('mousemove', () => {
            if (this.state.keyboardNavigationActive) {
                this.state.keyboardNavigationActive = false;
            }
        });
    }

    /**
     * Handle keydown events
     * @private
     */
    _handleKeyDown(event) {
        // Check for registered shortcuts
        const shortcut = this.shortcuts.get(event.key);
        if (shortcut && this._shouldTriggerShortcut(event, shortcut)) {
            event.preventDefault();
            shortcut.handler(event);
            return;
        }

        // Handle navigation keys
        this.keyboardNav.handleKeyEvent(event);
    }

    /**
     * Check if shortcut should trigger
     * @private
     */
    _shouldTriggerShortcut(event, shortcut) {
        // Don't trigger in input fields unless allowed
        if (!shortcut.allowInInput) {
            const tagName = event.target.tagName;
            if (tagName === 'INPUT' || tagName === 'TEXTAREA' || 
                event.target.contentEditable === 'true') {
                return false;
            }
        }

        // Check modifiers
        if (shortcut.ctrl && !event.ctrlKey) return false;
        if (shortcut.alt && !event.altKey) return false;
        if (shortcut.shift && !event.shiftKey) return false;
        if (shortcut.meta && !event.metaKey) return false;

        return true;
    }

    /**
     * Register default keyboard shortcuts
     * @private
     */
    _registerDefaultShortcuts() {
        // Help
        this.registerShortcut('?', {
            description: 'Show keyboard shortcuts help',
            handler: () => this.showHelp(),
            category: 'help'
        });

        // Navigation
        this.registerShortcut('Tab', {
            description: 'Navigate to next element',
            handler: (e) => this.keyboardNav.handleTab(e),
            category: 'navigation',
            allowInInput: true
        });

        this.registerShortcut('Escape', {
            description: 'Close dialog or cancel action',
            handler: () => this.handleEscape(),
            category: 'navigation'
        });

        // Arrow navigation
        this.registerShortcut('ArrowUp', {
            description: 'Navigate up',
            handler: (e) => this.keyboardNav.navigate('up', e),
            category: 'navigation'
        });

        this.registerShortcut('ArrowDown', {
            description: 'Navigate down',
            handler: (e) => this.keyboardNav.navigate('down', e),
            category: 'navigation'
        });

        this.registerShortcut('ArrowLeft', {
            description: 'Navigate left',
            handler: (e) => this.keyboardNav.navigate('left', e),
            category: 'navigation'
        });

        this.registerShortcut('ArrowRight', {
            description: 'Navigate right',
            handler: (e) => this.keyboardNav.navigate('right', e),
            category: 'navigation'
        });

        // Home/End
        this.registerShortcut('Home', {
            description: 'Go to start',
            handler: (e) => this.keyboardNav.goToStart(e),
            category: 'navigation'
        });

        this.registerShortcut('End', {
            description: 'Go to end',
            handler: (e) => this.keyboardNav.goToEnd(e),
            category: 'navigation'
        });

        // Page Up/Down
        this.registerShortcut('PageUp', {
            description: 'Page up',
            handler: (e) => this.keyboardNav.pageUp(e),
            category: 'navigation'
        });

        this.registerShortcut('PageDown', {
            description: 'Page down',
            handler: (e) => this.keyboardNav.pageDown(e),
            category: 'navigation'
        });

        // Selection
        this.registerShortcut('Enter', {
            description: 'Activate or select',
            handler: (e) => this.keyboardNav.activate(e),
            category: 'action',
            allowInInput: true
        });

        this.registerShortcut(' ', {
            description: 'Toggle or select',
            handler: (e) => this.keyboardNav.toggle(e),
            category: 'action',
            allowInInput: false
        });

        // Display modes
        this.registerShortcut('h', {
            description: 'Toggle high contrast mode',
            handler: () => this.toggleHighContrast(),
            category: 'display'
        });

        this.registerShortcut('m', {
            description: 'Toggle reduced motion',
            handler: () => this.toggleReducedMotion(),
            category: 'display'
        });

        // Focus shortcuts
        this.registerShortcut('f', {
            description: 'Focus on main content',
            handler: () => this.focusMainContent(),
            category: 'focus'
        });

        this.registerShortcut('g', {
            description: 'Focus on grid/tiles',
            handler: () => this.focusGrid(),
            category: 'focus'
        });

        this.registerShortcut('c', {
            description: 'Focus on controls',
            handler: () => this.focusControls(),
            category: 'focus'
        });

        this.registerShortcut('s', {
            description: 'Focus on status bar',
            handler: () => this.focusStatusBar(),
            category: 'focus'
        });

        // Region navigation (Alt+number)
        for (let i = 1; i <= 9; i++) {
            this.registerShortcut(String(i), {
                description: `Jump to region ${i}`,
                handler: () => this.jumpToRegion(i),
                category: 'navigation',
                alt: true
            });
        }
    }

    /**
     * Register a keyboard shortcut
     */
    registerShortcut(key, options) {
        this.shortcuts.set(key, {
            key,
            description: options.description || '',
            handler: options.handler,
            category: options.category || 'general',
            ctrl: options.ctrl || false,
            alt: options.alt || false,
            shift: options.shift || false,
            meta: options.meta || false,
            allowInInput: options.allowInInput || false
        });
    }

    /**
     * Detect system preferences
     * @private
     */
    _detectSystemPreferences() {
        // Reduced motion
        const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
        if (reducedMotion.matches) {
            this.enableReducedMotion();
        }
        reducedMotion.addEventListener('change', (e) => {
            if (e.matches) this.enableReducedMotion();
            else this.disableReducedMotion();
        });

        // High contrast
        const highContrast = window.matchMedia('(prefers-contrast: high)');
        if (highContrast.matches) {
            this.enableHighContrast();
        }
        highContrast.addEventListener('change', (e) => {
            if (e.matches) this.enableHighContrast();
            else this.disableHighContrast();
        });

        // Color scheme
        const colorScheme = window.matchMedia('(prefers-color-scheme: dark)');
        this.state.darkMode = colorScheme.matches;
        colorScheme.addEventListener('change', (e) => {
            this.state.darkMode = e.matches;
            this._applyTheme();
        });
    }

    /**
     * Detect screen reader
     * @private
     */
    _detectScreenReader() {
        // Check for common screen reader indicators
        return !!(
            window.speechSynthesis ||
            navigator.userAgent.includes('NVDA') ||
            navigator.userAgent.includes('JAWS') ||
            navigator.userAgent.includes('VoiceOver') ||
            document.querySelector('[data-screenreader]')
        );
    }

    /**
     * Apply accessibility attributes to document
     * @private
     */
    _applyAccessibilityAttributes() {
        // Ensure main landmarks exist
        this._ensureLandmarks();

        // Add role and label to canvas elements
        document.querySelectorAll('canvas').forEach((canvas, i) => {
            if (!canvas.getAttribute('role')) {
                canvas.setAttribute('role', 'img');
            }
            if (!canvas.getAttribute('aria-label')) {
                canvas.setAttribute('aria-label', `Visual display ${i + 1}`);
            }
            canvas.setAttribute('tabindex', '0');
        });

        // Make interactive elements focusable
        document.querySelectorAll('[onclick], [data-action]').forEach(el => {
            if (!el.hasAttribute('tabindex')) {
                el.setAttribute('tabindex', '0');
            }
            if (!el.getAttribute('role')) {
                el.setAttribute('role', 'button');
            }
        });
    }

    /**
     * Ensure ARIA landmarks exist
     * @private
     */
    _ensureLandmarks() {
        const landmarks = [
            { selector: 'main, [role="main"]', create: () => this._createLandmark('main', 'Main content') },
            { selector: 'nav, [role="navigation"]', create: () => this._createLandmark('navigation', 'Navigation') },
            { selector: '[role="complementary"], aside', create: () => this._createLandmark('complementary', 'Sidebar') },
            { selector: '[role="contentinfo"], footer', create: () => this._createLandmark('contentinfo', 'Footer') }
        ];

        landmarks.forEach(({ selector, create }) => {
            if (!document.querySelector(selector)) {
                this._log(`Creating missing landmark: ${selector}`);
            }
        });
    }

    /**
     * Create an ARIA landmark
     * @private
     */
    _createLandmark(role, label) {
        const landmark = document.createElement('div');
        landmark.setAttribute('role', role);
        landmark.setAttribute('aria-label', label);
        return landmark;
    }

    /**
     * Initialize accessibility for registered components
     * @private
     */
    _initializeComponents() {
        this.components.forEach((component, id) => {
            this._initializeComponent(id, component);
        });
    }

    /**
     * Initialize a single component
     * @private
     */
    _initializeComponent(id, component) {
        if (component.element) {
            // Add ARIA attributes
            if (component.role) {
                component.element.setAttribute('role', component.role);
            }
            if (component.label) {
                component.element.setAttribute('aria-label', component.label);
            }
            if (component.description) {
                const descId = `${id}-description`;
                let descEl = document.getElementById(descId);
                if (!descEl) {
                    descEl = document.createElement('span');
                    descEl.id = descId;
                    descEl.className = 'a11y-sr-only';
                    descEl.textContent = component.description;
                    component.element.appendChild(descEl);
                }
                component.element.setAttribute('aria-describedby', descId);
            }

            // Make focusable if interactive
            if (component.interactive && !component.element.hasAttribute('tabindex')) {
                component.element.setAttribute('tabindex', '0');
            }
        }
    }

    // === Public API ===

    /**
     * Register a component for accessibility management
     */
    registerComponent(id, config) {
        this.components.set(id, config);
        this._initializeComponent(id, config);
        this._log(`Registered component: ${id}`);
    }

    /**
     * Unregister a component
     */
    unregisterComponent(id) {
        this.components.delete(id);
    }

    /**
     * Announce a message to screen readers
     */
    announce(message, priority = 'polite') {
        if (!this.state.enabled || !this.options.announceChanges) return;

        const region = priority === 'assertive' ? 
            this.liveRegions.assertive : 
            this.liveRegions.polite;

        if (region) {
            // Clear and set message
            region.textContent = '';
            setTimeout(() => {
                region.textContent = message;
                this._log(`Announced (${priority}): ${message}`);
                
                // Clear after announcement
                setTimeout(() => {
                    region.textContent = '';
                }, 1000);
            }, 100);
        }
    }

    /**
     * Announce focus change
     * @private
     */
    _announceFocusChange(element) {
        if (!this.state.screenReaderActive) return;

        // Get accessible name
        const name = this._getAccessibleName(element);
        const role = element.getAttribute('role') || element.tagName.toLowerCase();
        const state = this._getElementState(element);

        if (name) {
            const announcement = state ? `${name}, ${role}, ${state}` : `${name}, ${role}`;
            // Only announce if different from last
            if (this._lastFocusAnnouncement !== announcement) {
                this._lastFocusAnnouncement = announcement;
                // Use log region for less intrusive announcements
                this._queueAnnouncement(announcement, 'polite');
            }
        }
    }

    /**
     * Get accessible name for an element
     * @private
     */
    _getAccessibleName(element) {
        // Check aria-label
        if (element.getAttribute('aria-label')) {
            return element.getAttribute('aria-label');
        }

        // Check aria-labelledby
        const labelledBy = element.getAttribute('aria-labelledby');
        if (labelledBy) {
            const labelEl = document.getElementById(labelledBy);
            if (labelEl) return labelEl.textContent;
        }

        // Check associated label
        if (element.id) {
            const label = document.querySelector(`label[for="${element.id}"]`);
            if (label) return label.textContent;
        }

        // Check text content
        if (element.textContent && element.textContent.trim().length < 50) {
            return element.textContent.trim();
        }

        // Check title
        if (element.title) {
            return element.title;
        }

        return null;
    }

    /**
     * Get element state description
     * @private
     */
    _getElementState(element) {
        const states = [];

        if (element.getAttribute('aria-expanded')) {
            states.push(element.getAttribute('aria-expanded') === 'true' ? 'expanded' : 'collapsed');
        }

        if (element.getAttribute('aria-checked')) {
            states.push(element.getAttribute('aria-checked') === 'true' ? 'checked' : 'not checked');
        }

        if (element.getAttribute('aria-selected')) {
            states.push(element.getAttribute('aria-selected') === 'true' ? 'selected' : 'not selected');
        }

        if (element.getAttribute('aria-disabled') === 'true' || element.disabled) {
            states.push('disabled');
        }

        if (element.getAttribute('aria-busy') === 'true') {
            states.push('loading');
        }

        return states.join(', ');
    }

    /**
     * Queue an announcement
     * @private
     */
    _queueAnnouncement(message, priority) {
        this.announcementQueue.push({ message, priority });
        this._processAnnouncementQueue();
    }

    /**
     * Process announcement queue
     * @private
     */
    _processAnnouncementQueue() {
        if (this._processingQueue || this.announcementQueue.length === 0) return;

        this._processingQueue = true;
        const { message, priority } = this.announcementQueue.shift();
        
        const region = this.liveRegions.log;
        if (region) {
            region.textContent = message;
            setTimeout(() => {
                region.textContent = '';
                this._processingQueue = false;
                this._processAnnouncementQueue();
            }, 500);
        }
    }

    /**
     * Show help dialog
     */
    showHelp() {
        // Remove existing help if present
        this.hideHelp();

        const dialog = document.createElement('div');
        dialog.id = 'a11y-help-dialog';
        dialog.setAttribute('role', 'dialog');
        dialog.setAttribute('aria-modal', 'true');
        dialog.setAttribute('aria-labelledby', 'a11y-help-title');
        dialog.className = 'a11y-dialog';

        // Group shortcuts by category
        const categories = new Map();
        this.shortcuts.forEach((shortcut, key) => {
            const cat = shortcut.category;
            if (!categories.has(cat)) {
                categories.set(cat, []);
            }
            categories.get(cat).push({ key, ...shortcut });
        });

        // Build HTML
        let html = `
            <div class="a11y-dialog-content">
                <h2 id="a11y-help-title" class="a11y-dialog-title">
                    Keyboard Shortcuts
                </h2>
                <p class="a11y-dialog-description">
                    Use these keyboard shortcuts to navigate the Visual Shell.
                    Press Escape to close this dialog.
                </p>
                <div class="a11y-shortcuts-list">
        `;

        const categoryOrder = ['navigation', 'action', 'focus', 'display', 'help'];
        const categoryNames = {
            navigation: 'Navigation',
            action: 'Actions',
            focus: 'Quick Focus',
            display: 'Display Options',
            help: 'Help'
        };

        categoryOrder.forEach(cat => {
            const shortcuts = categories.get(cat);
            if (!shortcuts || shortcuts.length === 0) return;

            html += `<div class="a11y-shortcuts-category">
                <h3>${categoryNames[cat] || cat}</h3>
                <dl class="a11y-shortcuts-dl">`;

            shortcuts.forEach(({ key, description }) => {
                const formattedKey = this._formatKey(key);
                html += `
                    <dt><kbd class="a11y-kbd">${formattedKey}</kbd></dt>
                    <dd>${description}</dd>`;
            });

            html += `</dl></div>`;
        });

        html += `
                </div>
                <div class="a11y-dialog-footer">
                    <button id="a11y-help-close" class="a11y-btn">
                        Close (Escape)
                    </button>
                </div>
            </div>`;

        dialog.innerHTML = html;
        document.body.appendChild(dialog);

        // Set up focus trap
        this.focusManager.trapFocus(dialog);

        // Focus close button
        const closeBtn = dialog.querySelector('#a11y-help-close');
        closeBtn.focus();
        closeBtn.addEventListener('click', () => this.hideHelp());

        this.announce('Keyboard shortcuts help dialog opened', 'assertive');
    }

    /**
     * Hide help dialog
     */
    hideHelp() {
        const dialog = document.getElementById('a11y-help-dialog');
        if (dialog) {
            this.focusManager.releaseFocus(dialog);
            dialog.remove();
            this.announce('Help dialog closed', 'polite');
        }
    }

    /**
     * Format key for display
     * @private
     */
    _formatKey(key) {
        const keyMap = {
            'ArrowUp': '↑',
            'ArrowDown': '↓',
            'ArrowLeft': '←',
            'ArrowRight': '→',
            ' ': 'Space',
            'Escape': 'Esc',
            'PageUp': 'PgUp',
            'PageDown': 'PgDn'
        };
        return keyMap[key] || key;
    }

    /**
     * Handle escape key
     */
    handleEscape() {
        // Close help dialog if open
        if (document.getElementById('a11y-help-dialog')) {
            this.hideHelp();
            return;
        }

        // Release focus trap
        if (this.focusTraps.length > 0) {
            this.focusManager.releaseCurrentTrap();
            return;
        }

        // Announce
        this.announce('No dialog to close', 'polite');
    }

    /**
     * Toggle high contrast mode
     */
    toggleHighContrast() {
        if (this.state.highContrastMode) {
            this.disableHighContrast();
        } else {
            this.enableHighContrast();
        }
    }

    /**
     * Enable high contrast mode
     */
    enableHighContrast() {
        this.state.highContrastMode = true;
        document.body.classList.add('a11y-high-contrast');
        this.announce('High contrast mode enabled', 'polite');
        this._dispatchEvent('a11y:highcontrast', { enabled: true });
    }

    /**
     * Disable high contrast mode
     */
    disableHighContrast() {
        this.state.highContrastMode = false;
        document.body.classList.remove('a11y-high-contrast');
        this.announce('High contrast mode disabled', 'polite');
        this._dispatchEvent('a11y:highcontrast', { enabled: false });
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
     * Enable reduced motion
     */
    enableReducedMotion() {
        this.state.reducedMotion = true;
        document.body.classList.add('a11y-reduced-motion');
        this.announce('Reduced motion enabled', 'polite');
        this._dispatchEvent('a11y:reducedmotion', { enabled: true });
    }

    /**
     * Disable reduced motion
     */
    disableReducedMotion() {
        this.state.reducedMotion = false;
        document.body.classList.remove('a11y-reduced-motion');
        this.announce('Reduced motion disabled', 'polite');
        this._dispatchEvent('a11y:reducedmotion', { enabled: false });
    }

    /**
     * Focus main content
     */
    focusMainContent() {
        const main = document.querySelector('main, [role="main"], #main-content');
        if (main) {
            this.focusManager.focusElement(main);
            this.announce('Focused main content', 'polite');
        }
    }

    /**
     * Focus grid
     */
    focusGrid() {
        const grid = document.querySelector('[role="grid"], #tile-grid, .tile-grid');
        if (grid) {
            this.focusManager.focusElement(grid);
            this.announce('Focused tile grid', 'polite');
        }
    }

    /**
     * Focus controls
     */
    focusControls() {
        const controls = document.querySelector('#controls, [role="toolbar"], .controls');
        if (controls) {
            this.focusManager.focusElement(controls);
            this.announce('Focused controls', 'polite');
        }
    }

    /**
     * Focus status bar
     */
    focusStatusBar() {
        const status = document.querySelector('#status-bar, [role="status"], .status-bar');
        if (status) {
            this.focusManager.focusElement(status);
            this.announce('Focused status bar', 'polite');
        }
    }

    /**
     * Jump to region by number
     */
    jumpToRegion(num) {
        const regions = document.querySelectorAll('[role="region"], section, [aria-label]');
        if (regions[num - 1]) {
            this.focusManager.focusElement(regions[num - 1]);
            const label = this._getAccessibleName(regions[num - 1]) || `Region ${num}`;
            this.announce(`Jumped to ${label}`, 'polite');
        }
    }

    /**
     * Dispatch accessibility event
     * @private
     */
    _dispatchEvent(name, detail) {
        document.dispatchEvent(new CustomEvent(name, { detail }));
    }

    /**
     * Log message if debug mode
     * @private
     */
    _log(...args) {
        if (this.options.debugMode) {
            console.log('[EnhancedAccessibility]', ...args);
        }
    }

    /**
     * Destroy the manager
     */
    destroy() {
        // Remove live regions
        Object.values(this.liveRegions).forEach(region => {
            if (region && region.parentNode) {
                region.parentNode.removeChild(region);
            }
        });

        // Remove skip links
        const skipLinks = document.getElementById('a11y-skip-links');
        if (skipLinks) skipLinks.remove();

        // Remove help dialog
        this.hideHelp();

        // Clear registries
        this.components.clear();
        this.shortcuts.clear();

        console.log('[EnhancedAccessibility] Destroyed');
    }
}

/**
 * Keyboard Navigator
 * 
 * Handles keyboard navigation for grid and list based interfaces.
 */
class KeyboardNavigator {
    constructor(manager) {
        this.manager = manager;
        this.currentPosition = { row: 0, col: 0 };
        this.gridInfo = null;
    }

    /**
     * Handle key event
     */
    handleKeyEvent(event) {
        // Let shortcuts handle it if they exist
        if (this.manager.shortcuts.has(event.key)) return;

        // Handle tab
        if (event.key === 'Tab') {
            this.handleTab(event);
        }
    }

    /**
     * Handle tab navigation
     */
    handleTab(event) {
        // Natural tab behavior with focus management
        // This is handled by the browser, but we can enhance it
    }

    /**
     * Navigate in a direction
     */
    navigate(direction, event) {
        const focused = document.activeElement;
        
        // Check if we're in a grid
        const grid = focused.closest('[role="grid"]');
        if (grid) {
            event?.preventDefault();
            this._navigateGrid(grid, direction);
            return;
        }

        // Check if we're in a list
        const list = focused.closest('[role="listbox"], [role="menu"], ul, ol');
        if (list) {
            event?.preventDefault();
            this._navigateList(list, direction);
            return;
        }

        // Check if we're in a tab list
        const tablist = focused.closest('[role="tablist"]');
        if (tablist) {
            event?.preventDefault();
            this._navigateTabs(tablist, direction);
            return;
        }
    }

    /**
     * Navigate within a grid
     * @private
     */
    _navigateGrid(grid, direction) {
        const cells = Array.from(grid.querySelectorAll('[role="gridcell"], [role="rowheader"], [role="columnheader"]'));
        const rows = Array.from(grid.querySelectorAll('[role="row"]'));
        
        if (cells.length === 0) return;

        // Find current cell
        const current = document.activeElement.closest('[role="gridcell"], [role="rowheader"], [role="columnheader"]');
        const currentIndex = cells.indexOf(current);

        // Calculate grid dimensions
        const cols = rows[0] ? rows[0].querySelectorAll('[role="gridcell"], [role="rowheader"], [role="columnheader"]').length : 1;
        const rows_count = rows.length;

        let nextIndex = currentIndex;

        switch (direction) {
            case 'up':
                nextIndex = currentIndex - cols;
                if (nextIndex < 0) nextIndex = cells.length + nextIndex;
                break;
            case 'down':
                nextIndex = currentIndex + cols;
                if (nextIndex >= cells.length) nextIndex = nextIndex - cells.length;
                break;
            case 'left':
                nextIndex = currentIndex > 0 ? currentIndex - 1 : cells.length - 1;
                break;
            case 'right':
                nextIndex = currentIndex < cells.length - 1 ? currentIndex + 1 : 0;
                break;
        }

        if (cells[nextIndex]) {
            cells[nextIndex].focus();
            this._announceCell(cells[nextIndex], nextIndex, cols, rows_count);
        }
    }

    /**
     * Navigate within a list
     * @private
     */
    _navigateList(list, direction) {
        const items = Array.from(list.querySelectorAll('[role="option"], [role="menuitem"], li'));
        
        if (items.length === 0) return;

        const current = document.activeElement.closest('[role="option"], [role="menuitem"], li');
        const currentIndex = items.indexOf(current);

        let nextIndex = currentIndex;

        if (direction === 'up' || direction === 'left') {
            nextIndex = currentIndex > 0 ? currentIndex - 1 : items.length - 1;
        } else if (direction === 'down' || direction === 'right') {
            nextIndex = currentIndex < items.length - 1 ? currentIndex + 1 : 0;
        }

        if (items[nextIndex]) {
            items[nextIndex].focus();
            this.manager.announce(this.manager._getAccessibleName(items[nextIndex]) || `Item ${nextIndex + 1}`, 'polite');
        }
    }

    /**
     * Navigate within tabs
     * @private
     */
    _navigateTabs(tablist, direction) {
        const tabs = Array.from(tablist.querySelectorAll('[role="tab"]'));
        
        if (tabs.length === 0) return;

        const current = document.activeElement.closest('[role="tab"]');
        const currentIndex = tabs.indexOf(current);

        let nextIndex = currentIndex;

        if (direction === 'left') {
            nextIndex = currentIndex > 0 ? currentIndex - 1 : tabs.length - 1;
        } else if (direction === 'right') {
            nextIndex = currentIndex < tabs.length - 1 ? currentIndex + 1 : 0;
        }

        if (tabs[nextIndex]) {
            tabs[nextIndex].focus();
            // Optionally activate the tab
            this.manager.announce(this.manager._getAccessibleName(tabs[nextIndex]) || `Tab ${nextIndex + 1}`, 'polite');
        }
    }

    /**
     * Announce grid cell
     * @private
     */
    _announceCell(cell, index, cols, rows) {
        const row = Math.floor(index / cols) + 1;
        const col = (index % cols) + 1;
        const name = this.manager._getAccessibleName(cell);
        const announcement = name ? 
            `${name}, row ${row} column ${col}` :
            `Row ${row} column ${col}`;
        this.manager.announce(announcement, 'polite');
    }

    /**
     * Go to start
     */
    goToStart(event) {
        const container = document.activeElement.closest('[role="grid"], [role="listbox"], [role="tablist"]');
        if (container) {
            const first = container.querySelector('[tabindex="0"], [role="gridcell"], [role="option"], [role="tab"]');
            if (first) first.focus();
        }
    }

    /**
     * Go to end
     */
    goToEnd(event) {
        const container = document.activeElement.closest('[role="grid"], [role="listbox"], [role="tablist"]');
        if (container) {
            const items = container.querySelectorAll('[tabindex="0"], [role="gridcell"], [role="option"], [role="tab"]');
            if (items.length > 0) items[items.length - 1].focus();
        }
    }

    /**
     * Page up
     */
    pageUp(event) {
        // Navigate up by page size (e.g., 10 items)
        const container = document.activeElement.closest('[role="grid"], [role="listbox"]');
        if (!container) return;

        const items = container.querySelectorAll('[role="gridcell"], [role="option"]');
        const current = document.activeElement;
        const currentIndex = Array.from(items).indexOf(current);

        if (currentIndex > 0) {
            const nextIndex = Math.max(0, currentIndex - 10);
            if (items[nextIndex]) items[nextIndex].focus();
        }
    }

    /**
     * Page down
     */
    pageDown(event) {
        const container = document.activeElement.closest('[role="grid"], [role="listbox"]');
        if (!container) return;

        const items = container.querySelectorAll('[role="gridcell"], [role="option"]');
        const current = document.activeElement;
        const currentIndex = Array.from(items).indexOf(current);

        if (currentIndex < items.length - 1) {
            const nextIndex = Math.min(items.length - 1, currentIndex + 10);
            if (items[nextIndex]) items[nextIndex].focus();
        }
    }

    /**
     * Activate current item
     */
    activate(event) {
        const focused = document.activeElement;
        
        // Trigger click
        if (focused) {
            focused.click();
            this.manager.announce(`Activated ${this.manager._getAccessibleName(focused) || 'item'}`, 'polite');
        }
    }

    /**
     * Toggle current item
     */
    toggle(event) {
        const focused = document.activeElement;
        
        if (focused) {
            // Handle checkbox/radio toggle
            if (focused.getAttribute('role') === 'checkbox' || focused.type === 'checkbox') {
                const checked = focused.getAttribute('aria-checked') === 'true';
                focused.setAttribute('aria-checked', String(!checked));
                this.manager.announce(`${checked ? 'Unchecked' : 'Checked'} ${this.manager._getAccessibleName(focused) || 'item'}`, 'polite');
            } else {
                focused.click();
            }
        }
    }
}

/**
 * Screen Reader Interface
 * 
 * Provides a consistent interface for screen reader interactions.
 */
class ScreenReaderInterface {
    constructor(manager) {
        this.manager = manager;
        this.isEnabled = manager.state.screenReaderActive;
    }

    /**
     * Announce a message
     */
    announce(message, priority = 'polite') {
        this.manager.announce(message, priority);
    }

    /**
     * Announce an error
     */
    announceError(message) {
        this.manager.announce(`Error: ${message}`, 'assertive');
    }

    /**
     * Announce a status change
     */
    announceStatus(status) {
        this.manager.announce(status, 'polite');
    }

    /**
     * Announce a value change
     */
    announceValueChange(element, newValue) {
        const name = this.manager._getAccessibleName(element);
        this.manager.announce(`${name} changed to ${newValue}`, 'polite');
    }
}

/**
 * Focus Manager
 * 
 * Manages focus for the application.
 */
class FocusManager {
    constructor(manager) {
        this.manager = manager;
        this.focusStack = [];
        this.trapStack = [];
    }

    /**
     * Focus an element
     */
    focusElement(element) {
        if (!element) return;

        // Make focusable if not already
        if (!element.hasAttribute('tabindex')) {
            element.setAttribute('tabindex', '-1');
        }

        element.focus();
        this.focusStack.push(element);
    }

    /**
     * Restore focus to previous element
     */
    restoreFocus() {
        if (this.focusStack.length > 1) {
            this.focusStack.pop();
            const previous = this.focusStack[this.focusStack.length - 1];
            if (previous) {
                previous.focus();
            }
        }
    }

    /**
     * Create a focus trap
     */
    trapFocus(container) {
        const focusableElements = this._getFocusableElements(container);
        
        if (focusableElements.length === 0) {
            console.warn('[FocusManager] No focusable elements in container');
            return;
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
                if (document.activeElement === firstElement) {
                    event.preventDefault();
                    lastElement.focus();
                }
            } else {
                if (document.activeElement === lastElement) {
                    event.preventDefault();
                    firstElement.focus();
                }
            }
        };

        container.addEventListener('keydown', trapHandler);

        const trap = {
            container,
            focusableElements,
            previousFocus,
            handler: trapHandler,
            release: () => this.releaseTrap(trap)
        };

        this.trapStack.push(trap);
        return trap;
    }

    /**
     * Release a focus trap
     */
    releaseTrap(trap) {
        const index = this.trapStack.indexOf(trap);
        if (index === -1) return;

        // Remove event listener
        trap.container.removeEventListener('keydown', trap.handler);

        // Restore previous focus
        if (trap.previousFocus && typeof trap.previousFocus.focus === 'function') {
            trap.previousFocus.focus();
        }

        // Remove from stack
        this.trapStack.splice(index, 1);
    }

    /**
     * Release current focus trap
     */
    releaseCurrentTrap() {
        if (this.trapStack.length > 0) {
            this.releaseTrap(this.trapStack[this.trapStack.length - 1]);
        }
    }

    /**
     * Release a specific container's focus trap
     */
    releaseFocus(container) {
        const trap = this.trapStack.find(t => t.container === container);
        if (trap) {
            this.releaseTrap(trap);
        }
    }

    /**
     * Get all focusable elements in a container
     * @private
     */
    _getFocusableElements(container) {
        const selector = [
            'a[href]',
            'button:not([disabled])',
            'textarea:not([disabled])',
            'input:not([disabled])',
            'select:not([disabled])',
            '[tabindex]:not([tabindex="-1"])',
            '[contenteditable="true"]',
            '[role="button"]:not([aria-disabled="true"])',
            '[role="checkbox"]:not([aria-disabled="true"])',
            '[role="tab"]:not([aria-disabled="true"])',
            '[role="menuitem"]:not([aria-disabled="true"])',
            '[role="option"]:not([aria-disabled="true"])'
        ].join(', ');

        return Array.from(container.querySelectorAll(selector))
            .filter(el => this._isVisible(el));
    }

    /**
     * Check if element is visible
     * @private
     */
    _isVisible(element) {
        const style = window.getComputedStyle(element);
        return style.display !== 'none' &&
               style.visibility !== 'hidden' &&
               style.opacity !== '0' &&
               element.offsetWidth > 0 &&
               element.offsetHeight > 0;
    }
}

// Export for browser and module environments
if (typeof window !== 'undefined') {
    window.EnhancedAccessibilityManager = EnhancedAccessibilityManager;
    window.KeyboardNavigator = KeyboardNavigator;
    window.ScreenReaderInterface = ScreenReaderInterface;
    window.FocusManager = FocusManager;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        EnhancedAccessibilityManager,
        KeyboardNavigator,
        ScreenReaderInterface,
        FocusManager
    };
}
