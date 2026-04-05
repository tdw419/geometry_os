// Geometry OS Status Dashboard
// Real-time system metrics + Filmstrip Projector visualization

const REFRESH_INTERVAL = 2000; // 2 seconds
const STATUS_API = '/api/status';
const DAEMON_API = '/api/v1/status';

let lastData = null;
let selectedVm = 0;

// ── Legacy metrics fetch ──

async function fetchStatus() {
    try {
        const response = await fetch(STATUS_API);
        if (response.ok) {
            const data = await response.json();
            updateMetrics(data);
            lastData = data;
        }
    } catch (_e) {
        // Legacy endpoint may not exist; that's fine
    }

    try {
        const response = await fetch(DAEMON_API);
        if (response.ok) {
            const data = await response.json();
            updateFilmstrip(data);
        }
    } catch (_e) {
        // Daemon may not be running
    }

    const lastUpdate = document.getElementById('last-update');
    if (lastUpdate) {
        lastUpdate.textContent = `Last update: ${new Date().toLocaleTimeString()}`;
    }
}

function updateMetrics(data) {
    const gipsValue = document.getElementById('gips-value');
    const gipsProgress = document.getElementById('gips-progress');
    const gipsTarget = 10000;

    if (gipsValue && gipsProgress) {
        gipsValue.textContent = data.gips ? data.gips.toFixed(2) : '--';
        const pct = Math.min((data.gips || 0) / gipsTarget * 100, 100);
        gipsProgress.style.width = `${pct}%`;
    }

    const fitnessValue = document.getElementById('fitness-value');
    const fitnessProgress = document.getElementById('fitness-progress');
    if (fitnessValue && fitnessProgress) {
        const fitness = data.allocator_fitness || 0;
        fitnessValue.textContent = `${(fitness * 100).toFixed(1)}%`;
        fitnessProgress.style.width = `${fitness * 100}%`;
    }

    const experimentsValue = document.getElementById('experiments-value');
    if (experimentsValue) {
        experimentsValue.textContent = data.evolution_experiments?.toLocaleString() || '--';
    }

    const kernelValue = document.getElementById('kernel-value');
    if (kernelValue) {
        kernelValue.textContent = ((data.kernel_size || 1) / 1024).toFixed(2);
    }

    updateComponent('evolution-status', data.evolution_running ? 'Running' : 'Stopped');
    updateComponent('kernel-status', data.kernel_ready ? 'Ready' : 'Not Ready');
    updateComponent('shell-status', data.shell_active ? 'Active' : 'Inactive');
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

// ── Filmstrip Projector ──

/**
 * Build an inverted label map: index -> name
 * frame_labels from the API is {"Boot": 0, "Loop": 1}
 * We need {0: "Boot", 1: "Loop"} for lookup by index.
 */
function invertLabels(frameLabels) {
    if (!frameLabels) return {};
    const byIndex = {};
    for (const [name, idx] of Object.entries(frameLabels)) {
        byIndex[idx] = name;
    }
    return byIndex;
}

/**
 * Get a human-readable name for a frame index, falling back to the index.
 */
function frameName(idx, labelsByIndex) {
    return labelsByIndex[idx] || `#${idx}`;
}

function updateFilmstrip(data) {
    const vms = data.vm_states || [];

    // Find active VMs (running or halted, not inactive)
    const activeVms = vms.filter(vm => vm.state !== 'inactive');

    if (activeVms.length === 0) return;

    // Auto-select first active VM if selected is inactive
    const current = vms[selectedVm];
    if (!current || current.state === 'inactive') {
        selectedVm = activeVms[0].vm_id;
    }

    // Render VM tabs
    const tabsEl = document.getElementById('vm-selector');
    if (tabsEl) {
        tabsEl.innerHTML = activeVms.map(vm => {
            const cls = vm.vm_id === selectedVm ? 'vm-tab active' : 'vm-tab';
            const stateIcon = vm.state === 'running' ? '●' :
                              vm.state === 'halted' ? '■' :
                              vm.state === 'waiting' ? '◎' : '○';
            return `<div class="${cls}" onclick="selectVm(${vm.vm_id})">${stateIcon} VM ${vm.vm_id}</div>`;
        }).join('');
    }

    const vm = vms[selectedVm];
    if (!vm) return;

    const labelsByIndex = invertLabels(vm.frame_labels);

    // Render projector track
    const trackEl = document.getElementById('projector-track');
    if (trackEl && vm.frame_count > 0) {
        let cells = '';
        for (let i = 0; i < vm.frame_count; i++) {
            const isActive = i === vm.frame_ptr;
            const cls = isActive ? 'frame-cell active' : 'frame-cell';
            const name = frameName(i, labelsByIndex);
            cells += `<div class="${cls}">
                <div class="frame-index">F${i}</div>
                <div class="frame-name">${name}</div>
            </div>`;
        }
        trackEl.innerHTML = cells;

        // Scroll active frame into view
        const activeCell = trackEl.querySelector('.frame-cell.active');
        if (activeCell) {
            activeCell.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
        }
    } else if (trackEl && vm.frame_count === 0) {
        trackEl.innerHTML = '<div style="color: var(--text-secondary); font-size: 0.7rem; padding: 1rem;">No filmstrip loaded</div>';
    }

    // Render jump log
    const logEl = document.getElementById('jump-log');
    if (logEl) {
        const jumps = vm.jump_log || [];
        if (jumps.length === 0) {
            logEl.innerHTML = '<div class="jump-log-title">Jump Log</div>' +
                '<div style="color: var(--text-secondary); font-size: 0.65rem;">No transitions recorded</div>';
        } else {
            const recent = jumps.slice(-20); // show last 20
            let entries = '<div class="jump-log-title">Jump Log (' + jumps.length + ' events)</div>';
            for (const t of recent) {
                const fromName = frameName(t.from_frame, labelsByIndex);
                const toName = frameName(t.to_frame, labelsByIndex);
                const causeClass = t.cause === 'frame_opcode' ? 'cause-frame' : 'cause-auto';
                const causeLabel = t.cause === 'frame_opcode' ? 'FRAME' : 'auto';
                entries += `<div class="jump-entry">
                    <span class="frame-name">${fromName}</span>
                    <span class="arrow"> → </span>
                    <span class="frame-name">${toName}</span>
                    <span class="${causeClass}"> ${causeLabel}</span>
                </div>`;
            }
            logEl.innerHTML = entries;
            // Auto-scroll to bottom
            logEl.scrollTop = logEl.scrollHeight;
        }
    }
}

function selectVm(vmId) {
    selectedVm = vmId;
    // Re-render immediately from cached data
    if (lastData && lastData.vm_states) {
        updateFilmstrip(lastData);
    }
}

// Start updates
setInterval(fetchStatus, REFRESH_INTERVAL);
fetchStatus();
