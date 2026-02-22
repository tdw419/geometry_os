/**
 * Geometry OS: Pixel CPU - PixiJS Integration
 *
 * Integrates the SimplePixelCPU emulator with the PixiJS infinite map,
 * enabling real-time execution of .brick files with memory-mapped I/O
 * for console output and framebuffer display.
 */

// Import SimplePixelCPU for Node.js environments
if (typeof require !== 'undefined' && typeof SimplePixelCPU === 'undefined') {
    global.SimplePixelCPU = require('./pixel_cpu.js');
}

// Import ExecutionTracer for Node.js environments
if (typeof require !== 'undefined' && typeof ExecutionTracer === 'undefined') {
    global.ExecutionTracer = require('./ExecutionTracer.js');
}

// Import MemoryAnalyzer for Node.js environments
if (typeof require !== 'undefined' && typeof MemoryAnalyzer === 'undefined') {
    global.MemoryAnalyzer = require('./MemoryAnalyzer.js');
}

class PixelCPUIntegration {
    /**
     * Create a new PixelCPUIntegration instance
     * @param {Object} infiniteMap - Reference to InfiniteMap instance
     * @param {Object} config - Configuration options
     */
    constructor(infiniteMap, config = {}) {
        if (!infiniteMap) {
            throw new TypeError('infiniteMap is required');
        }

        this.infiniteMap = infiniteMap;
        this.config = {
            cyclesPerFrame: 1000,           // CPU cycles per render frame
            framebufferBase: 0x30000000,    // Framebuffer base address
            consoleBase: 0x20000000,       // Console base address
            framebufferWidth: 640,          // Framebuffer width in pixels
            framebufferHeight: 480,         // Framebuffer height in pixels
            consoleMaxLines: 24,           // Maximum console lines to display
            consoleMaxHistory: 1000,        // Maximum console lines in history
            consoleWidth: 800,              // Console tile width in pixels
            consoleHeight: 200,             // Console tile height in pixels
            consoleFontSize: 12,            // Console font size in pixels
            consoleLineHeight: 16,          // Console line height in pixels
            ...config
        };

        // Initialize CPU instance
        this.cpu = new SimplePixelCPU();

        // Set up console output callback for memory-mapped I/O
        this.cpu.setConsoleOutputCallback((char) => {
            this.writeConsole(char);
        });

        // Initialize ExecutionTracer for instruction tracing
        this.executionTracer = new ExecutionTracer({
            maxTraceLength: 10000,
            patternLength: 5,
            minPatternFrequency: 10,
            enableVisualization: true,
            uiRefreshInterval: 100
        });

        // Set up instruction callback for execution tracing
        this.cpu.setInstructionCallback((pc, opcode, dest, src1, src2, registers) => {
            this.executionTracer.recordInstruction(pc, opcode, dest, src1, src2, registers);
        });

        // Initialize MemoryAnalyzer for memory access tracking
        this.memoryAnalyzer = new MemoryAnalyzer({
            maxAccessRecords: 50000,
            regionSize: 4096,
            hotspotThreshold: 100,
            enableVisualization: true,
            uiRefreshInterval: 200,
            maxHotspots: 20,
            trackReads: true,
            trackWrites: true
        });

        // Set up memory access callback for memory analysis
        this.cpu.setMemoryAccessCallback((address, type, value, pc) => {
            this.memoryAnalyzer.recordAccess(address, type, value, pc);
        });

        // Memory-mapped I/O regions
        this.consoleBuffer = '';
        this.consoleHistory = []; // Full history of console output
        this.framebufferTexture = null;
        this.framebufferSprite = null;
        this.consoleTile = null;
        this.consoleText = null;
        this.consoleScrollPosition = 0; // Current scroll position (0 = latest)

        // Performance tracking for framebuffer updates
        this.lastFramebufferUpdateTime = 0;
        this.framebufferUpdateCount = 0;

        // Performance tracking for console updates
        this.lastConsoleUpdateTime = 0;
        this.consoleUpdateCount = 0;
        this.consoleDirty = false; // Flag to track if console needs update

        // Visual components
        this.stateOverlay = null;
        this.registerText = null;
        this.pcText = null;
        this.cyclesText = null;

        // State management
        this.running = false;
        this.paused = false;

        // Performance tracking
        this.lastExecutionTime = 0;
        this.performanceWarnings = 0;

        console.log('✓ PixelCPUIntegration initialized');
    }

