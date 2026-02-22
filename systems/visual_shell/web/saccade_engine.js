/**
 * Geometry OS: Phase 20 - Track 1.1
 * Saccade Simulation Engine
 * 
 * Simulates eye-tracking behavior to optimize UI layouts.
 * The engine models human visual attention patterns and calculates
 * "Saccade Cost" - the cognitive effort required to navigate the interface.
 * 
 * Biological Model:
 * - Saccades: Rapid eye movements between fixation points (~30-80ms each)
 * - Fixations: Pauses where visual information is extracted (~200-300ms each)
 * - Foveal Region: Central 2° of vision (high acuity), ~50px radius at typical distance
 * - Peripheral: 60° field detecting motion/change, low detail
 */

class SaccadeEngine {
    constructor(options = {}) {
        // Eye model parameters
        this.config = {
            fovealRadius: options.fovealRadius || 50,      // High-acuity region in pixels
            parafovealRadius: options.parafovealRadius || 150, // Medium acuity
            peripheralRadius: options.peripheralRadius || 400, // Motion detection only
            saccadeVelocity: options.saccadeVelocity || 500,  // Degrees/second (typical: 400-600)
            fixationDuration: options.fixationDuration || 250, // ms per fixation
            minSaccadeDistance: options.minSaccadeDistance || 20, // Minimum distance to trigger saccade
            attentionDecay: options.attentionDecay || 0.95,    // Attention fades over time
        };

        // Current attention state
        this.state = {
            currentFocus: { x: 0, y: 0 },
            attentionMap: new Map(), // ElementID -> AttentionScore
            scanPath: [],            // History of fixations
            totalSaccadeDistance: 0,
            fixationCount: 0,
            lastUpdateTime: Date.now(),
        };

        // Layout elements being tracked
        this.elements = new Map(); // ElementID -> { x, y, width, height, importance, type }

        // Heatmap for visualization
        this.heatmapData = [];
        this.heatmapResolution = options.heatmapResolution || 32;

        console.log(`[SACCADE] Engine initialized. Foveal radius: ${this.config.fovealRadius}px`);
    }

    /**
     * Register a UI element for saccade tracking
     * @param {string} id - Unique element identifier
     * @param {object} bounds - { x, y, width, height }
     * @param {number} importance - Semantic importance weight (0-10)
     * @param {string} type - Element type (container, button, text, icon, etc.)
     */
    registerElement(id, bounds, importance = 5, type = 'generic') {
        this.elements.set(id, {
            ...bounds,
            centerX: bounds.x + bounds.width / 2,
            centerY: bounds.y + bounds.height / 2,
            importance,
            type,
            lastFixationTime: 0,
            fixationCount: 0,
        });
    }

    /**
     * Unregister an element
     */
    unregisterElement(id) {
        this.elements.delete(id);
        this.state.attentionMap.delete(id);
    }

