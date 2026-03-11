/**
 * AI Project Management WebMCP Tools
 * ============================================================
 *
 * Exposes AI PM capabilities as WebMCP tools for visual development.
 * AI agents can manage their own development process through these tools.
 *
 * Tools:
 *   31. pm_get_roadmap      - Get current roadmap status
 *   32. pm_get_phases       - List all phases with status
 *   33. pm_get_tasks        - Get tasks for a phase
 *   34. pm_update_task      - Update task status
 *   35. pm_create_task      - Create new task
 *
 * Integration with AI PM Backend:
 *   - HTTP bridge to ai_project_management Python server
 *   - Falls back to local state management if backend unavailable
 *
 * @version 1.0.0
 * @phase Phase M: AI PM + WebMCP Integration
 * @date 2026-02-14
 */

/**
 * AI Project Management Tools for WebMCP
 */
class PMTools {

    #bridge = null;
    #baseUrl = 'http://localhost:8765';
    #localState = null;
    #connected = false;

    constructor(bridge) {
        this.#bridge = bridge;
        this.#localState = this.#createLocalState();
    }

    /**
     * Create local fallback state
     */
    #createLocalState() {
        return {
            roadmap: {
                name: 'Geometry OS',
                version: '2026.1',
                currentPhase: 'L',
                totalPhases: 12,
                lastUpdated: new Date().toISOString()
            },
            phases: [
                { id: 'A', name: 'WebMCP Core', status: 'complete', progress: 100 },
                { id: 'B', name: 'Hilbert Mapping', status: 'complete', progress: 100 },
                { id: 'C', name: 'WGSL Evolution', status: 'complete', progress: 100 },
                { id: 'D', name: 'A2A Protocol', status: 'complete', progress: 100 },
                { id: 'E', name: 'WebMCP Reliability', status: 'complete', progress: 100 },
                { id: 'F', name: 'AI Visual Builder', status: 'complete', progress: 100 },
                { id: 'G', name: 'Performance', status: 'complete', progress: 100 },
                { id: 'H', name: 'Testing', status: 'complete', progress: 100 },
                { id: 'J', name: 'Neural IDE', status: 'complete', progress: 100 },
                { id: 'K', name: 'Neural Kernel', status: 'complete', progress: 100 },
                { id: 'L', name: 'Autonomous Operator', status: 'complete', progress: 100 },
                { id: 'M', name: 'AI PM Integration', status: 'in_progress', progress: 25 }
            ],
            tasks: {
                'M': [
                    { id: 'M-1', name: 'Create pm_tools.js', status: 'complete', priority: 'high' },
                    { id: 'M-2', name: 'Add WebMCP tool registrations', status: 'in_progress', priority: 'high' },
                    { id: 'M-3', name: 'Create test page', status: 'pending', priority: 'medium' },
                    { id: 'M-4', name: 'Integrate with Python backend', status: 'pending', priority: 'low' }
                ]
            }
        };
    }

    /**
     * Check backend connectivity
     */
    async #checkConnection() {
        try {
            const response = await fetch(`${this.#baseUrl}/health`, {
                method: 'GET',
                signal: AbortSignal.timeout(1000)
            });
            this.#connected = response.ok;
            return this.#connected;
        } catch {
            this.#connected = false;
            return false;
        }
    }

    /**
     * Call backend API with fallback to local state
     */
    async #callApi(endpoint, method = 'GET', body = null) {
        // Try backend first
        if (await this.#checkConnection()) {
            try {
                const options = {
                    method,
                    headers: { 'Content-Type': 'application/json' }
                };
                if (body) {
                    options.body = JSON.stringify(body);
                }
                const response = await fetch(`${this.#baseUrl}${endpoint}`, options);
                if (response.ok) {
                    return await response.json();
                }
            } catch (e) {
                console.warn('PM API call failed, using local state:', e);
            }
        }
        return null; // Fall through to local handling
    }

    /**
     * Tool 31: pm_get_roadmap
     * Get current roadmap status and overview
     */
    async pm_get_roadmap(params = {}) {
        const backendResult = await this.#callApi('/api/roadmap');
        if (backendResult) {
            return backendResult;
        }

        // Local fallback
        const roadmap = this.#localState.roadmap;
        const phases = this.#localState.phases;
        const completed = phases.filter(p => p.status === 'complete').length;

        return {
            success: true,
            roadmap: {
                name: roadmap.name,
                version: roadmap.version,
                currentPhase: roadmap.currentPhase,
                totalPhases: roadmap.totalPhases,
                completedPhases: completed,
                progress: Math.round((completed / roadmap.totalPhases) * 100),
                lastUpdated: roadmap.lastUpdated
            },
            summary: {
                complete: completed,
                inProgress: phases.filter(p => p.status === 'in_progress').length,
                pending: phases.filter(p => p.status === 'pending').length
            }
        };
    }

    /**
     * Tool 32: pm_get_phases
     * List all phases with their status
     */
    async pm_get_phases(params = {}) {
        const backendResult = await this.#callApi('/api/phases');
        if (backendResult) {
            return backendResult;
        }

        // Local fallback
        const phases = this.#localState.phases;

        // Support filtering
        let filtered = phases;
        if (params.status) {
            filtered = phases.filter(p => p.status === params.status);
        }

        return {
            success: true,
            phases: filtered,
            total: phases.length,
            filtered: filtered.length
        };
    }

    /**
     * Tool 33: pm_get_tasks
     * Get tasks for a specific phase
     */
    async pm_get_tasks(params = {}) {
        const phaseId = params.phase_id;
        if (!phaseId) {
            return {
                success: false,
                error: 'phase_id is required'
            };
        }

        const backendResult = await this.#callApi(`/api/phases/${phaseId}/tasks`);
        if (backendResult) {
            return backendResult;
        }

        // Local fallback
        const tasks = this.#localState.tasks[phaseId] || [];

        // Support filtering
        let filtered = tasks;
        if (params.status) {
            filtered = tasks.filter(t => t.status === params.status);
        }
        if (params.priority) {
            filtered = filtered.filter(t => t.priority === params.priority);
        }

        return {
            success: true,
            phase_id: phaseId,
            tasks: filtered,
            total: tasks.length,
            filtered: filtered.length,
            summary: {
                complete: tasks.filter(t => t.status === 'complete').length,
                inProgress: tasks.filter(t => t.status === 'in_progress').length,
                pending: tasks.filter(t => t.status === 'pending').length
            }
        };
    }

    /**
     * Tool 34: pm_update_task
     * Update task status
     */
    async pm_update_task(params = {}) {
        const { task_id, status, notes } = params;

        if (!task_id) {
            return {
                success: false,
                error: 'task_id is required'
            };
        }

        if (!status) {
            return {
                success: false,
                error: 'status is required'
            };
        }

        const validStatuses = ['pending', 'in_progress', 'complete', 'blocked'];
        if (!validStatuses.includes(status)) {
            return {
                success: false,
                error: `Invalid status. Must be one of: ${validStatuses.join(', ')}`
            };
        }

        const backendResult = await this.#callApi(`/api/tasks/${task_id}`, 'PATCH', { status, notes });
        if (backendResult) {
            return backendResult;
        }

        // Local fallback - find and update task
        const phaseId = task_id.split('-')[0];
        const tasks = this.#localState.tasks[phaseId];

        if (!tasks) {
            return {
                success: false,
                error: `Phase ${phaseId} not found`
            };
        }

        const task = tasks.find(t => t.id === task_id);
        if (!task) {
            return {
                success: false,
                error: `Task ${task_id} not found`
            };
        }

        const previousStatus = task.status;
        task.status = status;
        if (notes) {
            task.notes = notes;
        }
        task.updatedAt = new Date().toISOString();

        return {
            success: true,
            task: task,
            previousStatus: previousStatus,
            message: `Task ${task_id} updated from ${previousStatus} to ${status}`
        };
    }

    /**
     * Tool 35: pm_create_task
     * Create a new task
     */
    async pm_create_task(params = {}) {
        const { phase_id, name, priority = 'medium', description } = params;

        if (!phase_id) {
            return {
                success: false,
                error: 'phase_id is required'
            };
        }

        if (!name) {
            return {
                success: false,
                error: 'name is required'
            };
        }

        const validPriorities = ['low', 'medium', 'high', 'critical'];
        if (!validPriorities.includes(priority)) {
            return {
                success: false,
                error: `Invalid priority. Must be one of: ${validPriorities.join(', ')}`
            };
        }

        const backendResult = await this.#callApi('/api/tasks', 'POST', {
            phase_id, name, priority, description
        });
        if (backendResult) {
            return backendResult;
        }

        // Local fallback - create task
        if (!this.#localState.tasks[phase_id]) {
            this.#localState.tasks[phase_id] = [];
        }

        const tasks = this.#localState.tasks[phase_id];
        const taskNum = tasks.length + 1;
        const taskId = `${phase_id}-${taskNum}`;

        const newTask = {
            id: taskId,
            name,
            status: 'pending',
            priority,
            description: description || '',
            createdAt: new Date().toISOString()
        };

        tasks.push(newTask);

        return {
            success: true,
            task: newTask,
            message: `Task ${taskId} created successfully`
        };
    }

    /**
     * Register all PM tools with WebMCP bridge
     */
    registerTools(bridge) {
        // Tool 31: pm_get_roadmap
        bridge.registerTool('pm_get_roadmap', {
            description: 'Get current roadmap status and overview',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            handler: async (params) => this.pm_get_roadmap(params)
        });

        // Tool 32: pm_get_phases
        bridge.registerTool('pm_get_phases', {
            description: 'List all phases with their status',
            inputSchema: {
                type: 'object',
                properties: {
                    status: {
                        type: 'string',
                        enum: ['complete', 'in_progress', 'pending'],
                        description: 'Filter by status'
                    }
                }
            },
            handler: async (params) => this.pm_get_phases(params)
        });

        // Tool 33: pm_get_tasks
        bridge.registerTool('pm_get_tasks', {
            description: 'Get tasks for a specific phase',
            inputSchema: {
                type: 'object',
                properties: {
                    phase_id: {
                        type: 'string',
                        description: 'Phase ID (e.g., "M")'
                    },
                    status: {
                        type: 'string',
                        enum: ['pending', 'in_progress', 'complete', 'blocked']
                    },
                    priority: {
                        type: 'string',
                        enum: ['low', 'medium', 'high', 'critical']
                    }
                },
                required: ['phase_id']
            },
            handler: async (params) => this.pm_get_tasks(params)
        });

        // Tool 34: pm_update_task
        bridge.registerTool('pm_update_task', {
            description: 'Update task status',
            inputSchema: {
                type: 'object',
                properties: {
                    task_id: {
                        type: 'string',
                        description: 'Task ID (e.g., "M-1")'
                    },
                    status: {
                        type: 'string',
                        enum: ['pending', 'in_progress', 'complete', 'blocked'],
                        description: 'New status'
                    },
                    notes: {
                        type: 'string',
                        description: 'Optional notes about the update'
                    }
                },
                required: ['task_id', 'status']
            },
            handler: async (params) => this.pm_update_task(params)
        });

        // Tool 35: pm_create_task
        bridge.registerTool('pm_create_task', {
            description: 'Create a new task in a phase',
            inputSchema: {
                type: 'object',
                properties: {
                    phase_id: {
                        type: 'string',
                        description: 'Phase ID (e.g., "M")'
                    },
                    name: {
                        type: 'string',
                        description: 'Task name'
                    },
                    priority: {
                        type: 'string',
                        enum: ['low', 'medium', 'high', 'critical'],
                        default: 'medium'
                    },
                    description: {
                        type: 'string',
                        description: 'Task description'
                    }
                },
                required: ['phase_id', 'name']
            },
            handler: async (params) => this.pm_create_task(params)
        });

        console.log('PMTools: Registered 5 WebMCP tools');
    }
}

// Export for ES modules
if (typeof window !== 'undefined') {
    window.PMTools = PMTools;
}

export { PMTools };
