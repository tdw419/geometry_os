/**
 * Geometry OS: Phase 20 - Track 3
 * Build Fracture Detector (Ouroboros Loop)
 * 
 * Detects visual anomalies in the build pipeline and triggers
 * self-healing repair agents. Named after the Ouroboros (serpent
 * eating its own tail) - representing the circular self-repair loop.
 * 
 * Architecture:
 * 1. Monitor: Watch for build failures, state corruption, epoch mismatches
 * 2. Detect: Identify "fractures" in the visual substrate
 * 3. Localize: Pinpoint the exact location/component of failure
 * 4. Repair: Dispatch repair agents to fix the issue
 * 5. Verify: Confirm repair was successful
 * 6. Heal: Animate the visual "mending" of the fracture
 */

class OuroborosDetector {
    constructor(options = {}) {
        this.config = {
            scanInterval: options.scanInterval || 1000,      // ms between scans
            fractureThreshold: options.fractureThreshold || 0.7, // Anomaly score threshold
            maxActiveRepairs: options.maxActiveRepairs || 3,
            repairTimeout: options.repairTimeout || 10000,   // Max ms for repair attempt
            healAnimationDuration: options.healAnimationDuration || 500,
        };

        // Active fractures being tracked
        this.activeFractures = new Map();
        this.repairHistory = [];
        this.isScanning = false;
        this.scanInterval = null;

        // Repair agents registry
        this.repairAgents = new Map();

        // VCC integration
        this.lastValidEpoch = 0;
        this.epochMismatches = [];

        // Statistics
        this.stats = {
            fracturesDetected: 0,
            repairsAttempted: 0,
            repairsSuccessful: 0,
            repairsFailed: 0,
        };

        console.log('[OUROBOROS] Fracture Detector initialized');
    }

    /**
     * Register a repair agent for a specific fracture type
     * @param {string} fractureType - Type of fracture to handle
     * @param {object} agent - Repair agent with diagnose() and repair() methods
     */
    registerRepairAgent(fractureType, agent) {
        this.repairAgents.set(fractureType, agent);
        console.log(`[OUROBOROS] Registered repair agent for: ${fractureType}`);
    }

    /**
     * Start continuous fracture scanning
     */
    startScanning(vccManager = null, buildSwarm = null) {
        if (this.isScanning) return;

        this.isScanning = true;
        this.vccManager = vccManager;
        this.buildSwarm = buildSwarm;

        this.scanInterval = setInterval(() => {
            this._performScan();
        }, this.config.scanInterval);

        console.log('[OUROBOROS] Fracture scanning started');

        // Listen for VCC violations
        if (typeof window !== 'undefined') {
            window.addEventListener('VCC_BACK_PRESSURE', (e) => {
                this._handleVCCViolation(e.detail);
            });
        }
    }

    /**
     * Stop scanning
     */
    stopScanning() {
        this.isScanning = false;
        if (this.scanInterval) {
            clearInterval(this.scanInterval);
            this.scanInterval = null;
        }
        console.log('[OUROBOROS] Fracture scanning stopped');
    }

    /**
     * Perform a single scan for fractures
     */
    _performScan() {
        const fractures = [];

        // Check 1: VCC Epoch Mismatch
        if (this.vccManager) {
            const epochFracture = this._checkEpochHealth();
            if (epochFracture) fractures.push(epochFracture);
        }

        // Check 2: Build Swarm Worker Failures
        if (this.buildSwarm) {
            const workerFractures = this._checkWorkerHealth();
            fractures.push(...workerFractures);
        }

        // Check 3: State Corruption
        const stateFracture = this._checkStateIntegrity();
        if (stateFracture) fractures.push(stateFracture);

        // Process detected fractures
        for (const fracture of fractures) {
            if (!this.activeFractures.has(fracture.id)) {
                this._handleFracture(fracture);
            }
        }
    }

    /**
     * Check VCC epoch health
     */
    _checkEpochHealth() {
        if (!this.vccManager) return null;

        const currentEpoch = this.vccManager.currentEpoch;
        const isFrozen = this.vccManager.isFrozen;

        if (isFrozen && currentEpoch > this.lastValidEpoch) {
            return {
                id: `epoch_mismatch_${currentEpoch}`,
                type: 'epoch_mismatch',
                severity: 0.8,
                location: { component: 'VCC', epoch: currentEpoch },
                message: `Visual epoch frozen at ${currentEpoch}`,
                timestamp: Date.now(),
            };
        }

        this.lastValidEpoch = currentEpoch;
        return null;
    }

