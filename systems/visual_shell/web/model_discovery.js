/**
 * ModelDiscovery - Auto-discover LLM models from LM Studio
 *
 * Provides:
 * - LM Studio model directory scanning
 * - GGUF file metadata extraction
 * - Auto-registration with ModelZooManager
 * - Browser-compatible discovery via file API
 *
 * Part of: Neural Heatmap Phase 2.1.3 - Model Zoo Expansion
 * @see docs/plans/2026-02-07-neural-heatmap-roadmap.md
 */

class ModelDiscovery {
    constructor(options = {}) {
        this.options = {
            lmStudioApiUrl: 'http://localhost:1234',
            lmStudioPath: '~/.lmstudio/models',
            cacheDuration: 3600000, // 1 hour
            storageKey: 'model_discovery_cache',
            ...options
        };

        this.discoveredModels = new Map();
        this.lastScanTime = 0;
        this.cacheKey = this.options.storageKey;
        this.scanInProgress = false;
        this.eventHandlers = new Map();

        // LM Studio bridge reference (if available)
        this.lmStudioBridge = null;
        this.modelZoo = null;

        this._loadCache();
        console.log('[ModelDiscovery] Initialized');
    }

    /**
     * Load discovered models from cache
     * @private
     */
    _loadCache() {
        try {
            const cached = localStorage.getItem(this.cacheKey);
            if (cached) {
                const data = JSON.parse(cached);
                if (Date.now() - data.timestamp < this.options.cacheDuration) {
                    // Convert array back to Map
                    this.discoveredModels = new Map(data.models || []);
                    this.lastScanTime = data.timestamp;
                    console.log('[ModelDiscovery] Loaded', this.discoveredModels.size, 'models from cache');
                }
            }
        } catch (e) {
            console.warn('[ModelDiscovery] Failed to load cache:', e);
        }
    }

    /**
     * Save discovered models to cache
     * @private
     */
    _saveCache() {
        try {
            const data = {
                models: Array.from(this.discoveredModels.entries()),
                timestamp: this.lastScanTime
            };
            localStorage.setItem(this.cacheKey, JSON.stringify(data));
        } catch (e) {
            console.warn('[ModelDiscovery] Failed to save cache:', e);
        }
    }

    /**
     * Set ModelZooManager reference for auto-registration
     * @param {ModelZooManager} zoo - Model Zoo Manager instance
     */
    setModelZoo(zoo) {
        this.modelZoo = zoo;
        console.log('[ModelDiscovery] Model Zoo Manager set');
    }

    /**
     * Register event handler
     * @param {string} event - Event name
     * @param {Function} handler - Event handler
     */
    on(event, handler) {
        if (!this.eventHandlers.has(event)) {
            this.eventHandlers.set(event, []);
        }
        this.eventHandlers.get(event).push(handler);
    }

    /**
     * Remove event handler
     * @param {string} event - Event name
     * @param {Function} handler - Event handler
     */
    off(event, handler) {
        const handlers = this.eventHandlers.get(event);
        if (handlers) {
            const index = handlers.indexOf(handler);
            if (index > -1) {
                handlers.splice(index, 1);
            }
        }
    }

    /**
     * Emit event
     * @private
     */
    _emit(event, data) {
        const handlers = this.eventHandlers.get(event);
        if (handlers) {
            for (const handler of handlers) {
                try {
                    handler(data);
                } catch (e) {
                    console.error(`[ModelDiscovery] Handler error for ${event}:`, e);
                }
            }
        }
    }

