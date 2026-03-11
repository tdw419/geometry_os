/**
 * Geometry OS: Linux Tile Bridge
 *
 * Bridges Linux VM execution to tile placement on the Infinite Map.
 * Associates sessions with spatial positions, renders output as tiles.
 *
 * @module linux_tile_bridge
 */

class LinuxTileBridge {
    /**
     * @param {Object} map - The Infinite Map instance
     * @param {Object} client - Linux bridge client (WebSocket wrapper)
     * @param {Object} config - Configuration options
     */
    constructor(map, client, config = {}) {
        this.map = map;
        this.client = client;
        this.sessions = new Map(); // session_id -> { position, status, history }
        this.config = {
            autoPlace: true,
            defaultTileType: 'linux_session',
            maxHistoryLength: 100,
            ...config
        };

        console.log('🌉 LinuxTileBridge initialized');
    }

    /**
     * Boot a Linux session at a specific map position.
     * @param {string} kernel - Kernel/distro name (e.g., 'alpine')
     * @param {Object} position - {x, y} world coordinates
     * @param {Object} options - Boot options
     * @returns {Promise<{success: boolean, sessionId: string, tilePlaced: boolean}>}
     */
    async bootAtPosition(kernel, position, options = {}) {
        console.log(`🌉 Booting Linux at (${position.x}, ${position.y})...`);

        try {
            // Call Linux bridge to boot
            const bootResult = await this.client.call('boot', { kernel, ...options });

            if (!bootResult.session_id) {
                throw new Error('No session_id returned from boot');
            }

            const sessionId = bootResult.session_id;

            // Store session with position
            this.sessions.set(sessionId, {
                position: { ...position },
                status: 'booting',
                kernel,
                history: [],
                createdAt: Date.now()
            });

            // Place session tile on map
            let tilePlaced = false;
            if (this.config.autoPlace) {
                tilePlaced = await this._placeSessionTile(sessionId, position, {
                    status: 'booting',
                    kernel
                });
            }

            return {
                success: true,
                sessionId,
                tilePlaced,
                position
            };

        } catch (error) {
            console.error('🌉 Boot failed:', error);
            return {
                success: false,
                error: error.message,
                tilePlaced: false
            };
        }
    }

    /**
     * Execute command and place result as tile.
     * @param {string} command - Shell command to execute
     * @param {Object} position - {x, y} for result tile placement
     * @param {Object} options - Execution options
     * @returns {Promise<{success: boolean, result: Object, tilePlaced: boolean}>}
     */
    async execToTile(command, position, options = {}) {
        console.log(`🌉 Executing: ${command}`);

        try {
            const result = await this.client.call('exec', {
                cmd: command,
                timeout: options.timeout || 30
            });

            // Determine tile type from output
            const tileType = this._classifyOutput(result.stdout);

            // Place result tile
            let tilePlaced = false;
            if (this.config.autoPlace) {
                tilePlaced = await this._placeResultTile(position, {
                    type: tileType,
                    command,
                    stdout: result.stdout?.substring(0, 500),
                    exitCode: result.exit_code
                });
            }

            return {
                success: result.exit_code === 0,
                result,
                tilePlaced,
                position
            };

        } catch (error) {
            console.error('🌉 Exec failed:', error);
            return {
                success: false,
                error: error.message,
                tilePlaced: false
            };
        }
    }

    /**
     * Get the map position for a session.
     * @param {string} sessionId
     * @returns {Object|null} {x, y} or null
     */
    getSessionPosition(sessionId) {
        const session = this.sessions.get(sessionId);
        return session ? { ...session.position } : null;
    }

    /**
     * Classify output to determine tile visualization.
     * @private
     */
    _classifyOutput(stdout) {
        if (!stdout) return 'empty';
        if (stdout.includes('error') || stdout.includes('Error')) return 'error';
        if (stdout.includes('success') || stdout.includes('completed')) return 'success';
        return 'output';
    }

    /**
     * Place a session tile on the map.
     * @private
     */
    async _placeSessionTile(sessionId, position, metadata) {
        const gridSize = this.map.config?.gridSize || 100;
        const gridX = Math.floor(position.x / gridSize);
        const gridY = Math.floor(position.y / gridSize);

        const tileMeta = {
            type: this.config.defaultTileType,
            sessionId,
            ...metadata,
            timestamp: Date.now()
        };

        if (this.map.writeTile) {
            await this.map.writeTile(gridX, gridY, 'linux_session', tileMeta);
            console.log(`🌉 Session tile placed at (${gridX}, ${gridY})`);
            return true;
        }

        console.log(`🌉 Map writeTile not available`);
        return false;
    }

    /**
     * Place a result tile on the map.
     * @private
     */
    async _placeResultTile(position, metadata) {
        const gridSize = this.map.config?.gridSize || 100;
        const gridX = Math.floor(position.x / gridSize);
        const gridY = Math.floor(position.y / gridSize);

        const tileMeta = {
            type: 'linux_output',
            ...metadata,
            timestamp: Date.now()
        };

        if (this.map.writeTile) {
            await this.map.writeTile(gridX, gridY, 'linux_output', tileMeta);
            console.log(`🌉 Result tile placed at (${gridX}, ${gridY})`);
            return true;
        }

        return false;
    }

    /**
     * Get all active sessions.
     * @returns {Array<{sessionId, position, status, health}>}
     */
    getActiveSessions() {
        return Array.from(this.sessions.entries()).map(([id, session]) => ({
            sessionId: id,
            position: session.position,
            status: session.status,
            kernel: session.kernel,
            health: session.health || null
        }));
    }

    /**
     * Update session status.
     * @param {string} sessionId
     * @param {string} status
     */
    updateSessionStatus(sessionId, status) {
        const session = this.sessions.get(sessionId);
        if (session) {
            session.status = status;
            session.history.push({ status, timestamp: Date.now() });
        }
    }

    /**
     * Update session health metrics.
     * @param {string} sessionId
     * @param {Object} health - {cpu, memory, disk, network}
     */
    updateSessionHealth(sessionId, health) {
        const session = this.sessions.get(sessionId);
        if (session) {
            session.health = { ...health, timestamp: Date.now() };
            session.history.push({ type: 'health', health, timestamp: Date.now() });

            // Trim history
            if (session.history.length > this.config.maxHistoryLength) {
                session.history = session.history.slice(-this.config.maxHistoryLength);
            }
        }
    }

    /**
     * Get session health history.
     * @param {string} sessionId
     * @returns {Array} Health history entries
     */
    getSessionHealthHistory(sessionId) {
        const session = this.sessions.get(sessionId);
        if (!session) return [];
        return session.history.filter(h => h.type === 'health' || h.status);
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.LinuxTileBridge = LinuxTileBridge;
}

// Export for ES modules
export { LinuxTileBridge };
