/**
 * Geometry OS Web Terminal - JavaScript Module
 *
 * Handles xterm.js initialization, WebSocket connection to Visual Bridge,
 * and terminal I/O.
 *
 * @package GeometryOS_WebTerminal
 * @since 1.0.0
 */

(function() {
    'use strict';

    // WordPress localized data (set via wp_localize_script)
    const WP = window.GOTerminal || {
        ajaxurl: window.ajaxurl || '/wp-admin/admin-ajax.php',
        nonce: '',
        wsUrl: 'ws://localhost:8768',
        sessionToken: ''
    };

    /**
     * Terminal Module
     */
    const GOTerminal = {
        term: null,
        socket: null,
        fitAddon: null,
        reconnectAttempts: 0,
        maxReconnectAttempts: 5,
        reconnectDelay: 1000,
        isConnected: false,

        /**
         * Initialize the terminal
         */
        init: function() {
            const self = this;

            // Create terminal instance
            this.term = new Terminal({
                cursorBlink: true,
                cursorStyle: 'block',
                fontSize: 14,
                fontFamily: "'Courier New', Courier, monospace",
                theme: {
                    background: '#0c0c0c',
                    foreground: '#cccccc',
                    cursor: '#00bcd4',
                    cursorAccent: '#0c0c0c',
                    selection: 'rgba(0, 188, 212, 0.3)',
                    black: '#0c0c0c',
                    red: '#f44336',
                    green: '#4caf50',
                    yellow: '#ffeb3b',
                    blue: '#2196f3',
                    magenta: '#e91e63',
                    cyan: '#00bcd4',
                    white: '#cccccc',
                    brightBlack: '#6d6d6d',
                    brightRed: '#ff5252',
                    brightGreen: '#69f0ae',
                    brightYellow: '#ffff00',
                    brightBlue: '#42a5f5',
                    brightMagenta: '#ff4081',
                    brightCyan: '#18ffff',
                    brightWhite: '#ffffff'
                },
                allowTransparency: true,
                scrollback: 10000,
                tabStopWidth: 4
            });

            // Create fit addon
            this.fitAddon = new FitAddon.FitAddon();
            this.term.loadAddon(this.fitAddon);

            // Create web links addon
            this.term.loadAddon(new WebLinksAddon.WebLinksAddon());

            // Open terminal in container
            const container = document.getElementById('goterminal-terminal');
            if (!container) {
                console.error('GOTerminal: Container not found');
                return;
            }

            this.term.open(container);
            this.fitAddon.fit();

            // Write welcome message
            this.term.writeln('\x1b[1;36m  ____ _             ____            _             _   \x1b[0m');
            this.term.writeln('\x1b[1;36m / ___| |_   _ ___  / ___|___  _ __ | |_ _ __ ___ | |  \x1b[0m');
            this.term.writeln('\x1b[1;36m| |  _| | | | / __|| |   / _ \\| \'_ \\| __| \'__/ _ \\| |  \x1b[0m');
            this.term.writeln('\x1b[1;36m| |_| | | |_| \\__ \\ |__| (_) | | | | |_| | | (_) | |  \x1b[0m');
            this.term.writeln('\x1b[1;36m \\____|_|\\__,_|___/ \\____\\___/|_| |_|\\__|_|  \\___/|_|  \x1b[0m');
            this.term.writeln('');
            this.term.writeln('\x1b[33m  Geometry OS Web Terminal v1.0.0\x1b[0m');
            this.term.writeln('\x1b[90m  Connecting to Visual Bridge...\x1b[0m');
            this.term.writeln('');

            // Connect to WebSocket
            this.connect();

            // Handle resize
            window.addEventListener('resize', function() {
                if (self.fitAddon && self.term) {
                    self.fitAddon.fit();
                    if (self.isConnected && self.socket) {
                        self.socket.send(JSON.stringify({
                            type: 'resize',
                            cols: self.term.cols,
                            rows: self.term.rows
                        }));
                    }
                }
            });

            // Handle terminal input
            this.term.onData(function(data) {
                if (self.isConnected && self.socket) {
                    self.socket.send(JSON.stringify({
                        type: 'input',
                        data: data
                    }));
                }
            });

            console.log('GOTerminal: Initialized');
        },

        /**
         * Connect to Visual Bridge WebSocket
         */
        connect: function() {
            const self = this;
            const wsUrl = WP.wsUrl + '/terminal?token=' + WP.sessionToken;

            this.updateStatus('connecting', 'Connecting...');

            try {
                this.socket = new WebSocket(wsUrl);

                this.socket.onopen = function() {
                    self.isConnected = true;
                    self.reconnectAttempts = 0;
                    self.updateStatus('connected', 'Connected');

                    self.term.writeln('\x1b[32m  ✓ Connected to Visual Bridge\x1b[0m');
                    self.term.writeln('');

                    // Send initial resize
                    self.socket.send(JSON.stringify({
                        type: 'resize',
                        cols: self.term.cols,
                        rows: self.term.rows
                    }));
                };

                this.socket.onmessage = function(event) {
                    try {
                        const message = JSON.parse(event.data);

                        if (message.type === 'output') {
                            self.term.write(message.data);
                        } else if (message.type === 'error') {
                            self.term.writeln('\x1b[31m  Error: ' + message.message + '\x1b[0m');
                        }
                    } catch (e) {
                        // Plain text output
                        self.term.write(event.data);
                    }
                };

                this.socket.onclose = function(event) {
                    self.isConnected = false;

                    if (event.wasClean) {
                        self.updateStatus('disconnected', 'Disconnected');
                        self.term.writeln('');
                        self.term.writeln('\x1b[33m  Connection closed\x1b[0m');
                    } else {
                        self.updateStatus('disconnected', 'Connection lost');
                        self.term.writeln('');
                        self.term.writeln('\x1b[31m  Connection lost\x1b[0m');

                        // Attempt reconnect
                        self.attemptReconnect();
                    }
                };

                this.socket.onerror = function(error) {
                    self.updateStatus('disconnected', 'Connection error');
                    self.term.writeln('\x1b[31m  WebSocket error\x1b[0m');
                    console.error('GOTerminal: WebSocket error', error);
                };

            } catch (error) {
                this.updateStatus('disconnected', 'Connection failed');
                this.term.writeln('\x1b[31m  Failed to connect: ' + error.message + '\x1b[0m');
                console.error('GOTerminal: Connection error', error);
            }
        },

        /**
         * Attempt to reconnect to WebSocket
         */
        attemptReconnect: function() {
            const self = this;

            if (this.reconnectAttempts >= this.maxReconnectAttempts) {
                this.term.writeln('\x1b[31m  Max reconnection attempts reached. Please refresh the page.\x1b[0m');
                return;
            }

            this.reconnectAttempts++;
            const delay = this.reconnectDelay * this.reconnectAttempts;

            this.term.writeln('\x1b[33m  Reconnecting in ' + (delay / 1000) + 's (attempt ' + this.reconnectAttempts + '/' + this.maxReconnectAttempts + ')...\x1b[0m');
            this.updateStatus('connecting', 'Reconnecting...');

            setTimeout(function() {
                self.connect();
            }, delay);
        },

        /**
         * Update connection status UI
         */
        updateStatus: function(status, text) {
            const dot = document.getElementById('goterminal-status-dot');
            const statusText = document.getElementById('goterminal-status-text');

            if (dot) {
                dot.className = 'goterminal-status-dot ' + status;
            }

            if (statusText) {
                statusText.textContent = text;
            }
        },

        /**
         * Disconnect terminal
         */
        disconnect: function() {
            if (this.socket) {
                this.socket.close();
                this.socket = null;
            }
            this.isConnected = false;
        }
    };

    // Expose to global scope
    window.GOTerminal = GOTerminal;

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            GOTerminal.init();
        });
    } else {
        GOTerminal.init();
    }

})();
