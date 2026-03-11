/**
 * Linux Kernel Loader for Geometry OS Infinite Map
 * 
 * Loads and executes the converted RISC-V Linux kernel (linux_kernel.rts.png)
 * on the PixiJS infinite map using the Pixel CPU emulator.
 */

class LinuxKernelLoader {
    constructor(infiniteMap) {
        this.map = infiniteMap;
        this.kernelUrl = '/linux_kernel.rts.png';
        this.bootloaderUrl = null;
        this.isLoaded = false;
        this.isExecuting = false;
        this.pixelCPU = null;
        this.kernelTile = null;
        
        // Kernel execution state
        this.consoleBuffer = [];
        this.framebuffer = null;
        this.executionStats = {
            cycles: 0,
            instructions: 0,
            startTime: null
        };
        
        console.log('🐧 LinuxKernelLoader initialized');
    }
    
    /**
     * Load the Linux kernel RTS image onto the map
     */
    async loadKernel(tileX = 0, tileY = 0) {
        console.log(`🐧 Loading Linux kernel to tile (${tileX}, ${tileY})...`);
        
        try {
            // Create a container for the kernel tile
            const container = new PIXI.Container();
            container.x = tileX * this.map.config.gridSize;
            container.y = tileY * this.map.config.gridSize;
            
            // Load the kernel image
            const texture = await PIXI.Assets.load(this.kernelUrl);
            const sprite = new PIXI.Sprite(texture);
            
            // Scale to fit grid
            const scale = this.map.config.gridSize / Math.max(texture.width, texture.height);
            sprite.scale.set(scale);
            
            // Add kernel label
            const label = new PIXI.Text('🐧 Linux Kernel\n(RISC-V RV64)', {
                fontFamily: 'Arial',
                fontSize: 12,
                fill: 0x00FF00,
                align: 'center'
            });
            label.x = 10;
            label.y = 10;
            
            container.addChild(sprite);
            container.addChild(label);
            container.eventMode = 'static';
            container.cursor = 'pointer';
            
            // Handle click to boot
            container.on('pointerdown', () => {
                this.bootKernel();
            });
            
            this.map.world.addChild(container);
            
            // Store reference
            this.kernelTile = {
                x: tileX,
                y: tileY,
                container: container,
                sprite: sprite,
                texture: texture
            };
            
            this.isLoaded = true;
            console.log('✅ Linux kernel loaded successfully');
            console.log('   Click the kernel tile to boot!');
            
            return true;
            
        } catch (error) {
            console.error('❌ Failed to load Linux kernel:', error);
            return false;
        }
    }
    
    /**
     * Boot the Linux kernel using the Pixel CPU
     */
    async bootKernel() {
        if (!this.isLoaded) {
            console.error('❌ Kernel not loaded');
            return;
        }
        
        if (this.isExecuting) {
            console.log('⚠️  Kernel already running');
            return;
        }
        
        console.log('🚀 Booting Linux kernel...');
        this.isExecuting = true;
        this.executionStats.startTime = Date.now();
        
        // Create Pixel CPU instance
        this.pixelCPU = new SimplePixelCPU();
        
        // Set up console output callback
        this.pixelCPU.consoleOutput = (char) => {
            this.consoleBuffer.push(char);
            if (char === '\n' || this.consoleBuffer.length > 80) {
                const line = this.consoleBuffer.join('');
                this.consoleBuffer = [];
                console.log(`🐧 ${line}`);
            }
        };
        
        try {
            // Try to load as .brick first, fallback to extracting from RTS
            const brickUrl = this.kernelUrl.replace('.rts.png', '.brick');
            
            try {
                await this.pixelCPU.loadBrick(brickUrl);
            } catch (e) {
                console.log('⚠️  Brick file not found, extracting from RTS...');
                await this.extractAndLoadFromRTS();
            }
            
            // Create execution loop
            this.startExecutionLoop();
            
            // Show boot overlay
            this.showBootOverlay();
            
        } catch (error) {
            console.error('❌ Failed to boot kernel:', error);
            this.isExecuting = false;
        }
    }
    
    /**
     * Extract pixel data from RTS image and load into CPU
     */
    async extractAndLoadFromRTS() {
        console.log('🖼️  Extracting instructions from RTS image...');
        
        // Get pixel data from the loaded texture
        const texture = this.kernelTile.texture;
        const canvas = document.createElement('canvas');
        canvas.width = texture.width;
        canvas.height = texture.height;
        const ctx = canvas.getContext('2d');
        
        // Draw the texture to canvas
        ctx.drawImage(texture.source.resource, 0, 0);
        
        // Get pixel data
        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const pixels = imageData.data;
        
        // Convert RGBA pixels to 32-bit instructions
        // Format: R=Opcode, G=rd, B=rs1, A=rs2
        this.pixelCPU.memory = [];
        
        for (let i = 0; i < pixels.length; i += 4) {
            const r = pixels[i];     // Opcode
            const g = pixels[i + 1]; // rd
            const b = pixels[i + 2]; // rs1
            const a = pixels[i + 3]; // rs2
            
            const instruction = r | (g << 8) | (b << 16) | (a << 24);
            this.pixelCPU.memory.push(instruction);
        }
        
        console.log(`✅ Extracted ${this.pixelCPU.memory.length} instructions`);
        
        // Set entry point
        this.pixelCPU.pc = 0;
    }
    
