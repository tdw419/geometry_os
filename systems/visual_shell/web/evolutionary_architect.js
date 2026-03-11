/**
 * Geometry OS: Evolutionary Architect
 * 
 * This module connects the Neural Substrate (AI) to the Infinite Map (Spatial).
 * It listens for architectural proposals and renders them physically into the world.
 */

class EvolutionaryArchitect {
    constructor(infiniteMap) {
        this.map = infiniteMap;
        this.isEvolutionActive = false;
        this.evolutionInterval = null;
    }

    /**
     * Start the autonomous evolution loop
     */
    start() {
        if (this.isEvolutionActive) return;
        this.isEvolutionActive = true;
        console.log('🧬 Evolutionary Architect: STARTED');

        // In a real implementation, this would poll a backend or listen to a WebSocket
        // for AI-generated build manifests.
        this.evolutionInterval = setInterval(() => this._checkForEvolution(), 5000);
    }

    /**
     * Stop the loop
     */
    stop() {
        this.isEvolutionActive = false;
        if (this.evolutionInterval) {
            clearInterval(this.evolutionInterval);
            this.evolutionInterval = null;
        }
        console.log('🧬 Evolutionary Architect: PAUSED');
    }

    /**
     * Check for new evolution tasks
     * @private
     */
    async _checkForEvolution() {
        // Mocking the AI proposing a change
        // In production, this fetches from /api/evolution/proposals

        // Randomly "evolve" a scaffold into a real structure
        const builds = this.map.getLLMBuilds();
        const scaffolds = builds.filter(b => b.type === 'scaffold' && b.metadata.status === 'building');

        if (scaffolds.length > 0 && Math.random() > 0.7) {
            const target = scaffolds[0];
            console.log(`🧬 Evolving scaffold: ${target.metadata.name}`);

            // "Build" it
            await this.map.writeTile(target.x, target.y, 'tower', {
                ...target.metadata,
                status: 'complete',
                complexity: target.metadata.complexity || 0.5,
                description: 'Evolved from scaffold by Neural Substrate'
            });

            // Notify system
            this._notifyEvolution(target.metadata.name);
        }
    }

    _notifyEvolution(name) {
        // Create a temporary notification pulse on the map
        console.log(`✨ EVOLUTION COMPLETE: ${name}`);
    }
}

// Export
if (typeof window !== 'undefined') {
    window.EvolutionaryArchitect = EvolutionaryArchitect;
}
