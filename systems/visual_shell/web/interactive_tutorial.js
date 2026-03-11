/**
 * Interactive Tutorial System - Neural Heatmap Phase 2.3
 *
 * Provides step-by-step guided tours with highlighted elements, contextual help tooltips,
 * tour progress tracking, and persistence for Neural Heatmap analytics features.
 *
 * Features:
 * - Step-by-step guided tours with highlighted elements
 * - Contextual help tooltips
 * - Tour progress tracking and persistence
 * - Multiple tour types (Getting Started, Correlation Analysis, Temporal Patterns, Anomaly Detection)
 * - Interactive completion tracking
 * - Tour customization options
 *
 * Part of: Neural Heatmap Phase 2.3 - Interactive Tutorial System
 * @see docs/plans/2026-02-08-neural-heatmap-phase-2-3-roadmap.md
 *
 * @class TutorialManager
 */

class TutorialManager {
    /**
     * Create a new TutorialManager
     * @param {Object} config - Configuration options
     * @param {string} config.storageKey - LocalStorage key for progress (default: 'neural-heatmap-tutorial-progress')
     * @param {Object} config.position - Default position for tooltips {x, y}
     * @param {number} config.zIndex - Z-index for tutorial elements (default: 100000)
     * @param {boolean} config.autoStart - Auto-start tutorial on first visit (default: false)
     * @param {boolean} config.showProgress - Show progress indicator (default: true)
     */
    constructor(config = {}) {
        this.config = {
            storageKey: 'neural-heatmap-tutorial-progress',
            position: { x: 20, y: 80 },
            zIndex: 100000,
            autoStart: false,
            showProgress: true,
            ...config
        };

        // Tutorial state
        this.currentTour = null;
        this.currentStepIndex = 0;
        this.isActive = false;
        this.progress = this._loadProgress();

        // DOM elements
        this.backdrop = null;
        this.tooltip = null;
        this.tooltipContent = null;
        this.tooltipTitle = null;
        this.tooltipStepCounter = null;
        this.tooltipBody = null;
        this.tooltipActions = null;
        this.helpButtons = [];

        // Tour definitions
        this.tours = this._defineTours();

        // Event handlers
        this._resizeHandler = null;
        this._keyboardHandler = null;
        this._clickHandler = null;

        console.log('[TutorialManager] Initialized');
    }

