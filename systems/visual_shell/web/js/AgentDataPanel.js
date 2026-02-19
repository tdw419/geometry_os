/**
 * AgentDataPanel - Four-section data display for Glass Box introspection.
 *
 * Displays agent internal state across four sections:
 * - Thought Stream: Scrolling log of agent decisions with timestamps and type coloring
 * - Intent Map: Current goal and planned trajectory with completion checkmarks
 * - Metabolic Pulse: IPC, memory, and activity metrics with progress bars
 * - Communication Log: Inbound/outbound messages with direction arrows
 */
class AgentDataPanel {
    constructor() {
        this.data = {
            thoughts: [],
            intent: { goal: '', steps: [] },
            metabolism: { ipc: 0, memory: { used: 0, total: 0 }, activity: 0 },
            communications: []
        };

        this.element = this._createElement();
    }

    /**
     * Create the panel DOM element with 4 data sections.
     * @private
     */
    _createElement() {
        const el = document.createElement('div');
        el.className = 'agent-data-panel';
        el.innerHTML = `
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
            <div class="data-section" id="communication-log">
                <h3>📡 Communication Log</h3>
                <div class="comm-log"></div>
            </div>
        `;
        return el;
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
     * Set all data sections at once.
     * @param {Object} agentData - Complete agent data object
     */
    setAllData(agentData) {
        if (!agentData) return;

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
