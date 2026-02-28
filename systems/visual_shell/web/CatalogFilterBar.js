/**
 * CatalogFilterBar - Filter bar for catalog source filtering
 *
 * Provides UI for filtering desktop objects by source (All/Local/Remote).
 * Used in conjunction with DesktopObjectManager to show/hide objects
 * based on their origin.
 *
 * Features:
 * - Three filter buttons: All, Local, Remote
 * - Visual indication of active filter
 * - Count display for each filter category
 * - Callback when filter changes
 *
 * @module CatalogFilterBar
 */

/**
 * CatalogFilterBar class for source-based filtering
 */
class CatalogFilterBar {
    /**
     * Available filter options
     * @static
     */
    static FILTERS = {
        ALL: 'all',
        LOCAL: 'local',
        REMOTE: 'remote'
    };

    /**
     * Create a CatalogFilterBar instance
     * @param {Object} options - Configuration options
     * @param {Function} options.onFilterChange - Callback when filter changes
     */
    constructor(options = {}) {
        this.container = null;
        this.activeFilter = CatalogFilterBar.FILTERS.ALL;
        this.onFilterChange = options.onFilterChange || (() => {});
        this.counts = { all: 0, local: 0, remote: 0 };
        this._createUI();
    }

    /**
     * Create the filter bar DOM structure
     * @private
     */
    _createUI() {
        this.container = document.createElement('div');
        this.container.id = 'catalog-filter-bar';
        this.container.style.cssText = `
            display: flex;
            gap: 8px;
            padding: 8px 12px;
            background: #1a1a1a;
            border-bottom: 1px solid #333;
            align-items: center;
        `;

        // Label
        const label = document.createElement('span');
        label.textContent = 'Filter:';
        label.style.cssText = 'color: #888; font-size: 12px; margin-right: 8px;';
        this.container.appendChild(label);

        // Create filter buttons
        for (const [name, value] of Object.entries(CatalogFilterBar.FILTERS)) {
            const btn = this._createButton(value, name);
            this.container.appendChild(btn);
            this[`btn${name}`] = btn;
        }

        // Set initial active state
        this._updateButtonStyles();
    }

    /**
     * Create a filter button element
     * @param {string} filter - Filter value
     * @param {string} label - Button label
     * @returns {HTMLButtonElement}
     * @private
     */
    _createButton(filter, label) {
        const btn = document.createElement('button');
        btn.className = 'filter-btn';
        btn.dataset.filter = filter;
        btn.textContent = `${label} (0)`;
        btn.style.cssText = `
            background: #222;
            border: 1px solid #444;
            color: #888;
            padding: 6px 12px;
            font-size: 12px;
            cursor: pointer;
            border-radius: 4px;
            transition: all 0.2s;
        `;
        btn.addEventListener('click', () => this.setFilter(filter));
        return btn;
    }

    /**
     * Set the active filter
     * @param {string} filter - Filter value (all, local, or remote)
     */
    setFilter(filter) {
        if (this.activeFilter === filter) return;
        this.activeFilter = filter;
        this._updateButtonStyles();
        this.onFilterChange(filter);
    }

    /**
     * Update button styles based on active filter
     * @private
     */
    _updateButtonStyles() {
        for (const name of Object.keys(CatalogFilterBar.FILTERS)) {
            const btn = this[`btn${name}`];
            const isActive = this.activeFilter === CatalogFilterBar.FILTERS[name];
            btn.style.background = isActive ? '#00ffff' : '#222';
            btn.style.color = isActive ? '#000' : '#888';
            btn.style.borderColor = isActive ? '#00ffff' : '#444';
        }
    }

    /**
     * Update the count displays for each filter
     * @param {number} local - Number of local containers
     * @param {number} remote - Number of remote containers
     */
    updateCounts(local, remote) {
        this.counts.local = local;
        this.counts.remote = remote;
        this.counts.all = local + remote;

        this.btnAll.textContent = `All (${this.counts.all})`;
        this.btnLocal.textContent = `Local (${this.counts.local})`;
        this.btnRemote.textContent = `Remote (${this.counts.remote})`;
    }

    /**
     * Get the container element for adding to DOM
     * @returns {HTMLElement}
     */
    getContainer() {
        return this.container;
    }

    /**
     * Get the currently active filter
     * @returns {string}
     */
    getActiveFilter() {
        return this.activeFilter;
    }
}

// ES6 module export
export { CatalogFilterBar };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.CatalogFilterBar = CatalogFilterBar;
}