    /**
     * Scan for LM Studio models
     * In browser environment, uses LM Studio bridge API
     * @returns {Promise<Array>} Discovered models
     */
    async scanLMStudio() {
        if (this.scanInProgress) {
            console.warn('[ModelDiscovery] Scan already in progress');
            return this._getDiscoveredList();
        }

        this.scanInProgress = true;
        this._emit('scanStart');

        try {
            // Check if we need to refresh cache
            if (Date.now() - this.lastScanTime < this.options.cacheDuration && this.discoveredModels.size > 0) {
                console.log('[ModelDiscovery] Using cached results');
                this._emit('scanComplete', { count: this.discoveredModels.size, cached: true });
                return this._getDiscoveredList();
            }

            console.log('[ModelDiscovery] Scanning for LM Studio models...');

            // Try multiple discovery methods in parallel
            const results = await Promise.allSettled([
                this._discoverFromAPI(),
                this._discoverFromGGUFScan()
            ]);

            const discovered = [];
            results.forEach(result => {
                if (result.status === 'fulfilled') {
                    discovered.push(...result.value);
                }
            });

            // Deduplicate by model ID
            const uniqueModels = this._deduplicateModels(discovered);

            // Process discovered models
            for (const model of uniqueModels) {
                const metadata = this._extractMetadata(model);
                if (metadata) {
                    this.discoveredModels.set(metadata.id, {
                        ...metadata,
                        discoveredAt: Date.now(),
                        source: model.source || 'lmstudio'
                    });
                }
            }

            this.lastScanTime = Date.now();
            this._saveCache();

            console.log('[ModelDiscovery] Found', this.discoveredModels.size, 'models');
            this._emit('scanComplete', { count: this.discoveredModels.size, cached: false });

            return this._getDiscoveredList();

        } catch (error) {
            console.error('[ModelDiscovery] Discovery failed:', error);
            this._emit('scanError', { error });
            return this._getDiscoveredList();
        } finally {
            this.scanInProgress = false;
        }
    }

    /**
     * Discover models from LM Studio API
     * @private
     * @returns {Promise<Array>} Array of models from API
     */
    async _discoverFromAPI() {
        try {
            // Try to fetch from LM Studio's API endpoints
            const endpoints = [
                '/v1/models',
                '/api/models',
                '/models'
            ];

            for (const endpoint of endpoints) {
                try {
                    const response = await fetch(`${this.options.lmStudioApiUrl}${endpoint}`, {
                        method: 'GET',
                        headers: {
                            'Accept': 'application/json'
                        }
                    });

                    if (response.ok) {
                        const data = await response.json();
                        const models = this._parseAPIResponse(data);
                        console.log(`[ModelDiscovery] Found ${models.length} models from API`);
                        return models;
                    }
                } catch (e) {
                    // Try next endpoint
                    continue;
                }
            }

            return [];
        } catch (error) {
            console.warn('[ModelDiscovery] API discovery failed:', error);
            return [];
        }
    }

    /**
     * Parse API response for models
     * @private
     * @param {Object} data - API response data
     * @returns {Array} Array of model metadata
     */
    _parseAPIResponse(data) {
        const models = [];

        // Handle OpenAI-compatible format
        if (data.object === 'list' && Array.isArray(data.data)) {
            for (const model of data.data) {
                models.push(this._extractModelFromAPIModel(model));
            }
        }
        // Handle direct array format
        else if (Array.isArray(data)) {
            for (const model of data) {
                models.push(this._extractModelFromAPIModel(model));
            }
        }
        // Handle LM Studio specific format
        else if (data.models && Array.isArray(data.models)) {
            for (const model of data.models) {
                models.push(this._extractModelFromAPIModel(model));
            }
        }

        return models;
    }

    /**
     * Extract model metadata from API model object
     * @private
     * @param {Object} model - API model object
     * @returns {Object} Model metadata
     */
    _extractModelFromAPIModel(model) {
        const modelId = model.id || model.model || model.name || 'unknown';
        const baseName = this._extractBaseName(modelId);

        return {
            id: modelId,
            name: baseName,
            source: 'api',
            path: model.path || modelId,
            size: model.size || 0
        };
    }

    /**
     * Extract base model name from full ID
     * @private
     * @param {string} modelId - Full model ID
     * @returns {string} Base name
     */
    _extractBaseName(modelId) {
        // Remove file extension
        let name = modelId.replace(/\.(gguf|bin|safetensors)$/i, '');

        // Remove quantization suffix
        name = name.replace(/[-_]?(q4_k_m|q5_k_s|q8_0|q4_0|q4_1|q5_0|q5_1|q2_k|q3_k|q6_k)/gi, '');

        // Remove file path
        name = name.split(/[\/\\]/).pop();

        return name;
    }

