/**
 * Geometry OS: Infinite Map Component (PixiJS v8 Optimized)
 *
 * Synchronizes the visual shell with the Geometric Manifest and
 * handles real-time refreshing of dynamic sectors like the Silicon District.
 *
 * Phase 6: Driver Analysis - Displays vulnerability overlays on hardware tiles
 */

// Import Pixel CPU emulator
// Note: In browser environment, this would be loaded via script tag or module
if (typeof SimplePixelCPU === 'undefined') {
    // Load dynamically if not already loaded
    console.warn('SimplePixelCPU not loaded, CPU execution disabled');
}

class InfiniteMap {
    constructor(worldContainer, config = {}) {
        this.world = worldContainer;
        this.config = {
            gridSize: 100, // Sync with Rust CONFIG.grid_size
            manifestPath: '/builder/map/manifest.json',
            securityMetadataPath: '/builder/metadata/silicon_district.json',
            pollInterval: 2000, // Check for manifest updates
            securityPollInterval: 5000, // Check for security updates
            tileScale: 1.0,
            websocketUrl: 'ws://127.0.0.1:8765', // Compositor WebSocket
            enableCameraSync: true, // Enable camera sync by default
            enableLLMChat: false, // Enable LLM chat functionality
            ...config
        };

        this.tiles = new Map(); // "x,y" -> { sprite, timestamp }
        this.securityOverlays = new Map(); // "x,y" -> { overlay, metrics }
        this.activationFlashes = new Map(); // "x,y" -> { flash, timestamp }
        this.active = true;
        this.lastManifestTimestamp = 0;
        this.lastSecurityTimestamp = 0;

        // Phase 43: WebSocket connection for camera sync
        this.ws = null;
        this.wsReconnectAttempts = 0;
        this.maxReconnectAttempts = 10;

        // LLM Chat Panel
        this.chatPanel = null;
        this.llmTiles = new Set(); // Track LLM tiles for click handling

        // Neural Heatmap Overlay
        this.heatmapOverlay = null;
        this.heatmapControls = null;

        // Phase 6: Pixel CPU Integration
        this.pixelCPU = null;
        this.enablePixelCPU = true; // Enable by default
        this.ticker = null;

        console.log('🗺️  InfiniteMap initialized. Manifest:', this.config.manifestPath);
        this.startSync();
        this.startSecuritySync();

        // Phase 43: Connect to compositor WebSocket for camera sync
        if (this.config.enableCameraSync) {
            this.connectToCompositor();
        }

        // Initialize LLM Chat Panel
        if (this.config.enableLLMChat && typeof LLMChatPanel !== 'undefined') {
            this.chatPanel = new LLMChatPanel();
            console.log('💬 LLM Chat Panel initialized');
        }

        // Learning System: Initialize Performance Monitor
        if (typeof PerformanceMonitor !== 'undefined') {
            this.performanceMonitor = new PerformanceMonitor();
            this.performanceMonitor.createOverlay(this);
            console.log('📊 Performance Monitor initialized');
        }

        // Phase 6: Initialize Pixel CPU Integration
        if (this.enablePixelCPU && typeof PixelCPUIntegration !== 'undefined') {
            this.pixelCPU = new PixelCPUIntegration(this, {
                cyclesPerFrame: 1000,
                framebufferWidth: 640,
                framebufferHeight: 480,
                consoleWidth: 800,
                consoleHeight: 200
            });
            console.log('🖥️  Pixel CPU Integration initialized');
        }

        // Phase 31: Initialize Python Transmutation Loader
        if (typeof PythonTransmutationLoader !== 'undefined') {
            this.pythonLoader = new PythonTransmutationLoader(this, {
                autoPlace: true,
                defaultTileType: 'scaffold'
            });
            console.log('🐍 Python Transmutation Loader initialized');
        }

        // Setup keyboard shortcuts
        this.setupKeyboardShortcuts();

        // Initialize Neural Heatmap Overlay
        this.initializeHeatmapOverlay();

        // Setup heatmap controls
        this.setupHeatmapControls();
    }

    async startSync() {
        while (this.active) {
            try {
                await this.checkUpdates();
            } catch (e) {
                console.warn('⚠️  Map Sync Error:', e);
            }
            await new Promise(r => setTimeout(r, this.config.pollInterval));
        }
    }

    async startSecuritySync() {
        while (this.active) {
            try {
                await this.checkSecurityUpdates();
            } catch (e) {
                console.warn('⚠️  Security Sync Error:', e);
            }
            await new Promise(r => setTimeout(r, this.config.securityPollInterval));
        }
    }

    async checkUpdates() {
        try {
            // In a real browser, we'd use fetch(). In this environment,
            // the server usually serves the manifest via a proxy or static route.
            const response = await fetch(this.config.manifestPath + '?t=' + Date.now());
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            const manifest = await response.json();

            const tilePromises = [];
            for (const [coord, entry] of Object.entries(manifest)) {
                const [x, y] = coord.split(',').map(Number);
                const key = `${x},${y}`;
                const existing = this.tiles.get(key);

                if (!existing || existing.timestamp < entry.timestamp) {
                    tilePromises.push(this.loadTile(x, y, entry.brick, entry.timestamp));
                }
            }

            await Promise.all(tilePromises);

            // Hide loading indicator after first successful load
            if (this.tiles.size > 0) {
                this.hideLoadingIndicator();
            }
        } catch (error) {
        }
    }

    async checkSecurityUpdates() {
        try {
            const response = await fetch(this.config.securityMetadataPath + '?t=' + Date.now());
            const metadata = await response.json();

            if (metadata.security) {
                this.updateSecurityOverlays(metadata.security);
            }
        } catch (e) {
            console.debug('Security metadata not available yet:', e);
        }
    }

    updateSecurityOverlays(security) {
        const siliconCoords = "-10,-10";
        const existing = this.securityOverlays.get(siliconCoords);

        if (!existing || existing.timestamp < security.last_scan) {
            this.renderSecurityOverlay(-10, -10, security);
        }
    }

    renderSecurityOverlay(x, y, security) {
        const key = `${x},${y}`;
        const existing = this.securityOverlays.get(key);

        // Remove existing overlay if present
        if (existing && existing.overlay) {
            this.world.removeChild(existing.overlay);
        }

        // Only render overlay if there are vulnerabilities
        if (security.vulnerable_drivers === 0) {
            this.securityOverlays.delete(key);
            return;
        }

        // Create overlay container
        const overlay = new PIXI.Container();
        overlay.x = x * this.config.gridSize;
        overlay.y = y * this.config.gridSize;
        overlay.zIndex = 100; // Above the tile

        // Determine risk level color
        const riskColor = this.getRiskColor(security.risk_score);

        // Create risk indicator (colored border)
        const border = new PIXI.Graphics();
        border.lineStyle(4, riskColor, 0.8);
        border.drawRect(0, 0, this.config.gridSize, this.config.gridSize);
        overlay.addChild(border);

        // Create vulnerability count badge
        const badgeSize = 24;
        const badge = new PIXI.Graphics();
        badge.beginFill(riskColor, 0.9);
        badge.drawCircle(this.config.gridSize - badgeSize / 2, badgeSize / 2, badgeSize / 2);
        badge.endFill();
        overlay.addChild(badge);

        // Add vulnerability count text
        const countText = new PIXI.Text(
            security.vulnerable_drivers.toString(),
            {
                fontFamily: 'Arial',
                fontSize: 14,
                fontWeight: 'bold',
                fill: 0xFFFFFF,
                align: 'center'
            }
        );
        countText.anchor.set(0.5);
        countText.x = this.config.gridSize - badgeSize / 2;
        countText.y = badgeSize / 2;
        overlay.addChild(countText);

        // Create severity indicators (small dots)
        const severityY = this.config.gridSize - 10;
        let severityX = 10;

        if (security.critical_vulns > 0) {
            const dot = this.createSeverityDot(severityX, severityY, 0xFF0000, security.critical_vulns);
            overlay.addChild(dot);
            severityX += 15;
        }

        if (security.high_vulns > 0) {
            const dot = this.createSeverityDot(severityX, severityY, 0xFF8800, security.high_vulns);
            overlay.addChild(dot);
            severityX += 15;
        }

        if (security.medium_vulns > 0) {
            const dot = this.createSeverityDot(severityX, severityY, 0xFFFF00, security.medium_vulns);
            overlay.addChild(dot);
            severityX += 15;
        }

        if (security.low_vulns > 0) {
            const dot = this.createSeverityDot(severityX, severityY, 0x00FF00, security.low_vulns);
            overlay.addChild(dot);
        }

        // Add tooltip with security info
        overlay.interactive = true;
        overlay.cursor = 'pointer';
        overlay.on('pointerover', () => this.showSecurityTooltip(security, x, y));
        overlay.on('pointerout', () => this.hideSecurityTooltip());

        // Add to world
        this.world.addChild(overlay);
        this.securityOverlays.set(key, {
            overlay,
            metrics: security,
            timestamp: security.last_scan
        });

        console.log(`🔒 Security overlay rendered at (${x}, ${y}) - Risk: ${security.risk_score.toFixed(1)}`);
    }

