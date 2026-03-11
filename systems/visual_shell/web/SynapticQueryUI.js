/**
 * SynapticQueryUI - Browser UI for querying the neural substrate.
 *
 * Provides a search interface that:
 * - Accepts natural language queries
 * - Sends queries to the Visual Bridge via WebSocket
 * - Displays ranked results with click-to-navigate
 * - Auto-navigates to best match
 * - Highlights all results on the map
 *
 * Integration:
 * - Connects to Visual Bridge (port 8768)
 * - Triggers camera navigation via onNavigate callback
 * - Triggers result highlighting via onHighlight callback
 *
 * Usage:
 *   const ui = new SynapticQueryUI({
 *     bridge: bridgeClient,
 *     onNavigate: (coords) => camera.panTo(coords.x, coords.y),
 *     onHighlight: (results) => highlighter.highlight(results)
 *   });
 *   ui.show();
 */
class SynapticQueryUI {
    /**
     * Create a new SynapticQueryUI.
     * @param {Object} config - Configuration options
     * @param {Object} config.bridge - Bridge client with send(message) method
     * @param {Function} config.onNavigate - Callback(coords) when navigating to result
     * @param {Function} config.onHighlight - Callback(results) when highlighting results
     */
    constructor(config = {}) {
        this.bridge = config.bridge || null;
        this.onNavigate = config.onNavigate || null;
        this.onHighlight = config.onHighlight || null;

        this.visible = false;
        this.results = [];

        // Create UI elements
        this.element = this._createUI();
        this.input = this.element.querySelector('.synaptic-query-input');
        this.resultsPanel = this.element.querySelector('.synaptic-results-panel');

        // Append to document body
        if (typeof document !== 'undefined') {
            document.body.appendChild(this.element);
        }

        // Bind event handlers
        this._bindEvents();
    }

    /**
     * Create the main UI element with input and results panel.
     * @private
     * @returns {HTMLElement}
     */
    _createUI() {
        const el = document.createElement('div');
        el.className = 'synaptic-query-ui';
        el.style.cssText = `
            position: fixed;
            top: 20px;
            left: 20px;
            width: 350px;
            background: rgba(0, 20, 40, 0.95);
            border: 2px solid #0ff;
            border-radius: 8px;
            z-index: 1001;
            font-family: 'Courier New', monospace;
            color: #0ff;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.3);
            display: none;
        `;

        el.innerHTML = `
            <div class="synaptic-query-header" style="
                padding: 10px 15px;
                border-bottom: 1px solid #0ff;
                display: flex;
                justify-content: space-between;
                align-items: center;
            ">
                <span style="font-weight: bold;">Synaptic Query</span>
                <button class="synaptic-close-btn" style="
                    background: transparent;
                    border: 1px solid #0ff;
                    color: #0ff;
                    cursor: pointer;
                    padding: 2px 8px;
                    border-radius: 4px;
                ">X</button>
            </div>
            <div class="synaptic-query-content" style="padding: 15px;">
                <input type="text" class="synaptic-query-input" placeholder="Query the neural substrate..." style="
                    width: 100%;
                    padding: 10px;
                    background: rgba(0, 0, 0, 0.5);
                    border: 1px solid #0ff;
                    color: #0ff;
                    font-family: inherit;
                    font-size: 14px;
                    box-sizing: border-box;
                    outline: none;
                ">
                <div class="synaptic-results-panel" style="
                    margin-top: 10px;
                    max-height: 300px;
                    overflow-y: auto;
                "></div>
            </div>
        `;

        return el;
    }