    /**
     * Discover models by scanning GGUF files (via bridge)
     * @private
     * @returns {Promise<Array>} Array of discovered models
     */
    async _discoverFromGGUFScan() {
        // Try LM Studio bridge first
        if (this.lmStudioBridge || typeof LMStudioBridge !== 'undefined') {
            try {
                const models = await this._scanViaBridge();
                console.log('[ModelDiscovery] Bridge scan found', models.length, 'models');
                return models;
            } catch (e) {
                console.warn('[ModelDiscovery] Bridge scan failed:', e);
            }
        }

        // Since we're in a browser environment, we can't directly scan the filesystem
        // Try a dedicated scan endpoint if available
        try {
            const response = await fetch(`${this.options.lmStudioApiUrl}/api/scan-models`, {
                method: 'POST',
                headers: {
                    'Accept': 'application/json'
                }
            });

            if (response.ok) {
                const data = await response.json();
                console.log('[ModelDiscovery] Found models via GGUF scan:', data);
                return data.models || [];
            }
        } catch (error) {
            // Bridge not available, return empty
            console.debug('[ModelDiscovery] GGUF scan bridge not available');
        }

        return [];
    }

    /**
     * Deduplicate models by ID
     * @private
     * @param {Array} models - Array of models
     * @returns {Array} Deduplicated array
     */
    _deduplicateModels(models) {
        const seen = new Set();
        const unique = [];

        for (const model of models) {
            const key = model.id || model.name || model.path;
            if (!seen.has(key)) {
                seen.add(key);
                unique.push(model);
            }
        }

        return unique;
    }

    /**
     * Scan via LM Studio bridge
     * @private
     */
    async _scanViaBridge() {
        const bridge = this.lmStudioBridge || (typeof LMStudioBridge !== 'undefined' ? window.lmStudioBridge : null);
        if (!bridge) {
            throw new Error('LM Studio bridge not available');
        }

        // Call bridge API to list models
        const models = await bridge.listModels();
        return models || [];
    }

    /**
     * Parse GGUF file metadata from ArrayBuffer
     * @param {ArrayBuffer} buffer - GGUF file data
     * @returns {Promise<Object>} Extracted metadata
     */
    async parseGGUFMetadata(buffer) {
        const view = new DataView(buffer);
        let offset = 0;

        try {
            // Check magic number (GGUF in little endian)
            const magic = view.getUint32(offset, true);
            offset += 4;

            if (magic !== 0x46554747) { // 'GGUF'
                throw new Error('Invalid GGUF file: bad magic number');
            }

            // Read version
            const version = view.getUint32(offset, true);
            offset += 4;

            // Read tensor count
            const tensorCount = Number(view.getBigUint64(offset, true));
            offset += 8;

            // Read metadata key-value count
            const metadataKVCount = Number(view.getBigUint64(offset, true));
            offset += 8;

            console.log(`[ModelDiscovery] GGUF v${version}, ${tensorCount} tensors, ${metadataKVCount} metadata entries`);

            // Parse metadata key-value pairs
            const metadata = {};
            const maxEntries = Math.min(metadataKVCount, 200); // Limit for safety

            for (let i = 0; i < maxEntries; i++) {
                const keyResult = this._readGGUFString(view, offset);
                if (!keyResult) break;
                offset += keyResult.totalLength;

                const valueResult = this._readGGUFValue(view, offset);
                if (!valueResult) break;
                offset += valueResult.totalLength;

                metadata[keyResult.value] = valueResult.value;

                // Safety check for offset
                if (offset >= buffer.byteLength - 8) break;
            }

            return this._extractMetadataFromGGUF(metadata);

        } catch (error) {
            console.error('[ModelDiscovery] GGUF parsing failed:', error);
            throw error;
        }
    }

    /**
     * Read a GGUF string from buffer
     * @private
     * @param {DataView} view - DataView of the buffer
     * @param {number} offset - Current offset
     * @returns {Object|null} String result with value and totalLength
     */
    _readGGUFString(view, offset) {
        if (offset + 8 > view.byteLength) return null;

        const length = Number(view.getBigUint64(offset, true));

        // Safety check
        if (offset + 8 + length > view.byteLength) {
            console.warn('[ModelDiscovery] String length exceeds buffer');
            return null;
        }

        try {
            const decoder = new TextDecoder('utf-8');
            const bytes = new Uint8Array(view.buffer, offset + 8, length);
            const value = decoder.decode(bytes);
            return { value, totalLength: 8 + length };
        } catch (e) {
            console.warn('[ModelDiscovery] Failed to decode string:', e);
            return null;
        }
    }

