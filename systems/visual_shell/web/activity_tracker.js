/**
 * ActivityTracker - Tracks neural substrate access patterns with temporal decay
 *
 * Used by the neural heatmap overlay system to visualize which regions
 * of the neural substrate are active during inference.
 */
class ActivityTracker {
  /**
   * Create a new ActivityTracker
   * @param {Object} options - Configuration options
   * @param {number} options.gridSize - Size of grid cells in pixels (default: 16)
   * @param {number} options.decayRate - Activity decay per second (default: 0.95)
   * @param {number} options.maxAge - Maximum age before removal in seconds (default: 5.0)
   * @param {number} options.maxIntensity - Maximum activity intensity (default: 1.0)
   */
  constructor(options = {}) {
    this.gridSize = options.gridSize ?? 16;
    this.decayRate = options.decayRate ?? 0.95;
    this.maxAge = options.maxAge ?? 5.0;
    this.maxIntensity = options.maxIntensity ?? 1.0;

    // Sparse storage using Map for efficiency
    // Key: "x,y" grid coordinates, Value: activity level (0-1)
    this.activity = new Map();

    // Layer activity tracking
    // Key: layerName, Value: { intensity, lastUpdate }
    this.layerActivity = new Map();

    // Statistics
    this.stats = {
      totalCells: 0,
      activeCells: 0,
      lastUpdateTime: 0
    };

    // Activity history
    this.historyEnabled = true;
    this.history = []; // Array of {timestamp, activity}
    this.maxHistoryLength = 10000;
    this.historyDuration = 60000; // 1 minute max history
  }

  /**
   * Convert pixel coordinates to grid coordinates
   * @param {number} x - Pixel x coordinate
   * @param {number} y - Pixel y coordinate
   * @returns {string} Grid cell key
   */
  _toGridKey(x, y) {
    const gx = Math.floor(x / this.gridSize);
    const gy = Math.floor(y / this.gridSize);
    return `${gx},${gy}`;
  }

  /**
   * Record activity at a specific point
   * @param {number} x - X coordinate in pixels
   * @param {number} y - Y coordinate in pixels
   * @param {number} intensity - Activity intensity (0-1, default: 1.0)
   */
  recordActivity(x, y, intensity = 1.0) {
    const key = this._toGridKey(x, y);
    const clampedIntensity = Math.max(0, Math.min(this.maxIntensity, intensity));

    // Set or boost activity at this cell
    const current = this.activity.get(key) || 0;
    this.activity.set(key, Math.max(current, clampedIntensity));

    this.stats.totalCells = Math.max(this.stats.totalCells, this.activity.size);
  }

  /**
   * Record activity over a rectangular region
   * @param {number} x - X coordinate of region start
   * @param {number} y - Y coordinate of region start
   * @param {number} width - Width of region in pixels
   * @param {number} height - Height of region in pixels
   * @param {number} intensity - Activity intensity (0-1, default: 1.0)
   */
  recordRegionActivity(x, y, width, height, intensity = 1.0) {
    const clampedIntensity = Math.max(0, Math.min(this.maxIntensity, intensity));

    // Mark all grid cells in the region
    const startX = Math.floor(x / this.gridSize) * this.gridSize;
    const startY = Math.floor(y / this.gridSize) * this.gridSize;
    const endX = x + width;
    const endY = y + height;

    for (let gy = startY; gy < endY; gy += this.gridSize) {
      for (let gx = startX; gx < endX; gx += this.gridSize) {
        const key = this._toGridKey(gx, gy);
        const current = this.activity.get(key) || 0;
        this.activity.set(key, Math.max(current, clampedIntensity));
      }
    }

    this.stats.totalCells = Math.max(this.stats.totalCells, this.activity.size);
  }

  /**
   * Mark an entire neural layer as active
   * @param {string} layerName - Name of the layer
   * @param {Object} bounds - Layer bounds {x, y, width, height}
   * @param {number} intensity - Activity intensity (0-1, default: 1.0)
   */
  recordLayerAccess(layerName, bounds, intensity = 1.0) {
    const clampedIntensity = Math.max(0, Math.min(this.maxIntensity, intensity));

    // Store layer activity with timestamp
    this.layerActivity.set(layerName, {
      intensity: clampedIntensity,
      lastUpdate: performance.now() / 1000,
      bounds: { ...bounds }
    });

    // Record region activity
    if (bounds) {
      this.recordRegionActivity(
        bounds.x || 0,
        bounds.y || 0,
        bounds.width || this.gridSize,
        bounds.height || this.gridSize,
        clampedIntensity
      );
    }
  }

  /**
   * Update activity levels with temporal decay
   * @param {number} dt - Delta time in seconds
   * @returns {number} Number of active cells remaining
   */
  update(dt = 0.016) {
    const now = performance.now() / 1000;
    const decayFactor = Math.pow(this.decayRate, dt);
    const keysToDelete = [];

    // Decay point activity
    for (const [key, value] of this.activity) {
      const decayed = value * decayFactor;

      if (decayed < 0.01) {
        keysToDelete.push(key);
      } else {
        this.activity.set(key, decayed);
      }
    }

    // Remove decayed cells
    for (const key of keysToDelete) {
      this.activity.delete(key);
    }

    // Clean up old layer activity
    for (const [layerName, data] of this.layerActivity) {
      const age = now - data.lastUpdate;
      if (age > this.maxAge) {
        this.layerActivity.delete(layerName);
      }
    }

    // Record history snapshot
    this.recordHistory();

    this.stats.activeCells = this.activity.size;
    this.stats.lastUpdateTime = now;

    return this.stats.activeCells;
  }

