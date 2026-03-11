
// Bridge between LM Studio (simulated) and Visual Evolution Engine
// This script runs in the browser and connects the two worlds.

class LMStudioDirector {
    constructor(engine) {
        this.engine = engine;
        this.thinking = false;
    }

    async prompt(userRequest) {
        console.log(`🤖 LM Studio received request: "${userRequest}"`);
        this.thinking = true;

        try {
            // REAL CONNECTION to Local Intelligence
            const systemPrompt = `You are the Kernel of a Recursive Self-Improving OS. 
            The user wants to evolve a new binary structure.
            Analyze the request and provide the MAGIC BYTES (header) for the requested file type.
            
            Return JSON ONLY: { "target_header": [byte, byte, ...], "thought_process": "reasoning" }
            
            Known Signatures:
            - Wasm: [0, 97, 115, 109, 1, 0, 0, 0]
            - PNG: [137, 80, 78, 71, 13, 10, 26, 10]
            - ELF: [127, 69, 76, 70]
            - JPEG: [255, 216, 255]
            - PDF: [37, 80, 68, 70]
            - ZIP: [80, 75, 3, 4]
            `;

            const response = await fetch("http://localhost:1234/v1/chat/completions", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    model: "local-model",
                    messages: [
                        { role: "system", content: systemPrompt },
                        { role: "user", content: userRequest }
                    ],
                    temperature: 0.1
                })
            });

            if (!response.ok) throw new Error("LM Studio offline or blocking CORS");

            const data = await response.json();
            const content = data.choices[0].message.content;

            console.log("🧠 Raw LLM Response:", content);

            // Parse robustly (find JSON in markdown)
            const jsonMatch = content.match(/\{[\s\S]*\}/);
            if (!jsonMatch) throw new Error("LLM did not return JSON");

            const result = JSON.parse(jsonMatch[0]);

            console.log(`🧠 LLM Thought: ${result.thought_process}`);
            console.log(`🎯 Directed Target: ${result.target_header}`);

            // Command the engine
            if (this.engine && result.target_header) {
                this.engine.setTargetHeader(result.target_header);
                if (!this.engine.isRunning) {
                    this.engine.start();
                }
            }

            this.thinking = false;
            return result.thought_process || "Evolution parameters updated.";

        } catch (err) {
            console.warn("⚠️ Local Intelligence Offline/Error:", err);
            console.log("🔄 Falling back to Spinal Reflex (Simulation Mode)");

            // FALLBACK LOGIC (Spinal Reflex)
            let targetHeader = [];
            let thoughtProcess = "Checking basic signatures (Fallback Mode)...";

            if (userRequest.toLowerCase().includes("wasm")) {
                targetHeader = [0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00];
                thoughtProcess = "Reflex: Detected 'wasm'. Targeting Wasm Header.";
            } else if (userRequest.toLowerCase().includes("png")) {
                targetHeader = [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a];
                thoughtProcess = "Reflex: Detected 'png'. Targeting PNG Header.";
            } else {
                targetHeader = [0xCA, 0xFE, 0xBA, 0xBE]; // Java/Mach-O
                thoughtProcess = "Reflex: Unknown. Targeting Generic Magic Bytes (CAFEBABE).";
            }

            if (this.engine) {
                this.engine.setTargetHeader(targetHeader);
                if (!this.engine.isRunning) this.engine.start();
            }

            this.thinking = false;
            return `[OFFLINE] ${thoughtProcess}`;
        }
    }
}

// Attach to window
if (typeof window !== 'undefined') {
    window.LMStudioDirector = LMStudioDirector;
}
