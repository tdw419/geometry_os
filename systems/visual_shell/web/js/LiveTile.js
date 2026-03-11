/**
 * LiveTile - Manages a running VM instance within a Neural City building.
 *
 * A LiveTile represents a live, running VM instance that can be displayed
 * within a building in the Neural City visualization. It tracks state
 * transitions, framebuffer data for display, metrics, and console output.
 */
class LiveTile {
    /**
     * Create a new LiveTile instance.
     * @param {string} id - Unique identifier for this tile
     * @param {string} rtsPath - Path to the RTS file for this VM
     */
    constructor(id, rtsPath) {
        this.id = id;
        this.rtsPath = rtsPath;
        this.state = 'stopped';  // stopped, booting, running, error
        this.framebuffer = null;
        this.v3Format = rtsPath.includes('v3');
        this.terminalGrid = Array(24).fill(0).map(() => Array(80).fill(' '));
        this.cursor = { x: 0, y: 0 };
        this.metrics = {
            cpu: 0,
            memory: 0,
            uptime: 0
        };
        this.bootTime = null;
        this.consoleOutput = [];
    }

    /**
     * Set the tile state.
     * @param {string} state - New state: stopped, booting, running, error
     */
    setState(state) {
        this.state = state;
        if (state === 'running' && !this.bootTime) {
            this.bootTime = Date.now();
        }
    }

    /**
     * Update the framebuffer data for display.
     * @param {ArrayBuffer|Uint8Array} data - Pixel data
     * @param {number} width - Framebuffer width in pixels
     * @param {number} height - Framebuffer height in pixels
     */
    updateFramebuffer(data, width, height) {
        this.framebuffer = {
            data: data,
            width: width,
            height: height,
            timestamp: Date.now()
        };
    }

    /**
     * Update tile metrics.
     * @param {Object} metrics - Metrics object with cpu, memory, etc.
     */
    updateMetrics(metrics) {
        Object.assign(this.metrics, metrics);
        if (this.bootTime) {
            this.metrics.uptime = Math.floor((Date.now() - this.bootTime) / 1000);
        }
    }

    /**
     * Append text to the console output buffer.
     * @param {string} text - Console text to append
     */
    appendConsole(text) {
        this.consoleOutput.push({
            time: new Date().toISOString().slice(11, 19),
            text: text
        });
        if (this.consoleOutput.length > 100) {
            this.consoleOutput.shift();
        }
    }

    /**
     * Check if the tile is currently running or booting.
     * @returns {boolean} True if tile is active
     */
    isRunning() {
        return this.state === 'running' || this.state === 'booting';
    }

    /**
     * Get the current framebuffer or null if not available.
     * @returns {Object|null} Framebuffer object with data, width, height, timestamp
     */
    getFramebuffer() {
        return this.framebuffer;
    }

    /**
     * Get console output as formatted string.
     * @returns {string} Console output with timestamps
     */
    getConsoleText() {
        return this.consoleOutput.map(entry => `[${entry.time}] ${entry.text}`).join('\n');
    }

    /**
     * Update the terminal grid from v3 output.
     * @param {Array<Array<string>>} grid - 80x24 character grid
     * @param {Object} cursor - {x, y} cursor position
     */
    updateTerminalGrid(grid, cursor) {
        if (grid) this.terminalGrid = grid;
        if (cursor) this.cursor = cursor;
    }

    /**
     * Get terminal character at position.
     */
    getChar(x, y) {
        if (y >= 0 && y < 24 && x >= 0 && x < 80) {
            return this.terminalGrid[y][x];
        }
        return ' ';
    }

    /**
     * Reset the tile to stopped state.
     */
    reset() {
        this.state = 'stopped';
        this.framebuffer = null;
        this.bootTime = null;
        this.metrics = {
            cpu: 0,
            memory: 0,
            uptime: 0
        };
        this.consoleOutput = [];
    }
}

// Export for module use
if (typeof window !== 'undefined') {
    window.LiveTile = LiveTile;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = LiveTile;
}
