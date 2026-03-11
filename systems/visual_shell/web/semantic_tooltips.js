/**
 * Geometry OS: Phase 20 - Track 1.3
 * Semantic Tooltips System
 * 
 * Provides context-aware, intelligent tooltips for layout containers
 * and semantic groups identified by LayoutGAN.
 * 
 * Features:
 * - Automatic tooltip generation based on element relationships
 * - Semantic group labeling (e.g., "Application Zone", "Document Cluster")
 * - Cognitive load indicators
 * - Layout optimization suggestions
 * - Animated, glassmorphic visual style
 */

class SemanticTooltipSystem {
    constructor(options = {}) {
        this.config = {
            showDelay: options.showDelay || 500,        // ms before showing
            hideDelay: options.hideDelay || 200,        // ms before hiding
            animationDuration: options.animationDuration || 200,
            maxWidth: options.maxWidth || 280,
            padding: options.padding || 12,
            cornerRadius: options.cornerRadius || 8,
            glassOpacity: options.glassOpacity || 0.85,
            accentColor: options.accentColor || 0x00ff9d,
        };

        // Active tooltips
        this.activeTooltips = new Map();
        this.hoverTimeout = null;
        this.hideTimeout = null;

        // Tooltip container (created on first use)
        this.container = null;

        // Semantic type descriptions
        this.typeDescriptions = {
            'app': { icon: '📦', label: 'Application Zone', color: 0xffd700 },
            'folder': { icon: '📁', label: 'Directory Cluster', color: 0xffaa00 },
            'file': { icon: '📄', label: 'Document Area', color: 0x00ccff },
            'container': { icon: '🗂️', label: 'Container Group', color: 0x9966ff },
            'generic': { icon: '⬡', label: 'Element Group', color: 0x888888 },
        };

        // Insight templates for semantic groups
        this.insightTemplates = [
            { condition: (g) => g.members.length > 5, text: '💡 Consider splitting this large group' },
            { condition: (g) => g.avgImportance > 7, text: '⚡ High-priority zone' },
            { condition: (g) => g.avgImportance < 3, text: '📦 Archive candidates' },
            { condition: (g) => g.cognitiveLoad > 60, text: '🧠 High cognitive load area' },
        ];

        console.log('[TOOLTIPS] Semantic Tooltip System initialized');
    }

    /**
     * Initialize with PIXI application
     * @param {PIXI.Application} app - PixiJS application
     * @param {PIXI.Container} world - World container
     */
    init(app, world) {
        this.app = app;
        this.world = world;

        // Create tooltip container layer
        this.container = new PIXI.Container();
        this.container.zIndex = 9999;
        app.stage.addChild(this.container);

        console.log('[TOOLTIPS] Attached to PIXI stage');
    }

    /**
     * Generate tooltip data for an element
     * @param {string} elementId - Element ID
     * @param {object} element - Element data from SaccadeEngine
     * @param {object} layoutGAN - LayoutGAN instance for context
     */
    generateElementTooltip(elementId, element, layoutGAN = null) {
        const typeInfo = this.typeDescriptions[element.type] || this.typeDescriptions.generic;

        const tooltip = {
            id: elementId,
            type: 'element',
            icon: typeInfo.icon,
            title: this._formatElementName(elementId),
            subtitle: typeInfo.label,
            color: typeInfo.color,
            metrics: [
                { label: 'Importance', value: element.importance, max: 10 },
                { label: 'Position', value: `(${element.centerX.toFixed(0)}, ${element.centerY.toFixed(0)})` },
            ],
            insights: [],
        };

        // Add insights based on element state
        if (element.importance >= 8) {
            tooltip.insights.push({ icon: '⭐', text: 'High-priority element' });
        }
        if (element.fixationCount && element.fixationCount > 5) {
            tooltip.insights.push({ icon: '👁️', text: 'Frequently viewed' });
        }

        return tooltip;
    }

