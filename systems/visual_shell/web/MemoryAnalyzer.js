/**
 * Geometry OS: Memory Analyzer
 *
 * Analyzes memory access patterns and hotspots for the Pixel CPU.
 * Provides memory statistics visualization with <0.05ms overhead per access.
 */

// Import for Node.js environments
if (typeof require !== 'undefined' && typeof PIXI === 'undefined') {
    global.PIXI = require('pixi.js');
}

class MemoryAnalyzer {
    /**
     * Create a new MemoryAnalyzer instance
     * @param {Object} config - Configuration options
     */
    constructor(config = {}) {
        this.config = {
            maxAccessRecords: 50000,         // Maximum access records to keep
            regionSize: 4096,                 // Memory region size for analysis (4KB)
            hotspotThreshold: 100,             // Minimum accesses to be considered a hotspot
            enableVisualization: true,         // Enable memory visualization
            uiRefreshInterval: 200,           // UI refresh interval in ms
            maxHotspots: 20,                  // Maximum number of hotspots to track
            trackReads: true,                 // Track memory reads
            trackWrites: true,                // Track memory writes
            ...config
        };

        // Access tracking
        this.accessRecords = [];              // Circular buffer of access records
        this.accessIndex = 0;                 // Current index in circular buffer
        this.totalAccesses = 0;               // Total memory accesses
        this.totalReads = 0;                  // Total read operations
        this.totalWrites = 0;                 // Total write operations
        this.enabled = true;                  // Analyzer enabled flag

        // Region-based analysis (for hotspots)
        this.regionAccessCounts = new Map();  // Access count per region
        this.regionReadCounts = new Map();    // Read count per region
        this.regionWriteCounts = new Map();   // Write count per region

        // Pattern tracking
        this.accessPatterns = new Map();      // Sequential access patterns
        this.currentPattern = [];             // Current access sequence
        this.patternLength = 8;                // Pattern length to track

        // Performance tracking
        this.recordOverhead = 0;              // Time spent recording accesses
        this.analysisOverhead = 0;            // Time spent analyzing
        this.lastAnalysisTime = 0;            // Last analysis timestamp
        this.analysisInterval = 1000;         // Analysis interval in ms

        // Hotspots
        this.hotspots = [];                   // Identified hotspots
        this.hotspotRegions = new Map();      // Hotspot regions

        // Visualization components
        this.visualizationContainer = null;
        this.hotspotText = null;
        this.statsText = null;
        this.lastUIUpdate = 0;

        // Memory regions for tracking
        this.memoryRegions = {
            program: { start: 0x00000000, end: 0x000FFFFF, name: 'Program' },
            data: { start: 0x10000000, end: 0x100FFFFF, name: 'Data' },
            console: { start: 0x20000000, end: 0x2000FFFF, name: 'Console' },
            framebuffer: { start: 0x30000000, end: 0x3FFFFFFF, name: 'Framebuffer' }
        };

        console.log('✓ MemoryAnalyzer initialized');
    }

    /**
     * Record a memory access (optimized for <0.05ms overhead)
     * @param {number} address - Memory address accessed
     * @param {string} type - Access type ('read' or 'write')
     * @param {number} value - Value read or written
     * @param {number} pc - Program counter at time of access
     */
    recordAccess(address, type, value, pc) {
        if (!this.enabled) {
            return;
        }

        const startTime = performance.now();

        // Record access in circular buffer
        const record = {
            address,
            type,
            value,
            pc,
            timestamp: performance.now()
        };

        // Use circular buffer for memory efficiency
        if (this.accessRecords.length < this.config.maxAccessRecords) {
            this.accessRecords.push(record);
        } else {
            this.accessRecords[this.accessIndex] = record;
            this.accessIndex = (this.accessIndex + 1) % this.config.maxAccessRecords;
        }

        // Update counters
        this.totalAccesses++;
        if (type === 'read') {
            this.totalReads++;
        } else if (type === 'write') {
            this.totalWrites++;
        }

        // Track region access
        const regionKey = this.getRegionKey(address);
        this.incrementRegionAccess(regionKey, type);

        // Track access patterns
        this.trackAccessPattern(address, type);

        // Track overhead
        const overhead = performance.now() - startTime;
        this.recordOverhead += overhead;

        // Warn if overhead exceeds target
        if (overhead > 0.05 && this.totalAccesses <= 100) {
            console.warn(`⚠ MemoryAnalyzer overhead: ${overhead.toFixed(3)}ms (target: <0.05ms)`);
        }
    }

