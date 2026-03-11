/**
 * Spatial Architect API Examples
 * 
 * This file demonstrates how the LLM can build structures on the Infinite Map.
 * Run these commands in the browser console to test the API.
 */

// ============================================================
// BASIC USAGE - Single Tile Placement
// ============================================================

// Example 1: Build a service tower
window.map.writeTile(5, 5, 'tower', {
    name: 'AuthService',
    description: 'User authentication microservice',
    codeReference: 'services/auth/index.js',
    complexity: 0.7,
    status: 'complete'
});

// Example 2: Build a database vault
window.map.writeTile(6, 5, 'vault', {
    name: 'UserDB',
    description: 'PostgreSQL user database',
    codeReference: 'infra/database/users.sql',
    status: 'complete'
});

// Example 3: Build an API bridge between services
window.map.writeTile(5, 6, 'bridge', {
    name: 'AuthAPI',
    description: 'REST API gateway for auth service',
    codeReference: 'api/auth/routes.js',
    status: 'building'
});

// ============================================================
// BATCH BUILDING - BuildManifest
// ============================================================

const exampleBuildManifest = {
    version: '1.0',
    clearExisting: false,  // Set to true to clear previous LLM builds
    structures: [
        // Core services cluster
        { x: 10, y: 10, type: 'tower', metadata: { 
            name: 'ApiGateway', 
            complexity: 0.8, 
            status: 'complete',
            codeReference: 'services/gateway/main.js'
        }},
        { x: 11, y: 10, type: 'tower', metadata: { 
            name: 'UserService', 
            complexity: 0.6, 
            status: 'complete',
            codeReference: 'services/users/index.js'
        }},
        { x: 12, y: 10, type: 'tower', metadata: { 
            name: 'PaymentService', 
            complexity: 0.9, 
            status: 'building',
            codeReference: 'services/payments/stripe.js'
        }},
        
        // Data layer
        { x: 11, y: 12, type: 'vault', metadata: { 
            name: 'PrimaryDB', 
            status: 'complete',
            codeReference: 'infra/postgres/main.tf'
        }},
        { x: 12, y: 12, type: 'vault', metadata: { 
            name: 'CacheLayer', 
            status: 'complete',
            codeReference: 'infra/redis/cache.conf'
        }},
        
        // Connections (bridges)
        { x: 11, y: 11, type: 'bridge', metadata: { 
            name: 'UserAPI', 
            status: 'complete',
            codeReference: 'api/users/openapi.yaml'
        }},
        { x: 10, y: 11, type: 'bridge', metadata: { 
            name: 'PaymentAPI', 
            status: 'building',
            codeReference: 'api/payments/routes.js'
        }},
        
        // Utility
        { x: 9, y: 10, type: 'garden', metadata: { 
            name: 'EventBus', 
            status: 'complete',
            description: 'Message queue garden'
        }},
        
        // New feature being worked on
        { x: 13, y: 10, type: 'scaffold', metadata: { 
            name: 'FeatureX', 
            status: 'building',
            description: 'Experimental new feature'
        }}
    ]
};

// Execute the build manifest
window.map.renderBuildManifest(exampleBuildManifest);

// ============================================================
// UTILITY FUNCTIONS
// ============================================================

// Export current builds to manifest
const manifest = window.map.exportBuildManifest();
console.log('Exported manifest:', JSON.stringify(manifest, null, 2));

// Get all LLM builds
const builds = window.map.getLLMBuilds();
console.log(`Total LLM builds: ${builds.length}`);

// Get specific tile info
const tile = window.map.getTile(5, 5);
console.log('Tile at (5,5):', tile);

// Remove a tile
window.map.removeTile(5, 5);

// Clear all LLM builds
window.map.clearLLMBuilds();

// ============================================================
// STRUCTURE TYPE REFERENCE
// ============================================================

/**
 * tower    - Microservices, API endpoints, functional units
 * bridge   - API connections, data flows, middleware
 * vault    - Databases, storage, secrets, caches
 * garden   - Event buses, message queues, organic growth
 * crystal  - Critical infrastructure, singletons, gems
 * scaffold - Work in progress, experimental features
 */

// ============================================================
// STATUS CODES
// ============================================================

/**
 * complete   - Production ready, fully functional
 * building   - Work in progress, under construction
 * error      - Has issues, needs attention (shows red)
 * deprecated - Legacy code, being phased out (shows gray)
 */
