/**
 * Geometry OS: Brick File Loader
 *
 * Implements V2BrickHeader parsing and brick file loading with
 * async fetch API, checksum validation, and progress indication.
 */

/**
 * BrickHeader structure
 * Version 1: 22 bytes
 * Version 2: 132 bytes
 */
class BrickHeader {
    /**
     * Parse BrickHeader from ArrayBuffer
     * @param {DataView} dataView - DataView containing the header
     * @returns {Object} - Parsed header object
     * @throws {Error} - If header is invalid
     */
    static parse(dataView) {
        if (dataView.byteLength < 5) {
            throw new Error(`Header too small: ${dataView.byteLength} bytes`);
        }

        // Read magic number
        // Check for "BRICK" (V1) or "BRCK" (V2)
        const magicBytes = new Uint8Array(dataView.buffer, dataView.byteOffset, 5);
        const magicStr = new TextDecoder().decode(magicBytes.slice(0, 5));

        if (magicStr.startsWith("BRICK")) {
            // Version 1 (22 bytes)
            if (dataView.byteLength < 22) {
                throw new Error(`Invalid V1 header size: ${dataView.byteLength} bytes (expected 22 bytes)`);
            }
            const version = dataView.getUint8(5);
            if (version !== 1) {
                throw new Error(`Unsupported brick version: ${version} for "BRICK" magic`);
            }

            const entryPoint = dataView.getUint32(6, true);
            const codeSize = dataView.getUint32(10, true);
            const dataSize = dataView.getUint32(14, true);
            const checksum = dataView.getUint32(18, true);

            return {
                magic: "BRICK",
                version: 1,
                entryPoint,
                instructionCount: codeSize / 4,
                codeSize,
                dataSize,
                checksum,
                headerSize: 22
            };
        } else if (magicStr.startsWith("BRCK")) {
            // Version 2 (132 bytes)
            if (dataView.byteLength < 132) {
                throw new Error(`Invalid V2 header size: ${dataView.byteLength} bytes (expected 132 bytes)`);
            }

            const magic = dataView.getUint32(0, true);
            const version = dataView.getUint32(4, true);
            if (version !== 2) {
                throw new Error(`Unsupported brick version: ${version} (expected 2)`);
            }

            const timestamp = dataView.getBigUint64(8, true);
            const instructionCount = Number(dataView.getBigUint64(16, true));
            const entryPoint = Number(dataView.getBigUint64(24, true));

            const metadataBytes = new Uint8Array(dataView.buffer, dataView.byteOffset + 32, 64);
            let metadata = null;
            try {
                let nullIndex = metadataBytes.indexOf(0);
                if (nullIndex === -1) nullIndex = metadataBytes.length;
                const metadataStr = new TextDecoder().decode(metadataBytes.slice(0, nullIndex));
                if (metadataStr.trim()) {
                    metadata = JSON.parse(metadataStr);
                }
            } catch (e) {
                console.warn('Failed to parse metadata:', e);
            }

            const checksum = dataView.getUint32(96, true);

            return {
                magic,
                version: 2,
                timestamp: Number(timestamp),
                instructionCount,
                entryPoint,
                metadata,
                checksum,
                headerSize: 132
            };
        } else {
            throw new Error(`Invalid magic number: ${magicStr}`);
        }
    }

    /**
     * Create BrickHeader from components
     * @param {Object} components - Header components
     * @param {number} version - Header version (1 or 2)
     * @returns {ArrayBuffer} - Header as ArrayBuffer
     */
    static create(components, version = 2) {
        if (version === 1) {
            const buffer = new ArrayBuffer(22);
            const view = new DataView(buffer);

            // Magic: "BRICK"
            const magicBytes = new TextEncoder().encode("BRICK");
            new Uint8Array(buffer, 0, 5).set(magicBytes);

            // Version: 1
            view.setUint8(5, 1);

            // Entry point
            view.setUint32(6, components.entryPoint || 0, true);

            // Code Size
            view.setUint32(10, (components.instructionCount || 0) * 4, true);

            // Data Size
            view.setUint32(14, components.dataSize || 0, true);

            // Checksum
            view.setUint32(18, components.checksum || 0, true);

            return buffer;
        } else {
            const buffer = new ArrayBuffer(132);
            const view = new DataView(buffer);

            // Magic: "BRCK" (0x4252434B)
            view.setUint32(0, 0x4252434B, true);

            // Version: 2
            view.setUint32(4, 2, true);

            // ... (rest of V2 header creation)
            view.setBigUint64(8, BigInt(components.timestamp || Date.now()), true);
            view.setBigUint64(16, BigInt(components.instructionCount || 0), true);
            view.setBigUint64(24, BigInt(components.entryPoint || 0), true);

            let metadataStr = '';
            if (components.metadata) {
                metadataStr = JSON.stringify(components.metadata);
            }
            const metadataBytes = new TextEncoder().encode(metadataStr);
            const metadataArray = new Uint8Array(buffer, 32, 64);
            metadataArray.fill(0);
            metadataArray.set(metadataBytes.slice(0, 64));

            view.setUint32(96, components.checksum || 0, true);

            return buffer;
        }
    }
}