    /**
     * Get region key for an address
     * @param {number} address - Memory address
     * @returns {string} - Region key
     */
    getRegionKey(address) {
        const regionBase = Math.floor(address / this.config.regionSize) * this.config.regionSize;
        return `0x${regionBase.toString(16).padStart(8, '0')}`;
    }

    /**
     * Increment region access count
     * @param {string} regionKey - Region key
     * @param {string} type - Access type
     */
    incrementRegionAccess(regionKey, type) {
        // Total access count
        const totalCount = this.regionAccessCounts.get(regionKey) || 0;
        this.regionAccessCounts.set(regionKey, totalCount + 1);

        // Read/write specific counts
        if (type === 'read') {
            const readCount = this.regionReadCounts.get(regionKey) || 0;
            this.regionReadCounts.set(regionKey, readCount + 1);
        } else if (type === 'write') {
            const writeCount = this.regionWriteCounts.get(regionKey) || 0;
            this.regionWriteCounts.set(regionKey, writeCount + 1);
        }
    }

    /**
     * Track access patterns (sequential access detection)
     * @param {number} address - Memory address
     * @param {string} type - Access type
     */
    trackAccessPattern(address, type) {
        this.currentPattern.push({ address, type });

        if (this.currentPattern.length > this.patternLength) {
            this.currentPattern.shift();
        }

        if (this.currentPattern.length === this.patternLength) {
            const patternKey = this.getPatternKey(this.currentPattern);
            const count = this.accessPatterns.get(patternKey) || 0;
            this.accessPatterns.set(patternKey, count + 1);
        }
    }

    /**
     * Get pattern key for a sequence of accesses
     * @param {Array} pattern - Access pattern
     * @returns {string} - Pattern key
     */
    getPatternKey(pattern) {
        return pattern.map(p => `${p.type}:${p.address.toString(16)}`).join('|');
    }

    /**
     * Analyze memory access data and identify hotspots
     * @returns {Object} - Analysis results
     */
    analyze() {
        const startTime = performance.now();

        // Identify hotspots
        this.identifyHotspots();

        // Analyze patterns
        const patterns = this.identifyPatterns();

        // Calculate statistics
        const stats = this.calculateStatistics();

        // Track overhead
        const overhead = performance.now() - startTime;
        this.analysisOverhead += overhead;
        this.lastAnalysisTime = performance.now();

        return {
            hotspots: this.hotspots,
            patterns,
            stats,
            overhead
        };
    }

    /**
     * Identify memory hotspots (frequently accessed regions)
     */
    identifyHotspots() {
        this.hotspots = [];
        this.hotspotRegions.clear();

        // Sort regions by access count
        const sortedRegions = Array.from(this.regionAccessCounts.entries())
            .sort((a, b) => b[1] - a[1]);

        // Identify hotspots
        for (const [regionKey, count] of sortedRegions) {
            if (count < this.config.hotspotThreshold) {
                continue;
            }

            if (this.hotspots.length >= this.config.maxHotspots) {
                break;
            }

            const regionBase = parseInt(regionKey, 16);
            const readCount = this.regionReadCounts.get(regionKey) || 0;
            const writeCount = this.regionWriteCounts.get(regionKey) || 0;
            const regionName = this.getRegionName(regionBase);

            this.hotspots.push({
                region: regionKey,
                base: regionBase,
                end: regionBase + this.config.regionSize - 1,
                totalAccesses: count,
                readCount,
                writeCount,
                readPercent: ((readCount / count) * 100).toFixed(1),
                writePercent: ((writeCount / count) * 100).toFixed(1),
                regionName
            });

            this.hotspotRegions.set(regionKey, this.hotspots[this.hotspots.length - 1]);
        }
    }

