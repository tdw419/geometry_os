/**
 * Geometry OS: Phase 20 - Track 1.2
 * LayoutGAN Generator
 * 
 * Neural network-inspired layout generator that proposes optimized
 * element positions to minimize cognitive load (saccade distance).
 * 
 * Architecture:
 * - Uses a lightweight MLP-style generator (runs in browser)
 * - Optional WebGPU acceleration for larger layouts
 * - Integrates with SaccadeEngine for reward signals
 * - Outputs gl2D-compatible position deltas
 */

class LayoutGANGenerator {
    constructor(options = {}) {
        this.config = {
            latentDim: options.latentDim || 64,
            hiddenDim: options.hiddenDim || 128,
            numProposals: options.numProposals || 5,
            learningRate: options.learningRate || 0.01,
            explorationRate: options.explorationRate || 0.2,
            semanticGroupingStrength: options.semanticGroupingStrength || 0.7,
        };

        // Neural network weights (simplified - would use TensorFlow.js in production)
        this.weights = {
            encoder: this._initializeWeights(6, this.config.hiddenDim), // 6 input features
            attention: this._initializeWeights(this.config.hiddenDim, this.config.hiddenDim),
            decoder: this._initializeWeights(this.config.hiddenDim, 2), // 2 output (dx, dy)
        };

        // Memory for reinforcement learning
        this.proposalHistory = [];
        this.rewardHistory = [];
        this.bestProposal = null;
        this.bestScore = -Infinity;

        // gl2D layout format support
        this.gl2dMode = options.gl2dMode || false;

        console.log('[LAYOUTGAN] Generator initialized with config:', this.config);
    }

    /**
     * Initialize random weights for a layer
     */
    _initializeWeights(inputDim, outputDim) {
        const weights = [];
        const scale = Math.sqrt(2.0 / inputDim); // He initialization
        for (let i = 0; i < inputDim; i++) {
            const row = [];
            for (let j = 0; j < outputDim; j++) {
                row.push((Math.random() * 2 - 1) * scale);
            }
            weights.push(row);
        }
        return weights;
    }

    /**
     * Matrix multiplication helper
     */
    _matmul(input, weights) {
        const output = new Array(weights[0].length).fill(0);
        for (let j = 0; j < weights[0].length; j++) {
            for (let i = 0; i < input.length; i++) {
                output[j] += input[i] * weights[i][j];
            }
        }
        return output;
    }

    /**
     * ReLU activation
     */
    _relu(x) {
        return x.map(v => Math.max(0, v));
    }

    /**
     * Tanh activation (for bounded outputs)
     */
    _tanh(x) {
        return x.map(v => Math.tanh(v));
    }

    /**
     * Softmax for attention weights
     */
    _softmax(x) {
        const max = Math.max(...x);
        const exp = x.map(v => Math.exp(v - max));
        const sum = exp.reduce((a, b) => a + b, 0);
        return exp.map(v => v / sum);
    }

    /**
     * Encode element features into latent representation
     */
    _encodeElement(element) {
        // Feature vector: [normalizedX, normalizedY, normalizedWidth, normalizedHeight, importance, typeEncoding]
        const features = [
            element.centerX / 1000, // Normalize positions
            element.centerY / 1000,
            element.width / 100,
            element.height / 100,
            element.importance / 10,
            this._encodeType(element.type),
        ];

        // Forward pass through encoder
        let hidden = this._matmul(features, this.weights.encoder);
        hidden = this._relu(hidden);

        return hidden;
    }

    /**
     * Encode element type as numeric value
     */
    _encodeType(type) {
        const typeMap = {
            'app': 1.0,
            'folder': 0.7,
            'file': 0.5,
            'container': 0.8,
            'generic': 0.3,
        };
        return typeMap[type] || 0.3;
    }

    /**
     * Calculate attention scores between elements
     */
    _calculateAttention(encodings) {
        const n = encodings.length;
        const attentionScores = [];

        for (let i = 0; i < n; i++) {
            const scores = [];
            for (let j = 0; j < n; j++) {
                // Dot product attention
                let score = 0;
                for (let k = 0; k < encodings[i].length; k++) {
                    score += encodings[i][k] * encodings[j][k];
                }
                score /= Math.sqrt(encodings[i].length);
                scores.push(score);
            }
            attentionScores.push(this._softmax(scores));
        }

        return attentionScores;
    }

    /**
     * Apply attention to aggregate context
     */
    _applyAttention(encodings, attentionScores) {
        const contextual = [];

        for (let i = 0; i < encodings.length; i++) {
            const context = new Array(encodings[0].length).fill(0);
            for (let j = 0; j < encodings.length; j++) {
                for (let k = 0; k < encodings[j].length; k++) {
                    context[k] += attentionScores[i][j] * encodings[j][k];
                }
            }
            contextual.push(context);
        }

        return contextual;
    }

