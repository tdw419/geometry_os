/**
 * CatalogSearchBar - Search input for catalog filtering
 *
 * Provides UI for searching desktop objects by name.
 * Used in conjunction with DesktopObjectManager to show/hide objects
 * based on search query.
 *
 * Features:
 * - Text input with placeholder
 * - Clear button (X) when text present
 * - Debounced search callback (300ms delay)
 * - ES6 export + window attachment pattern
 *
 * @module CatalogSearchBar
 */

/**
 * CatalogSearchBar class for search-based filtering
 */
class CatalogSearchBar {
    /**
     * Debounce delay in milliseconds
     * @static
     */
    static DEBOUNCE_MS = 300;

    /**
     * Create a CatalogSearchBar instance
     * @param {Object} options - Configuration options
     * @param {Function} options.onSearchChange - Callback when search query changes (debounced)
     */
    constructor(options = {}) {
        this.container = null;
        this.input = null;
        this.clearBtn = null;
        this.query = '';
        this.onSearchChange = options.onSearchChange || (() => {});
        this.debounceTimer = null;
        this._createUI();
    }

    /**
     * Create the search bar DOM structure
     * @private
     */
    _createUI() {
        this.container = document.createElement('div');
        this.container.id = 'catalog-search-bar';
        this.container.style.cssText = `
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            background: #222;
            border: 1px solid #444;
            border-radius: 4px;
        `;

        // Search icon
        const icon = document.createElement('span');
        icon.innerHTML = '&#128269;'; // Magnifying glass
        icon.style.cssText = 'color: #666; font-size: 14px;';
        this.container.appendChild(icon);

        // Input field
        this.input = document.createElement('input');
        this.input.type = 'text';
        this.input.placeholder = 'Search containers...';
        this.input.style.cssText = `
            background: transparent;
            border: none;
            color: #fff;
            font-size: 12px;
            outline: none;
            width: 150px;
            font-family: 'Courier New', monospace;
        `;
        this.input.addEventListener('input', (e) => this._onInput(e));
        this.input.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                this.clear();
            }
        });
        this.container.appendChild(this.input);

        // Clear button
        this.clearBtn = document.createElement('button');
        this.clearBtn.innerHTML = '&times;';
        this.clearBtn.title = 'Clear search (Esc)';
        this.clearBtn.style.cssText = `
            background: none;
            border: none;
            color: #666;
            font-size: 14px;
            cursor: pointer;
            padding: 0 4px;
            display: none;
        `;
        this.clearBtn.addEventListener('click', () => this.clear());
        this.container.appendChild(this.clearBtn);
    }

    /**
     * Handle input changes
     * @param {Event} e - Input event
     * @private
     */
    _onInput(e) {
        this.query = e.target.value.trim();
        this._updateClearButton();

        // Debounce the callback
        clearTimeout(this.debounceTimer);
        this.debounceTimer = setTimeout(() => {
            this.onSearchChange(this.query);
        }, CatalogSearchBar.DEBOUNCE_MS);
    }

    /**
     * Update clear button visibility based on query
     * @private
     */
    _updateClearButton() {
        this.clearBtn.style.display = this.query ? 'block' : 'none';
    }

    /**
     * Clear the search query
     */
    clear() {
        this.query = '';
        this.input.value = '';
        this._updateClearButton();
        this.onSearchChange('');
    }

    /**
     * Get the container element for adding to DOM
     * @returns {HTMLElement}
     */
    getContainer() {
        return this.container;
    }

    /**
     * Get the current search query
     * @returns {string}
     */
    getQuery() {
        return this.query;
    }

    /**
     * Focus the search input
     */
    focus() {
        this.input.focus();
    }
}

// ES6 module export
export { CatalogSearchBar };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.CatalogSearchBar = CatalogSearchBar;
}