    /**
     * Read a GGUF value from buffer
     * @private
     * @param {DataView} view - DataView of the buffer
     * @param {number} offset - Current offset
     * @returns {Object|null} Value result with value and totalLength
     */
    _readGGUFValue(view, offset) {
        if (offset + 4 > view.byteLength) return null;

        const type = view.getUint32(offset, true);
        const startOffset = offset;
        offset += 4;

        try {
            switch (type) {
                case 0: // UINT8
                    return { value: view.getUint8(offset), totalLength: 5 };
                case 1: // INT8
                    return { value: view.getInt8(offset), totalLength: 5 };
                case 2: // UINT16
                    return { value: view.getUint16(offset, true), totalLength: 6 };
                case 3: // INT16
                    return { value: view.getInt16(offset, true), totalLength: 6 };
                case 4: // UINT32
                    return { value: view.getUint32(offset, true), totalLength: 8 };
                case 5: // INT32
                    return { value: view.getInt32(offset, true), totalLength: 8 };
                case 6: // FLOAT32
                    return { value: view.getFloat32(offset, true), totalLength: 8 };
                case 7: // BOOL
                    return { value: view.getUint8(offset) !== 0, totalLength: 5 };
                case 8: // STRING
                    return this._readGGUFString(view, offset);
                case 9: // ARRAY
                    if (offset + 8 > view.byteLength) return null;
                    const arrayLength = Number(view.getBigUint64(offset, true));
                    offset += 8;
                    const array = [];
                    const maxItems = Math.min(arrayLength, 500); // Limit for safety

                    for (let i = 0; i < maxItems; i++) {
                        const item = this._readGGUFValue(view, offset);
                        if (!item) break;
                        array.push(item.value);
                        offset += item.totalLength;

                        if (offset >= view.byteLength - 4) break;
                    }
                    return { value: array, totalLength: offset - startOffset };
                case 10: // UINT64
                    if (offset + 8 > view.byteLength) return null;
                    return { value: Number(view.getBigUint64(offset, true)), totalLength: 12 };
                case 11: // INT64
                    if (offset + 8 > view.byteLength) return null;
                    return { value: Number(view.getBigInt64(offset, true)), totalLength: 12 };
                case 12: // FLOAT64
                    if (offset + 8 > view.byteLength) return null;
                    return { value: view.getFloat64(offset, true), totalLength: 12 };
                default:
                    console.warn(`[ModelDiscovery] Unknown GGUF type: ${type}`);
                    return { value: null, totalLength: 4 };
            }
        } catch (e) {
            console.warn('[ModelDiscovery] Failed to read value:', e);
            return null;
        }
    }

    /**
     * Extract model metadata from GGUF metadata
     * @private
     * @param {Object} ggufMetadata - Raw GGUF metadata
     * @returns {Object} Extracted and normalized metadata
     */
    _extractMetadataFromGGUF(ggufMetadata) {
        const general = ggufMetadata['general'] || ggufMetadata;
        const tokenizer = ggufMetadata['tokenizer'] || {};

        return {
            name: general.name || general.model_name || general.architecture || 'Unknown GGUF Model',
            architecture: general.architecture || this._detectArchitecture(general.name || general.model_name || ''),
            parameters: this._parseParameterCount(general.total_entities || general.parameter_count || 0),
            quantization: general.quantization_version || this._detectQuantization(general.name || ''),
            contextLength: general.context_length || general.max_sequence_length || 4096,
            embeddingLength: general.embedding_length || general.embd_size || 0,
            blockSize: general.block_count || general.num_layers || 0,
            feedForwardLength: general.feed_forward_length || 0,
            attentionHeadCount: general.attention_head_count || 0,
            headCount: general.head_count || general.attention_head_count || 0,
            layerNormEps: general.layer_norm_eps || 0,
            useGqa: general.use_gqa || false,
            ropeFreqBase: general.rope_freq_base || 0,
            ropeScaling: general.rope_scaling_type || null,
            vocabSize: tokenizer.vocab_size || general.vocab_size || 0,
            maxTokenLength: tokenizer.max_token_length || 0
        };
    }

