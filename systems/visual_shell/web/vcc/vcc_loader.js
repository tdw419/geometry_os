/**
 * VCC Loader
 * 
 * Script loader for the Visual Consistency Contract.
 * Loads all VCC modules and initializes integration with the infinite map.
 * 
 * Include in HTML after PixiJS and application.js:
 *   <script src="vcc/vcc_loader.js"></script>
 */

(function() {
    'use strict';

    // VCC module loading order
    const VCC_MODULES = [
        'vcc/visual_consistency_contract.js',      // ConsistencyOracle
        'vcc/health_overlay_renderer.js',          // HealthOverlayRenderer
        'vcc/visual_contract_policy.js',           // VisualContractPolicy
        'vcc/canary_websocket_bridge.js',          // CanaryWebSocketBridge
        'vcc/vcc_integration.js'                   // VCCIntegration
    ];

    // Base path for VCC modules (relative to HTML file)
    const VCC_BASE_PATH = '';

    /**
     * Load a script dynamically
     */
    function loadScript(src) {
        return new Promise((resolve, reject) => {
            const script = document.createElement('script');
            script.src = src;
            script.async = false; // Maintain load order
            script.onload = resolve;
            script.onerror = reject;
            document.head.appendChild(script);
        });
    }

    /**
     * Load all VCC modules
     */
    async function loadVCCModules() {
        console.log('🎨 Loading Visual Consistency Contract modules...');
        
        for (const module of VCC_MODULES) {
            const path = VCC_BASE_PATH + module;
            try {
                await loadScript(path);
                console.log(`✅ Loaded ${module}`);
            } catch (e) {
                console.error(`❌ Failed to load ${module}:`, e);
                throw e;
            }
        }
        
        console.log('✅ All VCC modules loaded');
    }

    /**
     * Initialize VCC with the infinite map
     */
    async function initializeVCC() {
        // Wait for the map to be ready
        if (!window.infiniteMap && !window.geometryOS?.infiniteMap) {
            console.warn('VCC: Infinite map not found, waiting...');
            setTimeout(initializeVCC, 1000);
            return;
        }
        
        const map = window.infiniteMap || window.geometryOS.infiniteMap;
        
        try {
            // Create VCC integration
            window.vcc = new VCCIntegration(map, {
                debug: false,
                logLevel: 'warn',
                canaryUrl: 'ws://localhost:8766/vcc',
                enableOverlays: true,
                autoRetranspile: true,
                retranspileThreshold: 0.85
            });
            
            // Initialize
            await window.vcc.initialize();
            
            // Enable for viewport
            window.vcc.enableForViewport();
            
            console.log('✅ Visual Consistency Contract active');
            console.log('   Press Ctrl+Shift+H to toggle health overlays');
            console.log('   Press Ctrl+Shift+V for viewport health summary');
            
            // Setup keyboard shortcuts
            setupKeyboardShortcuts();
            
            // Expose VCC API globally
            window.VCC = {
                getHealth: (tileKey) => window.vcc.oracle.getHealth(tileKey),
                getViewportHealth: () => window.vcc.getViewportHealth(),
                getStats: () => window.vcc.getStats(),
                analyze: (tileConfigs) => window.vcc.analyzeTiles(tileConfigs),
                disable: () => window.vcc.disable(),
                enable: () => window.vcc.enableForViewport(),
                toggleOverlays: () => {
                    const current = window.vcc.config.enableOverlays;
                    window.vcc.setConfig('enableOverlays', !current);
                    window.vcc.renderer.setVisible(!current);
                    return !current;
                }
            };
            
        } catch (e) {
            console.error('❌ Failed to initialize VCC:', e);
        }
    }

    /**
     * Setup keyboard shortcuts
     */
    function setupKeyboardShortcuts() {
        document.addEventListener('keydown', (e) => {
            // Ctrl+Shift+H: Toggle health overlays
            if (e.ctrlKey && e.shiftKey && e.key === 'H') {
                e.preventDefault();
                const enabled = window.VCC.toggleOverlays();
                console.log(`Health overlays ${enabled ? 'enabled' : 'disabled'}`);
            }
            
            // Ctrl+Shift+V: Show viewport health
            if (e.ctrlKey && e.shiftKey && e.key === 'V') {
                e.preventDefault();
                const health = window.VCC.getViewportHealth();
                console.table({
                    'Tiles Analyzed': `${health.analyzed}/${health.total}`,
                    'Average V-PAS': health.averageVPas.toFixed(4),
                    'Risk Score': (health.riskScore * 100).toFixed(1) + '%',
                    'OPTIMAL': health.statuses.OPTIMAL,
                    'STABLE': health.statuses.STABLE,
                    'WARNING': health.statuses.WARNING,
                    'CRITICAL': health.statuses.CRITICAL,
                    'CORRUPTED': health.statuses.CORRUPTED
                });
            }
        });
    }

    // Auto-initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            loadVCCModules().then(initializeVCC).catch(console.error);
        });
    } else {
        // DOM already loaded
        loadVCCModules().then(initializeVCC).catch(console.error);
    }

    // Also expose manual init for delayed loading
    window.initVCC = async function() {
        await loadVCCModules();
        await initializeVCC();
    };

})();
