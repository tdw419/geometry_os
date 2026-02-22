/**
 * ASCII Desktop Control - JavaScript Module
 *
 * Handles AJAX polling, directive posting, daemon status checks, and UI updates.
 * Requirements: AC-1.2, AC-2.5, AC-3.6, UI-4, UI-5
 */

(function() {
    'use strict';

    // WordPress localized data (set via wp_localize_script)
    const WP = window.ASCIICtrl || {
        ajaxurl: window.ajaxurl || '/wp-admin/admin-ajax.php',
        nonce: '',
        pollingInterval: 2000,
        gridWidth: 80,
        gridHeight: 24
    };

    /**
     * ASCII Control Module
     */
    const ASCIIControl = {
        /**
         * Polling module - manages AJAX polling with configurable interval
         */
        poll: {
            intervalId: null,
            isPolling: false,
            isVisible: true,

            /**
             * Start polling for ASCII view updates
             * @param {number} intervalMs - Polling interval in milliseconds (default from settings)
             */
            start: function(intervalMs) {
                if (this.isPolling) return;

                const interval = intervalMs || WP.pollingInterval || 2000;
                this.isPolling = true;

                // Initial fetch
                ASCIIControl.view.fetch();

                // Set up interval
                this.intervalId = setInterval(function() {
                    if (ASCIIControl.poll.isVisible) {
                        ASCIIControl.view.fetch();
                    }
                }, interval);

                console.log('ASCII Control: Polling started (' + interval + 'ms)');
            },

            /**
             * Stop polling
             */
            stop: function() {
                if (this.intervalId) {
                    clearInterval(this.intervalId);
                    this.intervalId = null;
                }
                this.isPolling = false;
                console.log('ASCII Control: Polling stopped');
            },

            /**
             * Set up Page Visibility API to pause polling when tab is hidden
             */
            setupVisibilityHandler: function() {
                document.addEventListener('visibilitychange', function() {
                    ASCIIControl.poll.isVisible = !document.hidden;
                    if (document.hidden) {
                        console.log('ASCII Control: Tab hidden, polling paused');
                    } else {
                        console.log('ASCII Control: Tab visible, polling resumed');
                        // Immediate refresh when tab becomes visible
                        if (ASCIIControl.poll.isPolling) {
                            ASCIIControl.view.fetch();
                        }
                    }
                });
            }
        },

        /**
         * View module - ASCII grid rendering and updates
         */
        view: {
            lastUpdate: null,
            isLoading: false,

            /**
             * Fetch ASCII view from server
             */
            fetch: function() {
                if (this.isLoading) return;

                this.isLoading = true;
                ASCIIControl.ui.showLoader();

                fetch(WP.ajaxurl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        action: 'ascii_get_view',
                        _ajax_nonce: WP.nonce,
                        width: WP.gridWidth,
                        height: WP.gridHeight
                    })
                })
                .then(function(response) { return response.json(); })
                .then(function(data) {
                    ASCIIControl.view.render(data);
                })
                .catch(function(error) {
                    console.error('ASCII Control: Fetch error', error);
                    ASCIIControl.ui.showToast('Failed to fetch ASCII view', 'error');
                    ASCIIControl.view.showError(error.message || 'Connection error');
                })
                .finally(function() {
                    ASCIIControl.view.isLoading = false;
                    ASCIIControl.ui.hideLoader();
                });
            },

            /**
             * Render ASCII data to grid
             * @param {Object} data - Response data with ascii, bindings, mode, timestamp
             */
            render: function(data) {
                const grid = document.getElementById('ascii-grid');
                const header = document.getElementById('ascii-header');
                const timestamp = document.getElementById('ascii-timestamp');

                if (!grid) return;

                if (data.success && data.data) {
                    const viewData = data.data;

                    // Render ASCII content
                    if (viewData.ascii) {
                        grid.textContent = viewData.ascii;
                        grid.classList.remove('error');
                    }

                    // Update header with window metadata
                    if (header && viewData.window_id) {
                        header.textContent = 'Window: ' + viewData.window_id +
                            ' | Size: ' + (viewData.size || 'N/A') +
                            ' | Mode: ' + (viewData.mode || 'unknown');
                    }

                    // Update timestamp
                    this.lastUpdate = new Date();
                    if (timestamp) {
                        timestamp.textContent = 'Last updated: just now';
                        this.updateTimestampAgo();
                    }

                    // Store bindings for click handling
                    if (viewData.bindings) {
                        grid.dataset.bindings = JSON.stringify(viewData.bindings);
                    }
                } else {
                    // Handle error response
                    const errorMsg = data.data?.message || 'Failed to load ASCII view';
                    this.showError(errorMsg);
                }
            },

            /**
             * Show error message in grid
             * @param {string} message - Error message to display
             */
            showError: function(message) {
                const grid = document.getElementById('ascii-grid');
                if (grid) {
                    grid.textContent = 'Error: ' + message;
                    grid.classList.add('error');
                }
            },

            /**
             * Update "Last updated: Xs ago" text
             */
            updateTimestampAgo: function() {
                const self = this;
                const timestamp = document.getElementById('ascii-timestamp');

                if (!timestamp || !this.lastUpdate) return;

                // Update every second
                setInterval(function() {
                    if (self.lastUpdate) {
                        const seconds = Math.floor((new Date() - self.lastUpdate) / 1000);
                        if (seconds < 60) {
                            timestamp.textContent = 'Last updated: ' + seconds + 's ago';
                        } else {
                            const minutes = Math.floor(seconds / 60);
                            timestamp.textContent = 'Last updated: ' + minutes + 'm ago';
                        }
                    }
                }, 1000);
            },

            /**
             * Force immediate refresh (manual refresh button)
             */
            refresh: function() {
                this.fetch();
            }
        },

        /**
         * Directive module - posting and managing directives
         */
        directive: {
            /**
             * Submit a new directive via AJAX
             * @param {string} title - Directive title
             * @param {string} content - Directive content
             * @param {function} callback - Optional callback(success, data)
             */
            submit: function(title, content, callback) {
                // Validate inputs
                if (!title || title.trim() === '') {
                    ASCIIControl.ui.showToast('Title is required', 'error');
                    if (callback) callback(false, { message: 'Title is required' });
                    return;
                }

                if (!content || content.trim() === '') {
                    ASCIIControl.ui.showToast('Content is required', 'error');
                    if (callback) callback(false, { message: 'Content is required' });
                    return;
                }

                if (title.length > 100) {
                    ASCIIControl.ui.showToast('Title must be 100 characters or less', 'error');
                    if (callback) callback(false, { message: 'Title too long' });
                    return;
                }

                if (content.length > 1000) {
                    ASCIIControl.ui.showToast('Content must be 1000 characters or less', 'error');
                    if (callback) callback(false, { message: 'Content too long' });
                    return;
                }

                ASCIIControl.ui.showLoader();

                fetch(WP.ajaxurl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        action: 'ascii_post_directive',
                        _ajax_nonce: WP.nonce,
                        title: title.trim(),
                        content: content.trim()
                    })
                })
                .then(function(response) { return response.json(); })
                .then(function(data) {
                    if (data.success) {
                        ASCIIControl.ui.showToast('Directive posted successfully (ID: ' + data.data.directive_id + ')', 'success');
                        // Clear form
                        const form = document.getElementById('directive-form');
                        if (form) {
                            form.reset();
                        }
                        // Refresh directive list
                        ASCIIControl.directive.loadList();
                    } else {
                        ASCIIControl.ui.showToast(data.data?.message || 'Failed to post directive', 'error');
                    }
                    if (callback) callback(data.success, data.data);
                })
                .catch(function(error) {
                    console.error('ASCII Control: Directive submit error', error);
                    ASCIIControl.ui.showToast('Failed to post directive', 'error');
                    if (callback) callback(false, { message: error.message });
                })
                .finally(function() {
                    ASCIIControl.ui.hideLoader();
                });
            },

            /**
             * Load and refresh directive queue table
             */
            loadList: function() {
                const tableBody = document.getElementById('directive-list');
                if (!tableBody) return;

                fetch(WP.ajaxurl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        action: 'ascii_get_directives',
                        _ajax_nonce: WP.nonce,
                        limit: 20
                    })
                })
                .then(function(response) { return response.json(); })
                .then(function(data) {
                    if (data.success && data.data && data.data.directives) {
                        ASCIIControl.directive.renderList(data.data.directives);
                    }
                })
                .catch(function(error) {
                    console.error('ASCII Control: Failed to load directives', error);
                });
            },

            /**
             * Render directive list to table
             * @param {Array} directives - Array of directive objects
             */
            renderList: function(directives) {
                const tableBody = document.getElementById('directive-list');
                if (!tableBody) return;

                if (!directives || directives.length === 0) {
                    tableBody.innerHTML = '<tr><td colspan="5" class="no-items">No directives found</td></tr>';
                    return;
                }

                let html = '';
                directives.forEach(function(d) {
                    const statusClass = 'badge-' + (d.status || 'pending');
                    const statusLabel = d.status || 'pending';

                    html += '<tr class="directive-row" data-id="' + d.id + '">';
                    html += '<td class="col-id">' + d.id + '</td>';
                    html += '<td class="col-title">' + escapeHtml(d.title) + '</td>';
                    html += '<td class="col-status"><span class="status-badge ' + statusClass + '">' + statusLabel + '</span></td>';
                    html += '<td class="col-result">' + escapeHtml(d.result_summary || '-') + '</td>';
                    html += '<td class="col-timestamp">' + (d.timestamp || '-') + '</td>';
                    html += '</tr>';

                    // Expandable content row
                    html += '<tr class="directive-details" data-for="' + d.id + '" style="display:none;">';
                    html += '<td colspan="5"><div class="directive-content">' + escapeHtml(d.content || '') + '</div></td>';
                    html += '</tr>';
                });

                tableBody.innerHTML = html;

                // Add click handlers for expandable rows
                tableBody.querySelectorAll('.directive-row').forEach(function(row) {
                    row.addEventListener('click', function() {
                        const id = this.dataset.id;
                        const detailRow = tableBody.querySelector('.directive-details[data-for="' + id + '"]');
                        if (detailRow) {
                            const isVisible = detailRow.style.display !== 'none';
                            detailRow.style.display = isVisible ? 'none' : 'table-row';
                        }
                    });
                });
            }
        },

        /**
         * Daemon module - status checking
         */
        daemon: {
            statusCache: null,
            cacheTime: null,
            CACHE_TTL: 30000, // 30 seconds

            /**
             * Check daemon status
             * @param {boolean} forceRefresh - Force refresh ignoring cache
             */
            checkStatus: function(forceRefresh) {
                const self = this;

                // Use cached status if valid
                if (!forceRefresh && this.statusCache && this.cacheTime) {
                    const age = Date.now() - this.cacheTime;
                    if (age < this.CACHE_TTL) {
                        this.updateUI(this.statusCache);
                        return;
                    }
                }

                fetch(WP.ajaxurl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        action: 'ascii_daemon_status',
                        _ajax_nonce: WP.nonce
                    })
                })
                .then(function(response) { return response.json(); })
                .then(function(data) {
                    if (data.success && data.data) {
                        self.statusCache = data.data;
                        self.cacheTime = Date.now();
                        self.updateUI(data.data);
                    }
                })
                .catch(function(error) {
                    console.error('ASCII Control: Daemon status check failed', error);
                    self.updateUI({ running: false, error: error.message });
                });
            },

            /**
             * Update daemon status UI
             * @param {Object} status - Status object with running boolean
             */
            updateUI: function(status) {
                const badge = document.getElementById('daemon-status-badge');
                const startBtn = document.getElementById('daemon-start-btn');

                if (badge) {
                    if (status.running) {
                        badge.textContent = 'Running';
                        badge.className = 'daemon-badge running';
                        badge.setAttribute('aria-label', 'Daemon is running');
                    } else {
                        badge.textContent = 'Stopped';
                        badge.className = 'daemon-badge stopped';
                        badge.setAttribute('aria-label', 'Daemon is stopped');
                    }
                }

                if (startBtn) {
                    startBtn.style.display = status.running ? 'none' : 'inline-block';
                }
            },

            /**
             * Start periodic status checks
             */
            startStatusPolling: function() {
                const self = this;
                // Check every 30 seconds
                setInterval(function() {
                    self.checkStatus(true);
                }, 30000);
                // Initial check
                this.checkStatus(true);
            }
        },

        /**
         * UI module - notifications and loaders
         */
        ui: {
            loaderElement: null,
            toastContainer: null,

            /**
             * Show loading spinner
             */
            showLoader: function() {
                let loader = document.getElementById('ascii-loader');
                if (!loader) {
                    loader = document.createElement('div');
                    loader.id = 'ascii-loader';
                    loader.className = 'ascii-loader';
                    loader.innerHTML = '<span class="spinner is-active"></span><span class="loader-text">Loading...</span>';
                    document.body.appendChild(loader);
                }
                loader.style.display = 'flex';
                this.loaderElement = loader;
            },

            /**
             * Hide loading spinner
             */
            hideLoader: function() {
                if (this.loaderElement) {
                    this.loaderElement.style.display = 'none';
                }
            },

            /**
             * Show toast notification
             * @param {string} message - Message to display
             * @param {string} type - Toast type: 'success', 'error', 'warning', 'info'
             */
            showToast: function(message, type) {
                const self = this;

                // Create container if not exists
                if (!this.toastContainer) {
                    this.toastContainer = document.createElement('div');
                    this.toastContainer.id = 'ascii-toast-container';
                    this.toastContainer.className = 'ascii-toast-container';
                    document.body.appendChild(this.toastContainer);
                }

                // Create toast element
                const toast = document.createElement('div');
                toast.className = 'ascii-toast toast-' + (type || 'info');
                toast.setAttribute('role', 'alert');
                toast.setAttribute('aria-live', 'polite');

                // Add icon based on type
                const icons = {
                    success: '&#10004;',
                    error: '&#10006;',
                    warning: '&#9888;',
                    info: '&#8505;'
                };
                const icon = icons[type] || icons.info;

                toast.innerHTML = '<span class="toast-icon">' + icon + '</span><span class="toast-message">' + escapeHtml(message) + '</span>';

                this.toastContainer.appendChild(toast);

                // Auto-dismiss after 5 seconds
                setTimeout(function() {
                    toast.classList.add('toast-fade-out');
                    setTimeout(function() {
                        if (toast.parentNode) {
                            toast.parentNode.removeChild(toast);
                        }
                    }, 300);
                }, 5000);
            },

            /**
             * Initialize UI elements
             */
            init: function() {
                // Set up form submit handler
                const form = document.getElementById('directive-form');
                if (form) {
                    form.addEventListener('submit', function(e) {
                        e.preventDefault();
                        const title = form.querySelector('input[name="title"]');
                        const content = form.querySelector('textarea[name="content"]');
                        if (title && content) {
                            ASCIIControl.directive.submit(title.value, content.value);
                        }
                    });
                }

                // Set up manual refresh button
                const refreshBtn = document.getElementById('ascii-refresh-btn');
                if (refreshBtn) {
                    refreshBtn.addEventListener('click', function() {
                        ASCIIControl.view.refresh();
                    });
                }
            }
        },

        /**
         * Initialize the ASCII Control module
         */
        init: function() {
            // Set up visibility handler
            this.poll.setupVisibilityHandler();

            // Initialize UI
            this.ui.init();

            // Start polling
            this.poll.start();

            // Start daemon status checks
            this.daemon.startStatusPolling();

            // Load initial directive list
            this.directive.loadList();

            console.log('ASCII Control: Initialized');
        }
    };

    /**
     * Helper function to escape HTML
     * @param {string} text - Text to escape
     * @returns {string} - Escaped text
     */
    function escapeHtml(text) {
        if (!text) return '';
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    // Expose to global scope
    window.ASCIIControl = ASCIIControl;

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            ASCIIControl.init();
        });
    } else {
        ASCIIControl.init();
    }

})();
