/**
 * Tests for Task Graph HUD Renderer
 *
 * Run in browser by including this file after visual_debug_overlay.js
 * or via Node.js with: node tests/test_task_graph_renderer.js
 */

(function() {
    'use strict';

    // Simple test framework for browser/Node compatibility
    const results = { passed: 0, failed: 0, tests: [] };

    function describe(name, fn) {
        console.log(`\n=== ${name} ===`);
        fn();
    }

    function test(name, fn) {
        try {
            fn();
            results.passed++;
            results.tests.push({ name, status: 'PASS' });
            console.log(`  PASS: ${name}`);
        } catch (e) {
            results.failed++;
            results.tests.push({ name, status: 'FAIL', error: e.message });
            console.log(`  FAIL: ${name}`);
            console.log(`        ${e.message}`);
        }
    }

    function expect(actual) {
        return {
            toBe(expected) {
                if (actual !== expected) {
                    throw new Error(`Expected ${expected} but got ${actual}`);
                }
            },
            toEqual(expected) {
                if (JSON.stringify(actual) !== JSON.stringify(expected)) {
                    throw new Error(`Expected ${JSON.stringify(expected)} but got ${JSON.stringify(actual)}`);
                }
            },
            toBeDefined() {
                if (actual === undefined) {
                    throw new Error('Expected value to be defined');
                }
            },
            toBeGreaterThan(expected) {
                if (actual <= expected) {
                    throw new Error(`Expected ${actual} to be greater than ${expected}`);
                }
            }
        };
    }

    // Test suite
    describe('TaskGraphRenderer', () => {
        let overlay;

        // Setup
        if (typeof VisualDebugOverlay !== 'undefined') {
            overlay = new VisualDebugOverlay();
        } else {
            // Mock for Node.js testing
            overlay = {
                taskDag: {
                    tasks: {},
                    activeFlows: [],
                    summary: null
                },
                processTaskDagUpdate: function(update) {
                    if (!update || !update.task_id) return;
                    const taskId = update.task_id;
                    const previousStatus = this.taskDag.tasks[taskId]?.status;
                    this.taskDag.tasks[taskId] = {
                        ...this.taskDag.tasks[taskId],
                        ...update,
                        lastUpdate: Date.now()
                    };
                    if (update.assigned_to && previousStatus !== update.status) {
                        this._createTaskFlow(taskId, update);
                    }
                },
                _createTaskFlow: function(taskId, update) {
                    const flow = {
                        id: `${taskId}-${Date.now()}`,
                        taskId: taskId,
                        from: 'coordinator',
                        to: update.assigned_to,
                        progress: 0,
                        startTime: Date.now(),
                        color: this._getTaskStatusColor(update.status)
                    };
                    this.taskDag.activeFlows.push(flow);
                },
                _getTaskStatusColor: function(status) {
                    const colors = {
                        'pending': '#ffaa00',
                        'assigned': '#00aaff',
                        'completed': '#44ff44',
                        'failed': '#ff4444',
                        'retry': '#ff8800'
                    };
                    return colors[status] || '#888888';
                }
            };
        }

        test('initializes with taskDag state', () => {
            expect(overlay.taskDag).toBeDefined();
            expect(overlay.taskDag.tasks).toEqual({});
            expect(overlay.taskDag.activeFlows).toEqual([]);
        });

        test('processTaskDagUpdate adds task', () => {
            const update = {
                task_id: 'task-001',
                status: 'pending',
                task_type: 'render_pixel'
            };

            overlay.processTaskDagUpdate(update);

            expect(overlay.taskDag.tasks['task-001']).toBeDefined();
            expect(overlay.taskDag.tasks['task-001'].status).toBe('pending');
        });

        test('processTaskDagUpdate updates existing task', () => {
            // First update
            overlay.processTaskDagUpdate({
                task_id: 'task-002',
                status: 'pending',
                task_type: 'compile'
            });

            // Second update
            overlay.processTaskDagUpdate({
                task_id: 'task-002',
                status: 'assigned',
                assigned_to: 'worker-001'
            });

            expect(overlay.taskDag.tasks['task-002'].status).toBe('assigned');
            expect(overlay.taskDag.tasks['task-002'].assigned_to).toBe('worker-001');
            expect(overlay.taskDag.tasks['task-002'].task_type).toBe('compile');
        });

        test('_getTaskStatusColor returns correct colors', () => {
            expect(overlay._getTaskStatusColor('pending')).toBe('#ffaa00');
            expect(overlay._getTaskStatusColor('assigned')).toBe('#00aaff');
            expect(overlay._getTaskStatusColor('completed')).toBe('#44ff44');
            expect(overlay._getTaskStatusColor('failed')).toBe('#ff4444');
            expect(overlay._getTaskStatusColor('retry')).toBe('#ff8800');
        });

        test('_getTaskStatusColor returns default for unknown status', () => {
            expect(overlay._getTaskStatusColor('unknown')).toBe('#888888');
            expect(overlay._getTaskStatusColor(null)).toBe('#888888');
        });

        test('_createTaskFlow creates flow animation', () => {
            const update = {
                task_id: 'task-003',
                status: 'assigned',
                assigned_to: 'worker-002'
            };

            overlay.processTaskDagUpdate(update);

            // Check that a flow was created
            expect(overlay.taskDag.activeFlows.length).toBeGreaterThan(0);
            const flow = overlay.taskDag.activeFlows[overlay.taskDag.activeFlows.length - 1];
            expect(flow.taskId).toBe('task-003');
            expect(flow.to).toBe('worker-002');
            expect(flow.color).toBe('#00aaff');
        });

        test('processTaskDagUpdate handles null update', () => {
            const prevCount = Object.keys(overlay.taskDag.tasks).length;
            overlay.processTaskDagUpdate(null);
            expect(Object.keys(overlay.taskDag.tasks).length).toBe(prevCount);
        });

        test('processTaskDagUpdate handles update without task_id', () => {
            const prevCount = Object.keys(overlay.taskDag.tasks).length;
            overlay.processTaskDagUpdate({ status: 'pending' });
            expect(Object.keys(overlay.taskDag.tasks).length).toBe(prevCount);
        });
    });

    // Summary
    console.log('\n=== Test Summary ===');
    console.log(`Passed: ${results.passed}`);
    console.log(`Failed: ${results.failed}`);
    console.log(`Total: ${results.passed + results.failed}`);

    // Export results for programmatic access
    if (typeof module !== 'undefined' && module.exports) {
        module.exports = results;
    } else if (typeof window !== 'undefined') {
        window.testTaskGraphRendererResults = results;
    }
})();
