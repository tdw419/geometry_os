/**
 * Geometry OS: LLM World Builder
 * 
 * This script uses the Spatial Architect API to build a visual representation
 * of the Geometry OS internal architecture on the Infinite Map.
 */

const GEOMETRY_OS_ARCHITECTURE = {
    version: '1.0',
    clearExisting: true,
    structures: [
        // CORE INFRASTRUCTURE (CENTER)
        {
            x: 0, y: 0, type: 'crystal', metadata: {
                name: 'VISUAL SHELL',
                description: 'PixiJS v8 WebGPU Interface',
                complexity: 0.9,
                status: 'complete',
                codeReference: 'systems/visual_shell/web/'
            }
        },

        // BACKEND / SYSTEMS
        {
            x: -2, y: 0, type: 'tower', metadata: {
                name: 'COMPOSITOR',
                description: 'Rust/Smithay Native Compositor',
                complexity: 0.85,
                status: 'complete',
                codeReference: 'systems/infinite_map_rs/'
            }
        },
        {
            x: -2, y: 1, type: 'bridge', metadata: {
                name: 'WGPU_PIPELINE',
                description: 'Native rendering bridge',
                status: 'complete',
                codeReference: 'systems/infinite_map_rs/src/renderer.rs'
            }
        },

        // DATA SUBSYSTEMS
        {
            x: 0, y: -2, type: 'vault', metadata: {
                name: 'RTS_REGISTRY',
                description: 'PixelRTS Storage & Metadata',
                status: 'complete',
                codeReference: 'pixelrts_manager.py'
            }
        },
        {
            x: -1, y: -2, type: 'bridge', metadata: {
                name: 'RTS_FUSE',
                description: 'Visual Filesystem Bridge',
                status: 'complete',
                codeReference: 'systems/rts_fuse/rts_fuse.py'
            }
        },

        // INTELLIGENCE & GOVERNANCE
        {
            x: 2, y: 0, type: 'tower', metadata: {
                name: 'VECTORLAND',
                description: 'OpenSpec Governance & Task Management',
                complexity: 0.75,
                status: 'complete',
                codeReference: 'systems/vectorland/'
            }
        },
        {
            x: 2, y: 1, type: 'garden', metadata: {
                name: 'NEURAL_SUBSTRATE',
                description: 'ACE Framework / LLM Evolution',
                status: 'building',
                codeReference: 'systems/intelligence/'
            }
        },

        // ACTIVE WORK (SCAFFOLDS)
        {
            x: 0, y: 2, type: 'scaffold', metadata: {
                name: 'PHASE_29_LINUX',
                description: 'Integrating Alpine Linux as live tile',
                status: 'building',
                codeReference: 'systems/visual_shell/web/linux_gpu_loader.js'
            }
        },
        {
            x: 1, y: 2, type: 'bridge', metadata: {
                name: 'SYSCALL_BRIDGE',
                description: 'Linux-to-GPU Syscall Mapping',
                status: 'building',
                codeReference: 'systems/visual_shell/web/linux_gpu_loader.js:380'
            }
        }
    ]
};

// Auto-execute when the map is ready
window.addEventListener('geometry-os-ready', () => {
    // Small delay to ensure initialization is complete
    setTimeout(() => {
        if (window.geometryOSApp && window.geometryOSApp.infiniteMap) {
            console.log('🏗️  LLM World Builder: Constructing Architecture Manifest...');
            window.geometryOSApp.infiniteMap.renderBuildManifest(GEOMETRY_OS_ARCHITECTURE);
        }
    }, 2000);
});

// Manual trigger globally accessible
window.buildArchitecture = () => {
    if (window.geometryOSApp && window.geometryOSApp.infiniteMap) {
        return window.geometryOSApp.infiniteMap.renderBuildManifest(GEOMETRY_OS_ARCHITECTURE);
    }
};
