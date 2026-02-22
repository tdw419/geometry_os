/**
 * Geometry OS: Production Hardening
 * 
 * Provides Security, Reliability, and Observability layers for WebMCP.
 */

// --- I.1 Validation System ---

const SCHEMAS = {
    // Nav
    'navigate_map': {
        types: { x: 'number', y: 'number', zoom: 'number' }
    },
    'get_os_state': { types: {} }, // No params

    // Hypervisor
    'hypervisor_boot': {
        types: { kernel_url: 'string', memory_mb: 'number' },
        required: ['kernel_url']
    },
    'hypervisor_input': {
        types: { type: 'string', key: 'string', x: 'number', y: 'number', pressed: 'boolean', released: 'boolean' },
        required: ['type']
    },
    'hypervisor_frame': {
        types: { format: 'string' }
    },

    // Pixel
    'execute_pixel_program': {
        types: { program_id: 'string', max_cycles: 'number' },
        required: ['program_id']
    },

    // Evolution
    'trigger_evolution': {
        types: { generations: 'number', target_fitness: 'number' }
    },

    // Builder
    'builder_place_tile': {
        types: { x: 'number', y: 'number', type: 'string' },
        required: ['x', 'y', 'type']
    }
};

export class ValidationSystem {
    validate(toolName, params = {}) {
        const schema = SCHEMAS[toolName];
        if (!schema) {
            // Warn but allow un-schema'd tools for now (soft rollout)
            console.warn(`[Validation] No schema for tool: ${toolName}`);
            return true;
        }

        // Check Required
        if (schema.required) {
            for (const field of schema.required) {
                if (params[field] === undefined || params[field] === null) {
                    throw new Error(`[Validation] Missing required field '${field}' for tool '${toolName}'`);
                }
            }
        }

        // Check Types
        if (schema.types) {
            for (const [field, type] of Object.entries(schema.types)) {
                if (params[field] !== undefined) {
                    if (typeof params[field] !== type) {
                        throw new Error(`[Validation] Invalid type for '${field}'. Expected ${type}, got ${typeof params[field]}`);
                    }
                }
            }
        }

        // Simple Sanitization (Pattern check could be added here)
        return true;
    }
}

// --- I.2 Rate Limiting ---

export class RateLimiter {
    constructor() {
        // Simple fixed window counter
        // Map<ToolName, { count: number, resetTime: number }>
        this.limits = new Map();

        // Config: Max calls per minute
        this.config = {
            'default': 600, // 10/sec
            'hypervisor_frame': 3600, // 60/sec
            'navigate_map': 600,
            'trigger_evolution': 10 // heavy ops
        };
    }

    check(toolName) {
        const limit = this.config[toolName] || this.config['default'];
        const now = Date.now();
        const windowSize = 60000; // 1 min

        if (!this.limits.has(toolName)) {
            this.limits.set(toolName, { count: 0, resetTime: now + windowSize });
        }

        const stats = this.limits.get(toolName);

        // Reset window
        if (now > stats.resetTime) {
            stats.count = 0;
            stats.resetTime = now + windowSize;
        }

        if (stats.count >= limit) {
            console.warn(`[RateLimit] Blocked ${toolName} (${stats.count}/${limit})`);
            return false;
        }

        stats.count++;
        return true;
    }

    getRemaining(toolName) {
        const stats = this.limits.get(toolName);
        const limit = this.config[toolName] || this.config['default'];
        if (!stats) return limit;
        return Math.max(0, limit - stats.count);
    }
}

// --- I.3 Production Metrics ---

export class MetricsCollector {
    constructor() {
        // Map<ToolName, { count: number, errors: number, latencySum: number, maxLatency: number }>
        this.stats = new Map();
    }

    recordSuccess(toolName, durationMs) {
        if (!this.stats.has(toolName)) this.#init(toolName);

        const s = this.stats.get(toolName);
        s.count++;
        s.latencySum += durationMs;
        s.maxLatency = Math.max(s.maxLatency, durationMs);
    }

    recordError(toolName) {
        if (!this.stats.has(toolName)) this.#init(toolName);

        const s = this.stats.get(toolName);
        s.count++;
        s.errors++;
    }

    #init(toolName) {
        this.stats.set(toolName, { count: 0, errors: 0, latencySum: 0, maxLatency: 0 });
    }

    getReport() {
        const report = {};
        for (const [tool, stats] of this.stats) {
            report[tool] = {
                calls: stats.count,
                errors: stats.errors,
                errorRate: (stats.errors / stats.count).toFixed(4),
                avgLatency: stats.count > 0 ? (stats.latencySum / stats.count).toFixed(2) + 'ms' : '0ms',
                maxLatency: stats.maxLatency.toFixed(2) + 'ms'
            };
        }
        return report;
    }
}
