/**
 * MockAgentData - Generates realistic agent data for Glass Box demo.
 *
 * Uses hash-based deterministic generation so the same agent ID always
 * produces the same mock data, enabling consistent demos and testing.
 */
const MockAgentData = {
    /**
     * Goal templates for agent intent generation.
     * These represent common high-level objectives in the Geometry OS ecosystem.
     */
    goals: [
        'Optimize rendering pipeline',
        'Analyze user intent patterns',
        'Monitor substrate health',
        'Coordinate agent swarm',
        'Process visual telemetry',
        'Manage memory allocation',
        'Execute neural inference',
        'Synchronize distributed state',
        'Handle I/O operations',
        'Validate safety constraints'
    ],

    /**
     * Thought templates representing different types of cognitive operations.
     * Each has a text description and type (inference/action).
     */
    thoughtTemplates: [
        { text: 'Analyzing input data...', type: 'inference' },
        { text: 'Querying knowledge base', type: 'inference' },
        { text: 'Formulating response', type: 'inference' },
        { text: 'Executing action plan', type: 'action' },
        { text: 'Verifying result', type: 'action' },
        { text: 'Waiting for dependencies', type: 'inference' },
        { text: 'Broadcasting status update', type: 'action' },
        { text: 'Processing sensory input', type: 'inference' },
        { text: 'Updating internal model', type: 'inference' },
        { text: 'Initiating protocol sequence', type: 'action' },
        { text: 'Evaluating safety constraints', type: 'inference' },
        { text: 'Allocating resources', type: 'action' },
        { text: 'Parsing telemetry stream', type: 'inference' },
        { text: 'Coordinating with peers', type: 'action' },
        { text: 'Generating prediction', type: 'inference' }
    ],

    /**
     * Step templates for intent trajectory planning.
     * These represent the incremental steps agents take toward their goals.
     */
    stepTemplates: [
        'Initialize process',
        'Gather requirements',
        'Analyze constraints',
        'Generate candidates',
        'Evaluate options',
        'Select best path',
        'Execute plan',
        'Verify outcome',
        'Update knowledge base',
        'Report status',
        'Optimize parameters',
        'Schedule next operation'
    ],

    /**
     * Target agent names for communication simulation.
     */
    communicationTargets: [
        'agent-hypervisor',
        'agent-memory',
        'agent-cognitive',
        'agent-metabolic',
        'agent-substrate',
        'agent-vision',
        'agent-motor',
        'broadcast',
        'swarm-coordinator'
    ],

    /**
     * Communication types representing message categories.
     */
    communicationTypes: [
        'request',
        'response',
        'ack',
        'event',
        'notification',
        'query',
        'command'
    ],

    /**
     * Generate complete mock agent data for a given agent ID.
     *
     * @param {string} agentId - The agent identifier to generate data for
     * @returns {Object} Agent data object with thoughts, intent, metabolism, and communications
     */
    generate(agentId) {
        const hash = this._hashString(agentId);
        const now = new Date();

        return {
            thoughts: this._generateThoughts(hash, now),
            intent: this._generateIntent(hash),
            metabolism: this._generateMetabolism(hash),
            communications: this._generateCommunications(hash, agentId),
            pas: this.generatePAS(agentId)
        };
    },

    /**
     * Generate thought stream with timestamps.
     * Thoughts are generated in reverse chronological order (newest first).
     *
     * @param {number} hash - Hash value for deterministic generation
     * @param {Date} now - Current timestamp reference
     * @returns {Array} Array of thought objects with time, text, and type
     */
    _generateThoughts(hash, now) {
        const count = 3 + (hash % 5); // 3-7 thoughts
        const thoughts = [];

        for (let i = 0; i < count; i++) {
            const template = this.thoughtTemplates[(hash + i) % this.thoughtTemplates.length];
            // Generate timestamps going back from now
            const time = new Date(now.getTime() - (count - 1 - i) * 1000);
            thoughts.push({
                time: this._formatTime(time),
                text: template.text,
                type: template.type
            });
        }

        return thoughts;
    },

    /**
     * Generate intent map with goal and trajectory steps.
     *
     * @param {number} hash - Hash value for deterministic generation
     * @returns {Object} Intent object with goal and steps array
     */
    _generateIntent(hash) {
        const goal = this.goals[hash % this.goals.length];
        const stepCount = 3 + (hash % 4); // 3-6 steps
        const steps = [];

        // Calculate how many steps should be marked complete
        const completeCount = hash % (stepCount + 1);

        for (let i = 0; i < stepCount; i++) {
            steps.push({
                text: this.stepTemplates[(hash + i) % this.stepTemplates.length],
                complete: i < completeCount
            });
        }

        return { goal, steps };
    },

    /**
     * Generate metabolic data with realistic metrics.
     *
     * @param {number} hash - Hash value for deterministic generation
     * @returns {Object} Metabolism object with ipc, memory, and activity
     */
    _generateMetabolism(hash) {
        // IPC: Instructions Per Cycle (0.4 - 0.9 is realistic range)
        const ipc = 0.4 + (hash % 100) / 200;

        // Memory: Used between 100-500 MB out of 512 MB total
        const memory = {
            used: 100 + (hash % 400),
            total: 512
        };

        // Activity: 0.2 - 1.0 (represents current load)
        const activity = 0.2 + (hash % 80) / 100;

        return { ipc, memory, activity };
    },

    /**
     * Generate communication log with inbound/outbound messages.
     *
     * @param {number} hash - Hash value for deterministic generation
     * @param {string} agentId - Current agent ID (excluded from targets)
     * @returns {Array} Array of communication objects
     */
    _generateCommunications(hash, agentId) {
        // Generate 1-3 communications
        const count = 1 + (hash % 3);
        const communications = [];

        for (let i = 0; i < count; i++) {
            const direction = (hash + i) % 2 === 0 ? 'out' : 'in';
            const targetIndex = (hash + i) % this.communicationTargets.length;
            const typeIndex = (hash + i + 1) % this.communicationTypes.length;

            communications.push({
                direction: direction,
                target: this.communicationTargets[targetIndex],
                type: this.communicationTypes[typeIndex]
            });
        }

        return communications;
    },

    /**
     * Generate PAS (Pixel Alignment Score) for an agent.
     * Returns a value between 0.3 and 1.0 based on agent ID hash.
     *
     * @param {string} agentId - The agent identifier to generate PAS for
     * @returns {number} PAS score between 0.3 and 1.0
     */
    generatePAS(agentId) {
        const hash = this._hashString(agentId);
        // Generate PAS between 0.3 and 1.0
        return 0.3 + (hash % 70) / 100;
    },

    /**
     * Convert a Date object to HH:MM:SS format string.
     *
     * @param {Date} date - Date object to format
     * @returns {string} Formatted time string
     */
    _formatTime(date) {
        const hours = String(date.getHours()).padStart(2, '0');
        const minutes = String(date.getMinutes()).padStart(2, '0');
        const seconds = String(date.getSeconds()).padStart(2, '0');
        return `${hours}:${minutes}:${seconds}`;
    },

    /**
     * Simple string hash function for deterministic generation.
     * Uses DJB2 algorithm variant.
     *
     * @param {string} str - String to hash
     * @returns {number} Non-negative hash value
     */
    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            const char = str.charCodeAt(i);
            hash = ((hash << 5) - hash) + char;
            hash = hash & hash; // Convert to 32-bit integer
        }
        return Math.abs(hash);
    }
};

// Export for different environments
if (typeof window !== 'undefined') {
    window.MockAgentData = MockAgentData;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MockAgentData };
}
