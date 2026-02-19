/**
 * AgentDataPanel - Six-section data display for Glass Box introspection.
 *
 * Displays agent internal state across six sections:
 * - VCC Stability: PAS score with color-coded state indicator (stable/degraded/critical)
 * - Thought Stream: Scrolling log of agent decisions with timestamps and type coloring
 * - Intent Map: Current goal and planned trajectory with completion checkmarks
 * - Metabolic Pulse: IPC, memory, and activity metrics with progress bars
 * - Substrate View: RTS texture preview of the agent's code
 * - Communication Log: Inbound/outbound messages with direction arrows
 */
class AgentDataPanel {
    constructor() {
        this.data = {
            stability: { pas: 1.0, state: 'stable' },
            thoughts: [],
            intent: { goal: '', steps: [] },
            metabolism: { ipc: 0, memory: { used: 0, total: 0 }, activity: 0 },
            communications: []
        };

        this.element = this._createElement();
    }

    /**
     * Create the panel DOM element with 6 data sections.
     * @private
     */
    _createElement() {
        const el = document.createElement('div');
        el.className = 'agent-data-panel';
        el.innerHTML = `
            <div class="data-section" id="stability-section">
                <h3>🔒 VCC Stability</h3>
                <div class="stability-content"></div>
            </div>
            <div class="data-section" id="thought-stream">
                <h3>💭 Thought Stream <span class="live-indicator">Live</span></h3>
                <div class="thought-log"></div>
            </div>
            <div class="data-section" id="intent-map">
                <h3>🎯 Intent Map</h3>
                <div class="intent-content"></div>
            </div>
            <div class="data-section" id="metabolic-pulse">
                <h3>📊 Metabolic Pulse</h3>
                <div class="metabolism-content"></div>
            </div>
            <div class="data-section" id="substrate-view">
                <h3>🧩 Substrate View (Raw Code)</h3>
                <div class="substrate-content">
                    <img class="rts-preview" style="width:100%; border:1px solid #0ff; image-rendering:pixelated;" alt="RTS Preview">
                </div>
            </div>
            <div class="data-section" id="live-console-section" style="display:none;">
                <h3>🖥️ Live Console</h3>
                <div class="console-output"></div>
            </div>
            <div class="data-section" id="communication-log">
                <h3>📡 Communication Log</h3>
                <div class="comm-log"></div>
            </div>
        `;
        return el;
    }

    /**
     * Update the substrate view with RTS texture path.
     * @param {string} rtsPath - Path to the agent's .rts.png file
     */
    setSubstrate(rtsPath) {
        const img = this.element.querySelector('.rts-preview');
        if (rtsPath) {
            img.src = rtsPath;
            img.style.display = 'block';
        } else {
            img.style.display = 'none';
        }
    }

    /**
     * Update the VCC Stability display with PAS score and state.
     * @param {Object} stability - Stability object with pas (0-1) and state ('stable'|'degraded'|'critical')
     */
    setStability(stability) {
        this.data.stability = stability || { pas: 1.0, state: 'stable' };
        const content = this.element.querySelector('.stability-content');

        const stateColors = {
            'stable': '#00ff00',
            'degraded': '#ffff00',
            'critical': '#ff0000'
        };
        const stateLabels = {
            'stable': '✓ Stable',
            'degraded': '⚠ Degraded',
            'critical': '✕ CRITICAL'
        };

        const pas = this.data.stability.pas || 0;
        const state = this.data.stability.state || 'stable';
        const color = stateColors[state] || stateColors['stable'];

        content.innerHTML = `
            <div class="metric">
                <label>PAS Score:</label>
                <div class="bar"><div style="width:${pas * 100}%;background:${color}"></div></div>
                <span class="value" style="color:${color}">${pas.toFixed(2)}</span>
            </div>
            <div class="stability-state" style="color:${color}">
                ${stateLabels[state] || stateLabels['stable']}
            </div>
        `;
    }

    /**
     * Update the thought stream with new thoughts.
     * @param {Array} thoughts - Array of thought objects with time, text, type
     */
    setThoughts(thoughts) {
        this.data.thoughts = thoughts || [];
        const log = this.element.querySelector('.thought-log');

        if (this.data.thoughts.length === 0) {
            log.innerHTML = '<div class="empty-state">No thoughts recorded</div>';
            return;
        }

        log.innerHTML = this.data.thoughts.map(t => `
            <div class="thought-item type-${t.type || 'inference'}">
                <span class="time">${this._escapeHtml(t.time || '')}</span>
                <span class="arrow">▸</span>
                <span class="text">${this._escapeHtml(t.text || '')}</span>
            </div>
        `).join('');
    }

