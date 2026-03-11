/**
 * Geometry OS: Structure Interactions Module
 *
 * Connects spatial structures to their functional implementations
 * When you click a structure on the map, it boots/activates the actual system.
 *
 * @module structure_interactions
 */

class StructureInteractions {
    constructor(infiniteMap) {
        this.map = infiniteMap;
        this.linuxLoader = null;
        this.activeSystems = new Map(); // Track running systems

        console.log('🔗 StructureInteractions initialized');

        // Listen for structure click events
        window.addEventListener('structure:click', (e) => this.onStructureClick(e.detail));
    }

    /**
     * Set the Linux GPU loader instance
     */
    setLinuxLoader(loader) {
        this.linuxLoader = loader;
        console.log('🐧 Linux loader linked to StructureInteractions');
    }

    /**
     * Handle structure click events
     */
    async onStructureClick(detail) {
        const { x, y, metadata } = detail;
        const tile = this.map.getTile(x, y);

        if (!tile) {
            console.warn(`⚠️  No tile at (${x}, ${y})`);
            return;
        }

        console.log(`🖱️  Clicked structure at (${x}, ${y}): ${tile.metadata.name || tile.type}`);
        console.log(`   Type: ${tile.type}`);
        console.log(`   Status: ${tile.metadata.status || 'unknown'}`);

        // Route to appropriate handler based on structure type/name
        switch (tile.metadata.name) {
            case 'PHASE_29_LINUX':
                await this.bootLinux(tile);
                break;

            case 'VECTORLAND':
                await this.openVectorland(tile);
                break;

            case 'COMPOSITOR':
                await this.openCompositor(tile);
                break;

            case 'NEURAL_SUBSTRATE':
                await this.openNeuralSubstrate(tile);
                break;

            case 'RTS_FUSE':
                await this.openRTSFUSE(tile);
                break;

            default:
                this.showGenericInfo(tile);
        }
    }

    /**
     * Boot Linux when Phase 29 Linux scaffold is clicked
     */
    async bootLinux(tile) {
        if (!this.linuxLoader) {
            console.warn('⚠️  Linux loader not configured');
            console.log('   Set loader: interactions.setLinuxLoader(linuxLoader)');
            return;
        }

        console.log('');
        console.log('🐧 BOOTING LINUX FROM SPATIAL STRUCTURE');
        console.log('═══════════════════════════════════════════════════════════');
        console.log('');

        // Check if already loaded
        if (this.activeSystems.has('linux')) {
            console.log('⚠️  Linux already running');
            return;
        }

        try {
            // Update tile status to show booting
            this.updateTileStatus(tile, 'booting');

            // Boot Linux on GPU
            await this.linuxLoader.bootOnGPU();

            // Mark as active
            this.activeSystems.set('linux', {
                tile: tile,
                startedAt: Date.now()
            });

            // Update tile status
            this.updateTileStatus(tile, 'running');

            console.log('');
            console.log('✅ Linux booted from spatial structure');
            console.log('   TTY console should now be visible');
            console.log('');

        } catch (error) {
            console.error('❌ Failed to boot Linux:', error);
            this.updateTileStatus(tile, 'error');
        }
    }

    /**
     * Open Vectorland governance interface
     */
    async openVectorland(tile) {
        console.log('📊 Opening Vectorland governance interface...');

        // Emit event for Vectorland UI
        window.dispatchEvent(new CustomEvent('vectorland:open', {
            detail: { tile }
        }));

        this.showNotification('Vectorland', 'Governance interface opening...');
    }

    /**
     * Open Compositor control panel
     */
    async openCompositor(tile) {
        console.log('🖼️  Opening Compositor control panel...');

        window.dispatchEvent(new CustomEvent('compositor:open', {
            detail: { tile }
        }));

        this.showNotification('Compositor', 'Control panel opening...');
    }

