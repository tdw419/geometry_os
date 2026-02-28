/**
 * Geometry OS: Linux Cartridge
 *
 * Converts an entire Linux environment (Kernel + Initrd)
 * into a multi-gigapixel Resonance Texture that can be
 * loaded as a visual cartridge.
 *
 * Architecture:
 * - KernelLoader: Parse and load Linux kernel (vmlinux/bzImage)
 * - InitrdBuilder: Create initial ramdisk from filesystem
 * - ResonanceEncoder: Convert binary to visual texture
 * - CartridgeBoot: Boot sequence coordinator
 *
 * Epoch 4: The Cartridge Ecosystem
 */

import { WasmHypervisor } from './WasmHypervisor.js';

// ============================================
// CONSTANTS
// ============================================

const KERNEL_LOAD_ADDR = 0x80000000;
const INITRD_LOAD_ADDR = 0x84000000;
const DTB_LOAD_ADDR = 0x88000000;
const CMDLINE_ADDR = 0x8000;

const DEFAULT_CMDLINE = 'console=ttyS0 root=/dev/ram0 rw';

// ============================================
// KERNEL LOADER
// ============================================

export class KernelLoader {
    /**
     * Parse and load Linux kernel binary.
     */
    constructor() {
        this.kernelInfo = null;
        this.entryPoint = 0;
    }

    /**
     * Parse ELF header to get entry point and segments.
     * @param {ArrayBuffer} data - Kernel binary
     * @returns {Object} Kernel info
     */
    parseElf(data) {
        const view = new DataView(data);

        // ELF magic
        const magic = view.getUint32(0, true);
        if (magic !== 0x464C457F) {
            throw new Error('Not an ELF file');
        }

        // ELF class (32 or 64 bit)
        const elfClass = view.getUint8(4);
        const is64Bit = elfClass === 2;

        // Entry point
        let entryPoint;
        if (is64Bit) {
            entryPoint = Number(view.getBigUint64(24, true));
        } else {
            entryPoint = view.getUint32(24, true);
        }

        // Program headers
        let phOffset, phEntrySize, phCount;
        if (is64Bit) {
            phOffset = Number(view.getBigUint64(32, true));
            phEntrySize = view.getUint16(54, true);
            phCount = view.getUint16(56, true);
        } else {
            phOffset = view.getUint32(28, true);
            phEntrySize = view.getUint16(42, true);
            phCount = view.getUint16(44, true);
        }

        // Parse segments
        const segments = [];
        for (let i = 0; i < phCount; i++) {
            const offset = phOffset + i * phEntrySize;

            let pType, pFlags, pOffset, pVaddr, pFilesz, pMemsz;

            if (is64Bit) {
                pType = view.getUint32(offset, true);
                pFlags = view.getUint32(offset + 4, true);
                pOffset = Number(view.getBigUint64(offset + 8, true));
                pVaddr = Number(view.getBigUint64(offset + 16, true));
                pFilesz = Number(view.getBigUint64(offset + 32, true));
                pMemsz = Number(view.getBigUint64(offset + 40, true));
            } else {
                pType = view.getUint32(offset, true);
                pOffset = view.getUint32(offset + 4, true);
                pVaddr = view.getUint32(offset + 8, true);
                pFilesz = view.getUint32(offset + 16, true);
                pMemsz = view.getUint32(offset + 20, true);
                pFlags = view.getUint32(offset + 24, true);
            }

            // PT_LOAD = 1
            if (pType === 1) {
                segments.push({
                    type: pType,
                    flags: pFlags,
                    offset: pOffset,
                    vaddr: pVaddr,
                    filesz: pFilesz,
                    memsz: pMemsz,
                    data: new Uint8Array(data, pOffset, pFilesz)
                });
            }
        }

        this.kernelInfo = {
            is64Bit,
            entryPoint,
            segments
        };

        this.entryPoint = entryPoint;

        return this.kernelInfo;
    }