    /**
     * Parse parameter count from various formats
     * @private
     * @param {number|string} params - Parameter count
     * @returns {number} Normalized count in billions
     */
    _parseParameterCount(params) {
        if (typeof params === 'number') {
            // If it's a small number, it might already be in billions
            return params < 1000 ? params : params / 1e9;
        }
        if (typeof params === 'string') {
            const match = params.match(/(\d+(?:\.\d+)?)\s*(b|billion|m|million)?/i);
            if (match) {
                const value = parseFloat(match[1]);
                const unit = (match[2] || 'b').toLowerCase();
                return unit.startsWith('m') ? value / 1000 : value;
            }
        }
        return 0;
    }

    /**
     * Process scan results and extract metadata
     * @private
     */
    _processScanResults(models) {
        for (const model of models) {
            const metadata = this._extractMetadata(model);
            if (metadata) {
                this.discoveredModels.set(metadata.id, {
                    ...metadata,
                    discoveredAt: Date.now(),
                    source: 'lmstudio'
                });
            }
        }

        this.lastScanTime = Date.now();
        this._saveCache();

        console.log('[ModelDiscovery] Found', this.discoveredModels.size, 'models');
    }

    /**
     * Extract metadata from model info
     * @private
     */
    _extractMetadata(model) {
        // Parse model name for architecture info
        const name = model.name || model.id || 'unknown';
        const architecture = this._detectArchitecture(name);
        const parameters = this._detectParameters(name);
        const quantization = this._detectQuantization(name);

        return {
            id: `discovered_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            name: name.replace(/_/g, ' ').replace(/\.gguf$/, ''),
            architecture: architecture,
            layers: this._estimateLayers(parameters),
            hiddenSize: this._estimateHiddenSize(parameters),
            attentionHeads: this._estimateAttentionHeads(parameters),
            quantization: quantization,
            color: this._getColorForArchitecture(architecture),
            layerTypes: this._getLayerTypesForArchitecture(architecture),
            sourcePath: model.path || model.id,
            fileSize: model.size || 0
        };
    }

    /**
     * Detect model architecture from name
     * @private
     */
    _detectArchitecture(name) {
        const lower = name.toLowerCase();
        if (lower.includes('llama') || lower.includes('llama-')) return 'llama';
        if (lower.includes('mistral')) return 'mistral';
        if (lower.includes('qwen')) return 'qwen';
        if (lower.includes('phi')) return 'phi';
        if (lower.includes('gemma')) return 'gemma';
        if (lower.includes('tinyllama')) return 'llama';
        if (lower.includes('yi')) return 'yi';
        if (lower.includes('deepseek')) return 'deepseek';
        return 'transformer';
    }

    /**
     * Detect parameter count from name
     * @private
     */
    _detectParameters(name) {
        const match = name.match(/(\d+(?:\.\d+)?)\s*b/i);
        if (match) {
            return parseFloat(match[1]);
        }
        return 7; // Default to 7B
    }

    /**
     * Detect quantization type from name
     * @private
     */
    _detectQuantization(name) {
        const lower = name.toLowerCase();
        if (lower.includes('q4_k_m')) return 'Q4_K_M';
        if (lower.includes('q4_k_s')) return 'Q4_K_S';
        if (lower.includes('q5_k_m')) return 'Q5_K_M';
        if (lower.includes('q5_k_s')) return 'Q5_K_S';
        if (lower.includes('q5')) return 'Q5';
        if (lower.includes('q6_k')) return 'Q6_K';
        if (lower.includes('q8_0')) return 'Q8_0';
        if (lower.includes('q4')) return 'Q4';
        if (lower.includes('f16') || lower.includes('float16')) return 'F16';
        if (lower.includes('f32') || lower.includes('float32')) return 'F32';
        return 'unknown';
    }

    /**
     * Estimate layer count from parameters
     * @private
     */
    _estimateLayers(parameters) {
        if (parameters <= 1) return 12;
        if (parameters <= 3) return 24;
        if (parameters <= 7) return 32;
        if (parameters <= 13) return 40;
        if (parameters <= 30) return 60;
        return 80;
    }

    /**
     * Estimate hidden size from parameters
     * @private
     */
    _estimateHiddenSize(parameters) {
        if (parameters <= 1) return 768;
        if (parameters <= 3) return 2048;
        if (parameters <= 7) return 4096;
        if (parameters <= 13) return 5120;
        if (parameters <= 30) return 6656;
        return 8192;
    }

    /**
     * Estimate attention heads from parameters
     * @private
     */
    _estimateAttentionHeads(parameters) {
        if (parameters <= 1) return 12;
        if (parameters <= 3) return 16;
        if (parameters <= 7) return 32;
        if (parameters <= 13) return 40;
        if (parameters <= 30) return 48;
        return 64;
    }

    /**
     * Get color for architecture
     * @private
     */
    _getColorForArchitecture(architecture) {
        const colors = {
            'llama': 0x4ECDC4,
            'mistral': 0xFECEA8,
            'qwen': 0xFF6B6B,
            'phi': 0xF0E68C,
            'gemma': 0xFFB347,
            'yi': 0xDDA0DD,
            'deepseek': 0x98D8C8
        };
        return colors[architecture] || 0x96CEB4;
    }

    /**
     * Get layer types for architecture
     * @private
     */
    _getLayerTypesForArchitecture(architecture) {
        const types = {
            'llama': ['tok_embeddings', 'layers.N.attention', 'layers.N.feed_forward', 'lm_head'],
            'mistral': ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head'],
            'qwen': ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head'],
            'phi': ['tok_embeddings', 'layers.N.attention', 'layers.N.mlp', 'lm_head'],
            'gemma': ['tok_embeddings', 'layers.N.self_attn', 'layers.N.mlp', 'lm_head']
        };
        return types[architecture] || ['tok_embeddings', 'layers.N.attention', 'layers.N.mlp', 'lm_head'];
    }

    /**
     * Get discovered models as array
     * @private
     */
    _getDiscoveredList() {
        return Array.from(this.discoveredModels.values());
    }

    /**
     * Get all discovered models
     * @returns {Array} Discovered models
     */
    getDiscoveredModels() {
        return this._getDiscoveredList();
    }

    /**
     * Register discovered model with ModelZooManager
     * @param {string} modelId - Discovered model ID
     * @param {ModelZooManager} zoo - Model Zoo Manager instance (optional, uses this.modelZoo if not provided)
     * @returns {string|null} Registered model ID or null
     */
    async registerDiscoveredModel(modelId, zoo) {
        const model = this.discoveredModels.get(modelId);
        if (!model) {
            console.warn('[ModelDiscovery] Model not found:', modelId);
            return null;
        }

        const targetZoo = zoo || this.modelZoo;
        if (!targetZoo) {
            console.warn('[ModelDiscovery] No ModelZooManager available');
            return null;
        }

        try {
            const registeredId = targetZoo.importCustomModel({
                id: model.id,
                name: model.name,
                architecture: model.architecture,
                layers: model.layers || model.blockSize || 0,
                hiddenSize: model.hiddenSize || model.embeddingLength || 0,
                attentionHeads: model.attentionHeads || model.headCount || 0,
                color: model.color,
                layerTypes: model.layerTypes,
                quantization: model.quantization,
                sourcePath: model.sourcePath,
                ggufMetadata: model
            });

            console.log('[ModelDiscovery] Registered model:', model.name);
            this._emit('modelRegistered', { id: registeredId, model });
            return registeredId;
        } catch (e) {
            console.error('[ModelDiscovery] Registration failed:', e);
            return null;
        }
    }

    /**
     * Register all discovered models
     * @param {ModelZooManager} zoo - Model Zoo Manager instance (optional)
     * @returns {Promise<Array>} Array of registered model IDs
     */
    async registerAllDiscovered(zoo) {
        const targetZoo = zoo || this.modelZoo;
        if (!targetZoo) {
            console.warn('[ModelDiscovery] No ModelZooManager available');
            return [];
        }

        const registered = [];
        for (const model of this.discoveredModels.values()) {
            const id = await this.registerDiscoveredModel(model.id, targetZoo);
            if (id) registered.push(id);
        }
        return registered;
    }

    /**
     * Handle manual GGUF file upload
     * @param {File} file - Uploaded GGUF file
     * @returns {Promise<Object>} Extracted metadata
     */
    async handleFileUpload(file) {
        console.log('[ModelDiscovery] Processing file upload:', file.name);

        let metadata;

        try {
            // Try to parse GGUF metadata from file
            const buffer = await file.arrayBuffer();
            const ggufMetadata = await this.parseGGUFMetadata(buffer);

            // Merge GGUF metadata with filename-based metadata
            const filenameMetadata = this._extractMetadata({
                name: file.name,
                size: file.size,
                path: file.name
            });

            metadata = {
                ...filenameMetadata,
                ...ggufMetadata,
                source: 'upload',
                sourcePath: file.name,
                fileSize: file.size
            };

            console.log('[ModelDiscovery] Parsed GGUF metadata:', metadata.name);

        } catch (e) {
            console.warn('[ModelDiscovery] GGUF parsing failed, using filename:', e);

            // Fallback to filename-based extraction
            metadata = this._extractMetadata({
                name: file.name,
                size: file.size,
                path: file.name
            });

            metadata.source = 'upload';
            metadata.sourcePath = file.name;
            metadata.fileSize = file.size;
        }

        // Add to discovered models
        this.discoveredModels.set(metadata.id, metadata);
        this._saveCache();
        this._emit('modelDiscovered', metadata);

        return metadata;
    }

    /**
     * Clear discovered models cache
     */
    clearCache() {
        this.discoveredModels.clear();
        this.lastScanTime = 0;
        localStorage.removeItem(this.cacheKey);
        console.log('[ModelDiscovery] Cache cleared');
    }

    /**
     * Set LM Studio bridge reference
     * @param {Object} bridge - LM Studio bridge instance
     */
    setLMStudioBridge(bridge) {
        this.lmStudioBridge = bridge;
        console.log('[ModelDiscovery] LM Studio bridge set');
    }

    /**
     * Get discovered model by ID
     * @param {string} modelId - Model ID
     * @returns {Object|null} Model or null
     */
    getModel(modelId) {
        return this.discoveredModels.get(modelId) || null;
    }

    /**
     * Import a model from discovery to ModelZoo
     * @param {string} modelId - Model ID to import
     * @returns {Promise<boolean>} Success status
     */
    async importModel(modelId) {
        const model = this.discoveredModels.get(modelId);
        if (!model) {
            console.warn('[ModelDiscovery] Model not found:', modelId);
            return false;
        }

        const registeredId = await this.registerDiscoveredModel(modelId);
        if (registeredId) {
            this._emit('modelImported', model);
            return true;
        }
        return false;
    }

    /**
     * Remove a discovered model
     * @param {string} modelId - Model ID to remove
     */
    removeModel(modelId) {
        if (this.discoveredModels.has(modelId)) {
            this.discoveredModels.delete(modelId);
            this._saveCache();
            this._emit('modelRemoved', modelId);
        }
    }

    /**
     * Clear all discovered models
     */
    clearDiscovered() {
        this.discoveredModels.clear();
        this._saveCache();
        this._emit('cleared');
    }

    /**
     * Search discovered models by query
     * @param {string} query - Search query
     * @returns {Array} Matching models
     */
    searchModels(query) {
        const lowerQuery = query.toLowerCase();
        return this._getDiscoveredList().filter(model =>
            model.name.toLowerCase().includes(lowerQuery) ||
            model.architecture.toLowerCase().includes(lowerQuery) ||
            (model.id && model.id.toLowerCase().includes(lowerQuery))
        );
    }

    /**
     * Filter discovered models by architecture
     * @param {string} architecture - Architecture to filter by
     * @returns {Array} Matching models
     */
    filterByArchitecture(architecture) {
        return this._getDiscoveredList().filter(model =>
            model.architecture === architecture
        );
    }

    /**
     * Get statistics about discovered models
     * @returns {Object} Statistics object
     */
    getStatistics() {
        const models = this._getDiscoveredList();
        const architectures = {};
        const sources = {};

        for (const model of models) {
            architectures[model.architecture] = (architectures[model.architecture] || 0) + 1;
            sources[model.source] = (sources[model.source] || 0) + 1;
        }

        return {
            total: models.length,
            architectures,
            sources,
            lastScanTime: this.lastScanTime,
            cacheAge: this.lastScanTime ? Date.now() - this.lastScanTime : null
        };
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.ModelDiscovery = ModelDiscovery;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ModelDiscovery };
}
