/**
 * GlassBoxOverlay - Street-level agent introspection panel.
 * Slides in from right when clicking on a Neural City building.
 *
 * Features:
 * - Slides in/out from right side
 * - Click outside to close
 * - Displays agent introspection data via AgentDataPanel
 * - Control actions via AgentController
 * - Configurable width
 */
class GlassBoxOverlay {
    constructor(config = {}) {
        this.config = {
            width: config.width || 400,
            ...config
        };

        this.visible = false;
        this.currentAgent = null;
        this.onClose = null;

        // Create overlay element
        this.element = this._createElement();
        document.body.appendChild(this.element);

        // Initialize sub-components
        this.dataPanel = null;
        this.controller = null;
        this._initComponents();

        // Bind outside click handler
        this._boundOutsideClick = this._handleOutsideClick.bind(this);
    }

    /**
     * Create the overlay DOM element with styling
     * @private
     */
    _createElement() {
        const el = document.createElement('div');
        el.className = 'glass-box-overlay';
        el.style.cssText = `
            position: fixed;
            top: 0;
            right: -${this.config.width}px;
            width: ${this.config.width}px;
            height: 100vh;
            background: rgba(0, 20, 40, 0.95);
            border-left: 2px solid #0ff;
            transition: right 0.3s ease;
            z-index: 1000;
            overflow-y: auto;
            padding: 20px;
            box-sizing: border-box;
        `;
        return el;
    }

    /**
     * Initialize AgentDataPanel and AgentController components.
     * @private
     */
    _initComponents() {
        // Create data panel
        if (typeof AgentDataPanel !== 'undefined') {
            this.dataPanel = new AgentDataPanel();
        }

        // Create controller
        if (typeof AgentController !== 'undefined') {
            this.controller = new AgentController();
        }
    }

    /**
     * Open the overlay with agent data
     * @param {Object} agentData - Agent information to display
     * @param {string} agentData.agentId - Unique agent identifier
     */
    open(agentData) {
        this.currentAgent = agentData;
        this.visible = true;
        this.element.style.right = '0px';

        // Add outside click listener (delayed to prevent immediate close)
        setTimeout(() => {
            document.addEventListener('click', this._boundOutsideClick);
        }, 100);

        this._render();
    }

    /**
     * Close the overlay
     */
    close() {
        this.visible = false;
        this.currentAgent = null;
        this.element.style.right = `-${this.config.width}px`;

        document.removeEventListener('click', this._boundOutsideClick);

        if (this.onClose) {
            this.onClose();
        }
    }

    /**
     * Check if overlay is currently visible
     * @returns {boolean}
     */
    isVisible() {
        return this.visible;
    }

    /**
     * Handle clicks outside the overlay
     * @private
     * @param {MouseEvent} event
     */
    _handleOutsideClick(event) {
        if (!this.element.contains(event.target)) {
            this.close();
        }
    }

    /**
     * Render the overlay content with agent data and controls
     * @private
     */
    _render() {
        const agentId = this.currentAgent?.agentId || 'Unknown';
        const role = this.currentAgent?.role || 'Unknown';
        const district = this.currentAgent?.district || 'Unknown';

        this.element.innerHTML = `
            <div class="glass-box-header">
                <h2>🔍 Glass Box</h2>
                <div class="agent-info">
                    <span class="agent-id">${this._escapeHtml(agentId)}</span>
                    <span class="agent-meta">${this._escapeHtml(role)} · ${this._escapeHtml(district)}</span>
                </div>
                <button class="close-btn" aria-label="Close overlay">×</button>
            </div>
            <div class="glass-box-content"></div>
            <div class="glass-box-controls"></div>
        `;

        // Attach close button handler
        const closeBtn = this.element.querySelector('.close-btn');
        if (closeBtn) {
            closeBtn.addEventListener('click', () => this.close());
        }

        // Add data panel
        const contentContainer = this.element.querySelector('.glass-box-content');
        if (this.dataPanel) {
            contentContainer.appendChild(this.dataPanel.element);
            // Update panel with agent data
            this.dataPanel.setAllData(this.currentAgent);
        } else {
            contentContainer.innerHTML = '<p class="error">AgentDataPanel not available</p>';
        }

        // Add controller
        const controlsContainer = this.element.querySelector('.glass-box-controls');
        if (this.controller) {
            controlsContainer.appendChild(this.controller.element);
        }
    }

    /**
     * Escape HTML to prevent XSS
     * @private
     * @param {string} text - Text to escape
     * @returns {string} Escaped HTML
     */
    _escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    /**
     * Destroy the overlay and clean up
     */
    destroy() {
        document.removeEventListener('click', this._boundOutsideClick);
        if (this.dataPanel) {
            this.dataPanel.element.remove();
        }
        if (this.controller) {
            this.controller.destroy();
        }
        if (this.element && this.element.parentNode) {
            this.element.parentNode.removeChild(this.element);
        }
    }
}

// Export for different environments
if (typeof window !== 'undefined') {
    window.GlassBoxOverlay = GlassBoxOverlay;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = GlassBoxOverlay;
}
