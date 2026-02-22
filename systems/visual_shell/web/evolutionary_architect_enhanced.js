/**
 * Geometry OS: Enhanced Evolutionary Architect (Phase 30.1)
 *
 * "The OS that builds itself"
 *
 * This module connects the Neural Substrate to the Infinite Map,
 * enabling autonomous evolution where the system tends to itself.
 *
 * @module evolutionary_architect_enhanced
 */

class EvolutionaryArchitectEnhanced {
    constructor(infiniteMap, options = {}) {
        this.map = infiniteMap;
        this.options = {
            evolutionInterval: 5000,      // Check every 5 seconds
            aiEndpoint: '/api/evolution/proposals',
            autoCorrect: true,             // Enable self-correction
            verbose: true,
            useOracle: true,               // Use TestStatusOracle
            ...options
        };

        // State
        this.isEvolutionActive = false;
        this.evolutionTimer = null;
        this.proposals = new Map();        // Pending architectural proposals
        this.genetics = new Map();         // Genetic code storage
        this.gardens = new Map();          // Test suite status

        // Oracle Integration
        this.oracle = typeof TestStatusOracle !== 'undefined' ? new TestStatusOracle() : null;
        if (this.oracle) {
            console.log('   🧪 Connected to Test Status Oracle');
        }

        // Metrics

        // Metrics
        this.metrics = {
            totalEvolutions: 0,
            autoCorrections: 0,
            structuresBuilt: 0,
            loopsCompleted: 0
        };

        console.log('🧬 EvolutionaryArchitectEnhanced initialized');
        console.log('   "The OS that builds itself"');
    }

    /**
     * Start the autonomous evolution loop
     */
    start() {
        if (this.isEvolutionActive) {
            console.log('⚠️  Evolution already active');
            return;
        }

        this.isEvolutionActive = true;
        console.log('');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('     AUTONOMOUS EVOLUTION LOOP STARTED                               ');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        // Start evolution loop
        this.evolutionTimer = setInterval(() => {
            this._runEvolutionCycle();
        }, this.options.evolutionInterval);

        // Initial cycle
        this._runEvolutionCycle();
    }

    /**
     * Stop the evolution loop
     */
    stop() {
        this.isEvolutionActive = false;
        if (this.evolutionTimer) {
            clearInterval(this.evolutionTimer);
            this.evolutionTimer = null;
        }

        console.log('');
        console.log('🛑 AUTONOMOUS EVOLUTION LOOP STOPPED');
        this._printMetrics();
        console.log('');
    }

    /**
     * Run a single evolution cycle
     * @private
     */
    async _runEvolutionCycle() {
        if (!this.isEvolutionActive) return;

        try {
            this.metrics.loopsCompleted++;

            // Phase 1: Observe - Check for code changes or AI proposals
            const proposals = await this._observeSystem();

            if (proposals.length === 0) {
                // No proposals, check for self-correction opportunities
                if (this.options.autoCorrect) {
                    await this._tendGardens();
                }
                return;
            }

            // Phase 2: Cognition - Process proposals through LLM
            for (const proposal of proposals) {
                await this._processProposal(proposal);
            }

            // Phase 3: Visualization - Render to map
            await this._renderProposals();

            // Phase 4: Validation - Check results
            await this._validateEvolution();

        } catch (error) {
            console.error('❌ Evolution cycle error:', error);
        }
    }

    /**
     * Phase 1: Observe the system for changes/opportunities
     * @private
     */
    async _observeSystem() {
        // In production, this would:
        // 1. Query CodebaseAnalyzerDaemon for changes
        // 2. Check AI backend for architectural proposals
        // 3. Monitor test failures (red gardens)

        const proposals = [];

        // Check for scaffolds that need evolution
        const builds = this.map.getLLMBuilds ? this.map.getLLMBuilds() : [];
        const scaffolds = builds.filter(b =>
            b.type === 'scaffold' &&
            b.metadata.status === 'building'
        );

        for (const scaffold of scaffolds) {
            proposals.push({
                type: 'evolve_scaffold',
                target: scaffold,
                priority: scaffold.metadata.priority || 'medium',
                metadata: scaffold.metadata
            });
        }

        // Check for failing tests (red gardens)
        if (this.options.autoCorrect) {
            const gardens = builds.filter(b => b.type === 'garden');
            for (const garden of gardens) {
                if (garden.metadata.status === 'failing') {
                    proposals.push({
                        type: 'tend_garden',
                        target: garden,
                        priority: 'high',
                        metadata: garden.metadata
                    });
                }
            }
        }

        return proposals;
    }

