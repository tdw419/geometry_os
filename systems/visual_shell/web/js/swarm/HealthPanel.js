/**
 * HealthPanel - Displays real-time metrics and alerts for the swarm cluster.
 */

class HealthPanel {
    constructor(container) {
        this.container = container;
        this.element = document.createElement('div');
        this.element.className = 'health-panel';
        
        this.metrics = {};
        this.alertsContainer = null;
        
        this._initLayout();
        this.container.appendChild(this.element);
    }

    _initLayout() {
        // Header
        const header = document.createElement('div');
        header.className = 'panel-header';
        header.textContent = 'Swarm Cluster Health';
        this.element.appendChild(header);

        // Metrics Grid
        const grid = document.createElement('div');
        grid.className = 'metrics-grid';
        this.element.appendChild(grid);

        ['nodes', 'agents', 'tasks', 'locality'].forEach(key => {
            const m = document.createElement('div');
            m.className = `metric metric-${key}`;
            
            const label = document.createElement('span');
            label.className = 'label';
            label.textContent = key === 'locality' ? 'Locality' : key.charAt(0).toUpperCase() + key.slice(1);
            
            const value = document.createElement('span');
            value.className = 'value';
            value.textContent = key === 'locality' ? '0%' : '0';
            
            m.appendChild(label);
            m.appendChild(value);
            grid.appendChild(m);
            
            this.metrics[key] = value;
        });

        // Alerts
        this.alertsContainer = document.createElement('div');
        this.alertsContainer.className = 'alerts-container';
        this.element.appendChild(this.alertsContainer);
    }

    updateMetrics(data) {
        if (data.nodes !== undefined) this.metrics.nodes.textContent = data.nodes;
        if (data.agents !== undefined) this.metrics.agents.textContent = data.agents;
        if (data.tasks !== undefined) this.metrics.tasks.textContent = data.tasks;
        if (data.locality !== undefined) this.metrics.locality.textContent = (data.locality * 100).toFixed(1) + '%';
    }

    showAlert(message, severity = 'info') {
        const alert = document.createElement('div');
        alert.className = `alert ${severity}`;
        alert.textContent = message;
        
        this.alertsContainer.prepend(alert);
        
        setTimeout(() => {
            if (alert.parentNode) alert.parentNode.removeChild(alert);
        }, 5000);
    }
}

if (typeof window !== 'undefined') window.HealthPanel = HealthPanel;
