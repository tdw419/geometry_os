/**
 * MemoryBeamRenderer - Geometry OS Semantic Memory Visualization
 *
 * Renders "Memory Beams" - Cyan glow lines connecting the cursor to
 * semantically related "Thought Pixels" from past sessions.
 *
 * Part of Path 2: Memory Beams (Hippocampus Integration)
 *
 * Features:
 * - Cyan glow lines from cursor to memory coordinates
 * - Ghost Pixels (pulsed circles at memory locations)
 * - Intensity mapping based on similarity scores
 * - 60 FPS performance with RenderGroup isolation
 *
 * Usage:
 *   // In application.js
 *   this.memoryBeams = new MemoryBeamRenderer(this.app);
 *
 *   // Enable semantic drag (Middle Mouse + Shift)
 *   this.memoryBeams.activate(cursorX, cursorY);
 *   this.memoryBeams.updateMemories(memories);
 *   this.memoryBeams.deactivate();
 */

class MemoryBeamRenderer {
    constructor(pixiApp, options = {}) {
        this.app = pixiApp;
        this.options = {
            beamColor: options.beamColor || 0x00d4ff,      // Cyan
            ghostColor: options.ghostColor || 0x00ffff,     // Cyan ghost
            maxBeams: options.maxBeams || 50,               // Max concurrent beams
            glowAlpha: options.glowAlpha || 0.6,            // Base glow opacity
            pulseSpeed: options.pulseSpeed || 0.05,         // Ghost pulse rate
            minThickness: options.minThickness || 1,        // Min line width
            maxThickness: options.maxThickness || 4,        // Max line width
            ghostRadius: options.ghostRadius || 8,          // Ghost pixel size
            ...options
        };

        // State
        this.isActive = false;
        this.cursorPosition = { x: 0, y: 0 };
        this.memories = [];
        this.pulsePhase = 0;

        // Create container in isolated RenderGroup for performance
        this.container = new PIXI.Container();
        this.container.label = 'MemoryBeams';

        // Graphics for beams (recreated each frame for glow effect)
        this.beamGraphics = new PIXI.Graphics();
        this.beamGraphics.label = 'BeamLines';
        this.container.addChild(this.beamGraphics);

        // Container for ghost pixels (sprites/persistent)
        this.ghostContainer = new PIXI.Container();
        this.ghostContainer.label = 'GhostPixels';
        this.container.addChild(this.ghostContainer);

        // Text labels for memory previews
        this.labelContainer = new PIXI.Container();
        this.labelContainer.label = 'MemoryLabels';
        this.container.addChild(this.labelContainer);

        // Add to stage (but invisible until activated)
        this.container.visible = false;
        this.app.stage.addChild(this.container);

        // Ghost pixel pool for performance
        this.ghostPool = [];
        this.labelPool = [];
        this._initPool();

        console.log(' MemoryBeamRenderer initialized');
    }

    /**
     * Initialize object pools for performance
     */
    _initPool() {
        for (let i = 0; i < this.options.maxBeams; i++) {
            // Ghost pixel (circle)
            const ghost = new PIXI.Graphics();
            ghost.visible = false;
            this.ghostContainer.addChild(ghost);
            this.ghostPool.push(ghost);

            // Label (text preview)
            const label = new PIXI.Text('', {
                fontFamily: 'Courier New',
                fontSize: 10,
                fill: 0x00d4ff,
                alpha: 0.8
            });
            label.visible = false;
            label.anchor.set(0.5, 0);
            this.labelContainer.addChild(label);
            this.labelPool.push(label);
        }
    }

    /**
     * Activate memory beam visualization
     * @param {number} cursorX - Current cursor X position
     * @param {number} cursorY - Current cursor Y position
     */
    activate(cursorX, cursorY) {
        this.isActive = true;
        this.container.visible = true;
        this.cursorPosition = { x: cursorX, y: cursorY };
        console.log(' Memory Beams activated at', cursorX, cursorY);
    }

    /**
     * Deactivate and hide memory beams
     */
    deactivate() {
        this.isActive = false;
        this.container.visible = false;
        this.memories = [];
        this._hideAllGhosts();
        console.log(' Memory Beams deactivated');
    }

    /**
     * Update cursor position (call on mouse move during semantic drag)
     * @param {number} x - Cursor X
     * @param {number} y - Cursor Y
     */
    updateCursor(x, y) {
        this.cursorPosition = { x, y };
    }

    /**
     * Update memory data from backend
     * @param {Array} memories - Array of memory objects:
     *   { x, y, similarity, preview, timestamp }
     */
    updateMemories(memories) {
        // Sort by similarity and limit
        this.memories = memories
            .sort((a, b) => b.similarity - a.similarity)
            .slice(0, this.options.maxBeams);
    }