    /**
     * Phase 2: Process proposal through AI (LLM)
     * @private
     */
    async _processProposal(proposal) {
        const proposalId = `${proposal.type}_${Date.now()}`;

        if (this.options.verbose) {
            console.log(`🧠 Processing: ${proposal.type}`);
            console.log(`   Target: ${proposal.target.metadata.name || proposal.target.type}`);
        }

        let manifest;

        switch (proposal.type) {
            case 'evolve_scaffold':
                // LLM decides what to evolve the scaffold into
                manifest = await this._consultAI(proposal);
                break;

            case 'tend_garden':
                // Self-correction: fix failing tests
                manifest = await this._generateFix(proposal);
                break;

            default:
                console.warn(`Unknown proposal type: ${proposal.type}`);
                return;
        }

        if (manifest) {
            this.proposals.set(proposalId, manifest);
        }
    }

    /**
     * Consult AI for architectural decision
     * @private
     */
    async _consultAI(proposal) {
        // In production, this calls actual LLM API
        // For now, use deterministic logic

        const scaffold = proposal.target;
        const metadata = scaffold.metadata;

        // Determine evolution based on scaffold name/metadata
        let evolvedType = 'tower';
        let evolvedMetadata = { ...metadata, status: 'complete' };

        // Specific evolution rules
        if (metadata.name === 'PHASE_29_LINUX') {
            evolvedType = 'crystal';  // Linux becomes crystal (complete)
            evolvedMetadata.complexity = 0.95;
            evolvedMetadata.description = 'Alpine Linux GPU Boot (Complete)';
        } else if (metadata.name === 'SYSCALL_BRIDGE') {
            evolvedType = 'bridge';
            evolvedMetadata.status = 'complete';
        }

        return {
            action: 'evolve',
            x: scaffold.x,
            y: scaffold.y,
            fromType: 'scaffold',
            toType: evolvedType,
            metadata: evolvedMetadata
        };
    }

    /**
     * Generate fix for failing tests
     * @private
     */
    async _generateFix(proposal) {
        const garden = proposal.target;

        // In production, LLM analyzes test failure and generates fix
        // For now, mark as needing attention

        return {
            action: 'tend',
            x: garden.x,
            y: garden.y,
            type: 'garden',
            metadata: {
                ...garden.metadata,
                status: 'repairing',
                lastTended: Date.now()
            }
        };
    }

    /**
     * Phase 3: Render proposals to map
     * @private
     */
    async _renderProposals() {
        for (const [id, manifest] of this.proposals) {
            try {
                if (manifest.action === 'evolve') {
                    // Evolve scaffold to new structure
                    await this.map.writeTile(
                        manifest.x,
                        manifest.y,
                        manifest.toType,
                        manifest.metadata
                    );

                    this.metrics.structuresBuilt++;
                    this.metrics.totalEvolutions++;

                    if (this.options.verbose) {
                        console.log(`✨ Evolved: ${manifest.metadata.name}`);
                        console.log(`   ${manifest.fromType} → ${manifest.toType}`);
                    }

                } else if (manifest.action === 'tend') {
                    // Tend to failing garden
                    await this.map.writeTile(
                        manifest.x,
                        manifest.y,
                        manifest.type,
                        manifest.metadata
                    );

                    this.metrics.autoCorrections++;

                    if (this.options.verbose) {
                        console.log(`🌱 Tending garden at (${manifest.x}, ${manifest.y})`);
                    }
                }

                // Clear processed proposal
                this.proposals.delete(id);

            } catch (error) {
                console.error(`❌ Failed to render proposal ${id}:`, error);
            }
        }
    }

    /**
     * Phase 4: Validate evolution results
     * @private
     */
    async _validateEvolution() {
        // In production, run tests and check results
        // Update garden colors based on test results

        // For now, simulate validation
        if (this.metrics.structuresBuilt > 0 && this.metrics.structuresBuilt % 5 === 0) {
            this._printMetrics();
        }
    }

    /**
     * Tend to gardens (self-correction)
     * @private
     */
    async _tendGardens() {
        // Check for test failures and attempt auto-correction
        const builds = this.map.getLLMBuilds ? this.map.getLLMBuilds() : [];
        const gardens = builds.filter(b => b.type === 'garden');

        for (const garden of gardens) {
            // Use Oracle if available, otherwise fallback to simulation
            if (this.oracle && this.options.useOracle) {
                await this._tendGardenWithOracle(garden);
            } else {
                await this._tendGardenSimulated(garden);
            }
        }
    }

    /**
     * Tend garden using real TestOracle
     * @private
     */
    async _tendGardenWithOracle(garden) {
        // Assume garden name or metadata maps to a test ID
        const testId = garden.metadata.codeReference || `tests/${garden.metadata.name}.js`;

        // Check current status
        const result = this.oracle.getStatus(testId);

        // If unknown, run it
        if (result.status === 'unknown' || (Date.now() - new Date(result.lastRun).getTime() > 30000)) {
            await this.oracle.runTest(testId);
        }

        // Get updated status
        const newResult = this.oracle.getStatus(testId);

        // Update visual state if different from map state
        const mapStatus = garden.metadata.status;

        if (newResult.status === 'failing' && mapStatus !== 'failing') {
            await this._updateGardenStatus(garden, 'failing', newResult.output);
        } else if (newResult.status === 'passing' && mapStatus === 'failing') {
            await this._updateGardenStatus(garden, 'passing', 'Fixed by Evolution');
            this.metrics.autoCorrections++;
        }
    }