    /**
     * Load kernel into memory.
     * @param {WasmMemory} memory - Target memory
     * @param {Object} kernelInfo - Parsed kernel info
     */
    loadIntoMemory(memory, kernelInfo = this.kernelInfo) {
        if (!kernelInfo) {
            throw new Error('No kernel parsed');
        }

        for (const segment of kernelInfo.segments) {
            const baseAddr = segment.vaddr - KERNEL_LOAD_ADDR;

            // Copy segment data
            for (let i = 0; i < segment.filesz; i++) {
                memory.store8(baseAddr + i, segment.data[i]);
            }

            // Zero-fill BSS (memsz > filesz)
            for (let i = segment.filesz; i < segment.memsz; i++) {
                memory.store8(baseAddr + i, 0);
            }
        }

        console.log(`[KernelLoader] Loaded ${kernelInfo.segments.length} segments, entry=0x${this.entryPoint.toString(16)}`);
    }

    /**
     * Get entry point address.
     */
    getEntryPoint() {
        return this.entryPoint;
    }
}

// ============================================
// INITRD BUILDER
// ============================================

export class InitrdBuilder {
    /**
     * Build initial ramdisk for Linux boot.
     */
    constructor() {
        this.files = new Map();
        this.compression = 'gzip';  // gzip, lzma, none
    }

    /**
     * Add a file to the initrd.
     * @param {string} path - File path (e.g., '/init')
     * @param {Uint8Array|string} content - File content
     * @param {number} mode - File mode (permissions)
     */
    addFile(path, content, mode = 0o755) {
        const data = typeof content === 'string'
            ? new TextEncoder().encode(content)
            : content;

        this.files.set(path, { data, mode, type: 'file' });
        return this;
    }

    /**
     * Add a directory to the initrd.
     * @param {string} path - Directory path
     * @param {number} mode - Directory mode
     */
    addDirectory(path, mode = 0o755) {
        this.files.set(path, { data: null, mode, type: 'directory' });
        return this;
    }

    /**
     * Add symlink.
     * @param {string} path - Symlink path
     * @param {string} target - Symlink target
     */
    addSymlink(path, target) {
        this.files.set(path, { data: new TextEncoder().encode(target), mode: 0o777, type: 'symlink' });
        return this;
    }

    /**
     * Create minimal initrd for testing.
     */
    createMinimal() {
        // Basic directory structure
        this.addDirectory('/dev', 0o755);
        this.addDirectory('/proc', 0o755);
        this.addDirectory('/sys', 0o755);
        this.addDirectory('/bin', 0o755);
        this.addDirectory('/sbin', 0o755);
        this.addDirectory('/etc', 0o755);

        // Init script
        this.addFile('/init', `#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
echo "Geometry OS Linux Cartridge"
echo "============================"
exec /bin/sh
`, 0o755);

        // Minimal /etc
        this.addFile('/etc/passwd', 'root:x:0:0:root:/root:/bin/sh\n');
        this.addFile('/etc/group', 'root:x:0:\n');

        return this;
    }

    /**
     * Build cpio archive (newc format).
     * @returns {Uint8Array} CPIO archive
     */
    buildCpio() {
        const chunks = [];

        for (const [path, entry] of this.files) {
            const name = path.startsWith('/') ? path.slice(1) : path;
            const nameBytes = new TextEncoder().encode(name);

            // CPIO header (newc format)
            const header = this._formatCpioHeader(nameBytes, entry);
            chunks.push(header);
            chunks.push(nameBytes);

            // Pad to 4-byte boundary
            const padLen = (4 - ((header.length + nameBytes.length) % 4)) % 4;
            if (padLen > 0) {
                chunks.push(new Uint8Array(padLen));
            }

            // File data
            if (entry.data) {
                chunks.push(entry.data);

                // Pad data to 4-byte boundary
                const dataPad = (4 - (entry.data.length % 4)) % 4;
                if (dataPad > 0) {
                    chunks.push(new Uint8Array(dataPad));
                }
            }
        }

        // Trailer
        const trailer = this._formatCpioHeader(new TextEncoder().encode('TRAILER!!!'), { data: null, mode: 0 });
        chunks.push(trailer);
        chunks.push(new TextEncoder().encode('TRAILER!!!'));

        // Combine chunks
        const totalLen = chunks.reduce((sum, c) => sum + c.length, 0);
        const result = new Uint8Array(totalLen);
        let offset = 0;

        for (const chunk of chunks) {
            result.set(chunk, offset);
            offset += chunk.length;
        }

        return result;
    }