  /**
   * Record current activity state to history
   */
  recordHistory() {
    if (!this.historyEnabled) return;

    const now = performance.now();
    const snapshot = {
      timestamp: now,
      activity: new Map(this.activity), // Clone current state
      layerActivity: new Map(this.layerActivity)
    };

    this.history.push(snapshot);

    // Trim old history
    this.trimHistory();
  }

  /**
   * Remove old history entries
   */
  trimHistory() {
    const now = performance.now();
    const maxAge = now - this.historyDuration;

    // Remove old entries
    while (this.history.length > 0 && this.history[0].timestamp < maxAge) {
      this.history.shift();
    }

    // Limit by length
    if (this.history.length > this.maxHistoryLength) {
      this.history.splice(0, this.history.length - this.maxHistoryLength);
    }
  }

  /**
   * Get history for a time range
   * @param {number} startTime - Start timestamp (optional)
   * @param {number} endTime - End timestamp (optional)
   * @returns {Array} Filtered history entries
   */
  getHistory(startTime = null, endTime = null) {
    const now = performance.now();
    const start = startTime || now - this.historyDuration;
    const end = endTime || now;

    return this.history.filter(entry =>
      entry.timestamp >= start && entry.timestamp <= end
    );
  }

  /**
   * Export history as JSON
   * @returns {Object} Serializable history data
   */
  exportHistory() {
    return {
      startTime: performance.now() - this.historyDuration,
      endTime: performance.now(),
      entries: this.history.map(entry => ({
        timestamp: entry.timestamp,
        cells: Array.from(entry.activity.entries()),
        layers: Array.from(entry.layerActivity.entries())
      }))
    };
  }

  /**
   * Get current activity level at a coordinate
   * @param {number} x - X coordinate in pixels
   * @param {number} y - Y coordinate in pixels
   * @returns {number} Activity level (0-1)
   */
  getActivityAt(x, y) {
    const key = this._toGridKey(x, y);
    return this.activity.get(key) || 0;
  }

  /**
   * Get activity level for a layer
   * @param {string} layerName - Name of the layer
   * @returns {number|null} Activity intensity or null if not found
   */
  getLayerActivity(layerName) {
    const data = this.layerActivity.get(layerName);
    return data ? data.intensity : null;
  }

  /**
   * Get all active cells with their positions and intensities
   * @returns {Array} Array of {x, y, intensity} objects
   */
  getActiveCells() {
    const cells = [];
    for (const [key, intensity] of this.activity) {
      const [gx, gy] = key.split(',').map(Number);
      cells.push({
        x: gx * this.gridSize,
        y: gy * this.gridSize,
        intensity,
        size: this.gridSize
      });
    }
    return cells;
  }

  /**
   * Get activity as a sparse array for rendering
   * @param {Object} bounds - View bounds {x, y, width, height}
   * @returns {Array} Array of {x, y, intensity} for visible cells
   */
  getVisibleActivity(bounds) {
    const cells = [];
    const startGX = Math.floor((bounds.x || 0) / this.gridSize);
    const startGY = Math.floor((bounds.y || 0) / this.gridSize);
    const endGX = Math.floor(((bounds.x || 0) + (bounds.width || 0)) / this.gridSize) + 1;
    const endGY = Math.floor(((bounds.y || 0) + (bounds.height || 0)) / this.gridSize) + 1;

    for (let gy = startGY; gy < endGY; gy++) {
      for (let gx = startGX; gx < endGX; gx++) {
        const key = `${gx},${gy}`;
        const intensity = this.activity.get(key);
        if (intensity && intensity > 0.01) {
          cells.push({
            x: gx * this.gridSize,
            y: gy * this.gridSize,
            intensity,
            size: this.gridSize
          });
        }
      }
    }

    return cells;
  }

  /**
   * Clear all activity
   */
  clear() {
    this.activity.clear();
    this.layerActivity.clear();
    this.stats.activeCells = 0;
  }

  /**
   * Get current statistics
   * @returns {Object} Statistics object
   */
  getStats() {
    return { ...this.stats };
  }

  /**
   * Export activity data for visualization
   * @returns {Object} Serializable activity data
   */
  export() {
    return {
      cells: Array.from(this.activity.entries()).map(([key, intensity]) => {
        const [x, y] = key.split(',').map(Number);
        return { x, y, intensity };
      }),
      layers: Array.from(this.layerActivity.entries()).map(([name, data]) => ({
        name,
        intensity: data.intensity,
        bounds: data.bounds
      })),
      stats: this.getStats()
    };
  }
}

// Export for use in Node.js environments
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { ActivityTracker };
}
