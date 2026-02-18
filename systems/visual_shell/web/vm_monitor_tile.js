/**
 * VMMonitorTile.js
 * 
 * A specialized window for monitoring VM GUI streams (KVM/QEMU or WebGPU).
 * Connects to vision_bridge.py via WebSockets to show live vision-annotated feeds.
 */

class VMMonitorTile extends DesktopWindow {
    constructor(title, x, y, width, height, options = {}) {
        super(title, x, y, width, height);
        
        this.wsUrl = options.wsUrl || 'ws://localhost:8765';
        this.socket = null;
        this.reconnectTimer = null;
        this.hypervisor = options.hypervisor || null; // Attached WebGPU hypervisor
        
        // Content container
        this.content = new PIXI.Container();
        this.content.y = 30; // Below title bar
        this.frame.addChild(this.content);
        
        // Display Sprite (Live VM Pixels)
        this.displaySprite = new PIXI.Sprite(PIXI.Texture.EMPTY);
        this.displaySprite.width = width;
        this.displaySprite.height = height - 30;
        this.content.addChild(this.displaySprite);
        
        // Overlay Graphics (Vision Annotations)
        this.overlayGraphics = new PIXI.Graphics();
        this.content.addChild(this.overlayGraphics);
        
        // Semantic Labels
        this.labelContainer = new PIXI.Container();
        this.content.addChild(this.labelContainer);
        
        // Status indicator
        this.statusText = new PIXI.Text('DISCONNECTED', {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0xFF0000,
            fontWeight: 'bold'
        });
        this.statusText.x = 10;
        this.statusText.y = height - 50;
        this.content.addChild(this.statusText);

        // TTY/Console Overlay (for text output)
        this.consoleText = new PIXI.Text('', {
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00FF00,
            wordWrap: true,
            wordWrapWidth: width - 20
        });
        this.consoleText.x = 10;
        this.consoleText.y = 10;
        this.consoleText.visible = false;
        this.content.addChild(this.consoleText);

        // MMU / Trap HUD (for debugging)
        this.mmuHud = new PIXI.Text('', {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: 0xFFFFFF,
            backgroundColor: 0x000000,
            backgroundAlpha: 0.7
        });
        this.mmuHud.x = width - 200;
        this.mmuHud.y = 40;
        this.content.addChild(this.mmuHud);

        if (this.hypervisor) {
            this.statusText.text = 'WEBGPU HYPERVISOR ACTIVE';
            this.statusText.style.fill = 0x00FFFF;
            this._setupHypervisorIntegration();
            this.startHypervisorLoop();
        } else {
            this.connect();
        }
    }

    _setupHypervisorIntegration() {
        if (!this.hypervisor) return;

        // 1. Wire Console Output
        this.hypervisor.onConsoleOutput = (text) => {
            this.consoleText.visible = true;
            this.consoleText.text += text;
            
            // Auto-scroll/Limit lines (keep last 25 lines)
            const lines = this.consoleText.text.split('\n');
            if (lines.length > 25) {
                this.consoleText.text = lines.slice(-25).join('\n');
            }
        };

        // 2. Handle Focus for Input
        this.interactive = true;
        this.on('pointerdown', () => {
            console.log('[VMMonitor] Requesting input focus');
            if (this.hypervisor.inputHandler) {
                this.hypervisor.inputHandler.focus();
            }
        });
    }

    startHypervisorLoop() {
        const tick = async () => {
            if (!this.hypervisor) return;
            
            // Read framebuffer from hypervisor
            await this.hypervisor.render();
            
            // Get latest CPU state
            const cpuState = this.hypervisor.getState();
            
            // Periodic DTB check (every 60 frames)
            let dtbInfo = null;
            if (PIXI.Ticker.shared.count % 60 === 0) {
                dtbInfo = await this.hypervisor.getDTBInfo();
            }

            // Update texture from hypervisor's canvas
            if (this.hypervisor.display && this.hypervisor.display.canvas) {
                this.displaySprite.texture = PIXI.Texture.from(this.hypervisor.display.canvas);
                this.displaySprite.width = this.hitArea.width;
                this.displaySprite.height = this.hitArea.height - 30;
            }

            // Sync state to handleStateUpdate format
            this.handleStateUpdate({
                cpu_state: cpuState,
                dtb_info: dtbInfo
            });
            
            requestAnimationFrame(tick);
        };
        tick();
    }

    connect() {
        if (this.socket) {
            this.socket.close();
        }

        console.log(`[VMMonitor] Connecting to ${this.wsUrl}...`);
        this.socket = new WebSocket(this.wsUrl);

        this.socket.onopen = () => {
            console.log('[VMMonitor] Connected');
            this.statusText.text = 'LIVE STREAM ACTIVE';
            this.statusText.style.fill = 0x00FF00;
            if (this.reconnectTimer) {
                clearTimeout(this.reconnectTimer);
                this.reconnectTimer = null;
            }
        };

        this.socket.onmessage = (event) => {
            try {
                const data = JSON.parse(event.data);
                if (data.type === 'GUI_STATE_UPDATE') {
                    this.handleStateUpdate(data);
                }
            } catch (e) {
                console.error('[VMMonitor] Error parsing message:', e);
            }
        };

        this.socket.onclose = () => {
            console.warn('[VMMonitor] Connection closed');
            this.statusText.text = 'CONNECTION LOST - RECONNECTING...';
            this.statusText.style.fill = 0xFF8800;
            
            // Reconnect after 3 seconds
            if (!this.reconnectTimer) {
                this.reconnectTimer = setTimeout(() => this.connect(), 3000);
            }
        };

        this.socket.onerror = (err) => {
            console.error('[VMMonitor] WebSocket error:', err);
        };
    }

