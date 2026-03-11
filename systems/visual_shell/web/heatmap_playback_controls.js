/**
 * Heatmap Playback Controls
 *
 * Control history playback with timeline scrubbing for the neural heatmap overlay.
 * Provides UI for playing/pausing, scrubbing through activity history, speed control,
 * and time display. Features glassmorphic design matching the LayerTooltip style.
 *
 * @see https://github.com/anthropics/geometry-os/blob/main/docs/plans/2026-02-07-neural-heatmap-improvement-roadmap.md
 * @class HeatmapPlaybackControls
 */
class HeatmapPlaybackControls {
    /**
     * Create a new HeatmapPlaybackControls instance
     * @param {ActivityTracker} activityTracker - The activity tracker to read history from
     * @param {Object} options - Configuration options
     * @param {number} options.width - Width of the controls container (default: 400)
     * @param {number} options.height - Height of the controls container (default: 80)
     * @param {number} options.padding - Internal padding for content (default: 10)
     * @param {number} options.cornerRadius - Corner radius for glassmorphic effect (default: 8)
     * @param {number} options.timelineHeight - Height of the timeline bar (default: 20)
     * @param {number} options.buttonWidth - Width of action buttons (default: 65)
     * @param {number} options.buttonHeight - Height of action buttons (default: 22)
     * @param {Array<number>} options.speedPresets - Playback speed options (default: [0.25, 0.5, 1, 2, 4])
     * @param {string} options.primaryColor - Primary accent color (default: '#00FFFF')
     * @param {string} options.secondaryColor - Secondary accent color (default: '#0066FF')
     * @param {string} options.backgroundColor - Background fill color (default: '#0a0a1a')
     * @param {number} options.backgroundAlpha - Background opacity (default: 0.9)
     */
    constructor(activityTracker, options = {}) {
        if (!activityTracker) {
            throw new Error('HeatmapPlaybackControls requires an activityTracker instance');
        }

        /**
         * The activity tracker to read history from
         * @type {ActivityTracker}
         */
        this.activityTracker = activityTracker;

        /**
         * Configuration options
         * @type {Object}
         */
        this.options = {
            width: 400,
            height: 80,
            padding: 10,
            cornerRadius: 8,
            timelineHeight: 20,
            buttonWidth: 65,
            buttonHeight: 22,
            speedPresets: [0.25, 0.5, 1, 2, 4],
            primaryColor: 0x00FFFF,
            secondaryColor: 0x0066FF,
            backgroundColor: 0x0a0a1a,
            backgroundAlpha: 0.9,
            ...options
        };

        /**
         * Current playback state
         * @type {boolean}
         */
        this.playing = false;

        /**
         * Current playback speed multiplier
         * @type {number}
         */
        this.playbackSpeed = 1.0;

        /**
         * Current playback position in milliseconds
         * @type {number}
         */
        this.currentTime = 0;

        /**
         * Timestamp when playback started
         * @type {number}
         */
        this.playbackStartTime = 0;

        /**
         * Animation frame ID for playback loop
         * @type {number|null}
         */
        this.animationFrame = null;

        /**
         * Current speed preset index
         * @type {number}
         */
        this.currentSpeedIndex = 2; // Default to 1x speed

        // PIXI components (initialized in create())
        /** @type {PIXI.Container|null} */
        this.container = null;
        /** @type {PIXI.Graphics|null} */
        this.background = null;
        /** @type {PIXI.Graphics|null} */
        this.timeline = null;
        /** @type {PIXI.Container|null} */
        this.playButton = null;
        /** @type {PIXI.Container|null} */
        this.speedButton = null;
        /** @type {PIXI.Text|null} */
        this.timeLabel = null;
        /** @type {PIXI.Text|null} */
        this.titleLabel = null;

        /**
         * Timeline interaction state
         * @private
         * @type {boolean}
         */
        this._scrubbing = false;

        /**
         * Cached history bounds
         * @private
         * @type {Object|null}
         */
        this._historyBounds = null;

        /**
         * Event callbacks
         * @type {Object}
         * @property {Function} onPlay - Called when playback starts
         * @property {Function} onPause - Called when playback pauses
         * @property {Function} onSeek - Called when timeline position changes
         * @property {Function} onSpeedChange - Called when playback speed changes
         */
        this.callbacks = {
            onPlay: null,
            onPause: null,
            onSeek: null,
            onSpeedChange: null
        };

        console.log('[PlaybackControls] Initialized with activity tracker');
    }