    async _updateGardenStatus(garden, status, message) {
        await this.map.writeTile(garden.x, garden.y, 'garden', {
            ...garden.metadata,
            status: status,
            lastUpdate: Date.now(),
            message: message
        });

        if (this.options.verbose) {
            console.log(`🌱 Garden ${status}: ${garden.metadata.name} (${message})`);
        }
    }

    /**
     * Fallback loop
     * @private
     */
    async _tendGardenSimulated(garden) {
        const shouldFail = Math.random() > 0.9;  // 10% failure rate

        if (shouldFail && garden.metadata.status !== 'failing') {
            await this._updateGardenStatus(garden, 'failing', 'Simulated Failure');

        } else if (!shouldFail && garden.metadata.status === 'failing') {
            await this._updateGardenStatus(garden, 'passing', 'Simulated Fix');
            this.metrics.autoCorrections++;
        }
    }

    /**
     * Print evolution metrics
     * @private
     */
    _printMetrics() {
        console.log('');
        console.log('📊 EVOLUTION METRICS');
        console.log('─────────────────────────────────────────────────────────────');
        console.log(`  Cycles Completed:  ${this.metrics.loopsCompleted}`);
        console.log(`  Structures Built:  ${this.metrics.structuresBuilt}`);
        console.log(`  Auto-Corrections:  ${this.metrics.autoCorrections}`);
        console.log(`  Total Evolutions:  ${this.metrics.totalEvolutions}`);
        console.log('');
    }

    /**
     * Get current metrics
     */
    getMetrics() {
        return { ...this.metrics };
    }

    /**
     * Manually trigger an evolution proposal
     */
    async proposeChange(manifest) {
        const proposal = {
            type: 'manual',
            manifest: manifest,
            priority: 'high'
        };

        await this._processProposal(proposal);
        await this._renderProposals();
    }
}

// Enhanced factory with AI integration
class EvolutionaryArchitectAI extends EvolutionaryArchitectEnhanced {
    constructor(infiniteMap, aiClient, options = {}) {
        super(infiniteMap, options);
        this.aiClient = aiClient;  // LLM client for architectural decisions
        this.isAIGuided = true;
    }

    /**
     * Consult actual AI for architectural decisions
     * @private
     */
    async _consultAI(proposal) {
        if (!this.aiClient) {
            return await super._consultAI(proposal);
        }

        // Build prompt for AI
        const prompt = this._buildArchitecturalPrompt(proposal);

        // Query AI
        try {
            const response = await this.aiClient.query(prompt);
            return this._parseAIResponse(response);
        } catch (error) {
            console.error('AI consultation failed, falling back to rules:', error);
            return await super._consultAI(proposal);
        }
    }

    /**
     * Build architectural prompt for AI
     * @private
     */
    _buildArchitecturalPrompt(proposal) {
        const scaffold = proposal.target;
        const metadata = scaffold.metadata;

        return `
You are the Evolutionary Architect for Geometry OS.

Current scaffold: ${metadata.name}
Description: ${metadata.description}
Status: ${metadata.status}
Complexity: ${metadata.complexity || 0.5}

Question: What should this scaffold evolve into?

Options:
- tower: Microservice or standalone component
- bridge: Connection between systems
- vault: Data storage or cache
- garden: Test suite or event system
- crystal: Critical infrastructure

Respond with JSON:
{
    "toType": "tower|bridge|vault|garden|crystal",
    "reasoning": "Why this evolution makes sense",
    "complexity": 0.0-1.0,
    "description": "New description for evolved structure"
}
        `;
    }

    /**
     * Parse AI response
     * @private
     */
    _parseAIResponse(response) {
        try {
            const parsed = JSON.parse(response);
            return {
                action: 'evolve',
                x: response.x,
                y: response.y,
                fromType: 'scaffold',
                toType: parsed.toType,
                metadata: {
                    ...response,
                    status: 'complete',
                    evolvedBy: 'AI'
                }
            };
        } catch (error) {
            console.error('Failed to parse AI response:', error);
            return null;
        }
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.EvolutionaryArchitectEnhanced = EvolutionaryArchitectEnhanced;
    window.EvolutionaryArchitectAI = EvolutionaryArchitectAI;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        EvolutionaryArchitectEnhanced,
        EvolutionaryArchitectAI
    };
}

/**
 * Usage Example:
 *
 * // Basic evolution (rules-based)
 * const architect = new EvolutionaryArchitectEnhanced(infiniteMap);
 * architect.start();
 *
 * // AI-guided evolution
 * const aiArchitect = new EvolutionaryArchitectAI(infiniteMap, llmClient);
 * aiArchitect.start();
 *
 * // Manual proposal
 * await architect.proposeChange({
 *     x: 5, y: 5,
 *     type: 'tower',
 *     metadata: { name: 'NEW_SERVICE', description: '...' }
 * });
 */