    _formatCpioHeader(name, entry) {
        const mode = entry.type === 'directory' ? (entry.mode | 0o040000) :
                     entry.type === 'symlink' ? (entry.mode | 0o120000) :
                     (entry.mode | 0o100000);
        const fileSize = entry.data ? entry.data.length : 0;

        // newc format header (110 bytes)
        const header = [
            '070701',  // Magic
            '00000000',  // inode
            mode.toString(16).padStart(8, '0'),  // mode
            '00000000',  // uid
            '00000000',  // gid
            '00000001',  // nlink
            '00000000',  // mtime
            fileSize.toString(16).padStart(8, '0'),  // filesize
            '00000000',  // devmajor
            '00000000',  // devminor
            '00000000',  // rdevmajor
            '00000000',  // rdevminor
            name.length.toString(16).padStart(8, '0'),  // namesize
            '00000000',  // check
        ].join('');

        return new TextEncoder().encode(header);
    }
}

// ============================================
// RESONANCE ENCODER
// ============================================

export class ResonanceEncoder {
    /**
     * Convert binary data to resonance texture.
     */
    constructor() {
        this.tileSize = 16;  // 16x16 glyph tiles
        this.atlasSize = 256; // 256x256 glyph atlas
    }

    /**
     * Encode binary to 2D glyph grid.
     * @param {Uint8Array} data - Binary data
     * @returns {Object} Grid dimensions and glyph data
     */
    encodeToGrid(data) {
        // Each glyph encodes 2 bytes (opcode + operand)
        const glyphCount = Math.ceil(data.length / 2);

        // Calculate grid dimensions (power of 2)
        const gridSize = Math.pow(2, Math.ceil(Math.log2(Math.sqrt(glyphCount))));

        const glyphs = [];

        for (let i = 0; i < glyphCount; i++) {
            const byteOffset = i * 2;
            const opcode = data[byteOffset] || 0;
            const operand = data[byteOffset + 1] || 0;

            // Map to atlas position
            const atlasX = opcode % 16;
            const atlasY = Math.floor(opcode / 16);

            const gridX = i % gridSize;
            const gridY = Math.floor(i / gridSize);

            glyphs.push({
                x: gridX,
                y: gridY,
                opcode,
                operand,
                atlasX,
                atlasY
            });
        }

        return {
            width: gridSize,
            height: Math.ceil(glyphCount / gridSize),
            glyphCount,
            totalBytes: data.length,
            glyphs
        };
    }

    /**
     * Generate PNG texture from grid.
     * @param {Object} grid - Glyph grid
     * @returns {ImageData} Image data for texture
     */
    generateTexture(grid) {
        const width = grid.width * this.tileSize;
        const height = grid.height * this.tileSize;

        const imageData = new ImageData(width, height);
        const pixels = imageData.data;

        for (const glyph of grid.glyphs) {
            const baseX = glyph.x * this.tileSize;
            const baseY = glyph.y * this.tileSize;

            // Draw glyph tile (simple visualization)
            for (let dy = 0; dy < this.tileSize; dy++) {
                for (let dx = 0; dx < this.tileSize; dx++) {
                    const px = baseX + dx;
                    const py = baseY + dy;
                    const idx = (py * width + px) * 4;

                    // Color based on opcode
                    pixels[idx] = glyph.opcode;
                    pixels[idx + 1] = glyph.operand;
                    pixels[idx + 2] = (glyph.atlasX << 4) | glyph.atlasY;
                    pixels[idx + 3] = 255;
                }
            }
        }

        return imageData;
    }

    /**
     * Decode glyph grid back to binary.
     * @param {Array} glyphs - Glyph array
     * @returns {Uint8Array} Binary data
     */
    decodeFromGrid(glyphs) {
        const data = new Uint8Array(glyphs.length * 2);

        for (let i = 0; i < glyphs.length; i++) {
            data[i * 2] = glyphs[i].opcode;
            data[i * 2 + 1] = glyphs[i].operand;
        }

        return data;
    }
}

// ============================================
// CARTRIDGE BOOT
// ============================================

export class CartridgeBoot {
    /**
     * Coordinate Linux boot sequence.
     */
    constructor(hypervisor) {
        this.hypervisor = hypervisor;
        this.kernelLoader = new KernelLoader();
        this.initrdBuilder = new InitrdBuilder();
        this.resonanceEncoder = new ResonanceEncoder();

        this.kernelGrid = null;
        this.initrdGrid = null;
        this.bootState = 'idle';  // idle, loading, ready, booting, running
    }

