/**
 * Geometry OS: Spatial Linux Boot Demo
 *
 * This script demonstrates how to boot Linux by clicking
 * on the Phase 29 Linux scaffold structure on the Infinite Map.
 *
 * Usage:
 * 1. Load the Geometry OS web interface
 * 2. Wait for the LLM World Builder to create structures
 * 3. Click on the "PHASE_29_LINUX" scaffold at (0, 2)
 * 4. Linux boots on GPU with TTY console
 *
 * @module demo_spatial_linux
 */

// Auto-configure when everything is ready
window.addEventListener('geometry-os-ready', () => {
    setTimeout(async () => {
        try {
            // Get references
            const app = window.geometryOSApp;
            if (!app) {
                console.warn('⚠️  GeometryOSApp not ready');
                return;
            }

            const infiniteMap = app.infiniteMap;
            const gpuSystem = app.gpuSystem;

            // Check if structure interactions is ready
            if (!window.structureInteractions) {
                console.warn('⚠️  StructureInteractions not ready');
                return;
            }

            console.log('');
            console.log('═══════════════════════════════════════════════════════════');
            console.log('     SPATIAL LINUX BOOT: INITIALIZING                               ');
            console.log('═══════════════════════════════════════════════════════════');
            console.log('');

            // Create Linux GPU loader
            const linuxLoader = new LinuxGPULoader(gpuSystem, infiniteMap, {
                kernelPath: '/rts_files/alpine_visual.rts.png',
                tileSize: 2048,
                ttyRows: 25,
                ttyCols: 80
            });

            // Load kernel (but don't boot yet - wait for user to click structure)
            console.log('📦 Loading Linux kernel (background)...');
            await linuxLoader.loadKernel(0, 3); // Load adjacent to scaffold

            // Link loader to structure interactions
            window.structureInteractions.setLinuxLoader(linuxLoader);

            console.log('');
            console.log('✅ SPATIAL LINUX BOOT READY');
            console.log('');
            console.log('   📍 Phase 29 Linux Scaffold at (0, 2)');
            console.log('   📍 Linux Kernel Tile at (0, 3)');
            console.log('');
            console.log('   INSTRUCTION:');
            console.log('   Click on the "PHASE_29_LINUX" scaffold structure');
            console.log('   on the Infinite Map to boot Linux on GPU.');
            console.log('');
            console.log('   The TTY console will appear showing Linux boot messages.');
            console.log('');

            // Store for manual access
            window.spatialLinux = {
                loader: linuxLoader,
                interactions: window.structureInteractions,
                boot: async () => {
                    const tile = infiniteMap.getTile(0, 2);
                    if (tile) {
                        await window.structureInteractions.bootLinux(tile);
                    } else {
                        console.error('❌ Phase 29 Linux scaffold not found at (0, 2)');
                    }
                },
                status: () => {
                    return linuxLoader.getStats();
                }
            };

            // Add instructions to console
            console.log('💡 TIP: You can also boot manually via:');
            console.log('   await window.spatialLinux.boot()');
            console.log('   window.spatialLinux.status()');
            console.log('');

        } catch (error) {
            console.error('❌ Failed to initialize spatial Linux:', error);
        }
    }, 3000);
});

/**
 * Manual setup function (if auto-init fails)
 */
window.setupSpatialLinux = async () => {
    try {
        const app = window.geometryOSApp;
        const infiniteMap = app.infiniteMap;
        const gpuSystem = app.gpuSystem;

        // Create Linux GPU loader
        const linuxLoader = new LinuxGPULoader(gpuSystem, infiniteMap);
        await linuxLoader.loadKernel(0, 3);

        // Link to interactions
        if (window.structureInteractions) {
            window.structureInteractions.setLinuxLoader(linuxLoader);
        }

        window.spatialLinux = {
            loader: linuxLoader,
            boot: async () => {
                const tile = infiniteMap.getTile(0, 2);
                if (tile && window.structureInteractions) {
                    await window.structureInteractions.bootLinux(tile);
                }
            },
            status: () => linuxLoader.getStats()
        };

        console.log('✅ Spatial Linux ready');
        return window.spatialLinux;

    } catch (error) {
        console.error('Setup failed:', error);
    }
};
