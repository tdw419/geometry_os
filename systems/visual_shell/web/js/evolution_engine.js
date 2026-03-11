/**
 * Visual Evolution Engine
 * 
 * Standalone genetic algorithm that runs in the browser.
 * Evolves visual patterns into functional logic (represented by WASM code structures).
 * 
 * Core Concept:
 * - Genome = Pixel Array (RGBA)
 * - Fitness = Similarity to target logical structure (WASM Header)
 */

class VisualEvolutionEngine {
    constructor(config = {}) {
        this.gridSize = config.gridSize || 32;
        this.populationSize = config.populationSize || 50;
        this.mutationRate = config.mutationRate || 0.05;
        this.targetHeader = [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]; // \0asm\1\0\0\0

        this.population = [];
        this.generation = 0;
        this.isRunning = false;
        this.bestOrganism = null;
        this.bestFitness = 0;

        this.initializePopulation();

        // Callback
        this.onEvolutionCallback = null;
    }

    /**
     * Start the evolution loop
     */
    start() {
        if (this.isRunning) return;
        this.isRunning = true;
        this.loop();
    }

    /**
     * Stop the evolution loop
     */
    stop() {
        this.isRunning = false;
    }

    /**
     * Set callback for evolution updates
     */
    onEvolution(callback) {
        this.onEvolutionCallback = callback;
    }

    /**
     * Initialize population with random pixels
     */
    initializePopulation() {
        this.population = [];
        const totalPixels = this.gridSize * this.gridSize; // Total pixels (not bytes)

        for (let i = 0; i < this.populationSize; i++) {
            // Each organism is a Uint8ClampedArray of RGBA values
            // Size = width * height * 4 (RGBA)
            const organism = new Uint8ClampedArray(totalPixels * 4);

            // Fill with random noise
            for (let j = 0; j < organism.length; j++) {
                organism[j] = Math.floor(Math.random() * 256);
            }

            // Set alpha to 255 (fully opaque)
            for (let j = 3; j < organism.length; j += 4) {
                organism[j] = 255;
            }

            this.population.push(organism);
        }

        this.generation = 0;
        this.bestFitness = 0;
    }

    /**
     * Main evolution loop
     */
    loop() {
        if (!this.isRunning) return;

        this.generation++;

        // 1. Evaluate fitness
        const scores = this.population.map(org => ({
            organism: org,
            fitness: this.calculateFitness(org)
        }));

        // Sort by fitness (descending)
        scores.sort((a, b) => b.fitness - a.fitness);

        const best = scores[0];
        this.bestOrganism = best.organism;
        this.bestFitness = best.fitness;

        // 2. Report progress
        if (this.onEvolutionCallback && this.generation % 5 === 0) {
            // Convert best organism to ImageData for canvas
            const imageData = this.genomeToImageData(best.organism);

            this.onEvolutionCallback({
                type: 'step',
                generation: this.generation,
                fitness: best.fitness,
                imageData: imageData
            });
        }

        // Check for success (arbitrary high fitness for this demo)
        if (best.fitness > 100000) {
            if (this.onEvolutionCallback) {
                this.onEvolutionCallback({
                    type: 'complete',
                    generation: this.generation,
                    fitness: best.fitness
                });
            }
            return;
        }

        // 3. Selection (Top 20% survive)
        const survivorsCount = Math.floor(this.populationSize * 0.2);
        const survivors = scores.slice(0, survivorsCount).map(s => s.organism);

        // 4. Reproduction
        const newPopulation = [];

        // Elitism: keep best
        newPopulation.push(new Uint8ClampedArray(survivors[0]));

        while (newPopulation.length < this.populationSize) {
            // Random parent from survivors
            const parent = survivors[Math.floor(Math.random() * survivors.length)];
            const child = new Uint8ClampedArray(parent);

            // Mutate
            this.mutate(child);

            newPopulation.push(child);
        }

        this.population = newPopulation;

        // Schedule next frame
        requestAnimationFrame(() => this.loop());
    }

    /**
     * Calculate fitness based on WASM header structure
     * The genome is treated as a linear byte stream (R channel mainly)
     */
    calculateFitness(organism) {
        let score = 0;

        // Extract bytes (use R channel as data carrier for simplicity)
        // In a real system, we'd use all 4 channels via Hilbert curve
        // For this demo, we just check the first 8 bytes of the R channel sequence

        // Target: \0asm\1\0\0\0
        // R channel indices: 0, 4, 8, 12...

        for (let i = 0; i < this.targetHeader.length; i++) {
            const pixelIndex = i * 4; // R channel
            if (pixelIndex < organism.length) {
                const byteVal = organism[pixelIndex];
                const targetVal = this.targetHeader[i];

                // Distance penalty
                const diff = Math.abs(byteVal - targetVal);
                score += (255 - diff); // Higher score for closer match

                // Bonus for exact match
                if (diff === 0) score += 100;
            }
        }

        // Bonus for having the full header exactly right
        let headerMatch = true;
        for (let i = 0; i < this.targetHeader.length; i++) {
            if (organism[i * 4] !== this.targetHeader[i]) {
                headerMatch = false;
                break;
            }
        }

        if (headerMatch) score += 5000;

        return score;
    }

    /**
     * Mutate an organism
     */
    mutate(organism) {
        // Iterate through pixels
        for (let i = 0; i < organism.length; i++) {
            // Alpha channel (every 4th byte starting at 3) stays at 255
            if ((i + 1) % 4 === 0) continue;

            if (Math.random() < this.mutationRate) {
                // Small drift
                const change = Math.floor(Math.random() * 21) - 10; // -10 to 10
                let val = organism[i] + change;

                // Clamp
                if (val < 0) val = 0;
                if (val > 255) val = 255;

                organism[i] = val;
            }

            // Occasional random flip (1% chance when mutating)
            if (Math.random() < 0.001) {
                organism[i] = Math.floor(Math.random() * 256);
            }
        }
    }

    /**
     * Helper: Convert genome buffer to ImageData
     */
    genomeToImageData(organism) {
        // Since organism IS a Uint8ClampedArray of proper size and RGBA format,
        // we can use it directly.
        return new ImageData(organism, this.gridSize, this.gridSize);
    }

    /**
     * Helper: Convert organism to Data URL (for saving)
     */
    saveOrganism(organism) {
        const canvas = document.createElement('canvas');
        canvas.width = this.gridSize;
        canvas.height = this.gridSize;
        const ctx = canvas.getContext('2d');
        const imgData = new ImageData(organism, this.gridSize, this.gridSize);
        ctx.putImageData(imgData, 0, 0);
        return canvas.toDataURL('image/png');
    }

    /**
     * set the target header for checking fitness
     * @param {number[]} header - Array of byte values
     */
    setTargetHeader(header) {
        this.targetHeader = header;
        // Reset fitness to force re-evaluation
        this.bestFitness = 0;
        console.log(`🎯 New Evolution Target Set: [${header.map(b => b.toString(16)).join(' ')}]`);
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.VisualEvolutionEngine = VisualEvolutionEngine;
}