    /**
     * Generate tooltip data for a semantic group
     * @param {object} group - Semantic group from LayoutGAN
     * @param {SaccadeEngine} saccadeEngine - For metrics
     */
    generateGroupTooltip(group, saccadeEngine = null) {
        const typeInfo = this.typeDescriptions[group.primaryType] || this.typeDescriptions.generic;

        // Calculate group metrics
        let avgImportance = 0;
        let cognitiveLoad = 0;

        if (saccadeEngine) {
            const members = group.members.map(id => saccadeEngine.elements.get(id)).filter(Boolean);
            avgImportance = members.reduce((sum, m) => sum + m.importance, 0) / members.length;

            // Estimate cognitive load based on group spread
            if (members.length > 1) {
                let maxDist = 0;
                for (let i = 0; i < members.length; i++) {
                    for (let j = i + 1; j < members.length; j++) {
                        const dist = Math.sqrt(
                            Math.pow(members[i].centerX - members[j].centerX, 2) +
                            Math.pow(members[i].centerY - members[j].centerY, 2)
                        );
                        maxDist = Math.max(maxDist, dist);
                    }
                }
                cognitiveLoad = Math.min(100, (maxDist / 200) * 50 + members.length * 5);
            }
        }

        const tooltip = {
            id: `group:${group.members[0]}`,
            type: 'group',
            icon: typeInfo.icon,
            title: typeInfo.label,
            subtitle: `${group.members.length} related elements`,
            color: typeInfo.color,
            metrics: [
                { label: 'Elements', value: group.members.length },
                { label: 'Avg Importance', value: avgImportance.toFixed(1), max: 10 },
                { label: 'Cognitive Load', value: `${cognitiveLoad.toFixed(0)}%` },
            ],
            insights: [],
            centroid: { x: group.centroidX, y: group.centroidY },
            avgImportance,
            cognitiveLoad,
        };

        // Apply insight templates
        for (const template of this.insightTemplates) {
            if (template.condition(tooltip)) {
                tooltip.insights.push({ icon: template.text.split(' ')[0], text: template.text.substring(2).trim() });
            }
        }

        return tooltip;
    }

    /**
     * Show a tooltip at the specified position
     * @param {object} tooltipData - Tooltip data from generate methods
     * @param {number} x - Screen X position
     * @param {number} y - Screen Y position
     */
    show(tooltipData, x, y) {
        if (!this.container) {
            console.warn('[TOOLTIPS] Container not initialized');
            return;
        }

        // Clear any existing tooltip with same ID
        this.hide(tooltipData.id);

        // Create tooltip graphics
        const tooltip = new PIXI.Container();
        tooltip.alpha = 0;
        tooltip.x = x + 15;
        tooltip.y = y + 15;

        // Calculate content dimensions
        const width = this.config.maxWidth;
        const lineHeight = 18;
        let currentY = this.config.padding;

        // Background with glass effect
        const bg = new PIXI.Graphics();

        // Header with accent color
        const headerBg = new PIXI.Graphics();
        headerBg.beginFill(tooltipData.color, 0.3);
        headerBg.drawRoundedRect(0, 0, width, 40, { tl: this.config.cornerRadius, tr: this.config.cornerRadius, bl: 0, br: 0 });
        headerBg.endFill();
        tooltip.addChild(headerBg);

        // Icon + Title
        const titleText = new PIXI.Text(`${tooltipData.icon} ${tooltipData.title}`, {
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0xffffff,
            fontFamily: 'Courier New',
        });
        titleText.x = this.config.padding;
        titleText.y = currentY;
        tooltip.addChild(titleText);
        currentY += lineHeight + 4;

        // Subtitle
        const subtitleText = new PIXI.Text(tooltipData.subtitle, {
            fontSize: 11,
            fill: 0xaaaaaa,
            fontFamily: 'Courier New',
        });
        subtitleText.x = this.config.padding;
        subtitleText.y = currentY;
        tooltip.addChild(subtitleText);
        currentY += lineHeight + 8;

        // Metrics
        for (const metric of tooltipData.metrics) {
            const metricContainer = new PIXI.Container();
            metricContainer.y = currentY;
            metricContainer.x = this.config.padding;

            const labelText = new PIXI.Text(`${metric.label}:`, {
                fontSize: 11,
                fill: 0x888888,
                fontFamily: 'Courier New',
            });
            metricContainer.addChild(labelText);

            const valueText = new PIXI.Text(String(metric.value), {
                fontSize: 11,
                fontWeight: 'bold',
                fill: tooltipData.color,
                fontFamily: 'Courier New',
            });
            valueText.x = width - this.config.padding * 2 - valueText.width;
            metricContainer.addChild(valueText);

            // Progress bar if max is defined
            if (metric.max && typeof metric.value === 'number') {
                const progress = new PIXI.Graphics();
                const barWidth = 60;
                const barHeight = 4;
                const barX = width - this.config.padding * 2 - barWidth;

                progress.beginFill(0x333333);
                progress.drawRect(barX, 4, barWidth, barHeight);
                progress.endFill();

                progress.beginFill(tooltipData.color);
                progress.drawRect(barX, 4, (metric.value / metric.max) * barWidth, barHeight);
                progress.endFill();

                metricContainer.addChild(progress);
            }

            tooltip.addChild(metricContainer);
            currentY += lineHeight;
        }

        // Insights
        if (tooltipData.insights.length > 0) {
            currentY += 4;

            // Separator line
            const sep = new PIXI.Graphics();
            sep.lineStyle(1, 0x444444);
            sep.moveTo(this.config.padding, currentY);
            sep.lineTo(width - this.config.padding, currentY);
            tooltip.addChild(sep);
            currentY += 8;

            for (const insight of tooltipData.insights) {
                const insightText = new PIXI.Text(`${insight.icon} ${insight.text}`, {
                    fontSize: 10,
                    fill: 0x00ff9d,
                    fontFamily: 'Courier New',
                });
                insightText.x = this.config.padding;
                insightText.y = currentY;
                tooltip.addChild(insightText);
                currentY += lineHeight - 4;
            }
        }

        // Calculate final height
        const height = currentY + this.config.padding;

        // Draw main background
        bg.beginFill(0x111111, this.config.glassOpacity);
        bg.drawRoundedRect(0, 0, width, height, this.config.cornerRadius);
        bg.endFill();
        bg.lineStyle(1, tooltipData.color, 0.5);
        bg.drawRoundedRect(0, 0, width, height, this.config.cornerRadius);

        // Insert background behind everything
        tooltip.addChildAt(bg, 0);

        // Add to container
        this.container.addChild(tooltip);
        this.activeTooltips.set(tooltipData.id, tooltip);

        // Animate in
        this._animateIn(tooltip);

        // Keep tooltip in viewport
        this._clampToViewport(tooltip, width, height);
    }

