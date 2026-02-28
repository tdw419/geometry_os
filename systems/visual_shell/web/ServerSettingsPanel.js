/**
 * ServerSettingsPanel - UI for managing remote catalog servers
 *
 * Provides a settings panel for adding, removing, and configuring
 * remote catalog servers. Uses vanilla DOM (no framework).
 *
 * Features:
 * - Add/remove server configurations
 * - Toggle server enabled/disabled state
 * - Display server reachability status (ok/error/loading)
 * - Color picker for server badge colors
 *
 * @module ServerSettingsPanel
 */

import { ServerRegistry } from './ServerRegistry.js';

class ServerSettingsPanel {
    /**
     * Create a ServerSettingsPanel instance
     * @param {HTMLElement} container - DOM container to render into
     * @param {Object} options - Configuration options
     * @param {Function} options.onServerChange - Callback when servers change
     * @param {ServerRegistry} options.registry - External registry instance (optional)
     * @param {CatalogCacheManager} options.cacheManager - Cache manager instance (optional)
     * @param {Function} options.onCacheClear - Callback when cache is cleared (optional)
     */
    constructor(container, options = {}) {
        this.container = container;
        this.options = options;
        this.registry = options.registry || new ServerRegistry();
        this.cacheManager = options.cacheManager || null;
        this.onServerChange = options.onServerChange || (() => {});
        this.onCacheClear = options.onCacheClear || (() => {});

        // Panel state
        this._isAddFormVisible = false;
        this._cacheStats = null;

        // Inject styles
        this._injectStyles();

        // Render initial panel
        this.render();
    }