    /**
     * Generate layout proposals from current state
     * @param {Map} elements - Map of element ID -> element data from SaccadeEngine
     * @param {Array} heatmap - Attention heatmap from SaccadeEngine (optional)
     * @returns {Array} Array of proposal objects
     */
    generateProposals(elements, heatmap = null) {
        const elemArray = Array.from(elements.entries());

        if (elemArray.length === 0) {
            return [];
        }

        // Step 1: Encode all elements
        const encodings = elemArray.map(([id, elem]) => this._encodeElement(elem));

        // Step 2: Calculate attention (which elements should group together)
        const attentionScores = this._calculateAttention(encodings);

        // Step 3: Apply attention for contextual representations
        const contextual = this._applyAttention(encodings, attentionScores);

        // Step 4: Generate multiple proposals with varying exploration
        const proposals = [];

        for (let p = 0; p < this.config.numProposals; p++) {
            const proposal = {
                id: `proposal_${Date.now()}_${p}`,
                deltas: [],
                confidence: 0,
                semanticGroups: [],
            };

            // Exploration vs exploitation
            const explorationNoise = p === 0 ? 0 : this.config.explorationRate * (p / this.config.numProposals);

            for (let i = 0; i < elemArray.length; i++) {
                const [elemId, elem] = elemArray[i];

                // Decode contextual representation to position delta
                let deltaEncoded = this._matmul(contextual[i], this.weights.decoder);
                deltaEncoded = this._tanh(deltaEncoded);

                // Scale deltas (max 100px movement per proposal)
                let dx = deltaEncoded[0] * 100;
                let dy = deltaEncoded[1] * 100;

                // Add exploration noise
                if (explorationNoise > 0) {
                    dx += (Math.random() * 2 - 1) * explorationNoise * 50;
                    dy += (Math.random() * 2 - 1) * explorationNoise * 50;
                }

                // Apply semantic grouping force
                const groupForce = this._calculateSemanticGroupForce(elem, elemArray, attentionScores[i]);
                dx += groupForce.fx * this.config.semanticGroupingStrength;
                dy += groupForce.fy * this.config.semanticGroupingStrength;

                proposal.deltas.push({
                    elementId: elemId,
                    dx: dx,
                    dy: dy,
                    currentX: elem.x,
                    currentY: elem.y,
                    proposedX: elem.x + dx,
                    proposedY: elem.y + dy,
                });
            }

            // Calculate proposal confidence based on coherence
            proposal.confidence = this._calculateProposalConfidence(proposal, attentionScores);

            // Identify semantic groups
            proposal.semanticGroups = this._identifySemanticGroups(elemArray, attentionScores);

            proposals.push(proposal);
        }

        // Sort by confidence
        proposals.sort((a, b) => b.confidence - a.confidence);

        // Store best proposal
        if (proposals.length > 0 && proposals[0].confidence > this.bestScore) {
            this.bestScore = proposals[0].confidence;
            this.bestProposal = proposals[0];
        }

        this.proposalHistory.push({
            timestamp: Date.now(),
            proposals: proposals.map(p => ({ id: p.id, confidence: p.confidence })),
        });

        return proposals;
    }

    /**
     * Calculate semantic grouping force based on attention and type similarity
     */
    _calculateSemanticGroupForce(elem, elemArray, attentionWeights) {
        let fx = 0;
        let fy = 0;

        for (let i = 0; i < elemArray.length; i++) {
            const [, other] = elemArray[i];
            if (other === elem) continue;

            const attention = attentionWeights[i];

            // Direction towards other element
            const dx = other.centerX - elem.centerX;
            const dy = other.centerY - elem.centerY;
            const dist = Math.sqrt(dx * dx + dy * dy) || 1;

            // Attractive force proportional to attention weight
            fx += (dx / dist) * attention * 20;
            fy += (dy / dist) * attention * 20;
        }

        return { fx, fy };
    }

    /**
     * Calculate proposal confidence score
     */
    _calculateProposalConfidence(proposal, attentionScores) {
        // Based on how well the proposal groups related elements
        let score = 0;
        const n = proposal.deltas.length;

        if (n < 2) return 0.5;

        for (let i = 0; i < n; i++) {
            for (let j = i + 1; j < n; j++) {
                const d1 = proposal.deltas[i];
                const d2 = proposal.deltas[j];

                // Distance after proposal
                const newDist = Math.sqrt(
                    Math.pow(d1.proposedX - d2.proposedX, 2) +
                    Math.pow(d1.proposedY - d2.proposedY, 2)
                );

                // Original distance
                const oldDist = Math.sqrt(
                    Math.pow(d1.currentX - d2.currentX, 2) +
                    Math.pow(d1.currentY - d2.currentY, 2)
                );

                // Higher attention = should be closer
                const targetDist = 100 / (attentionScores[i][j] + 0.1);

                // Score based on how close new distance is to target
                const distScore = 1 - Math.abs(newDist - targetDist) / 500;
                score += Math.max(0, distScore);
            }
        }

        return score / (n * (n - 1) / 2);
    }

