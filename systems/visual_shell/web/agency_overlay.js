/**
 * AgencyOverlay - PixiJS overlay for spatial persona visualization with agency division colors
 *
 * Task 7.3: Frontend Agency Overlay
 *
 * Features:
 * - Visualizes active persona with aura/glow matching Agency Division color codes
 * - Renders pulsing glow around active Hilbert sector
 * - Displays persona label with division color indicator
 * - Provides visual feedback when spatial persona shifts
 *
 * @class AgencyOverlay
 */

class AgencyOverlay {
    /**
     * Create a new AgencyOverlay
     * @param {PIXI.Application} pixiApp - The PixiJS application instance
     * @param {PIXI.Sprite} atlasSprite - The sprite to render overlays on
     */
    constructor(pixiApp, atlasSprite) {
        this.app = pixiApp;
        this.atlasSprite = atlasSprite;
        this.activePersona = null;
        this.auraGraphics = new PIXI.Graphics();
        this.personaLabel = null;
        this.pulseAnimation = null;

        // Color mapping from Agency Agents
        this.DIVISION_COLORS = {
            'engineering': '#3B82F6',   // Blue
            'design': '#EC4899',       // Pink
            'testing': '#F59E0B',      // Amber
            'specialized': '#8B5CF6',  // Purple
            'spatial-computing': '#06B6D4', // Cyan (Metallic Blue)
            'default': '#6B7280',      // Gray
        };

        // Initialize container
        this.container = new PIXI.Container();
        this.container.visible = false;
        this.container.alpha = 0.9;
        this.container.sortableChildren = true;
        this.container.zIndex = 1001;

        // Add graphics to container
        this.container.addChild(this.auraGraphics);

        // Add to PixiJS stage
        this.app.stage.addChild(this.container);
    }

    /**
     * Handle persona activation message
     * @param {object} message - Message containing persona activation data
     */
    handlePersonaActive(message) {
        // message: { type: "PERSONA_ACTIVE", persona_id: "...", color: "#..." }
        const { persona_id, color, division_name } = message;

        // Store active persona
        this.activePersona = {
            id: persona_id,
            color: color,
            division: division_name
        };

        // Update visual elements
        this.renderAura(this.activePersona);
        this.showPersonaLabel(this.activePersona);

        // Show container
        this.container.visible = true;

        // Start pulse animation
        this.startPulseAnimation();
    }

    /**
     * Render pulsing aura around active sector
     * @param {object} persona - The active persona object
     */
    renderAura(persona) {
        // Clear previous graphics
        this.auraGraphics.clear();

        // Get color - use provided color or division color
        const color = this.getDivisionColor(persona.division);

        // Draw pulsing glow around active sector
        // For now, create a full-screen glow effect that follows the atlas
        this.auraGraphics.beginFill(color, 0.2);
        this.auraGraphics.drawRect(0, 0, this.app.view.width, this.app.view.height);
        this.auraGraphics.endFill();

        // Draw rounded rectangle border
        this.auraGraphics.lineStyle(3, color, 0.8);
        this.auraGraphics.drawRoundedRect(5, 5, this.app.view.width - 10, this.app.view.height - 10, 20);
    }

    /**
     * Display persona label in corner
     * @param {object} persona - The active persona object
     */
    showPersonaLabel(persona) {
        // Remove existing label
        if (this.personaLabel) {
            this.container.removeChild(this.personaLabel);
            this.personaLabel.destroy();
            this.personaLabel = null;
        }

        // Create label background
        const bgColor = this.getDivisionColor(persona.division);

        // Create text
        const labelText = persona.division ?
            `🔒 ${persona.division.charAt(0).toUpperCase() + persona.division.slice(1)}` :
            '🔒 Default';

        // Create PIXI.Text object
        this.personaLabel = new PIXI.Text(labelText, {
            fontFamily: 'Arial',
            fontSize: 18,
            fill: 0xFFFFFF,
            fontWeight: 'bold',
            dropShadow: true,
            dropShadowColor: bgColor,
            dropShadowBlur: 4,
            dropShadowAlpha: 0.8,
            dropShadowDistance: 2
        });

        // Position in top-right corner with padding
        this.personaLabel.x = this.app.view.width - this.personaLabel.width - 20;
        this.personaLabel.y = 20;

        // Create background
        const bg = new PIXI.Graphics();
        bg.beginFill(bgColor, 0.8);
        bg.drawRoundedRect(
            this.personaLabel.x - 10,
            this.personaLabel.y - 5,
            this.personaLabel.width + 20,
            this.personaLabel.height + 10,
            8
        );
        bg.endFill();

        // Add background first (so it's behind text)
        this.container.addChild(bg);
        this.container.addChild(this.personaLabel);

        // Store reference to background for cleanup
        this.personaLabel.bg = bg;
    }