    /**
     * Execute CPU for cyclesPerFrame cycles (non-blocking)
     * Called from PixiJS ticker (60 FPS)
     */
    executeFrame() {
        if (!this.running || this.paused) {
            return;
        }

        const startTime = performance.now();

        // Execute CPU for configured number of cycles
        this.cpu.execute(this.config.cyclesPerFrame);

        const executionTime = performance.now() - startTime;
        this.lastExecutionTime = executionTime;

        // Performance monitoring
        if (executionTime > 5) {
            this.performanceWarnings++;
            if (this.performanceWarnings <= 10) { // Limit warnings
                console.warn(`⚠ CPU execution took ${executionTime.toFixed(2)}ms (target: <5ms)`);
            }
        }

        // Update visual components
        this.updateFramebuffer();
        this.updateConsole();
        this.updateStateVisualization();
        this.updateExecutionTrace(performance.now());
        this.updateMemoryAnalysis(performance.now());
    }

    /**
     * Execute a single CPU instruction step
     * Used for debugging and stepping through code
     */
    step() {
        if (!this.running) {
            return;
        }

        const startTime = performance.now();

        // Execute single step
        const stepResult = this.cpu.step();

        const executionTime = performance.now() - startTime;
        this.lastExecutionTime = executionTime;

        // Update visual components
        this.updateFramebuffer();
        this.updateConsole();
        this.updateStateVisualization();
        this.updateExecutionTrace(performance.now());
        this.updateMemoryAnalysis(performance.now());

        return stepResult;
    }

    /**
     * Load and execute a .brick file
     * @param {string} brickName - Name of brick file to load
     * @returns {Promise<void>}
     */
    async loadBrick(brickName) {
        try {
            console.log(`📦 Loading brick: ${brickName}`);

            // Reset CPU state
            this.cpu.reset();

            // Load brick file
            await this.cpu.loadBrick(`/builder/queue/${brickName}`);

            // Create framebuffer texture
            this.createFramebufferTexture();

            // Create console tile
            this.createConsoleTile();

            // Create CPU state overlay
            this.createStateOverlay();

            // Create execution trace visualization
            this.createExecutionTraceVisualization();

            // Create memory analyzer visualization
            this.createMemoryAnalysisVisualization();

            // Start execution
            this.running = true;
            this.paused = false;

            console.log(`✓ Brick loaded and execution started`);
        } catch (error) {
            console.error(`Failed to load brick:`, error);
            throw error;
        }
    }

    /**
     * Pause CPU execution
     */
    pause() {
        this.paused = true;
        console.log('⏸️ CPU paused');
    }

    /**
     * Resume CPU execution
     */
    resume() {
        this.paused = false;
        console.log('▶️ CPU resumed');
    }

    /**
     * Reset CPU state
     */
    reset() {
        this.cpu.reset();
        this.consoleBuffer = '';
        this.consoleHistory = [];
        this.consoleScrollPosition = 0;
        this.consoleDirty = false;
        this.running = false;
        this.paused = false;
        this.performanceWarnings = 0;
        this.lastFramebufferUpdateTime = 0;
        this.framebufferUpdateCount = 0;
        this.lastConsoleUpdateTime = 0;
        this.consoleUpdateCount = 0;

        // Clear execution trace
        this.clearExecutionTrace();

        // Clear memory analyzer
        this.clearMemoryAnalysis();

        // Clear framebuffer
        if (this.framebufferTexture) {
            this.clearFramebuffer();
        }

        // Update console display
        if (this.consoleTile) {
            this.updateConsoleDisplay();
        }

        // Update state visualization
        if (this.stateOverlay) {
            this.updateStateVisualization();
        }

        console.log('🔄 CPU reset');
    }

    /**
     * Get current CPU state
     * @returns {Object} - CPU state object
     */
    getState() {
        return {
            ...this.cpu.getState(),
            running: this.running,
            paused: this.paused,
            lastExecutionTime: this.lastExecutionTime,
            lastFramebufferUpdateTime: this.lastFramebufferUpdateTime,
            framebufferUpdateCount: this.framebufferUpdateCount,
            lastConsoleUpdateTime: this.lastConsoleUpdateTime,
            consoleUpdateCount: this.consoleUpdateCount,
            consoleBufferLength: this.consoleBuffer.length,
            consoleHistoryLength: this.consoleHistory.length,
            performanceWarnings: this.performanceWarnings
        };
    }

