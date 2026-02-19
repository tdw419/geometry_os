/**
 * VisualDebugOverlay - Phase 50: Advanced Visual Tools
 *
 * Glass Box AI debugging overlay that renders the AI's internal vision
 * as a live overlay in the visual_shell.
 *
 * Features:
 * - Bounding box visualization (from VisualVerificationService)
 * - Layout diff overlays (showing intent vs actual)
 * - OCR confidence display
 * - Verification metadata HUD
 * - Integration with Journeyman Stage VisualVerificationService
 *
 * @class VisualDebugOverlay
 */

class VisualDebugOverlay {
    constructor(config = {}) {
        this.config = {
            enabled: false,
            showBoundingboxes: true,
            showLayoutDiffs: true,
            showOCRConfidence: true,
            showVerificationHUD: true,
            showSpatialRelations: true,
            hudPosition: 'top-right', // top-left, top-right, bottom-left, bottom-right
            colors: {
                boundingBox: '#00ff00',
                boundingBoxFill: 'rgba(0, 255, 0, 0.1)',
                mismatch: '#ff4444',
                mismatchFill: 'rgba(255, 68, 68, 0.2)',
                success: '#44ff44',
                warning: '#ffaa00',
                critical: '#ff0000',
                spatial: '#00aaff',
                text: '#ffffff',
                hudBackground: 'rgba(0, 0, 0, 0.8)',
                ...config.colors
            },
            ...config
        };

        // State
        this.verificationResults = [];
        this.mirrorValidationResults = [];
        this.currentIntent = null;
        this.elementOverlays = new Map();
        this.lastVerification = null;

        // RISC-V UART state (Neuro-Silicon Bridge)
        this.uartBuffer = [];
        this.uartMaxLines = 50;
        this.lastUartTimestamp = null;

        // Canvas layers
        this.hudCanvas = null;
        this.hudCtx = null;
        this.overlayCanvas = null;
        this.overlayCtx = null;

        // Performance tracking
        this.renderTime = 0;
        this.frameCount = 0;

        // Initialize
        this._initCanvases();
        this._bindEvents();
        this._bindKeyboard();
    }