    /**
     * Simulate a task-driven saccade sequence
     * Models the eye's natural scanning behavior when looking for specific targets
     * @param {string} targetId - Target element to reach
     * @param {string} startId - Starting element (optional, uses current focus)
     * @returns {object} Scan path analysis
     */
    simulateTaskPath(targetId, startId = null) {
        const target = this.elements.get(targetId);
        if (!target) {
            console.warn(`[SACCADE] Target element not found: ${targetId}`);
            return null;
        }

        // Starting point
        let currentPos = startId
            ? this.elements.get(startId)
            : this.state.currentFocus;

        if (!currentPos) {
            currentPos = { centerX: 0, centerY: 0 };
        }

        const scanPath = [];
        let totalDistance = 0;
        let fixations = 0;
        const maxIterations = 20; // Prevent infinite loops

        // Simulate natural visual search
        let iteration = 0;
        while (iteration < maxIterations) {
            iteration++;

            // Calculate distance to target
            const distToTarget = this._calculateDistance(
                currentPos.centerX || currentPos.x,
                currentPos.centerY || currentPos.y,
                target.centerX,
                target.centerY
            );

            // If within foveal range, task complete
            if (distToTarget <= this.config.fovealRadius) {
                scanPath.push({
                    type: 'fixation',
                    target: targetId,
                    x: target.centerX,
                    y: target.centerY,
                    duration: this.config.fixationDuration,
                });
                fixations++;
                break;
            }

            // Find next saccade target (peripheral attention capture)
            const nextTarget = this._findNextSaccadeTarget(currentPos, target);

            // Record saccade
            const saccadeDist = this._calculateDistance(
                currentPos.centerX || currentPos.x,
                currentPos.centerY || currentPos.y,
                nextTarget.centerX,
                nextTarget.centerY
            );

            totalDistance += saccadeDist;

            scanPath.push({
                type: 'saccade',
                from: { x: currentPos.centerX || currentPos.x, y: currentPos.centerY || currentPos.y },
                to: { x: nextTarget.centerX, y: nextTarget.centerY },
                distance: saccadeDist,
                duration: this._calculateSaccadeDuration(saccadeDist),
            });

            // Fixation at landing point
            scanPath.push({
                type: 'fixation',
                target: nextTarget.id || 'intermediate',
                x: nextTarget.centerX,
                y: nextTarget.centerY,
                duration: this.config.fixationDuration,
            });
            fixations++;

            currentPos = nextTarget;
        }

        // Calculate saccade efficiency
        const directDistance = this._calculateDistance(
            startId ? this.elements.get(startId)?.centerX || 0 : 0,
            startId ? this.elements.get(startId)?.centerY || 0 : 0,
            target.centerX,
            target.centerY
        );

        const efficiency = directDistance > 0 ? directDistance / totalDistance : 1;

        return {
            scanPath,
            totalDistance,
            directDistance,
            efficiency, // 1.0 = perfect, lower = more wandering
            fixationCount: fixations,
            estimatedTime: this._calculateTotalTime(scanPath),
            cognitiveLoad: this._calculateCognitiveLoad(scanPath),
        };
    }

    /**
     * Find the next saccade target based on visual attention model
     * Uses a combination of: proximity, importance, and peripheral salience
     */
    _findNextSaccadeTarget(currentPos, finalTarget) {
        const currentX = currentPos.centerX || currentPos.x;
        const currentY = currentPos.centerY || currentPos.y;

        // Calculate direction to final target
        const targetAngle = Math.atan2(
            finalTarget.centerY - currentY,
            finalTarget.centerX - currentX
        );

        // Find elements in peripheral vision that are in the direction of the target
        let bestCandidate = null;
        let bestScore = -Infinity;

        for (const [id, elem] of this.elements) {
            const distToElem = this._calculateDistance(
                currentX, currentY,
                elem.centerX, elem.centerY
            );

            // Skip if too close (within foveal) or too far (beyond peripheral)
            if (distToElem < this.config.minSaccadeDistance ||
                distToElem > this.config.peripheralRadius) {
                continue;
            }

            // Calculate angle to this element
            const elemAngle = Math.atan2(
                elem.centerY - currentY,
                elem.centerX - currentX
            );

            // Angular difference from target direction
            const angleDiff = Math.abs(this._normalizeAngle(elemAngle - targetAngle));

            // Score based on: direction alignment, distance progress, importance
            const directionScore = Math.cos(angleDiff) * 10;
            const distanceToFinal = this._calculateDistance(
                elem.centerX, elem.centerY,
                finalTarget.centerX, finalTarget.centerY
            );
            const progressScore = (this._calculateDistance(currentX, currentY, finalTarget.centerX, finalTarget.centerY) - distanceToFinal) / 100;
            const importanceScore = elem.importance * 0.5;

            const totalScore = directionScore + progressScore + importanceScore;

            if (totalScore > bestScore) {
                bestScore = totalScore;
                bestCandidate = { ...elem, id };
            }
        }

        // If no good candidate, make direct saccade towards target
        if (!bestCandidate) {
            const maxSaccade = this.config.peripheralRadius * 0.8;
            const directDist = this._calculateDistance(
                currentX, currentY,
                finalTarget.centerX, finalTarget.centerY
            );
            const ratio = Math.min(maxSaccade / directDist, 1);

            return {
                centerX: currentX + (finalTarget.centerX - currentX) * ratio,
                centerY: currentY + (finalTarget.centerY - currentY) * ratio,
                id: null,
            };
        }

        return bestCandidate;
    }

