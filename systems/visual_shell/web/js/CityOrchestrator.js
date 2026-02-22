// systems/visual_shell/web/js/CityOrchestrator.js
/**
 * CityOrchestrator - Spatial layout manager for Neural City.
 * Maps telemetry data to building positions and manages district state.
 */

// District configuration
const DISTRICTS = {
    cognitive: { name: 'Cognitive District', color: 0x00aaff, angle: 0 },
    metabolic: { name: 'Metabolic District', color: 0xff8800, angle: 120 },
    substrate: { name: 'Substrate District', color: 0x00ff88, angle: 240 }
};

// Building roles to district mapping
const ROLE_TO_DISTRICT = {
    'cognitive': 'cognitive',
    'llm': 'cognitive',
    'area_agent': 'cognitive',
    'metabolic': 'metabolic',
    'tectonic': 'metabolic',
    'guardian': 'metabolic',
    'substrate': 'substrate',
    'pixelrts': 'substrate',
    'hypervisor': 'substrate'
};

class CityOrchestrator {
    constructor(config = {}) {
        this.config = {
            centerRadius: 200,
            districtRadius: 400,
            buildingSpacing: 50,
            ...config
        };

        this.buildings = new Map();
        this.bridges = [];
        this.districtPulses = new Map();

        // Callbacks
        this.onBuildingSpawn = null;
        this.onBuildingUpdate = null;
        this.onBridgeCreate = null;
        this.onDistrictPulse = null;
    }

    /**
     * Spawn a new building for an agent.
     */
    spawnBuilding(agentId, role, metrics = {}) {
        if (this.buildings.has(agentId)) {
            return this.buildings.get(agentId);
        }

        const district = this._getDistrictForRole(role);
        const position = this._calculateBuildingPosition(district, agentId);

        const building = {
            id: agentId,
            role: role,
            district: district,
            position: position,
            height: this._calculateHeight(metrics.memory || 100),
            activity: metrics.activity || 0,
            memory: metrics.memory || 100,
            luminance: 0.5,
            createdAt: Date.now(),
            rtsPath: this._getRTSPath(agentId, role),
            liveTile: null,
            stability: {
                pas: metrics.pas || 0.7,
                state: 'stable',
                lastUpdate: Date.now()
            }
        };

        this.buildings.set(agentId, building);

        if (this.onBuildingSpawn) {
            this.onBuildingSpawn(building);
        }

        return building;
    }

    /**
     * Get the RTS file path for an agent based on its role or ID.
     * @private
     */
    _getRTSPath(agentId, role) {
        // Mapping of roles to verified RTS files found on disk
        // Using ../../../ prefix to reach project root from systems/visual_shell/web/
        const root = '../../../';
        const rolePaths = {
            'cognitive': root + 'qwen_coder.rts.png',
            'metabolic': root + 'process_hive.rts.png',
            'substrate': root + 'system_monitor.rts.png',
            'llm': root + 'qwen_coder.rts.png',
            'tectonic': root + 'geometry_os_core.rts.png'
        };

        // Special case for known bootable agents
        if (agentId.includes('alpine')) {
            return root + 'alpine_visual.rts.png';
        }
        if (agentId.includes('antigravity')) {
            return root + 'antigravity.pixelrts.png';
        }
        if (agentId.includes('ubuntu')) {
            return root + 'ubuntu_kernel.rts.png';
        }

        // Fallback to role-based or generic
        return rolePaths[role.toLowerCase()] || root + 'test.rts.png';
    }

    /**
     * Update building state.
     */
    updateBuilding(agentId, updates) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        Object.assign(building, {
            activity: updates.activity ?? building.activity,
            memory: updates.memory ?? building.memory,
            luminance: this._calculateLuminance(updates.activity ?? building.activity),
            height: this._calculateHeight(updates.memory ?? building.memory)
        });

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Get building by ID.
     */
    getBuilding(agentId) {
        return this.buildings.get(agentId);
    }

    /**
     * Set a LiveTile on a building.
     * @param {string} agentId - The agent ID of the building
     * @param {LiveTile} liveTile - The LiveTile instance to attach
     * @returns {Object|null} Updated building or null if not found
     */
    setLiveTile(agentId, liveTile) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        building.liveTile = liveTile;

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Get all buildings with active LiveTiles.
     * @returns {Array} Array of buildings with running LiveTiles
     */
    getLiveTiles() {
        return Array.from(this.buildings.values())
            .filter(b => b.liveTile && b.liveTile.isRunning());
    }

