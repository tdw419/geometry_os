/**
 * Semantic Shotcut Integration
 * 
 * Boots the Shotcut PixelRTS cartridge and connects the VisionCortex/Semantic Overlay.
 */

window.setupShotcutDemo = async () => {
    console.log("🎬 Setting up Shotcut Semantic Demo...");

    // Ensure WebMCP is ready
    if (!navigator.modelContext || !navigator.modelContext.toolHandlers) {
        console.warn("WebMCP toolHandlers not ready yet. Retrying in 1s...");
        setTimeout(window.setupShotcutDemo, 1000);
        return;
    }

    // 1. Boot the cartridge with the video
    try {
        const result = await navigator.modelContext.toolHandlers['hypervisor_boot']({
            kernel_url: 'shotcut.rts.png',
            memory_mb: 256,
            mounts: [
                { url: 'pixelrts_caption_with_images.mp4', path: '/home/user/Videos/video.mp4' },
                { url: 'pixelrts_diagram.png', path: '/home/user/Pictures/diagram.png' }
            ]
        });

        if (!result.success) {
            console.error("Failed to boot Shotcut:", result.error);
            return;
        }

        console.log("✅ Shotcut Booted with Media:", result.status);
    } catch (e) {
        console.error("Error booting Shotcut:", e);
        return;
    }

    // 2. Start the AI "Eyes" loop (VisionCortex)
    if (window.shotcutVisionLoop) clearInterval(window.shotcutVisionLoop);

    window.shotcutVisionLoop = setInterval(async () => {
        if (!window.hypervisorSystem) return;

        // This triggers the overlay automatically via the event we added
        if (navigator.modelContext.toolHandlers['hypervisor_frame']) {
            await navigator.modelContext.toolHandlers['hypervisor_frame']({
                format: 'semantic'
            });
        }
    }, 1000); // Update every second

    console.log("👁️ Semantic Vision active - Look for neon overlays on the Shotcut window");

    // 3. Simulate AI Editing Agent Actions
    console.log("🤖 AI Agent: Starting editing sequence...");

    const wait = (ms) => new Promise(r => setTimeout(r, ms));

    // Helper to click by label
    const clickElement = async (label) => {
        try {
            console.log(`🤖 AI Agent: Searching for '${label}'...`);
            const findResult = await navigator.modelContext.toolHandlers['hypervisor_find_element']({
                label: label,
                type: 'any'
            });

            if (findResult.success && findResult.found) {
                const el = findResult.elements[0];
                console.log(`🤖 AI Agent: Found '${label}' at (${el.center.x}, ${el.center.y}). Clicking...`);

                await navigator.modelContext.toolHandlers['hypervisor_input']({
                    type: 'mouse',
                    x: el.center.x,
                    y: el.center.y,
                    button: 'left'
                });
                return true;
            } else {
                console.warn(`🤖 AI Agent: Could not find '${label}'.`);
                // Fallback: visual scan suggestion
                console.log(`🤖 AI Agent: Scanning full UI...`);
                return false;
            }
        } catch (e) {
            console.error("AI Action Error:", e);
            return false;
        }
    };

    // ACTION SEQUENCE
    await wait(5000); // Wait for boot

    // Step 1: Open File (simulated since we mounted it)
    console.log("🤖 AI Agent: Step 1 - Focusing Timeline");
    await clickElement("Timeline");

    await wait(2000);

    // Step 2: Add Diagram
    console.log("🤖 AI Agent: Step 2 - Append Diagram to Playlist");
    // Click "Playlist" tab
    await clickElement("Playlist");
    await wait(1000);

    // Step 3: Insert Diagram at Split
    console.log("🤖 AI Agent: Step 3 - Split and Insert");
    await clickElement("Timeline");
    await wait(1000);

    // Split
    await navigator.modelContext.toolHandlers['hypervisor_input']({ type: 'keyboard', keys: 's' });
    await wait(1000);

    // Insert Image
    console.log("🤖 AI Agent: Inserting Image...");
    await navigator.modelContext.toolHandlers['hypervisor_input']({ type: 'keyboard', keys: 'v' });

    await wait(2000);

    // Step 4: Export logic...
    console.log("🤖 AI Agent: Step 4 - Select unwanted part");
    await navigator.modelContext.toolHandlers['hypervisor_input']({ type: 'mouse', x: 50, y: 400, button: 'left' });

    await wait(1000);

    // Step 4: Export
    console.log("🤖 AI Agent: Step 4 - Export Project");
    await clickElement("Export");

    console.log("✅ AI Editing Sequence Complete");
};

// Auto-run if requested via URL param
if (new URLSearchParams(window.location.search).has('demo_shotcut')) {
    window.addEventListener('geometry-os-ready', () => {
        setTimeout(window.setupShotcutDemo, 3000); // Wait for WebMCP to initialize
    });
}