    createSeverityDot(x, y, color, count) {
        const dot = new PIXI.Graphics();
        dot.beginFill(color, 1);
        dot.drawCircle(x, y, 4);
        dot.endFill();

        // Add count label if > 1
        if (count > 1) {
            const label = new PIXI.Text(
                count.toString(),
                {
                    fontFamily: 'Arial',
                    fontSize: 8,
                    fontWeight: 'bold',
                    fill: 0x000000,
                    align: 'center'
                }
            );
            label.anchor.set(0.5);
            label.x = x;
            label.y = y;
            dot.addChild(label);
        }

        return dot;
    }

    getRiskColor(riskScore) {
        if (riskScore >= 70) return 0xFF0000; // Red - Critical
        if (riskScore >= 50) return 0xFF8800; // Orange - High
        if (riskScore >= 30) return 0xFFFF00; // Yellow - Medium
        return 0x00FF00; // Green - Low
    }

    showSecurityTooltip(security, x, y) {
        // Create tooltip container
        const tooltip = new PIXI.Container();
        tooltip.x = x * this.config.gridSize + this.config.gridSize + 10;
        tooltip.y = y * this.config.gridSize;
        tooltip.zIndex = 200;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.9);
        bg.lineStyle(2, 0x00AAFF, 1);
        bg.drawRoundedRect(0, 0, 280, 180, 8);
        bg.endFill();
        tooltip.addChild(bg);

        // Title
        const title = new PIXI.Text('🔒 Security Status', {
            fontFamily: 'Arial',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        title.x = 10;
        title.y = 10;
        tooltip.addChild(title);

        // Risk score
        const riskText = new PIXI.Text(
            `Risk Score: ${security.risk_score.toFixed(1)}/100`,
            {
                fontFamily: 'Arial',
                fontSize: 12,
                fill: this.getRiskColor(security.risk_score)
            }
        );
        riskText.x = 10;
        riskText.y = 35;
        tooltip.addChild(riskText);

        // Vulnerability breakdown
        let vulnY = 55;
        const vulnData = [
            { label: 'Critical', count: security.critical_vulns, color: 0xFF0000 },
            { label: 'High', count: security.high_vulns, color: 0xFF8800 },
            { label: 'Medium', count: security.medium_vulns, color: 0xFFFF00 },
            { label: 'Low', count: security.low_vulns, color: 0x00FF00 }
        ];

        vulnData.forEach(vuln => {
            if (vuln.count > 0) {
                const text = new PIXI.Text(
                    `${vuln.label}: ${vuln.count}`,
                    {
                        fontFamily: 'Arial',
                        fontSize: 11,
                        fill: vuln.color
                    }
                );
                text.x = 10;
                text.y = vulnY;
                tooltip.addChild(text);
                vulnY += 15;
            }
        });

        // Driver info
        const driverText = new PIXI.Text(
            `Vulnerable Drivers: ${security.vulnerable_drivers}/${security.total_drivers}`,
            {
                fontFamily: 'Arial',
                fontSize: 11,
                fill: 0xFFFFFF
            }
        );
        driverText.x = 10;
        driverText.y = vulnY + 5;
        tooltip.addChild(driverText);

        // Top vulnerabilities
        if (security.top_vulnerabilities && security.top_vulnerabilities.length > 0) {
            const topTitle = new PIXI.Text('Top Vulnerabilities:', {
                fontFamily: 'Arial',
                fontSize: 10,
                fontWeight: 'bold',
                fill: 0xAAAAAA
            });
            topTitle.x = 10;
            topTitle.y = vulnY + 25;
            tooltip.addChild(topTitle);

            let topY = vulnY + 40;
            security.top_vulnerabilities.slice(0, 3).forEach(vuln => {
                const vulnText = new PIXI.Text(
                    `• ${vuln.cve_ids[0]} (${vuln.max_severity.toFixed(1)})`,
                    {
                        fontFamily: 'Arial',
                        fontSize: 9,
                        fill: 0xFFFFFF,
                        wordWrap: true,
                        wordWrapWidth: 260
                    }
                );
                vulnText.x = 10;
                vulnText.y = topY;
                tooltip.addChild(vulnText);
                topY += 12;
            });
        }

        // Store reference for cleanup
        this.securityTooltip = tooltip;
        this.world.addChild(tooltip);
    }

    hideSecurityTooltip() {
        if (this.securityTooltip) {
            this.world.removeChild(this.securityTooltip);
            this.securityTooltip = null;
        }
    }

    showActivationTooltip(activation, x, y) {
        // Create tooltip container
        const tooltip = new PIXI.Container();
        tooltip.x = x * this.config.gridSize + this.config.gridSize + 10;
        tooltip.y = y * this.config.gridSize;
        tooltip.zIndex = 200;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.9);
        bg.lineStyle(2, 0x00AAFF, 1);
        bg.drawRoundedRect(0, 0, 200, 80, 8);
        bg.endFill();
        tooltip.addChild(bg);

        // Title
        const title = new PIXI.Text('🧠 Neural Activation', {
            fontFamily: 'Arial',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        title.x = 10;
        title.y = 8;
        tooltip.addChild(title);

        // Token
        const tokenText = new PIXI.Text(
            `Token: "${activation.token}"`,
            {
                fontFamily: 'Arial',
                fontSize: 11,
                fill: 0xFFFFFF
            }
        );
        tokenText.x = 10;
        tokenText.y = 28;
        tooltip.addChild(tokenText);

        // Layer and intensity
        const infoText = new PIXI.Text(
            `Layer: ${activation.layer} | Intensity: ${(activation.intensity * 100).toFixed(0)}%`,
            {
                fontFamily: 'Arial',
                fontSize: 10,
                fill: 0xAAAAAA
            }
        );
        infoText.x = 10;
        infoText.y = 50;
        tooltip.addChild(infoText);

        // Store reference for cleanup
        this.activationTooltip = tooltip;
        this.world.addChild(tooltip);
    }

    hideActivationTooltip() {
        if (this.activationTooltip) {
            this.world.removeChild(this.activationTooltip);
            this.activationTooltip = null;
        }
    }

    async loadTile(x, y, brickName, timestamp) {
        // Construct the correct URL relative to the web root
        const cacheBuster = `?t=${timestamp}`;
        let tileUrl = `/builder/queue/${brickName}${cacheBuster}`;

        console.log(`📥 Loading Tile: ${brickName} at (${x}, ${y})`);

        // Asynchronously load texture using the adapter
        let texture = await window.PixiJSV8Adapter.loadTexture(tileUrl);

        // If loading from queue failed (got error texture), try processed
        if (texture === window.PixiJSV8Adapter.errorTexture) {
            console.log(`⚠️  Queue tile failed, trying processed: ${brickName}`);
            tileUrl = `/builder/processed/${brickName}${cacheBuster}`;
            texture = await window.PixiJSV8Adapter.loadTexture(tileUrl);
        }

        // If sprite already exists, just swap texture
        if (this.tiles.has(`${x},${y}`)) {
            const tile = this.tiles.get(`${x},${y}`);
            tile.sprite.texture = texture;
            tile.timestamp = timestamp;
            return;
        }

        // Create new sprite using the adapter
        const sprite = window.PixiJSV8Adapter.createSprite(texture);

        // Align to grid
        sprite.x = x * this.config.gridSize;
        sprite.y = y * this.config.gridSize;

        // Size it to the grid cell
        sprite.width = this.config.gridSize;
        sprite.height = this.config.gridSize;

        // Aesthetic: Darker base for map tiles so apps pop
        sprite.alpha = 0.8;
        sprite.zIndex = -100; // Background layer

        // Check if this is an LLM tile and add click handler
        if (this.isLLMTile(brickName)) {
            this.addLLMClickHandler(sprite, brickName, x, y);
            this.llmTiles.add(`${x},${y}`);
            console.log(`💬 LLM tile detected: ${brickName} at (${x}, ${y})`);

            // Attach heatmap overlay to LLM tile
            this.attachHeatmapToTile(sprite, brickName);
        }

        // Add to world
        this.world.addChild(sprite);
        this.tiles.set(`${x},${y}`, { sprite, timestamp, brickName });
    }

    // New method to hide the loading indicator
    hideLoadingIndicator() {
        console.log('✅ Hiding loading overlay, tiles loaded:', this.tiles.size);
        const loadingIndicator = document.getElementById('loading-overlay');
        if (loadingIndicator) {
            loadingIndicator.style.display = 'none';
        }
    }

    /**
     * Check if a tile is an LLM tile
     */
    isLLMTile(brickName) {
        const llmPatterns = ['tinyllama', 'qwen_coder', 'llama', 'mistral', 'gemma', 'phi'];
        return llmPatterns.some(pattern => brickName.toLowerCase().includes(pattern));
    }

    /**
     * Add click handler for LLM tiles
     */
    addLLMClickHandler(sprite, brickName, x, y) {
        // Make the sprite interactive
        sprite.interactive = true;
        sprite.cursor = 'pointer';

        // Add hover effect
        sprite.on('pointerover', () => {
            sprite.alpha = 1.0;
            sprite.tint = 0x00FFFF; // Cyan tint on hover
        });

        sprite.on('pointerout', () => {
            sprite.alpha = 0.8;
            sprite.tint = 0xFFFFFF; // Reset tint
        });

        // Add click handler to open chat panel
        sprite.on('pointerdown', () => {
            this.handleLLMClick(brickName, x, y);
        });
    }

    /**
     * Handle click on LLM tile
     */
    handleLLMClick(brickName, x, y) {
        console.log(`💬 LLM tile clicked: ${brickName} at (${x}, ${y})`);

        if (this.chatPanel) {
            this.chatPanel.open(brickName, x, y);
        } else {
            console.warn('⚠️  Chat panel not initialized');
        }
    }

    /**
     * Get all LLM tiles
     */
    getLLMTiles() {
        const llmTiles = [];
        for (const [key, tile] of this.tiles.entries()) {
            if (tile.brickName && this.isLLMTile(tile.brickName)) {
                const [x, y] = key.split(',').map(Number);
                llmTiles.push({
                    x,
                    y,
                    name: tile.brickName
                });
            }
        }
        return llmTiles;
    }

    // ============================================================
    // NEURAL HEATMAP OVERLAY INTEGRATION
    // ============================================================

    /**
     * Initialize the NeuralHeatmapOverlay system
     */
    initializeHeatmapOverlay() {
        if (typeof NeuralHeatmapOverlay === 'undefined') {
            console.warn('⚠️  NeuralHeatmapOverlay not loaded, heatmap features disabled');
            return;
        }

        this.heatmapOverlay = new NeuralHeatmapOverlay({
            container: this.tileContainer,
            map: this,
            gridSize: this.config.gridSize,
            mode: 'thermal',
            decayRate: 0.98,
            visible: false // Start disabled
        });

        // Connect to inference events if available
        if (typeof inferenceEvents !== 'undefined') {
            inferenceEvents.on('inference:start', (data) => {
                if (this.heatmapOverlay) {
                    this.heatmapOverlay.onInferenceStart(data);
                }
            });

            inferenceEvents.on('inference:complete', (data) => {
                if (this.heatmapOverlay) {
                    this.heatmapOverlay.onInferenceComplete(data);
                }
            });

            inferenceEvents.on('inference:layer', (data) => {
                if (this.heatmapOverlay) {
                    const tracker = this.heatmapOverlay.activityTracker;
                    if (tracker) {
                        tracker.recordActivity(data.position.x, data.position.y, data.intensity);
                    }
                }
            });

            console.log('🔗 Connected heatmap to inference events');
        }

        // Start LM Studio inference tracking (Phase 1: Task 1.3)
        if (typeof LLMInferenceTracker !== 'undefined') {
            this.inferenceTracker = new LLMInferenceTracker({
                simulationInterval: 50,
                enableSimulation: true
            });
            this.inferenceTracker.startIntercepting();

            // Connect tracker events to heatmap
            this.inferenceTracker.on('inference:layer', (data) => {
                if (this.heatmapOverlay && this.heatmapOverlay.activityTracker) {
                    const tracker = this.heatmapOverlay.activityTracker;
                    tracker.recordActivity(data.position.x, data.position.y, data.intensity);
                }
            });

            console.log('🔌 LM Studio inference tracker started');
        }

        // Start automatic updates
        this.heatmapOverlay.start();

        console.log('🧠 Neural Heatmap Overlay initialized');
    }

    /**
     * Setup heatmap controls UI and keyboard shortcuts
     */
    setupHeatmapControls() {
        if (!this.heatmapOverlay) return;

        // Add keyboard shortcuts for heatmap control
        const heatmapShortcuts = (event) => {
            // Ignore if typing in an input field
            if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
                return;
            }

            switch (event.code) {
                case 'KeyH':
                    event.preventDefault();
                    this.toggleHeatmap();
                    break;
                case 'KeyM':
                    event.preventDefault();
                    this.cycleHeatmapMode();
                    break;
                case 'KeyP':
                    event.preventDefault();
                    this.togglePlayback();
                    break;
            }
        };

        // Add to existing keyboard handler
        window.addEventListener('keydown', heatmapShortcuts);

        // Store for cleanup
        this._heatmapKeyHandler = heatmapShortcuts;

        // Create UI controls panel
        this.createHeatmapUI();

        console.log('🎮 Heatmap controls: H (toggle), M (cycle mode), P (playback)');
    }

    /**
     * Create heatmap UI controls panel
     */
    createHeatmapUI() {
        if (!this.heatmapOverlay) return;

        const container = new PIXI.Container();
        container.x = 20;
        container.y = 220; // Below CPU controls
        container.zIndex = 1000;
        container.visible = false; // Hidden by default

        // Background panel
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0xFF6600, 1);
        bg.drawRoundedRect(0, 0, 280, 140, 8);
        bg.endFill();
        container.addChild(bg);

        // Title
        const title = new PIXI.Text('🧠 Neural Heatmap', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0xFF6600
        });
        title.x = 15;
        title.y = 10;
        container.addChild(title);