    /**
     * Prepare Linux cartridge from components.
     * @param {ArrayBuffer} kernel - Kernel binary
     * @param {Uint8Array} initrd - Initrd cpio (optional)
     */
    async prepare(kernel, initrd = null) {
        this.bootState = 'loading';

        // Parse kernel
        console.log('[CartridgeBoot] Parsing kernel...');
        const kernelInfo = this.kernelLoader.parseElf(kernel);

        // Encode kernel to resonance grid
        console.log('[CartridgeBoot] Encoding kernel to resonance...');
        const kernelBytes = new Uint8Array(kernel);
        this.kernelGrid = this.resonanceEncoder.encodeToGrid(kernelBytes);

        // Build or use initrd
        if (!initrd) {
            console.log('[CartridgeBoot] Building minimal initrd...');
            this.initrdBuilder.createMinimal();
            initrd = this.initrdBuilder.buildCpio();
        }

        // Encode initrd to resonance grid
        console.log('[CartridgeBoot] Encoding initrd to resonance...');
        this.initrdGrid = this.resonanceEncoder.encodeToGrid(initrd);

        this.bootState = 'ready';

        console.log(`[CartridgeBoot] Cartridge ready:`);
        console.log(`  Kernel: ${this.kernelGrid.glyphCount} glyphs (${this.kernelGrid.width}x${this.kernelGrid.height})`);
        console.log(`  Initrd: ${this.initrdGrid.glyphCount} glyphs (${this.initrdGrid.totalBytes} bytes)`);

        return {
            kernelGrid: this.kernelGrid,
            initrdGrid: this.initrdGrid,
            entryPoint: this.kernelLoader.getEntryPoint()
        };
    }

    /**
     * Boot the Linux cartridge.
     */
    async boot(cmdline = DEFAULT_CMDLINE) {
        if (this.bootState !== 'ready') {
            throw new Error('Cartridge not prepared');
        }

        this.bootState = 'booting';
        console.log(`[CartridgeBoot] Booting with cmdline: ${cmdline}`);

        // Set up hypervisor memory
        const memory = this.hypervisor.memory;

        // Load kernel (simulated - would use actual hypervisor)
        // this.kernelLoader.loadIntoMemory(memory, this.kernelLoader.kernelInfo);

        // Set up boot parameters
        // Store cmdline
        const cmdlineBytes = new TextEncoder().encode(cmdline);
        memory.storeBytes(CMDLINE_ADDR, cmdlineBytes);
        memory.store8(CMDLINE_ADDR + cmdlineBytes.length, 0);

        // Set up initrd pointer
        memory.store32(0x8000 + 256, INITRD_LOAD_ADDR);
        memory.store32(0x8000 + 260, this.initrdGrid.totalBytes);

        // Decode initrd and load
        const initrdData = this.resonanceEncoder.decodeFromGrid(this.initrdGrid.glyphs);
        memory.storeBytes(INITRD_LOAD_ADDR, initrdData);

        this.bootState = 'running';
        console.log('[CartridgeBoot] Boot sequence complete');

        return true;
    }

    /**
     * Get boot status.
     */
    getStatus() {
        return {
            state: this.bootState,
            kernelSize: this.kernelGrid?.totalBytes || 0,
            initrdSize: this.initrdGrid?.totalBytes || 0,
            kernelGlyphs: this.kernelGrid?.glyphCount || 0,
            initrdGlyphs: this.initrdGrid?.glyphCount || 0
        };
    }

    /**
     * Export cartridge as resonance texture.
     */
    exportTexture() {
        if (!this.kernelGrid || !this.initrdGrid) {
            throw new Error('No cartridge prepared');
        }

        const kernelTexture = this.resonanceEncoder.generateTexture(this.kernelGrid);
        const initrdTexture = this.resonanceEncoder.generateTexture(this.initrdGrid);

        return {
            kernel: kernelTexture,
            initrd: initrdTexture,
            metadata: {
                kernelWidth: this.kernelGrid.width,
                kernelHeight: this.kernelGrid.height,
                initrdWidth: this.initrdGrid.width,
                initrdHeight: this.initrdGrid.height,
                entryPoint: this.kernelLoader.getEntryPoint()
            }
        };
    }
}

