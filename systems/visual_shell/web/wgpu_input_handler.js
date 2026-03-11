/**
 * Geometry OS: WGPU Input Handler
 *
 * Captures keyboard/mouse events and writes them to the MMIO region
 * for Linux kernel input drivers.
 */

export class WGPUInputHandler {
    /**
     * @param {HTMLCanvasElement} canvas - Canvas to capture events from
     * @param {GPUDevice} device - WebGPU device
     * @param {GPUBuffer} memoryBuffer - System memory buffer
     * @param {string} kernelId - Kernel ID for gpuSystem reference
     */
    constructor(canvas, device, memoryBuffer, kernelId) {
        this.canvas = canvas;
        this.device = device;
        this.memoryBuffer = memoryBuffer;
        this.kernelId = kernelId;

        // Callbacks
        this.onCharacter = null;

        // MMIO offsets
        this.MMIO_BASE = 0x02000000;  // 32MB
        this.KEYBOARD_OFFSET = 0x0000;
        this.MOUSE_OFFSET = 0x1000;

        // Input queue for batching
        this.inputQueue = [];

        // Bind event listeners
        this._bindEvents();
    }

    _bindEvents() {
        // Make canvas focusable
        this.canvas.tabIndex = 0;

        this.canvas.addEventListener('keydown', (e) => this._onKeyDown(e));
        this.canvas.addEventListener('keyup', (e) => this._onKeyUp(e));
        this.canvas.addEventListener('mousemove', (e) => this._onMouseMove(e));
        this.canvas.addEventListener('mousedown', (e) => this._onMouseDown(e));
        this.canvas.addEventListener('mouseup', (e) => this._onMouseUp(e));

        // Prevent context menu on right-click
        this.canvas.addEventListener('contextmenu', (e) => e.preventDefault());
    }

    /**
     * Pack keyboard event to MMIO format
     */
    packKeyboard(event, pressed = true) {
        const scancode = this._keyToScancode(event.code);
        const modifiers =
            (event.shiftKey ? 1 : 0) |
            (event.ctrlKey ? 2 : 0) |
            (event.altKey ? 4 : 0) |
            (event.metaKey ? 8 : 0);

        return {
            type: 1,           // Keyboard
            scancode: scancode,
            pressed: pressed ? 1 : 0,
            modifiers: modifiers
        };
    }

    /**
     * Pack mouse event to MMIO format
     */
    packMouse(x, y, buttons) {
        return {
            type: 2,           // Mouse
            x: Math.max(0, Math.min(1023, x)),
            y: Math.max(0, Math.min(767, y)),
            buttons: buttons
        };
    }

    _onKeyDown(event) {
        // Handle character input
        if (this.onCharacter && event.key.length === 1) {
            this.onCharacter(event.key);
        }

        event.preventDefault();
        const packed = this.packKeyboard(event, true);
        this._writeKeyboard(packed);
    }

    _onKeyUp(event) {
        event.preventDefault();
        const packed = this.packKeyboard(event, false);
        this._writeKeyboard(packed);
    }

    _onMouseMove(event) {
        const rect = this.canvas.getBoundingClientRect();
        const x = Math.floor((event.clientX - rect.left) * (1024 / rect.width));
        const y = Math.floor((event.clientY - rect.top) * (768 / rect.height));

        const packed = this.packMouse(x, y, event.buttons);
        this._writeMouse(packed);
    }

    _onMouseDown(event) {
        this._onMouseMove(event);
    }

    _onMouseUp(event) {
        this._onMouseMove(event);
    }

    _writeKeyboard(packed) {
        // Write to MMIO: [type:8][scancode:16][pressed:1][modifiers:4][pad:3]
        const data = new Uint32Array([
            (packed.type << 24) |
            ((packed.scancode & 0xFFFF) << 8) |
            ((packed.pressed & 1) << 4) |
            (packed.modifiers & 0xF)
        ]);

        const address = this.MMIO_BASE + this.KEYBOARD_OFFSET;
        this.device.queue.writeBuffer(this.memoryBuffer, address, data);
    }

    _writeMouse(packed) {
        // Write to MMIO: [type:8][buttons:8][x:16][y:16][pad:16]
        const data = new Uint32Array([
            (packed.type << 24) |
            ((packed.buttons & 0xFF) << 16) |
            ((packed.x & 0x3FF) << 6) |
            ((packed.y >> 4) & 0x3F)
        ]);

        const data2 = new Uint32Array([packed.y & 0x3FF]);

        const address = this.MMIO_BASE + this.MOUSE_OFFSET;
        this.device.queue.writeBuffer(this.memoryBuffer, address, data);
        this.device.queue.writeBuffer(this.memoryBuffer, address + 4, data2);
    }

    /**
     * Map DOM code to scancode
     */
    _keyToScancode(code) {
        const map = {
            'KeyA': 30, 'KeyB': 48, 'KeyC': 46, 'KeyD': 32, 'KeyE': 18,
            'KeyF': 33, 'KeyG': 34, 'KeyH': 35, 'KeyI': 23, 'KeyJ': 36,
            'KeyK': 37, 'KeyL': 38, 'KeyM': 50, 'KeyN': 49, 'KeyO': 24,
            'KeyP': 25, 'KeyQ': 16, 'KeyR': 19, 'KeyS': 31, 'KeyT': 20,
            'KeyU': 22, 'KeyV': 47, 'KeyW': 17, 'KeyX': 45, 'KeyY': 21,
            'KeyZ': 44,
            'Digit0': 11, 'Digit1': 2, 'Digit2': 3, 'Digit3': 4, 'Digit4': 5,
            'Digit5': 6, 'Digit6': 7, 'Digit7': 8, 'Digit8': 9, 'Digit9': 10,
            'Space': 57, 'Enter': 28, 'Backspace': 14, 'Tab': 15,
            'Escape': 1, 'ArrowUp': 103, 'ArrowDown': 108,
            'ArrowLeft': 105, 'ArrowRight': 106
        };
        return map[code] || 0;
    }

    /**
     * Focus canvas for input
     */
    focus() {
        this.canvas.focus();
    }
}

if (typeof window !== 'undefined') {
    window.WGPUInputHandler = WGPUInputHandler;
}
