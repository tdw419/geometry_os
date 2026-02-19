// systems/visual_shell/web/js/AgentController.js
/**
 * AgentController - Control action bar for Glass Box.
 * Provides: Relocate, Evict, Debug, Command actions.
 *
 * Part of the Glass Box Introspection Interface
 * Task 3: Create AgentController with 4 actions
 */
class AgentController {
    constructor(config = {}) {
        this.config = {
            ...config
        };

        this.agentId = null;
        this.onRelocate = null;
        this.onEvict = null;
        this.onDebug = null;
        this.onCommand = null;

        this.element = this._createElement();
    }

    /**
     * Create the controller DOM element.
     * @private
     */
    _createElement() {
        const el = document.createElement('div');
        el.className = 'agent-controller';
        el.innerHTML = `
            <div class="control-bar">
                <button class="btn-relocate" title="Relocate Agent"> Relocate</button>
                <button class="btn-evict" title="Evict Agent"> Evict</button>
                <button class="btn-debug" title="Debug Dump"> Debug</button>
                <button class="btn-command" title="Send Command"> Command</button>
            </div>
            <div class="command-panel" style="display:none;">
                <input type="text" class="command-input" placeholder="Enter command...">
                <button class="btn-send">Send</button>
                <button class="btn-cancel">Cancel</button>
            </div>
        `;

        // Wire up handlers
        el.querySelector('.btn-relocate').addEventListener('click', () => this._handleRelocate());
        el.querySelector('.btn-evict').addEventListener('click', () => this._handleEvict());
        el.querySelector('.btn-debug').addEventListener('click', () => this._handleDebug());
        el.querySelector('.btn-command').addEventListener('click', () => this._toggleCommandPanel());

        el.querySelector('.btn-send').addEventListener('click', () => this._handleCommand());
        el.querySelector('.btn-cancel').addEventListener('click', () => this._hideCommandPanel());

        // Allow Enter key to send command
        const input = el.querySelector('.command-input');
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                this._handleCommand();
            } else if (e.key === 'Escape') {
                this._hideCommandPanel();
            }
        });

        return el;
    }

    /**
     * Set the current agent being controlled.
     * @param {string} agentId - The agent ID
     */
    setAgent(agentId) {
        this.agentId = agentId;
    }

    /**
     * Handle Relocate button click.
     * Prompts for target district and fires onRelocate callback.
     * @private
     */
    _handleRelocate() {
        const district = prompt('Enter target district (cognitive/metabolic/substrate):');
        if (district && this.onRelocate) {
            this.onRelocate(this.agentId, district);
        }
    }

    /**
     * Handle Evict button click.
     * Shows confirmation dialog and fires onEvict callback.
     * @private
     */
    _handleEvict() {
        const confirmed = confirm(`Evict agent ${this.agentId}? This cannot be undone.`);
        if (confirmed && this.onEvict) {
            this.onEvict(this.agentId);
        }
    }

    /**
     * Handle Debug button click.
     * Fires onDebug callback to dump agent state.
     * @private
     */
    _handleDebug() {
        if (this.onDebug) {
            this.onDebug(this.agentId);
        }
    }

    /**
     * Toggle command panel visibility.
     * @private
     */
    _toggleCommandPanel() {
        const panel = this.element.querySelector('.command-panel');
        panel.style.display = panel.style.display === 'none' ? 'flex' : 'none';
        if (panel.style.display === 'flex') {
            this.element.querySelector('.command-input').focus();
        }
    }

    /**
     * Hide command panel.
     * @private
     */
    _hideCommandPanel() {
        const panel = this.element.querySelector('.command-panel');
        panel.style.display = 'none';
        this.element.querySelector('.command-input').value = '';
    }

    /**
     * Handle command submission.
     * @private
     */
    _handleCommand() {
        const input = this.element.querySelector('.command-input');
        const command = input.value.trim();
        if (command && this.onCommand) {
            this.onCommand(this.agentId, command);
            this._hideCommandPanel();
        }
    }

    /**
     * Destroy the controller and clean up event listeners.
     */
    destroy() {
        if (this.element && this.element.parentNode) {
            this.element.parentNode.removeChild(this.element);
        }
        this.agentId = null;
        this.onRelocate = null;
        this.onEvict = null;
        this.onDebug = null;
        this.onCommand = null;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.AgentController = AgentController;
}

// Export for Node.js
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentController;
}
