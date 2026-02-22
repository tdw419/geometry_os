/**
 * Geometry OS: Certification Runner
 *
 * Event-driven orchestrator for running certification tests.
 * Emits progress events for UI updates, handles interactive prompts.
 */

(function() {
    'use strict';

    class CertificationRunner {
        constructor(options = {}) {
            this.options = {
                timeout: options.timeout || 30000,
                stopOnFail: options.stopOnFail || false,
                ...options
            };

            this.results = [];
            this.running = false;
            this.currentTest = null;
            this.listeners = {};
        }

        /**
         * Subscribe to events
         */
        on(event, callback) {
            if (!this.listeners[event]) this.listeners[event] = [];
            this.listeners[event].push(callback);
            return () => this.off(event, callback);
        }

        /**
         * Unsubscribe from events
         */
        off(event, callback) {
            if (!this.listeners[event]) return;
            this.listeners[event] = this.listeners[event].filter(cb => cb !== callback);
        }

        /**
         * Emit an event
         */
        emit(event, data) {
            const listeners = this.listeners[event] || [];
            listeners.forEach(cb => cb(data));

            // Also dispatch as DOM event for cross-component communication
            window.dispatchEvent(new CustomEvent(`certification:${event}`, { detail: data }));
        }

        /**
         * Run a single test
         */
        async runTest(testId) {
            const test = CertificationTests.get(testId);
            if (!test) {
                return { success: false, details: `Test '${testId}' not found` };
            }

            this.currentTest = test;
            this.emit('test:start', { testId, test });

            const startTime = Date.now();

            try {
                // Run with timeout
                const result = await Promise.race([
                    test.run(this),
                    new Promise((_, reject) =>
                        setTimeout(() => reject(new Error('Test timeout')), test.timeout || this.options.timeout)
                    )
                ]);

                const duration = Date.now() - startTime;
                const finalResult = {
                    id: testId,
                    name: test.name,
                    level: test.level,
                    success: result.success,
                    details: result.details,
                    duration: duration,
                    data: result.data,
                    timestamp: new Date().toISOString()
                };

                this.results.push(finalResult);
                this.emit('test:complete', finalResult);

                return finalResult;

            } catch (error) {
                const finalResult = {
                    id: testId,
                    name: test.name,
                    level: test.level,
                    success: false,
                    details: `Error: ${error.message}`,
                    duration: Date.now() - startTime,
                    timestamp: new Date().toISOString()
                };

                this.results.push(finalResult);
                this.emit('test:error', { testId, error, result: finalResult });

                return finalResult;
            } finally {
                this.currentTest = null;
            }
        }

        /**
         * Run all tests for a specific level
         */
        async runLevel(level) {
            if (this.running) {
                this.emit('error', { message: 'Runner already in progress' });
                return [];
            }

            this.running = true;
            this.results = [];

            const tests = CertificationTests.getByLevel(level);
            this.emit('level:start', { level, testCount: tests.length });

            for (const test of tests) {
                this.emit('progress', {
                    current: tests.indexOf(test) + 1,
                    total: tests.length,
                    testId: test.id,
                    testName: test.name
                });

                const result = await this.runTest(test.id);

                if (!result.success && this.options.stopOnFail) {
                    this.emit('level:stopped', { level, reason: 'Test failed, stopOnFail enabled' });
                    break;
                }
            }

            const summary = this.getSummary();
            this.emit('level:complete', { level, summary });
            this.running = false;

            return this.results;
        }

        /**
         * Run all certification tests (levels 1-3)
         */
        async runAll() {
            if (this.running) {
                this.emit('error', { message: 'Runner already in progress' });
                return [];
            }

            this.running = true;
            this.results = [];

            const allTests = CertificationTests.getAll();
            this.emit('suite:start', { testCount: allTests.length });

            // Run by level for logical ordering
            for (let level = 1; level <= 3; level++) {
                const tests = CertificationTests.getByLevel(level);
                this.emit('level:start', { level, testCount: tests.length });

                for (const test of tests) {
                    this.emit('progress', {
                        current: this.results.length + 1,
                        total: allTests.length,
                        level: level,
                        testId: test.id,
                        testName: test.name
                    });

                    const result = await this.runTest(test.id);

                    if (!result.success && this.options.stopOnFail) {
                        this.emit('suite:stopped', { reason: 'Test failed, stopOnFail enabled' });
                        this.running = false;
                        return this.results;
                    }
                }

                this.emit('level:complete', { level, summary: this.getSummary(level) });
            }

            const summary = this.getSummary();
            this.emit('suite:complete', { summary });
            this.running = false;

            return this.results;
        }

        /**
         * Get summary of results
         */
        getSummary(level = null) {
            const results = level
                ? this.results.filter(r => r.level === level)
                : this.results;

            const passed = results.filter(r => r.success).length;
            const total = results.length;

            return {
                passed,
                failed: total - passed,
                total,
                percentage: total > 0 ? Math.round((passed / total) * 100) : 0,
                grade: this.calculateGrade(passed, total)
            };
        }

        /**
         * Calculate letter grade
         */
        calculateGrade(passed, total) {
            if (total === 0) return 'N/A';
            const pct = (passed / total) * 100;
            if (pct >= 95) return 'A';
            if (pct >= 85) return 'B';
            if (pct >= 70) return 'C';
            if (pct >= 50) return 'D';
            return 'F';
        }

        /**
         * Clear results
         */
        reset() {
            this.results = [];
            this.currentTest = null;
            this.emit('reset', {});
        }

        /**
         * Respond to an interactive prompt (called by UI or CLI)
         */
        respond(testId, success, details = '') {
            window.dispatchEvent(new CustomEvent('certification:response', {
                detail: { testId, success, details }
            }));
        }
    }

    // Export
    window.CertificationRunner = CertificationRunner;

    console.log('%c[CertificationRunner] Class loaded', 'color: #00ffcc');
})();