    /**
     * Inject CSS styles into document
     * @private
     */
    _injectStyles() {
        // Check if styles already injected
        if (document.getElementById('server-settings-panel-styles')) {
            return;
        }

        const style = document.createElement('style');
        style.id = 'server-settings-panel-styles';
        style.textContent = `
            .server-settings-panel {
                background: #1a1a1a;
                color: #ffffff;
                font-family: 'Courier New', monospace;
                font-size: 12px;
                padding: 16px;
                border-radius: 8px;
                min-width: 400px;
                max-width: 600px;
            }

            .server-settings-panel .panel-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 16px;
                padding-bottom: 12px;
                border-bottom: 1px solid #333;
            }

            .server-settings-panel .panel-header h3 {
                margin: 0;
                font-size: 14px;
                color: #00ffff;
            }

            .server-settings-panel .add-server-btn {
                background: #00aaff;
                color: #000;
                border: none;
                padding: 6px 12px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 11px;
                font-weight: bold;
            }

            .server-settings-panel .add-server-btn:hover {
                background: #00ccff;
            }

            .server-settings-panel .server-list {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .server-settings-panel .server-entry {
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 10px;
                background: #222;
                border-radius: 6px;
                border: 1px solid #333;
            }

            .server-settings-panel .server-entry.disabled {
                opacity: 0.5;
            }

            .server-settings-panel .server-color-dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                flex-shrink: 0;
            }

            .server-settings-panel .server-info {
                flex: 1;
                min-width: 0;
            }

            .server-settings-panel .server-name {
                font-weight: bold;
                color: #fff;
                margin-bottom: 2px;
            }

            .server-settings-panel .server-url {
                font-size: 10px;
                color: #888;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .server-settings-panel .server-status {
                display: flex;
                align-items: center;
                gap: 6px;
                font-size: 10px;
            }

            .server-settings-panel .status-ok {
                color: #00ff00;
            }

            .server-settings-panel .status-error {
                color: #ff4444;
            }

            .server-settings-panel .status-loading {
                color: #ffaa00;
            }

            .server-settings-panel .status-loading::before {
                content: '';
                display: inline-block;
                width: 8px;
                height: 8px;
                border: 2px solid #ffaa00;
                border-top-color: transparent;
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin-right: 4px;
            }

            @keyframes spin {
                to { transform: rotate(360deg); }
            }

            .server-settings-panel .server-actions {
                display: flex;
                gap: 6px;
            }

            .server-settings-panel .toggle-btn,
            .server-settings-panel .remove-btn {
                background: #333;
                color: #ccc;
                border: 1px solid #444;
                padding: 4px 8px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 10px;
            }

            .server-settings-panel .toggle-btn:hover {
                background: #444;
            }

            .server-settings-panel .remove-btn {
                color: #ff6666;
            }

            .server-settings-panel .remove-btn:hover {
                background: #442222;
            }

            .server-settings-panel .add-server-form {
                margin-top: 12px;
                padding: 12px;
                background: #222;
                border-radius: 6px;
                border: 1px solid #00aaff;
            }

            .server-settings-panel .add-server-form.hidden {
                display: none;
            }

            .server-settings-panel .form-row {
                display: flex;
                gap: 8px;
                margin-bottom: 8px;
            }

            .server-settings-panel .form-row:last-child {
                margin-bottom: 0;
            }

            .server-settings-panel .server-url-input,
            .server-settings-panel .server-name-input {
                flex: 1;
                background: #1a1a1a;
                color: #fff;
                border: 1px solid #444;
                padding: 8px;
                border-radius: 4px;
                font-family: inherit;
                font-size: 11px;
            }

            .server-settings-panel .server-url-input:focus,
            .server-settings-panel .server-name-input:focus {
                border-color: #00aaff;
                outline: none;
            }

            .server-settings-panel .server-color-input {
                width: 40px;
                height: 32px;
                border: 1px solid #444;
                border-radius: 4px;
                cursor: pointer;
                background: transparent;
            }

            .server-settings-panel .form-buttons {
                display: flex;
                gap: 8px;
                justify-content: flex-end;
            }

            .server-settings-panel .save-btn {
                background: #00aa44;
                color: #fff;
                border: none;
                padding: 6px 16px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 11px;
                font-weight: bold;
            }

            .server-settings-panel .save-btn:hover {
                background: #00cc55;
            }

            .server-settings-panel .cancel-btn {
                background: #444;
                color: #ccc;
                border: none;
                padding: 6px 16px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 11px;
            }

            .server-settings-panel .cancel-btn:hover {
                background: #555;
            }

            .server-settings-panel .empty-state {
                text-align: center;
                padding: 24px;
                color: #666;
            }

            .server-settings-panel .error-message {
                color: #ff6666;
                font-size: 10px;
                margin-top: 8px;
            }

            .server-settings-panel .cache-section {
                margin-top: 16px;
                padding-top: 16px;
                border-top: 1px solid #333;
            }

            .server-settings-panel .cache-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 12px;
            }

            .server-settings-panel .cache-header h4 {
                margin: 0;
                font-size: 12px;
                color: #00ffff;
            }

            .server-settings-panel .cache-stats {
                font-size: 10px;
                color: #888;
            }

            .server-settings-panel .cache-bar-container {
                background: #222;
                border-radius: 4px;
                height: 8px;
                margin-bottom: 8px;
                overflow: hidden;
            }

            .server-settings-panel .cache-bar {
                background: linear-gradient(90deg, #00aa44, #00ff88);
                height: 100%;
                transition: width 0.3s ease;
            }

            .server-settings-panel .cache-bar.warning {
                background: linear-gradient(90deg, #ffaa00, #ff6600);
            }

            .server-settings-panel .cache-bar.critical {
                background: linear-gradient(90deg, #ff4444, #ff0000);
            }

            .server-settings-panel .cache-actions {
                display: flex;
                gap: 8px;
            }

            .server-settings-panel .clear-cache-btn {
                background: #aa2222;
                color: #fff;
                border: none;
                padding: 6px 12px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 10px;
            }

            .server-settings-panel .clear-cache-btn:hover {
                background: #cc3333;
            }

            .server-settings-panel .clear-cache-btn:disabled {
                background: #444;
                color: #666;
                cursor: not-allowed;
            }

            .server-settings-panel .refresh-cache-btn {
                background: #333;
                color: #ccc;
                border: 1px solid #444;
                padding: 6px 12px;
                border-radius: 4px;
                cursor: pointer;
                font-family: inherit;
                font-size: 10px;
            }

            .server-settings-panel .cache-message {
                font-size: 10px;
                margin-top: 8px;
                padding: 6px;
                border-radius: 4px;
            }

            .server-settings-panel .cache-message.success {
                background: #224422;
                color: #88ff88;
            }

            .server-settings-panel .cache-message.error {
                background: #442222;
                color: #ff8888;
            }
        `;
        document.head.appendChild(style);
    }

