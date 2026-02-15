/**
 * PM Autonomous Tools for WebMCP
 *
 * Provides tools for AI PM analysis and autonomous deployment.
 *
 * Tools:
 *   94. pm_analyze - Get improvement recommendations from AI PM
 *   95. pm_analyze_and_deploy - Analyze and auto-deploy as cartridge
 *
 * @version 1.0.0
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

        console.log('PMAutonomousTools: Registered 2 WebMCP tools');
    }
}

// Export for ES modules
if (typeof window !== 'undefined') {
    window.PMAutonomousTools = PMAutonomousTools;
}

export { PMAutonomousTools };
