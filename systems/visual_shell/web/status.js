// Geometry OS Status Dashboard
// Real-time system metrics visualization

const REFRESH_INTERVAL = 2000; // 2 seconds
const STATUS_API = '/api/status';

let lastData = null;

async function fetchStatus() {
    try {
        const response = await fetch(STATUS_API);
        if (!response.ok) {
            throw new Error(`HTTP ${response.status}`);
        }
        const data = await response.json();
        updateDashboard(data);
        lastData = data;
    } catch (error) {
        showError(error.message);
    }
}

function updateDashboard(data) {
    // Update GIPS
    const gipsValue = document.getElementById('gips-value');
    const gipsProgress = document.getElementById('gips-progress');
    const gipsTarget = 10000; // 10K GIPS target

    if (gipsValue && gipsProgress) {
        gipsValue.textContent = data.gips ? data.gips.toFixed(2) : '--';
        const pct = Math.min((data.gips || 0) / gipsTarget * 100, 100);
        gipsProgress.style.width = `${pct}%`;
    }

    // Update Allocator Fitness
    const fitnessValue = document.getElementById('fitness-value');
    const fitnessProgress = document.getElementById('fitness-progress');

    if (fitnessValue && fitnessProgress) {
        const fitness = data.allocator_fitness || 0;
        fitnessValue.textContent = `${(fitness * 100).toFixed(1)}%`;
        fitnessProgress.style.width = `${fitness * 100}%`;
    }

    // Update Experiments
    const experimentsValue = document.getElementById('experiments-value');
    if (experimentsValue) {
        experimentsValue.textContent = data.evolution_experiments?.toLocaleString() || '--';
    }

    // Update Kernel Size
    const kernelValue = document.getElementById('kernel-value');
    if (kernelValue) {
        kernelValue.textContent = ((data.kernel_size || 1) / 1024).toFixed(2);
    }

    // Update Components
    updateComponent('evolution-status', data.evolution_running ? 'Running' : 'Stopped');
    updateComponent('kernel-status', data.kernel_ready ? 'Ready' : 'Not Ready');
    updateComponent('shell-status', data.shell_active ? 'Active' : 'Inactive');

    // Update timestamp
    const lastUpdate = document.getElementById('last-update');
    if (lastUpdate) {
        lastUpdate.textContent = `Last update: ${new Date().toLocaleTimeString()}`;
    }
}

function updateComponent(elementId, status) {
    const element = document.getElementById(elementId);
    if (!element) return;

    element.textContent = status;
    let statusClass = 'status-error';
    if (status === 'Running' || status === 'Active' || status === 'Ready') {
        statusClass = 'status-ok';
    } else if (status === 'Stopped' || status === 'Not Ready') {
        statusClass = 'status-warning';
    }
    element.className = `component-status ${statusClass}`;
}

function showError(message) {
    const container = document.getElementById('components-grid');
    if (container) {
        container.innerHTML = `<div class="error">Error: ${message}</div>`;
    }
}

// Start updates
setInterval(fetchStatus, REFRESH_INTERVAL);
fetchStatus(); // Initial fetch
