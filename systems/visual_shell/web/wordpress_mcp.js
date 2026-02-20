/**
 * WordPress WebMCP Server (Geometry OS Extension)
 * ============================================================
 *
 * "The District is the API — semantic tools for WordPress Zone."
 *
 * Exposes WordPress Zone capabilities as structured WebMCP tools
 * following the spec in ./apps/webmcp/docs/proposal.md
 *
 * Architecture:
 *   - Integrates with existing webmcp_bridge.js infrastructure
 *   - Communicates with ai-publisher.php backend
 *   - Emits telemetry to Visual Bridge for HUD visualization
 *
 * Core Tools:
 *   1. wp_publish_post       — Publish content to WordPress district
 *   2. wp_get_site_stats     — Get WordPress zone health and stats
 *   3. wp_list_posts         — List recent posts
 *   4. wp_get_categories     — Get available categories
 *
 * @version 1.0.0
 * @date 2026-02-20
 */

(function() {
    'use strict';

    // WordPress Zone Configuration
    const WP_CONFIG = {
        apiEndpoint: 'http://localhost:8080/ai-publisher.php',
        districtId: 'wordpress_zone',
        hilbertCoords: { x: 3200, y: 1200 },
        timeout: 10000
    };

    /**
     * Check if WebMCP is available
     */
    function isWebMCPAvailable() {
        if (!window.navigator.modelContext) {
            console.warn('🔌 WordPress WebMCP: navigator.modelContext not available. Chrome 146+ required.');
            return false;
        }
        return true;
    }

    /**
     * Emit telemetry to Visual Bridge
     */
    function emitTelemetry(type, data) {
        if (window.geometryOSApp && window.geometryOSApp.emitTelemetry) {
            window.geometryOSApp.emitTelemetry(type, {
                district_id: WP_CONFIG.districtId,
                ...data
            });
        }
        // Also try WebSocket bridge
        if (window.visualBridge && window.visualBridge.send) {
            window.visualBridge.send(JSON.stringify({
                type: type,
                district_id: WP_CONFIG.districtId,
                ...data
            }));
        }
    }

    /**
     * Fetch wrapper with timeout and error handling
     */
    async function wpFetch(action, payload = {}) {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), WP_CONFIG.timeout);

        try {
            const response = await fetch(WP_CONFIG.apiEndpoint, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ action, ...payload }),
                signal: controller.signal
            });

            clearTimeout(timeoutId);

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            return await response.json();
        } catch (error) {
            clearTimeout(timeoutId);
            if (error.name === 'AbortError') {
                throw new Error('WordPress API timeout');
            }
            throw error;
        }
    }

    /**
     * Register WordPress WebMCP Tools
     */
    function registerWordPressTools() {
        if (!isWebMCPAvailable()) return;

        console.log('🔌 WordPress WebMCP: Registering semantic tools...');

        const modelContext = window.navigator.modelContext;

        // Tool 1: Publish Post
        modelContext.registerTool({
            name: 'wp_publish_post',
            description: 'Publish a new post to the WordPress district. Creates content with title, body, and optional category.',
            inputSchema: {
                type: 'object',
                properties: {
                    title: {
                        type: 'string',
                        description: 'The post title'
                    },
                    content: {
                        type: 'string',
                        description: 'The post content (HTML or plain text)'
                    },
                    category: {
                        type: 'number',
                        description: 'Category ID (default: 1 for Uncategorized)'
                    },
                    status: {
                        type: 'string',
                        enum: ['publish', 'draft', 'pending'],
                        description: 'Post status (default: publish)'
                    }
                },
                required: ['title', 'content']
            },
            execute: async ({ title, content, category = 1, status = 'publish' }) => {
                try {
                    const result = await wpFetch('publish', {
                        title,
                        content,
                        category_id: category,
                        post_status: status
                    });

                    // Emit telemetry for HUD visualization
                    emitTelemetry('evolution_event', {
                        event_type: 'WEB_MCP_PUBLISH',
                        details: `AI published: "${title}"`,
                        post_id: result.post_id,
                        status: result.status
                    });

                    console.log(`🔌 WordPress WebMCP: Published post ${result.post_id}`);

                    return {
                        success: true,
                        post_id: result.post_id,
                        message: `Post "${title}" published successfully`,
                        edit_url: result.edit_url
                    };
                } catch (error) {
                    emitTelemetry('diagnostic_pulse', {
                        status: 'CRITICAL',
                        matched_pattern: 'WP_PUBLISH_FAILED',
                        error: error.message
                    });

                    return {
                        success: false,
                        error: error.message
                    };
                }
            }
        });

        // Tool 2: Get Site Stats
        modelContext.registerTool({
            name: 'wp_get_site_stats',
            description: 'Returns metadata and statistics about the WordPress district.',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            execute: async () => {
                try {
                    const stats = await wpFetch('get_stats');

                    emitTelemetry('diagnostic_pulse', {
                        status: 'HEALTHY',
                        matched_pattern: 'WP_STATS_RETRIEVED'
                    });

                    return {
                        success: true,
                        district: WP_CONFIG.districtId,
                        hilbert_coords: WP_CONFIG.hilbertCoords,
                        ...stats
                    };
                } catch (error) {
                    return {
                        success: false,
                        district: WP_CONFIG.districtId,
                        status: 'OFFLINE',
                        error: error.message
                    };
                }
            }
        });

        // Tool 3: List Posts
        modelContext.registerTool({
            name: 'wp_list_posts',
            description: 'List recent posts from the WordPress district.',
            inputSchema: {
                type: 'object',
                properties: {
                    limit: {
                        type: 'number',
                        description: 'Number of posts to retrieve (default: 10)'
                    },
                    status: {
                        type: 'string',
                        enum: ['publish', 'draft', 'any'],
                        description: 'Post status filter (default: publish)'
                    }
                }
            },
            execute: async ({ limit = 10, status = 'publish' }) => {
                try {
                    const posts = await wpFetch('list_posts', { limit, post_status: status });

                    return {
                        success: true,
                        count: posts.length,
                        posts: posts
                    };
                } catch (error) {
                    return {
                        success: false,
                        error: error.message
                    };
                }
            }
        });

        // Tool 4: Get Categories
        modelContext.registerTool({
            name: 'wp_get_categories',
            description: 'Get available post categories in the WordPress district.',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            execute: async () => {
                try {
                    const categories = await wpFetch('get_categories');

                    return {
                        success: true,
                        categories: categories
                    };
                } catch (error) {
                    return {
                        success: false,
                        error: error.message
                    };
                }
            }
        });

        // Tool 5: Health Check (for HUD integration)
        modelContext.registerTool({
            name: 'wp_health_check',
            description: 'Perform a health check on the WordPress district.',
            inputSchema: {
                type: 'object',
                properties: {}
            },
            execute: async () => {
                try {
                    const response = await fetch('http://localhost:8080/', {
                        method: 'HEAD',
                        signal: AbortSignal.timeout(5000)
                    });

                    const isHealthy = response.ok;

                    emitTelemetry('diagnostic_pulse', {
                        status: isHealthy ? 'HEALTHY' : 'DEGRADED',
                        matched_pattern: isHealthy ? 'WP_HEALTH_OK' : 'WP_HEALTH_DEGRADED'
                    });

                    return {
                        success: true,
                        district: WP_CONFIG.districtId,
                        status: isHealthy ? 'ONLINE' : 'DEGRADED',
                        http_status: response.status,
                        timestamp: Date.now()
                    };
                } catch (error) {
                    emitTelemetry('diagnostic_pulse', {
                        status: 'CRITICAL',
                        matched_pattern: 'WP_HEALTH_FAILED',
                        error: error.message
                    });

                    return {
                        success: false,
                        district: WP_CONFIG.districtId,
                        status: 'OFFLINE',
                        error: error.message
                    };
                }
            }
        });

        console.log('🔌 WordPress WebMCP: Registered 5 tools (wp_publish_post, wp_get_site_stats, wp_list_posts, wp_get_categories, wp_health_check)');
    }

    /**
     * Wait for Geometry OS to be ready, then register tools
     */
    function initialize() {
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => {
                // Small delay to ensure webmcp_bridge.js is loaded first
                setTimeout(registerWordPressTools, 100);
            });
        } else {
            setTimeout(registerWordPressTools, 100);
        }

        // Also listen for geometry-os-ready event
        window.addEventListener('geometry-os-ready', () => {
            console.log('🔌 WordPress WebMCP: Geometry OS ready, re-registering tools...');
            registerWordPressTools();
        });
    }

    // Initialize
    initialize();

    // Export for debugging
    window.WordPressMCP = {
        config: WP_CONFIG,
        registerTools: registerWordPressTools,
        emitTelemetry
    };

})();
