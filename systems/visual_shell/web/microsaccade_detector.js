/**
 * MicrosaccadeDetector - Detection of microsaccades for visual stability
 *
 * Phase 47 Advanced Features - Task 2.3: Microsaccade Detection
 *
 * Detects and compensates for microsaccades (<1° movements):
 * - Microsaccade detection algorithm
 * - Visual stability compensation
 * - Tremor simulation during fixation
 * - Integration with quality scaler
 *
 * @class MicrosaccadeDetector
 */

class MicrosaccadeDetector {
    constructor(config = {}) {
        this.config = {
            // Detection threshold (pixels)
            microsaccadeThreshold: 5,         // < 5px = microsaccade
            
            // Detection window
            detectionWindow: 50,              // ms to analyze for detection
            
            // Compensation
            compensationEnabled: true,        // Apply compensation offset
            compensationDecay: 0.1,           // How fast compensation fades
            
            // Tremor simulation
            tremorEnabled: true,              // Simulate tremor during fixation
            tremorAmount: 0.5,                // pixels
            tremorFrequency: 80,              // Hz (typical microtremor frequency)
            
            // Visualization
            recordHistory: true,              // Keep history of microsaccades
            historyMaxLength: 100,             // Max microsaccades to record
            
            ...config
        };

        // State
        this.isActive = false;
        this.currentMicrosaccade = null;
        this.compensationOffset = { x: 0, y: 0 };
        
        // Position history for detection
        this.positionHistory = [];
        
        // Microsaccade history
        this.microsaccadeHistory = [];
        
        // Timing
        this.lastDetectionTime = 0;
        this.detectionPhase = 'idle';  // idle, detecting, compensating
        
        // Statistics
        this.stats = {
            totalDetected: 0,
            totalCompensated: 0,
            averageAmplitude: 0,
            averageDuration: 0,
            currentTremorPhase: 0
        };
    }

    /**
     * Analyze movement for microsaccade
     * @param {number} dx - X movement
     * @param {number} dy - Y movement
     * @returns {Object|null} - Microsaccade info or null
     */
    analyzeMovement(dx, dy) {
        const now = Date.now();
        const movement = Math.sqrt(dx * dx + dy * dy);
        
        // Check if movement is below threshold (microsaccade range)
        if (movement > this.config.microsaccadeThreshold) {
            return null;
        }
        
        // Add to position history
        this.positionHistory.push({
            dx, dy,
            movement,
            timestamp: now,
            phase: this.stats.currentTremorPhase
        });
        
        // Trim old history
        const cutoff = now - this.config.detectionWindow;
        this.positionHistory = this.positionHistory.filter(p => p.timestamp > cutoff);
        
        // Check for microsaccade pattern
        const microsaccade = this._detectMicrosaccadePattern();
        if (microsaccade) {
            this.isActive = true;
            this.currentMicrosaccade = microsaccade;
            this.stats.totalDetected++;
            
            // Calculate compensation
            if (this.config.compensationEnabled) {
                this.compensationOffset.x = -dx * this.config.compensationDecay;
                this.compensationOffset.y = -dy * this.config.compensationDecay;
            }
            
            // Record in history
            if (this.config.recordHistory) {
                this.microsaccadeHistory.push({
                    ...microsaccade,
                    timestamp: now
                });
                
                // Limit history size
                if (this.microsaccadeHistory.length > this.config.historyMaxLength) {
                    this.microsaccadeHistory.shift();
                }
            }
            
            this.lastDetectionTime = now;
            return microsaccade;
        }
        
        // Decay compensation offset
        if (this.config.compensationEnabled) {
            this.compensationOffset.x *= (1 - this.config.compensationDecay);
            this.compensationOffset.y *= (1 - this.config.compensationDecay);
        }
        
        // Check if microsaccade has ended
        if (this.isActive && (now - this.lastDetectionTime) > this.config.detectionWindow) {
            this.isActive = false;
            this.currentMicrosaccade = null;
        }
        
        return null;
    }

