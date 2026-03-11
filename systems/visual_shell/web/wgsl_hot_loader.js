/**
 * WGSLHotLoader - Phase 50: Advanced Visual Tools
 *
 * Modular WGSL loader that allows hot-swapping shaders during evolution.
 * Enables the AI to evolve the look and feel of the OS by modifying GPU code directly.
 *
 * Features:
 * - Hot-reload WGSL shaders without page refresh
 * - Shader versioning and rollback support
 * - Live shader compilation validation
 * - Integration with EvolutionDaemon for safe shader evolution
 * - Performance monitoring per shader
 *
 * @class WGSLHotLoader
 */

class WGSLHotLoader {
    constructor(config = {}) {
        this.config = {
            shaderBasePath: config.shaderBasePath || '/systems/pixel_compiler/shaders/',
            maxVersions: config.maxVersions || 10,
            enableHotReload: config.enableHotReload !== false,
            compileTimeout: config.compileTimeout || 5000,
            ...config
        };

        // State
        this.device = null; // GPUDevice
        this.shaders = new Map(); // shaderId -> ShaderEntry
        this.loadedModules = new Map(); // moduleKey -> GPUShaderModule
        this.compilationErrors = new Map();

        // Event listeners
        this.onShaderCompiled = null;
        this.onShaderError = null;
        this.onShaderHotReloaded = null;

        // Performance tracking
        this.stats = {
            totalCompilations: 0,
            successfulCompilations: 0,
            failedCompilations: 0,
            averageCompileTime: 0
        };
    }

    /**
     * Initialize the loader with a GPUDevice
     */
    async initialize(gpuDevice) {
        this.device = gpuDevice;
        console.log('[WGSLHotLoader] Initialized with GPUDevice');

        // Set up hot reload watcher if enabled
        if (this.config.enableHotReload && typeof window !== 'undefined') {
            this._setupHotReloadWatcher();
        }
    }

    /**
     * Set up hot reload watcher (for development)
     */
    _setupHotReloadWatcher() {
        // Listen for shader update events from the backend
        window.addEventListener('WGSL_SHADER_UPDATED', async (e) => {
            const { shaderId, code } = e.detail;
            console.log(`[WGSLHotLoader] Hot reload triggered for: ${shaderId}`);
            await this.hotReload(shaderId, code);
        });

        // Listen for shader file changes via WebSocket (if available)
        if (window.shaderWebSocket) {
            window.shaderWebSocket.on('shader_update', async (data) => {
                await this.hotReload(data.shaderId, data.code);
            });
        }
    }

    /**
     * Load a shader from URL
     */
    async load(shaderId, url, options = {}) {
        const startTime = performance.now();

        try {
            // Fetch shader code
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`Failed to load shader: ${response.status}`);
            }
            const code = await response.text();

            // Compile the shader
            const result = await this.compile(shaderId, code, options);

            // Track performance
            const compileTime = performance.now() - startTime;
            this._updateStats(compileTime, result.success);