    /**
     * Define all available tours
     * @private
     */
    _defineTours() {
        return {
            'getting-started': {
                id: 'getting-started',
                name: 'Getting Started',
                description: 'Learn the basics of navigating and using the Neural Heatmap',
                steps: [
                    {
                        title: 'Welcome to Neural Heatmap',
                        content: 'The Neural Heatmap provides real-time visualization of neural network layer activity. Let\'s take a quick tour!',
                        target: null, // No target - centered overlay
                        position: 'center',
                        action: 'next'
                    },
                    {
                        title: 'Heatmap Display',
                        content: 'This heatmap shows activity levels across different layers. Brighter colors indicate higher activation. Hover over any layer to see detailed statistics.',
                        target: '#neural-heatmap-container',
                        position: 'bottom',
                        action: 'hover'
                    },
                    {
                        title: 'Layer Information',
                        content: 'Click on any layer to view its metadata, including dimensions, parameter count, and computational statistics.',
                        target: '.layer-cell',
                        position: 'right',
                        action: 'click'
                    },
                    {
                        title: 'Analytics Controls',
                        content: 'Use these buttons to access advanced analytics: Correlation Matrix (M), Temporal View (T), and more.',
                        target: '#analytics-ui-controls',
                        position: 'bottom',
                        action: 'hover'
                    },
                    {
                        title: 'Model Zoo',
                        content: 'Access the Model Zoo to manage and compare multiple AI models. Track their activity and performance metrics.',
                        target: '#model-zoo-button',
                        position: 'left',
                        action: 'hover'
                    },
                    {
                        title: 'You\'re Ready!',
                        content: 'You now know the basics. Press Ctrl+H at any time to access help, or click the ? icon on any component for context-sensitive help.',
                        target: null,
                        position: 'center',
                        action: 'finish'
                    }
                ]
            },
            'correlation-analysis': {
                id: 'correlation-analysis',
                name: 'Correlation Analysis',
                description: 'Learn how to interpret and use the correlation matrix view',
                prerequisite: 'getting-started',
                steps: [
                    {
                        title: 'Correlation Matrix Overview',
                        content: 'The correlation matrix reveals relationships between different neural layers. Strong correlations may indicate learned features or dependencies.',
                        target: null,
                        position: 'center',
                        action: 'next'
                    },
                    {
                        title: 'Opening Correlation Matrix',
                        content: 'Press Ctrl+M or click the M button to open the correlation matrix view.',
                        target: '#analytics-ui-controls .correlation-button',
                        position: 'bottom',
                        action: 'click'
                    },
                    {
                        title: 'Understanding the Matrix',
                        content: 'Each cell represents the correlation between two layers. Red = positive correlation, Blue = negative, White = no correlation. Color intensity shows strength.',
                        target: '#correlation-matrix-container',
                        position: 'right',
                        action: 'hover'
                    },
                    {
                        title: 'Cross-Layer Analysis',
                        content: 'Click any cell to see detailed statistics about the relationship between those two layers, including covariance and p-values.',
                        target: '.correlation-cell',
                        position: 'left',
                        action: 'click'
                    },
                    {
                        title: 'Filtering Correlations',
                        content: 'Use the filter panel to show only strong correlations, or focus on specific layer ranges.',
                        target: '#analytics-filter-panel',
                        position: 'left',
                        action: 'hover'
                    },
                    {
                        title: 'Exporting Data',
                        content: 'Export correlation data for further analysis in CSV, JSON, or TensorBoard format.',
                        target: '#export-button',
                        position: 'top',
                        action: 'hover'
                    },
                    {
                        title: 'Analysis Complete',
                        content: 'You can now use correlation analysis to understand layer relationships and optimize your model architecture.',
                        target: null,
                        position: 'center',
                        action: 'finish'
                    }
                ]
            },
            'temporal-patterns': {
                id: 'temporal-patterns',
                name: 'Temporal Patterns',
                description: 'Learn to interpret temporal patterns and timeline visualizations',
                prerequisite: 'getting-started',
                steps: [
                    {
                        title: 'Temporal Analysis Overview',
                        content: 'Track how layer activity changes over time. Identify patterns, trends, and anomalies in model behavior.',
                        target: null,
                        position: 'center',
                        action: 'next'
                    },
                    {
                        title: 'Opening Temporal View',
                        content: 'Press Ctrl+T or click the T button to open the temporal patterns view.',
                        target: '#analytics-ui-controls .temporal-button',
                        position: 'bottom',
                        action: 'click'
                    },
                    {
                        title: 'Timeline Visualization',
                        content: 'The timeline shows activity history for each layer. Scroll to navigate through time, zoom to focus on specific periods.',
                        target: '#temporal-view-container',
                        position: 'bottom',
                        action: 'hover'
                    },
                    {
                        title: 'Activity Trends',
                        content: 'Observe how layers activate during different phases of computation. Identify which layers are most active for specific inputs.',
                        target: '#temporal-timeline',
                        position: 'right',
                        action: 'hover'
                    },
                    {
                        title: 'Time Window Selection',
                        content: 'Drag to select a time range for detailed analysis. The selection shows statistics for the chosen period.',
                        target: '.timeline-selection',
                        position: 'top',
                        action: 'drag'
                    },
                    {
                        title: 'Playback Controls',
                        content: 'Use playback controls to replay activity history. Speed up, slow down, or step through specific events.',
                        target: '#playback-controls',
                        position: 'top',
                        action: 'hover'
                    },
                    {
                        title: 'Pattern Detection',
                        content: 'The system automatically detects recurring patterns and anomalies. Look for highlighted regions indicating significant events.',
                        target: '.pattern-highlight',
                        position: 'left',
                        action: 'hover'
                    },
                    {
                        title: 'Temporal Analysis Complete',
                        content: 'You can now track temporal patterns to understand model dynamics and identify optimization opportunities.',
                        target: null,
                        position: 'center',
                        action: 'finish'
                    }
                ]
            },
            'anomaly-detection': {
                id: 'anomaly-detection',
                name: 'Anomaly Detection',
                description: 'Learn to use anomaly detection for identifying unusual behavior',
                prerequisite: 'getting-started',
                steps: [
                    {
                        title: 'Anomaly Detection Overview',
                        content: 'Automatically identify unusual layer behavior, potential bugs, and optimization opportunities using statistical analysis.',
                        target: null,
                        position: 'center',
                        action: 'next'
                    },
                    {
                        title: 'Anomaly Indicators',
                        content: 'Layers with detected anomalies are highlighted with a warning border. The color indicates severity: Yellow = mild, Orange = moderate, Red = severe.',
                        target: '.anomaly-indicator',
                        position: 'right',
                        action: 'hover'
                    },
                    {
                        title: 'Anomaly Details',
                        content: 'Click on any anomalous layer to see detailed information about the detected anomaly, including type, severity, and suggested actions.',
                        target: '.anomaly-layer',
                        position: 'left',
                        action: 'click'
                    },
                    {
                        title: 'Anomaly Types',
                        content: 'Different types include: High Variance (unstable activation), Low Activity (dead layers), Spike Detection (sudden changes), and Pattern Deviation (unusual behavior).',
                        target: '#anomaly-legend',
                        position: 'bottom',
                        action: 'hover'
                    },
                    {
                        title: 'Statistical Thresholds',
                        content: 'Adjust detection sensitivity using the filter panel. Higher sensitivity catches more issues but may include false positives.',
                        target: '#threshold-controls',
                        position: 'left',
                        action: 'hover'
                    },
                    {
                        title: 'Anomaly Report',
                        content: 'Generate a comprehensive anomaly report with recommendations for fixing detected issues.',
                        target: '#anomaly-report-button',
                        position: 'top',
                        action: 'hover'
                    },
                    {
                        title: 'Anomaly Detection Complete',
                        content: 'You can now use anomaly detection to identify and resolve issues in your neural network models.',
                        target: null,
                        position: 'center',
                        action: 'finish'
                    }
                ]
            },
            'advanced-features': {
                id: 'advanced-features',
                name: 'Advanced Features',
                description: 'Explore advanced features including multi-model comparison and export',
                prerequisite: ['correlation-analysis', 'temporal-patterns'],
                steps: [
                    {
                        title: 'Advanced Features Overview',
                        content: 'Discover powerful tools for deep analysis: multi-model comparison, virtual rendering for large datasets, and comprehensive export options.',
                        target: null,
                        position: 'center',
                        action: 'next'
                    },
                    {
                        title: 'Multi-Model Comparison',
                        content: 'Press Ctrl+Shift+C to open multi-model comparison view. Compare activity patterns across different models side-by-side.',
                        target: '#analytics-ui-controls .compare-button',
                        position: 'bottom',
                        action: 'click'
                    },
                    {
                        title: 'Virtual Matrix Rendering',
                        content: 'For large models with many layers, the system uses virtual rendering to maintain performance. Only visible cells are rendered.',
                        target: '#virtual-matrix-container',
                        position: 'right',
                        action: 'hover'
                    },
                    {
                        title: 'Filter Panel',
                        content: 'Press Ctrl+F to open the advanced filter panel. Filter by layer type, activity range, correlation strength, and more.',
                        target: '#analytics-ui-controls .filter-button',
                        position: 'bottom',
                        action: 'click'
                    },
                    {
                        title: 'TensorBoard Export',
                        content: 'Export data directly to TensorBoard format for integration with existing ML workflows and visualization pipelines.',
                        target: '#tensorboard-export-button',
                        position: 'left',
                        action: 'hover'
                    },
                    {
                        title: 'Theme Customization',
                        content: 'Press Ctrl+D to toggle between themes. Choose from Dark, Light, and High Contrast for different lighting conditions.',
                        target: '#analytics-ui-controls .theme-button',
                        position: 'bottom',
                        action: 'hover'
                    },
                    {
                        title: 'Advanced Mastery Complete',
                        content: 'You\'ve mastered the advanced features! Explore the documentation for more tips and tricks.',
                        target: null,
                        position: 'center',
                        action: 'finish'
                    }
                ]
            }
        };
    }