    /**
     * Create the playback controls UI
     * @returns {PIXI.Container} The container with all controls
     */
    create() {
        // Main container
        this.container = new PIXI.Container();
        this.container.name = 'heatmapPlaybackControls';
        this.container.zIndex = 1000;

        // Position (can be overridden after creation)
        this.container.x = 20;
        this.container.y = 350;

        // Glassmorphic background
        this.background = new PIXI.Graphics();
        this.drawBackground();
        this.container.addChild(this.background);

        // Title label
        this.titleLabel = new PIXI.Text('Activity Playback', {
            fontFamily: 'Arial, sans-serif',
            fontSize: 11,
            fontWeight: 'bold',
            fill: this.options.primaryColor,
            letterSpacing: 0.5
        });
        this.titleLabel.x = this.options.padding + 2;
        this.titleLabel.y = this.options.padding;
        this.container.addChild(this.titleLabel);

        // Timeline bar
        this.timeline = new PIXI.Graphics();
        this.timeline.x = this.options.padding;
        this.timeline.y = 28;
        this.container.addChild(this.timeline);

        // Play/Pause button
        this.playButton = this.createButton('▶ Play', 'playPause');
        this.playButton.x = this.options.padding;
        this.playButton.y = 52;
        this.container.addChild(this.playButton);

        // Speed control button
        this.speedButton = this.createButton('1.0x', 'speed');
        this.speedButton.x = this.options.padding + this.options.buttonWidth + 8;
        this.speedButton.y = 52;
        this.container.addChild(this.speedButton);

        // Time display label
        this.timeLabel = new PIXI.Text('0.0s / 0.0s', {
            fontFamily: 'Monaco, Consolas, monospace',
            fontSize: 11,
            fill: 0x00FF88,
            fontWeight: '500'
        });
        this.timeLabel.x = this.options.width - this.options.padding - 80;
        this.timeLabel.y = 56;
        this.timeLabel.anchor.set(1, 0);
        this.container.addChild(this.timeLabel);

        // Make container interactive
        this.container.eventMode = 'static';
        this.container.cursor = 'default';

        // Setup timeline interaction
        this.setupTimelineInteraction();

        // Initialize timeline state
        this.updateHistoryBounds();
        this.drawTimeline();

        console.log('[PlaybackControls] UI created');

        return this.container;
    }

    /**
     * Draw the glassmorphic background
     * @private
     */
    drawBackground() {
        if (!this.background) return;

        this.background.clear();

        // Main background with glassmorphic effect
        this.background.beginFill(
            this.options.backgroundColor,
            this.options.backgroundAlpha
        );
        this.background.lineStyle(1, this.options.primaryColor, 0.5);

        // Rounded rectangle for glass effect
        this.background.drawRoundedRect(
            0,
            0,
            this.options.width,
            this.options.height,
            this.options.cornerRadius
        );
        this.background.endFill();

        // Add subtle inner glow
        this.background.lineStyle(1, this.options.primaryColor, 0.15);
        this.background.drawRoundedRect(
            1,
            1,
            this.options.width - 2,
            this.options.height - 2,
            this.options.cornerRadius - 1
        );

        // Add subtle gradient effect at top
        const gradientAlpha = 0.05;
        this.background.beginFill(this.options.primaryColor, gradientAlpha);
        this.background.drawRoundedRect(
            2,
            2,
            this.options.width - 4,
            this.options.height * 0.3,
            this.options.cornerRadius - 2
        );
        this.background.endFill();
    }

