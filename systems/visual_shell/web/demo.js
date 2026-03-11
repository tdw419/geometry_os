/**
 * Geometry OS - AI Operator Verification Script
 * Scenario: Install Software & Use GUI
 * 
 * This script demonstrates the sequence of WebMCP tool calls an AI Agent
 * performs to install a Linux GPU application and interact with it.
 * 
 * Usage:
 *   await runLinuxGuiDemo(navigator.modelContext.toolHandlers);
 */

export async function runLinuxGuiDemo(tools) {
    const log = (msg) => console.log(`[🤖 AI Operator] ${msg}`);

    try {
        // 1. Boot the System
        log("Step 1: Booting Alpine Linux Hypervisor...");
        const bootResult = await tools.hypervisor_boot({
            kernel_url: 'alpine_v3_20.rts.png',
            memory_mb: 256
        });
        if (!bootResult.success) throw new Error("Boot failed: " + bootResult.error);
        log("✅ System Booted. Session ID: " + bootResult.session_id);

        // 2. Install Software (Input Driver Phase)
        // We use linux_exec to run shell commands inside the VM
        log("Step 2: Installing 'xeyes' via apk...");
        const installResult = await tools.linux_exec({
            command: 'apk update && apk add xeyes',
            timeout: 60
        });
        log("Output: " + installResult.stdout);

        // 3. Launch GUI Application
        // We set DISPLAY=:0 to target the framebuffer we are watching
        log("Step 3: Launching xeyes...");
        await tools.linux_exec({
            command: 'DISPLAY=:0 xeyes &',
            timeout: 5
        });
        log("✅ GUI App Launched");

        // 4. Verify Visuals (Vision Phase)
        // The AI "looks" at the screen using the GPU Pattern Detector
        log("Step 4: Analyzing screen content...");
        const frame = await tools.hypervisor_frame({ format: 'rgba' });
        // In a real scenario, we would pass 'frame' to the GPUPatternDetector
        // const positions = await patternDetector.detect(frame, 'eye_shape');
        log("✅ Screen captured (${frame.width}x${frame.height})");

        // 5. Interact with GUI (Manipulation Phase)
        // We move the mouse. In xeyes, the eyes should follow the cursor.
        log("Step 5: Moving mouse to interact...");
        const center = { x: 400, y: 300 };
        const radius = 100;

        for (let i = 0; i <= 20; i++) {
            const angle = (i / 10) * Math.PI; // 2 half-circles
            const x = center.x + Math.cos(angle) * radius;
            const y = center.y + Math.sin(angle) * radius;

            await tools.hypervisor_input({
                type: 'mousemove',
                x: Math.round(x),
                y: Math.round(y)
            });

            // Wait 50ms (simulating human/agent reaction time)
            await new Promise(r => setTimeout(r, 50));
        }
        log("✅ Interaction sequence complete.");

    } catch (e) {
        console.error("❌ Demo Failed:", e);
    }
}