    /**
     * Start the kernel execution loop
     */
    startExecutionLoop() {
        const executeFrame = () => {
            if (!this.isExecuting || this.pixelCPU.halted) {
                this.onExecutionComplete();
                return;
            }
            
            // Execute multiple cycles per frame for performance
            const cyclesPerFrame = 1000;
            
            for (let i = 0; i < cyclesPerFrame && !this.pixelCPU.halted; i++) {
                this.executeOneInstruction();
            }
            
            this.executionStats.cycles += cyclesPerFrame;
            
            // Update display
            this.updateFramebuffer();
            
            // Continue next frame
            requestAnimationFrame(executeFrame);
        };
        
        requestAnimationFrame(executeFrame);
    }
    
    /**
     * Execute a single instruction
     */
    executeOneInstruction() {
        if (this.pixelCPU.pc >= this.pixelCPU.memory.length) {
            this.pixelCPU.halted = true;
            return;
        }
        
        const inst = this.pixelCPU.memory[this.pixelCPU.pc];
        const opcode = inst & 0xFF;
        const dest = (inst >> 8) & 0xFF;
        const src1 = (inst >> 16) & 0xFF;
        const src2 = (inst >> 24) & 0xFF;
        
        // Execute based on opcode
        switch (opcode) {
            case 0: // NOP
                break;
                
            case 2: // ADD
                this.pixelCPU.registers[dest] = 
                    this.pixelCPU.registers[src1] + this.pixelCPU.registers[src2];
                break;
                
            case 3: // SUB
                this.pixelCPU.registers[dest] = 
                    this.pixelCPU.registers[src1] - this.pixelCPU.registers[src2];
                break;
                
            case 19: // SYSCALL
                this.handleSyscall();
                break;
                
            case 255: // HALT
                this.pixelCPU.halted = true;
                break;
                
            default:
                // Unknown opcode - skip
                break;
        }
        
        this.pixelCPU.pc++;
        this.executionStats.instructions++;
    }
    
    /**
     * Handle Linux syscalls
     */
    handleSyscall() {
        const syscallNum = this.pixelCPU.registers[17]; // a7
        const arg0 = this.pixelCPU.registers[10]; // a0
        const arg1 = this.pixelCPU.registers[11]; // a1
        const arg2 = this.pixelCPU.registers[12]; // a2
        
        switch (syscallNum) {
            case 64: // sys_write
                if (arg0 === 1) { // stdout
                    // arg1 = buffer address, arg2 = count
                    // Would read from memory and output to console
                }
                break;
                
            case 93: // sys_exit
                console.log(`🐧 Kernel exited with code ${arg0}`);
                this.pixelCPU.halted = true;
                break;
        }
    }
    
    /**
     * Update the framebuffer display
     */
    updateFramebuffer() {
        // Update the kernel tile with execution status
        if (this.kernelTile && this.kernelTile.label) {
            const elapsed = Date.now() - this.executionStats.startTime;
            const mips = this.executionStats.instructions / (elapsed / 1000) / 1000000;
            
            this.kernelTile.label.text = 
                `🐧 Linux Kernel\n` +
                `Cycles: ${this.executionStats.cycles.toLocaleString()}\n` +
                `MIPS: ${mips.toFixed(2)}`;
        }
    }
    
    /**
     * Show boot overlay UI
     */
    showBootOverlay() {
        const overlay = document.createElement('div');
        overlay.id = 'linux-boot-overlay';
        overlay.style.cssText = `
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.9);
            color: #00FF00;
            padding: 20px;
            border-radius: 10px;
            font-family: monospace;
            z-index: 1000;
            min-width: 400px;
        `;
        
        overlay.innerHTML = `
            <h3>🐧 Linux Kernel Booting...</h3>
            <div id="boot-status">Initializing...</div>
            <pre id="boot-console" style="
                background: #000;
                color: #0F0;
                padding: 10px;
                height: 200px;
                overflow-y: auto;
                font-size: 12px;
            "></pre>
            <button onclick="this.parentElement.remove()">Close</button>
        `;
        
        document.body.appendChild(overlay);
        
        // Update console periodically
        const updateConsole = () => {
            if (!this.isExecuting) return;
            
            const console = document.getElementById('boot-console');
            if (console) {
                console.textContent = this.consoleBuffer.slice(-100).join('');
                console.scrollTop = console.scrollHeight;
            }
            
            const status = document.getElementById('boot-status');
            if (status) {
                status.textContent = 
                    `Cycles: ${this.executionStats.cycles.toLocaleString()} | ` +
                    `PC: 0x${this.pixelCPU.pc.toString(16).padStart(8, '0')}`;
            }
            
            requestAnimationFrame(updateConsole);
        };
        
        requestAnimationFrame(updateConsole);
    }
    
    /**
     * Handle execution completion
     */
    onExecutionComplete() {
        this.isExecuting = false;
        const elapsed = Date.now() - this.executionStats.startTime;
        
        console.log('✅ Kernel execution complete');
        console.log(`   Total cycles: ${this.executionStats.cycles.toLocaleString()}`);
        console.log(`   Instructions: ${this.executionStats.instructions.toLocaleString()}`);
        console.log(`   Time: ${(elapsed / 1000).toFixed(2)}s`);
        console.log(`   MIPS: ${(this.executionStats.instructions / (elapsed / 1000) / 1000000).toFixed(2)}`);
        
        // Update tile to show completion
        if (this.kernelTile) {
            const label = this.kernelTile.container.children[1];
            if (label) {
                label.text = '🐧 Linux Kernel\n(Halted)';
                label.style.fill = 0xFFAA00;
            }
        }
    }
    
    /**
     * Stop kernel execution
     */
    stop() {
        this.isExecuting = false;
        console.log('🛑 Kernel execution stopped');
    }
}

// Export for use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { LinuxKernelLoader };
}