    /**
     * Render the full panel
     */
    render() {
        this.container.innerHTML = '';

        const panel = document.createElement('div');
        panel.className = 'server-settings-panel';

        // Header
        const header = document.createElement('div');
        header.className = 'panel-header';
        header.innerHTML = `
            <h3>Remote Catalog Servers</h3>
            <button class="add-server-btn">+ Add Server</button>
        `;
        panel.appendChild(header);

        // Server list
        const serverList = document.createElement('div');
        serverList.className = 'server-list';
        this._renderServerList(serverList);
        panel.appendChild(serverList);

        // Add server form (hidden by default)
        const addForm = document.createElement('div');
        addForm.className = `add-server-form ${this._isAddFormVisible ? '' : 'hidden'}`;
        addForm.innerHTML = `
            <div class="form-row">
                <input type="url" placeholder="Server URL (e.g., https://catalog.example.com)"
                       class="server-url-input">
                <input type="text" placeholder="Display Name" class="server-name-input">
                <input type="color" value="#00aaff" class="server-color-input">
            </div>
            <div class="form-buttons">
                <button class="cancel-btn">Cancel</button>
                <button class="save-btn">Add Server</button>
            </div>
            <div class="error-message" style="display:none"></div>
        `;
        panel.appendChild(addForm);
        this.addForm = addForm;

        // Event listeners
        header.querySelector('.add-server-btn').addEventListener('click', () => {
            this.showAddForm();
        });

        addForm.querySelector('.cancel-btn').addEventListener('click', () => {
            this.hideAddForm();
        });

        addForm.querySelector('.save-btn').addEventListener('click', () => {
            this.handleAddServer();
        });

        // Enter key in inputs
        addForm.querySelector('.server-url-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.handleAddServer();
        });
        addForm.querySelector('.server-name-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.handleAddServer();
        });

        this.container.appendChild(panel);
        this.panel = panel;
        this.serverListEl = serverList;

        // Cache management section (if cacheManager is available)
        if (this.cacheManager) {
            const cacheSection = this._createCacheSection();
            panel.appendChild(cacheSection);
            this.cacheSectionEl = cacheSection;
            // Initial cache stats load
            this._refreshCacheStats();
        }
    }

    /**
     * Render just the server list
     * @param {HTMLElement} container - Container element
     * @private
     */
    _renderServerList(container) {
        container.innerHTML = '';

        const servers = this.registry.getServers();

        if (servers.length === 0) {
            container.innerHTML = `
                <div class="empty-state">
                    No remote servers configured.<br>
                    Click "Add Server" to add a remote catalog.
                </div>
            `;
            return;
        }

        for (const server of servers) {
            const entry = this._createServerEntry(server);
            container.appendChild(entry);
        }
    }

    /**
     * Create a server entry element
     * @param {Object} server - Server object
     * @returns {HTMLElement}
     * @private
     */
    _createServerEntry(server) {
        const entry = document.createElement('div');
        entry.className = `server-entry ${server.enabled ? '' : 'disabled'}`;
        entry.dataset.serverId = server.id;

        // Determine status display
        let statusHtml = '';
        if (server.lastStatus === 'ok') {
            statusHtml = '<span class="status-ok">OK</span>';
        } else if (server.lastStatus === 'error') {
            const errorMsg = server.lastError ? ` (${this._truncateError(server.lastError)})` : '';
            statusHtml = `<span class="status-error">Error${errorMsg}</span>`;
        } else {
            statusHtml = '<span class="status-loading">Loading...</span>';
        }

        entry.innerHTML = `
            <div class="server-color-dot" style="background: ${server.color}"></div>
            <div class="server-info">
                <div class="server-name">${this._escapeHtml(server.name)}</div>
                <div class="server-url">${this._escapeHtml(server.url)}</div>
            </div>
            <div class="server-status">
                ${statusHtml}
            </div>
            <div class="server-actions">
                <button class="toggle-btn">${server.enabled ? 'Disable' : 'Enable'}</button>
                <button class="remove-btn">Remove</button>
            </div>
        `;

        // Toggle button
        entry.querySelector('.toggle-btn').addEventListener('click', () => {
            this.handleToggleServer(server.id);
        });

        // Remove button
        entry.querySelector('.remove-btn').addEventListener('click', () => {
            this.handleRemoveServer(server.id, server.name);
        });

        return entry;
    }

    /**
     * Show the add server form
     */
    showAddForm() {
        this._isAddFormVisible = true;
        if (this.addForm) {
            this.addForm.classList.remove('hidden');
            this.addForm.querySelector('.server-url-input').focus();
        }
    }

    /**
     * Hide the add server form
     */
    hideAddForm() {
        this._isAddFormVisible = false;
        if (this.addForm) {
            this.addForm.classList.add('hidden');
            // Clear form
            this.addForm.querySelector('.server-url-input').value = '';
            this.addForm.querySelector('.server-name-input').value = '';
            this.addForm.querySelector('.server-color-input').value = '#00aaff';
            this.addForm.querySelector('.error-message').style.display = 'none';
        }
    }

    /**
     * Handle adding a new server
     */
    handleAddServer() {
        const urlInput = this.addForm.querySelector('.server-url-input');
        const nameInput = this.addForm.querySelector('.server-name-input');
        const colorInput = this.addForm.querySelector('.server-color-input');
        const errorEl = this.addForm.querySelector('.error-message');

        const url = urlInput.value.trim();
        const name = nameInput.value.trim();
        const color = colorInput.value;

        // Validate URL
        if (!url) {
            this._showFormError('Please enter a server URL');
            return;
        }

        try {
            new URL(url);
        } catch (e) {
            this._showFormError('Please enter a valid URL (e.g., https://example.com)');
            return;
        }

        // Check for duplicate URL
        if (this.registry.urlExists(url)) {
            this._showFormError('This server URL already exists');
            return;
        }

        // Add server
        const server = this.registry.addServer(url, name || url, color);

        console.log(`[ServerSettingsPanel] Added server: ${server.name}`);

        // Hide form and re-render
        this.hideAddForm();
        this._renderServerList(this.serverListEl);

        // Notify callback
        this.onServerChange({
            type: 'add',
            server
        });
    }

    /**
     * Show form error message
     * @param {string} message - Error message
     * @private
     */
    _showFormError(message) {
        const errorEl = this.addForm.querySelector('.error-message');
        errorEl.textContent = message;
        errorEl.style.display = 'block';
    }

    /**
     * Handle toggling server enabled state
     * @param {string} serverId - Server ID
     */
    handleToggleServer(serverId) {
        const server = this.registry.getServer(serverId);
        if (!server) return;

        const newState = this.registry.toggleServer(serverId);
        console.log(`[ServerSettingsPanel] Toggled server ${server.name} to ${newState ? 'enabled' : 'disabled'}`);

        // Re-render list
        this._renderServerList(this.serverListEl);

        // Notify callback
        this.onServerChange({
            type: 'toggle',
            serverId,
            enabled: newState
        });
    }

    /**
     * Handle removing a server
     * @param {string} serverId - Server ID
     * @param {string} serverName - Server name for confirmation
     */
    handleRemoveServer(serverId, serverName) {
        const confirmed = confirm(`Remove server "${serverName}"?\n\nThis will remove the server from your configuration.`);
        if (!confirmed) return;

        const removed = this.registry.removeServer(serverId);
        if (removed) {
            console.log(`[ServerSettingsPanel] Removed server: ${serverName}`);

            // Re-render list
            this._renderServerList(this.serverListEl);

            // Notify callback
            this.onServerChange({
                type: 'remove',
                serverId
            });
        }
    }

    /**
     * Set server status indicator
     * @param {string} serverId - Server ID
     * @param {string} status - Status: 'ok' | 'error' | 'loading'
     * @param {string} error - Error message (optional)
     */
    setServerStatus(serverId, status, error = null) {
        // Update registry
        this.registry.setServerStatus(serverId, status, error);

        // Update UI element if exists
        const entry = this.serverListEl?.querySelector(`[data-server-id="${serverId}"]`);
        if (entry) {
            const statusEl = entry.querySelector('.server-status');
            if (statusEl) {
                let statusHtml = '';
                if (status === 'ok') {
                    statusHtml = '<span class="status-ok">OK</span>';
                } else if (status === 'error') {
                    const errorMsg = error ? ` (${this._truncateError(error)})` : '';
                    statusHtml = `<span class="status-error">Error${errorMsg}</span>`;
                } else {
                    statusHtml = '<span class="status-loading">Loading...</span>';
                }
                statusEl.innerHTML = statusHtml;
            }
        }
    }

    /**
     * Refresh the server list from registry
     */
    refresh() {
        if (this.serverListEl) {
            this._renderServerList(this.serverListEl);
        }
    }

    /**
     * Get the registry instance
     * @returns {ServerRegistry}
     */
    getRegistry() {
        return this.registry;
    }

    /**
     * Truncate error message for display
     * @param {string} error - Error message
     * @returns {string}
     * @private
     */
    _truncateError(error) {
        if (!error) return '';
        if (error.length <= 30) return error;
        return error.substring(0, 27) + '...';
    }

    /**
     * Escape HTML special characters
     * @param {string} str - String to escape
     * @returns {string}
     * @private
     */
    _escapeHtml(str) {
        if (!str) return '';
        const div = document.createElement('div');
        div.textContent = str;
        return div.innerHTML;
    }

    /**
     * Create the cache management section
     * @returns {HTMLElement}
     * @private
     */
    _createCacheSection() {
        const section = document.createElement('div');
        section.className = 'cache-section';

        section.innerHTML = `
            <div class="cache-header">
                <h4>Container Cache</h4>
                <span class="cache-stats" id="cache-size-display">Loading...</span>
            </div>
            <div class="cache-bar-container">
                <div class="cache-bar" id="cache-usage-bar" style="width: 0%"></div>
            </div>
            <div class="cache-actions">
                <button class="refresh-cache-btn" id="refresh-cache-btn">Refresh Stats</button>
                <button class="clear-cache-btn" id="clear-cache-btn">Clear Cache</button>
            </div>
            <div class="cache-message" id="cache-message" style="display: none"></div>
        `;

        // Event listeners
        section.querySelector('#refresh-cache-btn').addEventListener('click', () => {
            this._refreshCacheStats();
        });

        section.querySelector('#clear-cache-btn').addEventListener('click', () => {
            this.handleClearCache();
        });

        return section;
    }

    /**
     * Refresh cache statistics from the cache manager
     * @private
     */
    async _refreshCacheStats() {
        if (!this.cacheManager) return;

        try {
            // Get cache stats from CatalogCacheManager
            const stats = await this.cacheManager.getStats();
            this._cacheStats = stats;
            this._updateCacheUI(stats);
        } catch (error) {
            console.error('[ServerSettingsPanel] Failed to get cache stats:', error);
            this._showCacheMessage('Failed to load cache stats', 'error');
        }
    }

    /**
     * Update cache UI with current stats
     * @param {Object} stats - Cache statistics
     * @param {number} stats.sizeBytes - Current cache size in bytes
     * @param {number} stats.maxSize - Maximum cache size in bytes
     * @param {number} stats.entryCount - Number of cached entries
     * @private
     */
    _updateCacheUI(stats) {
        if (!this.cacheSectionEl || !stats) return;

        const sizeDisplay = this.cacheSectionEl.querySelector('#cache-size-display');
        const usageBar = this.cacheSectionEl.querySelector('#cache-usage-bar');
        const clearBtn = this.cacheSectionEl.querySelector('#clear-cache-btn');

        // Format size for display
        const sizeMB = (stats.sizeBytes / (1024 * 1024)).toFixed(1);
        const maxMB = (stats.maxSize / (1024 * 1024)).toFixed(0);
        const percentUsed = Math.min(100, (stats.sizeBytes / stats.maxSize) * 100);

        sizeDisplay.textContent = `${sizeMB} MB / ${maxMB} MB (${stats.entryCount} items)`;

        // Update progress bar
        usageBar.style.width = `${percentUsed}%`;

        // Color code based on usage
        usageBar.classList.remove('warning', 'critical');
        if (percentUsed > 90) {
            usageBar.classList.add('critical');
        } else if (percentUsed > 70) {
            usageBar.classList.add('warning');
        }

        // Enable/disable clear button based on content
        clearBtn.disabled = stats.entryCount === 0;
    }

    /**
     * Handle clearing the cache
     */
    async handleClearCache() {
        if (!this.cacheManager) return;

        // Show confirmation dialog
        const confirmed = confirm(
            'Clear all cached containers?\n\n' +
            'This will remove all downloaded container data from your browser storage.\n' +
            'You will need to re-download containers to boot them offline.'
        );

        if (!confirmed) return;

        const clearBtn = this.cacheSectionEl.querySelector('#clear-cache-btn');
        const messageEl = this.cacheSectionEl.querySelector('#cache-message');

        try {
            clearBtn.disabled = true;
            clearBtn.textContent = 'Clearing...';

            // Clear the cache
            const result = await this.cacheManager.clear();

            console.log(`[ServerSettingsPanel] Cache cleared: ${result.count} entries removed`);

            // Show success message
            this._showCacheMessage(`Cache cleared: ${result.count} entries removed`, 'success');

            // Refresh stats
            await this._refreshCacheStats();

            // Notify callback
            this.onCacheClear({
                count: result.count,
                bytesFreed: result.bytesFreed
            });

        } catch (error) {
            console.error('[ServerSettingsPanel] Failed to clear cache:', error);
            this._showCacheMessage(`Failed to clear cache: ${error.message}`, 'error');
        } finally {
            clearBtn.disabled = false;
            clearBtn.textContent = 'Clear Cache';
        }
    }

    /**
     * Show a cache message (success or error)
     * @param {string} message - Message to display
     * @param {string} type - Message type ('success' or 'error')
     * @private
     */
    _showCacheMessage(message, type) {
        if (!this.cacheSectionEl) return;

        const messageEl = this.cacheSectionEl.querySelector('#cache-message');
        if (!messageEl) return;

        messageEl.textContent = message;
        messageEl.className = `cache-message ${type}`;
        messageEl.style.display = 'block';

        // Auto-hide after 5 seconds
        setTimeout(() => {
            messageEl.style.display = 'none';
        }, 5000);
    }

    /**
     * Clean up and destroy the panel
     */
    destroy() {
        if (this.container) {
            this.container.innerHTML = '';
        }
        this.panel = null;
        this.serverListEl = null;
        this.addForm = null;
        this.cacheSectionEl = null;
        this._cacheStats = null;
    }
}

// ES6 module export
export { ServerSettingsPanel };

// Also attach to window for legacy/global usage
if (typeof window !== 'undefined') {
    window.ServerSettingsPanel = ServerSettingsPanel;
}