    /**
     * Generate a saliency-based attention heatmap
     * Models bottom-up visual attention (what captures the eye naturally)
     */
    generateAttentionHeatmap(viewportWidth, viewportHeight) {
        const cellWidth = viewportWidth / this.heatmapResolution;
        const cellHeight = viewportHeight / this.heatmapResolution;
        const heatmap = [];

        for (let y = 0; y < this.heatmapResolution; y++) {
            const row = [];
            for (let x = 0; x < this.heatmapResolution; x++) {
                const cellCenterX = (x + 0.5) * cellWidth;
                const cellCenterY = (y + 0.5) * cellHeight;

                // Sum attention from nearby elements
                let attention = 0;
                for (const [id, elem] of this.elements) {
                    const dist = this._calculateDistance(
                        cellCenterX, cellCenterY,
                        elem.centerX, elem.centerY
                    );

                    // Gaussian falloff from element center
                    const sigma = Math.max(elem.width, elem.height) * 1.5;
                    const gaussianWeight = Math.exp(-(dist * dist) / (2 * sigma * sigma));

                    attention += gaussianWeight * elem.importance;
                }

                row.push(attention);
            }
            heatmap.push(row);
        }

        // Normalize
        const maxAttention = Math.max(...heatmap.flat());
        if (maxAttention > 0) {
            for (let y = 0; y < this.heatmapResolution; y++) {
                for (let x = 0; x < this.heatmapResolution; x++) {
                    heatmap[y][x] /= maxAttention;
                }
            }
        }

        this.heatmapData = heatmap;
        return heatmap;
    }

    /**
     * Calculate optimal layout forces based on saccade reduction
     * Returns force vectors to minimize cognitive load
     */
    calculateLayoutForces() {
        const forces = new Map();

        // Initialize forces for each element
        for (const [id, elem] of this.elements) {
            forces.set(id, { fx: 0, fy: 0 });
        }

        // Get all element pairs
        const elemArray = Array.from(this.elements.entries());

        for (let i = 0; i < elemArray.length; i++) {
            for (let j = i + 1; j < elemArray.length; j++) {
                const [id1, elem1] = elemArray[i];
                const [id2, elem2] = elemArray[j];

                // Calculate semantic affinity (related elements should be closer)
                const affinity = this._calculateSemanticAffinity(elem1, elem2);

                // Calculate current distance
                const dist = this._calculateDistance(
                    elem1.centerX, elem1.centerY,
                    elem2.centerX, elem2.centerY
                );

                // Ideal distance based on affinity
                const idealDist = this.config.fovealRadius * (2 - affinity);

                // Force magnitude (spring-like)
                const forceMag = (idealDist - dist) * 0.01;

                // Direction vector
                const dx = elem2.centerX - elem1.centerX;
                const dy = elem2.centerY - elem1.centerY;
                const len = Math.sqrt(dx * dx + dy * dy) || 1;

                // Apply forces
                const f1 = forces.get(id1);
                const f2 = forces.get(id2);

                f1.fx -= (dx / len) * forceMag;
                f1.fy -= (dy / len) * forceMag;
                f2.fx += (dx / len) * forceMag;
                f2.fy += (dy / len) * forceMag;
            }
        }

        return forces;
    }

    /**
     * Calculate semantic affinity between two elements
     * Based on type similarity and importance matching
     */
    _calculateSemanticAffinity(elem1, elem2) {
        let affinity = 0;

        // Same type elements have higher affinity
        if (elem1.type === elem2.type) {
            affinity += 0.5;
        }

        // Similar importance = related semantic level
        const importanceDiff = Math.abs(elem1.importance - elem2.importance);
        affinity += Math.max(0, 1 - importanceDiff / 10) * 0.5;

        return Math.min(affinity, 1);
    }

    /**
     * Calculate total time for a scan path
     */
    _calculateTotalTime(scanPath) {
        return scanPath.reduce((total, step) => total + (step.duration || 0), 0);
    }

