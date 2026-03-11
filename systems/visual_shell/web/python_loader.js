/**
 * Geometry OS: Python Transmutation Loader (Phase 31 - Task 3)
 *
 * Handles drag-and-drop of Python scripts, converts them to RISC-V binaries,
 * and renders them as executable tiles on the Infinite Map.
 *
 * Pipeline:
 *   .py file drop → Backend transmutation → .rts.png → Map tile placement
 *
 * @module python_loader
 */

class PythonTransmutationLoader {
    /**
     * Initialize the Python transmutation loader.
     * @param {InfiniteMap} map - The InfiniteMap instance for tile placement
     * @param {Object} config - Configuration options
     */
    constructor(map, config = {}) {
        this.map = map;
        this.config = {
            transmutationEndpoint: '/api/transmute/python',
            chunkSize: 1024 * 1024, // 1MB chunks for large files
            timeout: 30000, // 30 second timeout
            autoPlace: true, // Automatically place tile on map
            defaultTileType: 'scaffold', // Visual type for Python tiles
            ...config
        };

        // Track active transmutations
        this.activeTransmutations = new Map();

        // Default metadata for Python tiles
        this.defaultMetadata = {
            type: 'python_transmuted',
            arch: 'riscv32',
            source: 'python-script',
            category: 'compute'
        };

        console.log('🐍 PythonTransmutationLoader initialized');
    }

    /**
     * Handle Python file dropped on the map.
     * @param {File} file - The Python file that was dropped
     * @param {Object} dropPosition - {x, y} world coordinates where file was dropped
     * @returns {Promise<Object>} - Result of transmutation
     */
    async handleDrop(file, dropPosition = null) {
        // Validate file extension
        if (!file.name.endsWith('.py')) {
            console.warn(`⚠️  Not a Python file: ${file.name}`);
            throw new Error(`Expected .py file, got: ${file.name}`);
        }

        console.log(`🐍 Python file dropped: ${file.name}`);
        console.log(`   Size: ${(file.size / 1024).toFixed(2)} KB`);

        try {
            // Show loading indicator
            this.showTransmutationProgress(file.name, 'starting');

            // Step 1: Read Python source
            const pythonSource = await this.readFile(file);
            console.log(`   Read ${pythonSource.length} characters of Python code`);

            // Step 2: Transmute to RISC-V binary
            this.showTransmutationProgress(file.name, 'transpiling');
            const transmutationResult = await this.transmutePython(pythonSource, file.name);

            // Step 3: Place tile on map
            if (this.config.autoPlace && dropPosition) {
                this.showTransmutationProgress(file.name, 'placing');
                await this.placeTileOnMap(transmutationResult, dropPosition, file.name);
            }

            this.showTransmutationProgress(file.name, 'complete');
            console.log(`✅ Python transmutation complete: ${file.name}`);

            return transmutationResult;

        } catch (error) {
            console.error(`❌ Python transmutation failed: ${file.name}`, error);
            this.showTransmutationError(file.name, error.message);
            throw error;
        }
    }