    /**
     * Create framebuffer texture for display
     */
    createFramebufferTexture() {
        const width = this.config.framebufferWidth;
        const height = this.config.framebufferHeight;

        // Set CPU framebuffer resolution
        this.cpu.setFramebufferResolution(width, height);

        // Create blank canvas
        const canvas = document.createElement('canvas');
        canvas.width = width;
        canvas.height = height;
        const ctx = canvas.getContext('2d');
        ctx.fillStyle = '#000000';
        ctx.fillRect(0, 0, width, height);

        // Create PixiJS texture from canvas
        this.framebufferTexture = PIXI.Texture.from(canvas);

        // Create sprite for framebuffer
        const sprite = new PIXI.Sprite(this.framebufferTexture);
        sprite.x = 100;
        sprite.y = 100;
        sprite.width = width;
        sprite.height = height;
        sprite.zIndex = 500;

        // Add to infinite map world
        this.infiniteMap.world.addChild(sprite);
        this.framebufferSprite = sprite;

        console.log(`✓ Framebuffer texture created (${width}x${height})`);
    }

    /**
     * Set framebuffer resolution
     * @param {number} width - Framebuffer width in pixels
     * @param {number} height - Framebuffer height in pixels
     */
    setFramebufferResolution(width, height) {
        try {
            // Update CPU resolution
            this.cpu.setFramebufferResolution(width, height);

            // Update config
            this.config.framebufferWidth = width;
            this.config.framebufferHeight = height;

            // Recreate framebuffer texture with new resolution
            if (this.framebufferSprite) {
                this.infiniteMap.world.removeChild(this.framebufferSprite);
            }
            this.createFramebufferTexture();

            console.log(`✓ Framebuffer resolution changed to ${width}x${height}`);
        } catch (error) {
            console.error('Failed to set framebuffer resolution:', error);
            throw error;
        }
    }

    /**
     * Get current framebuffer resolution
     * @returns {Object} - Resolution object with width and height
     */
    getFramebufferResolution() {
        return this.cpu.getFramebufferResolution();
    }

    /**
     * Get performance statistics
     * @returns {Object} - Performance statistics
     */
    getPerformanceStats() {
        return {
            lastExecutionTime: this.lastExecutionTime,
            lastFramebufferUpdateTime: this.lastFramebufferUpdateTime,
            framebufferUpdateCount: this.framebufferUpdateCount,
            performanceWarnings: this.performanceWarnings
        };
    }

    /**
     * Update framebuffer from CPU memory with dirty rectangle tracking
     */
    updateFramebuffer() {
        if (!this.framebufferTexture) return;

        const startTime = performance.now();

        const fbBase = this.config.framebufferBase;
        const width = this.config.framebufferWidth;
        const height = this.config.framebufferHeight;

        // Get dirty rectangles from CPU
        const dirtyRects = this.cpu.getDirtyRects();

        if (dirtyRects.length === 0) {
            // No changes, skip update
            return;
        }

        // Check if we should do a full update (too many dirty rects)
        if (dirtyRects.length > 16) {
            // Full update is more efficient
            const pixelData = new Uint8ClampedArray(width * height * 4);

            // Copy memory to pixel data
            for (let y = 0; y < height; y++) {
                for (let x = 0; x < width; x++) {
                    const offset = (y * width + x) * 4;
                    const memAddr = fbBase + offset;

                    // Read RGBA from memory
                    pixelData[offset] = this.cpu.readMemory(memAddr);         // R
                    pixelData[offset + 1] = this.cpu.readMemory(memAddr + 1); // G
                    pixelData[offset + 2] = this.cpu.readMemory(memAddr + 2); // B
                    pixelData[offset + 3] = this.cpu.readMemory(memAddr + 3); // A
                }
            }

            // Update entire texture
            const imageData = new ImageData(pixelData, width, height);
            this.framebufferTexture.update(imageData);
        } else {
            // Partial updates for each dirty rectangle
            const framebuffer = this.cpu.getFramebuffer();

            for (const rect of dirtyRects) {
                // Clamp rectangle to framebuffer bounds
                const clampedRect = {
                    x: Math.max(0, rect.x),
                    y: Math.max(0, rect.y),
                    width: Math.min(width - rect.x, rect.width),
                    height: Math.min(height - rect.y, rect.height)
                };

                if (clampedRect.width <= 0 || clampedRect.height <= 0) {
                    continue;
                }

                // Extract pixel data for this dirty rectangle
                const pixelData = new Uint8ClampedArray(clampedRect.width * clampedRect.height * 4);

                for (let y = 0; y < clampedRect.height; y++) {
                    for (let x = 0; x < clampedRect.width; x++) {
                        const globalX = clampedRect.x + x;
                        const globalY = clampedRect.y + y;
                        const globalOffset = (globalY * width + globalX) * 4;
                        const localOffset = (y * clampedRect.width + x) * 4;

                        // Copy RGBA from framebuffer
                        pixelData[localOffset] = framebuffer[globalOffset];         // R
                        pixelData[localOffset + 1] = framebuffer[globalOffset + 1]; // G
                        pixelData[localOffset + 2] = framebuffer[globalOffset + 2]; // B
                        pixelData[localOffset + 3] = framebuffer[globalOffset + 3]; // A
                    }
                }

                // Update texture region
                const imageData = new ImageData(pixelData, clampedRect.width, clampedRect.height);
                this.framebufferTexture.update(imageData, clampedRect.x, clampedRect.y);
            }
        }

        // Clear dirty rectangles after update
        this.cpu.clearDirtyRects();

        // Track performance
        const updateTime = performance.now() - startTime;
        this.lastFramebufferUpdateTime = updateTime;
        this.framebufferUpdateCount++;

        // Performance warning
        if (updateTime > 3) {
            if (this.framebufferUpdateCount <= 10) { // Limit warnings
                console.warn(`⚠ Framebuffer update took ${updateTime.toFixed(2)}ms (target: <3ms)`);
            }
        }
    }

