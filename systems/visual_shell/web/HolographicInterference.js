/**
 * Geometry OS: Holographic Interference Effect
 *
 * Adds a "ghost" interference pattern to holographic images.
 * Randomly removes ~10% of pixels to create a holographic glitch/ghost effect.
 *
 * Use cases:
 * - Visual effect for holographic displays
 * - Simulate transmission interference
 * - Create "ghost" duplicates of encoded data
 * - Artistic holographic degradation
 */

export class HolographicInterference {
    constructor(options = {}) {
        this.removalPercent = options.removalPercent || 0.10;  // 10% default
        this.ghostAlpha = options.ghostAlpha || 0.3;           // Alpha for removed pixels
        this.noiseColor = options.noiseColor || [0, 255, 255]; // Cyan interference
        this.seed = options.seed || null;                      // For reproducible effects
        this.preserveData = options.preserveData !== false;    // Keep encoded data intact
    }

    /**
     * Apply interference effect to an ImageData object.
     * @param {ImageData} imageData - The image to modify
     * @param {Object} options - Override options for this call
     * @returns {ImageData} - Modified image with interference
     */
    apply(imageData, options = {}) {
        const removal = options.removalPercent ?? this.removalPercent;
        const alpha = options.ghostAlpha ?? this.ghostAlpha;
        const seed = options.seed ?? this.seed;

        const data = imageData.data;
        const totalPixels = data.length / 4;
        const pixelsToRemove = Math.floor(totalPixels * removal);

        // Seeded random for reproducibility
        const random = this._createRandom(seed);

        // Track which pixels to remove
        const toRemove = new Set();
        while (toRemove.size < pixelsToRemove) {
            toRemove.add(Math.floor(random() * totalPixels));
        }

        // Apply ghost effect
        for (const pixelIdx of toRemove) {
            const idx = pixelIdx * 4;

            // Option 1: Fade to ghost (semi-transparent)
            if (this.preserveData) {
                // Reduce opacity, keep color hint
                data[idx + 3] = Math.floor(255 * alpha);
                // Add slight cyan tint
                data[idx] = Math.min(255, data[idx] + 20);
                data[idx + 1] = Math.min(255, data[idx + 1] + 40);
            } else {
                // Option 2: Replace with interference noise
                data[idx] = this.noiseColor[0];     // R
                data[idx + 1] = this.noiseColor[1]; // G
                data[idx + 2] = this.noiseColor[2]; // B
                data[idx + 3] = Math.floor(255 * alpha); // A
            }
        }

        return imageData;
    }

    /**
     * Apply interference with spatial coherence (clusters of removed pixels).
     * Creates more natural "interference zones" rather than random noise.
     */
    applyClustered(imageData, options = {}) {
        const removal = options.removalPercent ?? this.removalPercent;
        const clusterSize = options.clusterSize || 5;
        const alpha = options.ghostAlpha ?? this.ghostAlpha;
        const seed = options.seed ?? this.seed;

        const width = imageData.width;
        const height = imageData.height;
        const data = imageData.data;

        const random = this._createRandom(seed);
        const totalPixels = width * height;
        const targetRemoval = Math.floor(totalPixels * removal);
        let removed = 0;

        // Generate cluster centers
        const numClusters = Math.ceil(targetRemoval / (clusterSize * clusterSize));
        const clusters = [];

        for (let i = 0; i < numClusters; i++) {
            clusters.push({
                x: Math.floor(random() * width),
                y: Math.floor(random() * height),
                intensity: 0.3 + random() * 0.7  // Varying intensity
            });
        }

        // Apply cluster-based removal
        for (const cluster of clusters) {
            const radius = clusterSize;
            const cx = cluster.x;
            const cy = cluster.y;

            for (let dy = -radius; dy <= radius; dy++) {
                for (let dx = -radius; dx <= radius; dx++) {
                    if (removed >= targetRemoval) break;

                    const x = cx + dx;
                    const y = cy + dy;

                    if (x < 0 || x >= width || y < 0 || y >= height) continue;

                    // Distance-based probability
                    const dist = Math.sqrt(dx * dx + dy * dy);
                    const prob = Math.max(0, 1 - dist / radius) * cluster.intensity;

                    if (random() < prob) {
                        const idx = (y * width + x) * 4;

                        // Ghost effect with distance falloff
                        const effectAlpha = alpha * (1 - dist / radius);
                        data[idx + 3] = Math.floor(255 * effectAlpha);

                        // Cyan interference tint
                        data[idx] = Math.min(255, data[idx] + 15);
                        data[idx + 1] = Math.min(255, data[idx + 1] + 30);

                        removed++;
                    }
                }
            }
        }

        return imageData;
    }