    /**
     * Check build swarm worker health
     */
    _checkWorkerHealth() {
        const fractures = [];

        if (!this.buildSwarm || !this.buildSwarm.workers) return fractures;

        for (const worker of this.buildSwarm.workers.values()) {
            // Check for stalled workers
            if (worker.state === 'building' && worker.lastUpdate) {
                const stalledTime = Date.now() - worker.lastUpdate;
                if (stalledTime > 30000) { // 30 second stall
                    fractures.push({
                        id: `worker_stall_${worker.id}`,
                        type: 'worker_stall',
                        severity: 0.7,
                        location: { component: 'BuildSwarm', workerId: worker.id },
                        message: `Worker ${worker.id} stalled for ${(stalledTime / 1000).toFixed(0)}s`,
                        timestamp: Date.now(),
                    });
                }
            }

            // Check for error state
            if (worker.state === 'error') {
                fractures.push({
                    id: `worker_error_${worker.id}`,
                    type: 'worker_error',
                    severity: 0.9,
                    location: { component: 'BuildSwarm', workerId: worker.id },
                    message: `Worker ${worker.id} in error state`,
                    timestamp: Date.now(),
                });
            }
        }

        return fractures;
    }

    /**
     * Check for state integrity issues
     */
    _checkStateIntegrity() {
        // Basic state consistency checks
        if (typeof window !== 'undefined') {
            // Check for dangling references
            const fileSprites = window.fileSprites || {};
            const saccadeElements = window.saccadeEngine?.elements || new Map();

            // Count mismatches
            let mismatches = 0;
            for (const path in fileSprites) {
                const elemId = `file:${path}`;
                if (!saccadeElements.has(elemId)) {
                    mismatches++;
                }
            }

            if (mismatches > 5) {
                return {
                    id: `state_drift_${Date.now()}`,
                    type: 'state_drift',
                    severity: 0.6,
                    location: { component: 'StateSync' },
                    message: `${mismatches} state mismatches between visual and saccade engine`,
                    timestamp: Date.now(),
                };
            }
        }

        return null;
    }

    /**
     * Handle a detected fracture
     */
    async _handleFracture(fracture) {
        this.stats.fracturesDetected++;
        this.activeFractures.set(fracture.id, {
            ...fracture,
            status: 'detected',
            repairAttempts: 0,
        });

        console.warn(`[OUROBOROS] 🔥 Fracture detected: ${fracture.type}`, fracture);

        // Emit fracture event
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent('FRACTURE_DETECTED', {
                detail: fracture
            }));
        }

        // Attempt repair if agent available
        const agent = this.repairAgents.get(fracture.type);
        if (agent) {
            await this._attemptRepair(fracture, agent);
        } else {
            console.warn(`[OUROBOROS] No repair agent for fracture type: ${fracture.type}`);
        }
    }

    /**
     * Attempt to repair a fracture
     */
    async _attemptRepair(fracture, agent) {
        const fractureData = this.activeFractures.get(fracture.id);
        if (!fractureData) return;

        fractureData.status = 'repairing';
        fractureData.repairAttempts++;
        this.stats.repairsAttempted++;

        console.log(`[OUROBOROS] ⚙️ Attempting repair for ${fracture.id} (attempt ${fractureData.repairAttempts})`);

        try {
            // Diagnose the issue
            const diagnosis = await agent.diagnose(fracture);

            // Attempt repair with timeout
            const repairPromise = agent.repair(fracture, diagnosis);
            const timeoutPromise = new Promise((_, reject) => {
                setTimeout(() => reject(new Error('Repair timeout')), this.config.repairTimeout);
            });

            const result = await Promise.race([repairPromise, timeoutPromise]);

            if (result.success) {
                this.stats.repairsSuccessful++;
                fractureData.status = 'healed';

                console.log(`[OUROBOROS] ✅ Repair successful for ${fracture.id}`);

                // Trigger healing animation
                this._triggerHealAnimation(fracture);

                // Record in history
                this.repairHistory.push({
                    fractureId: fracture.id,
                    type: fracture.type,
                    repairTime: Date.now(),
                    attempts: fractureData.repairAttempts,
                    success: true,
                });

                // Remove from active fractures after animation
                setTimeout(() => {
                    this.activeFractures.delete(fracture.id);
                }, this.config.healAnimationDuration);
            } else {
                throw new Error(result.error || 'Repair failed');
            }

        } catch (error) {
            console.error(`[OUROBOROS] ❌ Repair failed for ${fracture.id}:`, error);
            this.stats.repairsFailed++;

            // Retry if under limit
            if (fractureData.repairAttempts < 3) {
                fractureData.status = 'pending_retry';
                setTimeout(() => {
                    this._attemptRepair(fracture, agent);
                }, 2000);
            } else {
                fractureData.status = 'failed';
                this.repairHistory.push({
                    fractureId: fracture.id,
                    type: fracture.type,
                    repairTime: Date.now(),
                    attempts: fractureData.repairAttempts,
                    success: false,
                    error: error.message,
                });
            }
        }
    }

    /**
     * Trigger visual healing animation
     */
    _triggerHealAnimation(fracture) {
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent('FRACTURE_HEALED', {
                detail: {
                    fractureId: fracture.id,
                    location: fracture.location,
                    duration: this.config.healAnimationDuration,
                }
            }));
        }
    }

    /**
     * Handle VCC violation
     */
    _handleVCCViolation(detail) {
        const fracture = {
            id: `vcc_violation_${detail.epoch}`,
            type: 'vcc_violation',
            severity: 0.75,
            location: { component: 'VCC', epoch: detail.epoch },
            message: `VCC back-pressure triggered: ${detail.reason}`,
            timestamp: Date.now(),
        };

        this.epochMismatches.push(fracture);
        this._handleFracture(fracture);
    }

    /**
     * Manually trigger a fracture (for testing)
     */
    simulateFracture(type, message) {
        const fracture = {
            id: `simulated_${type}_${Date.now()}`,
            type: type,
            severity: 0.5,
            location: { component: 'Simulated' },
            message: message || `Simulated ${type} fracture`,
            timestamp: Date.now(),
        };

        this._handleFracture(fracture);
        return fracture;
    }

    /**
     * Get detector statistics
     */
    getStats() {
        return {
            ...this.stats,
            activeFractures: this.activeFractures.size,
            registeredAgents: this.repairAgents.size,
            isScanning: this.isScanning,
        };
    }

    /**
     * Get active fractures
     */
    getActiveFractures() {
        return Array.from(this.activeFractures.values());
    }

    /**
     * Get repair history
     */
    getRepairHistory() {
        return this.repairHistory;
    }
}

