/**
 * ACE Visual Bridge (Southbound/Northbound Bus)
 * 
 * This component acts as the physical interface (Task Prosecution Layer) 
 * between the abstract ACE Cognitive Framework and the Visual Evolution Engine.
 * 
 * It translates semantic directives ("Evolve ELF Header") into 
 * concrete evolutionary targets ([0x7F, 0x45, 0x4C, 0x46]).
 */

class AceVisualBridge {
    constructor(evolutionEngine) {
        this.engine = evolutionEngine;
        this.busActive = false;

        // Northbound Bus: Telemetry Buffer
        this.telemetryQueue = [];

        // SUBSCRIBE to Engine Events (Northbound Bus Feed)
        if (this.engine && typeof this.engine.onEvolution === 'function') {
            this.engine.onEvolution((event) => {
                // Throttle: only send meaningful updates up the bus
                if (event.type === 'complete' || (event.generation % 10 === 0)) {
                    this.emitTelemetry("EVOLUTION_UPDATE", event);
                }
            });
        }

        console.log("🛡️ ACE Visual Bridge Initialized");
    }

    /**
     * SOUTHBOUND BUS: Receive Directive
     * Called by the Executive Function Layer (or simulated external agent)
     * @param {Object} directive - { id: string, type: "EVOLVE_TARGET", payload: number[] | string }
     */
    receiveDirective(directive) {
        console.log(`⬇️ Southbound Bus: Received Directive [${directive.id}]`);

        switch (directive.type) {
            case "EVOLVE_TARGET":
                this._handleEvolveTarget(directive.payload);
                break;
            case "ABORT_TASK":
                this.engine.stop();
                this.emitTelemetry("TASK_ABORTED", { reason: directive.payload });
                break;
            case "QUERY_STATUS":
                this.emitTelemetry("STATUS_REPORT", {
                    generation: this.engine.generation,
                    fitness: this.engine.bestFitness,
                    isRunning: this.engine.isRunning
                });
                break;
            default:
                console.warn(`⚠️ Unknown Directive Type: ${directive.type}`);
        }
    }

    /**
     * Internal handler for EVOLVE_TARGET
     */
    _handleEvolveTarget(payload) {
        let targetHeader = [];

        if (Array.isArray(payload)) {
            // Raw bytes
            targetHeader = payload;
        } else if (typeof payload === 'string') {
            // Semantic lookup (simulated local knowledge)
            // In a full ACE implementation, this lookup happens in the Knowledge Layer,
            // but the Bridge handles the 'last mile' translation if needed.
            targetHeader = this._resolveSemanticTarget(payload);
        }

        if (targetHeader.length > 0) {
            console.log(`🔧 Configuring Engine for Target: ${targetHeader}`);
            this.engine.setTargetHeader(targetHeader);
            if (!this.engine.isRunning) {
                this.engine.start();
            }
            this.emitTelemetry("TASK_STARTED", { target: targetHeader });
        } else {
            this.emitTelemetry("TASK_FAILED", { error: "Invalid Target Payload" });
        }
    }

    _resolveSemanticTarget(semanticLabel) {
        const signatures = {
            "elf": [0x7F, 0x45, 0x4C, 0x46],
            "java": [0xCA, 0xFE, 0xBA, 0xBE],
            "png": [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A],
            "wasm": [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]
        };
        return signatures[semanticLabel.toLowerCase()] || [];
    }

    /**
     * NORTHBOUND BUS: Emit Telemetry
     * Sends signals up to the Cognitive Control / Global Strategy layers
     */
    emitTelemetry(type, data) {
        const signal = {
            timestamp: Date.now(),
            layer: "TASK_PROSECUTION",
            type: type,
            data: data
        };

        console.log(`⬆️ Northbound Bus: ${type}`, data);
        this.telemetryQueue.push(signal);

        // Dispatch event for ANY listeners (User Interface, or higher-order AI)
        window.dispatchEvent(new CustomEvent('ace-telemetry', { detail: signal }));

        // SYNC WITH INFINITE MAP (RUST)
        if (type === "EVOLUTION_UPDATE" && data.imageData) {
            this.sendToRustBackend(data.imageData);
        }
    }

    /**
     * Upload the evolved genome to the Rust backend
     * @param {ImageData} imageData 
     */
    async sendToRustBackend(imageData) {
        // Extract raw pixels (RGBA)
        const pixels = Array.from(imageData.data);

        try {
            await fetch('http://localhost:8080/api/evolution/genome', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    generation: this.engine.generation,
                    fitness: this.engine.bestFitness,
                    width: imageData.width,
                    height: imageData.height,
                    pixels: pixels
                })
            });
        } catch (err) {
            // Squelch errors to prevent console spam if backend is offline
            // console.warn("Failed to sync with Rust backend:", err);
        }
    }
}

// Global Access Point
if (typeof window !== 'undefined') {
    window.AceVisualBridge = AceVisualBridge;
}