    /**
     * Apply scanline-style interference (horizontal bands).
     * Simulates CRT/hologram transmission artifacts.
     */
    applyScanlines(imageData, options = {}) {
        const removal = options.removalPercent ?? this.removalPercent;
        const scanlineGap = options.scanlineGap || 8;
        const alpha = options.ghostAlpha ?? this.ghostAlpha;
        const seed = options.seed ?? this.seed;

        const width = imageData.width;
        const height = imageData.height;
        const data = imageData.data;

        const random = this._createRandom(seed);

        // Determine which scanlines to affect
        const numAffectedLines = Math.floor(height * removal * scanlineGap);
        const affectedLines = new Set();

        while (affectedLines.size < numAffectedLines) {
            affectedLines.add(Math.floor(random() * height));
        }

        // Apply scanline interference
        for (const y of affectedLines) {
            const lineAlpha = alpha * (0.5 + random() * 0.5);

            for (let x = 0; x < width; x++) {
                const idx = (y * width + x) * 4;

                // Vary effect along the line
                if (random() < 0.7) {
                    data[idx + 3] = Math.floor(255 * lineAlpha);
                    data[idx] = Math.min(255, data[idx] + 25);
                    data[idx + 1] = Math.min(255, data[idx + 1] + 50);
                }
            }
        }

        return imageData;
    }

    /**
     * Apply flickering interference (time-based for animation).
     * Returns a function that can be called each frame.
     */
    createFlickerEffect(imageData, options = {}) {
        const removal = options.removalPercent ?? this.removalPercent;
        const alpha = options.ghostAlpha ?? this.ghostAlpha;
        const flickerSpeed = options.flickerSpeed || 0.1;

        let time = 0;
        const originalData = new Uint8ClampedArray(imageData.data);

        return function flicker() {
            time += flickerSpeed;

            // Perlin-like noise using sin
            const noise = (Math.sin(time) + Math.sin(time * 2.3) + Math.sin(time * 5.7)) / 3;
            const currentRemoval = removal * (0.5 + 0.5 * noise);

            // Restore original first
            imageData.data.set(originalData);

            // Apply time-varying interference
            const totalPixels = imageData.data.length / 4;
            const pixelsToRemove = Math.floor(totalPixels * Math.max(0, currentRemoval));

            for (let i = 0; i < pixelsToRemove; i++) {
                const pixelIdx = Math.floor(Math.random() * totalPixels);
                const idx = pixelIdx * 4;

                imageData.data[idx + 3] = Math.floor(255 * alpha);
                imageData.data[idx] = Math.min(255, imageData.data[idx] + 20);
                imageData.data[idx + 1] = Math.min(255, imageData.data[idx + 1] + 40);
            }

            return imageData;
        };
    }

    /**
     * Create a "ghost" offset duplicate of the image.
     * The ghost is shifted and semi-transparent.
     */
    applyGhostDuplicate(canvas, options = {}) {
        const offsetX = options.offsetX || 5;
        const offsetY = options.offsetY || 3;
        const ghostAlpha = options.ghostAlpha ?? this.ghostAlpha;

        const ctx = canvas.getContext('2d');
        const width = canvas.width;
        const height = canvas.height;

        // Get original image data
        const originalData = ctx.getImageData(0, 0, width, height);

        // Create ghost layer
        const ghostCanvas = document.createElement('canvas');
        ghostCanvas.width = width;
        ghostCanvas.height = height;
        const ghostCtx = ghostCanvas.getContext('2d');

        // Draw ghost with offset
        ghostCtx.globalAlpha = ghostAlpha;
        ghostCtx.putImageData(originalData, offsetX, offsetY);

        // Apply cyan tint to ghost
        ghostCtx.globalCompositeOperation = 'source-atop';
        ghostCtx.fillStyle = `rgba(0, 255, 255, 0.3)`;
        ghostCtx.fillRect(0, 0, width, height);

        // Composite ghost onto original
        ctx.globalAlpha = 1;
        ctx.drawImage(ghostCanvas, 0, 0);

        return canvas;
    }

    /**
     * Create seeded random number generator.
     */
    _createRandom(seed) {
        if (seed === null) {
            return Math.random;
        }

        // Simple LCG random
        let s = seed;
        return function() {
            s = (s * 1103515245 + 12345) & 0x7fffffff;
            return s / 0x7fffffff;
        };
    }

    /**
     * Create interference pattern for holographic display.
     * Combines multiple effect types.
     */
    createHolographicGlitch(imageData, options = {}) {
        const intensity = options.intensity || 0.5;

        // Layer 1: Base random removal
        this.apply(imageData, {
            removalPercent: 0.05 * intensity,
            ghostAlpha: 0.4
        });

        // Layer 2: Clustered interference zones
        this.applyClustered(imageData, {
            removalPercent: 0.03 * intensity,
            clusterSize: 4,
            ghostAlpha: 0.3
        });

        // Layer 3: Subtle scanlines
        this.applyScanlines(imageData, {
            removalPercent: 0.02 * intensity,
            scanlineGap: 16,
            ghostAlpha: 0.2
        });

        return imageData;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { HolographicInterference };
}