    /**
     * Start a tutorial tour
     * @param {string} tourId - The ID of the tour to start
     * @returns {boolean} True if tour started successfully
     */
    startTour(tourId) {
        const tour = this.tours[tourId];
        if (!tour) {
            console.error(`[TutorialManager] Tour not found: ${tourId}`);
            return false;
        }

        // Check prerequisites
        if (tour.prerequisite) {
            const prerequisites = Array.isArray(tour.prerequisite) ? tour.prerequisite : [tour.prerequisite];
            for (const prereq of prerequisites) {
                if (!this.progress.completedTours.includes(prereq)) {
                    console.warn(`[TutorialManager] Prerequisite not met: ${prereq}`);
                    this._showPrerequisiteWarning(prereq, tourId);
                    return false;
                }
            }
        }

        // Check if already completed
        if (this.progress.completedTours.includes(tourId)) {
            console.log(`[TutorialManager] Tour already completed: ${tourId}`);
            // Allow restarting, but log it
        }

        this.currentTour = tour;
        this.currentStepIndex = 0;
        this.isActive = true;

        this._createUI();
        this._showStep(0);
        this._attachEventListeners();

        console.log(`[TutorialManager] Started tour: ${tour.name}`);
        return true;
    }

    /**
     * Show prerequisite warning dialog
     * @private
     */
    _showPrerequisiteWarning(prerequisiteTourId, requestedTourId) {
        const prereqTour = this.tours[prerequisiteTourId];
        const requestedTour = this.tours[requestedTourId];

        const overlay = document.createElement('div');
        overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: ${this.config.zIndex};
            display: flex;
            align-items: center;
            justify-content: center;
        `;

        const dialog = document.createElement('div');
        dialog.style.cssText = `
            background: #1a1a2e;
            border: 2px solid #00FFFF;
            border-radius: 10px;
            padding: 30px;
            max-width: 500px;
            color: #fff;
            font-family: 'Courier New', monospace;
        `;

        dialog.innerHTML = `
            <h2 style="color: #FFA500; margin-top: 0;">Prerequisite Required</h2>
            <p>To access <strong>${requestedTour.name}</strong>, you first need to complete:</p>
            <p style="color: #00FFFF; font-weight: bold;">${prereqTour.name}</p>
            <p style="color: #888; font-size: 14px;">${prereqTour.description}</p>
            <div style="display: flex; gap: 10px; margin-top: 20px;">
                <button id="start-prereq-btn" style="
                    background: #00FFFF;
                    color: #000;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: bold;
                ">Start Prerequisite</button>
                <button id="cancel-tour-btn" style="
                    background: #444;
                    color: #fff;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                ">Cancel</button>
            </div>
        `;

        overlay.appendChild(dialog);
        document.body.appendChild(overlay);

        document.getElementById('start-prereq-btn').onclick = () => {
            overlay.remove();
            this.startTour(prerequisiteTourId);
        };

        document.getElementById('cancel-tour-btn').onclick = () => {
            overlay.remove();
        };
    }

    /**
     * Create the tutorial UI elements
     * @private
     */
    _createUI() {
        // Create backdrop
        this.backdrop = document.createElement('div');
        this.backdrop.id = 'tutorial-backdrop';
        this.backdrop.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: ${this.config.zIndex - 1};
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
        `;
        document.body.appendChild(this.backdrop);

        // Create tooltip
        this.tooltip = document.createElement('div');
        this.tooltip.id = 'tutorial-tooltip';
        this.tooltip.style.cssText = `
            position: fixed;
            z-index: ${this.config.zIndex};
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border: 2px solid #00FFFF;
            border-radius: 12px;
            padding: 0;
            max-width: 400px;
            min-width: 300px;
            box-shadow: 0 8px 32px rgba(0, 255, 255, 0.3);
            opacity: 0;
            transform: scale(0.9);
            transition: all 0.3s ease;
            font-family: 'Courier New', monospace;
        `;

        // Tooltip header
        const header = document.createElement('div');
        header.style.cssText = `
            background: linear-gradient(90deg, #00FFFF 0%, #0088FF 100%);
            padding: 15px 20px;
            border-radius: 10px 10px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        `;

        this.tooltipTitle = document.createElement('h3');
        this.tooltipTitle.style.cssText = `
            margin: 0;
            color: #000;
            font-size: 18px;
            font-weight: bold;
        `;

        this.tooltipStepCounter = document.createElement('span');
        this.tooltipStepCounter.style.cssText = `
            color: #000;
            font-size: 14px;
            font-weight: bold;
        `;

        header.appendChild(this.tooltipTitle);
        header.appendChild(this.tooltipStepCounter);

        // Close button
        const closeBtn = document.createElement('button');
        closeBtn.innerHTML = '×';
        closeBtn.style.cssText = `
            background: none;
            border: none;
            color: #000;
            font-size: 24px;
            cursor: pointer;
            padding: 0;
            width: 24px;
            height: 24px;
            margin-left: 10px;
        `;
        closeBtn.onclick = () => this.endTour();
        header.appendChild(closeBtn);

        this.tooltip.appendChild(header);

        // Tooltip body
        this.tooltipBody = document.createElement('div');
        this.tooltipBody.style.cssText = `
            padding: 20px;
            color: #fff;
            line-height: 1.6;
            font-size: 14px;
        `;
        this.tooltip.appendChild(this.tooltipBody);

        // Tooltip actions
        this.tooltipActions = document.createElement('div');
        this.tooltipActions.style.cssText = `
            padding: 15px 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        `;

        // Progress indicator
        const progressContainer = document.createElement('div');
        progressContainer.id = 'tutorial-progress';
        progressContainer.style.cssText = `
            display: ${this.config.showProgress ? 'flex' : 'none'};
            align-items: center;
            gap: 8px;
        `;

        for (let i = 0; i < 5; i++) {
            const dot = document.createElement('div');
            dot.className = 'progress-dot';
            dot.style.cssText = `
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.3);
                transition: background 0.3s ease;
            `;
            progressContainer.appendChild(dot);
        }
        this.tooltipActions.appendChild(progressContainer);

        // Navigation buttons
        const navButtons = document.createElement('div');
        navButtons.style.cssText = `
            display: flex;
            gap: 10px;
        `;

        this.backButton = document.createElement('button');
        this.backButton.textContent = '← Back';
        this.backButton.style.cssText = this._getButtonStyle();
        this.backButton.onclick = () => this.previousStep();
        navButtons.appendChild(this.backButton);

        this.nextButton = document.createElement('button');
        this.nextButton.textContent = 'Next →';
        this.nextButton.style.cssText = this._getButtonStyle('#00FFFF');
        this.nextButton.onclick = () => this.nextStep();
        navButtons.appendChild(this.nextButton);

        this.skipButton = document.createElement('button');
        this.skipButton.textContent = 'Skip Tour';
        this.skipButton.style.cssText = this._getButtonStyle('transparent', '#888');
        this.skipButton.onclick = () => this.endTour();
        navButtons.appendChild(this.skipButton);

        this.tooltipActions.appendChild(navButtons);
        this.tooltip.appendChild(this.tooltipActions);

        document.body.appendChild(this.tooltip);
    }