    /**
     * Create a bridge arc between two buildings.
     */
    createBridge(fromId, toId, eventType) {
        const from = this.buildings.get(fromId);
        const to = this.buildings.get(toId);

        if (!from || !to) return null;

        const bridge = {
            id: `${fromId}-${toId}-${Date.now()}`,
            from: fromId,
            to: toId,
            fromPos: from.position,
            toPos: to.position,
            eventType: eventType,
            color: this._getBridgeColor(eventType),
            createdAt: Date.now(),
            ttl: 2000 // Bridge fades after 2 seconds
        };

        this.bridges.push(bridge);

        // Clean up old bridges
        this._pruneBridges();

        if (this.onBridgeCreate) {
            this.onBridgeCreate(bridge);
        }

        return bridge;
    }

    /**
     * Pulse a district (visual feedback).
     */
    pulseDistrict(districtName) {
        this.districtPulses.set(districtName, {
            intensity: 1.0,
            startedAt: Date.now()
        });

        if (this.onDistrictPulse) {
            this.onDistrictPulse(districtName);
        }
    }

    /**
     * Get a random building ID.
     */
    getRandomBuildingId() {
        if (this.buildings.size === 0) return null;
        const ids = Array.from(this.buildings.keys());
        return ids[Math.floor(Math.random() * ids.length)];
    }

    /**
     * Get all active bridges.
     */
    getBridges() {
        this._pruneBridges();
        return this.bridges;
    }

    /**
     * Get district state.
     */
    getDistrictState(districtName) {
        const buildings = Array.from(this.buildings.values())
            .filter(b => b.district === districtName);
        const pulse = this.districtPulses.get(districtName);

        return {
            name: districtName,
            config: DISTRICTS[districtName],
            buildingCount: buildings.length,
            totalActivity: buildings.reduce((sum, b) => sum + b.activity, 0),
            pulse: pulse
        };
    }

    /**
     * Relocate an agent to a different district.
     * Updates district and recalculates position.
     * @param {string} agentId - The agent ID to relocate
     * @param {string} newDistrict - Target district name
     * @returns {Object|null} Updated building or null if not found
     */
    relocateAgent(agentId, newDistrict) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        // Validate district
        if (!DISTRICTS[newDistrict]) {
            console.warn(`Invalid district: ${newDistrict}`);
            return null;
        }

        // Update district and recalculate position
        building.district = newDistrict;
        building.position = this._calculateBuildingPosition(newDistrict, agentId);

        // Trigger update callback
        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Evict an agent from the city.
     * Removes building and cleans up graphics.
     * @param {string} agentId - The agent ID to evict
     * @returns {boolean} True if agent was evicted, false if not found
     */
    evictAgent(agentId) {
        const building = this.buildings.get(agentId);
        if (!building) return false;

        // Remove from graphics layer
        if (building.graphics && building.graphics.parent) {
            building.graphics.parent.removeChild(building.graphics);
        }

        // Remove from buildings map
        this.buildings.delete(agentId);

        console.log(`Agent ${agentId} evicted from the city`);
        return true;
    }

    /**
     * Update building stability score.
     * @param {string} agentId - The agent ID to update
     * @param {number} pasScore - PAS score between 0 and 1
     * @returns {Object|null} Updated building or null if not found
     */
    updateStability(agentId, pasScore) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        building.stability.pas = pasScore;
        building.stability.state = this._classifyStability(pasScore);
        building.stability.lastUpdate = Date.now();

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Classify stability state from PAS score.
     * @param {number} pas - PAS score between 0 and 1
     * @returns {string} Stability state: 'stable', 'degraded', or 'critical'
     * @private
     */
    _classifyStability(pas) {
        if (pas >= 0.7) return 'stable';
        if (pas >= 0.5) return 'degraded';
        return 'critical';
    }

    /**
     * Get all buildings with critical stability.
     * @returns {Array} Array of critical buildings
     */
    getCriticalBuildings() {
        return Array.from(this.buildings.values())
            .filter(b => b.stability.state === 'critical');
    }

    // ===== Fluid Layout Methods (Phase 28: Tectonic Realignment) =====

    /**
     * Apply drift offset from TectonicEngine.
     * Stores drift on the building object for rendering.
     * @param {string} agentId - The agent ID
     * @param {Object} drift - Drift offset {dx, dy, magnitude}
     * @returns {Object|null} Updated building or null if not found
     */
    applyDrift(agentId, drift) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        building.drift = {
            dx: drift.dx || 0,
            dy: drift.dy || 0,
            magnitude: drift.magnitude || 0
        };

        if (this.onBuildingUpdate) {
            this.onBuildingUpdate(building);
        }