    /**
     * Read file content as text.
     * @param {File} file - File to read
     * @returns {Promise<string>} - File content
     */
    async readFile(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = (e) => resolve(e.target.result);
            reader.onerror = (e) => reject(new Error(`Failed to read file: ${e}`));
            reader.readAsText(file);
        });
    }

    /**
     * Transmute Python source to RISC-V binary via backend service.
     * @param {string} pythonSource - Python source code
     * @param {string} filename - Original filename
     * @returns {Promise<Object>} - Transmutation result with binary data
     */
    async transmutePython(pythonSource, filename) {
        const transmutationId = `transmute_${Date.now()}`;
        this.activeTransmutations.set(transmutationId, {
            filename,
            startTime: Date.now(),
            status: 'transpiling'
        });

        try {
            // In browser environment, we need a backend service
            // For now, we'll implement client-side fallback for simple cases

            // Try backend first
            try {
                const result = await this.transmuteViaBackend(pythonSource, filename);
                this.activeTransmutations.set(transmutationId, {
                    ...this.activeTransmutations.get(transmutationId),
                    status: 'complete',
                    method: 'backend'
                });
                return result;
            } catch (backendError) {
                console.warn('Backend transmutation failed, falling back to client-side:', backendError);
                // Fall through to client-side
            }

            // Client-side fallback (basic subset of Python)
            const result = await this.transmuteClientSide(pythonSource, filename);
            this.activeTransmutations.set(transmutationId, {
                ...this.activeTransmutations.get(transmutationId),
                status: 'complete',
                method: 'client-side'
            });

            return result;

        } finally {
            // Clean up old transmutations
            setTimeout(() => {
                this.activeTransmutations.delete(transmutationId);
            }, 60000); // Keep for 1 minute
        }
    }

    /**
     * Transmute Python via backend service.
     * @param {string} pythonSource - Python source code
     * @param {string} filename - Original filename
     * @returns {Promise<Object>} - Transmutation result
     */
    async transmuteViaBackend(pythonSource, filename) {
        const payload = {
            source: pythonSource,
            filename: filename,
            options: {
                output_format: 'png',
                hilbert_mapping: true,
                metadata_embedding: true
            }
        };

        const response = await fetch(this.config.transmutationEndpoint, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Backend error (${response.status}): ${errorText}`);
        }

        const result = await response.json();

        // Validate response
        if (!result.success) {
            throw new Error(result.error || 'Transmutation failed');
        }

        return {
            method: 'backend',
            binaryUrl: result.binary_url,
            imageUrl: result.image_url,
            metadata: result.metadata,
            assembly: result.assembly
        };
    }

    /**
     * Client-side Python transmutation (fallback).
     * This implements a very basic subset of Python for demo purposes.
     * @param {string} pythonSource - Python source code
     * @param {string} filename - Original filename
     * @returns {Promise<Object>} - Mock transmutation result
     */
    async transmuteClientSide(pythonSource, filename) {
        // This is a simplified fallback that creates a placeholder tile
        // In production, this would use a WebAssembly-based Python transpiler

        console.log('[*] Using client-side transmutation fallback');

        // Analyze the Python code
        const analysis = this.analyzePythonCode(pythonSource);

        // Create a mock binary result
        const result = {
            method: 'client-side-fallback',
            filename: filename,
            metadata: {
                ...this.defaultMetadata,
                name: filename.replace('.py', ''),
                description: `Python script: ${analysis.summary}`,
                lines: analysis.lineCount,
                functions: analysis.functions.length,
                complexity: analysis.complexity
            }
        };

        // For now, create a simple visualization texture
        result.imageUrl = await this.createPlaceholderTexture(result.metadata);

        return result;
    }

    /**
     * Analyze Python code to extract metadata.
     * @param {string} source - Python source code
     * @returns {Object} - Analysis results
     */
    analyzePythonCode(source) {
        const lines = source.split('\n');

        // Extract functions
        const functions = [];
        const functionRegex = /^def\s+(\w+)\s*\((.*?)\)/;
        lines.forEach((line, index) => {
            const match = line.match(functionRegex);
            if (match) {
                functions.push({
                    name: match[1],
                    args: match[2],
                    line: index + 1
                });
            }
        });

        // Extract docstrings/comments
        const comments = [];
        lines.forEach((line, index) => {
            if (line.trim().startsWith('#')) {
                comments.push({
                    text: line.trim(),
                    line: index + 1
                });
            }
        });

        // Calculate complexity (very rough heuristic)
        const complexity = Math.min(1.0, (
            functions.length * 0.1 +
            (source.match(/\bif\b/g) || []).length * 0.05 +
            (source.match(/\bwhile\b/g) || []).length * 0.1 +
            (source.match(/\bfor\b/g) || []).length * 0.05
        ));

        // Generate summary
        let summary = 'Python script';
        if (functions.length > 0) {
            summary = `Python functions: ${functions.map(f => f.name).join(', ')}`;
        }
        if (comments.length > 0) {
            const firstComment = comments[0].text.replace('#', '').trim();
            if (firstComment.length > 5 && firstComment.length < 50) {
                summary = firstComment;
            }
        }

        return {
            lineCount: lines.length,
            functions,
            comments,
            complexity,
            summary: summary.substring(0, 50)
        };
    }

    /**
     * Create a placeholder texture for client-side transmutation.
     * @param {Object} metadata - Tile metadata
     * @returns {Promise<string>} - Data URL of texture
     */
    async createPlaceholderTexture(metadata) {
        // Create a simple canvas-based texture
        const canvas = document.createElement('canvas');
        canvas.width = 128;
        canvas.height = 128;
        const ctx = canvas.getContext('2d');

        // Background gradient based on complexity
        const hue = 200 + (metadata.complexity || 0) * 60; // Blue to purple
        const gradient = ctx.createLinearGradient(0, 0, 128, 128);
        gradient.addColorStop(0, `hsl(${hue}, 70%, 50%)`);
        gradient.addColorStop(1, `hsl(${hue}, 70%, 30%)`);
        ctx.fillStyle = gradient;
        ctx.fillRect(0, 0, 128, 128);

        // Add Python logo-ish elements
        ctx.strokeStyle = 'rgba(255, 255, 255, 0.3)';
        ctx.lineWidth = 2;
        ctx.beginPath();
        ctx.moveTo(20, 20);
        ctx.lineTo(108, 20);
        ctx.lineTo(108, 108);
        ctx.lineTo(20, 108);
        ctx.closePath();
        ctx.stroke();

        // Text label
        ctx.fillStyle = 'white';
        ctx.font = 'bold 14px monospace';
        ctx.textAlign = 'center';
        ctx.fillText('🐍', 64, 55);

        ctx.font = '10px monospace';
        const name = metadata.name || 'Python';
        ctx.fillText(name.substring(0, 12), 64, 80);

        return canvas.toDataURL('image/png');
    }

    /**
     * Place transmuted tile on the Infinite Map.
     * @param {Object} transmutationResult - Result from transmutation
     * @param {Object} position - {x, y} world coordinates
     * @param {string} filename - Original filename
     */
    async placeTileOnMap(transmutationResult, position, filename) {
        // Calculate grid coordinates from world position
        const gridSize = this.map.config.gridSize;
        const gridX = Math.floor(position.x / gridSize);
        const gridY = Math.floor(position.y / gridSize);

        console.log(`📍 Placing tile at grid coordinates: (${gridX}, ${gridY})`);

        // Compose tile metadata
        const tileMetadata = {
            ...this.defaultMetadata,
            ...transmutationResult.metadata,
            name: filename.replace('.py', ''),
            source_file: filename,
            transmutation_method: transmutationResult.method,
            status: 'transmuted',
            timestamp: Date.now()
        };

        // Place tile using map's writeTile API
        await this.map.writeTile(
            gridX,
            gridY,
            this.config.defaultTileType,
            tileMetadata
        );

        console.log(`✅ Tile placed: ${filename} → (${gridX}, ${gridY})`);
    }

    /**
     * Show transmutation progress indicator.
     * @param {string} filename - File being transmuted
     * @param {string} status - Current status
     */
    showTransmutationProgress(filename, status) {
        const statusMessages = {
            'starting': `🐍 Starting Python transmutation: ${filename}`,
            'transpiling': `⚙️  Transpiling Python to RISC-V: ${filename}`,
            'linking': `🔗 Linking binary to pixels: ${filename}`,
            'placing': `📍 Placing tile on map: ${filename}`,
            'complete': `✅ Complete: ${filename}`
        };

        const message = statusMessages[status] || `${status}: ${filename}`;
        console.log(message);

        // Dispatch custom event for UI components to handle
        const event = new CustomEvent('python-transmutation-progress', {
            detail: { filename, status, message }
        });
        window.dispatchEvent(event);
    }

    /**
     * Show transmutation error.
     * @param {string} filename - File that failed
     * @param {string} error - Error message
     */
    showTransmutationError(filename, error) {
        console.error(`❌ Transmutation error for ${filename}:`, error);

        // Dispatch custom event for UI components to handle
        const event = new CustomEvent('python-transmutation-error', {
            detail: { filename, error }
        });
        window.dispatchEvent(event);
    }

    /**
     * Get active transmutations.
     * @returns {Array} - List of active transmutations
     */
    getActiveTransmutations() {
        return Array.from(this.activeTransmutations.entries()).map(([id, data]) => ({
            id,
            ...data
        }));
    }

    /**
     * Cancel an active transmutation.
     * @param {string} transmutationId - ID of transmutation to cancel
     */
    cancelTransmutation(transmutationId) {
        const transmutation = this.activeTransmutations.get(transmutationId);
        if (transmutation) {
            this.activeTransmutations.set(transmutationId, {
                ...transmutation,
                status: 'cancelled'
            });
            console.log(`🛑 Transmutation cancelled: ${transmutation.filename}`);
        }
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PythonTransmutationLoader = PythonTransmutationLoader;
}

// Export for Node.js/CommonJS
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { PythonTransmutationLoader };
}

/**
 * Usage Example:
 *
 * // In application.js or infinite_map.js
 * const pythonLoader = new PythonTransmutationLoader(infiniteMap);
 *
 * // In drag-drop handler
 * if (file.name.endsWith('.py')) {
 *     await pythonLoader.handleDrop(file, { x: event.clientX, y: event.clientY });
 * }
 */
