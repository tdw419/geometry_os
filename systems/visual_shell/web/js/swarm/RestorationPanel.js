/**
 * RestorationPanel - UI component for monitoring "The Great Map Restoration" mission.
 */

class RestorationPanel {
    constructor(container) {
        this.container = container;
        this.element = document.createElement('div');
        this.element.className = 'restoration-panel';
        
        this.statusEl = null;
        this.progressEl = null;
        this.phaseListEl = null;
        
        this._initLayout();
        this.container.appendChild(this.element);
    }

    _initLayout() {
        this.element.innerHTML = `
            <div class="panel-header">Map Restoration Mission</div>
            <div class="mission-status">
                <span class="label">Status:</span>
                <span class="value state-idle">IDLE</span>
            </div>
            <div class="progress-container">
                <div class="progress-bar" style="width: 0%"></div>
                <span class="progress-text">0%</span>
            </div>
            <div class="mission-phases">
                <ul class="phase-list"></ul>
            </div>
            <div class="mission-controls">
                <button class="btn-start-mission">START MISSION</button>
            </div>
        `;
        
        this.statusEl = this.element.querySelector('.mission-status .value');
        this.progressEl = this.element.querySelector('.progress-bar');
        this.progressTextEl = this.element.querySelector('.progress-text');
        this.phaseListEl = this.element.querySelector('.phase-list');
        
        this.element.querySelector('.btn-start-mission').onclick = () => {
            if (this.onStartMission) this.onStartMission();
        };
    }

    update(data) {
        // Update State
        this.statusEl.textContent = data.state.toUpperCase();
        this.statusEl.className = `value state-${data.state.toLowerCase()}`;
        
        // Update Progress
        const percent = Math.round(data.progress * 100);
        this.progressEl.style.width = `${percent}%`;
        this.progressTextEl.textContent = `${percent}%`;
        
        // Update Phases
        this.phaseListEl.innerHTML = '';
        data.phases.forEach((phase, index) => {
            const li = document.createElement('li');
            li.className = `phase-item phase-${phase.status.toLowerCase()}`;
            if (index === data.current_phase_index) li.classList.add('current');
            
            li.innerHTML = `
                <span class="phase-name">${phase.name}</span>
                <span class="phase-status">${this._getStatusIcon(phase.status)}</span>
            `;
            this.phaseListEl.appendChild(li);
        });
    }

    _getStatusIcon(status) {
        switch (status) {
            case 'completed': return '✅';
            case 'running': return '⏳';
            case 'failed': return '❌';
            default: return '○';
        }
    }
}

if (typeof window !== 'undefined') window.RestorationPanel = RestorationPanel;
