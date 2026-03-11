/**
 * Geometry OS - AI Operator Verification Script (Auto-Run)
 * 
 * This file is for auto-running the demo in the browser context.
 */
import { runLinuxGuiDemo } from './demo_linux_gui_install.js';

// Wait for WebMCP tools to be ready
window.addEventListener('load', async () => {
    // Wait a brief moment for mock tools registration
    await new Promise(r => setTimeout(r, 1000));

    // Check if tools exist (Mock or Real)
    const tools = {};
    const handlers = window.navigator.modelContext?.toolHandlers || window.mockTools || {};

    // Map tool names to handlers
    for (const [name, handler] of Object.entries(handlers)) {
        tools[name] = handler.handler || handler; // Handle {tool, handler} structure or direct function
    }

    if (Object.keys(tools).length > 0) {
        console.log("Starting Linux GUI Demo...");
        await runLinuxGuiDemo(tools);
    } else {
        console.warn("No WebMCP tools found. Demo skipped.");
    }
});