    /**
     * Get region name for an address
     * @param {number} address - Memory address
     * @returns {string} - Region name
     */
    getRegionName(address) {
        for (const [key, region] of Object.entries(this.memoryRegions)) {
            if (address >= region.start && address <= region.end) {
                return region.name;
            }
        }
        return 'Unknown';
    }

    /**
     * Identify frequent access patterns
     * @returns {Array} - Array of patterns with frequencies
     */
    identifyPatterns(minFrequency = 10) {
        const patterns = [];

        for (const [patternKey, count] of this.accessPatterns.entries()) {
            if (count >= minFrequency) {
                patterns.push({
                    pattern: patternKey,
                    frequency: count,
                    accesses: this.parsePattern(patternKey)
                });
            }
        }

        // Sort by frequency
        return patterns.sort((a, b) => b.frequency - a.frequency);
    }

    /**
     * Parse pattern key into access array
     * @param {string} patternKey - Pattern key
     * @returns {Array} - Array of accesses
     */
    parsePattern(patternKey) {
        return patternKey.split('|').map(part => {
            const [type, addr] = part.split(':');
            return { type, address: parseInt(addr, 16) };
        });
    }

    /**
     * Calculate memory access statistics
     * @returns {Object} - Statistics object
     */
    calculateStatistics() {
        const totalRegions = this.regionAccessCounts.size;
        const activeRegions = Array.from(this.regionAccessCounts.values())
            .filter(count => count >= this.config.hotspotThreshold).length;

        // Calculate region distribution
        let programAccesses = 0;
        let dataAccesses = 0;
        let consoleAccesses = 0;
        let framebufferAccesses = 0;

        for (const [regionKey, count] of this.regionAccessCounts.entries()) {
            const regionBase = parseInt(regionKey, 16);
            const regionName = this.getRegionName(regionBase);

            switch (regionName) {
                case 'Program':
                    programAccesses += count;
                    break;
                case 'Data':
                    dataAccesses += count;
                    break;
                case 'Console':
                    consoleAccesses += count;
                    break;
                case 'Framebuffer':
                    framebufferAccesses += count;
                    break;
            }
        }

        return {
            totalAccesses: this.totalAccesses,
            totalReads: this.totalReads,
            totalWrites: this.totalWrites,
            readPercent: this.totalAccesses > 0
                ? ((this.totalReads / this.totalAccesses) * 100).toFixed(1)
                : 0,
            writePercent: this.totalAccesses > 0
                ? ((this.totalWrites / this.totalAccesses) * 100).toFixed(1)
                : 0,
            totalRegions,
            activeRegions,
            programAccesses,
            dataAccesses,
            consoleAccesses,
            framebufferAccesses,
            avgOverhead: this.totalAccesses > 0
                ? (this.recordOverhead / this.totalAccesses).toFixed(4)
                : 0
        };
    }

    /**
     * Get performance statistics
     * @returns {Object} - Performance statistics
     */
    getPerformanceStats() {
        return {
            totalAccesses: this.totalAccesses,
            recordOverhead: this.recordOverhead.toFixed(4),
            avgRecordOverhead: this.totalAccesses > 0
                ? (this.recordOverhead / this.totalAccesses).toFixed(4)
                : 0,
            analysisOverhead: this.analysisOverhead.toFixed(4),
            lastAnalysisTime: this.lastAnalysisTime,
            enabled: this.enabled
        };
    }

