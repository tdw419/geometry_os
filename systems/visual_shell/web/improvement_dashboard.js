/**
 * Geometry OS: Improvement Dashboard
 *
 * Dashboard for AI PM autonomous improvement system.
 * Provides controls for service start/stop, cycle execution,
 * neuromodulation visualization, and activity logging.
 *
 * @version 1.0.0
 * @phase Phase O: AI PM Integration
 */

import { PMAutonomousTools } from './pm_autonomous_tools.js';

class ImprovementDashboard {
    // Server endpoints
    #pmAnalysisUrl = 'http://localhost:8769';
    #cartridgeServerUrl = 'http://localhost:8766';

    // PM tools instance
    #pmTools = null;

    // Dashboard state
    #state = {
        pmAnalysisServer: false,
        cartridgeServer: false,
        serviceRunning: false,
        cycles: [],
        neuromodulation: {
            dopamine: 50,
            urgency: 50,
            acetylcholine: 50
        }
    };

    // Refresh interval ID
    #refreshInterval = null;

    constructor() {
        this.#pmTools = new PMAutonomousTools(null);
    }

    /**
     * Initialize dashboard on DOM load
     */
    initialize() {
        this.#bindUIElements();
        this.#setupEventListeners();
        this.#checkServerStatus();
        this.#startRefresh(5000);
        this.log('Dashboard initialized', 'info');
    }

    /**
     * Bind UI elements to class properties
     */
    #bindUIElements() {
        // Status indicators
        this.ui = {
            pmAnalysisStatus: document.getElementById('pm-analysis-status'),
            cartridgeServerStatus: document.getElementById('cartridge-server-status'),
            serviceStatus: document.getElementById('service-status'),

            // Control buttons
            startServiceBtn: document.getElementById('start-service-btn'),
            stopServiceBtn: document.getElementById('stop-service-btn'),
            runCycleBtn: document.getElementById('run-cycle-btn'),

            // Neuromodulation bars
            dopamineBar: document.getElementById('dopamine-bar'),
            urgencyBar: document.getElementById('urgency-bar'),
            acetylcholineBar: document.getElementById('acetylcholine-bar'),
            dopamineValue: document.getElementById('dopamine-value'),
            urgencyValue: document.getElementById('urgency-value'),
            acetylcholineValue: document.getElementById('acetylcholine-value'),

            // Recommendations
            recommendationsList: document.getElementById('recommendations-list'),

            // History
            cycleHistory: document.getElementById('cycle-history'),

            // Activity log
            activityLog: document.getElementById('activity-log')
        };
    }

    /**
     * Setup event listeners for controls
     */
    #setupEventListeners() {
        if (this.ui.startServiceBtn) {
            this.ui.startServiceBtn.addEventListener('click', () => this.startService());
        }

        if (this.ui.stopServiceBtn) {
            this.ui.stopServiceBtn.addEventListener('click', () => this.stopService());
        }

        if (this.ui.runCycleBtn) {
            this.ui.runCycleBtn.addEventListener('click', () => this.runCycle());
        }
    }

    /**
     * Check status of both servers
     */
    async #checkServerStatus() {
        // Check PM Analysis Server
        try {
            const response = await fetch(`${this.#pmAnalysisUrl}/health`);
            this.#state.pmAnalysisServer = response.ok;
            this.#updateStatusIndicator(this.ui.pmAnalysisStatus, response.ok);
        } catch (e) {
            this.#state.pmAnalysisServer = false;
            this.#updateStatusIndicator(this.ui.pmAnalysisStatus, false);
        }

        // Check Cartridge Server
        try {
            const response = await fetch(`${this.#cartridgeServerUrl}/health`);
            this.#state.cartridgeServer = response.ok;
            this.#updateStatusIndicator(this.ui.cartridgeServer, response.ok);
        } catch (e) {
            this.#state.cartridgeServer = false;
            this.#updateStatusIndicator(this.ui.cartridgeServer, false);
        }

        // Check service status via PM tools
        const serviceStatus = await this.#pmTools.pm_service_status();
        this.#state.serviceRunning = serviceStatus.running || false;
        this.#updateStatusIndicator(this.ui.serviceStatus, this.#state.serviceRunning);
    }

    /**
     * Update status indicator element
     */
    #updateStatusIndicator(element, active) {
        if (!element) return;
        element.className = 'status-dot ' + (active ? 'active' : 'inactive');
    }

    /**
     * Start autonomous improvement service
     */
    async startService() {
        this.log('Starting autonomous improvement service...', 'info');

        const result = await this.#pmTools.pm_service_start({
            interval_seconds: 3600,
            auto_deploy: false,
            confidence_threshold: 0.8
        });

        if (result.success) {
            this.#state.serviceRunning = true;
            this.#updateStatusIndicator(this.ui.serviceStatus, true);
            this.log('Service started successfully', 'success');
        } else {
            this.log(`Failed to start service: ${result.error}`, 'error');
        }
    }

    /**
     * Stop autonomous improvement service
     */
    async stopService() {
        this.log('Stopping autonomous improvement service...', 'info');

        const result = await this.#pmTools.pm_service_stop();

        if (result.success) {
            this.#state.serviceRunning = false;
            this.#updateStatusIndicator(this.ui.serviceStatus, false);
            this.log('Service stopped successfully', 'success');
        } else {
            this.log(`Failed to stop service: ${result.error}`, 'error');
        }
    }

    /**
     * Run a single analysis and deployment cycle
     */
    async runCycle() {
        this.log('Starting analysis cycle...', 'info');
        this.ui.runCycleBtn.disabled = true;

        const result = await this.#pmTools.pm_analyze_and_deploy({
            auto_deploy: false,
            cartridge_name: `manual_cycle_${Date.now()}`,
            location: { x: 5000, y: 5000 }
        });

        this.ui.runCycleBtn.disabled = false;

        if (result.success) {
            this.log(`Cycle complete: ${result.recommendations?.length || 0} recommendations found`, 'success');

            // Add to history
            this.#addToHistory({
                timestamp: new Date(),
                recommendations: result.recommendations || [],
                deployed: result.deployed || false
            });

            // Render recommendations
            this.renderRecommendations(result.recommendations || []);
        } else {
            this.log(`Cycle failed: ${result.error}`, 'error');
        }
    }

    /**
     * Update neuromodulation visualization
     */
    updateNeuromodulation(neuro) {
        this.#state.neuromodulation = { ...this.#state.neuromodulation, ...neuro };

        const { dopamine, urgency, acetylcholine } = this.#state.neuromodulation;

        // Update bar widths
        if (this.ui.dopamineBar) {
            this.ui.dopamineBar.style.width = `${dopamine}%`;
        }
        if (this.ui.urgencyBar) {
            this.ui.urgencyBar.style.width = `${urgency}%`;
        }
        if (this.ui.acetylcholineBar) {
            this.ui.acetylcholineBar.style.width = `${acetylcholine}%`;
        }

        // Update value displays
        if (this.ui.dopamineValue) {
            this.ui.dopamineValue.textContent = dopamine;
        }
        if (this.ui.urgencyValue) {
            this.ui.urgencyValue.textContent = urgency;
        }
        if (this.ui.acetylcholineValue) {
            this.ui.acetylcholineValue.textContent = acetylcholine;
        }

        // Apply color based on values
        this.#updateBarColor(this.ui.dopamineBar, dopamine);
        this.#updateBarColor(this.ui.urgencyBar, urgency);
        this.#updateBarColor(this.ui.acetylcholineBar, acetylcholine);
    }

    /**
     * Update bar color based on value
     */
    #updateBarColor(bar, value) {
        if (!bar) return;
        if (value > 75) {
            bar.style.backgroundColor = '#00ff88';
        } else if (value > 50) {
            bar.style.backgroundColor = '#ffaa00';
        } else {
            bar.style.backgroundColor = '#ff4444';
        }
    }

    /**
     * Render recommendations with priority-based coloring
     */
    renderRecommendations(recs) {
        if (!this.ui.recommendationsList) return;

        this.ui.recommendationsList.innerHTML = '';

        if (!recs || recs.length === 0) {
            this.ui.recommendationsList.innerHTML = '<li class="no-recs">No recommendations available</li>';
            return;
        }

        recs.forEach(rec => {
            const li = document.createElement('li');
            li.className = `recommendation priority-${rec.priority?.toLowerCase() || 'medium'}`;

            const type = document.createElement('span');
            type.className = 'rec-type';
            type.textContent = rec.type || 'optimize';

            const desc = document.createElement('span');
            desc.className = 'rec-desc';
            desc.textContent = rec.description || 'No description';

            const confidence = document.createElement('span');
            confidence.className = 'rec-confidence';
            confidence.textContent = `${Math.round((rec.confidence || 0) * 100)}%`;

            li.appendChild(type);
            li.appendChild(desc);
            li.appendChild(confidence);

            this.ui.recommendationsList.appendChild(li);
        });
    }

    /**
     * Add entry to cycle history
     */
    #addToHistory(entry) {
        this.#state.cycles.unshift(entry);

        // Keep only last 20 entries
        if (this.#state.cycles.length > 20) {
            this.#state.cycles = this.#state.cycles.slice(0, 20);
        }

        this.renderHistory();
    }

    /**
     * Render cycle history
     */
    renderHistory() {
        if (!this.ui.cycleHistory) return;

        this.ui.cycleHistory.innerHTML = '';

        if (this.#state.cycles.length === 0) {
            this.ui.cycleHistory.innerHTML = '<div class="no-history">No cycles run yet</div>';
            return;
        }

        this.#state.cycles.forEach(entry => {
            const div = document.createElement('div');
            div.className = 'history-entry';

            const time = document.createElement('span');
            time.className = 'history-time';
            time.textContent = entry.timestamp.toLocaleTimeString();

            const count = document.createElement('span');
            count.className = 'history-count';
            count.textContent = `${entry.recommendations.length} recs`;

            const status = document.createElement('span');
            status.className = 'history-status';
            status.textContent = entry.deployed ? 'Deployed' : 'Analyzed';
            status.style.color = entry.deployed ? '#00ff88' : '#ffaa00';

            div.appendChild(time);
            div.appendChild(count);
            div.appendChild(status);

            this.ui.cycleHistory.appendChild(div);
        });
    }

    /**
     * Add message to activity log
     */
    log(message, level = 'info') {
        if (!this.ui.activityLog) return;

        const entry = document.createElement('div');
        entry.className = `log-entry log-${level}`;

        const timestamp = document.createElement('span');
        timestamp.className = 'log-time';
        const now = new Date();
        timestamp.textContent = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;

        const levelSpan = document.createElement('span');
        levelSpan.className = 'log-level';
        levelSpan.textContent = level.toUpperCase();

        const messageSpan = document.createElement('span');
        messageSpan.className = 'log-message';
        messageSpan.textContent = message;

        entry.appendChild(timestamp);
        entry.appendChild(levelSpan);
        entry.appendChild(messageSpan);

        this.ui.activityLog.insertBefore(entry, this.ui.activityLog.firstChild);

        // Keep only last 50 entries
        while (this.ui.activityLog.children.length > 50) {
            this.ui.activityLog.removeChild(this.ui.activityLog.lastChild);
        }
    }

    /**
     * Start periodic refresh
     */
    #startRefresh(intervalMs = 5000) {
        if (this.#refreshInterval) {
            clearInterval(this.#refreshInterval);
        }

        this.#refreshInterval = setInterval(() => {
            this.#checkServerStatus();
        }, intervalMs);
    }

    /**
     * Stop periodic refresh
     */
    stopRefresh() {
        if (this.#refreshInterval) {
            clearInterval(this.#refreshInterval);
            this.#refreshInterval = null;
        }
    }

    /**
     * Get current state
     */
    getState() {
        return { ...this.#state };
    }
}

// Initialize on DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {
    window.improvementDashboard = new ImprovementDashboard();
    window.improvementDashboard.initialize();
});

// Export for ES modules
if (typeof window !== 'undefined') {
    window.ImprovementDashboard = ImprovementDashboard;
}

export { ImprovementDashboard };