    /**
     * Create a styled button
     * @param {string} label - Button text label
     * @param {string} type - Button type identifier
     * @returns {PIXI.Container} Button container
     * @private
     */
    createButton(label, type) {
        const button = new PIXI.Container();
        button.name = `button_${type}`;
        button.eventMode = 'static';
        button.cursor = 'pointer';

        // Button background
        const bg = new PIXI.Graphics();
        bg.name = 'background';

        // Default state
        bg.beginFill(this.options.primaryColor, 0.15);
        bg.lineStyle(1, this.options.primaryColor, 0.7);
        bg.drawRoundedRect(
            0,
            0,
            this.options.buttonWidth,
            this.options.buttonHeight,
            4
        );
        bg.endFill();

        button.addChild(bg);

        // Button text
        const text = new PIXI.Text(label, {
            fontFamily: 'Arial, sans-serif',
            fontSize: 10,
            fontWeight: '600',
            fill: this.options.primaryColor,
            letterSpacing: 0.3
        });
        text.name = 'text';
        text.x = this.options.buttonWidth / 2;
        text.y = this.options.buttonHeight / 2;
        text.anchor.set(0.5);
        button.addChild(text);

        // Hover effect
        button.on('pointerover', () => {
            bg.clear();
            bg.beginFill(this.options.primaryColor, 0.25);
            bg.lineStyle(1, this.options.primaryColor, 0.9);
            bg.drawRoundedRect(
                0,
                0,
                this.options.buttonWidth,
                this.options.buttonHeight,
                4
            );
            bg.endFill();
        });

        button.on('pointerout', () => {
            bg.clear();
            bg.beginFill(this.options.primaryColor, 0.15);
            bg.lineStyle(1, this.options.primaryColor, 0.7);
            bg.drawRoundedRect(
                0,
                0,
                this.options.buttonWidth,
                this.options.buttonHeight,
                4
            );
            bg.endFill();
        });

        // Click effect
        button.on('pointerdown', () => {
            bg.clear();
            bg.beginFill(this.options.primaryColor, 0.35);
            bg.lineStyle(1, this.options.primaryColor, 1);
            bg.drawRoundedRect(
                0,
                0,
                this.options.buttonWidth,
                this.options.buttonHeight,
                4
            );
            bg.endFill();
        });

        button.on('pointerup', () => {
            bg.clear();
            bg.beginFill(this.options.primaryColor, 0.25);
            bg.lineStyle(1, this.options.primaryColor, 0.9);
            bg.drawRoundedRect(
                0,
                0,
                this.options.buttonWidth,
                this.options.buttonHeight,
                4
            );
            bg.endFill();
        });

        return button;
    }

    /**
     * Setup timeline scrubbing interaction
     * @private
     */
    setupTimelineInteraction() {
        if (!this.timeline) return;

        this.timeline.eventMode = 'static';
        this.timeline.cursor = 'col-resize';

        const timelineWidth = this.options.width - (this.options.padding * 2);

        // Create hit area for timeline
        this.timeline.hitArea = new PIXI.Rectangle(
            -5,
            -5,
            timelineWidth + 10,
            this.options.timelineHeight + 10
        );

        this.timeline.on('pointerdown', (event) => {
            this._scrubbing = true;
            this.scrubToPosition(event.global.x);
        });

        this.timeline.on('pointermove', (event) => {
            if (this._scrubbing) {
                this.scrubToPosition(event.global.x);
            }
        });

        const endScrubbing = () => {
            if (this._scrubbing) {
                this._scrubbing = false;
                if (this.callbacks.onSeek) {
                    this.callbacks.onSeek(this.currentTime);
                }
            }
        };

        this.timeline.on('pointerup', endScrubbing);
        this.timeline.on('pointerupoutside', endScrubbing);

        // Hook up button click handlers
        if (this.playButton) {
            this.playButton.on('pointerdown', () => this.togglePlay());
        }

        if (this.speedButton) {
            this.speedButton.on('pointerdown', () => this.cycleSpeed());
        }
    }

    /**
     * Scrub timeline to a screen X position
     * @param {number} screenX - Screen X coordinate
     */
    scrubToPosition(screenX) {
        const timelineGlobal = this.timeline.getGlobalPosition();
        const relativeX = screenX - timelineGlobal.x;
        const timelineWidth = this.options.width - (this.options.padding * 2);

        // Clamp to valid range
        const progress = Math.max(0, Math.min(1, relativeX / timelineWidth));

        // Update current time based on history bounds
        if (this._historyBounds && this._historyBounds.range > 0) {
            this.currentTime = this._historyBounds.first + (progress * this._historyBounds.range);
            this.updateTimeLabel();
            this.drawTimeline();

            // Trigger callback with debouncing during scrub
            if (!this._scrubbing && this.callbacks.onSeek) {
                this.callbacks.onSeek(this.currentTime);
            }
        }
    }