    /**
     * Initialize overlay canvases
     */
    _initCanvases() {
        if (typeof window === 'undefined') return;

        // HUD canvas (fixed position, top layer)
        this.hudCanvas = document.createElement('canvas');
        this.hudCanvas.id = 'visual-debug-hud';
        this.hudCanvas.style.cssText = `
            position: fixed;
            top: 0;
            right: 0;
            width: 320px;
            height: 100%;
            pointer-events: none;
            z-index: 10001;
            display: none;
        `;
        document.body.appendChild(this.hudCanvas);
        this.hudCtx = this.hudCanvas.getContext('2d');

        // Overlay canvas (full screen, for bounding boxes)
        this.overlayCanvas = document.createElement('canvas');
        this.overlayCanvas.id = 'visual-debug-overlay';
        this.overlayCanvas.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 10000;
            display: none;
        `;
        document.body.appendChild(this.overlayCanvas);
        this.overlayCtx = this.overlayCanvas.getContext('2d');

        // Resize handler
        window.addEventListener('resize', () => this._resizeCanvases());
        this._resizeCanvases();
    }

    /**
     * Resize canvases
     */
    _resizeCanvases() {
        if (!this.hudCanvas) return;

        this.hudCanvas.width = 320;
        this.hudCanvas.height = window.innerHeight;
        this.overlayCanvas.width = window.innerWidth;
        this.overlayCanvas.height = window.innerHeight;
    }

    /**
     * Bind keyboard shortcuts
     */
    _bindKeyboard() {
        if (typeof window === 'undefined') return;

        window.addEventListener('keydown', (e) => {
            // Ctrl+Shift+V to toggle visual debug overlay
            if (e.ctrlKey && e.shiftKey && e.key === 'V') {
                e.preventDefault();
                this.toggle();
            }
            // Ctrl+Shift+B to toggle bounding boxes
            if (e.ctrlKey && e.shiftKey && e.key === 'B') {
                e.preventDefault();
                this.config.showBoundingboxes = !this.config.showBoundingboxes;
                console.log(`Bounding boxes: ${this.config.showBoundingboxes ? 'ON' : 'OFF'}`);
            }
            // Ctrl+Shift+H to toggle HUD
            if (e.ctrlKey && e.shiftKey && e.key === 'H') {
                e.preventDefault();
                this.config.showVerificationHUD = !this.config.showVerificationHUD;
                console.log(`Verification HUD: ${this.config.showVerificationHUD ? 'ON' : 'OFF'}`);
            }
        });
    }

    /**
     * Bind events for integration
     */
    _bindEvents() {
        // Listen for verification results from EvolutionDaemon
        window.addEventListener('VISUAL_VERIFICATION_RESULT', (e) => {
            this.handleVerificationResult(e.detail);
        });

        // Listen for mirror validation results (Master Stage)
        window.addEventListener('MIRROR_VALIDATION_RESULT', (e) => {
            this.handleMirrorValidationResult(e.detail);
        });

        // Listen for intent updates
        window.addEventListener('VISUAL_INTENT_UPDATE', (e) => {
            this.handleIntentUpdate(e.detail);
        });

        // Listen for scene updates
        window.addEventListener('VISUAL_SCENE_UPDATE', (e) => {
            this.handleSceneUpdate(e.detail);
        });

        // Listen for RISC-V UART output (Neuro-Silicon Bridge)
        window.addEventListener('RISCV_UART_OUTPUT', (e) => {
            this.handleRiscvUart(e.detail);
        });
    }

    /**
     * Handle verification result from VisualVerificationService
     */
    handleVerificationResult(result) {
        this.lastVerification = {
            ...result,
            timestamp: Date.now()
        };

        if (!this.config.enabled) return;

        // Store result for overlay rendering
        this.verificationResults.push(this.lastVerification);

        // Keep only last 100 results
        if (this.verificationResults.length > 100) {
            this.verificationResults.shift();
        }

        // Trigger render
        this._scheduleRender();
    }

    /**
     * Handle mirror validation result from Master Stage shadow brain
     */
    handleMirrorValidationResult(result) {
        this.lastMirrorValidation = {
            ...result,
            timestamp: Date.now()
        };

        if (!this.config.enabled) {
            // Auto-enable if high priority result comes in
            if (result.success === false || result.immortality === false) {
                this.toggle();
            } else {
                return;
            }
        }

        this.mirrorValidationResults.push(this.lastMirrorValidation);
        if (this.mirrorValidationResults.length > 10) {
            this.mirrorValidationResults.shift();
        }

        this._scheduleRender();
    }

    /**
     * Handle intent update from EvolutionDaemon
     */
    handleIntentUpdate(intent) {
        this.currentIntent = intent;

        // Clear previous element overlays
        this.elementOverlays.clear();

        // Create overlay for this intent
        if (intent) {
            this.elementOverlays.set(intent.element_id || 'current', {
                type: intent.element_type,
                position: intent.position,
                size: intent.size,
                text: intent.properties?.text,
                critical: intent.critical,
                spatialRelations: intent.spatial_relations || []
            });
        }

        this._scheduleRender();
    }

    /**
     * Handle scene update from mirror neuron
     */
    handleSceneUpdate(scene) {
        this.currentScene = scene;
        this._scheduleRender();
    }

    /**
     * Handle RISC-V UART output from Neuro-Silicon Bridge
     */
    handleRiscvUart(data) {
        const text = data.text || '';
        const timestamp = data.timestamp || Date.now();

        // Split text into lines and add to buffer
        const lines = text.split('\n');
        for (const line of lines) {
            if (line.trim()) {
                this.uartBuffer.push({
                    text: line,
                    timestamp: timestamp,
                    vm_id: data.vm_id || 'default'
                });
            }
        }

        // Keep buffer limited
        while (this.uartBuffer.length > this.uartMaxLines) {
            this.uartBuffer.shift();
        }

        this.lastUartTimestamp = timestamp;

        // Auto-enable HUD if UART output comes in
        if (!this.config.enabled) {
            this.toggle();
        }

        this._scheduleRender();
    }

    /**
     * Schedule render on next animation frame
     */
    _scheduleRender() {
        if (this._renderScheduled) return;
        this._renderScheduled = true;

        requestAnimationFrame(() => {
            this._renderScheduled = false;
            this.render();
        });
    }

    /**
     * Toggle overlay
     */
    toggle() {
        this.config.enabled = !this.config.enabled;

        if (this.hudCanvas) {
            this.hudCanvas.style.display = this.config.enabled ? 'block' : 'none';
        }
        if (this.overlayCanvas) {
            this.overlayCanvas.style.display = this.config.enabled ? 'block' : 'none';
        }

        console.log(`Visual Debug Overlay ${this.config.enabled ? 'ENABLED' : 'DISABLED'}`);
        console.log('Shortcuts: Ctrl+Shift+V (toggle), Ctrl+Shift+B (boxes), Ctrl+Shift+H (HUD)');

        return this.config.enabled;
    }

    /**
     * Main render function
     */
    render() {
        if (!this.config.enabled) return;

        const startTime = performance.now();

        // Clear canvases
        this._clearCanvases();

        // Render overlays
        if (this.config.showBoundingboxes || this.config.showSpatialRelations) {
            this._renderElementOverlays();
        }

        // Render HUD
        if (this.config.showVerificationHUD) {
            this._renderHUD();
        }

        // Track performance
        this.renderTime = performance.now() - startTime;
        this.frameCount++;
    }

    /**
     * Clear canvases
     */
    _clearCanvases() {
        if (this.overlayCtx) {
            this.overlayCtx.clearRect(0, 0, this.overlayCanvas.width, this.overlayCanvas.height);
        }
        if (this.hudCtx) {
            this.hudCtx.clearRect(0, 0, this.hudCanvas.width, this.hudCanvas.height);
        }
    }

    /**
     * Render element overlays (bounding boxes, spatial relations)
     */
    _renderElementOverlays() {
        const ctx = this.overlayCtx;
        if (!ctx) return;

        // Render each element overlay
        for (const [id, overlay] of this.elementOverlays) {
            const { position, size, type, critical, spatialRelations } = overlay;

            if (!position || !size) continue;

            const [x, y] = position;
            const [width, height] = size;

            // Determine color based on verification status
            let boxColor = this.config.colors.boundingBox;
            let fillColor = this.config.colors.boundingBoxFill;

            if (this.lastVerification && !this.lastVerification.success) {
                boxColor = this.config.colors.mismatch;
                fillColor = this.config.colors.mismatchFill;
            } else if (this.lastVerification && this.lastVerification.success) {
                boxColor = this.config.colors.success;
                fillColor = 'rgba(68, 255, 68, 0.1)';
            }

            // Draw bounding box
            if (this.config.showBoundingboxes) {
                ctx.strokeStyle = boxColor;
                ctx.lineWidth = critical ? 3 : 2;
                ctx.setLineDash(critical ? [] : [5, 5]);
                ctx.strokeRect(x, y, width, height);

                // Fill
                ctx.fillStyle = fillColor;
                ctx.fillRect(x, y, width, height);

                // Label
                ctx.fillStyle = this.config.colors.text;
                ctx.font = '12px monospace';
                ctx.fillText(`${type}${critical ? ' [CRITICAL]' : ''}`, x, y - 5);

                // Confidence if available
                if (this.lastVerification) {
                    const conf = this.lastVerification.overall_confidence;
                    if (conf !== undefined) {
                        ctx.fillStyle = conf >= 0.8 ? this.config.colors.success :
                                       conf >= 0.6 ? this.config.colors.warning :
                                       this.config.colors.critical;
                        ctx.fillText(`${(conf * 100).toFixed(0)}%`, x + width - 30, y - 5);
                    }
                }
            }

            // Draw spatial relations
            if (this.config.showSpatialRelations && spatialRelations) {
                this._renderSpatialRelations(ctx, overlay);
            }
        }

        ctx.setLineDash([]);
    }

    /**
     * Render spatial relation lines
     */
    _renderSpatialRelations(ctx, overlay) {
        if (!this.currentScene?.children) return;

        const { position, size, spatialRelations } = overlay;
        const [sx, sy] = position;
        const [sw, sh] = size;
        const subjectCenter = { x: sx + sw / 2, y: sy + sh / 2 };

        for (const relation of spatialRelations) {
            // Find target element in scene
            const target = this._findElementInScene(relation.target_element);

            if (target) {
                const targetCenter = {
                    x: target.x + (target.width || 0) / 2,
                    y: target.y + (target.height || 0) / 2
                };

                // Draw relation line
                ctx.strokeStyle = this.config.colors.spatial;
                ctx.lineWidth = 1;
                ctx.setLineDash([3, 3]);

                ctx.beginPath();
                ctx.moveTo(subjectCenter.x, subjectCenter.y);
                ctx.lineTo(targetCenter.x, targetCenter.y);
                ctx.stroke();

                // Draw relation label at midpoint
                const midX = (subjectCenter.x + targetCenter.x) / 2;
                const midY = (subjectCenter.y + targetCenter.y) / 2;

                ctx.fillStyle = this.config.colors.spatial;
                ctx.font = '10px monospace';
                ctx.fillText(relation.relation_type, midX, midY);
            }
        }

        ctx.setLineDash([]);
    }

    /**
     * Find element in scene by type
     */
    _findElementInScene(targetType) {
        if (!this.currentScene?.children) return null;

        const targetLower = targetType.toLowerCase();
        return this.currentScene.children.find(child => {
            const childType = (child.type || '').toLowerCase();
            return childType.includes(targetLower) || targetLower.includes(childType);
        });
    }

    /**
     * Render HUD (Heads-Up Display)
     */
    _renderHUD() {
        const ctx = this.hudCtx;
        if (!ctx) return;

        const width = this.hudCanvas.width;
        const padding = 10;
        let y = padding;

        // Background
        ctx.fillStyle = this.config.colors.hudBackground;
        ctx.fillRect(0, 0, width, this.hudCanvas.height);

        // Title
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 14px monospace';
        ctx.fillText('🔍 VISUAL DEBUG OVERLAY', padding, y + 14);
        y += 30;

        // Divider
        ctx.strokeStyle = '#333';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Current Intent
        ctx.fillStyle = this.config.colors.text;
        ctx.font = '12px monospace';
        ctx.fillText('INTENT:', padding, y);
        y += 18;

        if (this.currentIntent) {
            ctx.fillStyle = '#888';
            ctx.fillText(`  Type: ${this.currentIntent.element_type}`, padding, y);
            y += 16;
            ctx.fillText(`  Pos: (${this.currentIntent.position?.[0]}, ${this.currentIntent.position?.[1]})`, padding, y);
            y += 16;
            ctx.fillText(`  Size: ${this.currentIntent.size?.[0]}x${this.currentIntent.size?.[1]}`, padding, y);
            y += 16;
            if (this.currentIntent.critical) {
                ctx.fillStyle = this.config.colors.critical;
                ctx.fillText('  ⚠ CRITICAL', padding, y);
                y += 16;
            }
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  No active intent', padding, y);
            y += 16;
        }

        y += 10;

        // Verification Status
        ctx.fillStyle = this.config.colors.text;
        ctx.font = '12px monospace';
        ctx.fillText('VERIFICATION:', padding, y);
        y += 18;

        if (this.lastVerification) {
            const age = (Date.now() - this.lastVerification.timestamp) / 1000;

            // Success indicator
            if (this.lastVerification.success) {
                ctx.fillStyle = this.config.colors.success;
                ctx.fillText('  ✓ PASSED', padding, y);
            } else {
                ctx.fillStyle = this.config.colors.mismatch;
                ctx.fillText('  ✗ FAILED', padding, y);
            }
            y += 16;

            // Confidence
            const conf = this.lastVerification.overall_confidence;
            ctx.fillStyle = conf >= 0.8 ? this.config.colors.success :
                           conf >= 0.6 ? this.config.colors.warning :
                           this.config.colors.critical;
            ctx.fillText(`  Confidence: ${(conf * 100).toFixed(1)}%`, padding, y);
            y += 16;

            // Retry status
            ctx.fillStyle = '#888';
            if (this.lastVerification.should_retry) {
                ctx.fillStyle = this.config.colors.warning;
                ctx.fillText(`  ↻ Retry suggested (${this.lastVerification.retry_suggestions?.length || 0} hints)`, padding, y);
            } else {
                ctx.fillText('  No retry needed', padding, y);
            }
            y += 16;

            // Escalation
            if (this.lastVerification.should_escalate) {
                ctx.fillStyle = this.config.colors.critical;
                ctx.fillText('  🚨 HUMAN REVIEW REQUIRED', padding, y);
                y += 16;
            }

            // Age
            ctx.fillStyle = '#666';
            ctx.fillText(`  Age: ${age.toFixed(1)}s ago`, padding, y);
            y += 16;

            // Summary
            if (this.lastVerification.summary) {
                ctx.fillStyle = '#888';
                const lines = this._wrapText(this.lastVerification.summary, width - padding * 2 - 10);
                for (const line of lines) {
                    ctx.fillText(`  ${line}`, padding, y);
                    y += 14;
                }
            }
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  No verification data', padding, y);
            y += 16;
        }

        y += 10;

        // Retry suggestions
        if (this.lastVerification?.retry_suggestions?.length > 0) {
            ctx.fillStyle = this.config.colors.text;
            ctx.font = '12px monospace';
            ctx.fillText('SUGGESTIONS:', padding, y);
            y += 18;

            ctx.fillStyle = this.config.colors.warning;
            for (const suggestion of this.lastVerification.retry_suggestions.slice(0, 3)) {
                const lines = this._wrapText(suggestion, width - padding * 2 - 10);
                for (const line of lines) {
                    ctx.fillText(`  • ${line}`, padding, y);
                    y += 14;
                }
                y += 4;
            }
        }

        // Performance stats at bottom
        ctx.fillStyle = '#444';
        ctx.font = '10px monospace';
        ctx.fillText(`Render: ${this.renderTime.toFixed(2)}ms | Frames: ${this.frameCount}`, padding, this.hudCanvas.height - 10);

        // Mirror Neuron Status (Master Stage)
        if (this.lastMirrorValidation) {
            this._renderMirrorHUD(ctx, width, padding);
        }

        // Silicon Terminal (RISC-V UART)
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            this._renderSiliconTerminal(ctx, width, padding);
        }
    }

    /**
     * Render Mirror Neuron specific HUD section
     */
    _renderMirrorHUD(ctx, width, padding) {
        let y = this.hudCanvas.height - 180;
        
        // Background for section
        ctx.fillStyle = 'rgba(0, 40, 60, 0.9)';
        ctx.fillRect(0, y, width, 160);
        
        y += 20;
        ctx.fillStyle = '#00d4ff';
        ctx.font = 'bold 12px monospace';
        ctx.fillText('🪞 MIRROR NEURON (V14)', padding, y);
        y += 20;
        
        const res = this.lastMirrorValidation;
        
        // Task ID
        ctx.fillStyle = '#aaa';
        ctx.font = '10px monospace';
        ctx.fillText(`Task: ${res.task_id?.substring(0, 20)}...`, padding, y);
        y += 15;
        
        // Success / Failure
        if (res.success) {
            ctx.fillStyle = this.config.colors.success;
            ctx.fillText('✓ VALIDATION PASSED', padding, y);
        } else {
            ctx.fillStyle = this.config.colors.mismatch;
            ctx.fillText('✗ VALIDATION FAILED', padding, y);
        }
        y += 15;
        
        // Accuracy
        ctx.fillStyle = '#fff';
        const acc = (res.accuracy * 100).toFixed(1);
        ctx.fillText(`Accuracy: ${acc}%`, padding, y);
        
        // Progress bar for accuracy
        ctx.fillStyle = '#333';
        ctx.fillRect(padding + 100, y - 8, 150, 10);
        ctx.fillStyle = res.accuracy >= 0.8 ? this.config.colors.success : this.config.colors.warning;
        ctx.fillRect(padding + 100, y - 8, 150 * res.accuracy, 10);
        y += 20;
        
        // Immortality
        if (res.immortality) {
            ctx.fillStyle = this.config.colors.success;
            ctx.fillText('🛡️ IMMORTALITY: SECURE', padding, y);
        } else {
            ctx.fillStyle = this.config.colors.critical;
            ctx.fillText('💀 IMMORTALITY: BREACHED', padding, y);
        }
        y += 20;
        
        // Issues
        if (res.issues && res.issues.length > 0) {
            ctx.fillStyle = '#ffaa00';
            ctx.fillText(`Issues: ${res.issues[0].substring(0, 40)}`, padding, y);
        }
    }

    /**
     * Render Silicon Terminal HUD section for RISC-V UART output
     */
    _renderSiliconTerminal(ctx, width, padding) {
        if (!this.uartBuffer || this.uartBuffer.length === 0) return;

        // Position on left side of screen
        const termHeight = 200;
        let y = this.hudCanvas.height - termHeight - 10;

        // Background for terminal
        ctx.fillStyle = 'rgba(0, 20, 40, 0.95)';
        ctx.fillRect(10, y, width - 20, termHeight);

        // Border
        ctx.strokeStyle = '#00ff88';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, termHeight);

        y += 18;
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🦾 SILICON TERMINAL (RISC-V UART)', padding, y);
        y += 5;

        // Divider line
        ctx.strokeStyle = '#00ff8844';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();

        y += 15;

        // Render last N lines of UART output
        const visibleLines = Math.min(this.uartBuffer.length, 10);
        const startIdx = Math.max(0, this.uartBuffer.length - visibleLines);

        ctx.font = '10px monospace';
        for (let i = startIdx; i < this.uartBuffer.length; i++) {
            const line = this.uartBuffer[i];

            // Color based on content
            if (line.text.includes('ERROR') || line.text.includes('FAIL')) {
                ctx.fillStyle = '#ff4444';
            } else if (line.text.includes('WARN')) {
                ctx.fillStyle = '#ffaa00';
            } else if (line.text.includes('OK') || line.text.includes('SUCCESS')) {
                ctx.fillStyle = '#44ff44';
            } else {
                ctx.fillStyle = '#00ff88';
            }

            // Truncate line to fit
            const maxChars = Math.floor((width - padding * 2 - 20) / 6);
            const displayText = line.text.length > maxChars
                ? line.text.substring(0, maxChars - 3) + '...'
                : line.text;

            ctx.fillText(displayText, padding, y);
            y += 12;
        }

        // Status line at bottom
        y = this.hudCanvas.height - 15;
        ctx.fillStyle = '#666';
        ctx.font = '9px monospace';
        const lineCount = this.uartBuffer.length;
        const lastTime = this.lastUartTimestamp
            ? new Date(this.lastUartTimestamp).toLocaleTimeString()
            : 'N/A';
        ctx.fillText(`Lines: ${lineCount} | Last: ${lastTime}`, padding, y);
    }

    /**
     * Wrap text to fit width
     */
    _wrapText(text, maxWidth) {
        const words = text.split(' ');
        const lines = [];
        let currentLine = '';

        for (const word of words) {
            const testLine = currentLine ? `${currentLine} ${word}` : word;
            const metrics = this.hudCtx.measureText(testLine);

            if (metrics.width > maxWidth && currentLine) {
                lines.push(currentLine);
                currentLine = word;
            } else {
                currentLine = testLine;
            }
        }

        if (currentLine) {
            lines.push(currentLine);
        }

        return lines;
    }

    /**
     * Update configuration
     */
    updateConfig(newConfig) {
        this.config = { ...this.config, ...newConfig };
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            enabled: this.config.enabled,
            showBoundingboxes: this.config.showBoundingboxes,
            showLayoutDiffs: this.config.showLayoutDiffs,
            showOCRConfidence: this.config.showOCRConfidence,
            showVerificationHUD: this.config.showVerificationHUD,
            showSpatialRelations: this.config.showSpatialRelations,
            elementOverlaysCount: this.elementOverlays.size,
            verificationResultsCount: this.verificationResults.length,
            renderTimeMs: this.renderTime.toFixed(2),
            frameCount: this.frameCount,
            lastVerificationSuccess: this.lastVerification?.success,
            lastVerificationConfidence: this.lastVerification?.overall_confidence
        };
    }

    /**
     * Clear all data
     */
    clearData() {
        this.verificationResults = [];
        this.mirrorValidationResults = [];
        this.currentIntent = null;
        this.lastVerification = null;
        this.lastMirrorValidation = null;
        this.elementOverlays.clear();
        this.currentScene = null;
        this.uartBuffer = [];
        this.lastUartTimestamp = null;
    }

    /**
     * Destroy overlay
     */
    destroy() {
        if (this.hudCanvas && this.hudCanvas.parentNode) {
            this.hudCanvas.parentNode.removeChild(this.hudCanvas);
        }
        if (this.overlayCanvas && this.overlayCanvas.parentNode) {
            this.overlayCanvas.parentNode.removeChild(this.overlayCanvas);
        }
        this.clearData();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.VisualDebugOverlay = VisualDebugOverlay;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { VisualDebugOverlay };
}
