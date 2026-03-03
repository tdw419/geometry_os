/**
 * GOS-RP (Geometry OS Routing Protocol) Implementation
 * 
 * This module handles the logic for visual routing based on Hilbert proximity
 * and semantic RGB encoding.
 */

export class GOSRouter {
    constructor(kernel) {
        this.kernel = kernel;
        this.myAddress = 0;
        this.routeTable = new Map(); // Hilbert Region -> Peer Info (addr, dist, trust)
        this.peers = new Map(); // Node ID -> Peer Info
        
        // Memory map for routing in shared RAM
        this.ROUTING_BASE = 2048; // Start of routing data in shared RAM
        this.PEER_TABLE_SIZE = 256;
        this.ROUTE_TABLE_SIZE = 256;

        this.MAX_HOPS = 16;
        this.TRUST_DECAY_RATE = 0.95;
    }

    /**
     * Initialize the router and register with the kernel
     */
    async init(myAddress) {
        this.myAddress = myAddress;
        console.log(`[GOS Router] Initialized at address 0x${myAddress.toString(16).padStart(8, '0')}`);
        
        // Add self to route table with distance 0 and max trust
        const myRegion = (this.myAddress >> 24) & 0xFF;
        this.routeTable.set(myRegion, {
            address: this.myAddress,
            distance: 0,
            trust: 1.0,
            lastSeen: Date.now()
        });

        // Set local address in shared memory for processes to see
        const addrData = new Uint32Array([this.myAddress]);
        this.kernel.writeSharedMemory(this.ROUTING_BASE, addrData);
    }

    /**
     * Advertise a route to the network (Distance Vector)
     * @param {number} targetAddress - Address being advertised
     * @param {number} distance - Distance to target from the sender
     * @param {number} senderAddr - The peer telling us about this route
     */
    receiveAdvertisement(targetAddress, distance, senderAddr) {
        const region = (targetAddress >> 24) & 0xFF;
        const newDistance = distance + 1;

        if (newDistance > this.MAX_HOPS) return;

        const existing = this.routeTable.get(region);
        
        // Update if shorter path found or if existing path is from the same sender
        if (!existing || newDistance < existing.distance || existing.gateway === senderAddr) {
            const oldDist = existing ? existing.distance : 'INF';
            console.log(`[GOS Router] Route update for region 0x${region.toString(16)}: ${oldDist} -> ${newDistance} via 0x${senderAddr.toString(16)}`);
            
            this.routeTable.set(region, {
                address: targetAddress,
                distance: newDistance,
                gateway: senderAddr,
                trust: existing ? existing.trust : 0.5, // Initial trust for new routes
                lastSeen: Date.now()
            });

            // Trigger propagation to our peers
            this.propagateRoutes();
            this._syncRouteTableToGPU();
        }
    }

    /**
     * Propagate our best routes to all known peers
     */
    propagateRoutes() {
        for (const [peerAddr, peerInfo] of this.peers) {
            for (const [region, routeInfo] of this.routeTable) {
                // Don't send a route back to the node we learned it from (Split Horizon)
                if (routeInfo.gateway === peerAddr) continue;

                // In a real implementation, this would send a packet to peerAddr
                // For simulation, we'll log it
                // console.log(`[GOS Router] Propagating route 0x${region.toString(16)} (dist ${routeInfo.distance}) to peer 0x${peerAddr.toString(16)}`);
            }
        }
    }

    /**
     * Calculate trust based on Hilbert proximity and history
     */
    updateTrustScores() {
        const myRegion = (this.myAddress >> 24) & 0xFF;

        for (const [region, info] of this.routeTable) {
            // Hilbert Distance for spatial trust
            const hDist = Math.abs(region - myRegion);
            const spatialFactor = 1.0 / (1.0 + hDist);
            
            // Decay trust over time
            info.trust *= this.TRUST_DECAY_RATE;
            
            // Reinforce if recently active
            if (Date.now() - info.lastSeen < 10000) {
                info.trust += 0.05 * spatialFactor;
            }

            info.trust = Math.min(1.0, Math.max(0, info.trust));
        }
        
        this._syncRouteTableToGPU();
    }

    /**
     * Discover neighbors via Hilbert proximity
     */
    async discoverPeers() {
        const myRegion = (this.myAddress >> 24) & 0xFF;
        const neighbors = [
            (myRegion - 1) & 0xFF,
            (myRegion + 1) & 0xFF
        ];
        
        for (const region of neighbors) {
            if (Math.random() > 0.4) {
                const peerAddr = (region << 24) | (Math.floor(Math.random() * 0xFFFFFF));
                this.peers.set(peerAddr, {
                    region: region,
                    lastPing: Date.now(),
                    trust: 0.8
                });
                
                // When we find a peer, they tell us about their own region immediately
                this.receiveAdvertisement(peerAddr, 0, peerAddr);
                console.log(`[GOS Router] Discovered peer at 0x${peerAddr.toString(16)}`);
            }
        }
        
        this._syncPeerTableToGPU();
    }

    /**
     * Synchronize the routing table to GPU RAM
     */
    _syncRouteTableToGPU() {
        const data = new Uint32Array(this.ROUTE_TABLE_SIZE);
        let i = 0;
        for (const [region, info] of this.routeTable) {
            if (i >= this.ROUTE_TABLE_SIZE) break;
            data[i] = (region << 24) | (info.distance & 0xFFFFFF);
            i++;
        }
        this.kernel.writeSharedMemory(this.ROUTING_BASE + 1, data);
    }

    /**
     * Synchronize the peer table to GPU RAM
     */
    _syncPeerTableToGPU() {
        const data = new Uint32Array(this.PEER_TABLE_SIZE);
        let i = 0;
        for (const [addr, info] of this.peers) {
            if (i >= this.PEER_TABLE_SIZE) break;
            data[i] = addr;
            i++;
        }
        this.kernel.writeSharedMemory(this.ROUTING_BASE + 257, data);
    }

    /**
     * Process routing requests from the kernel
     */
    async update() {
        // Read routing requests from shared memory (e.g., RAM[2047])
        const requests = await this.kernel.readSharedMemory(2047, 1);
        if (requests[0] !== 0) {
            console.log(`[GOS Router] Processing routing request: ${requests[0]}`);
            // Handle different request types...
            
            // Clear request
            this.kernel.writeSharedMemory(2047, new Uint32Array([0]));
        }
    }
}