    /**
     * Update the intent map with goal and trajectory.
     * @param {Object} intent - Intent object with goal and steps
     */
    setIntent(intent) {
        this.data.intent = intent || { goal: '', steps: [] };
        const content = this.element.querySelector('.intent-content');

        const goal = this._escapeHtml(this.data.intent.goal || 'No active goal');
        const steps = this.data.intent.steps || [];

        let stepsHtml = '';
        if (steps.length > 0) {
            stepsHtml = `
                <div class="trajectory">
                    <strong>Planned Trajectory:</strong>
                    <ol>
                        ${steps.map(s => `
                            <li class="${s.complete ? 'complete' : 'pending'}">
                                ${s.complete ? '✓' : '○'} ${this._escapeHtml(s.text || '')}
                            </li>
                        `).join('')}
                    </ol>
                </div>
            `;
        }

        content.innerHTML = `
            <div class="current-goal">
                <strong>Current Goal:</strong><br>
                "${goal}"
            </div>
            ${stepsHtml}
        `;
    }

    /**
     * Update the metabolic pulse with metrics.
     * @param {Object} metabolism - Metabolism object with ipc, memory, activity
     */
    setMetabolism(metabolism) {
        this.data.metabolism = metabolism || { ipc: 0, memory: { used: 0, total: 0 }, activity: 0 };
        const content = this.element.querySelector('.metabolism-content');

        const ipc = this.data.metabolism.ipc || 0;
        const memory = this.data.metabolism.memory || { used: 0, total: 512 };
        const activity = this.data.metabolism.activity || 0;

        const memPct = memory.total > 0 ? (memory.used / memory.total * 100).toFixed(0) : 0;
        const actLabel = activity > 0.7 ? 'High' : activity > 0.3 ? 'Medium' : 'Low';

        content.innerHTML = `
            <div class="metric">
                <label>IPC:</label>
                <div class="bar"><div style="width:${Math.min(ipc * 100, 100)}%"></div></div>
                <span class="value">${ipc.toFixed(2)}</span>
            </div>
            <div class="metric">
                <label>Memory:</label>
                <div class="bar"><div style="width:${Math.min(memPct, 100)}%"></div></div>
                <span class="value">${memory.used}MB / ${memory.total}MB</span>
            </div>
            <div class="metric">
                <label>Activity:</label>
                <div class="bar"><div style="width:${Math.min(activity * 100, 100)}%"></div></div>
                <span class="value">${actLabel}</span>
            </div>
        `;
    }

    /**
     * Update the communication log with messages.
     * @param {Array} comms - Array of communication objects with direction, target, type
     */
    setCommunications(comms) {
        this.data.communications = comms || [];
        const log = this.element.querySelector('.comm-log');

        if (this.data.communications.length === 0) {
            log.innerHTML = '<div class="empty-state">No communications</div>';
            return;
        }

        log.innerHTML = this.data.communications.map(c => `
            <div class="comm-item">
                <span class="direction ${c.direction}">${c.direction === 'out' ? '→' : '←'}</span>
                <span class="target">${this._escapeHtml(c.target || '')}:</span>
                <span class="type">${this._escapeHtml(c.type || '')}</span>
            </div>
        `).join('');
    }

    /**
     * Update the live console with VM output.
     * @param {Array} consoleOutput - Array of console line objects with time and text
     */
    setLiveConsole(consoleOutput) {
        const section = this.element.querySelector('#live-console-section');
        const output = this.element.querySelector('.console-output');

        if (consoleOutput && consoleOutput.length > 0) {
            section.style.display = 'block';
            output.innerHTML = consoleOutput.map(line =>
                `<div class="console-line"><span class="time">${line.time}</span> ${this._escapeHtml(line.text)}</div>`
            ).join('');
            output.scrollTop = output.scrollHeight;
        } else {
            section.style.display = 'none';
        }
    }

    /**
     * Set all data sections at once.
     * @param {Object} agentData - Complete agent data object
     */
    setAllData(agentData) {
        if (!agentData) return;

        if (agentData.stability !== undefined) {
            this.setStability(agentData.stability);
        }
        if (agentData.thoughts !== undefined) {
            this.setThoughts(agentData.thoughts);
        }
        if (agentData.intent !== undefined) {
            this.setIntent(agentData.intent);
        }
        if (agentData.metabolism !== undefined) {
            this.setMetabolism(agentData.metabolism);
        }
        if (agentData.communications !== undefined) {
            this.setCommunications(agentData.communications);
        }
        if (agentData.rtsPath !== undefined) {
            this.setSubstrate(agentData.rtsPath);
        }
        if (agentData.consoleOutput !== undefined) {
            this.setLiveConsole(agentData.consoleOutput);
        }
    }

    /**
     * Escape HTML to prevent XSS.
     * @private
     */
    _escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    /**
     * Get current data state.
     * @returns {Object} Current panel data
     */
    getData() {
        return { ...this.data };
    }
}

// Export for browser and module systems
if (typeof window !== 'undefined') {
    window.AgentDataPanel = AgentDataPanel;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgentDataPanel;
}