        // Status text
        this.heatmapStatusText = new PIXI.Text('Status: Hidden', {
            fontFamily: 'Monaco, monospace',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        this.heatmapStatusText.x = 15;
        this.heatmapStatusText.y = 35;
        container.addChild(this.heatmapStatusText);

        // Mode text
        this.heatmapModeText = new PIXI.Text('Mode: Thermal', {
            fontFamily: 'Monaco, monospace',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        this.heatmapModeText.x = 15;
        this.heatmapModeText.y = 55;
        container.addChild(this.heatmapModeText);

        // Activity stats
        this.heatmapStatsText = new PIXI.Text('Active Tiles: 0', {
            fontFamily: 'Monaco, monospace',
            fontSize: 10,
            fill: 0x888888
        });
        this.heatmapStatsText.x = 15;
        this.heatmapStatsText.y = 75;
        container.addChild(this.heatmapStatsText);

        // Instructions
        const instructions = new PIXI.Text('Keyboard:\nH: Toggle Heatmap\nM: Cycle Mode', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fill: 0xCCCCCC,
            lineHeight: 14
        });
        instructions.x = 15;
        instructions.y = 95;
        container.addChild(instructions);

        // Toggle button
        const toggleButton = this.createButton('Toggle', 0xFF6600, () => {
            this.toggleHeatmap();
        });
        toggleButton.x = 180;
        toggleButton.y = 35;
        container.addChild(toggleButton);

        // Cycle mode button
        const modeButton = this.createButton('Cycle Mode', 0x00AAFF, () => {
            this.cycleHeatmapMode();
        });
        modeButton.x = 180;
        modeButton.y = 70;
        container.addChild(modeButton);

        // Add to world
        this.world.addChild(container);
        this.heatmapControls = container;

        // Start stats update loop
        this.startHeatmapStatsUpdate();
    }

    /**
     * Start heatmap statistics update loop
     */
    startHeatmapStatsUpdate() {
        if (!this.heatmapOverlay) return;

        setInterval(() => {
            if (!this.heatmapControls) return;

            const stats = this.heatmapOverlay.getStats();
            const isVisible = this.heatmapOverlay.overlayContainer.visible;

            // Update status text
            this.heatmapStatusText.text = `Status: ${isVisible ? 'Visible' : 'Hidden'}`;
            this.heatmapStatusText.style.fill = isVisible ? 0x00FF00 : 0xAAAAAA;

            // Update mode text
            const modeName = this.heatmapOverlay.getMode().charAt(0).toUpperCase() +
                this.heatmapOverlay.getMode().slice(1);
            this.heatmapModeText.text = `Mode: ${modeName}`;

            // Update stats
            this.heatmapStatsText.text = `Active Tiles: ${stats.activeTiles}`;

            // Show/hide controls panel based on visibility
            this.heatmapControls.visible = isVisible;
        }, 500);
    }

    /**
     * Toggle heatmap visibility
     */
    toggleHeatmap() {
        if (!this.heatmapOverlay) {
            console.warn('⚠️  Heatmap overlay not initialized');
            return;
        }

        this.heatmapOverlay.toggle();
        const visible = this.heatmapOverlay.overlayContainer.visible;
        console.log(`🧠 Heatmap ${visible ? 'enabled' : 'disabled'}`);
    }

    /**
     * Cycle through heatmap visualization modes
     */
    cycleHeatmapMode() {
        if (!this.heatmapOverlay) {
            console.warn('⚠️  Heatmap overlay not initialized');
            return;
        }

        this.heatmapOverlay.cycleMode();
    }

    /**
     * Toggle playback controls
     */
    togglePlayback() {
        if (!this.heatmapOverlay?.playbackControls) {
            console.warn('⚠️  Playback controls not available');
            return;
        }

        this.heatmapOverlay.playbackControls.togglePlay();
        console.log('⏯️  Playback toggled');
    }

    /**
     * Attach heatmap to a specific LLM tile
     * @param {PIXI.Sprite} sprite - Tile sprite
     * @param {string} brickName - Name of the brick/LLM
     */
    attachHeatmapToTile(sprite, brickName) {
        if (!this.heatmapOverlay) return;

        const key = `${sprite.x / this.config.gridSize},${sprite.y / this.config.gridSize}`;

        // Track this tile for heatmap updates
        this.llmTiles.add(key);

        console.log(`🧠 Heatmap attached to tile: ${brickName} at ${key}`);
    }

    /**
     * Record an LLM inference event for heatmap visualization
     * @param {Object} event - Inference event data
     */
    recordLLMInference(event) {
        if (!this.heatmapOverlay) return;

        this.heatmapOverlay.recordInference({
            tileKey: event.tileKey,
            x: event.x || 0,
            y: event.y || 0,
            intensity: event.intensity || 1.0,
            layer: event.layer || 'unknown'
        });
    }


    stop() {
        this.active = false;
        this.hideSecurityTooltip();
        this.hideActivationTooltip();

        // Phase 43: Close WebSocket connection
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }
    }

    // Phase 43: Connect to Rust compositor WebSocket for camera sync
    connectToCompositor() {
        console.log('🔌 Connecting to compositor WebSocket:', this.config.websocketUrl);

        try {
            this.ws = new WebSocket(this.config.websocketUrl);

            this.ws.onopen = () => {
                console.log('✅ Connected to compositor WebSocket');
                this.wsReconnectAttempts = 0;
            };

            this.ws.onmessage = (event) => {
                try {
                    const msg = JSON.parse(event.data);
                    this.handleCompositorMessage(msg);
                } catch (e) {
                    console.warn('⚠️  Failed to parse compositor message:', e);
                }
            };

            this.ws.onerror = (error) => {
                console.error('❌ WebSocket error:', error);
            };

            this.ws.onclose = () => {
                console.log('🔌 Disconnected from compositor WebSocket');

                // Attempt to reconnect
                if (this.active && this.wsReconnectAttempts < this.maxReconnectAttempts) {
                    this.wsReconnectAttempts++;
                    const delay = Math.min(1000 * Math.pow(2, this.wsReconnectAttempts), 30000);
                    console.log(`🔄 Reconnecting in ${delay}ms... (attempt ${this.wsReconnectAttempts}/${this.maxReconnectAttempts})`);

                    setTimeout(() => {
                        this.connectToCompositor();
                    }, delay);
                }
            };
        } catch (e) {
            console.error('❌ Failed to create WebSocket connection:', e);
        }
    }

    // Phase 43: Handle messages from Rust compositor
    handleCompositorMessage(msg) {
        switch (msg.type) {
            case 'camera_update':
                this.handleCameraUpdate(msg);
                break;
            case 'tile_update':
                this.handleTileUpdate(msg);
                break;
            case 'cognitive_update':
                this.handleCognitiveUpdate(msg);
                break;
            case 'activation':
                this.handleActivation(msg.data);
                break;
            case 'heartbeat':
                // Respond to heartbeat
                if (this.ws && this.ws.readyState === WebSocket.OPEN) {
                    this.ws.send(JSON.stringify({ type: 'heartbeat', timestamp: Date.now() }));
                }
                break;
            default:
                console.debug('Unknown message type:', msg.type);
        }
    }

    // Phase 43: Handle camera update from compositor
    handleCameraUpdate(msg) {
        // Smoothly interpolate to target camera position
        const targetX = msg.x;
        const targetY = msg.y;
        const targetZoom = msg.zoom;

        // If viewport is available, sync it
        if (this.world.parent && this.world.parent.viewport) {
            const viewport = this.world.parent.viewport;

            // Smoothly move to target position
            viewport.moveCenter(targetX, targetY);

            // Smoothly zoom to target level
            viewport.setZoom(targetZoom);
        }

        console.debug(`📷 Camera sync: (${targetX.toFixed(1)}, ${targetY.toFixed(1)}) zoom: ${targetZoom.toFixed(2)}`);
    }

    // Phase 44: Handle Cognitive Territory Updates
    handleCognitiveUpdate(msg) {
        const state = msg.data;
        if (!state) return;

        // 1. Ensure the Spire Container exists
        if (!this.cognitiveSpire) {
            this.cognitiveSpire = new PIXI.Container();
            this.cognitiveSpire.zIndex = 500; // Above most things
            this.world.addChild(this.cognitiveSpire);

            // Create the Base Structure
            const base = new PIXI.Graphics();
            base.lineStyle(20, 0x00FFFF, 0.3); // Outer Ring
            base.drawCircle(0, 0, state.radius || 1024);

            base.lineStyle(4, 0x00FFFF, 0.8); // Inner Ring
            base.beginFill(0x003333, 0.3);
            base.drawCircle(0, 0, 256);
            base.endFill();

            // The Central Spire Code
            const spireText = new PIXI.Text('ANTIGRAVITY PRIME', {
                fontFamily: 'Courier New',
                fontSize: 64,
                fontWeight: 'bold',
                fill: 0x00FFFF,
                align: 'center'
            });
            spireText.anchor.set(0.5);
            spireText.y = -300;
            base.addChild(spireText);

            this.cognitiveSpire.addChild(base);

            // Position: Convert grid units to pixel units
            // Rust sends raw coords, visual shell uses grid scale
            this.cognitiveSpire.x = state.center.x * this.config.gridSize;
            this.cognitiveSpire.y = state.center.y * this.config.gridSize;

            console.log("🏰 Cognitive Spire Constructed at Antigravity Prime:", state.center);
        }

        // 2. Pulse effect
        if (state.particle_count !== undefined) {
            // Visual heartbeat of the AI
            this.cognitiveSpire.alpha = 0.8 + Math.sin(Date.now() / 500) * 0.2;
        }
    }

    // Phase 43: Handle tile update from compositor
    handleTileUpdate(msg) {
        const { x, y, brick, timestamp } = msg;

        // Update tile immediately (bypass manifest polling)
        this.loadTile(x, y, brick, timestamp);

        console.log(`📥 Tile update from compositor: ${brick} at (${x}, ${y})`);
    }

    // Handle neural activation flashes
    handleActivation(activation) {
        const { x, y, intensity, layer, token } = activation;
        const key = `${x},${y}`;

        // Remove existing flash if present
        const existing = this.activationFlashes.get(key);
        if (existing && existing.flash) {
            this.world.removeChild(existing.flash);
        }

        // Create activation flash
        const flash = new PIXI.Graphics();

        // Color based on layer (different layers different colors)
        const colors = [0x00FF00, 0x0000FF, 0xFF0000, 0xFFFF00, 0xFF00FF, 0x00FFFF];
        const color = colors[layer % colors.length] || 0xFFFFFF;

        // Size based on intensity
        const size = Math.max(5, Math.min(20, intensity * 15));

        flash.beginFill(color, intensity * 0.8);
        flash.drawCircle(0, 0, size);
        flash.endFill();

        // Position on grid
        flash.x = x * this.config.gridSize + this.config.gridSize / 2;
        flash.y = y * this.config.gridSize + this.config.gridSize / 2;

        // Add glow effect
        flash.filters = [new PIXI.filters.GlowFilter({
            distance: 10,
            outerStrength: 2,
            innerStrength: 1,
            color: color,
            quality: 0.5
        })];

        // Make interactive for tooltips
        flash.interactive = true;
        flash.cursor = 'pointer';
        flash.on('pointerover', () => this.showActivationTooltip(activation, x, y));
        flash.on('pointerout', () => this.hideActivationTooltip());

        // Add to world with high z-index
        flash.zIndex = 150;
        this.world.addChild(flash);

        // Store flash with timestamp
        this.activationFlashes.set(key, {
            flash,
            timestamp: Date.now(),
            token
        });

        // Auto-remove after 2 seconds
        setTimeout(() => {
            if (this.activationFlashes.get(key)) {
                this.world.removeChild(flash);
                this.activationFlashes.delete(key);
            }
        }, 2000);

        console.log(`🧠 Activation flash: "${token}" at (${x}, ${y}) layer ${layer}`);
    }

    // Phase 6: Start ticker loop for CPU execution
    startTicker() {
        if (this.ticker) {
            return; // Already running
        }

        // Create a ticker that runs at 60 FPS
        this.ticker = new PIXI.Ticker();
        this.ticker.maxFPS = 60;
        this.ticker.add(() => this.onTick());
        this.ticker.start();

        console.log('⏱️  InfiniteMap ticker started (60 FPS)');
    }

    // Phase 6: Stop ticker loop
    stopTicker() {
        if (this.ticker) {
            this.ticker.stop();
            this.ticker.destroy();
            this.ticker = null;
            console.log('⏱️  InfiniteMap ticker stopped');
        }
    }

    // Phase 6: Ticker callback - executes CPU each frame
    onTick() {
        // Execute CPU frame if Pixel CPU is initialized
        if (this.pixelCPU) {
            this.pixelCPU.executeFrame();

            // Learning System: Record Performance
            if (this.performanceMonitor) {
                const stats = this.pixelCPU.getPerformanceStats();
                // Estimate instructions as 1 per cycle for now (simplified)
                const instructions = this.pixelCPU.config.cyclesPerFrame;

                this.performanceMonitor.recordFrame(
                    stats.lastExecutionTime,
                    instructions,
                    this.pixelCPU.config.cyclesPerFrame
                );

                this.performanceMonitor.updateDisplay();
            }
        }
    }

    // Phase 6: Load a brick file into the Pixel CPU
    async loadBrick(brickName) {
        if (!this.pixelCPU) {
            console.error('❌ Pixel CPU not initialized');
            throw new Error('Pixel CPU not initialized');
        }

        try {
            console.log(`📦 Loading brick: ${brickName}`);
            await this.pixelCPU.loadBrick(brickName);

            // Start ticker if not already running
            if (!this.ticker) {
                this.startTicker();
            }

            console.log(`✓ Brick loaded and execution started: ${brickName}`);
        } catch (error) {
            console.error(`Failed to load brick:`, error);
            throw error;
        }
    }

    // Phase 6: Pause CPU execution
    pauseCPU() {
        if (this.pixelCPU) {
            this.pixelCPU.pause();
        } else {
            console.warn('⚠️  Pixel CPU not initialized');
        }
    }

    // Phase 6: Resume CPU execution
    resumeCPU() {
        if (this.pixelCPU) {
            this.pixelCPU.resume();
        } else {
            console.warn('⚠️  Pixel CPU not initialized');
        }
    }

    // Phase 6: Reset CPU
    resetCPU() {
        if (this.pixelCPU) {
            this.pixelCPU.reset();
        } else {
            console.warn('⚠️  Pixel CPU not initialized');
        }
    }

    // Phase 6: Get CPU state
    getCPUState() {
        if (this.pixelCPU) {
            return this.pixelCPU.getState();
        }
        return null;
    }

    // Phase 6: Setup keyboard shortcuts
    setupKeyboardShortcuts() {
        window.addEventListener('keydown', (event) => {
            // Ignore if typing in an input field
            if (event.target.tagName === 'INPUT' || event.target.tagName === 'TEXTAREA') {
                return;
            }

            switch (event.code) {
                case 'Space':
                    event.preventDefault();
                    this.toggleCPUPause();
                    break;
                case 'KeyR':
                    event.preventDefault();
                    this.resetCPU();
                    break;
                case 'KeyL':
                    event.preventDefault();
                    this.openBrickFileDialog();
                    break;
                default:
                    break;
            }
        });

        console.log('⌨️  Keyboard shortcuts enabled: Space (pause/resume), R (reset), L (load brick), H (toggle heatmap), M (cycle heatmap mode)');
    }

    // Phase 6: Toggle CPU pause/resume
    toggleCPUPause() {
        if (!this.pixelCPU) {
            console.warn('⚠️  Pixel CPU not initialized');
            return;
        }

        const state = this.pixelCPU.getState();
        if (state.paused) {
            this.resumeCPU();
        } else {
            this.pauseCPU();
        }
    }

    // Phase 6: Open brick file dialog
    openBrickFileDialog() {
        // Create file input element
        const fileInput = document.createElement('input');
        fileInput.type = 'file';
        fileInput.accept = '.brick';
        fileInput.style.display = 'none';

        fileInput.addEventListener('change', async (event) => {
            const file = event.target.files[0];
            if (file) {
                try {
                    // Read file content
                    const arrayBuffer = await file.arrayBuffer();
                    const uint8Array = new Uint8Array(arrayBuffer);

                    // Create blob URL for loading
                    const blob = new Blob([uint8Array], { type: 'application/octet-stream' });
                    const url = URL.createObjectURL(blob);

                    // Load brick using the CPU integration
                    await this.pixelCPU.loadBrick(url);

                    // Clean up
                    URL.revokeObjectURL(url);

                    console.log(`✓ Brick loaded from file: ${file.name}`);
                } catch (error) {
                    console.error('Failed to load brick from file:', error);
                }
            }

            // Remove input element
            document.body.removeChild(fileInput);
        });

        // Add to DOM and trigger click
        document.body.appendChild(fileInput);
        fileInput.click();
    }

    // Phase 6: Create UI controls for brick loading
    createCPUControls() {
        const container = new PIXI.Container();
        container.x = 20;
        container.y = 20;
        container.zIndex = 1000;

        // Background panel
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0x00AAFF, 1);
        bg.drawRoundedRect(0, 0, 320, 180, 8);
        bg.endFill();
        container.addChild(bg);

        // Title
        const title = new PIXI.Text('🖥️  Pixel CPU Controls', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 16,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        title.x = 15;
        title.y = 10;
        container.addChild(title);

        // Status text
        this.cpuStatusText = new PIXI.Text('Status: Idle', {
            fontFamily: 'Monaco, monospace',
            fontSize: 12,
            fill: 0x00FF00
        });
        this.cpuStatusText.x = 15;
        this.cpuStatusText.y = 40;
        container.addChild(this.cpuStatusText);

        // Performance text
        this.cpuPerfText = new PIXI.Text('Exec: 0.00ms | FB: 0.00ms', {
            fontFamily: 'Monaco, monospace',
            fontSize: 11,
            fill: 0xAAAAAA
        });
        this.cpuPerfText.x = 15;
        this.cpuPerfText.y = 60;
        container.addChild(this.cpuPerfText);

        // Instructions
        const instructions = new PIXI.Text('Keyboard Shortcuts:\nSpace: Pause/Resume\nR: Reset\nL: Load Brick File', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fill: 0xCCCCCC,
            lineHeight: 16
        });
        instructions.x = 15;
        instructions.y = 85;
        container.addChild(instructions);

        // Load brick button
        const loadButton = this.createButton('Load Brick', 0x00AAFF, () => {
            this.openBrickFileDialog();
        });
        loadButton.x = 15;
        loadButton.y = 145;
        container.addChild(loadButton);

        // Add to world
        this.world.addChild(container);
        this.cpuControls = container;

        // Start status update loop
        this.startCPUStatusUpdate();

        console.log('🎮 CPU controls created');
    }