    /**
     * Create memory visualization UI
     * @param {Object} infiniteMap - Reference to InfiniteMap instance
     */
    createVisualizationUI(infiniteMap) {
        if (!this.config.enableVisualization || !infiniteMap) {
            return;
        }

        const container = new PIXI.Container();
        container.x = -750; // Position to the left of CPU state overlay
        container.y = -200;
        container.zIndex = 1000;

        // Background
        const bg = new PIXI.Graphics();
        bg.beginFill(0x000000, 0.85);
        bg.lineStyle(2, 0xFF6600, 1.0); // Orange border
        bg.drawRoundedRect(0, 0, 300, 400, 8);
        bg.endFill();
        container.addChild(bg);

        // Title bar
        const titleBar = new PIXI.Graphics();
        titleBar.beginFill(0xFF6600, 0.3); // Orange background
        titleBar.drawRect(0, 0, 300, 30);
        titleBar.endFill();
        container.addChild(titleBar);

        // Title
        const title = new PIXI.Text('🧠 Memory Analyzer', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 14,
            fontWeight: 'bold',
            fill: 0xFF6600 // Orange
        });
        title.x = 10;
        title.y = 6;
        container.addChild(title);

        // Hotspots text
        this.hotspotText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 9,
            fill: 0xFFAA00 // Orange-yellow
        });
        this.hotspotText.x = 10;
        this.hotspotText.y = 40;
        container.addChild(this.hotspotText);

        // Statistics text
        this.statsText = new PIXI.Text('', {
            fontFamily: 'Monaco, Consolas, "Courier New", monospace',
            fontSize: 10,
            fill: 0xFFFFFF
        });
        this.statsText.x = 10;
        this.statsText.y = 200;
        container.addChild(this.statsText);

        // Add to infinite map world
        infiniteMap.world.addChild(container);
        this.visualizationContainer = container;

        console.log('✓ Memory analyzer visualization created');
    }

    /**
     * Update memory visualization UI
     * @param {number} timestamp - Current timestamp for throttling
     */
    updateVisualization(timestamp) {
        if (!this.visualizationContainer || !this.config.enableVisualization) {
            return;
        }

        // Throttle UI updates
        if (timestamp - this.lastUIUpdate < this.config.uiRefreshInterval) {
            return;
        }

        this.lastUIUpdate = timestamp;

        // Analyze memory access data
        const analysis = this.analyze();

        // Update hotspots display
        let hotspotText = '🔥 Hotspots:\n';
        if (this.hotspots.length === 0) {
            hotspotText += '  No hotspots yet\n';
        } else {
            for (let i = 0; i < Math.min(this.hotspots.length, 8); i++) {
                const h = this.hotspots[i];
                hotspotText += `  ${i + 1}. ${h.regionName}\n`;
                hotspotText += `     ${h.region} (${h.totalAccesses})\n`;
                hotspotText += `     R:${h.readPercent}% W:${h.writePercent}%\n`;
            }
        }
        this.hotspotText.text = hotspotText;

        // Update statistics display
        const stats = analysis.stats;
        let statsText = '📊 Statistics:\n';
        statsText += `  Total: ${stats.totalAccesses}\n`;
        statsText += `  Reads: ${stats.totalReads} (${stats.readPercent}%)\n`;
        statsText += `  Writes: ${stats.totalWrites} (${stats.writePercent}%)\n`;
        statsText += `  Regions: ${stats.activeRegions}/${stats.totalRegions}\n`;
        statsText += `\n📍 Distribution:\n`;
        statsText += `  Program: ${stats.programAccesses}\n`;
        statsText += `  Data: ${stats.dataAccesses}\n`;
        statsText += `  Console: ${stats.consoleAccesses}\n`;
        statsText += `  Framebuffer: ${stats.framebufferAccesses}\n`;
        statsText += `\n⚡ Performance:\n`;
        statsText += `  Avg Overhead: ${stats.avgOverhead}ms\n`;
        statsText += `  Target: <0.05ms\n`;
        this.statsText.text = statsText;
    }

    /**
     * Remove memory visualization UI
     */
    removeVisualizationUI() {
        if (this.visualizationContainer) {
            this.visualizationContainer.parent.removeChild(this.visualizationContainer);
            this.visualizationContainer = null;
            this.hotspotText = null;
            this.statsText = null;
            console.log('✓ Memory analyzer visualization removed');
        }
    }

    /**
     * Enable or disable memory tracking
     * @param {boolean} enabled - Whether tracking is enabled
     */
    setEnabled(enabled) {
        this.enabled = enabled;
        console.log(`Memory analyzer ${enabled ? 'enabled' : 'disabled'}`);
    }

    /**
     * Clear all recorded data
     */
    clear() {
        this.accessRecords = [];
        this.accessIndex = 0;
        this.totalAccesses = 0;
        this.totalReads = 0;
        this.totalWrites = 0;
        this.regionAccessCounts.clear();
        this.regionReadCounts.clear();
        this.regionWriteCounts.clear();
        this.accessPatterns.clear();
        this.currentPattern = [];
        this.hotspots = [];
        this.hotspotRegions.clear();
        this.recordOverhead = 0;
        this.analysisOverhead = 0;
        this.lastAnalysisTime = 0;

        console.log('✓ Memory analyzer data cleared');
    }

    /**
     * Export memory access data to JSON
     * @param {number} limit - Maximum number of records to export
     * @returns {string} - JSON string of access data
     */
    exportAccessData(limit = null) {
        const data = {
            config: this.config,
            totalAccesses: this.totalAccesses,
            totalReads: this.totalReads,
            totalWrites: this.totalWrites,
            hotspots: this.hotspots,
            patterns: this.identifyPatterns(),
            stats: this.calculateStatistics(),
            performance: this.getPerformanceStats(),
            accessRecords: limit
                ? this.accessRecords.slice(-limit)
                : this.accessRecords.slice(0, this.accessIndex)
        };

        return JSON.stringify(data, null, 2);
    }

    /**
     * Import memory access data from JSON
     * @param {string} json - JSON string to import
     */
    importAccessData(json) {
        try {
            const data = JSON.parse(json);

            // Restore configuration
            if (data.config) {
                this.config = { ...this.config, ...data.config };
            }

            // Restore statistics
            this.totalAccesses = data.totalAccesses || 0;
            this.totalReads = data.totalReads || 0;
            this.totalWrites = data.totalWrites || 0;

            // Restore hotspots
            this.hotspots = data.hotspots || [];

            // Restore patterns
            if (data.patterns) {
                for (const pattern of data.patterns) {
                    this.accessPatterns.set(pattern.pattern, pattern.frequency);
                }
            }

            // Restore region counts
            if (data.accessRecords) {
                for (const record of data.accessRecords) {
                    const regionKey = this.getRegionKey(record.address);
                    this.incrementRegionAccess(regionKey, record.type);
                }
            }

            console.log('✓ Memory analyzer data imported');
        } catch (error) {
            console.error('Failed to import memory access data:', error);
            throw error;
        }
    }

    /**
     * Get memory access heatmap data
     * @param {number} startAddress - Start address
     * @param {number} endAddress - End address
     * @param {number} resolution - Number of bins
     * @returns {Array} - Heatmap data
     */
    getHeatmapData(startAddress, endAddress, resolution = 64) {
        const heatmap = new Array(resolution).fill(0);
        const binSize = (endAddress - startAddress) / resolution;

        for (const record of this.accessRecords) {
            if (record.address >= startAddress && record.address < endAddress) {
                const binIndex = Math.floor((record.address - startAddress) / binSize);
                if (binIndex >= 0 && binIndex < resolution) {
                    heatmap[binIndex]++;
                }
            }
        }

        return heatmap;
    }

    /**
     * Get access frequency for a specific address
     * @param {number} address - Memory address
     * @returns {number} - Access count
     */
    getAddressAccessCount(address) {
        const regionKey = this.getRegionKey(address);
        return this.regionAccessCounts.get(regionKey) || 0;
    }

    /**
     * Get all hotspots
     * @returns {Array} - Array of hotspots
     */
    getHotspots() {
        return this.hotspots;
    }

    /**
     * Get top N hotspots
     * @param {number} n - Number of hotspots to return
     * @returns {Array} - Array of top N hotspots
     */
    getTopHotspots(n = 10) {
        return this.hotspots.slice(0, n);
    }
}

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = MemoryAnalyzer;
}
