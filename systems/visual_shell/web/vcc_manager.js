/**
 * Geometry OS: Phase 20 - Track 4.1
 * Visual Consistency Contract (VCC) Manager
 * 
 * Ensures frame-coherent synchronization between Swarm Infrastructure
 * and the PixiJS Visual Cortex.
 */

class VCCManager {
    constructor(maxLatencyMs = 100) {
        this.maxLatency = maxLatencyMs;
        this.currentEpoch = 0;
        this.lastVisualUpdate = Date.now();
        this.isFrozen = false;

        console.log(`[VCC] Protocol initialized. Latency Bound: ${maxLatencyMs}ms`);

        // Back-pressure event listener for integration with Swarm Substrate
        this.setupEventListeners();
    }

    setupEventListeners() {
        window.addEventListener('INFRASTRUCTURE_STATE_CHANGE', (e) => {
            const { epoch, state } = e.detail;
            this.handleEpochUpdate(epoch, state);
        });
    }

    /**
     * VCC-01: Epoch Sync
     * Called when the Infrastructure Substrate (Build Swarm) emits a new state.
     */
    handleEpochUpdate(epochId, stateData) {
        // Enforce monotonicity
        if (epochId <= this.currentEpoch) return;

        const now = Date.now();
        const latency = now - this.lastVisualUpdate;

        // VCC-01 Violation Check
        if (latency > this.maxLatency) {
            console.warn(`[VCC-VIOLATION] Latency: ${latency}ms > ${this.maxLatency}ms. Current Epoch: ${epochId}`);
            this.applyBackPressure(epochId);
            return;
        }

        this.currentEpoch = epochId;
        this.isFrozen = false;

        // Dispatch validated state to components (e.g., BuildSwarm)
        window.dispatchEvent(new CustomEvent('VCC_VALIDATED_STATE', {
            detail: { epoch: epochId, state: stateData }
        }));
    }

    /**
     * VCC-03: Commit Boundary
     * Called by the PixiJS Render Loop when the frame is successfully submitted to GPU.
     * Ensures all RenderGroups are synchronized to the currentEpoch.
     */
    commitVisualEpoch(renderGroups = []) {
        const now = Date.now();

        // Final validation before commit
        const isSynchronized = renderGroups.every(group => group.epochId === this.currentEpoch);

        if (!isSynchronized && renderGroups.length > 0) {
            console.warn(`[VCC-SYNC-FAIL] Partial update detected for Epoch ${this.currentEpoch}`);
            return false;
        }

        this.lastVisualUpdate = now;

        // Signal back to infrastructure that UI is ready for next epoch
        window.dispatchEvent(new CustomEvent('VCC_READY_FOR_EPOCH', {
            detail: { lastCommittedEpoch: this.currentEpoch, timestamp: now }
        }));

        this.isFrozen = false;
        return true;
    }

    applyBackPressure(epochId) {
        this.isFrozen = true;
        // Broadcast back-pressure to the backend 
        // In PixiJS context, this usually signals the WebSocket/Bridge to pause
        window.dispatchEvent(new CustomEvent('VCC_BACK_PRESSURE', {
            detail: { epoch: epochId, reason: 'LATENCY_THRESHOLD_EXCEEDED' }
        }));
    }

    /**
     * Helper for RenderGroups (Phase 19/20)
     */
    shouldRender(groupEpochId) {
        if (this.isFrozen) return false;
        return groupEpochId === this.currentEpoch;
    }
}

// Global Singleton for the Visual Shell
if (typeof window !== 'undefined') {
    window.vcc = new VCCManager();
}