    /**
     * Update cached history bounds
     * @private
     */
    updateHistoryBounds() {
        const history = this.activityTracker.getHistory();

        if (history.length > 0) {
            this._historyBounds = {
                first: history[0].timestamp,
                last: history[history.length - 1].timestamp,
                range: history[history.length - 1].timestamp - history[0].timestamp,
                count: history.length
            };

            // Initialize current time if not set
            if (this.currentTime === 0) {
                this.currentTime = this._historyBounds.first;
            }
        } else {
            this._historyBounds = {
                first: 0,
                last: 0,
                range: 0,
                count: 0
            };
        }

        this.updateTimeLabel();
    }

    /**
     * Toggle playback state
     * @returns {boolean} New playing state
     */
    togglePlay() {
        this.playing = !this.playing;

        if (this.playing) {
            this.playbackStartTime = performance.now() - (this.currentTime - this._historyBounds?.first || 0);
            this.startPlayback();
            if (this.callbacks.onPlay) {
                this.callbacks.onPlay();
            }
        } else {
            this.stopPlayback();
            if (this.callbacks.onPause) {
                this.callbacks.onPause();
            }
        }

        this.updatePlayButton();
        return this.playing;
    }

    /**
     * Start playback animation loop
     * @private
     */
    startPlayback() {
        // Update history bounds before starting
        this.updateHistoryBounds();

        if (!this._historyBounds || this._historyBounds.range === 0) {
            console.warn('[PlaybackControls] No history to play');
            this.playing = false;
            this.updatePlayButton();
            return;
        }

        const animate = () => {
            if (!this.playing) return;

            const elapsed = (performance.now() - this.playbackStartTime) * this.playbackSpeed;
            this.currentTime = this._historyBounds.first + elapsed;

            // Check if we've reached the end
            if (this.currentTime >= this._historyBounds.last) {
                this.currentTime = this._historyBounds.last;
                this.playing = false;
                this.updatePlayButton();
                this.updateTimeLabel();
                this.drawTimeline();

                if (this.callbacks.onPause) {
                    this.callbacks.onPause();
                }
                return;
            }

            this.updateTimeLabel();
            this.drawTimeline();

            this.animationFrame = requestAnimationFrame(animate);
        };

        animate();
    }

    /**
     * Stop playback animation
     * @private
     */
    stopPlayback() {
        if (this.animationFrame !== null) {
            cancelAnimationFrame(this.animationFrame);
            this.animationFrame = null;
        }
    }

    /**
     * Update play/pause button text
     * @private
     */
    updatePlayButton() {
        if (!this.playButton) return;

        const text = this.playButton.getChildByName('text');
        if (text) {
            text.text = this.playing ? '⏸ Pause' : '▶ Play';
        }
    }

    /**
     * Cycle to next playback speed
     * @returns {number} New playback speed
     */
    cycleSpeed() {
        this.currentSpeedIndex = (this.currentSpeedIndex + 1) % this.options.speedPresets.length;
        this.playbackSpeed = this.options.speedPresets[this.currentSpeedIndex];
        this.updateSpeedButton();

        if (this.callbacks.onSpeedChange) {
            this.callbacks.onSpeedChange(this.playbackSpeed);
        }

        // Restart playback if currently playing to apply new speed
        if (this.playing) {
            this.stopPlayback();
            this.playbackStartTime = performance.now() - (this.currentTime - this._historyBounds?.first || 0) / this.playbackSpeed;
            this.startPlayback();
        }

        return this.playbackSpeed;
    }

