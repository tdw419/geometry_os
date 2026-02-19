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
            createdAt: Date.now()
        };

        this.buildings.set(agentId, building);

        if (this.onBuildingSpawn) {
            this.onBuildingSpawn(building);
        }

        return building;
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
