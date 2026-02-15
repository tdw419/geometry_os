/**
 * PM Autonomous Tools for WebMCP
 *
 * Provides tools for AI PM analysis and autonomous deployment.
 *
 * Tools:
 *   94. pm_analyze - Get improvement recommendations from AI PM
 *   95. pm_analyze_and_deploy - Analyze and auto-deploy as cartridge
 *   96. pm_service_status - Get status of autonomous improvement service
 *   97. pm_service_start - Start autonomous improvement service
 *   98. pm_service_stop - Stop autonomous improvement service
 *
 * @version 1.1.0
 * @phase Phase O: AI PM Integration
 */

/**
 * PM Autonomous Tools
 */
class PMAutonomousTools {

    #bridge = null;
    #analysisServerUrl = 'http://localhost:8769';

    constructor(bridge) {
        this.#bridge = bridge;
    }

    /**
     * Tool 94: pm_analyze
     * Get improvement recommendations from AI PM
     */
    async pm_analyze(params = {}) {
        const { scope = 'recent', max_recommendations = 10 } = params;

        try {
            const response = await fetch(`${this.#analysisServerUrl}/pm/analyze`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    scope,
                    max_recommendations
                })
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();
            return result;

        } catch (e) {
            // Fallback to mock
            console.warn('pm_analyze: Server not available, using mock:', e.message);
            return this.#mockAnalyze(max_recommendations);
        }
    }

    /**
     * Tool 95: pm_analyze_and_deploy
     * Analyze codebase and auto-deploy improvement cartridge
     */
    async pm_analyze_and_deploy(params = {}) {
        const {
            scope = 'recent',
            max_recommendations = 5,
            auto_deploy = true,
            cartridge_name = `auto_improvement_${Date.now()}`,
            location = { x: 0, y: 0 }
        } = params;

        try {
            const response = await fetch(`${this.#analysisServerUrl}/pm/analyze_and_deploy`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    scope,
                    max_recommendations,
                    auto_deploy,
                    cartridge_name,
                    location
                })
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();

            // Log to BuilderPanel if available
            if (this.#bridge?.builderPanel && result.success) {
                if (result.deployed) {
                    this.#bridge.builderPanel.logAction(
                        `Auto-deployed cartridge: ${cartridge_name}`,
                        'success'
                    );
                } else {
                    this.#bridge.builderPanel.logAction(
                        `Analysis complete: ${result.recommendations?.length || 0} recommendations`,
                        'info'
                    );
                }
            }

            return result;

        } catch (e) {
            console.warn('pm_analyze_and_deploy: Server not available:', e.message);
            return {
                success: false,
                error: e.message,
                mock: true
            };
        }
    }

    #mockAnalyze(maxRecs) {
        return {
            success: true,
            recommendations: [
                {
                    id: "mock-optimize-1",
                    type: "optimize",
                    priority: "MEDIUM",
                    description: "Mock: Optimize Hilbert curve lookup",
                    target_path: "systems/pixel_compiler/pixelrts_v2_core.py",
                    estimated_impact: 0.8,
                    confidence: 0.7
                }
            ].slice(0, maxRecs),
            count: Math.min(1, maxRecs),
            mock: true
        };
    }

    /**
     * Tool 96: pm_service_status
     * Get status of autonomous improvement service
     */
    async pm_service_status() {
        try {
            const response = await fetch(`${this.#analysisServerUrl}/service/status`);
            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }
            return await response.json();
        } catch (e) {
            return {
                success: false,
                error: e.message,
                mock: true,
                running: false
            };
        }
    }

    /**
     * Tool 97: pm_service_start
     * Start the autonomous improvement service
     */
    async pm_service_start(params = {}) {
        const { interval_seconds = 3600, auto_deploy = false, confidence_threshold = 0.8 } = params;

        try {
            const response = await fetch(`${this.#analysisServerUrl}/service/start`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    interval_seconds,
                    auto_deploy,
                    confidence_threshold
                })
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();

            if (this.#bridge?.builderPanel) {
                this.#bridge.builderPanel.logAction(
                    `Autonomous improvement service started (interval: ${interval_seconds}s)`,
                    'success'
                );
            }

            return result;

        } catch (e) {
            return { success: false, error: e.message };
        }
    }

    /**
     * Tool 98: pm_service_stop
     * Stop the autonomous improvement service
     */
    async pm_service_stop() {
        try {
            const response = await fetch(`${this.#analysisServerUrl}/service/stop`, {
                method: 'POST'
            });

            if (!response.ok) {
                return { success: false, error: `Server error: ${response.status}` };
            }

            const result = await response.json();

            if (this.#bridge?.builderPanel) {
                this.#bridge.builderPanel.logAction(
                    'Autonomous improvement service stopped',
                    'info'
                );
            }

            return result;

        } catch (e) {
            return { success: false, error: e.message };
        }
    }

    /**
     * Register all PM autonomous tools with WebMCP bridge
     */
    registerTools(bridge) {
        // Tool 94: pm_analyze
        bridge.registerTool('pm_analyze', {
            description: 'Analyze codebase and get AI PM improvement recommendations',
            inputSchema: {
                type: 'object',
                properties: {
                    scope: {
                        type: 'string',
                        enum: ['recent', 'full', 'failed'],
                        description: 'Analysis scope'
                    },
                    max_recommendations: {
                        type: 'number',
                        description: 'Maximum recommendations to return (default: 10)'
                    }
                }
            },
            handler: async (params) => this.pm_analyze(params)
        });

        // Tool 95: pm_analyze_and_deploy
        bridge.registerTool('pm_analyze_and_deploy', {
            description: 'Analyze codebase and automatically deploy improvement cartridge',
            inputSchema: {
                type: 'object',
                properties: {
                    scope: {
                        type: 'string',
                        enum: ['recent', 'full', 'failed'],
                        description: 'Analysis scope'
                    },
                    max_recommendations: {
                        type: 'number',
                        description: 'Maximum recommendations (default: 5)'
                    },
                    auto_deploy: {
                        type: 'boolean',
                        description: 'Automatically deploy cartridge (default: true)'
                    },
                    cartridge_name: {
                        type: 'string',
                        description: 'Name for the generated cartridge'
                    },
                    location: {
                        type: 'object',
                        properties: {
                            x: { type: 'number' },
                            y: { type: 'number' }
                        },
                        description: 'Deploy location on Infinite Map'
                    }
                }
            },
            handler: async (params) => this.pm_analyze_and_deploy(params)
        });

        // Tool 96: pm_service_status
        bridge.registerTool('pm_service_status', {
            description: 'Get status of autonomous improvement service',
            inputSchema: { type: 'object', properties: {} },
            handler: async () => this.pm_service_status()
        });

        // Tool 97: pm_service_start
        bridge.registerTool('pm_service_start', {
            description: 'Start autonomous improvement service',
            inputSchema: {
                type: 'object',
                properties: {
                    interval_seconds: { type: 'number', description: 'Cycle interval (default: 3600)' },
                    auto_deploy: { type: 'boolean', description: 'Auto-deploy cartridges (default: false)' },
                    confidence_threshold: { type: 'number', description: 'Min confidence to deploy (default: 0.8)' }
                }
            },
            handler: async (params) => this.pm_service_start(params)
        });

        // Tool 98: pm_service_stop
        bridge.registerTool('pm_service_stop', {
            description: 'Stop autonomous improvement service',
            inputSchema: { type: 'object', properties: {} },
            handler: async () => this.pm_service_stop()
        });

        console.log('PMAutonomousTools: Registered 5 WebMCP tools');
    }
}

// Export for ES modules
if (typeof window !== 'undefined') {
    window.PMAutonomousTools = PMAutonomousTools;
}

export { PMAutonomousTools };