    /**
     * Set playback speed directly
     * @param {number} speed - Playback speed multiplier
     * @returns {number} The set speed (may be clamped to preset)
     */
    setSpeed(speed) {
        // Find closest preset
        const closestIndex = this.options.speedPresets.findIndex(
            preset => Math.abs(preset - speed) < 0.01
        );

        if (closestIndex !== -1) {
            this.currentSpeedIndex = closestIndex;
            this.playbackSpeed = this.options.speedPresets[closestIndex];
        } else {
            // Use the closest value
            let minDiff = Infinity;
            for (let i = 0; i < this.options.speedPresets.length; i++) {
                const diff = Math.abs(this.options.speedPresets[i] - speed);
                if (diff < minDiff) {
                    minDiff = diff;
                    this.currentSpeedIndex = i;
                    this.playbackSpeed = this.options.speedPresets[i];
                }
            }
        }

        this.updateSpeedButton();

        if (this.callbacks.onSpeedChange) {
            this.callbacks.onSpeedChange(this.playbackSpeed);
        }

        return this.playbackSpeed;
    }

    /**
     * Update speed button text
     * @private
     */
    updateSpeedButton() {
        if (!this.speedButton) return;

        const text = this.speedButton.getChildByName('text');
        if (text) {
            text.text = `${this.playbackSpeed}x`;
        }
    }

    /**
     * Update time display label
     * @private
     */
    updateTimeLabel() {
        if (!this.timeLabel) return;

        if (this._historyBounds && this._historyBounds.range > 0) {
            const currentElapsed = (this.currentTime - this._historyBounds.first) / 1000;
            const totalElapsed = this._historyBounds.range / 1000;

            this.timeLabel.text = `${currentElapsed.toFixed(1)}s / ${totalElapsed.toFixed(1)}s`;
        } else {
            this.timeLabel.text = '0.0s / 0.0s';
        }
    }

    /**
     * Draw the timeline with progress indicator
     * @private
     */
    drawTimeline() {
        if (!this.timeline) return;

        this.timeline.clear();

        const timelineWidth = this.options.width - (this.options.padding * 2);

        // Timeline background track
        this.timeline.beginFill(0x000033, 0.6);
        this.timeline.lineStyle(1, this.options.secondaryColor, 0.5);
        this.timeline.drawRoundedRect(
            0,
            0,
            timelineWidth,
            this.options.timelineHeight,
            this.options.timelineHeight / 2
        );
        this.timeline.endFill();

        // Draw progress if we have history
        if (this._historyBounds && this._historyBounds.range > 0) {
            const progress = (this.currentTime - this._historyBounds.first) / this._historyBounds.range;
            const progressWidth = progress * timelineWidth;

            // Progress fill (gradient effect with multiple segments)
            const segments = 20;
            const segmentWidth = progressWidth / segments;

            for (let i = 0; i < segments; i++) {
                const alpha = 0.3 + (i / segments) * 0.4;
                this.timeline.beginFill(this.options.primaryColor, alpha);
                this.timeline.drawRect(
                    i * segmentWidth,
                    2,
                    segmentWidth + 0.5,
                    this.options.timelineHeight - 4
                );
                this.timeline.endFill();
            }

            // Playhead indicator (vertical line with glow)
            this.timeline.lineStyle(2, this.options.primaryColor, 1);

            // Outer glow
            this.timeline.lineStyle(4, this.options.primaryColor, 0.3);
            this.timeline.moveTo(progressWidth, 0);
            this.timeline.lineTo(progressWidth, this.options.timelineHeight);

            // Core line
            this.timeline.lineStyle(2, this.options.primaryColor, 1);
            this.timeline.moveTo(progressWidth, 0);
            this.timeline.lineTo(progressWidth, this.options.timelineHeight);

            // Playhead circle at top
            this.timeline.beginFill(this.options.backgroundColor, 1);
            this.timeline.lineStyle(2, this.options.primaryColor, 1);
            this.timeline.drawCircle(progressWidth, 0, 5);
            this.timeline.endFill();
        }
    }

    /**
     * Register a callback for playback events
     * @param {string} event - Event name: 'play', 'pause', 'seek', 'speedChange'
     * @param {Function} callback - Callback function
     */
    on(event, callback) {
        const validEvents = ['play', 'pause', 'seek', 'speedChange'];
        if (validEvents.includes(event)) {
            const callbackKey = `on${event.charAt(0).toUpperCase() + event.slice(1)}`;
            this.callbacks[callbackKey] = callback;
        } else {
            console.warn(`[PlaybackControls] Unknown event: ${event}`);
        }
    }

