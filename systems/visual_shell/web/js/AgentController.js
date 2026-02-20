// systems/visual_shell/web/js/AgentController.js
/**
 * AgentController - Control action bar for Glass Box.
 * Provides: Relocate, Evict, Debug, Command, Clone actions.
 *
 * Part of the Glass Box Introspection Interface
 * Task 3: Create AgentController with 4 actions
 * Task 5: Add Clone button for substrate cloning
 */
class AgentController {
    constructor(config = {}) {
        this.config = {
            ...config
        };

        this.agentId = null;
        this.currentTile = null;  // Current tile data for clone feature
        this.onRelocate = null;
        this.onEvict = null;
        this.onDebug = null;
        this.onCommand = null;

        // Live tile controls
        this.onStart = null;
        this.onStop = null;
        this.onRestart = null;

        // Clone control
        this.onClone = null;

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
            <div class="live-controls" style="display:none;">
                <button class="btn-start" title="Start Tile">▶️ Start</button>
                <button class="btn-stop" title="Stop Tile">⏹️ Stop</button>
                <button class="btn-restart" title="Restart Tile">🔄 Restart</button>
            </div>
            <div class="clone-controls" style="display:none;">
                <button class="btn-clone" title="Clone UI to native PixelRTS" style="background: linear-gradient(135deg, #9b59b6, #8e44ad); color: white; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; font-size: 12px;">🧬 Clone</button>
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

        // Live control handlers
        this._setupLiveControls(el);

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
     * Setup live tile control handlers.
     * @private
     */
    _setupLiveControls(el) {
        const startBtn = el.querySelector('.btn-start');
        const stopBtn = el.querySelector('.btn-stop');
        const restartBtn = el.querySelector('.btn-restart');
        const cloneBtn = el.querySelector('.btn-clone');

        if (startBtn) {
            startBtn.addEventListener('click', () => {
                if (this.onStart && this.agentId) {
                    this.onStart(this.agentId);
                }
            });
        }

        if (stopBtn) {
            stopBtn.addEventListener('click', () => {
                if (this.onStop && this.agentId) {
                    this.onStop(this.agentId);
                }
            });
        }

        if (restartBtn) {
            restartBtn.addEventListener('click', () => {
                if (this.onRestart && this.agentId) {
                    this.onRestart(this.agentId);
                }
            });
        }

        if (cloneBtn) {
            cloneBtn.addEventListener('click', () => {
                if (this.currentTile && this.currentTile.has_extraction && this.onClone) {
                    this.onClone({
                        method: 'clone_tile',
                        params: {
                            tile_id: this.currentTile.tile_id,
                            target_name: `${this.currentTile.tile_id}_clone`
                        }
                    });
                }
            });
        }
    }

    /**
     * Show or hide live tile controls.
     * @param {boolean} show - Whether to show the controls
     */
    showLiveControls(show) {
        const controls = this.element.querySelector('.live-controls');
        if (controls) {
            controls.style.display = show ? 'flex' : 'none';
        }
    }

    /**
     * Set the current agent being controlled.
     * @param {string} agentId - The agent ID
     */
    setAgent(agentId) {
        this.agentId = agentId;
    }

    /**
     * Set the current tile data for clone feature.
     * @param {Object} tile - Tile data with tile_id and has_extraction
     */
    setCurrentTile(tile) {
        this.currentTile = tile;
        // Show clone controls only if tile has extraction
        this.showCloneControls(tile && tile.has_extraction);
    }

    /**
     * Show or hide clone tile controls.
     * @param {boolean} show - Whether to show the clone button
     */
    showCloneControls(show) {
        const controls = this.element.querySelector('.clone-controls');
        if (controls) {
            controls.style.display = show ? 'flex' : 'none';
        }
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
        this.currentTile = null;
        this.onRelocate = null;
        this.onEvict = null;
        this.onDebug = null;
        this.onCommand = null;
        this.onClone = null;
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