/**
 * Built-in Repair Agents
 */

// Epoch Mismatch Repair Agent
const EpochRepairAgent = {
    async diagnose(fracture) {
        return {
            issue: 'Visual epoch lagging behind infrastructure',
            recommendation: 'Force sync visual state to current epoch',
        };
    },

    async repair(fracture, diagnosis) {
        // Force VCC to sync
        if (typeof window !== 'undefined' && window.vcc) {
            window.vcc.isFrozen = false;
            window.vcc.lastVisualUpdate = Date.now();

            // Dispatch ready event
            window.dispatchEvent(new CustomEvent('VCC_READY_FOR_EPOCH', {
                detail: { lastCommittedEpoch: window.vcc.currentEpoch, timestamp: Date.now() }
            }));

            return { success: true };
        }
        return { success: false, error: 'VCC not available' };
    }
};

// Worker Stall Repair Agent
const WorkerStallRepairAgent = {
    async diagnose(fracture) {
        return {
            issue: `Worker ${fracture.location.workerId} is stalled`,
            recommendation: 'Reset worker state and reassign jobs',
        };
    },

    async repair(fracture, diagnosis) {
        if (typeof window !== 'undefined' && window.buildSwarm) {
            const worker = window.buildSwarm.workers.get(fracture.location.workerId);
            if (worker) {
                worker.state = 'idle';
                worker.lastUpdate = Date.now();
                return { success: true };
            }
        }
        return { success: false, error: 'Worker not found' };
    }
};

// State Drift Repair Agent
const StateDriftRepairAgent = {
    async diagnose(fracture) {
        return {
            issue: 'Visual sprites and saccade engine out of sync',
            recommendation: 'Re-register all visual elements with saccade engine',
        };
    },

    async repair(fracture, diagnosis) {
        if (typeof window !== 'undefined' && window.saccadeEngine && window.fileSprites) {
            let synced = 0;
            for (const [path, sprite] of Object.entries(window.fileSprites)) {
                const elemId = `file:${path}`;
                if (!window.saccadeEngine.elements.has(elemId)) {
                    window.saccadeEngine.registerElement(
                        elemId,
                        { x: sprite.x - 12, y: sprite.y - 12, width: 24, height: 24 },
                        5,
                        'file'
                    );
                    synced++;
                }
            }
            console.log(`[OUROBOROS] Re-synced ${synced} elements`);
            return { success: true };
        }
        return { success: false, error: 'State objects not available' };
    }
};

// VCC Violation Repair Agent
const VCCViolationRepairAgent = {
    async diagnose(fracture) {
        return {
            issue: 'VCC back-pressure triggered due to latency',
            recommendation: 'Release back-pressure and allow new epochs',
        };
    },

    async repair(fracture, diagnosis) {
        if (typeof window !== 'undefined' && window.vcc) {
            window.vcc.isFrozen = false;
            return { success: true };
        }
        return { success: false, error: 'VCC not available' };
    }
};

// Export for use in Visual Shell
if (typeof window !== 'undefined') {
    window.OuroborosDetector = OuroborosDetector;
    window.EpochRepairAgent = EpochRepairAgent;
    window.WorkerStallRepairAgent = WorkerStallRepairAgent;
    window.StateDriftRepairAgent = StateDriftRepairAgent;
    window.VCCViolationRepairAgent = VCCViolationRepairAgent;
}

// Node.js / ES Module export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        OuroborosDetector,
        EpochRepairAgent,
        WorkerStallRepairAgent,
        StateDriftRepairAgent,
        VCCViolationRepairAgent
    };
}