    /**
     * Open Neural Substrate evolution interface
     */
    async openNeuralSubstrate(tile) {
        console.log('🧠 Opening Neural Substrate evolution interface...');

        window.dispatchEvent(new CustomEvent('neural:open', {
            detail: { tile }
        }));

        this.showNotification('Neural Substrate', 'Evolution interface opening...');
    }

    /**
     * Open RTS FUSE filesystem browser
     */
    async openRTSFUSE(tile) {
        console.log('💾 Opening RTS FUSE filesystem browser...');

        window.dispatchEvent(new CustomEvent('rtsfuse:open', {
            detail: { tile }
        }));

        this.showNotification('RTS FUSE', 'Filesystem browser opening...');
    }

    /**
     * Show generic structure info
     */
    showGenericInfo(tile) {
        console.log(`📋 ${tile.metadata.name || tile.type.toUpperCase()}`);
        console.log(`   Description: ${tile.metadata.description || 'No description'}`);
        console.log(`   Status: ${tile.metadata.status || 'unknown'}`);
        console.log(`   Complexity: ${tile.metadata.complexity || 'N/A'}`);
        console.log(`   Code: ${tile.metadata.codeReference || 'N/A'}`);
    }

    /**
     * Update tile status visual
     */
    updateTileStatus(tile, status) {
        // Update metadata
        tile.metadata.status = status;

        // Update visual if there's a status indicator
        const container = tile.sprite;
        if (container && container.statusLabel) {
            const statusText = {
                'booting': '🔄 BOOTING',
                'running': '✅ RUNNING',
                'error': '❌ ERROR',
                'stopped': '⏸️  STOPPED'
            }[status] || status.toUpperCase();

            container.statusLabel.text = statusText;
        }

        // Flash effect for status change
        if (container) {
            const flash = new PIXI.Graphics();
            flash.beginFill(0xFFFF00, 0.3);
            flash.drawRect(0, 0, this.map.config.gridSize, this.map.config.gridSize);
            flash.endFill();
            container.addChild(flash);

            // Fade out
            let alpha = 0.3;
            const fade = () => {
                alpha -= 0.05;
                flash.alpha = alpha;
                if (alpha > 0) {
                    requestAnimationFrame(fade);
                } else {
                    container.removeChild(flash);
                }
            };
            requestAnimationFrame(fade);
        }
    }

    /**
     * Show notification popup
     */
    showNotification(title, message) {
        // Remove existing notifications
        const existing = document.getElementById('structure-notification');
        if (existing) existing.remove();

        // Create notification
        const notification = document.createElement('div');
        notification.id = 'structure-notification';
        notification.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: rgba(0, 20, 40, 0.95);
            border: 1px solid #00FFFF;
            border-radius: 8px;
            padding: 15px 20px;
            color: #00FFFF;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            z-index: 10000;
            animation: slideIn 0.3s ease-out;
        `;

        notification.innerHTML = `
            <div style="font-weight: bold; margin-bottom: 5px;">${title}</div>
            <div style="opacity: 0.8;">${message}</div>
        `;

        // Add animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from { transform: translateX(100%); opacity: 0; }
                to { transform: translateX(0); opacity: 1; }
            }
        `;
        document.head.appendChild(style);

        document.body.appendChild(notification);

        // Auto-remove after 3 seconds
        setTimeout(() => {
            notification.style.animation = 'slideIn 0.3s ease-out reverse';
            setTimeout(() => notification.remove(), 300);
        }, 3000);
    }

    /**
     * Get active systems status
     */
    getActiveSystems() {
        return Object.fromEntries(this.activeSystems);
    }
}

// Auto-initialize when geometry-os-ready
window.addEventListener('geometry-os-ready', () => {
    setTimeout(() => {
        if (window.geometryOSApp && window.geometryOSApp.infiniteMap) {
            window.structureInteractions = new StructureInteractions(
                window.geometryOSApp.infiniteMap
            );
            console.log('✅ StructureInteractions ready');
        }
    }, 2500);
});

// Export for browser
if (typeof window !== 'undefined') {
    window.StructureInteractions = StructureInteractions;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { StructureInteractions };
}
