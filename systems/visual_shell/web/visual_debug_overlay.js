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

        // Swarm Health state
        this.swarmHealth = null;

        // Task DAG state (Distributed Task Visualization)
        this.taskDag = {
            tasks: {},           // task_id -> {status, assigned_to, transitions, ...}
            activeFlows: [],     // Animated flow lines
            summary: null        // Latest DAG summary
        };

        // District zones for agent relocation
        this.districtZones = {
            cognitive: { name: 'Cognitive', color: '#00aaff', y: 0, height: 0 },
            metabolic: { name: 'Metabolic', color: '#44ff44', y: 0, height: 0 },
            substrate: { name: 'Substrate', color: '#ff8844', y: 0, height: 0 }
        };

        // Agent positions for drag-and-drop
        this.agentPositions = {};
        this.draggedAgent = null;
        this.dropTarget = null;

        // Neural City renderer state
        this.neuralCityRenderer = null;
        this.neuralCityFocus = { x: 0, y: 0 };
        this.neuralCityZoom = 1.0;

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

        // Listen for RISC-V execution state (Neuro-Silicon Bridge)
        window.addEventListener('RISCV_STATE_UPDATE', (e) => {
            this.handleRiscvState(e.detail);
        });

        // Listen for Swarm Health updates
        window.addEventListener('SWARM_HEALTH_UPDATE', (e) => {
            this.swarmHealth = e.detail;
            this._scheduleRender();
        });

        // Listen for Task DAG updates from TelemetryBus
        window.addEventListener('TASK_DAG_UPDATE', (e) => {
            this.processTaskDagUpdate(e.detail);
        });

        // Listen for agent relocation events
        window.addEventListener('AGENT_RELOCATED', (e) => {
            this.processAgentRelocation(e.detail);
        });

        // Listen for Neural City focus updates
        window.addEventListener('neural_city_focus', (e) => {
            this.neuralCityFocus = e.detail;
            this._scheduleRender();
        });

        // Drag and drop handlers for canvas
        if (this.hudCanvas) {
            this.hudCanvas.style.pointerEvents = 'auto';
            this.hudCanvas.addEventListener('mousedown', (e) => this._handleDragStart(e));
            this.hudCanvas.addEventListener('mousemove', (e) => this._handleDragMove(e));
            this.hudCanvas.addEventListener('mouseup', (e) => this._handleDragEnd(e));
        }
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
     * Handle RISC-V execution state from Neuro-Silicon Bridge
     */
    handleRiscvState(data) {
        if (!data) return;
        
        this.lastRiscvState = {
            ...data,
            timestamp: Date.now()
        };

        // Map PC to Silicon District coordinate
        // The Silicon District is anchored at (-5120, -5120) tiles relative to Antigravity Prime
        // Each tile is 512x512. 
        // For visualization, we treat a 1024x1024 region as the core logic gate map.
        const pc = data.pc || 0;
        
        // Order 10 Hilbert curve (1024x1024)
        // Divide by 4 because RISC-V instructions are 4 bytes aligned
        const [hx, hy] = (typeof HilbertLUT !== 'undefined') ? 
            HilbertLUT.d2xy(1024, Math.floor(pc / 4) % (1024 * 1024)) : 
            [0, 0];
            
        // Final world position
        const worldX = -5120 + hx;
        const worldY = -5120 + hy;

        // Trigger Silicon Pulse (Green = 1.0)
        const app = window.geometryOSApp;
        if (app && app.neuralCity) {
            app.neuralCity.addPulse(worldX, worldY, Date.now(), 1.0);
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

        // Swarm Health section
        if (this.swarmHealth) {
            this._renderSwarmHealth(ctx, width, padding);
        }

        // Task Graph section
        if (Object.keys(this.taskDag.tasks).length > 0 || this.taskDag.activeFlows.length > 0) {
            this._renderTaskGraphSection(ctx, width, padding);
        }

        // Neural City HUD
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) {
            this._renderNeuralCityHUD(ctx, width, padding);
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
     * Render Swarm Health section
     */
    _renderSwarmHealth(ctx, width, padding) {
        if (!this.swarmHealth || !this.swarmHealth.agents) return;

        const agents = this.swarmHealth.agents;
        const agentIds = Object.keys(agents);
        if (agentIds.length === 0) return;

        // Position - place on left side, above Silicon Terminal if present
        const sectionHeight = 40 + (agentIds.length * 15);
        let startY = this.hudCanvas.height - sectionHeight - 10;
        
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            startY -= 210; // Shift up to avoid Silicon Terminal
        }

        let y = startY;

        // Background
        ctx.fillStyle = 'rgba(20, 0, 40, 0.95)';
        ctx.fillRect(10, y, width - 20, sectionHeight);

        // Border
        ctx.strokeStyle = '#aa00ff';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, y, width - 20, sectionHeight);

        y += 18;
        ctx.fillStyle = '#aa00ff';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('🐝 SWARM HEALTH MONITOR', padding, y);
        y += 5;

        // Divider
        ctx.strokeStyle = '#aa00ff44';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        // Render each agent
        ctx.font = '10px monospace';
        for (const aid of agentIds) {
            const h = agents[aid];
            
            // Status icon and color
            let statusChar = '●';
            if (h.status === 'healthy') ctx.fillStyle = '#44ff44';
            else if (h.status === 'stale') ctx.fillStyle = '#ffaa00';
            else if (h.status === 'offline') ctx.fillStyle = '#ff4444';
            else ctx.fillStyle = '#888';

            ctx.fillText(statusChar, padding, y);
            
            ctx.fillStyle = '#fff';
            const name = aid.length > 15 ? aid.substring(0, 12) + '...' : aid;
            ctx.fillText(`${name} [${h.type}]`, padding + 15, y);
            
            // Task count
            ctx.fillStyle = '#888';
            ctx.fillText(`C:${h.tasks_completed} F:${h.tasks_failed}`, width - padding - 60, y);
            
            y += 15;
        }
    }

    /**
     * Process Task DAG update from Visual Bridge
     */
    processTaskDagUpdate(update) {
        if (!update || !update.task_id) return;

        const taskId = update.task_id;
        const previousStatus = this.taskDag.tasks[taskId]?.status;

        // Update or create task entry
        this.taskDag.tasks[taskId] = {
            ...this.taskDag.tasks[taskId],
            ...update,
            lastUpdate: Date.now()
        };

        // Create flow animation if assignment changed
        if (update.assigned_to && previousStatus !== update.status) {
            this._createTaskFlow(taskId, update);
        }

        this._scheduleRender();
    }

    /**
     * Create animated flow for task assignment
     */
    _createTaskFlow(taskId, update) {
        const flow = {
            id: `${taskId}-${Date.now()}`,
            taskId: taskId,
            from: 'coordinator',
            to: update.assigned_to,
            progress: 0,
            startTime: Date.now(),
            color: this._getTaskStatusColor(update.status)
        };

        this.taskDag.activeFlows.push(flow);

        // Animate for 1 second
        const animate = () => {
            flow.progress = Math.min(1, (Date.now() - flow.startTime) / 1000);
            if (flow.progress < 1) {
                requestAnimationFrame(animate);
            } else {
                // Remove completed flow
                const idx = this.taskDag.activeFlows.indexOf(flow);
                if (idx >= 0) this.taskDag.activeFlows.splice(idx, 1);
            }
            this._scheduleRender();
        };
        requestAnimationFrame(animate);
    }

    /**
     * Get color for task status
     */
    _getTaskStatusColor(status) {
        const colors = {
            'pending': '#ffaa00',    // Yellow-orange
            'assigned': '#00aaff',   // Cyan
            'completed': '#44ff44',  // Green
            'failed': '#ff4444',     // Red
            'retry': '#ff8800'       // Orange
        };
        return colors[status] || '#888888';
    }

    /**
     * Render Task Graph section in HUD
     */
    _renderTaskGraph(ctx, x, y, width) {
        const lineHeight = 18;
        const padding = 10;
        let currentY = y + padding;

        // Section header
        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 14px monospace';
        ctx.fillText('TASK PULSE', x + padding, currentY);
        currentY += lineHeight + 5;

        // Count by status
        const statusCounts = { pending: 0, assigned: 0, completed: 0, failed: 0 };
        const taskList = Object.values(this.taskDag.tasks);

        for (const task of taskList) {
            const status = task.status || 'pending';
            if (statusCounts.hasOwnProperty(status)) {
                statusCounts[status]++;
            }
        }

        // Status summary bar
        ctx.font = '12px monospace';
        const statusText = `P:${statusCounts.pending} A:${statusCounts.assigned} C:${statusCounts.completed} F:${statusCounts.failed}`;
        ctx.fillStyle = '#cccccc';
        ctx.fillText(statusText, x + padding, currentY);
        currentY += lineHeight + 8;

        // Divider
        ctx.strokeStyle = '#333333';
        ctx.beginPath();
        ctx.moveTo(x + padding, currentY);
        ctx.lineTo(x + width - padding, currentY);
        ctx.stroke();
        currentY += 10;

        // Active tasks list (max 5)
        const activeTasks = taskList
            .filter(t => t.status === 'pending' || t.status === 'assigned')
            .slice(0, 5);

        for (const task of activeTasks) {
            const statusColor = this._getTaskStatusColor(task.status);

            // Status dot
            ctx.fillStyle = statusColor;
            ctx.beginPath();
            ctx.arc(x + padding + 6, currentY - 4, 5, 0, Math.PI * 2);
            ctx.fill();

            // Task info
            ctx.fillStyle = '#ffffff';
            ctx.font = '11px monospace';
            const taskText = `${task.task_type || 'task'} -> ${task.assigned_to || 'unassigned'}`;
            ctx.fillText(taskText, x + padding + 16, currentY);

            // Duration if available
            if (task.duration) {
                ctx.fillStyle = '#888888';
                ctx.fillText(`${task.duration.toFixed(1)}s`, x + width - 50, currentY);
            }

            currentY += lineHeight;
        }

        // Render active flows (animated lines)
        this._renderTaskFlows(ctx, x, currentY + 10, width);

        return currentY + 50;
    }

    /**
     * Render animated task flow lines
     */
    _renderTaskFlows(ctx, x, y, width) {
        for (const flow of this.taskDag.activeFlows) {
            const startX = x + 20;
            const endX = x + width - 40;
            const currentX = startX + (endX - startX) * flow.progress;

            // Draw flow line
            ctx.strokeStyle = flow.color;
            ctx.lineWidth = 2;
            ctx.setLineDash([4, 4]);

            ctx.beginPath();
            ctx.moveTo(startX, y);
            ctx.lineTo(currentX, y);
            ctx.stroke();

            // Draw arrow head
            if (flow.progress > 0.1) {
                ctx.fillStyle = flow.color;
                ctx.beginPath();
                ctx.moveTo(currentX, y);
                ctx.lineTo(currentX - 8, y - 4);
                ctx.lineTo(currentX - 8, y + 4);
                ctx.closePath();
                ctx.fill();
            }

            // Flow label
            ctx.fillStyle = flow.color;
            ctx.font = '10px monospace';
            ctx.fillText(flow.taskId.slice(0, 12), startX, y - 8);
        }

        ctx.setLineDash([]);
    }

    /**
     * Get color for district
     */
    _getDistrictColor(district) {
        const colors = {
            'cognitive': '#00aaff',
            'metabolic': '#44ff44',
            'substrate': '#ff8844'
        };
        return colors[district] || '#888888';
    }

    /**
     * Process agent relocation event
     */
    processAgentRelocation(data) {
        if (!data || !data.agent_id) return;

        const agentId = data.agent_id;

        // Update agent position if tracked
        if (this.agentPositions[agentId]) {
            this.agentPositions[agentId].district = data.to_district;
        }

        // Show relocation notification
        this._showNotification(
            `🔀 ${agentId}: ${data.from_district} → ${data.to_district}`,
            this._getDistrictColor(data.to_district)
        );

        this._scheduleRender();
    }

    /**
     * Show temporary notification
     */
    _showNotification(message, color = '#ffffff') {
        // Add to UART buffer as notification
        this.uartBuffer.push({
            type: 'notification',
            text: message,
            color: color,
            timestamp: Date.now()
        });

        // Keep buffer size limited
        if (this.uartBuffer.length > this.uartMaxLines) {
            this.uartBuffer.shift();
        }
    }

    /**
     * Handle drag start on agent
     */
    _handleDragStart(e) {
        const rect = this.hudCanvas.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        // Check if clicking on an agent
        for (const [agentId, pos] of Object.entries(this.agentPositions)) {
            const dx = x - pos.x;
            const dy = y - pos.y;
            if (dx * dx + dy * dy < 100) { // 10px radius
                this.draggedAgent = agentId;
                this.hudCanvas.style.cursor = 'grabbing';
                return;
            }
        }
    }

    /**
     * Handle drag move
     */
    _handleDragMove(e) {
        if (!this.draggedAgent) return;

        const rect = this.hudCanvas.getBoundingClientRect();
        const y = e.clientY - rect.top;

        // Determine drop target district
        const third = this.hudCanvas.height / 3;
        if (y < third) {
            this.dropTarget = 'cognitive';
        } else if (y < third * 2) {
            this.dropTarget = 'metabolic';
        } else {
            this.dropTarget = 'substrate';
        }

        this._scheduleRender();
    }

    /**
     * Handle drag end - trigger relocation
     */
    _handleDragEnd(e) {
        if (!this.draggedAgent || !this.dropTarget) {
            this.draggedAgent = null;
            this.dropTarget = null;
            this.hudCanvas.style.cursor = 'default';
            return;
        }

        const agent = this.agentPositions[this.draggedAgent];
        const fromDistrict = agent?.district || 'substrate';

        // Only relocate if district changed
        if (fromDistrict !== this.dropTarget) {
            // Send relocation command via WebSocket
            this._sendRelocationCommand(this.draggedAgent, this.dropTarget);
        }

        this.draggedAgent = null;
        this.dropTarget = null;
        this.hudCanvas.style.cursor = 'default';
    }

    /**
     * Send relocation command to backend
     */
    _sendRelocationCommand(agentId, targetDistrict) {
        // Dispatch event for TelemetryBus to pick up
        window.dispatchEvent(new CustomEvent('RELOCATE_AGENT', {
            detail: {
                agent_id: agentId,
                target_district: targetDistrict
            }
        }));

        // Show pending notification
        this._showNotification(`⏳ Relocating ${agentId} to ${targetDistrict}...`, '#ffaa00');
    }

    /**
     * Render district zones in HUD
     */
    _renderDistrictZones(ctx, x, y, width, height) {
        const padding = 10;
        const zoneHeight = (height - padding * 4) / 3;

        let currentY = y + padding;

        for (const [district, zone] of Object.entries(this.districtZones)) {
            zone.y = currentY;
            zone.height = zoneHeight;

            // Zone background
            const isDropTarget = this.dropTarget === district;
            ctx.fillStyle = isDropTarget ? zone.color + '40' : zone.color + '10';
            ctx.fillRect(x + padding, currentY, width - padding * 2, zoneHeight);

            // Zone border
            ctx.strokeStyle = isDropTarget ? zone.color : zone.color + '60';
            ctx.lineWidth = isDropTarget ? 2 : 1;
            ctx.strokeRect(x + padding, currentY, width - padding * 2, zoneHeight);

            // Zone label
            ctx.fillStyle = zone.color;
            ctx.font = 'bold 12px monospace';
            ctx.fillText(zone.name.toUpperCase(), x + padding + 5, currentY + 16);

            // Agent count
            const agentCount = Object.values(this.agentPositions)
                .filter(a => a.district === district).length;
            ctx.fillStyle = '#888888';
            ctx.font = '10px monospace';
            ctx.fillText(`(${agentCount} agents)`, x + width - 80, currentY + 16);

            currentY += zoneHeight + padding;
        }

        return currentY;
    }

    /**
     * Render agents in district zones
     */
    _renderAgentsInZones(ctx, x, width) {
        for (const [agentId, pos] of Object.entries(this.agentPositions)) {
            const zone = this.districtZones[pos.district];
            if (!zone) continue;

            // Calculate position within zone
            const agentX = x + 30 + (Math.random() * (width - 80));
            const agentY = zone.y + 30 + (Math.random() * (zone.height - 60));
            pos.x = agentX;
            pos.y = agentY;

            // Draw agent dot
            const isDragged = this.draggedAgent === agentId;
            ctx.fillStyle = isDragged ? '#ffffff' : zone.color;
            ctx.beginPath();
            ctx.arc(agentX, agentY, isDragged ? 8 : 6, 0, Math.PI * 2);
            ctx.fill();

            // Agent label
            ctx.fillStyle = '#cccccc';
            ctx.font = '9px monospace';
            ctx.fillText(agentId.slice(0, 10), agentX - 20, agentY + 15);
        }
    }

    /**
     * Initialize AgentController integration
     */
    _initAgentController() {
        if (typeof AgentController === 'undefined') return;

        this.agentController = new AgentController();

        // Wire up relocation callback
        this.agentController.onRelocate = (agentId, targetDistrict) => {
            this._sendRelocationCommand(agentId, targetDistrict);
        };

        // Wire up evict callback
        this.agentController.onEvict = (agentId) => {
            this._showNotification(`🚫 Evicting ${agentId}...`, '#ff4444');
            window.dispatchEvent(new CustomEvent('EVICT_AGENT', {
                detail: { agent_id: agentId }
            }));
        };

        // Wire up debug callback
        this.agentController.onDebug = (agentId) => {
            this._showNotification(`🔍 Debug dump: ${agentId}`, '#00aaff');
            console.log('Agent debug:', this.agentPositions[agentId]);
        };
    }

    /**
     * Show AgentController for clicked agent
     */
    _showAgentController(agentId) {
        if (!this.agentController) {
            this._initAgentController();
        }

        this.agentController.setAgent(agentId);
        this.agentController.element.style.display = 'block';
    }

    /**
     * Render Neural City HUD section
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderNeuralCityHUD(ctx, width, padding) {
        const neuralCity = window.geometryOSApp.neuralCity;
        if (!neuralCity) return;

        const stats = neuralCity.getStats();
        const focus = neuralCity.focusDistrict;

        // Calculate position - place between Silicon Terminal and bottom
        // or at bottom if Silicon Terminal is not showing
        let startY;
        if (this.uartBuffer && this.uartBuffer.length > 0) {
            // Place above Silicon Terminal
            startY = this.hudCanvas.height - 460;
        } else {
            // Place at bottom
            startY = this.hudCanvas.height - 260;
        }

        const sectionHeight = 250;
        let y = startY;

        // Background for section
        ctx.fillStyle = 'rgba(40, 30, 0, 0.9)';
        ctx.fillRect(0, y, width, sectionHeight);

        // Border
        ctx.strokeStyle = '#FFD700';
        ctx.lineWidth = 1;
        ctx.strokeRect(0, y, width, sectionHeight);

        y += 20;

        // Title
        ctx.fillStyle = '#FFD700';
        ctx.font = 'bold 12px monospace';
        ctx.fillText('🏛️ NEURAL CITY (V14)', padding, y);
        y += 20;

        // District info
        ctx.fillStyle = '#FFFFFF';
        ctx.font = '11px monospace';
        ctx.fillText(`District: (${focus.x}, ${focus.y})`, padding, y);
        y += 16;

        // Material at focus
        ctx.fillText(`Material: ${stats.focusMaterial}`, padding, y);
        y += 16;

        // Metabolism - Health Monitoring
        const ipc = stats.metabolismIPC;
        const ipcColor = ipc >= 0.7 ? '#44ff44' : ipc >= 0.4 ? '#ffaa00' : '#ff4444';
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText('Metabolism:', padding, y);
        ctx.fillStyle = ipcColor;
        ctx.fillText(` ${ipc.toFixed(2)} IPC`, padding + 80, y);
        
        // IPC Bar
        ctx.fillStyle = '#333';
        ctx.fillRect(padding + 150, y - 8, 100, 10);
        ctx.fillStyle = ipcColor;
        ctx.fillRect(padding + 150, y - 8, 100 * ipc, 10);
        y += 16;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillText('Throttle:', padding, y);
        ctx.fillStyle = stats.throttleLevel === 'NONE' ? '#44ff44' : '#ff4444';
        ctx.fillText(` ${stats.throttleLevel}`, padding + 80, y);
        y += 16;

        // Inference Activity
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText(`Active Pulses: ${stats.pulseCount}`, padding, y);
        y += 16;

        // Cache status
        const cachePercent = stats.total > 0 ? Math.round((stats.loaded / stats.total) * 100) : 0;
        ctx.fillText(`Atlas Cache: ${stats.loaded}/${stats.total} (${cachePercent}%)`, padding, y);
        y += 16;

        // Silicon District Section (V14)
        ctx.strokeStyle = '#00ff8844';
        ctx.beginPath();
        ctx.moveTo(padding, y);
        ctx.lineTo(width - padding, y);
        ctx.stroke();
        y += 15;

        ctx.fillStyle = '#00ff88';
        ctx.font = 'bold 11px monospace';
        ctx.fillText('⚡ SILICON DISTRICT', padding, y);
        y += 16;

        if (this.lastRiscvState) {
            const rs = this.lastRiscvState;
            ctx.fillStyle = '#FFFFFF';
            ctx.font = '10px monospace';
            ctx.fillText(`PC: 0x${(rs.pc || 0).toString(16).padStart(8, '0')}`, padding, y);
            y += 14;
            ctx.fillText(`Cycles: ${rs.cycles || 0}`, padding, y);
            y += 14;
            ctx.fillText(`Status: ${rs.running ? 'RUNNING' : 'HALTED'}`, padding, y);
        } else {
            ctx.fillStyle = '#666';
            ctx.fillText('  (No execution active)', padding, y);
        }
        y += 16;

        // VRAM usage
        ctx.fillStyle = '#FFFFFF';
        ctx.fillText(`VRAM: ${stats.vramMB}MB`, padding, y);
        y += 20;

        // Material legend (compact)
        ctx.font = '10px monospace';
        ctx.fillStyle = '#FFD700';
        ctx.fillText('■ Gold', padding, y);
        ctx.fillStyle = '#4169E1';
        ctx.fillText('  ■ Steel', 60, y);
        ctx.fillStyle = '#B7410E';
        ctx.fillText('  ■ Rust', 120, y);
        ctx.fillStyle = '#666666';
        ctx.fillText('  ■ Dust', 175, y);
    }

    /**
     * Render Task Graph section with proper positioning in HUD
     * @param {CanvasRenderingContext2D} ctx - Canvas context
     * @param {number} width - HUD width
     * @param {number} padding - Padding value
     */
    _renderTaskGraphSection(ctx, width, padding) {
        // Calculate position - stack above other bottom sections
        let offset = 0;
        if (this.uartBuffer && this.uartBuffer.length > 0) offset += 210;
        if (this.swarmHealth) offset += 100;
        if (window.geometryOSApp && window.geometryOSApp.neuralCity) offset += 130;

        const sectionHeight = 150;
        let startY = this.hudCanvas.height - sectionHeight - offset - 10;

        // Background for section
        ctx.fillStyle = 'rgba(0, 60, 40, 0.95)';
        ctx.fillRect(10, startY, width - 20, sectionHeight);

        // Border
        ctx.strokeStyle = '#00ff88';
        ctx.lineWidth = 1;
        ctx.strokeRect(10, startY, width - 20, sectionHeight);

        // Render task graph content
        this._renderTaskGraph(ctx, 10, startY, width - 20);
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
        const neuralCityStats = (window.geometryOSApp && window.geometryOSApp.neuralCity)
            ? window.geometryOSApp.neuralCity.getStats()
            : null;

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
            lastVerificationConfidence: this.lastVerification?.overall_confidence,
            taskDagCount: Object.keys(this.taskDag.tasks).length,
            taskDagActiveFlows: this.taskDag.activeFlows.length,
            // Neural City stats
            neuralCity: neuralCityStats ? {
                focus: this.neuralCityFocus,
                zoom: this.neuralCityZoom,
                loaded: neuralCityStats.loaded,
                total: neuralCityStats.total,
                vramMB: neuralCityStats.vramMB,
                focusMaterial: neuralCityStats.focusMaterial,
                metabolismIPC: neuralCityStats.metabolismIPC,
                throttleLevel: neuralCityStats.throttleLevel,
                pulseCount: neuralCityStats.pulseCount
            } : null
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
        this.taskDag = {
            tasks: {},
            activeFlows: [],
            summary: null
        };
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