/**
 * Simple CRC32 implementation for checksum validation
 */
class CRC32 {
    /**
     * Calculate CRC32 checksum
     * @param {Uint8Array} data - Data to checksum
     * @returns {number} - CRC32 checksum
     */
    static calculate(data) {
        let crc = 0xFFFFFFFF;

        for (let i = 0; i < data.length; i++) {
            crc ^= data[i];
            for (let j = 0; j < 8; j++) {
                if (crc & 1) {
                    crc = (crc >>> 1) ^ 0xEDB88320;
                } else {
                    crc >>>= 1;
                }
            }
        }

        return (crc ^ 0xFFFFFFFF) >>> 0;
    }
}

/**
 * Brick file loader with progress indication
 */
class BrickLoader {
    /**
     * Create a new BrickLoader instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            maxMemorySize: 1024 * 1024, // 1MB limit
            validateChecksum: true,
            onProgress: null, // Progress callback (loaded, total)
            ...config
        };
    }

    /**
     * Load a brick file from URL
     * @param {string} url - URL to the brick file
     * @returns {Promise<Object>} - Parsed brick data
     */
    async load(url) {
        console.log(`📦 Loading brick: ${url}`);

        try {
            // Fetch with progress tracking
            const response = await this.fetchWithProgress(url);

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const buffer = await response.arrayBuffer();
            const totalSize = buffer.byteLength;

            // Report progress (header parsing)
            this.reportProgress(22, totalSize, 'Parsing header...');

            // Parse header
            // Try 132 first, then 22 if failed or version says so
            let header;
            let headerSize;
            try {
                const headerView = new DataView(buffer, 0, Math.min(buffer.byteLength, 132));
                header = BrickHeader.parse(headerView);
                headerSize = header.headerSize;
            } catch (e) {
                console.error("Failed to parse header:", e);
                throw e;
            }

            console.log(`✓ Brick header parsed:`);
            console.log(`  Version: ${header.version}`);
            if (header.version === 2) {
                console.log(`  Timestamp: ${new Date(header.timestamp * 1000).toISOString()}`);
            }
            console.log(`  Instructions: ${header.instructionCount}`);
            console.log(`  Entry Point: 0x${header.entryPoint.toString(16).padStart(8, '0')}`);
            console.log(`  Checksum: 0x${header.checksum.toString(16).padStart(8, '0')}`);
            if (header.metadata) {
                console.log(`  Metadata:`, header.metadata);
            }

            // Validate instruction count
            if (header.instructionCount > this.config.maxMemorySize) {
                throw new Error(
                    `Brick file too large: ${header.instructionCount} instructions ` +
                    `(max ${this.config.maxMemorySize})`
                );
            }

            // Calculate expected size
            const expectedSize = headerSize + (header.instructionCount * 4);
            if (totalSize < expectedSize) {
                throw new Error(
                    `Brick file too small: ${totalSize} bytes ` +
                    `(expected ${expectedSize} bytes)`
                );
            }

            // Report progress (instruction loading)
            this.reportProgress(headerSize, totalSize, 'Loading instructions...');

            // Load instructions (after header)
            const instructionData = new Uint8Array(buffer, headerSize, header.instructionCount * 4);
            const instructions = [];

            for (let i = 0; i < header.instructionCount; i++) {
                const offset = i * 4;
                const instruction =
                    (instructionData[offset]) |
                    (instructionData[offset + 1] << 8) |
                    (instructionData[offset + 2] << 16) |
                    (instructionData[offset + 3] << 24);
                instructions.push(instruction >>> 0); // Ensure unsigned

                // Report progress periodically
                if (i % 1000 === 0) {
                    this.reportProgress(headerSize + offset, totalSize, 'Loading instructions...');
                }
            }

            // Report progress (checksum validation)
            this.reportProgress(totalSize - 100, totalSize, 'Validating checksum...');

            // Validate checksum if enabled
            if (this.config.validateChecksum) {
                const calculatedChecksum = CRC32.calculate(instructionData);
                if (calculatedChecksum !== header.checksum) {
                    console.warn(
                        `⚠ Checksum mismatch: expected 0x${header.checksum.toString(16).padStart(8, '0')}, ` +
                        `calculated 0x${calculatedChecksum.toString(16).padStart(8, '0')}`
                    );
                    // Don't throw error, just warn
                } else {
                    console.log(`✓ Checksum validated: 0x${header.checksum.toString(16).padStart(8, '0')}`);
                }
            }

            // Report completion
            this.reportProgress(totalSize, totalSize, 'Loading complete!');

            console.log(`✓ Loaded ${instructions.length} instructions from ${url}`);

            return {
                header,
                instructions,
                url
            };
        } catch (error) {
            console.error(`Failed to load brick file ${url}:`, error);
            throw error;
        }
    }