    /**
     * Get button CSS styles
     * @private
     */
    _getButtonStyle(background = '#333', color = '#fff') {
        return `
            background: ${background};
            color: ${color};
            border: 1px solid ${background === 'transparent' ? '#888' : background};
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-family: 'Courier New', monospace;
            font-size: 13px;
            font-weight: bold;
            transition: all 0.2s ease;
        `;
    }

    /**
     * Show a specific step
     * @private
     */
    _showStep(stepIndex) {
        if (!this.currentTour) return;

        const step = this.currentTour.steps[stepIndex];
        if (!step) return;

        // Update content
        this.tooltipTitle.textContent = step.title;
        this.tooltipBody.innerHTML = step.content;
        this.tooltipStepCounter.textContent = `${stepIndex + 1}/${this.currentTour.steps.length}`;

        // Update progress dots
        this._updateProgress(stepIndex);

        // Update buttons
        this.backButton.disabled = stepIndex === 0;
        this.backButton.style.opacity = stepIndex === 0 ? '0.5' : '1';

        if (stepIndex === this.currentTour.steps.length - 1) {
            this.nextButton.textContent = 'Finish';
            this.skipButton.style.display = 'none';
        } else {
            this.nextButton.textContent = 'Next →';
            this.skipButton.style.display = 'block';
        }

        // Position tooltip
        this._positionTooltip(step);

        // Highlight target element
        this._highlightTarget(step.target);

        // Show elements
        requestAnimationFrame(() => {
            this.tooltip.style.opacity = '1';
            this.tooltip.style.transform = 'scale(1)';
            if (step.target) {
                this.backdrop.style.opacity = '1';
            }
        });
    }