        return building;
    }

    /**
     * Get the rendered position including drift offset.
     * If building is migrating, returns lerpPosition for smooth animation.
     * @param {string} agentId - The agent ID
     * @returns {Object|null} Position {x, y} or null if not found
     */
    getRenderedPosition(agentId) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        // If migrating, return interpolated position
        if (building.isMigrating && building.lerpPosition) {
            return { ...building.lerpPosition };
        }

        // Otherwise return base position + drift offset
        const basePos = building.position;
        const drift = building.drift || { dx: 0, dy: 0 };

        return {
            x: basePos.x + drift.dx,
            y: basePos.y + drift.dy
        };
    }

    /**
     * Set the target position for smooth glide animation.
     * @param {string} agentId - The agent ID
     * @param {Object} target - Target position {x, y}
     * @returns {Object|null} Updated building or null if not found
     */
    setTargetPosition(agentId, target) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        building.targetPosition = { ...target };
        // Initialize lerpPosition to current rendered position
        building.lerpPosition = this.getRenderedPosition(agentId);
        building.lerpProgress = 0;

        return building;
    }

    /**
     * Interpolate toward target position by factor t.
     * When lerpProgress >= 1.0, migration is complete.
     * @param {string} agentId - The agent ID
     * @param {number} t - Interpolation factor (0-1)
     * @returns {Object|null} Updated building or null if not found
     */
    lerpToTarget(agentId, t) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        if (!building.targetPosition || !building.lerpPosition) {
            return building;
        }

        // Update progress
        building.lerpProgress = Math.min(1.0, (building.lerpProgress || 0) + t);

        // Interpolate position
        const start = building.lerpPosition;
        const end = building.targetPosition;
        const progress = building.lerpProgress;

        building.lerpPosition = {
            x: start.x + (end.x - start.x) * t,
            y: start.y + (end.y - start.y) * t
        };

        // Check if migration is complete
        if (building.lerpProgress >= 1.0) {
            // Finalize position
            building.position = { ...building.targetPosition };

            // Clear migration state
            delete building.drift;
            delete building.isMigrating;
            delete building.targetPosition;
            delete building.lerpPosition;
            delete building.lerpProgress;

            if (this.onBuildingUpdate) {
                this.onBuildingUpdate(building);
            }
        }

        return building;
    }

    /**
     * Migrate a building to a new district (Phase Shift).
     * Starts a smooth glide animation to the new position.
     * @param {string} agentId - The agent ID to migrate
     * @param {string} newDistrict - Target district name
     * @returns {Object|null} Updated building or null if not found/invalid
     */
    migrateBuilding(agentId, newDistrict) {
        const building = this.buildings.get(agentId);
        if (!building) return null;

        // Validate district exists
        if (!DISTRICTS[newDistrict]) {
            console.warn(`Invalid district for migration: ${newDistrict}`);
            return null;
        }

        // Calculate new position in target district
        const newPosition = this._calculateBuildingPosition(newDistrict, agentId);

        // Update district
        building.district = newDistrict;
        building.isMigrating = true;

        // Set up glide animation
        this.setTargetPosition(agentId, newPosition);

        console.log(`🏗️ Phase Shift: ${agentId} -> ${newDistrict}`);

        return building;
    }

    // Private methods

    _getDistrictForRole(role) {
        return ROLE_TO_DISTRICT[role.toLowerCase()] || 'cognitive';
    }

    _calculateBuildingPosition(district, agentId) {
        const districtConfig = DISTRICTS[district];
        const angleRad = (districtConfig.angle * Math.PI) / 180;

        // Hash agentId for consistent positioning
        const hash = this._hashString(agentId);
        const spreadAngle = angleRad + ((hash % 60) - 30) * (Math.PI / 180);
        const distance = this.config.centerRadius + 50 + (hash % 150);

        return {
            x: Math.cos(spreadAngle) * distance,
            y: Math.sin(spreadAngle) * distance
        };
    }

    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            hash = ((hash << 5) - hash) + str.charCodeAt(i);
            hash = hash & hash;
        }
        return Math.abs(hash);
    }

    _calculateHeight(memory) {
        // Height ranges from 50 to 300 based on memory
        return Math.min(300, Math.max(50, memory / 2));
    }

    _calculateLuminance(activity) {
        // Luminance ranges from 0.2 to 1.0 based on activity
        return Math.min(1.0, Math.max(0.2, 0.2 + activity * 0.8));
    }

    _getBridgeColor(eventType) {
        const colors = {
            'system_command': 0x00ffff,
            'llm_inference': 0xaa00ff,
            'evolution_event': 0xffd700,
            'metabolism_update': 0x00ff00,
            'tectonic_shift': 0xff4400
        };
        return colors[eventType] || 0xffffff;
    }

    _pruneBridges() {
        const now = Date.now();
        this.bridges = this.bridges.filter(b => (now - b.createdAt) < b.ttl);
    }
}

// Export for module use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CityOrchestrator;
}
if (typeof window !== 'undefined') {
    window.CityOrchestrator = CityOrchestrator;
}
