/**
 * Geometry OS: Visual Boot Loader
 * 
 * Transforms "Booting" from a temporal event into a spatial interaction.
 * In the Infinite Map, an OS is just a tile. Booting happens when you
 * travel (navigate) into that tile's execution threshold.
 * 
 * Concepts:
 * - Boot Target: A specific coordinate on the map representing a machine.
 * - Ignition Threshold: The zoom level/proximity required to "power on" the machine.
 * - Live Texture: Swapping the static .rts.png for a live VNC/Framebuffer stream.
 */

class VisualBootLoader {
    /**
     * @param {ViewportManager} viewport - The camera controller
     * @param {TileSpriteManager} tileManager - Manager for tile visuals
     * @param {Object} config - Configuration options
     */
    constructor(viewport, tileManager, config = {}) {
        this.viewport = viewport;
        this.tileManager = tileManager;

        this.config = {
            bootRadius: 500, // Distance to target to arm the trigger
            triggerZoom: 2.5, // Zoom level to execute boot
            apiEndpoint: 'http://localhost:8080/api/vm', // Backend control
            ...config
        };

        // Registry of bootable systems on the map
        this.bootTargets = new Map();

        // State
        this.activeSystem = null;

        // Initialize default targets (e.g., Alpine Linux)
        this.registerTarget({
            id: 'alpine_vm_01',
            name: 'Alpine Linux (Dev)',
            x: 1200 * 100, // World coords (Tile 1200 * Grid 100)
            y: 0,
            brickType: 'alpine_core',
            status: 'OFFLINE'
        });


    }

    /**
     * Register a new bootable location
     */
    registerTarget(target) {
        this.bootTargets.set(target.id, {
            ...target,
            booted: false,
            loading: false
        });
        console.log(`🔌 Registered Boot Target: ${target.name} at (${target.x}, ${target.y})`);
    }

    /**
     * Main Loop: Check if camera is close enough to ignite any system
     */
    update() {
        const camera = this.viewport.getCamera();

        for (const [id, target] of this.bootTargets) {
            if (target.booted || target.loading) continue;

            const dx = camera.x - target.x;
            const dy = camera.y - target.y;
            const distance = Math.sqrt(dx * dx + dy * dy);

            // 1. ARMING: User is approaching the system
            if (distance < this.config.bootRadius * 2) {
                // Potential visual feedback: "System Detected" UI hint
            }

            // 2. IGNITION: User is close enough and zoomed in (Focusing)
            if (distance < this.config.bootRadius && camera.zoom > this.config.triggerZoom) {
                this.igniteSystem(id);
            }
        }
    }

    /**
     * Trigger the boot sequence
     */
    async igniteSystem(systemId) {
        const target = this.bootTargets.get(systemId);
        if (!target) return;

        console.log(`🚀 IGNITION SEQUECE: ${target.name}`);
        target.loading = true;

        // Visual Feedback: Flash the tile
        // We need to find the specific tile sprite if it is visible
        // Convert world coords to tile coords
        const tileX = Math.floor(target.x / 100);
        const tileY = Math.floor(target.y / 100);

        // This relies on tileManager exposing updated tile access
        // const sprite = this.tileManager.getTile(tileX, tileY);
        // if (sprite) sprite.tint = 0x00FF00;

        try {
            // 1. Signal Backend to Start VM
            console.log("   > Signal sent to Hypervisor...");
            // Simulate network delay or real fetch
            // await fetch(`${this.config.apiEndpoint}/boot/${systemId}`, { method: 'POST' });

            await new Promise(resolve => setTimeout(resolve, 1000)); // Mock boot delay

            // 2. Handshake Complete
            target.booted = true;
            target.loading = false;
            target.status = 'ONLINE';
            this.activeSystem = systemId;

            console.log(`✅ ${target.name} is ONLINE. Establishing Framebuffer Link...`);

            // 3. Texture Swap (Static -> Live)
            // In a real implementation, this would switch the sprite texture source 
            // to a stream or frequently updating blob from the backend

        } catch (error) {
            console.error(`❌ Boot Failed for ${target.name}:`, error);
            target.loading = false;
        }
    }

    loadArtifactAtPosition(artifact_path, x, y) {
        console.log(`🖼️ Loading artifact ${artifact_path} at world position (${x}, ${y})`);

        // Convert world coordinates to tile coordinates
        const tileX = Math.floor(x / this.tileManager.gridSize);
        const tileY = Math.floor(y / this.tileManager.gridSize);

        // The artifact_path is expected to be a URL to the .rts.png
        // The tileManager can handle loading textures from URLs
        this.tileManager.addOrUpdateTile(tileX, tileY, artifact_path, Date.now());

        // Optionally, make it a boot target if it's a known bootable type
        // This part can be more sophisticated later, checking metadata etc.
        // For now, assume if it's placed, it's not immediately bootable via proximity
    }

    /**
     * Get status for HUD
     */
    getStatus() {
        return Array.from(this.bootTargets.values()).map(t => ({
            name: t.name,
            status: t.status,
            distance: Math.floor(Math.sqrt(
                Math.pow(this.viewport.camera.x - t.x, 2) +
                Math.pow(this.viewport.camera.y - t.y, 2)
            ))
        }));
    }
}

// Export
if (typeof window !== 'undefined') {
    window.VisualBootLoader = VisualBootLoader;
}