    /**
     * Fetch with progress tracking
     * @param {string} url - URL to fetch
     * @returns {Promise<Response>} - Fetch response
     */
    async fetchWithProgress(url) {
        // Check if running in Node.js and url is a local file path
        if (typeof process !== 'undefined' && !url.startsWith('http://') && !url.startsWith('https://')) {
            return this.fetchFile(url);
        }

        if (this.config.onProgress) {
            // Use fetch with ReadableStream for progress
            const response = await fetch(url);

            if (!response.ok) {
                return response;
            }

            const contentLength = response.headers.get('Content-Length');
            const total = contentLength ? parseInt(contentLength, 10) : null;

            const reader = response.body.getReader();
            const chunks = [];
            let receivedLength = 0;

            while (true) {
                const { done, value } = await reader.read();

                if (done) {
                    break;
                }

                chunks.push(value);
                receivedLength += value.length;

                if (total !== null) {
                    this.reportProgress(receivedLength, total, 'Downloading...');
                }
            }

            // Reconstruct response
            const blob = new Blob(chunks);
            return new Response(blob, {
                status: response.status,
                statusText: response.statusText,
                headers: response.headers
            });
        } else {
            // Simple fetch without progress
            return fetch(url);
        }
    }

    /**
     * Fetch local file (Node.js only)
     * @param {string} filePath - Path to local file
     * @returns {Promise<Response>} - Fetch response
     */
    async fetchFile(filePath) {
        const fs = require('fs');
        const path = require('path');

        // Resolve file path
        const resolvedPath = path.resolve(filePath);

        // Check if file exists
        if (!fs.existsSync(resolvedPath)) {
            throw new Error(`File not found: ${resolvedPath}`);
        }

        // Read file
        const buffer = fs.readFileSync(resolvedPath);

        // Report progress
        if (this.config.onProgress) {
            this.reportProgress(buffer.length, buffer.length, 'Loading...');
        }

        // Return as Response
        return new Response(buffer, {
            status: 200,
            statusText: 'OK',
            headers: {
                'Content-Length': buffer.length.toString()
            }
        });
    }

    /**
     * Report progress
     * @param {number} loaded - Bytes loaded
     * @param {number} total - Total bytes
     * @param {string} status - Status message
     */
    reportProgress(loaded, total, status) {
        if (this.config.onProgress) {
            const percentage = total > 0 ? Math.round((loaded / total) * 100) : 0;
            this.config.onProgress(loaded, total, percentage, status);
        }
    }

    /**
     * Create a brick file from instructions
     * @param {Array} instructions - Array of 32-bit instructions
     * @param {Object} metadata - Metadata object
     * @param {number} version - Header version (1 or 2)
     * @returns {ArrayBuffer} - Brick file as ArrayBuffer
     */
    createBrick(instructions, metadata = {}, version = 2) {
        // Create header
        const headerBuffer = BrickHeader.create({
            instructionCount: instructions.length,
            entryPoint: 0, // Default to 0
            metadata: metadata
        }, version);

        const headerSize = version === 1 ? 22 : 132;

        // Calculate instruction data
        const instructionData = new Uint8Array(instructions.length * 4);
        for (let i = 0; i < instructions.length; i++) {
            const inst = instructions[i] >>> 0; // Ensure unsigned
            instructionData[i * 4] = inst & 0xFF;
            instructionData[i * 4 + 1] = (inst >> 8) & 0xFF;
            instructionData[i * 4 + 2] = (inst >> 16) & 0xFF;
            instructionData[i * 4 + 3] = (inst >> 24) & 0xFF;
        }

        // Calculate checksum
        const checksum = CRC32.calculate(instructionData);

        // Update checksum in header
        const headerView = new DataView(headerBuffer);
        headerView.setUint32(96, checksum, true);

        // Combine header and instructions
        const brickBuffer = new Uint8Array(headerSize + instructionData.length);
        brickBuffer.set(new Uint8Array(headerBuffer), 0);
        brickBuffer.set(instructionData, headerSize);

        return brickBuffer.buffer;
    }
}

// Export for Node.js environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { BrickHeader, CRC32, BrickLoader };
}