    handleStateUpdate(data) {
        // 1. Update Display (Screenshot)
        if (data.screenshot) {
            const image = new Image();
            image.src = data.screenshot;
            image.onload = () => {
                this.displaySprite.texture = PIXI.Texture.from(image);
                // Scale to fit window while preserving aspect ratio if desired, 
                // but here we just fill the container
                this.displaySprite.width = this.hitArea.width;
                this.displaySprite.height = this.hitArea.height - 30;
            };
        }

        // 2. Update Overlays (Bounding Boxes)
        this.overlayGraphics.clear();
        this.labelContainer.removeChildren();

        if (data.elements) {
            data.elements.forEach(el => {
                // Color based on type
                let color = 0x00FFFF; // Default cyan
                if (el.type === 'button') color = 0x00FF00;
                if (el.type === 'textfield') color = 0xFFFF00;
                if (el.focused) color = 0xFF00FF;

                // Scale coordinates from 1280x800 (bridge default) to window size
                const scaleX = this.displaySprite.width / 1280;
                const scaleY = this.displaySprite.height / 800;
                
                const x = el.x * scaleX;
                const y = el.y * scaleY;
                const w = (el.width || 50) * scaleX;
                const h = (el.height || 30) * scaleY;

                // Draw box
                this.overlayGraphics.lineStyle(2, color, 0.8);
                this.overlayGraphics.drawRect(x - w/2, y - h/2, w, h);

                // Add label
                const label = new PIXI.Text(el.label || el.type, {
                    fontFamily: 'Courier New',
                    fontSize: 10,
                    fill: color,
                    backgroundColor: 0x000000,
                    backgroundAlpha: 0.5
                });
                label.x = x - w/2;
                label.y = y - h/2 - 15;
                this.labelContainer.addChild(label);
            });
        }
        
        // 3. Update Window Title if available
        if (data.window_title && data.window_title !== 'Unknown') {
            if (this.titleText) {
                this.titleText.text = `VM MONITOR: ${data.window_title}`;
            }
        }

        // 4. Update MMU/Trap HUD
        if (data.cpu_state) {
            const state = data.cpu_state;
            const mmuMode = (state.satp >> 31) & 1 ? 'Sv32' : 'Bare';
            const privMode = state.mode === 1 ? 'Supervisor' : 'User';
            
            let hudText = `PC: 0x${state.pc.toString(16).padStart(8, '0')}\n`;
            hudText += `MODE: ${privMode}\n`;
            hudText += `MMU: ${mmuMode}\n`;
            
            if (state.scause !== 0) {
                hudText += `\n⚠️ TRAP DETECTED\n`;
                hudText += `CAUSE: ${state.scause}\n`;
                hudText += `TVAL: 0x${state.stval.toString(16).padStart(8, '0')}\n`;
                this.mmuHud.style.fill = 0xFF4444; // Red for traps
            } else {
                this.mmuHud.style.fill = 0x00FFFF; // Cyan for normal
            }
            
            this.mmuHud.text = hudText;
        }

        // 5. Update DTB Info in HUD
        if (data.dtb_info) {
            const dtb = data.dtb_info;
            const isMagicOk = dtb.magic === 0xd00dfeed;

            let dtbText = `\nDTB ADDR: 0x${dtb.address.toString(16).padStart(8, '0')}\n`;
            dtbText += `DTB MAGIC: ${isMagicOk ? '✅ VALID' : '❌ INVALID'}\n`;
            dtbText += `DTB SIZE: ${dtb.size} bytes\n`;

            this.mmuHud.text += dtbText;
        }

        // 6. Update SBI Info in HUD
        if (data.sbi_state) {
            const sbi = data.sbi_state;
            let sbiText = `\nSBI CALLS: ${sbi.call_count || 0}\n`;
            sbiText += `TIMER: ${sbi.timer_set ? 'SET' : 'IDLE'}\n`;
            if (sbi.last_eid !== undefined) {
                sbiText += `LAST EID: 0x${sbi.last_eid.toString(16)}\n`;
            }
            this.mmuHud.text += sbiText;
        }
    }

    destroy(options) {
        if (this.socket) {
            this.socket.close();
        }
        if (this.reconnectTimer) {
            clearTimeout(this.reconnectTimer);
        }
        super.destroy(options);
    }
}

// Global export
if (typeof window !== 'undefined') {
    window.VMMonitorTile = VMMonitorTile;
}