            return result;
        } catch (error) {
            console.error(`[WGSLHotLoader] Failed to load shader ${shaderId}:`, error);
            this.compilationErrors.set(shaderId, {
                error: error.message,
                timestamp: Date.now()
            });
            this.stats.failedCompilations++;

            return {
                success: false,
                error: error.message,
                shaderId
            };
        }
    }

    /**
     * Compile WGSL code into a GPUShaderModule
     */
    async compile(shaderId, code, options = {}) {
        if (!this.device) {
            throw new Error('WGSLHotLoader not initialized with GPUDevice');
        }

        const startTime = performance.now();
        const label = options.label || shaderId;

        try {
            // Create shader module descriptor
            const descriptor = {
                label,
                code
            };

            // Create the shader module
            const module = this.device.createShaderModule(descriptor);

            // Check for compilation info
            const compilationInfo = await module.getCompilationInfo();

            // Check for errors
            const errors = compilationInfo.messages.filter(
                msg => msg.type === 'error'
            );
            const warnings = compilationInfo.messages.filter(
                msg => msg.type === 'warning'
            );

            if (errors.length > 0) {
                const errorMsg = errors.map(e =>
                    `Line ${e.lineNum}: ${e.message}`
                ).join('\n');

                this.compilationErrors.set(shaderId, {
                    errors,
                    warnings,
                    timestamp: Date.now()
                });

                console.error(`[WGSLHotLoader] Compilation errors for ${shaderId}:\n${errorMsg}`);

                return {
                    success: false,
                    error: errorMsg,
                    errors,
                    warnings,
                    shaderId
                };
            }

            // Log warnings if any
            if (warnings.length > 0) {
                console.warn(`[WGSLHotLoader] Warnings for ${shaderId}:`, warnings);
            }

            // Store the shader entry
            const entry = this._createShaderEntry(shaderId, code, module, options);

            // Add to loaded modules
            this.loadedModules.set(this._getModuleKey(shaderId, entry.version), module);

            // Clear any previous errors
            this.compilationErrors.delete(shaderId);

            // Update stats
            const compileTime = performance.now() - startTime;
            this._updateStats(compileTime, true);

            console.log(`[WGSLHotLoader] Compiled ${shaderId} v${entry.version} in ${compileTime.toFixed(2)}ms`);

            // Fire callback
            if (this.onShaderCompiled) {
                this.onShaderCompiled(shaderId, entry);
            }

            return {
                success: true,
                module,
                entry,
                warnings,
                compileTime,
                shaderId
            };

        } catch (error) {
            const compileTime = performance.now() - startTime;
            this._updateStats(compileTime, false);

            this.compilationErrors.set(shaderId, {
                error: error.message,
                timestamp: Date.now()
            });

            console.error(`[WGSLHotLoader] Failed to compile ${shaderId}:`, error);

            // Fire error callback
            if (this.onShaderError) {
                this.onShaderError(shaderId, error);
            }

            return {
                success: false,
                error: error.message,
                compileTime,
                shaderId
            };
        }
    }

    /**
     * Hot reload a shader with new code
     */
    async hotReload(shaderId, newCode) {
        const existingEntry = this.shaders.get(shaderId);

        // Try to compile the new version
        const result = await this.compile(shaderId, newCode, {
            previousVersion: existingEntry?.version || 0
        });

        if (result.success) {
            console.log(`[WGSLHotLoader] Hot reloaded ${shaderId} to v${result.entry.version}`);

            // Fire callback
            if (this.onShaderHotReloaded) {
                this.onShaderHotReloaded(shaderId, result.entry, existingEntry);
            }

            // Dispatch event for other systems
            window.dispatchEvent(new CustomEvent('SHADER_HOT_RELOADED', {
                detail: {
                    shaderId,
                    newVersion: result.entry.version,
                    oldVersion: existingEntry?.version || 0
                }
            }));

            return result;
        } else {
            console.warn(`[WGSLHotLoader] Hot reload failed for ${shaderId}, keeping old version`);

            // Keep the old version active
            return {
                success: false,
                error: result.error,
                rolledBack: true,
                currentEntry: existingEntry
            };
        }
    }

    /**
     * Rollback to a previous version
     */
    async rollback(shaderId, targetVersion) {
        const entry = this.shaders.get(shaderId);
        if (!entry) {
            throw new Error(`Shader ${shaderId} not found`);
        }

        // Find the target version
        const versionEntry = entry.history.find(h => h.version === targetVersion);
        if (!versionEntry) {
            throw new Error(`Version ${targetVersion} not found for ${shaderId}`);
        }

        // Re-compile from the history
        const result = await this.compile(shaderId, versionEntry.code, {
            label: `${shaderId}_rollback_v${targetVersion}`,
            isRollback: true
        });

        if (result.success) {
            console.log(`[WGSLHotLoader] Rolled back ${shaderId} to v${targetVersion}`);
        }

        return result;
    }

    /**
     * Get a loaded shader module
     */
    getModule(shaderId, version = null) {
        const entry = this.shaders.get(shaderId);
        if (!entry) return null;

        const targetVersion = version || entry.version;
        return this.loadedModules.get(this._getModuleKey(shaderId, targetVersion));
    }

    /**
     * Get shader entry
     */
    getEntry(shaderId) {
        return this.shaders.get(shaderId);
    }

    /**
     * Get compilation errors for a shader
     */
    getErrors(shaderId) {
        return this.compilationErrors.get(shaderId);
    }

    /**
     * List all loaded shaders
     */
    listShaders() {
        return Array.from(this.shaders.entries()).map(([id, entry]) => ({
            id,
            version: entry.version,
            label: entry.label,
            lastModified: entry.lastModified,
            codeLength: entry.code.length
        }));
    }

    /**
     * Create a shader entry
     */
    _createShaderEntry(shaderId, code, module, options = {}) {
        const existingEntry = this.shaders.get(shaderId);
        const newVersion = (existingEntry?.version || 0) + 1;

        const entry = {
            id: shaderId,
            label: options.label || shaderId,
            version: newVersion,
            code,
            module,
            createdAt: Date.now(),
            lastModified: Date.now(),
            options,
            history: existingEntry?.history || []
        };

        // Add previous version to history
        if (existingEntry) {
            entry.history.push({
                version: existingEntry.version,
                code: existingEntry.code,
                timestamp: existingEntry.lastModified
            });

            // Limit history size
            if (entry.history.length > this.config.maxVersions) {
                // Remove oldest versions
                const toRemove = entry.history.length - this.config.maxVersions;
                entry.history = entry.history.slice(toRemove);

                // Clean up old modules
                for (let i = 0; i < toRemove; i++) {
                    const oldKey = this._getModuleKey(shaderId, existingEntry.version - this.config.maxVersions + i);
                    this.loadedModules.delete(oldKey);
                }
            }
        }

        this.shaders.set(shaderId, entry);
        return entry;
    }

    /**
     * Get module key for cache
     */
    _getModuleKey(shaderId, version) {
        return `${shaderId}_v${version}`;
    }

    /**
     * Update compilation statistics
     */
    _updateStats(compileTime, success) {
        this.stats.totalCompilations++;

        if (success) {
            this.stats.successfulCompilations++;
        } else {
            this.stats.failedCompilations++;
        }

        // Update rolling average
        const n = this.stats.totalCompilations;
        this.stats.averageCompileTime =
            ((this.stats.averageCompileTime * (n - 1)) + compileTime) / n;
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            loadedShadersCount: this.shaders.size,
            cachedModulesCount: this.loadedModules.size,
            shadersWithErrors: Array.from(this.compilationErrors.keys())
        };
    }

    /**
     * Clear all cached shaders
     */
    clearCache() {
        this.shaders.clear();
        this.loadedModules.clear();
        this.compilationErrors.clear();
        console.log('[WGSLHotLoader] Cache cleared');
    }

    /**
     * Destroy the loader
     */
    destroy() {
        this.clearCache();
        this.device = null;
    }
}

// Export
if (typeof window !== 'undefined') {
    window.WGSLHotLoader = WGSLHotLoader;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { WGSLHotLoader };
}