    /**
     * Identify semantic groups based on attention patterns
     */
    _identifySemanticGroups(elemArray, attentionScores) {
        const groups = [];
        const visited = new Set();
        const threshold = 0.2; // Attention threshold for grouping

        for (let i = 0; i < elemArray.length; i++) {
            if (visited.has(i)) continue;

            const group = {
                members: [elemArray[i][0]],
                centroidX: elemArray[i][1].centerX,
                centroidY: elemArray[i][1].centerY,
                primaryType: elemArray[i][1].type,
            };
            visited.add(i);

            for (let j = i + 1; j < elemArray.length; j++) {
                if (visited.has(j)) continue;

                if (attentionScores[i][j] > threshold) {
                    group.members.push(elemArray[j][0]);
                    group.centroidX = (group.centroidX + elemArray[j][1].centerX) / 2;
                    group.centroidY = (group.centroidY + elemArray[j][1].centerY) / 2;
                    visited.add(j);
                }
            }

            if (group.members.length > 1) {
                groups.push(group);
            }
        }

        return groups;
    }

    /**
     * Apply a proposal with smooth animation
     * @param {object} proposal - Proposal to apply
     * @param {function} updateCallback - Callback to update element positions
     * @param {number} duration - Animation duration in ms
     */
    applyProposal(proposal, updateCallback, duration = 300) {
        const startTime = Date.now();
        const startPositions = proposal.deltas.map(d => ({
            elementId: d.elementId,
            x: d.currentX,
            y: d.currentY,
        }));

        const animate = () => {
            const elapsed = Date.now() - startTime;
            const progress = Math.min(elapsed / duration, 1);

            // Ease-out cubic
            const eased = 1 - Math.pow(1 - progress, 3);

            const updates = proposal.deltas.map((delta, i) => ({
                elementId: delta.elementId,
                x: startPositions[i].x + delta.dx * eased,
                y: startPositions[i].y + delta.dy * eased,
            }));

            updateCallback(updates);

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }

    /**
     * Receive reward signal from SaccadeEngine
     * Used for reinforcement learning of better proposals
     * @param {string} proposalId - ID of the proposal
     * @param {number} reward - Reward value (-1 to 1)
     */
    receiveReward(proposalId, reward) {
        this.rewardHistory.push({
            proposalId,
            reward,
            timestamp: Date.now(),
        });

        // Simple weight update based on reward (would be proper backprop in production)
        if (reward > 0) {
            this._nudgeWeights(reward * 0.01);
        }

        console.log(`[LAYOUTGAN] Received reward ${reward.toFixed(2)} for ${proposalId}`);
    }

    /**
     * Nudge weights slightly (simple reinforcement)
     */
    _nudgeWeights(scale) {
        for (const layer of ['encoder', 'attention', 'decoder']) {
            for (let i = 0; i < this.weights[layer].length; i++) {
                for (let j = 0; j < this.weights[layer][i].length; j++) {
                    this.weights[layer][i][j] += (Math.random() * 2 - 1) * scale;
                }
            }
        }
    }

    /**
     * Export proposal to gl2D format
     */
    toGl2D(proposal) {
        return {
            version: '1.0',
            type: 'layout_proposal',
            generator: 'LayoutGAN',
            timestamp: Date.now(),
            confidence: proposal.confidence,
            elements: proposal.deltas.map(d => ({
                id: d.elementId,
                transform: {
                    x: d.proposedX,
                    y: d.proposedY,
                    dx: d.dx,
                    dy: d.dy,
                },
            })),
            semanticGroups: proposal.semanticGroups.map(g => ({
                members: g.members,
                centroid: { x: g.centroidX, y: g.centroidY },
                type: g.primaryType,
            })),
        };
    }

    /**
     * Generate semantic tooltip for a group
     */
    generateTooltip(group) {
        const typeDescriptions = {
            'app': 'Application Zone',
            'folder': 'Directory Cluster',
            'file': 'Document Group',
            'container': 'Container Area',
            'generic': 'Element Group',
        };

        return {
            title: typeDescriptions[group.primaryType] || 'Element Group',
            description: `${group.members.length} related elements`,
            hint: 'Elements with high semantic affinity',
            position: { x: group.centroidX, y: group.centroidY },
        };
    }

    /**
     * Get generator statistics
     */
    getStats() {
        const avgReward = this.rewardHistory.length > 0
            ? this.rewardHistory.reduce((sum, r) => sum + r.reward, 0) / this.rewardHistory.length
            : 0;

        return {
            proposalsGenerated: this.proposalHistory.length,
            rewardsReceived: this.rewardHistory.length,
            averageReward: avgReward,
            bestScore: this.bestScore,
            config: this.config,
        };
    }
}

// Export for use in Visual Shell
if (typeof window !== 'undefined') {
    window.LayoutGANGenerator = LayoutGANGenerator;
}

// Node.js / ES Module export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LayoutGANGenerator };
}