    /**
     * Clear framebuffer with black
     */
    clearFramebuffer() {
        const width = this.config.framebufferWidth;
        const height = this.config.framebufferHeight;
        const pixelData = new Uint8ClampedArray(width * height * 4);
        pixelData.fill(0);

        const imageData = new ImageData(pixelData, width, height);
        this.framebufferTexture.update(imageData);

        // Clear dirty rectangles
        this.cpu.clearDirtyRects();
    }

    /**
     * Create console tile on infinite map
     * Enhanced with better styling, positioning, and scroll support
     */
    createConsoleTile() {
        const container = new PIXI.Container();

        // Position at bottom of the viewport (relative to world coordinates)
        // Use a fixed world position that will be visible when viewing the origin
        container.x = 0;
        container.y = 800; // Position below the framebuffer at (100, 100)
        container.zIndex = 600;

        // Background with slight transparency
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.95); // 95% opacity black
        bg.lineStyle(2, 0x00FF00, 1.0); // Green border
        bg.drawRoundedRect(0, 0, this.config.consoleWidth, this.config.consoleHeight, 8);
        bg.endFill();
        container.addChild(bg);

        // Console title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x003300, 1.0); // Dark green
        titleBar.drawRect(0, 0, this.config.consoleWidth, 24);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title text
        const titleText = new PIXI.Text('📟 Console Output', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x00FF00
        });
        titleText.x = 10;
        titleText.y = 4;
        container.addChild(titleText);

        // Scroll indicator
        this.scrollIndicator = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 10,
            fill: 0x00AA00
        });
        this.scrollIndicator.x = this.config.consoleWidth - 80;
        this.scrollIndicator.y = 6;
        container.addChild(this.scrollIndicator);

        // Console text area with proper styling
        const consoleText = new PIXI.Text('', {
            fontFamily: 'Monaco, "Courier New", Consolas, monospace',
            fontSize: this.config.consoleFontSize,
            fill: 0x00FF00, // Terminal green
            align: 'left',
            lineHeight: this.config.consoleLineHeight,
            wordWrap: true,
            wordWrapWidth: this.config.consoleWidth - 20
        });
        consoleText.x = 10;
        consoleText.y = 30; // Below title bar
        container.addChild(consoleText);

        // Add to infinite map world
        this.infiniteMap.world.addChild(container);
        this.consoleTile = container;
        this.consoleText = consoleText;

        console.log(`✓ Console tile created (${this.config.consoleWidth}x${this.config.consoleHeight})`);
    }

    /**
     * Update console display with performance tracking
     * Optimized to complete in <1ms/frame
     */
    updateConsoleDisplay() {
        if (!this.consoleText || !this.consoleDirty) return;

        const startTime = performance.now();

        // Get visible lines based on scroll position
        const lines = this.consoleBuffer.split('\n');
        const maxVisibleLines = Math.floor(
            (this.config.consoleHeight - 30) / this.config.consoleLineHeight
        );

        // Calculate scroll offset
        const scrollOffset = Math.max(0, this.consoleScrollPosition);
        const startIndex = Math.max(0, lines.length - maxVisibleLines - scrollOffset);
        const endIndex = Math.min(lines.length, startIndex + maxVisibleLines);

        // Get visible portion
        const visibleLines = lines.slice(startIndex, endIndex);
        const displayText = visibleLines.join('\n');

        // Update text
        this.consoleText.text = displayText;

        // Update scroll indicator
        const totalLines = lines.length;
        const scrollPercent = totalLines > maxVisibleLines
            ? Math.round((this.consoleScrollPosition / (totalLines - maxVisibleLines)) * 100)
            : 100;
        this.scrollIndicator.text = `${scrollPercent}%`;

        // Clear dirty flag
        this.consoleDirty = false;

        // Track performance
        const updateTime = performance.now() - startTime;
        this.lastConsoleUpdateTime = updateTime;
        this.consoleUpdateCount++;

        // Performance warning
        if (updateTime > 1 && this.consoleUpdateCount <= 10) {
            console.warn(`⚠ Console update took ${updateTime.toFixed(3)}ms (target: <1ms)`);
        }
    }

    /**
     * Write character to console (memory-mapped I/O)
     * Enhanced with better character handling and history management
     * @param {number} char - Character code to write
     */
    writeConsole(char) {
        // Check if character is printable
        if (char >= 32 && char <= 126) {
            this.consoleBuffer += String.fromCharCode(char);
        } else if (char === 10) { // Newline (LF)
            this.consoleBuffer += '\n';
            // Add to history when line is complete
            this.addToHistory();
        } else if (char === 13) { // Carriage return (CR)
            // Ignore CR (Unix-style line endings)
        } else if (char === 8 || char === 127) { // Backspace or Delete
            // Remove last character
            if (this.consoleBuffer.length > 0) {
                this.consoleBuffer = this.consoleBuffer.slice(0, -1);
            }
        } else if (char === 9) { // Tab
            // Expand tab to 4 spaces
            this.consoleBuffer += '    ';
        } else {
            // Other control characters - show as hex
            this.consoleBuffer += `[${char.toString(16).padStart(2, '0')}]`;
        }

        // Mark console as dirty (will be updated in next frame)
        this.consoleDirty = true;

        // Reset scroll position to show latest output
        this.consoleScrollPosition = 0;
    }

    /**
     * Add current buffer to history
     */
    addToHistory() {
        const lines = this.consoleBuffer.split('\n');
        if (lines.length > 0) {
            const lastLine = lines[lines.length - 1];
            if (lastLine.trim() !== '') {
                this.consoleHistory.push(lastLine);
                // Limit history size
                if (this.consoleHistory.length > this.config.consoleMaxHistory) {
                    this.consoleHistory.shift();
                }
            }
        }
    }

    /**
     * Scroll console up
     * @param {number} lines - Number of lines to scroll
     */
    scrollConsoleUp(lines = 1) {
        this.consoleScrollPosition += lines;
        this.consoleDirty = true;
    }

    /**
     * Scroll console down
     * @param {number} lines - Number of lines to scroll
     */
    scrollConsoleDown(lines = 1) {
        this.consoleScrollPosition = Math.max(0, this.consoleScrollPosition - lines);
        this.consoleDirty = true;
    }

    /**
     * Scroll console to bottom (latest output)
     */
    scrollConsoleToBottom() {
        this.consoleScrollPosition = 0;
        this.consoleDirty = true;
    }

    /**
     * Scroll console to top (oldest output)
     */
    scrollConsoleToTop() {
        const maxScroll = Math.max(0, this.consoleBuffer.split('\n').length - this.config.consoleMaxLines);
        this.consoleScrollPosition = maxScroll;
        this.consoleDirty = true;
    }

    /**
     * Update console if output changed
     * Called from executeFrame() to batch updates
     */
    updateConsole() {
        if (this.consoleDirty) {
            this.updateConsoleDisplay();
        }
    }

    /**
     * Create CPU state overlay with proper styling and positioning
     * Positioned at world coordinates (-400, -200) for top-left
     */
    createStateOverlay() {
        const overlay = new PIXI.Container();
        // Position at world coordinates (-400, -200) for top-left placement
        overlay.x = -400;
        overlay.y = -200;
        overlay.zIndex = 1000;

        // Background with proper opacity
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        // Blue accent border (#0066CC)
        bg.lineStyle(2, 0x0066CC, 1.0);
        bg.drawRoundedRect(0, 0, 300, 400, 8);
        bg.endFill();
        overlay.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0x0066CC, 0.3); // Blue accent background
        titleBar.drawRect(0, 0, 300, 30);
        titleBar.endFill();
        overlay.addChild(titleBar);

        // Title
        const title = new PIXI.Text('🖥️  CPU State', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0x0066CC // Blue accent
        });
        title.x = 10;
        title.y = 6;
        overlay.addChild(title);

        // Register display (white)
        this.registerText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 10,
            fill: 0xFFFFFF // White registers
        });
        this.registerText.x = 10;
        this.registerText.y = 40;
        overlay.addChild(this.registerText);

        // PC display (orange #FF6600)
        this.pcText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0xFF6600 // Orange PC
        });
        this.pcText.x = 10;
        this.pcText.y = 200;
        overlay.addChild(this.pcText);

        // Cycles display (green #00CC66)
        this.cyclesText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 12,
            fontWeight: 'bold',
            fill: 0x00CC66 // Green cycles
        });
        this.cyclesText.x = 10;
        this.cyclesText.y = 230;
        overlay.addChild(this.cyclesText);

        // Status display (white)
        this.statusText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 10,
            fill: 0xFFFFFF
        });
        this.statusText.x = 10;
        this.statusText.y = 260;
        overlay.addChild(this.statusText);

        // Memory usage display (white)
        this.memoryText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 10,
            fill: 0xFFFFFF
        });
        this.memoryText.x = 10;
        this.memoryText.y = 310;
        overlay.addChild(this.memoryText);

        // Control buttons container
        const controlsContainer = new PIXI.Container();
        controlsContainer.x = 10;
        controlsContainer.y = 350;
        overlay.addChild(controlsContainer);

        // Create interactive buttons
        this.createControlButton(controlsContainer, 0, '⏸️', 'Pause', () => this.pause());
        this.createControlButton(controlsContainer, 65, '▶️', 'Resume', () => this.resume());
        this.createControlButton(controlsContainer, 130, '⏭️', 'Step', () => this.step());
        this.createControlButton(controlsContainer, 195, '🔄', 'Reset', () => this.reset());

        // Add to infinite map world
        this.infiniteMap.world.addChild(overlay);
        this.stateOverlay = overlay;

        console.log('✓ CPU state overlay created at world coordinates (-400, -200)');
    }

    /**
     * Create a control button for CPU management
     * @param {PIXI.Container} container - Container to add button to
     * @param {number} x - X position
     * @param {string} icon - Button icon
     * @param {string} tooltip - Button tooltip text
     * @param {Function} onClick - Click handler
     */
    createControlButton(container, x, icon, tooltip, onClick) {
        const button = new PIXI.Container();
        button.x = x;
        button.y = 0;
        button.interactive = true;
        button.cursor = 'pointer';

        // Button background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0066CC, 0.5); // Blue accent
        bg.lineStyle(1, 0x0066CC, 1.0);
        bg.drawRoundedRect(0, 0, 60, 30, 4);
        bg.endFill();
        button.addChild(bg);

        // Button icon/text
        const text = new PIXI.Text(icon, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 16,
            fill: 0xFFFFFF
        });
        text.x = 18;
        text.y = 5;
        button.addChild(text);

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(0x0066CC, 0.8); // Brighter on hover
            bg.lineStyle(1, 0x00AAFF, 1.0);
            bg.drawRoundedRect(0, 0, 60, 30, 4);
            bg.endFill();
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(0x0066CC, 0.5); // Normal state
            bg.lineStyle(1, 0x0066CC, 1.0);
            bg.drawRoundedRect(0, 0, 60, 30, 4);
            bg.endFill();
        });

        // Click handler
        button.on('pointerdown', () => {
            bg.clear();
            bg.beginFill(0x004499, 1.0); // Darker on click
            bg.lineStyle(1, 0x0066CC, 1.0);
            bg.drawRoundedRect(0, 0, 60, 30, 4);
            bg.endFill();
        });

        button.on('pointerup', () => {
            bg.clear();
            bg.beginFill(0x0066CC, 0.8); // Return to hover state
            bg.lineStyle(1, 0x00AAFF, 1.0);
            bg.drawRoundedRect(0, 0, 60, 30, 4);
            bg.endFill();
            onClick();
        });

        container.addChild(button);
    }

    /**
     * Update CPU state visualization
     * Optimized to complete in <2ms/frame
     */
    updateStateVisualization() {
        if (!this.registerText || !this.pcText || !this.cyclesText || !this.statusText || !this.memoryText) {
            return;
        }

        const startTime = performance.now();

        const state = this.cpu.getState();

        // Update registers (8 registers displayed)
        let regText = 'Registers:\n';
        for (let i = 0; i < 8; i++) {
            regText += `R${i.toString().padStart(2, '0')}: 0x${state.registers[i].toString(16).padStart(8, '0')}\n`;
        }
        this.registerText.text = regText;

        // Update PC (orange #FF6600)
        this.pcText.text = `PC: 0x${state.pc.toString(16).padStart(8, '0')}`;

        // Update cycles (green #00CC66)
        this.cyclesText.text = `Cycles: ${state.cycles}`;

        // Update status (white)
        let status = `Running: ${this.running ? 'Yes' : 'No'}\n`;
        status += `Paused: ${this.paused ? 'Yes' : 'No'}\n`;
        status += `Halted: ${state.halted ? 'Yes' : 'No'}\n`;
        status += `Exec Time: ${this.lastExecutionTime.toFixed(2)}ms\n`;
        status += `FB Update: ${this.lastFramebufferUpdateTime.toFixed(2)}ms\n`;
        status += `FB Updates: ${this.framebufferUpdateCount}`;
        this.statusText.text = status;

        // Update memory usage (white)
        const memoryUsed = state.memorySize * 4; // 4 bytes per instruction
        const memoryPercent = ((memoryUsed / this.cpu.maxMemorySize) * 100).toFixed(1);
        const consoleUsed = this.consoleBuffer.length;
        const consolePercent = ((consoleUsed / this.config.consoleMaxHistory) * 100).toFixed(1);
        const fbUsed = this.framebufferUpdateCount;

        let memText = `Memory:\n`;
        memText += `  Used: ${(memoryUsed / 1024).toFixed(1)}KB (${memoryPercent}%)\n`;
        memText += `  Console: ${consoleUsed} chars (${consolePercent}%)\n`;
        memText += `  FB Updates: ${fbUsed}`;
        this.memoryText.text = memText;

        // Track performance
        const updateTime = performance.now() - startTime;
        if (updateTime > 2 && this.framebufferUpdateCount <= 10) {
            console.warn(`⚠ State visualization took ${updateTime.toFixed(3)}ms (target: <2ms)`);
        }
    }

    /**
     * Update execution trace visualization
     * @param {number} timestamp - Current timestamp for throttling
     */
    updateExecutionTrace(timestamp) {
        if (this.executionTracer) {
            this.executionTracer.updateVisualization(timestamp);
        }
    }

    /**
     * Update memory analysis visualization
     * @param {number} timestamp - Current timestamp for throttling
     */
    updateMemoryAnalysis(timestamp) {
        if (this.memoryAnalyzer) {
            this.memoryAnalyzer.updateVisualization(timestamp);
        }
    }

    /**
     * Create execution trace visualization UI
     */
    createExecutionTraceVisualization() {
        if (this.executionTracer && this.infiniteMap) {
            this.executionTracer.createVisualizationUI(this.infiniteMap);
            console.log('✓ Execution trace visualization created');
        }
    }

    /**
     * Remove execution trace visualization UI
     */
    removeExecutionTraceVisualization() {
        if (this.executionTracer) {
            this.executionTracer.removeVisualizationUI();
            console.log('✓ Execution trace visualization removed');
        }
    }

    /**
     * Create memory analysis visualization UI
     */
    createMemoryAnalysisVisualization() {
        if (this.memoryAnalyzer && this.infiniteMap) {
            this.memoryAnalyzer.createVisualizationUI(this.infiniteMap);
            console.log('✓ Memory analysis visualization created');
        }
    }

    /**
     * Remove memory analysis visualization UI
     */
    removeMemoryAnalysisVisualization() {
        if (this.memoryAnalyzer) {
            this.memoryAnalyzer.removeVisualizationUI();
            console.log('✓ Memory analysis visualization removed');
        }
    }

    /**
     * Enable or disable instruction tracing
     * @param {boolean} enabled - Whether tracing is enabled
     */
    setTracingEnabled(enabled) {
        if (this.executionTracer) {
            this.executionTracer.setEnabled(enabled);
        }
    }

    /**
     * Clear execution trace
     */
    clearExecutionTrace() {
        if (this.executionTracer) {
            this.executionTracer.clear();
            console.log('✓ Execution trace cleared');
        }
    }

    /**
     * Get execution trace statistics
     * @returns {Object} - Trace statistics
     */
    getExecutionTraceStats() {
        if (this.executionTracer) {
            return this.executionTracer.getPerformanceStats();
        }
        return null;
    }

    /**
     * Get identified patterns
     * @param {number} patternLength - Pattern length to identify
     * @returns {Array} - Array of patterns with frequencies
     */
    getExecutionPatterns(patternLength = null) {
        if (this.executionTracer) {
            return this.executionTracer.identifyPatterns(patternLength);
        }
        return [];
    }

    /**
     * Export execution trace to JSON
     * @param {number} limit - Maximum number of records to export
     * @returns {string} - JSON string of trace
     */
    exportExecutionTrace(limit = null) {
        if (this.executionTracer) {
            return this.executionTracer.exportTrace(limit);
        }
        return null;
    }

    /**
     * Import execution trace from JSON
     * @param {string} json - JSON string to import
     */
    importExecutionTrace(json) {
        if (this.executionTracer) {
            this.executionTracer.importTrace(json);
            console.log('✓ Execution trace imported');
        }
    }

    /**
     * Enable or disable memory analysis
     * @param {boolean} enabled - Whether analysis is enabled
     */
    setMemoryAnalysisEnabled(enabled) {
        if (this.memoryAnalyzer) {
            this.memoryAnalyzer.setEnabled(enabled);
        }
    }

    /**
     * Clear memory analysis data
     */
    clearMemoryAnalysis() {
        if (this.memoryAnalyzer) {
            this.memoryAnalyzer.clear();
            console.log('✓ Memory analysis cleared');
        }
    }

    /**
     * Get memory analysis statistics
     * @returns {Object} - Analysis statistics
     */
    getMemoryAnalysisStats() {
        if (this.memoryAnalyzer) {
            return this.memoryAnalyzer.getPerformanceStats();
        }
        return null;
    }

    /**
     * Get identified memory hotspots
     * @returns {Array} - Array of hotspots
     */
    getMemoryHotspots() {
        if (this.memoryAnalyzer) {
            return this.memoryAnalyzer.getHotspots();
        }
        return [];
    }

    /**
     * Get top N memory hotspots
     * @param {number} n - Number of hotspots to return
     * @returns {Array} - Array of top N hotspots
     */
    getTopMemoryHotspots(n = 10) {
        if (this.memoryAnalyzer) {
            return this.memoryAnalyzer.getTopHotspots(n);
        }
        return [];
    }

    /**
     * Get memory access heatmap data
     * @param {number} startAddress - Start address
     * @param {number} endAddress - End address
     * @param {number} resolution - Number of bins
     * @returns {Array} - Heatmap data
     */
    getMemoryHeatmapData(startAddress, endAddress, resolution = 64) {
        if (this.memoryAnalyzer) {
            return this.memoryAnalyzer.getHeatmapData(startAddress, endAddress, resolution);
        }
        return [];
    }

    /**
     * Export memory analysis data to JSON
     * @param {number} limit - Maximum number of records to export
     * @returns {string} - JSON string of analysis data
     */
    exportMemoryAnalysis(limit = null) {
        if (this.memoryAnalyzer) {
            return this.memoryAnalyzer.exportAccessData(limit);
        }
        return null;
    }

    /**
     * Import memory analysis data from JSON
     * @param {string} json - JSON string to import
     */
    importMemoryAnalysis(json) {
        if (this.memoryAnalyzer) {
            this.memoryAnalyzer.importAccessData(json);
            console.log('✓ Memory analysis data imported');
        }
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = PixelCPUIntegration;
}