    /**
     * Update the controls (call from main loop)
     * @param {number} dt - Delta time in seconds
     */
    update(dt = 0.016) {
        // Refresh history bounds periodically
        this.updateHistoryBounds();

        // Redraw timeline if playing
        if (this.playing) {
            this.drawTimeline();
        }
    }

    /**
     * Get current playback state
     * @returns {Object} Current state information
     */
    getState() {
        return {
            playing: this.playing,
            speed: this.playbackSpeed,
            currentTime: this.currentTime,
            duration: this._historyBounds?.range || 0,
            progress: this._historyBounds?.range > 0
                ? (this.currentTime - this._historyBounds.first) / this._historyBounds.range
                : 0,
            historyEntryCount: this._historyBounds?.count || 0
        };
    }

    /**
     * Reset playback to beginning
     */
    reset() {
        this.stopPlayback();
        this.playing = false;
        this.updateHistoryBounds();

        if (this._historyBounds) {
            this.currentTime = this._historyBounds.first;
        }

        this.updateTimeLabel();
        this.drawTimeline();
        this.updatePlayButton();

        console.log('[PlaybackControls] Reset to beginning');
    }

    /**
     * Jump to a specific time position
     * @param {number} timestamp - Target timestamp in milliseconds
     */
    seekTo(timestamp) {
        this.updateHistoryBounds();

        if (this._historyBounds) {
            this.currentTime = Math.max(
                this._historyBounds.first,
                Math.min(this._historyBounds.last, timestamp)
            );
            this.updateTimeLabel();
            this.drawTimeline();

            if (this.callbacks.onSeek) {
                this.callbacks.onSeek(this.currentTime);
            }
        }
    }

    /**
     * Jump to a specific progress position
     * @param {number} progress - Progress value (0-1)
     */
    seekToProgress(progress) {
        const clamped = Math.max(0, Math.min(1, progress));
        this.updateHistoryBounds();

        if (this._historyBounds && this._historyBounds.range > 0) {
            this.currentTime = this._historyBounds.first + (clamped * this._historyBounds.range);
            this.updateTimeLabel();
            this.drawTimeline();

            if (this.callbacks.onSeek) {
                this.callbacks.onSeek(this.currentTime);
            }
        }
    }

    /**
     * Set the position of the controls container
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     */
    setPosition(x, y) {
        if (this.container) {
            this.container.x = x;
            this.container.y = y;
        }
    }

    /**
     * Show the controls
     */
    show() {
        if (this.container) {
            this.container.visible = true;
            this.container.alpha = 0;

            // Fade in animation
            const fadeIn = () => {
                if (this.container.alpha < 1) {
                    this.container.alpha += 0.1;
                    requestAnimationFrame(fadeIn);
                }
            };
            fadeIn();
        }
    }

    /**
     * Hide the controls
     */
    hide() {
        if (this.container) {
            // Fade out animation
            const fadeOut = () => {
                if (this.container.alpha > 0) {
                    this.container.alpha -= 0.1;
                    requestAnimationFrame(fadeOut);
                } else {
                    this.container.visible = false;
                }
            };
            fadeOut();
        }
    }

    /**
     * Toggle visibility
     * @returns {boolean} New visible state
     */
    toggleVisibility() {
        if (this.container) {
            if (this.container.visible) {
                this.hide();
                return false;
            } else {
                this.show();
                return true;
            }
        }
        return false;
    }

    /**
     * Destroy the controls and release resources
     */
    destroy() {
        this.stopPlayback();

        if (this.container) {
            this.container.destroy({
                children: true,
                texture: false,
                baseTexture: false
            });
        }

        this.container = null;
        this.background = null;
        this.timeline = null;
        this.playButton = null;
        this.speedButton = null;
        this.timeLabel = null;
        this.titleLabel = null;

        console.log('[PlaybackControls] Destroyed');
    }
}

// Export for use in browser and module environments
if (typeof window !== 'undefined') {
    window.HeatmapPlaybackControls = HeatmapPlaybackControls;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { HeatmapPlaybackControls };
}