    /**
     * Update progress indicator
     * @private
     */
    _updateProgress(currentStep) {
        const dots = this.tooltip.querySelectorAll('.progress-dot');
        const totalSteps = this.currentTour.steps.length;

        // Update dots count if needed
        while (dots.length < totalSteps) {
            const dot = document.createElement('div');
            dot.className = 'progress-dot';
            dot.style.cssText = dots[0].style.cssText;
            this.tooltip.querySelector('#tutorial-progress').appendChild(dot);
        }

        dots.forEach((dot, index) => {
            if (index < currentStep + 1) {
                dot.style.background = '#00FFFF';
                dot.style.boxShadow = '0 0 8px #00FFFF';
            } else {
                dot.style.background = 'rgba(255, 255, 255, 0.3)';
                dot.style.boxShadow = 'none';
            }
        });
    }

    /**
     * Position tooltip based on target and position preference
     * @private
     */
    _positionTooltip(step) {
        const target = step.target ? document.querySelector(step.target) : null;
        let x, y;

        if (step.position === 'center' || !target) {
            // Center in viewport
            x = window.innerWidth / 2;
            y = window.innerHeight / 2;
        } else {
            // Position relative to target
            const rect = target.getBoundingClientRect();
            const tooltipWidth = 350; // Approximate width
            const tooltipHeight = 200; // Approximate height
            const margin = 20;

            switch (step.position) {
                case 'top':
                    x = rect.left + rect.width / 2;
                    y = rect.top - tooltipHeight / 2 - margin;
                    break;
                case 'bottom':
                    x = rect.left + rect.width / 2;
                    y = rect.bottom + tooltipHeight / 2 + margin;
                    break;
                case 'left':
                    x = rect.left - tooltipWidth / 2 - margin;
                    y = rect.top + rect.height / 2;
                    break;
                case 'right':
                    x = rect.right + tooltipWidth / 2 + margin;
                    y = rect.top + rect.height / 2;
                    break;
                default:
                    x = rect.left + rect.width / 2;
                    y = rect.bottom + margin;
            }
        }

        // Constrain to viewport
        const tooltipRect = this.tooltip.getBoundingClientRect();
        x = Math.max(tooltipRect.width / 2 + 10, Math.min(window.innerWidth - tooltipRect.width / 2 - 10, x));
        y = Math.max(tooltipRect.height / 2 + 10, Math.min(window.innerHeight - tooltipRect.height / 2 - 10, y));

        this.tooltip.style.left = `${x - this.tooltip.offsetWidth / 2}px`;
        this.tooltip.style.top = `${y - this.tooltip.offsetHeight / 2}px`;
    }

    /**
     * Highlight target element
     * @private
     */
    _highlightTarget(selector) {
        // Clear previous highlights
        document.querySelectorAll('.tutorial-highlight').forEach(el => {
            el.classList.remove('tutorial-highlight');
            el.style.boxShadow = '';
        });

        if (!selector) return;

        const target = document.querySelector(selector);
        if (target) {
            target.classList.add('tutorial-highlight');
            target.style.boxShadow = '0 0 0 4px #00FFFF, 0 0 20px rgba(0, 255, 255, 0.5)';
            target.style.zIndex = `${this.config.zIndex - 1}`;
        }
    }

    /**
     * Navigate to next step
     */
    nextStep() {
        if (!this.currentTour) return;

        if (this.currentStepIndex < this.currentTour.steps.length - 1) {
            this.currentStepIndex++;
            this._showStep(this.currentStepIndex);
        } else {
            this.completeTour();
        }
    }

    /**
     * Navigate to previous step
     */
    previousStep() {
        if (!this.currentTour || this.currentStepIndex === 0) return;

        this.currentStepIndex--;
        this._showStep(this.currentStepIndex);
    }

    /**
     * Complete the current tour
     */
    completeTour() {
        if (!this.currentTour) return;

        // Record completion
        if (!this.progress.completedTours.includes(this.currentTour.id)) {
            this.progress.completedTours.push(this.currentTour.id);
            this.progress.lastCompletedDate = new Date().toISOString();
            this._saveProgress();
        }

        this._showCompletionDialog();
        this.endTour();

        console.log(`[TutorialManager] Completed tour: ${this.currentTour.name}`);
    }