    /**
     * Bind event handlers for input and close button.
     * @private
     */
    _bindEvents() {
        // Handle Enter key on input
        this.input.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                const query = this.input.value.trim();
                if (query) {
                    this.executeQuery(query);
                }
            }
        });

        // Handle close button
        const closeBtn = this.element.querySelector('.synaptic-close-btn');
        closeBtn.addEventListener('click', () => {
            this.hide();
        });
    }

    /**
     * Execute a query by sending to the bridge.
     * @param {string} queryText - The query text to search for
     */
    executeQuery(queryText) {
        // Don't send empty or whitespace-only queries
        if (!queryText || !queryText.trim()) {
            return;
        }

        // Clear previous results
        this.results = [];
        this._renderResults();

        // Show loading state
        this.resultsPanel.innerHTML = '<div class="loading" style="padding: 10px; color: #888;">Searching...</div>';

        // Send query to bridge
        if (this.bridge && typeof this.bridge.send === 'function') {
            this.bridge.send({
                type: 'synaptic_query',
                query: queryText
            });
        }
    }

    /**
     * Handle query response from the bridge.
     * Updates UI and triggers navigation/highlight callbacks.
     * @param {Object} response - Response object with results array
     * @param {string} response.type - Response type ('synaptic_query_response')
     * @param {Array} response.results - Array of query results
     */
    handleQueryResponse(response) {
        if (response.type !== 'synaptic_query_response') {
            return;
        }

        this.results = response.results || [];
        this.displayResults(this.results);

        // Trigger highlight callback with all results
        if (this.onHighlight && this.results.length > 0) {
            this.onHighlight(this.results);
        }

        // Auto-navigate to best match
        if (this.results.length > 0) {
            this.navigateToBestMatch();
        }
    }

    /**
     * Display results in the results panel.
     * @param {Array} results - Array of result objects
     */
    displayResults(results) {
        this.results = results;
        this._renderResults();
    }

    /**
     * Render results to the results panel.
     * @private
     */
    _renderResults() {
        if (!this.results || this.results.length === 0) {
            this.resultsPanel.innerHTML = '<div class="no-results" style="padding: 10px; color: #888;">No results</div>';
            return;
        }

        const html = this.results.map((result, index) => {
            const similarityPercent = Math.round(result.similarity * 100);
            const typeIcon = result.type === 'memory' ? 'M' : (result.type === 'code' ? 'C' : '?');

            return `
                <div class="query-result-item" data-index="${index}" data-x="${result.x}" data-y="${result.y}" style="
                    padding: 8px 10px;
                    margin-bottom: 5px;
                    background: rgba(0, 255, 255, 0.1);
                    border: 1px solid rgba(0, 255, 255, 0.3);
                    border-radius: 4px;
                    cursor: pointer;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                ">
                    <span class="result-preview" style="
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                        max-width: 200px;
                    ">${result.token || 'Unknown'}</span>
                    <span class="result-meta" style="
                        font-size: 12px;
                        color: #888;
                    ">[${typeIcon}] ${similarityPercent}%</span>
                </div>
            `;
        }).join('');

        this.resultsPanel.innerHTML = html;

        // Bind click handlers to result items
        const items = this.resultsPanel.querySelectorAll('.query-result-item');
        items.forEach(item => {
            item.addEventListener('click', () => {
                const x = parseInt(item.dataset.x, 10);
                const y = parseInt(item.dataset.y, 10);
                this._navigateTo(x, y);
            });
        });
    }

    /**
     * Navigate to the best matching result.
     * Triggers onNavigate callback with coordinates of highest similarity result.
     */
    navigateToBestMatch() {
        if (this.results.length === 0) {
            return;
        }

        // Results are typically sorted by similarity, so first is best
        const best = this.results[0];
        this._navigateTo(best.x, best.y);
    }

    /**
     * Internal navigation helper.
     * @private
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     */
    _navigateTo(x, y) {
        if (this.onNavigate) {
            this.onNavigate({ x, y });
        }
    }

    /**
     * Show the UI.
     */
    show() {
        this.visible = true;
        this.element.style.display = 'block';
        this.input.focus();
    }

    /**
     * Hide the UI.
     */
    hide() {
        this.visible = false;
        this.element.style.display = 'none';
    }

    /**
     * Toggle UI visibility.
     */
    toggle() {
        if (this.visible) {
            this.hide();
        } else {
            this.show();
        }
    }

    /**
     * Check if UI is currently visible.
     * @returns {boolean}
     */
    isVisible() {
        return this.visible;
    }

    /**
     * Clean up and remove UI from DOM.
     */
    destroy() {
        if (this.element && this.element.parentNode) {
            this.element.parentNode.removeChild(this.element);
        }
        this.visible = false;
        this.results = [];
    }
}

// Export for Node.js test runners
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SynapticQueryUI };
}