    /**
     * Main render loop - call from application update()
     * @param {number} deltaTime - Frame delta time
     */
    render(deltaTime) {
        if (!this.isActive || this.memories.length === 0) {
            return;
        }

        // Update pulse phase for ghost animation
        this.pulsePhase += this.options.pulseSpeed * deltaTime;
        if (this.pulsePhase > Math.PI * 2) {
            this.pulsePhase -= Math.PI * 2;
        }

        // Clear previous beams
        this.beamGraphics.clear();

        // Draw beams and update ghosts
        this.memories.forEach((memory, index) => {
            this._drawBeam(memory, index);
            this._updateGhost(memory, index);
        });

        // Hide unused ghosts
        for (let i = this.memories.length; i < this.options.maxBeams; i++) {
            this.ghostPool[i].visible = false;
            this.labelPool[i].visible = false;
        }
    }

    /**
     * Draw a single beam line with glow effect
     */
    _drawBeam(memory, index) {
        const { x, y, similarity } = memory;
        const { x: cx, y: cy } = this.cursorPosition;

        // Calculate intensity-based styling
        const intensity = Math.max(0.1, Math.min(1.0, similarity));
        const alpha = this.options.glowAlpha * intensity;
        const thickness = this.options.minThickness +
            (this.options.maxThickness - this.options.minThickness) * intensity;

        // Draw outer glow (thicker, more transparent)
        this.beamGraphics.lineStyle(thickness + 2, this.options.beamColor, alpha * 0.3);
        this.beamGraphics.moveTo(cx, cy);
        this.beamGraphics.lineTo(x, y);

        // Draw inner beam (thinner, more opaque)
        this.beamGraphics.lineStyle(thickness, this.options.beamColor, alpha);
        this.beamGraphics.moveTo(cx, cy);
        this.beamGraphics.lineTo(x, y);

        // Draw core (brightest)
        this.beamGraphics.lineStyle(1, 0xffffff, alpha * 0.5);
        this.beamGraphics.moveTo(cx, cy);
        this.beamGraphics.lineTo(x, y);
    }

    /**
     * Update ghost pixel at memory location
     */
    _updateGhost(memory, index) {
        const ghost = this.ghostPool[index];
        const label = this.labelPool[index];
        const { x, y, similarity, preview } = memory;

        // Pulsing alpha for ghost
        const pulseAlpha = 0.5 + 0.3 * Math.sin(this.pulsePhase + index * 0.5);
        const intensity = Math.max(0.2, Math.min(1.0, similarity));
        const radius = this.options.ghostRadius * intensity;

        // Draw ghost circle
        ghost.clear();
        ghost.beginFill(this.options.ghostColor, pulseAlpha * intensity);
        ghost.drawCircle(0, 0, radius);
        ghost.endFill();

        // Outer glow
        ghost.beginFill(this.options.ghostColor, pulseAlpha * intensity * 0.3);
        ghost.drawCircle(0, 0, radius + 4);
        ghost.endFill();

        ghost.position.set(x, y);
        ghost.visible = true;

        // Update label
        if (preview) {
            label.text = preview.substring(0, 30) + (preview.length > 30 ? '...' : '');
            label.position.set(x, y + radius + 5);
            label.alpha = intensity * 0.8;
            label.visible = true;
        } else {
            label.visible = false;
        }
    }

    /**
     * Hide all ghost pixels
     */
    _hideAllGhosts() {
        this.ghostPool.forEach(ghost => ghost.visible = false);
        this.labelPool.forEach(label => label.visible = false);
    }

    /**
     * Generate mock memories for testing
     * @param {number} count - Number of mock memories
     * @param {number} aroundX - Center X coordinate
     * @param {number} aroundY - Center Y coordinate
     * @param {number} radius - Search radius
     */
    generateMockMemories(count = 10, aroundX = 0, aroundY = 0, radius = 500) {
        const mockMemories = [];
        const mockPreviews = [
            'notification_badge as RELAXED type',
            'CriticalityClassifier heuristics',
            'VisualIntent dataclass',
            'Mirror Validation pipeline',
            'Genetic Snapshot created',
            'Sandbox validation passed',
            'Primordial Rollback triggered',
            'Phase 3: MIRROR_VALIDATE',
            'Master Stage proposal',
            'perception_benchmark.py'
        ];

        for (let i = 0; i < count; i++) {
            const angle = Math.random() * Math.PI * 2;
            const dist = Math.random() * radius;
            mockMemories.push({
                x: aroundX + Math.cos(angle) * dist,
                y: aroundY + Math.sin(angle) * dist,
                similarity: 0.3 + Math.random() * 0.7,
                preview: mockPreviews[i % mockPreviews.length],
                timestamp: Date.now() - Math.random() * 86400000 * 7 // Random within last week
            });
        }

        return mockMemories;
    }

    /**
     * Debug: Test the renderer with mock data
     */
    debugTest() {
        const mockMemories = this.generateMockMemories(15, 400, 300, 300);
        this.activate(400, 300);
        this.updateMemories(mockMemories);
        console.log(' MemoryBeamRenderer debug test activated');
        console.log('  Call: window.memoryBeams.deactivate() to stop');

        // Expose for console testing
        window.memoryBeams = this;
    }

    /**
     * Clean up resources
     */
    destroy() {
        this.container.destroy({ children: true });
        this.app.stage.removeChild(this.container);
    }
}

// Export for ES6 modules (if using bundler)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MemoryBeamRenderer };
}
