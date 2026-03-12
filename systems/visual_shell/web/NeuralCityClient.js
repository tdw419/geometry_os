/**
 * NeuralCityClient - Phase 42 Web Client
 *
 * Connects the browser to the Neural City simulation.
 * Citizens appear as colored circles on the brain map.
 */

class NeuralCityClient {
    constructor(options = {}) {
        this.url = options.url || 'ws://localhost:8765';
        this.ws = null;
        this.connected = false;
        
        // City state
        this.citizens = new Map();
        this.territories = new Map();
        this.stats = {
            population: 0,
            activeCitizens: 0,
            totalEnergy: 0
        };
        
        // Event handlers
        this.eventHandlers = {
            'connect': [],
            'disconnect': [],
            'city_update': [],
            'citizen_spawned': [],
            'citizen_died': [],
            'trade': [],
            'error': []
        };
    }
    
    async connect() {
        return new Promise((resolve, reject) => {
            try {
                this.ws = new WebSocket(this.url);
                
                this.ws.onopen = () => {
                    this.connected = true;
                    console.log('🏙️ NeuralCityClient connected');
                    this.emit('connect', { url: this.url });
                    resolve();
                };
                
                this.ws.onclose = (event) => {
                    this.connected = false;
                    this.emit('disconnect', { reason: event.reason });
                };
                
                this.ws.onerror = (error) => {
                    this.emit('error', { error });
                    reject(error);
                };
                
                this.ws.onmessage = (event) => {
                    this.handleMessage(event.data);
                };
                
            } catch (e) {
                reject(e);
            }
        });
    }
    
    disconnect() {
        if (this.ws) {
            this.ws.close();
            this.ws = null;
            this.connected = false;
        }
    }
    
    handleMessage(data) {
        try {
            const message = JSON.parse(data);
            const type = message.type;
            
            switch (type) {
                case 'CITY_UPDATE':
                    this.handleCityUpdate(message);
                    break;
                    
                case 'CITIZEN_SPAWNED':
                    this.handleCitizenSpawned(message);
                    break;
                    
                case 'CITIZEN_DIED':
                    this.handleCitizenDied(message);
                    break;
                    
                case 'TRADE':
                    this.handleTrade(message);
                    break;
                    
                case 'ERROR':
                    this.emit('error', message);
                    break;
            }
        } catch (e) {
            console.error('Failed to parse message:', e);
        }
    }
    
    handleCityUpdate(message) {
        // Update citizens
        if (message.citizens) {
            this.citizens.clear();
            for (const citizen of message.citizens) {
                this.citizens.set(citizen.id, citizen);
            }
        }
        
        // Update stats
        if (message.stats) {
            this.stats = message.stats;
        }
        
        this.emit('city_update', message);
    }
    
    handleCitizenSpawned(message) {
        const citizen = message.citizen;
        this.citizens.set(citizen.id, citizen);
        this.stats.population = this.citizens.size;
        this.emit('citizen_spawned', citizen);
    }
    
    handleCitizenDied(message) {
        const citizenId = message.citizen_id;
        this.citizens.delete(citizenId);
        this.stats.population = this.citizens.size;
        this.emit('citizen_died', message);
    }
    
    handleTrade(message) {
        this.emit('trade', message);
    }
    
    // Commands
    
    async colonize(district = null) {
        if (!this.connected) {
            return { success: false, error: 'Not connected' };
        }
        
        return new Promise((resolve, reject) => {
            const handler = (result) => {
                this.off('city_update', handler);
                resolve(result);
            };
            
            this.on('city_update', handler);
            
            this.ws.send(JSON.stringify({
                type: 'COLONIZE',
                district: district
            }));
            
            setTimeout(() => {
                this.off('city_update', handler);
                reject(new Error('Colonize timeout'));
            }, 10000);
        });
    }
    
    async getCitizen(citizenId) {
        if (!this.connected) {
            return null;
        }
        
        this.ws.send(JSON.stringify({
            type: 'GET_CITIZEN',
            citizen_id: citizenId
        }));
        
        return this.citizens.get(citizenId);
    }
    
    async tick() {
        if (!this.connected) return null;
        
        this.ws.send(JSON.stringify({
            type: 'CITY_TICK'
        }));
    }
    
    // Rendering
    
    getGuildColor(guild) {
        const colors = {
            'attention': '#0096ff',
            'memory': '#00ff96',
            'logic': '#ffc800',
            'substrate': '#969696',
            'intent': '#ff6464',
            'unknown': '#646464'
        };
        return colors[guild] || colors['unknown'];
    }
    
    renderToCanvas(ctx, offsetX = 0, offsetY = 0, scale = 1) {
        // Draw territories
        for (const [id, citizen] of this.citizens) {
            const x = (citizen.x + offsetX) * scale;
            const y = (citizen.y + offsetY) * scale;
            const radius = citizen.territory_radius * scale;
            
            // Territory fill
            ctx.fillStyle = this.getGuildColor(citizen.guild) + '40'; // 25% opacity
            ctx.beginPath();
            ctx.arc(x, y, radius, 0, Math.PI * 2);
            ctx.fill();
            
            // Territory border
            ctx.strokeStyle = this.getGuildColor(citizen.guild);
            ctx.lineWidth = 2;
            ctx.stroke();
            
            // Citizen center
            ctx.fillStyle = this.getGuildColor(citizen.guild);
            ctx.beginPath();
            ctx.arc(x, y, 4 * scale, 0, Math.PI * 2);
            ctx.fill();
            
            // Energy indicator
            const energyRadius = 6 * scale * citizen.energy;
            ctx.strokeStyle = '#ffffff80';
            ctx.lineWidth = 1;
            ctx.beginPath();
            ctx.arc(x, y, energyRadius, 0, Math.PI * 2 * citizen.energy);
            ctx.stroke();
        }
    }
    
    // Event emitter
    
    on(event, handler) {
        if (this.eventHandlers[event]) {
            this.eventHandlers[event].push(handler);
        }
    }
    
    off(event, handler) {
        if (this.eventHandlers[event]) {
            const idx = this.eventHandlers[event].indexOf(handler);
            if (idx >= 0) {
                this.eventHandlers[event].splice(idx, 1);
            }
        }
    }
    
    emit(event, data) {
        if (this.eventHandlers[event]) {
            for (const handler of this.eventHandlers[event]) {
                handler(data);
            }
        }
    }
}

if (typeof module !== 'undefined') {
    module.exports = { NeuralCityClient };
}