// ============================================
// LINUX CARTRIDGE (MAIN CLASS)
// ============================================

export class LinuxCartridge {
    /**
     * Complete Linux-as-Cartridge implementation.
     */
    constructor(options = {}) {
        this.hypervisor = new WasmHypervisor(options);
        this.boot = new CartridgeBoot(this.hypervisor);

        this.cartridgeInfo = null;
        this.running = false;
    }

    /**
     * Load Linux from URL.
     * @param {string} kernelUrl - Kernel binary URL
     * @param {string} initrdUrl - Initrd URL (optional)
     */
    async loadFromUrl(kernelUrl, initrdUrl = null) {
        console.log(`[LinuxCartridge] Loading kernel from ${kernelUrl}`);

        const kernelResp = await fetch(kernelUrl);
        const kernelData = await kernelResp.arrayBuffer();

        let initrdData = null;
        if (initrdUrl) {
            console.log(`[LinuxCartridge] Loading initrd from ${initrdUrl}`);
            const initrdResp = await fetch(initrdUrl);
            initrdData = new Uint8Array(await initrdResp.arrayBuffer());
        }

        return this.load(kernelData, initrdData);
    }

    /**
     * Load Linux from binary data.
     * @param {ArrayBuffer} kernel - Kernel binary
     * @param {Uint8Array} initrd - Initrd data
     */
    async load(kernel, initrd = null) {
        this.cartridgeInfo = await this.boot.prepare(kernel, initrd);
        return this.cartridgeInfo;
    }

    /**
     * Start Linux.
     * @param {string} cmdline - Kernel command line
     */
    async start(cmdline = DEFAULT_CMDLINE) {
        if (!this.cartridgeInfo) {
            throw new Error('No cartridge loaded');
        }

        await this.boot.boot(cmdline);
        this.running = true;

        return this.hypervisor.start('linux');
    }

    /**
     * Create a demo/test cartridge.
     */
    async createDemo() {
        // Create minimal test "kernel" (just a simple RISC-V program)
        const testKernel = this._createTestKernel();

        // Create minimal initrd
        this.boot.initrdBuilder.createMinimal();
        const initrd = this.boot.initrdBuilder.buildCpio();

        // Encode as resonance
        this.boot.kernelGrid = this.resonanceEncoder.encodeToGrid(testKernel);
        this.boot.initrdGrid = this.resonanceEncoder.encodeToGrid(initrd);
        this.boot.bootState = 'ready';

        console.log('[LinuxCartridge] Demo cartridge created');
        return this.boot.getStatus();
    }

    _createTestKernel() {
        // Simple "kernel" that just prints hello and halts
        const program = [
            0x08800893,  // addi x17, x0, 64 (write syscall)
            0x00100513,  // addi x10, x0, 1 (stdout)
            0x00001597,  // auipc x11, 0
            0x01858593,  // addi x11, x11, 24 (msg addr)
            0x01000613,  // addi x12, x0, 16 (length)
            0x00000073,  // ecall
            0x05d00893,  // addi x17, x0, 93 (exit syscall)
            0x00000513,  // addi x10, x0, 0 (exit code)
            0x00000073,  // ecall
            0x6F6C6C65,  // "ello"
            0x694C206F,  // "o Li"
            0x000A7875   // "ux\n\0"
        ];

        const bytes = new Uint8Array(program.length * 4);
        const view = new DataView(bytes.buffer);
        for (let i = 0; i < program.length; i++) {
            view.setUint32(i * 4, program[i], true);
        }
        return bytes;
    }

    /**
     * Get cartridge status.
     */
    getStatus() {
        return {
            ...this.boot.getStatus(),
            running: this.running
        };
    }

    /**
     * Export as PNG textures.
     */
    exportTextures() {
        return this.boot.exportTexture();
    }

    get resonanceEncoder() {
        return this.boot.resonanceEncoder;
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        KernelLoader,
        InitrdBuilder,
        ResonanceEncoder,
        CartridgeBoot,
        LinuxCartridge,
        KERNEL_LOAD_ADDR,
        INITRD_LOAD_ADDR,
        DEFAULT_CMDLINE
    };
}