    /**
     * Start pulse animation for aura effect
     */
    startPulseAnimation() {
        if (this.pulseAnimation) {
            cancelAnimationFrame(this.pulseAnimation);
        }

        const animate = () => {
            if (!this.activePersona) return;

            const pulseIntensity = 0.5 + 0.5 * Math.sin(Date.now() / 500);
            const color = this.getDivisionColor(this.activePersona.division);

            // Update aura with pulsing effect
            this.auraGraphics.clear();

            // Create multiple layers for glow effect
            for (let i = 3; i > 0; i--) {
                const alpha = (pulseIntensity * 0.1) / i;
                this.auraGraphics.beginFill(color, alpha);

                const offset = i * 10;
                this.auraGraphics.drawRect(
                    -offset,
                    -offset,
                    this.app.view.width + (offset * 2),
                    this.app.view.height + (offset * 2)
                );
            }

            // Draw main border
            this.auraGraphics.lineStyle(2, color, pulseIntensity * 0.8);
            this.auraGraphics.drawRoundedRect(
                5,
                5,
                this.app.view.width - 10,
                this.app.view.height - 10,
                20
            );

            this.pulseAnimation = requestAnimationFrame(animate);
        };

        animate();
    }

    /**
     * Get division color from mapping
     * @param {string} division - The division name
     * @returns {string} - Hex color code
     */
    getDivisionColor(division) {
        if (!division) return this.DIVISION_COLORS.default;

        const normalizedDivision = division.toLowerCase().replace(/[-\s]/g, '-');
        return this.DIVISION_COLORS[normalizedDivision] || this.DIVISION_COLORS.default;
    }

    /**
     * Convert Hilbert bounds to screen coordinates
     * @param {object} bounds - Hilbert sector bounds
     * @returns {object} - Screen coordinates
     */
    hilbertToScreen(bounds) {
        // Placeholder implementation
        // In a real implementation, this would convert Hilbert curve coordinates
        // to actual screen coordinates based on the atlas mapping
        return {
            x: bounds.x || 0,
            y: bounds.y || 0,
            width: bounds.width || this.app.view.width,
            height: bounds.height || this.app.view.height
        };
    }

    /**
     * Set active persona bounds (for sector-specific aura)
     * @param {object} bounds - The bounds of the active Hilbert sector
     */
    setPersonaBounds(bounds) {
        if (!this.activePersona) return;

        // Store bounds for rendering
        this.activePersona.bounds = bounds;

        // Update aura with specific bounds
        const rect = this.hilbertToScreen(bounds);
        const color = this.getDivisionColor(this.activePersona.division);

        // Clear and redraw with specific bounds
        this.auraGraphics.clear();
        const pulseIntensity = 0.5 + 0.5 * Math.sin(Date.now() / 500);

        // Draw pulsing glow around specific sector
        this.auraGraphics.beginFill(color, pulseIntensity * 0.3);
        this.auraGraphics.drawRoundedRect(
            rect.x,
            rect.y,
            rect.width,
            rect.height,
            10
        );
        this.auraGraphics.endFill();

        // Draw border
        this.auraGraphics.lineStyle(2, color, pulseIntensity);
        this.auraGraphics.drawRoundedRect(
            rect.x,
            rect.y,
            rect.width,
            rect.height,
            10
        );
    }

    /**
     * Hide the overlay
     */
    hide() {
        this.container.visible = false;
        this.activePersona = null;

        if (this.pulseAnimation) {
            cancelAnimationFrame(this.pulseAnimation);
            this.pulseAnimation = null;
        }
    }

    /**
     * Set overlay visibility
     * @param {boolean} visible - Whether overlay should be visible
     */
    setVisible(visible) {
        this.container.visible = visible;
        if (!visible) {
            this.activePersona = null;
            if (this.pulseAnimation) {
                cancelAnimationFrame(this.pulseAnimation);
                this.pulseAnimation = null;
            }
        }
    }

    /**
     * Clean up resources
     */
    destroy() {
        // Stop animation
        if (this.pulseAnimation) {
            cancelAnimationFrame(this.pulseAnimation);
        }

        // Remove from stage
        if (this.container) {
            this.app.stage.removeChild(this.container);
            this.container.destroy({ children: true });
        }

        // Clear references
        this.auraGraphics = null;
        this.personaLabel = null;
        this.activePersona = null;
    }
}

// Export for various environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AgencyOverlay;
}
if (typeof window !== 'undefined') {
    window.AgencyOverlay = AgencyOverlay;
}
export { AgencyOverlay };