    /**
     * Calculate cognitive load based on scan path complexity
     */
    _calculateCognitiveLoad(scanPath) {
        const saccades = scanPath.filter(s => s.type === 'saccade');
        const fixations = scanPath.filter(s => s.type === 'fixation');

        // Cognitive load factors:
        // - Long saccades = high load
        // - Many fixations = high load
        // - Direction changes = high load

        let directionChanges = 0;
        for (let i = 1; i < saccades.length; i++) {
            const prev = saccades[i - 1];
            const curr = saccades[i];
            const prevAngle = Math.atan2(
                prev.to.y - prev.from.y,
                prev.to.x - prev.from.x
            );
            const currAngle = Math.atan2(
                curr.to.y - curr.from.y,
                curr.to.x - curr.from.x
            );
            const angleDiff = Math.abs(this._normalizeAngle(currAngle - prevAngle));
            if (angleDiff > Math.PI / 4) directionChanges++;
        }

        const avgSaccadeDist = saccades.length > 0
            ? saccades.reduce((sum, s) => sum + s.distance, 0) / saccades.length
            : 0;

        // Normalized cognitive load (0-100)
        const load = Math.min(100,
            (avgSaccadeDist / this.config.peripheralRadius) * 30 +
            fixations.length * 5 +
            directionChanges * 10
        );

        return load;
    }

    /**
     * Calculate saccade duration based on distance (Main Sequence)
     * Duration = k * amplitude + baseline
     */
    _calculateSaccadeDuration(distance) {
        // Approximately 2ms per degree of visual angle
        // Assuming 50px per degree at typical viewing distance
        const degrees = distance / 50;
        return Math.max(30, 20 + degrees * 2); // Minimum 30ms saccade
    }

    _calculateDistance(x1, y1, x2, y2) {
        const dx = x2 - x1;
        const dy = y2 - y1;
        return Math.sqrt(dx * dx + dy * dy);
    }

    _normalizeAngle(angle) {
        while (angle > Math.PI) angle -= 2 * Math.PI;
        while (angle < -Math.PI) angle += 2 * Math.PI;
        return angle;
    }

    /**
     * Get layout optimization metrics
     */
    getMetrics() {
        // Calculate average saccade distance between all element pairs
        let totalPairDistance = 0;
        let pairCount = 0;
        const elemArray = Array.from(this.elements.values());

        for (let i = 0; i < elemArray.length; i++) {
            for (let j = i + 1; j < elemArray.length; j++) {
                totalPairDistance += this._calculateDistance(
                    elemArray[i].centerX, elemArray[i].centerY,
                    elemArray[j].centerX, elemArray[j].centerY
                );
                pairCount++;
            }
        }

        const avgDistance = pairCount > 0 ? totalPairDistance / pairCount : 0;

        return {
            elementCount: this.elements.size,
            averagePairDistance: avgDistance,
            estimatedSaccadeReduction: this._estimateSaccadeReduction(),
            layoutDensity: this._calculateLayoutDensity(),
        };
    }

    _estimateSaccadeReduction() {
        // Compare current layout to an optimally clustered layout
        const forces = this.calculateLayoutForces();
        let totalForce = 0;
        for (const f of forces.values()) {
            totalForce += Math.sqrt(f.fx * f.fx + f.fy * f.fy);
        }
        // Lower force = better optimization (100% = no forces needed)
        return Math.max(0, Math.min(100, 100 - totalForce * 10));
    }

    _calculateLayoutDensity() {
        if (this.elements.size === 0) return 0;

        // Find bounding box of all elements
        let minX = Infinity, maxX = -Infinity;
        let minY = Infinity, maxY = -Infinity;
        let totalElementArea = 0;

        for (const elem of this.elements.values()) {
            minX = Math.min(minX, elem.x);
            maxX = Math.max(maxX, elem.x + elem.width);
            minY = Math.min(minY, elem.y);
            maxY = Math.max(maxY, elem.y + elem.height);
            totalElementArea += elem.width * elem.height;
        }

        const boundingArea = (maxX - minX) * (maxY - minY);
        return boundingArea > 0 ? (totalElementArea / boundingArea) * 100 : 0;
    }
}

/**
 * Layout Optimizer
 * Uses SaccadeEngine metrics to propose layout improvements
 */
class LayoutOptimizer {
    constructor(saccadeEngine) {
        this.saccade = saccadeEngine;
        this.animationFrame = null;
        this.isOptimizing = false;
        this.optimizationSpeed = 0.1;
    }

    /**
     * Start continuous layout optimization
     */
    startOptimization(callback) {
        this.isOptimizing = true;
        this._optimizeStep(callback);
    }