    /**
     * Show completion dialog
     * @private
     */
    _showCompletionDialog() {
        const overlay = document.createElement('div');
        overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: ${this.config.zIndex};
            display: flex;
            align-items: center;
            justify-content: center;
            animation: fadeIn 0.3s ease;
        `;

        const dialog = document.createElement('div');
        dialog.style.cssText = `
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border: 3px solid #00FFFF;
            border-radius: 15px;
            padding: 40px;
            max-width: 500px;
            text-align: center;
            color: #fff;
            font-family: 'Courier New', monospace;
            animation: scaleIn 0.3s ease;
        `;

        const availableTours = Object.values(this.tours).filter(t =>
            !this.progress.completedTours.includes(t.id) &&
            this._checkPrerequisites(t.id)
        );

        dialog.innerHTML = `
            <div style="font-size: 60px; margin-bottom: 20px;">🎉</div>
            <h2 style="color: #00FFFF; margin: 0 0 20px 0;">Tutorial Complete!</h2>
            <p style="color: #aaa; margin-bottom: 30px;">
                You've completed <strong>${this.currentTour.name}</strong>!
            </p>
            ${availableTours.length > 0 ? `
                <p style="margin-bottom: 20px;">Continue your learning journey:</p>
                <div style="display: flex; flex-direction: column; gap: 10px; margin-bottom: 20px;">
                    ${availableTours.slice(0, 3).map(t => `
                        <button data-tour="${t.id}" class="next-tour-btn" style="
                            background: rgba(0, 255, 255, 0.1);
                            color: #00FFFF;
                            border: 1px solid #00FFFF;
                            padding: 12px 20px;
                            border-radius: 8px;
                            cursor: pointer;
                            font-family: 'Courier New', monospace;
                            font-weight: bold;
                            text-align: left;
                            transition: all 0.2s ease;
                        ">
                            <div style="font-size: 16px;">${t.name}</div>
                            <div style="font-size: 12px; color: #888; margin-top: 4px;">${t.description}</div>
                        </button>
                    `).join('')}
                </div>
            ` : '<p style="color: #00FFFF; margin-bottom: 20px;">You\'ve completed all available tutorials!</p>'}
            <button id="close-completion-btn" style="
                background: #00FFFF;
                color: #000;
                border: none;
                padding: 12px 30px;
                border-radius: 8px;
                cursor: pointer;
                font-weight: bold;
                font-family: 'Courier New', monospace;
                font-size: 16px;
            ">Continue</button>
        `;

        overlay.appendChild(dialog);
        document.body.appendChild(overlay);

        // Add hover effects
        dialog.querySelectorAll('.next-tour-btn').forEach(btn => {
            btn.onmouseover = () => btn.style.background = 'rgba(0, 255, 255, 0.3)';
            btn.onmouseout = () => btn.style.background = 'rgba(0, 255, 255, 0.1)';
            btn.onclick = () => {
                overlay.remove();
                this.startTour(btn.dataset.tour);
            };
        });

        document.getElementById('close-completion-btn').onclick = () => overlay.remove();

        // Auto-dismiss after 10 seconds
        setTimeout(() => {
            if (overlay.parentNode) {
                overlay.style.animation = 'fadeOut 0.3s ease';
                setTimeout(() => overlay.remove(), 300);
            }
        }, 10000);
    }

    /**
     * Check if tour prerequisites are met
     * @private
     */
    _checkPrerequisites(tourId) {
        const tour = this.tours[tourId];
        if (!tour || !tour.prerequisite) return true;

        const prerequisites = Array.isArray(tour.prerequisite) ? tour.prerequisite : [tour.prerequisite];
        return prerequisites.every(p => this.progress.completedTours.includes(p));
    }

    /**
     * End the current tour
     */
    endTour() {
        this.isActive = false;
        this.currentTour = null;
        this.currentStepIndex = 0;

        // Remove UI
        if (this.backdrop) {
            this.backdrop.remove();
            this.backdrop = null;
        }

        if (this.tooltip) {
            this.tooltip.remove();
            this.tooltip = null;
        }

        // Clear highlights
        document.querySelectorAll('.tutorial-highlight').forEach(el => {
            el.classList.remove('tutorial-highlight');
            el.style.boxShadow = '';
            el.style.zIndex = '';
        });

        this._detachEventListeners();
    }

    /**
     * Attach event listeners
     * @private
     */
    _attachEventListeners() {
        // Handle window resize
        this._resizeHandler = () => {
            if (this.isActive && this.currentTour) {
                const step = this.currentTour.steps[this.currentStepIndex];
                this._positionTooltip(step);
            }
        };
        window.addEventListener('resize', this._resizeHandler);

        // Handle keyboard shortcuts
        this._keyboardHandler = (e) => {
            if (!this.isActive) return;

            if (e.key === 'Escape') {
                this.endTour();
            } else if (e.key === 'ArrowRight' || e.key === 'Enter') {
                this.nextStep();
            } else if (e.key === 'ArrowLeft') {
                this.previousStep();
            }
        };
        document.addEventListener('keydown', this._keyboardHandler);

        // Handle clicks on backdrop to close
        this._clickHandler = (e) => {
            if (e.target === this.backdrop && this.currentTour?.steps[this.currentStepIndex]?.target) {
                // Don't close if there's a target element
                return;
            }
        };
        document.addEventListener('click', this._clickHandler);
    }

    /**
     * Detach event listeners
     * @private
     */
    _detachEventListeners() {
        if (this._resizeHandler) {
            window.removeEventListener('resize', this._resizeHandler);
            this._resizeHandler = null;
        }

        if (this._keyboardHandler) {
            document.removeEventListener('keydown', this._keyboardHandler);
            this._keyboardHandler = null;
        }

        if (this._clickHandler) {
            document.removeEventListener('click', this._clickHandler);
            this._clickHandler = null;
        }
    }

    /**
     * Add context-sensitive help button to an element
     * @param {string} selector - CSS selector for target element
     * @param {string} helpId - Help content ID
     * @param {string} content - Help content
     */
    addHelpButton(selector, helpId, content) {
        const target = document.querySelector(selector);
        if (!target) {
            console.warn(`[TutorialManager] Element not found: ${selector}`);
            return;
        }

        const helpBtn = document.createElement('button');
        helpBtn.className = 'context-help-button';
        helpBtn.dataset.helpId = helpId;
        helpBtn.innerHTML = '?';
        helpBtn.style.cssText = `
            position: absolute;
            top: -8px;
            right: -8px;
            width: 20px;
            height: 20px;
            background: #00FFFF;
            color: #000;
            border: none;
            border-radius: 50%;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            transition: all 0.2s ease;
        `;

        helpBtn.onmouseover = () => {
            helpBtn.style.transform = 'scale(1.2)';
            helpBtn.style.boxShadow = '0 0 12px #00FFFF';
        };

        helpBtn.onmouseout = () => {
            helpBtn.style.transform = 'scale(1)';
            helpBtn.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.3)';
        };

        helpBtn.onclick = (e) => {
            e.stopPropagation();
            this._showContextHelp(helpId, content, target);
        };

        target.style.position = target.style.position || 'relative';
        target.appendChild(helpBtn);
        this.helpButtons.push({ element: target, button: helpBtn });
    }

    /**
     * Show context help tooltip
     * @private
     */
    _showContextHelp(helpId, content, targetElement) {
        const tooltip = document.createElement('div');
        tooltip.className = 'context-help-tooltip';
        tooltip.style.cssText = `
            position: fixed;
            z-index: ${this.config.zIndex};
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border: 2px solid #00FFFF;
            border-radius: 10px;
            padding: 15px 20px;
            max-width: 350px;
            color: #fff;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            box-shadow: 0 8px 32px rgba(0, 255, 255, 0.3);
            opacity: 0;
            transform: scale(0.9);
            transition: all 0.2s ease;
        `;

        tooltip.innerHTML = `
            <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 10px;">
                <h4 style="margin: 0; color: #00FFFF;">Quick Help</h4>
                <button class="close-help-btn" style="background: none; border: none; color: #888; cursor: pointer; font-size: 18px;">×</button>
            </div>
            <div style="line-height: 1.5;">${content}</div>
        `;

        document.body.appendChild(tooltip);

        // Position tooltip
        const rect = targetElement.getBoundingClientRect();
        tooltip.style.left = `${rect.right + 15}px`;
        tooltip.style.top = `${rect.top}px`;

        // Adjust if off screen
        const tooltipRect = tooltip.getBoundingClientRect();
        if (tooltipRect.right > window.innerWidth - 20) {
            tooltip.style.left = `${rect.left - tooltipRect.width - 15}px`;
        }
        if (tooltipRect.bottom > window.innerHeight - 20) {
            tooltip.style.top = `${window.innerHeight - tooltipRect.height - 20}px`;
        }

        // Show tooltip
        requestAnimationFrame(() => {
            tooltip.style.opacity = '1';
            tooltip.style.transform = 'scale(1)';
        });

        // Close handlers
        const closeHelp = () => {
            tooltip.style.opacity = '0';
            tooltip.style.transform = 'scale(0.9)';
            setTimeout(() => tooltip.remove(), 200);
        };

        tooltip.querySelector('.close-help-btn').onclick = closeHelp;
        setTimeout(() => {
            document.addEventListener('click', function closeOnOutsideClick(e) {
                if (!tooltip.contains(e.target)) {
                    closeHelp();
                    document.removeEventListener('click', closeOnOutsideClick);
                }
            });
        }, 100);
    }

    /**
     * Get tour progress
     * @returns {Object} Progress data
     */
    getProgress() {
        return { ...this.progress };
    }

    /**
     * Reset all progress
     */
    resetProgress() {
        this.progress = {
            completedTours: [],
            lastCompletedDate: null
        };
        this._saveProgress();
        console.log('[TutorialManager] Progress reset');
    }

    /**
     * Load progress from localStorage
     * @private
     */
    _loadProgress() {
        try {
            const saved = localStorage.getItem(this.config.storageKey);
            if (saved) {
                return JSON.parse(saved);
            }
        } catch (e) {
            console.warn('[TutorialManager] Could not load progress:', e);
        }
        return {
            completedTours: [],
            lastCompletedDate: null
        };
    }

    /**
     * Save progress to localStorage
     * @private
     */
    _saveProgress() {
        try {
            localStorage.setItem(this.config.storageKey, JSON.stringify(this.progress));
        } catch (e) {
            console.warn('[TutorialManager] Could not save progress:', e);
        }
    }

    /**
     * Create a tutorial menu UI
     * @returns {HTMLElement} Menu element
     */
    createTutorialMenu() {
        const menu = document.createElement('div');
        menu.id = 'tutorial-menu';
        menu.style.cssText = `
            position: fixed;
            top: ${this.config.position.y}px;
            right: 20px;
            z-index: ${this.config.zIndex - 10};
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border: 2px solid #00FFFF;
            border-radius: 10px;
            padding: 20px;
            min-width: 280px;
            color: #fff;
            font-family: 'Courier New', monospace;
            box-shadow: 0 8px 32px rgba(0, 255, 255, 0.2);
        `;

        const header = document.createElement('div');
        header.style.cssText = `
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        `;

        header.innerHTML = `
            <h3 style="margin: 0; color: #00FFFF;">📚 Tutorials</h3>
            <button id="close-menu-btn" style="background: none; border: none; color: #888; cursor: pointer; font-size: 20px;">×</button>
        `;

        menu.appendChild(header);

        const tourList = document.createElement('div');
        tourList.style.cssText = `
            display: flex;
            flex-direction: column;
            gap: 10px;
        `;

        Object.values(this.tours).forEach(tour => {
            const isCompleted = this.progress.completedTours.includes(tour.id);
            const prereqsMet = this._checkPrerequisites(tour.id);
            const canStart = !tour.prerequisite || prereqsMet;

            const tourBtn = document.createElement('button');
            tourBtn.className = 'tour-menu-item';
            tourBtn.dataset.tourId = tour.id;
            tourBtn.disabled = !canStart;
            tourBtn.style.cssText = `
                background: ${isCompleted ? 'rgba(0, 255, 136, 0.1)' : canStart ? 'rgba(255, 255, 255, 0.05)' : 'rgba(136, 136, 136, 0.1)'};
                color: ${isCompleted ? '#00ff88' : canStart ? '#fff' : '#888'};
                border: 1px solid ${isCompleted ? '#00ff88' : canStart ? 'rgba(255, 255, 255, 0.2)' : '#444'};
                padding: 12px 15px;
                border-radius: 8px;
                cursor: ${canStart ? 'pointer' : 'not-allowed'};
                font-family: 'Courier New', monospace;
                text-align: left;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                gap: 10px;
            `;

            tourBtn.innerHTML = `
                <span style="font-size: 18px;">${isCompleted ? '✓' : canStart ? '▶' : '🔒'}</span>
                <div style="flex: 1;">
                    <div style="font-weight: bold; font-size: 14px;">${tour.name}</div>
                    <div style="font-size: 11px; color: ${isCompleted ? '#00ff88' : '#888'}; margin-top: 2px;">${tour.description}</div>
                </div>
            `;

            if (canStart) {
                tourBtn.onmouseover = () => {
                    tourBtn.style.background = isCompleted ? 'rgba(0, 255, 136, 0.2)' : 'rgba(0, 255, 255, 0.1)';
                    tourBtn.style.borderColor = isCompleted ? '#00ff88' : '#00FFFF';
                };
                tourBtn.onmouseout = () => {
                    tourBtn.style.background = isCompleted ? 'rgba(0, 255, 136, 0.1)' : 'rgba(255, 255, 255, 0.05)';
                    tourBtn.style.borderColor = isCompleted ? '#00ff88' : 'rgba(255, 255, 255, 0.2)';
                };
                tourBtn.onclick = () => {
                    menu.remove();
                    this.startTour(tour.id);
                };
            }

            tourList.appendChild(tourBtn);
        });

        menu.appendChild(tourList);

        // Reset progress button
        const resetBtn = document.createElement('button');
        resetBtn.id = 'reset-progress-btn';
        resetBtn.textContent = 'Reset Progress';
        resetBtn.style.cssText = `
            background: transparent;
            color: #ff4444;
            border: 1px solid #ff4444;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            margin-top: 15px;
            width: 100%;
            transition: all 0.2s ease;
        `;
        resetBtn.onmouseover = () => resetBtn.style.background = 'rgba(255, 68, 68, 0.1)';
        resetBtn.onmouseout = () => resetBtn.style.background = 'transparent';
        resetBtn.onclick = () => {
            if (confirm('Are you sure you want to reset all tutorial progress?')) {
                this.resetProgress();
                menu.remove();
                this.createTutorialMenu(); // Recreate with reset state
            }
        };
        menu.appendChild(resetBtn);

        document.getElementById('close-menu-btn').onclick = () => menu.remove();

        return menu;
    }

    /**
     * Get available tours
     * @returns {Array} List of tour objects
     */
    getAvailableTours() {
        return Object.values(this.tours).map(tour => ({
            ...tour,
            isCompleted: this.progress.completedTours.includes(tour.id),
            prerequisitesMet: this._checkPrerequisites(tour.id)
        }));
    }

    /**
     * Destroy the tutorial manager
     */
    destroy() {
        this.endTour();

        // Remove help buttons
        this.helpButtons.forEach(({ button }) => {
            button.remove();
        });
        this.helpButtons = [];

        console.log('[TutorialManager] Destroyed');
    }
}

// Add CSS animations for tutorial system
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    @keyframes fadeOut {
        from { opacity: 1; }
        to { opacity: 0; }
    }
    @keyframes scaleIn {
        from { opacity: 0; transform: scale(0.8); }
        to { opacity: 1; transform: scale(1); }
    }
`;
document.head.appendChild(style);

// Export for use in other modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = TutorialManager;
}