    /**
     * Detect microsaccade pattern from position history
     */
    _detectMicrosaccadePattern() {
        if (this.positionHistory.length < 3) {
            return null;
        }
        
        // Calculate movement vector
        const totalDx = this.positionHistory.reduce((sum, p) => sum + p.dx, 0);
        const totalDy = this.positionHistory.reduce((sum, p) => sum + p.dy, 0);
        const amplitude = Math.sqrt(totalDx * totalDx + totalDy * totalDy);
        
        // Check amplitude threshold
        if (amplitude < 0.5 || amplitude > this.config.microsaccadeThreshold) {
            return null;
        }
        
        // Check for quick directional movement (characteristic of microsaccades)
        const recent = this.positionHistory.slice(-5);
        const directionVariance = this._calculateDirectionVariance(recent);
        
        if (directionVariance > 0.5) {
            // Too much variance - not a clean microsaccade
            return null;
        }
        
        // Calculate duration
        const oldest = this.positionHistory[0];
        const newest = this.positionHistory[this.positionHistory.length - 1];
        const duration = newest.timestamp - oldest.timestamp;
        
        // Update statistics
        this.stats.averageAmplitude = 
            (this.stats.averageAmplitude * (this.stats.totalDetected - 1) + amplitude) / 
            this.stats.totalDetected;
        this.stats.averageDuration = 
            (this.stats.averageDuration * (this.stats.totalDetected - 1) + duration) / 
            this.stats.totalDetected;
        
        return {
            amplitude,
            direction: Math.atan2(totalDy, totalDx),
            duration,
            startTime: oldest.timestamp,
            endTime: newest.timestamp
        };
    }

    /**
     * Calculate variance in movement direction
     */
    _calculateDirectionVariance(positions) {
        if (positions.length < 2) return 0;
        
        const directions = [];
        for (let i = 1; i < positions.length; i++) {
            const angle = Math.atan2(positions[i].dy, positions[i].dx);
            directions.push(angle);
        }
        
        // Calculate variance of directions
        const mean = directions.reduce((sum, a) => sum + a, 0) / directions.length;
        const variance = directions.reduce((sum, a) => sum + Math.pow(a - mean, 2), 0) / directions.length;
        
        return variance;
    }

    /**
     * Check if microsaccade is currently active
     */
    isMicrosaccadeActive() {
        return this.isActive;
    }

    /**
     * Get compensation offset
     */
    getCompensation() {
        return {
            x: this.compensationOffset.x,
            y: this.compensationOffset.y,
            isActive: this.isActive
        };
    }

    /**
     * Get simulated tremor for current frame
     */
    getTremor() {
        if (!this.config.tremorEnabled) {
            return { x: 0, y: 0 };
        }
        
        // Update tremor phase
        this.stats.currentTremorPhase += (this.config.tremorFrequency * 0.016);  // Assume ~60fps
        
        // Generate tremor using sinusoidal motion
        const tremorX = Math.sin(this.stats.currentTremorPhase) * this.config.tremorAmount;
        const tremorY = Math.cos(this.stats.currentTremorPhase * 1.3) * this.config.tremorAmount;
        
        return { x: tremorX, y: tremorY };
    }

    /**
     * Apply compensation to a position
     */
    applyCompensation(position) {
        const compensation = this.getCompensation();
        const tremor = this.getTremor();
        
        return {
            x: position.x + compensation.x + tremor.x,
            y: position.y + compensation.y + tremor.y
        };
    }

    /**
     * Get visualization data for debug display
     */
    getVisualizationData() {
        return {
            isActive: this.isActive,
            currentMicrosaccade: this.currentMicrosaccade,
            compensationOffset: { ...this.compensationOffset },
            tremorPhase: this.stats.currentTremorPhase,
            recentMicrosaccades: this.microsaccadeHistory.slice(-10)
        };
    }

    /**
     * Get statistics
     */
    getStats() {
        return {
            ...this.stats,
            isActive: this.isActive,
            compensationOffset: { ...this.compensationOffset },
            historyLength: this.microsaccadeHistory.length,
            detectionPhase: this.detectionPhase
        };
    }

    /**
     * Clear history
     */
    clearHistory() {
        this.positionHistory = [];
        this.microsaccadeHistory = [];
        this.stats.totalDetected = 0;
        this.stats.totalCompensated = 0;
    }

    /**
     * Update detector (call every frame)
     */
    update(deltaTime) {
        // Decay compensation offset
        this.compensationOffset.x *= (1 - this.config.compensationDecay);
        this.compensationOffset.y *= (1 - this.config.compensationDecay);
        
        // Check if active period has ended
        if (this.isActive) {
            const now = Date.now();
            if (now - this.lastDetectionTime > this.config.detectionWindow) {
                this.isActive = false;
                this.currentMicrosaccade = null;
            }
        }
    }

    /**
     * Destroy the detector
     */
    destroy() {
        this.clearHistory();
    }
}

// Export
if (typeof window !== 'undefined') {
    window.MicrosaccadeDetector = MicrosaccadeDetector;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { MicrosaccadeDetector };
}