    /**
     * Stop optimization
     */
    stopOptimization() {
        this.isOptimizing = false;
        if (this.animationFrame) {
            cancelAnimationFrame(this.animationFrame);
        }
    }

    _optimizeStep(callback) {
        if (!this.isOptimizing) return;

        const forces = this.saccade.calculateLayoutForces();
        const updates = [];

        for (const [id, force] of forces) {
            const elem = this.saccade.elements.get(id);
            if (!elem) continue;

            // Apply soft force with VCC-aware timing
            const speed = this._getVCCAwareSpeed();
            const newX = elem.x + force.fx * speed;
            const newY = elem.y + force.fy * speed;

            updates.push({
                id,
                x: newX,
                y: newY,
                dx: force.fx * speed,
                dy: force.fy * speed,
                smooth: true, // Enable smooth animation
            });

            // Update internal element state
            elem.x = newX;
            elem.y = newY;
            elem.centerX = newX + elem.width / 2;
            elem.centerY = newY + elem.height / 2;
        }

        // Report updates to callback
        if (callback) {
            callback(updates);
        }

        this.animationFrame = requestAnimationFrame(() => this._optimizeStep(callback));
    }

    _getVCCAwareSpeed() {
        // Adjust optimization speed based on VCC state
        // During epoch transitions, slow down for smooth animations
        if (window.vccManager && window.vccManager.isFrozen) {
            return this.optimizationSpeed * 0.1; // Much slower during freezes
        }
        return this.optimizationSpeed;
    }

    /**
     * Get optimization proposal without applying
     */
    proposeLayout() {
        const forces = this.saccade.calculateLayoutForces();
        const proposals = [];

        for (const [id, force] of forces) {
            const elem = this.saccade.elements.get(id);
            if (!elem) continue;

            proposals.push({
                id,
                currentPosition: { x: elem.x, y: elem.y },
                proposedPosition: {
                    x: elem.x + force.fx,
                    y: elem.y + force.fy,
                },
                force: { fx: force.fx, fy: force.fy },
                forceMagnitude: Math.sqrt(force.fx * force.fx + force.fy * force.fy),
            });
        }

        // Sort by force magnitude (highest need for adjustment first)
        proposals.sort((a, b) => b.forceMagnitude - a.forceMagnitude);

        return {
            proposals,
            currentMetrics: this.saccade.getMetrics(),
            predictedImprovement: this._predictImprovement(proposals),
        };
    }

    _predictImprovement(proposals) {
        // Estimate improvement if all proposals are applied
        const totalForce = proposals.reduce((sum, p) => sum + p.forceMagnitude, 0);

        // Calculate expected saccade reduction reward
        let totalReward = 0;
        proposals.forEach(proposal => {
            // Reward is based on force magnitude (layout improvement potential)
            // and semantic affinity (better grouping reduces cognitive load)
            const forceReward = proposal.forceMagnitude * 10;
            const semanticReward = this._calculateProposalSemanticReward(proposal);
            totalReward += forceReward + semanticReward;
        });

        return Math.min(100, totalReward); // Reward as percentage improvement
    }

    _calculateProposalSemanticReward(proposal) {
        // Calculate reward for semantic grouping improvements
        const elem = this.elements.get(proposal.id);
        if (!elem) return 0;

        // Check how many related elements are nearby after move
        let nearbyRelated = 0;
        const proposalPos = proposal.proposedPosition;

        for (const [otherId, otherElem] of this.elements) {
            if (otherId === proposal.id) continue;

            const distance = Math.sqrt(
                Math.pow(proposalPos.x - otherElem.centerX, 2) +
                Math.pow(proposalPos.y - otherElem.centerY, 2)
            );

            if (distance < this.config.fovealRadius * 2) {
                const affinity = this._calculateSemanticAffinity(elem, otherElem);
                if (affinity > 0.5) nearbyRelated++;
            }
        }

        return nearbyRelated * 5; // Reward for semantic clustering
    }
}

// Export for use in Visual Shell
if (typeof window !== 'undefined') {
    window.SaccadeEngine = SaccadeEngine;
    window.LayoutOptimizer = LayoutOptimizer;
}

// Node.js / ES Module export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SaccadeEngine, LayoutOptimizer };
}