    /**
     * Hide a specific tooltip
     */
    hide(tooltipId) {
        const tooltip = this.activeTooltips.get(tooltipId);
        if (tooltip) {
            this._animateOut(tooltip, () => {
                this.container.removeChild(tooltip);
                tooltip.destroy({ children: true });
                this.activeTooltips.delete(tooltipId);
            });
        }
    }

    /**
     * Hide all tooltips
     */
    hideAll() {
        for (const [id] of this.activeTooltips) {
            this.hide(id);
        }
    }

    /**
     * Show tooltip for semantic groups from LayoutGAN
     */
    showGroupTooltips(groups, saccadeEngine) {
        for (const group of groups) {
            if (group.members.length < 2) continue;

            const tooltipData = this.generateGroupTooltip(group, saccadeEngine);

            // Convert world coordinates to screen coordinates
            const screenPos = this._worldToScreen(group.centroidX, group.centroidY);
            this.show(tooltipData, screenPos.x, screenPos.y);
        }
    }

    // Private methods

    _formatElementName(elementId) {
        // Extract filename from path
        if (elementId.startsWith('file:')) {
            const path = elementId.substring(5);
            const parts = path.split('/');
            return parts[parts.length - 1] || path;
        }
        return elementId;
    }

    _animateIn(tooltip) {
        const duration = this.config.animationDuration;
        const startTime = Date.now();
        const startY = tooltip.y + 10;
        const targetY = tooltip.y;

        const animate = () => {
            const progress = Math.min((Date.now() - startTime) / duration, 1);
            const eased = 1 - Math.pow(1 - progress, 3);

            tooltip.alpha = eased;
            tooltip.y = startY + (targetY - startY) * eased;

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }

    _animateOut(tooltip, callback) {
        const duration = this.config.animationDuration * 0.7;
        const startTime = Date.now();
        const startAlpha = tooltip.alpha;

        const animate = () => {
            const progress = Math.min((Date.now() - startTime) / duration, 1);

            tooltip.alpha = startAlpha * (1 - progress);

            if (progress < 1) {
                requestAnimationFrame(animate);
            } else {
                callback();
            }
        };

        requestAnimationFrame(animate);
    }

    _clampToViewport(tooltip, width, height) {
        const screenWidth = this.app.screen.width;
        const screenHeight = this.app.screen.height;
        const margin = 10;

        if (tooltip.x + width > screenWidth - margin) {
            tooltip.x = screenWidth - width - margin;
        }
        if (tooltip.y + height > screenHeight - margin) {
            tooltip.y = screenHeight - height - margin;
        }
        if (tooltip.x < margin) {
            tooltip.x = margin;
        }
        if (tooltip.y < margin) {
            tooltip.y = margin;
        }
    }

    _worldToScreen(worldX, worldY) {
        if (!this.world) {
            return { x: worldX, y: worldY };
        }
        return {
            x: worldX * this.world.scale.x + this.world.x,
            y: worldY * this.world.scale.y + this.world.y,
        };
    }

    /**
     * Get system statistics
     */
    getStats() {
        return {
            activeTooltips: this.activeTooltips.size,
            config: this.config,
        };
    }
}

// Export for use in Visual Shell
if (typeof window !== 'undefined') {
    window.SemanticTooltipSystem = SemanticTooltipSystem;
}

// Node.js / ES Module export
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SemanticTooltipSystem };
}
