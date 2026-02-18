/**
 * EvolutionSafetySystem.js
 * 
 * Provides the "Immune System" for Geometry OS self-evolution.
 * Ensures that evolved code (mutations) do not crash the system.
 */

// --- 4.2 Mutation Guard (Static Analysis) ---
class MutationGuard {
    constructor() {
        this.forbiddenPatterns = [
            /eval\s*\(/,           // No eval
            /new\s+Function/,      // No dynamic function creation
            /while\s*\(\s*true\s*\)/, // simplistic infinite loop check
            /document\.write/,     // No DOM mutations directly
            /alert\s*\(/,          // No blocking alerts
            /prompt\s*\(/,
            /confirm\s*\(/
        ];
    }

    check(code) {
        for (const pattern of this.forbiddenPatterns) {
            if (pattern.test(code)) {
                return { valid: false, reason: `Forbidden pattern detected: ${pattern}` };
            }
        }
        return { valid: true };
    }
}

// --- 4.1 Evolution Sandbox (Runtime Isolation) ---
class EvolutionSandbox {
    constructor() {
        // We use a Worker for true isolation
    }

    /**
     * Run code in a confined environment
     * @param {string} code - The JS code to run
     * @param {number} timeoutMs - Max execution time
     */
    runCandidate(code, timeoutMs = 1000) {
        return new Promise((resolve) => {
            const blob = new Blob([`
                self.onmessage = function(e) {
                    try {
                        // Creating function from code string safely?
                        // We rely on 'new Function' inside worker, which is safer than main thread.
                        const func = new Function(e.data);
                        const result = func();
                        self.postMessage({ success: true, result });
                    } catch (err) {
                        self.postMessage({ success: false, error: err.message });
                    }
                };
            `], { type: 'application/javascript' });

            const worker = new Worker(URL.createObjectURL(blob));
            let solved = false;

            // Timeout Guard
            const timer = setTimeout(() => {
                if (solved) return;
                worker.terminate();
                resolve({ success: false, error: 'Execution Timeout' });
                solved = true;
            }, timeoutMs);

            worker.onmessage = (e) => {
                if (solved) return;
                clearTimeout(timer);
                resolve(e.data);
                worker.terminate();
                solved = true;
            };

            worker.postMessage(code);
        });
    }
}

// --- 4.3 Rollback Manager (State Versioning) ---
class RollbackManager {
    constructor() {
        this.history = []; // Stack of { version, code, metrics }
        this.currentVersion = 0;
    }

    checkpoint(code, metrics) {
        this.history.push({
            version: this.currentVersion++,
            code: code,
            metrics: metrics,
            timestamp: Date.now()
        });
        // Keep last 10 versions
        if (this.history.length > 10) this.history.shift();
    }

    rollback() {
        if (this.history.length === 0) return null;
        const previous = this.history.pop();
        console.warn(`[Rollback] Reverting to version ${previous.version}`);
        return previous;
    }
}

// --- 4.4 Fitness Validator (Dynamic Validation) ---
class FitnessValidator {
    constructor() {
        this.baselineFPS = 60;
    }

    validate(metrics) {
        if (metrics.fps < 30) return { valid: false, reason: 'Performance Regression (FPS < 30)' };
        if (metrics.crashes > 0) return { valid: false, reason: 'Crash Detected during validation' };
        if (metrics.errors > 0) return { valid: false, reason: 'Runtime Errors Detected' };
        return { valid: true };
    }
}

// --- Main System ---
export class EvolutionSafetySystem {
    constructor() {
        this.guard = new MutationGuard();
        this.sandbox = new EvolutionSandbox();
        this.rollback = new RollbackManager();
        this.validator = new FitnessValidator();
    }

    /**
     * Evaluate a new code candidate safely
     * @param {string} code 
     * @returns {Promise<object>} result
     */
    async evaluate(code) {
        console.log('[Safety] Evaluating candidate...');

        // 1. Static Checks (Mutation Guard)
        const staticCheck = this.guard.check(code);
        if (!staticCheck.valid) {
            return { accepted: false, reason: staticCheck.reason };
        }

        // 2. Sandbox Execution (Runtime check)
        // Check for immediate crashes or infinite loops
        const sandboxResult = await this.sandbox.runCandidate(code, 500); // 500ms strict timeout
        if (!sandboxResult.success) {
            return { accepted: false, reason: `Sandbox Failure: ${sandboxResult.error}` };
        }

        // 3. (Mock) Run Fitness Validation on result
        // In real system, we'd deploy to a test kernel and measure.
        // Here we simulate metrics based on code content for demo.
        const mockMetrics = {
            fps: code.includes('slow') ? 10 : 60,
            crashes: 0,
            errors: 0
        };

        const fitness = this.validator.validate(mockMetrics);
        if (!fitness.valid) {
            return { accepted: false, reason: `Fitness Check Failed: ${fitness.reason}` };
        }

        // 4. Checkpoint & Accept
        this.rollback.checkpoint(code, mockMetrics);

        return { accepted: true, version: this.rollback.currentVersion };
    }

    // Recovery trigger
    emergencyRollback() {
        return this.rollback.rollback();
    }
}