    // Phase 6: Create a button
    createButton(text, color, onClick) {
        const container = new PIXI.Container();
        container.interactive = true;
        container.cursor = 'pointer';

        // Button background
        const bg = new PIXI.Graphics();
        bg.beginFill(color, 0.8);
        bg.lineStyle(1, 0xFFFFFF, 0.5);
        bg.drawRoundedRect(0, 0, 120, 28, 4);
        bg.endFill();
        container.addChild(bg);

        // Button text
        const label = new PIXI.Text(text, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFFFFFF
        });
        label.anchor.set(0.5);
        label.x = 60;
        label.y = 14;
        container.addChild(label);

        // Hover effect
        container.on('pointerover', () => {
            bg.alpha = 1.0;
        });

        container.on('pointerout', () => {
            bg.alpha = 0.8;
        });

        // Click handler
        container.on('pointerdown', onClick);

        return container;
    }

    // Phase 6: Start CPU status update loop
    startCPUStatusUpdate() {
        setInterval(() => {
            if (!this.pixelCPU) {
                return;
            }

            const state = this.pixelCPU.getState();
            const perf = this.pixelCPU.getPerformanceStats();

            // Update status text
            let status = 'Idle';
            let color = 0xAAAAAA;

            if (state.running) {
                if (state.paused) {
                    status = 'Paused';
                    color = 0xFFFF00;
                } else {
                    status = 'Running';
                    color = 0x00FF00;
                }
            }

            this.cpuStatusText.text = `Status: ${status}`;
            this.cpuStatusText.style.fill = color;

            // Update performance text
            this.cpuPerfText.text = `Exec: ${perf.lastExecutionTime.toFixed(2)}ms | FB: ${perf.lastFramebufferUpdateTime.toFixed(2)}ms`;
        }, 500); // Update every 500ms
    }

    // Phase 6: Setup drag-drop for brick files
    // Phase 31: Extended to handle .py files for Python transmutation
    setupDragDrop() {
        const dropZone = document.getElementById('app-container');

        if (!dropZone) {
            console.warn('⚠️  Drop zone not found');
            return;
        }

        // Prevent default drag behaviors
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropZone.addEventListener(eventName, (event) => {
                event.preventDefault();
                event.stopPropagation();
            });
        });

        // Highlight drop zone on drag over
        dropZone.addEventListener('dragenter', () => {
            dropZone.style.border = '3px dashed #00AAFF';
        });

        dropZone.addEventListener('dragleave', () => {
            dropZone.style.border = 'none';
        });

        // Handle file drop
        dropZone.addEventListener('drop', async (event) => {
            dropZone.style.border = 'none';

            const files = event.dataTransfer.files;
            if (files.length === 0) {
                return;
            }

            const file = files[0];

            // Handle Python files (Phase 31: Python Transmutation)
            if (file.name.endsWith('.py')) {
                await this.handlePythonDrop(file, event);
                return;
            }

            // Handle brick files (original functionality)
            if (file.name.endsWith('.brick')) {
                await this.handleBrickDrop(file);
                return;
            }

            console.warn('⚠️  Unsupported file type:', file.name);
            console.warn('    Supported: .py (Python), .brick (RISC-V binary)');
        });

        console.log('📥 Drag-drop enabled: .py (Python), .brick (RISC-V)');
    }

    /**
     * Handle Python file drop for transmutation (Phase 31).
     * @param {File} file - Python file that was dropped
     * @param {DragEvent} event - Drop event for position data
     */
    async handlePythonDrop(file, event) {
        if (!this.pythonLoader) {
            console.error('❌ Python Transmutation Loader not available');
            console.warn('   Ensure python_loader.js is loaded before infinite_map.js');
            return;
        }

        try {
            // Get drop position for tile placement
            const position = {
                x: event.clientX,
                y: event.clientY
            };

            // Handle Python transmutation
            await this.pythonLoader.handleDrop(file, position);

        } catch (error) {
            console.error(`❌ Failed to handle Python drop: ${file.name}`, error);
        }
    }

    /**
     * Handle brick file drop (original functionality).
     * @param {File} file - Brick file that was dropped
     */
    async handleBrickDrop(file) {
        try {
            console.log(`📦 Loading brick from drag-drop: ${file.name}`);

            // Read file content
            const arrayBuffer = await file.arrayBuffer();
            const uint8Array = new Uint8Array(arrayBuffer);

            // Create blob URL for loading
            const blob = new Blob([uint8Array], { type: 'application/octet-stream' });
            const url = URL.createObjectURL(blob);

            // Load brick using the CPU integration
            await this.pixelCPU.loadBrick(url);

            // Clean up
            URL.revokeObjectURL(url);

            console.log(`✓ Brick loaded from drag-drop: ${file.name}`);
        } catch (error) {
            console.error('Failed to load brick from drag-drop:', error);
        }
    }

    stop() {
        this.active = false;
        this.hideSecurityTooltip();
        this.hideActivationTooltip();

        // Phase 43: Close WebSocket connection
        if (this.ws) {
            this.ws.close();
            this.ws = null;
        }

        // Phase 6: Stop ticker
        this.stopTicker();

        // Neural Heatmap Overlay cleanup
        if (this.heatmapOverlay) {
            this.heatmapOverlay.destroy();
            this.heatmapOverlay = null;
        }

        // Cleanup heatmap keyboard handler
        if (this._heatmapKeyHandler) {
            window.removeEventListener('keydown', this._heatmapKeyHandler);
            this._heatmapKeyHandler = null;
        }
    }

    // --- AUTO-GENERATED METHODS START ---

    // ============================================================
    // SPATIAL ARCHITECT API - LLM World Building
    // ============================================================

    /**
     * Write a tile to the infinite map - Core API for LLM world building
     * @param {number} x - Grid X coordinate
     * @param {number} y - Grid Y coordinate
     * @param {string} type - Structure type: 'tower', 'bridge', 'vault', 'garden', 'crystal', 'scaffold'
     * @param {Object} metadata - Structure metadata
     * @param {string} metadata.name - Structure name (e.g., "AuthService")
     * @param {string} metadata.description - Description of what this represents
     * @param {number} metadata.height - Height in stories (affects visual scale)
     * @param {string} metadata.codeReference - Path to source code file
     * @param {number} metadata.complexity - 0-1 complexity score (affects tower height)
     * @param {string} metadata.status - 'building', 'complete', 'deprecated', 'error'
     * @param {Object} metadata.customData - Any additional data
     * @returns {Object} {success: boolean, tileId: string, message: string}
     */
    writeTile(x, y, type, metadata = {}) {
        const key = `${x},${y}`;

        // Validation
        if (!this.validateCoordinates(x, y)) {
            return { success: false, tileId: null, message: `Invalid coordinates: (${x}, ${y})` };
        }

        if (!this.validateStructureType(type)) {
            return { success: false, tileId: null, message: `Invalid structure type: ${type}` };
        }

        // Check for protected tiles (system tiles that shouldn't be overwritten)
        if (this.isProtectedTile(x, y)) {
            return { success: false, tileId: null, message: `Cannot build on protected tile at (${x}, ${y})` };
        }

        // Remove existing tile at this position if any
        if (this.tiles.has(key)) {
            this.removeTile(x, y);
        }

        try {
            // Generate unique tile ID
            const tileId = `llm_${type}_${x}_${y}_${Date.now()}`;

            // Create the structure based on type
            const structure = this.createStructure(x, y, type, metadata);

            // Add to world
            this.world.addChild(structure.container);

            // Store tile data
            const tileData = {
                id: tileId,
                x,
                y,
                type,
                metadata: { ...metadata, createdAt: Date.now() },
                sprite: structure.container,
                timestamp: Date.now(),
                isLLMBuild: true
            };

            this.tiles.set(key, tileData);

            // Add entrance animation
            this.animateStructureEntrance(structure.container);

            console.log(`🏗️  LLM Build: ${type} "${metadata.name || 'unnamed'}" at (${x}, ${y})`);

            return {
                success: true,
                tileId,
                message: `Successfully created ${type} at (${x}, ${y})`
            };

        } catch (error) {
            console.error(`❌ Failed to write tile at (${x}, ${y}):`, error);
            return { success: false, tileId: null, message: error.message };
        }
    }

    /**
     * Remove a tile from the map
     * @param {number} x - Grid X coordinate
     * @param {number} y - Grid Y coordinate
     * @returns {boolean} Success
     */
    removeTile(x, y) {
        const key = `${x},${y}`;
        const tile = this.tiles.get(key);

        if (!tile) {
            return false;
        }

        // Animate removal
        this.animateStructureRemoval(tile.sprite, () => {
            this.world.removeChild(tile.sprite);
        });

        this.tiles.delete(key);
        console.log(`🗑️  Removed tile at (${x}, ${y})`);
        return true;
    }

    /**
     * Get tile information at coordinates
     * @param {number} x - Grid X coordinate
     * @param {number} y - Grid Y coordinate
     * @returns {Object|null} Tile data or null
     */
    getTile(x, y) {
        const key = `${x},${y}`;
        return this.tiles.get(key) || null;
    }

    /**
     * Render a BuildManifest - Batch creation of structures
     * @param {Object} manifest - Build manifest from LLM
     * @param {Array} manifest.structures - Array of structure definitions
     * @param {boolean} manifest.clearExisting - Whether to clear existing LLM builds first
     * @returns {Object} {success: boolean, built: number, failed: number, errors: Array}
     */
    renderBuildManifest(manifest) {
        if (!manifest || !Array.isArray(manifest.structures)) {
            return { success: false, built: 0, failed: 0, errors: ['Invalid manifest format'] };
        }

        // Optionally clear existing LLM builds
        if (manifest.clearExisting) {
            this.clearLLMBuilds();
        }

        const results = {
            success: true,
            built: 0,
            failed: 0,
            errors: [],
            tileIds: []
        };

        // Build each structure with staggered animation
        manifest.structures.forEach((struct, index) => {
            setTimeout(() => {
                const result = this.writeTile(
                    struct.x,
                    struct.y,
                    struct.type,
                    struct.metadata || {}
                );

                if (result.success) {
                    results.built++;
                    results.tileIds.push(result.tileId);
                } else {
                    results.failed++;
                    results.errors.push(`(${struct.x},${struct.y}): ${result.message}`);
                }

                // Log progress
                if (index === manifest.structures.length - 1) {
                    console.log(`📋 BuildManifest complete: ${results.built} built, ${results.failed} failed`);
                }
            }, index * 150); // Stagger by 150ms for visual effect
        });

        return results;
    }

    /**
     * Clear all LLM-built tiles
     * @returns {number} Number of tiles removed
     */
    clearLLMBuilds() {
        let count = 0;
        for (const [key, tile] of this.tiles.entries()) {
            if (tile.isLLMBuild) {
                this.world.removeChild(tile.sprite);
                this.tiles.delete(key);
                count++;
            }
        }
        console.log(`🧹 Cleared ${count} LLM builds`);
        return count;
    }

    /**
     * Get all LLM-built tiles
     * @returns {Array} Array of tile data
     */
    getLLMBuilds() {
        const builds = [];
        for (const tile of this.tiles.values()) {
            if (tile.isLLMBuild) {
                builds.push({
                    id: tile.id,
                    x: tile.x,
                    y: tile.y,
                    type: tile.type,
                    metadata: tile.metadata
                });
            }
        }
        return builds;
    }

    /**
     * Export current LLM builds to a BuildManifest
     * @returns {Object} BuildManifest
     */
    exportBuildManifest() {
        const structures = this.getLLMBuilds().map(tile => ({
            x: tile.x,
            y: tile.y,
            type: tile.type,
            metadata: tile.metadata
        }));

        return {
            version: '1.0',
            exportedAt: new Date().toISOString(),
            structureCount: structures.length,
            structures
        };
    }

    // ============================================================
    // STRUCTURE CREATION - Visual representations of code
    // ============================================================

    /**
     * Create a structure container with appropriate visuals
     * @private
     */
    createStructure(x, y, type, metadata) {
        const container = new PIXI.Container();
        container.x = x * this.config.gridSize;
        container.y = y * this.config.gridSize;
        container.zIndex = 50; // Above background, below overlays

        const colors = this.getStructureColors(type, metadata.status);
        const height = this.calculateStructureHeight(metadata);

        // Create base structure
        const graphics = new PIXI.Graphics();

        switch (type) {
            case 'tower':
                this.drawTower(graphics, colors, height, metadata);
                break;
            case 'bridge':
                this.drawBridge(graphics, colors, metadata);
                break;
            case 'vault':
                this.drawVault(graphics, colors, metadata);
                break;
            case 'garden':
                this.drawGarden(graphics, colors, metadata);
                break;
            case 'crystal':
                this.drawCrystal(graphics, colors, metadata);
                break;
            case 'scaffold':
                this.drawScaffold(graphics, colors, metadata);
                break;
            default:
                this.drawGeneric(graphics, colors, metadata);
        }

        container.addChild(graphics);

        // Add label
        if (metadata.name) {
            const label = this.createStructureLabel(metadata.name, metadata);
            container.addChild(label);
        }

        // Make interactive
        this.makeStructureInteractive(container, x, y, metadata);

        return { container, graphics };
    }

    drawTower(graphics, colors, height, metadata) {
        const baseWidth = this.config.gridSize * 0.7;
        const topWidth = baseWidth * 0.5;
        const towerHeight = this.config.gridSize * (0.3 + height * 0.6);
        const centerX = this.config.gridSize / 2;
        const bottomY = this.config.gridSize - 10;

        // Tower body (trapezoid)
        graphics.beginFill(colors.primary, 0.9);
        graphics.lineStyle(2, colors.border, 1);
        graphics.drawPolygon([
            centerX - baseWidth / 2, bottomY,                           // Bottom left
            centerX + baseWidth / 2, bottomY,                           // Bottom right
            centerX + topWidth / 2, bottomY - towerHeight,              // Top right
            centerX - topWidth / 2, bottomY - towerHeight               // Top left
        ]);
        graphics.endFill();

        // Windows/stories
        const stories = Math.max(1, Math.floor(height * 5));
        graphics.beginFill(colors.window, 0.8);
        for (let i = 0; i < stories; i++) {
            const y = bottomY - towerHeight * (0.2 + i * 0.15);
            const widthAtY = baseWidth - (baseWidth - topWidth) * (1 - (y - (bottomY - towerHeight)) / towerHeight);
            graphics.drawRect(centerX - widthAtY * 0.2, y, widthAtY * 0.4, 6);
        }
        graphics.endFill();

        // Spire on top
        graphics.beginFill(colors.accent, 1);
        graphics.drawPolygon([
            centerX - topWidth / 4, bottomY - towerHeight,
            centerX + topWidth / 4, bottomY - towerHeight,
            centerX, bottomY - towerHeight - 15
        ]);
        graphics.endFill();
    }

    drawBridge(graphics, colors, metadata) {
        const width = this.config.gridSize * 0.3;
        const length = this.config.gridSize * 0.9;
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;

        // Bridge deck
        graphics.beginFill(colors.primary, 0.9);
        graphics.lineStyle(2, colors.border, 1);
        graphics.drawRoundedRect(centerX - length / 2, centerY - width / 2, length, width, 4);
        graphics.endFill();

        // Bridge railings
        graphics.lineStyle(3, colors.accent, 0.8);
        graphics.moveTo(centerX - length / 2 + 5, centerY - width / 2 + 3);
        graphics.lineTo(centerX + length / 2 - 5, centerY - width / 2 + 3);
        graphics.moveTo(centerX - length / 2 + 5, centerY + width / 2 - 3);
        graphics.lineTo(centerX + length / 2 - 5, centerY + width / 2 - 3);
    }

    drawVault(graphics, colors, metadata) {
        const size = this.config.gridSize * 0.7;
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;

        // Vault body (octagon for fortified look)
        graphics.beginFill(colors.primary, 0.95);
        graphics.lineStyle(3, colors.border, 1);
        graphics.drawRect(centerX - size / 2, centerY - size / 2, size, size, 8);
        graphics.endFill();

        // Heavy door
        graphics.beginFill(0x1a1a1a, 1);
        graphics.drawRect(centerX - 12, centerY + size / 4, 24, size / 4);
        graphics.endFill();

        // Lock indicator
        graphics.beginFill(colors.accent, 1);
        graphics.drawCircle(centerX, centerY - 5, 8);
        graphics.endFill();
    }

    drawGarden(graphics, colors, metadata) {
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;
        const radius = this.config.gridSize * 0.35;

        // Grass base
        graphics.beginFill(colors.primary, 0.7);
        graphics.lineStyle(2, colors.border, 0.8);
        graphics.drawCircle(centerX, centerY, radius);
        graphics.endFill();

        // Flowers/features
        const features = metadata.features || 3;
        graphics.beginFill(colors.accent, 0.9);
        for (let i = 0; i < features; i++) {
            const angle = (i / features) * Math.PI * 2;
            const fx = centerX + Math.cos(angle) * radius * 0.5;
            const fy = centerY + Math.sin(angle) * radius * 0.5;
            graphics.drawCircle(fx, fy, 6);
        }
        graphics.endFill();
    }

    drawCrystal(graphics, colors, metadata) {
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;
        const size = this.config.gridSize * 0.4;

        // Crystal facets
        graphics.beginFill(colors.primary, 0.8);
        graphics.lineStyle(2, colors.accent, 1);

        // Draw crystal shape
        graphics.drawPolygon([
            centerX, centerY - size,           // Top
            centerX + size * 0.7, centerY,     // Right
            centerX, centerY + size * 0.5,     // Bottom
            centerX - size * 0.7, centerY      // Left
        ]);
        graphics.endFill();

        // Inner glow
        graphics.beginFill(colors.accent, 0.4);
        graphics.drawCircle(centerX, centerY, size * 0.3);
        graphics.endFill();
    }

    drawScaffold(graphics, colors, metadata) {
        const size = this.config.gridSize * 0.8;
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;

        // Dashed outline (building in progress)
        graphics.lineStyle(2, colors.primary, 0.6);
        const segments = 8;
        for (let i = 0; i < segments; i++) {
            const angle1 = (i / segments) * Math.PI * 2;
            const angle2 = ((i + 0.5) / segments) * Math.PI * 2;
            const x1 = centerX + Math.cos(angle1) * size / 2;
            const y1 = centerY + Math.sin(angle1) * size / 2;
            const x2 = centerX + Math.cos(angle2) * size / 2;
            const y2 = centerY + Math.sin(angle2) * size / 2;
            graphics.moveTo(x1, y1);
            graphics.lineTo(x2, y2);
        }

        // Construction icon
        graphics.beginFill(colors.accent, 0.8);
        graphics.drawCircle(centerX, centerY, 8);
        graphics.endFill();
    }

    drawGeneric(graphics, colors, metadata) {
        const size = this.config.gridSize * 0.6;
        const centerX = this.config.gridSize / 2;
        const centerY = this.config.gridSize / 2;

        graphics.beginFill(colors.primary, 0.8);
        graphics.lineStyle(2, colors.border, 1);
        graphics.drawRoundedRect(centerX - size / 2, centerY - size / 2, size, size, 8);
        graphics.endFill();
    }

    // ============================================================
    // HELPERS & UTILITIES
    // ============================================================

    validateCoordinates(x, y) {
        return Number.isInteger(x) && Number.isInteger(y) &&
            x >= -1000 && x <= 1000 &&
            y >= -1000 && y <= 1000;
    }

    validateStructureType(type) {
        const validTypes = ['tower', 'bridge', 'vault', 'garden', 'crystal', 'scaffold', 'generic'];
        return validTypes.includes(type);
    }

    isProtectedTile(x, y) {
        // Protect system tiles (like the silicon district at -10,-10)
        const protectedCoords = ['-10,-10'];
        return protectedCoords.includes(`${x},${y}`);
    }

    getStructureColors(type, status) {
        const palettes = {
            tower: { primary: 0x4a90d9, border: 0x2c5a8c, accent: 0x87ceeb, window: 0xffffcc },
            bridge: { primary: 0x8b7355, border: 0x5d4a35, accent: 0xa08060, window: 0xd4c4a8 },
            vault: { primary: 0x2d3748, border: 0x1a202c, accent: 0x4a5568, window: 0x718096 },
            garden: { primary: 0x48bb78, border: 0x2f855a, accent: 0x68d391, window: 0x9ae6b4 },
            crystal: { primary: 0x9f7aea, border: 0x6b46c1, accent: 0xb794f4, window: 0xd6bcfa },
            scaffold: { primary: 0xed8936, border: 0xc05621, accent: 0xf6ad55, window: 0xfbd38d },
            generic: { primary: 0x718096, border: 0x4a5568, accent: 0xa0aec0, window: 0xe2e8f0 }
        };

        const colors = palettes[type] || palettes.generic;

        // Adjust colors based on status
        if (status === 'error') {
            return { ...colors, primary: 0xe53e3e, accent: 0xfc8181 };
        } else if (status === 'deprecated') {
            return { ...colors, primary: 0x718096, accent: 0xa0aec0 };
        } else if (status === 'building') {
            return { ...colors, primary: 0xed8936 };
        }

        return colors;
    }

    calculateStructureHeight(metadata) {
        if (metadata.height) return Math.min(metadata.height / 10, 1);
        if (metadata.complexity) return metadata.complexity;
        return 0.5;
    }

    createStructureLabel(name, metadata) {
        const label = new PIXI.Text(name, {
            fontFamily: 'Courier New',
            fontSize: 10,
            fontWeight: 'bold',
            fill: 0xffffff,
            dropShadow: true,
            dropShadowColor: 0x000000,
            dropShadowDistance: 1,
            dropShadowBlur: 2
        });

        label.anchor.set(0.5);
        label.x = this.config.gridSize / 2;
        label.y = 15;

        return label;
    }

    makeStructureInteractive(container, x, y, metadata) {
        container.interactive = true;
        container.cursor = 'pointer';

        // Hover effect
        container.on('pointerover', () => {
            container.alpha = 1.0;
            container.scale.set(1.05);
            this.showStructureTooltip(x, y, metadata);
        });

        container.on('pointerout', () => {
            container.alpha = 0.9;
            container.scale.set(1.0);
            this.hideStructureTooltip();
        });

        // Click to open code reference
        if (metadata.codeReference) {
            container.on('pointerdown', () => {
                console.log(`📂 Opening code: ${metadata.codeReference}`);
                // Emit event for external handlers
                window.dispatchEvent(new CustomEvent('structure:click', {
                    detail: { x, y, metadata }
                }));
            });
        }
    }

    showStructureTooltip(x, y, metadata) {
        this.hideStructureTooltip();

        const tooltip = new PIXI.Container();
        tooltip.x = (x + 1) * this.config.gridSize;
        tooltip.y = y * this.config.gridSize;
        tooltip.zIndex = 1000;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.95);
        bg.lineStyle(1, 0x00AAFF, 0.8);
        bg.drawRoundedRect(0, 0, 200, 80, 6);
        bg.endFill();
        tooltip.addChild(bg);

        // Content
        const title = new PIXI.Text(metadata.name || 'Unnamed', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00AAFF
        });
        title.x = 10;
        title.y = 8;
        tooltip.addChild(title);

        if (metadata.description) {
            const desc = new PIXI.Text(metadata.description.substring(0, 40), {
                fontFamily: 'Arial',
                fontSize: 10,
                fill: 0xcccccc
            });
            desc.x = 10;
            desc.y = 28;
            tooltip.addChild(desc);
        }

        if (metadata.codeReference) {
            const code = new PIXI.Text(`📂 ${metadata.codeReference.substring(0, 30)}`, {
                fontFamily: 'Monaco',
                fontSize: 9,
                fill: 0x88cc88
            });
            code.x = 10;
            code.y = 50;
            tooltip.addChild(code);
        }

        this.world.addChild(tooltip);
        this.structureTooltip = tooltip;
    }

    hideStructureTooltip() {
        if (this.structureTooltip) {
            this.world.removeChild(this.structureTooltip);
            this.structureTooltip = null;
        }
    }

    animateStructureEntrance(container) {
        container.alpha = 0;
        container.scale.set(0.5);

        let progress = 0;
        const animate = () => {
            progress += 0.05;
            if (progress <= 1) {
                container.alpha = progress;
                container.scale.set(0.5 + 0.5 * this.easeOutBack(progress));
                requestAnimationFrame(animate);
            } else {
                container.alpha = 0.9;
                container.scale.set(1);
            }
        };
        animate();
    }

    animateStructureRemoval(container, onComplete) {
        let progress = 1;
        const animate = () => {
            progress -= 0.1;
            if (progress > 0) {
                container.alpha = progress;
                container.scale.set(progress);
                requestAnimationFrame(animate);
            } else {
                onComplete && onComplete();
            }
        };
        animate();
    }

    easeOutBack(t) {
        const c1 = 1.70158;
        const c3 = c1 + 1;
        return 1 + c3 * Math.pow(t - 1, 3) + c1 * Math.pow(t - 1, 2);
    }
}

// Export for integration
if (typeof window !== 'undefined') {
    window.InfiniteMap = InfiniteMap;
}
