/**
 * CollaborationManager - Real-Time Collaboration System for Neural Heatmap
 *
 * Provides multi-user session support with WebRTC for peer-to-peer
 * synchronization, role-based access control, presence indicators,
 * and conflict resolution for concurrent edits.
 *
 * Part of: Neural Heatmap Phase 2.3 - Real-Time Collaboration
 *
 * Features:
 * - Multi-user session support via WebRTC
 * - Role-based access control (admin, editor, viewer)
 * - Presence indicators with cursors
 * - Shared state synchronization
 * - Conflict resolution for concurrent edits
 * - Session recording and playback
 *
 * @class CollaborationManager
 * @example
 * const collaboration = new CollaborationManager();
 * await collaboration.init();
 *
 * // Create or join session
 * const session = await collaboration.createSession();
 * // or
 * await collaboration.joinSession(sessionId);
 *
 * // Share state
 * collaboration.share("filter", { layerIds: ["layer1"] });
 *
 * // Receive updates from others
 * collaboration.on("stateChanged", (update) => {
 *     console.log(`${update.user} changed ${update.key}`);
 * });
 */

class CollaborationManager {
    /**
     * Create a new CollaborationManager
     * @param {Object} options - Configuration options
     * @param {string} options.signalingServer - WebSocket signaling server URL
     * @param {string}.options.storageKey - localStorage key (default: 'collaboration-state')
     * @param {Object} options.peerConfig - WebRTC peer connection config
     */
    constructor(options = {}) {
        this.options = {
            signalingServer: options.signalingServer || 'ws://localhost:8080',
            storageKey: options.storageKey || 'collaboration-state',
            autoReconnect: true,
            reconnectInterval: 3000,
            maxReconnectAttempts: 10,
            heartbeatInterval: 30000,
            ...options
        };

        // Session state
        this.sessionId = null;
        this.userId = this._generateUserId();
        this.userName = `User_${this.userId.slice(0, 6)}`;
        this.role = 'viewer'; // viewer, editor, admin
        this.isConnected = false;
        this.isHost = false;

        // Peer connections
        this.peers = new Map(); // peerId -> { connection, dataChannel, role, userName }
        this.localPeer = null;

        // Shared state with CRDT support
        this.sharedState = new Map();
        this.stateHistory = [];
        this.pendingOperations = [];

        // Presence tracking
        this.presence = new Map(); // userId -> { x, y, cursor, timestamp }
        this.localCursor = { x: 0, y: 0, visible: false };

        // Role permissions
        this.rolePermissions = {
            viewer: {
                canView: true,
                canEdit: false,
                canManageUsers: false,
                canChangeSettings: false
            },
            editor: {
                canView: true,
                canEdit: true,
                canManageUsers: false,
                canChangeSettings: false
            },
            admin: {
                canView: true,
                canEdit: true,
                canManageUsers: true,
                canChangeSettings: true
            }
        };

        // Event listeners
        this.listeners = new Map();

        // Recording
        this.isRecording = false;
        this.recordingBuffer = [];
        this.playbackIndex = 0;
        this.isPlayingBack = false;

        // Connection state
        this.reconnectAttempts = 0;
        this.heartbeatTimer = null;
        this.signalingSocket = null;

        console.log('[CollaborationManager] Initialized');
    }

    /**
     * Initialize the collaboration manager
     * @returns {Promise<CollaborationManager>} This instance for chaining
     */
    async init() {
        try {
            // Connect to signaling server
            await this._connectToSignalingServer();

            // Setup WebRTC configuration
            this._setupPeerConfiguration();

            // Load saved state
            this._loadSavedState();

            // Start heartbeat
            this._startHeartbeat();

            console.log('[CollaborationManager] Initialized successfully');
            this._emit('initialized', { userId: this.userId });

            return this;
        } catch (error) {
            console.error('[CollaborationManager] Initialization failed:', error);
            throw error;
        }
    }

    /**
     * Create a new collaboration session
     * @param {Object} options - Session options
     * @param {string} options.sessionName - Name for the session
     * @param {string} options.password - Optional password for protected sessions
     * @returns {Promise<Object>} Session info with ID and join token
     */
    async createSession(options = {}) {
        if (this.isConnected) {
            throw new Error('Already connected to a session');
        }

        const sessionOptions = {
            sessionName: options.sessionName || 'Neural Heatmap Session',
            password: options.password || null,
            maxParticipants: options.maxParticipants || 10,
            ...options
        };

        try {
            // Generate session ID
            this.sessionId = this._generateSessionId();
            this.isHost = true;
            this.role = 'admin';

            // Create session via signaling server
            const response = await this._sendSignalingMessage({
                type: 'create_session',
                sessionId: this.sessionId,
                userId: this.userId,
                userName: this.userName,
                options: sessionOptions
            });

            if (!response.success) {
                throw new Error(response.error || 'Failed to create session');
            }

            this.isConnected = true;

            // Initialize shared state
            this._initializeSharedState();

            console.log(`[CollaborationManager] Session created: ${this.sessionId}`);
            this._emit('sessionCreated', {
                sessionId: this.sessionId,
                isHost: true,
                role: this.role,
                joinUrl: this._getJoinUrl()
            });

            return {
                sessionId: this.sessionId,
                userId: this.userId,
                role: this.role,
                joinUrl: this._getJoinUrl(),
                isHost: true
            };
        } catch (error) {
            console.error('[CollaborationManager] Failed to create session:', error);
            throw error;
        }
    }

    /**
     * Join an existing collaboration session
     * @param {string} sessionId - Session ID to join
     * @param {Object} options - Join options
     * @param {string} options.password - Session password if required
     * @param {string} options.userName - Custom user name
     * @returns {Promise<Object>} Session info
     */
    async joinSession(sessionId, options = {}) {
        if (this.isConnected) {
            throw new Error('Already connected to a session');
        }

        if (!sessionId) {
            throw new Error('Session ID is required');
        }

        const joinOptions = {
            password: options.password || null,
            userName: options.userName || this.userName
        };

        try {
            this.sessionId = sessionId;
            this.userName = joinOptions.userName;

            // Join session via signaling server
            const response = await this._sendSignalingMessage({
                type: 'join_session',
                sessionId: this.sessionId,
                userId: this.userId,
                userName: this.userName,
                password: joinOptions.password
            });

            if (!response.success) {
                throw new Error(response.error || 'Failed to join session');
            }

            this.isConnected = true;
            this.role = response.role || 'viewer';
            this.isHost = false;

            // Connect to existing peers
            if (response.peers && response.peers.length > 0) {
                await this._connectToPeers(response.peers);
            }

            // Sync initial state
            if (response.initialState) {
                this._applyInitialState(response.initialState);
            }

            console.log(`[CollaborationManager] Joined session: ${this.sessionId}`);
            this._emit('sessionJoined', {
                sessionId: this.sessionId,
                role: this.role,
                peerCount: response.peers?.length || 0
            });

            return {
                sessionId: this.sessionId,
                userId: this.userId,
                role: this.role,
                peerCount: response.peers?.length || 0
            };
        } catch (error) {
            console.error('[CollaborationManager] Failed to join session:', error);
            throw error;
        }
    }

    /**
     * Leave the current session
     * @returns {Promise<void>}
     */
    async leaveSession() {
        if (!this.isConnected) {
            return;
        }

        try {
            // Notify signaling server
            await this._sendSignalingMessage({
                type: 'leave_session',
                sessionId: this.sessionId,
                userId: this.userId
            });

            // Close all peer connections
            for (const [peerId, peer] of this.peers) {
                if (peer.connection) {
                    peer.connection.close();
                }
            }
            this.peers.clear();

            // Stop recording if active
            if (this.isRecording) {
                this.stopRecording();
            }

            // Stop playback
            if (this.isPlayingBack) {
                this.stopPlayback();
            }

            // Clear state
            this.isConnected = false;
            this.isHost = false;
            this.sessionId = null;
            this.role = 'viewer';
            this.presence.clear();

            // Stop heartbeat
            if (this.heartbeatTimer) {
                clearInterval(this.heartbeatTimer);
                this.heartbeatTimer = null;
            }

            console.log('[CollaborationManager] Left session');
            this._emit('sessionLeft', { userId: this.userId });
        } catch (error) {
            console.error('[CollaborationManager] Error leaving session:', error);
        }
    }

    /**
     * Share state with other participants
     * @param {string} key - State key
     * @param {any} value - State value
     * @param {Object} options - Options
     * @returns {boolean} True if state was shared
     */
    share(key, value, options = {}) {
        if (!this.isConnected) {
            console.warn('[CollaborationManager] Not connected to a session');
            return false;
        }

        // Check permissions
        if (!this._canEdit()) {
            console.warn('[CollaborationManager] Insufficient permissions to share state');
            return false;
        }

        try {
            // Create operation for CRDT
            const operation = {
                id: this._generateOperationId(),
                type: 'set',
                key: key,
                value: value,
                userId: this.userId,
                timestamp: Date.now(),
                vectorClock: this._getVectorClock()
            };

            // Apply locally
            this._applyOperation(operation);

            // Broadcast to peers
            this._broadcastToPeers({
                type: 'state_update',
                operation: operation
            });

            // Record if recording
            if (this.isRecording) {
                this._recordOperation(operation);
            }

            this._emit('stateShared', {
                key: key,
                value: value,
                operationId: operation.id
            });

            return true;
        } catch (error) {
            console.error('[CollaborationManager] Error sharing state:', error);
            return false;
        }
    }

    /**
     * Get shared state value
     * @param {string} key - State key
     * @returns {any} State value or undefined
     */
    getState(key) {
        return this.sharedState.get(key);
    }

    /**
     * Get all shared state
     * @returns {Object} All shared state
     */
    getAllState() {
        return Object.fromEntries(this.sharedState);
    }

    /**
     * Update user presence
     * @param {Object} presence - Presence data
     * @param {number} presence.x - X coordinate
     * @param {number} presence.y - Y coordinate
     * @param {boolean} presence.cursorVisible - Cursor visibility
     */
    updatePresence(presence) {
        this.localCursor = {
            x: presence.x || 0,
            y: presence.y || 0,
            visible: presence.cursorVisible !== false,
            timestamp: Date.now()
        };

        // Broadcast presence update
        this._broadcastToPeers({
            type: 'presence_update',
            userId: this.userId,
            presence: this.localCursor
        });
    }

    /**
     * Get presence of all users
     * @returns {Map} User presence map
     */
    getPresence() {
        return new Map(this.presence);
    }

    /**
     * Change user role (admin only)
     * @param {string} targetUserId - User ID to change role for
     * @param {string} newRole - New role ('viewer', 'editor', 'admin')
     * @returns {Promise<boolean>} True if role was changed
     */
    async changeUserRole(targetUserId, newRole) {
        if (!this._canManageUsers()) {
            console.warn('[CollaborationManager] Insufficient permissions to change roles');
            return false;
        }

        if (!this.rolePermissions[newRole]) {
            console.warn('[CollaborationManager] Invalid role:', newRole);
            return false;
        }

        try {
            // Broadcast role change
            this._broadcastToPeers({
                type: 'role_change',
                sourceUserId: this.userId,
                targetUserId: targetUserId,
                newRole: newRole
            });

            // Update local peer if present
            const peer = this.peers.get(targetUserId);
            if (peer) {
                peer.role = newRole;
            }

            this._emit('roleChanged', {
                targetUserId: targetUserId,
                newRole: newRole
            });

            return true;
        } catch (error) {
            console.error('[CollaborationManager] Error changing role:', error);
            return false;
        }
    }

    /**
     * Kick user from session (admin only)
     * @param {string} targetUserId - User ID to kick
     * @returns {Promise<boolean>} True if user was kicked
     */
    async kickUser(targetUserId) {
        if (!this._canManageUsers()) {
            console.warn('[CollaborationManager] Insufficient permissions to kick users');
            return false;
        }

        try {
            // Broadcast kick
            this._broadcastToPeers({
                type: 'user_kicked',
                sourceUserId: this.userId,
                targetUserId: targetUserId
            });

            // Close peer connection
            const peer = this.peers.get(targetUserId);
            if (peer && peer.connection) {
                peer.connection.close();
            }
            this.peers.delete(targetUserId);
            this.presence.delete(targetUserId);

            this._emit('userKicked', { targetUserId: targetUserId });

            return true;
        } catch (error) {
            console.error('[CollaborationManager] Error kicking user:', error);
            return false;
        }
    }

    /**
     * Start recording session
     * @param {Object} options - Recording options
     * @returns {boolean} True if recording started
     */
    startRecording(options = {}) {
        if (this.isRecording) {
            console.warn('[CollaborationManager] Already recording');
            return false;
        }

        this.isRecording = true;
        this.recordingBuffer = [{
            type: 'recording_start',
            timestamp: Date.now(),
            sessionId: this.sessionId,
            userId: this.userId
        }];

        this._emit('recordingStarted', {
            startTime: Date.now()
        });

        console.log('[CollaborationManager] Recording started');
        return true;
    }

    /**
     * Stop recording session
     * @returns {Array} Recording buffer
     */
    stopRecording() {
        if (!this.isRecording) {
            return [];
        }

        this.isRecording = false;

        const recording = [...this.recordingBuffer];
        this.recordingBuffer = [];

        this._emit('recordingStopped', {
            recording: recording,
            duration: Date.now() - recording[0].timestamp
        });

        console.log('[CollaborationManager] Recording stopped');
        return recording;
    }

    /**
     * Play back recorded session
     * @param {Array} recording - Recording buffer to play
     * @param {Object} options - Playback options
     * @returns {boolean} True if playback started
     */
    startPlayback(recording, options = {}) {
        if (this.isPlayingBack) {
            console.warn('[CollaborationManager] Already playing back');
            return false;
        }

        if (!recording || recording.length === 0) {
            console.warn('[CollaborationManager] No recording to play');
            return false;
        }

        this.isPlayingBack = true;
        this.playbackIndex = 0;

        const playbackSpeed = options.speed || 1;
        const startTime = recording[0].timestamp;

        const playNext = () => {
            if (!this.isPlayingBack || this.playbackIndex >= recording.length) {
                this.isPlayingBack = false;
                this._emit('playbackComplete', {
                    totalEvents: recording.length
                });
                return;
            }

            const event = recording[this.playbackIndex];
            const delay = (event.timestamp - startTime) / playbackSpeed;

            setTimeout(() => {
                this._applyPlaybackEvent(event);
                this.playbackIndex++;
                playNext();
            }, delay);
        };

        playNext();

        this._emit('playbackStarted', {
            eventCount: recording.length,
            speed: playbackSpeed
        });

        console.log('[CollaborationManager] Playback started');
        return true;
    }

    /**
     * Stop playback
     */
    stopPlayback() {
        this.isPlayingBack = false;
        this._emit('playbackStopped', {});
        console.log('[CollaborationManager] Playback stopped');
    }

    /**
     * Get session info
     * @returns {Object} Session information
     */
    getSessionInfo() {
        return {
            sessionId: this.sessionId,
            userId: this.userId,
            userName: this.userName,
            role: this.role,
            isConnected: this.isConnected,
            isHost: this.isHost,
            peerCount: this.peers.size,
            isRecording: this.isRecording,
            isPlayingBack: this.isPlayingBack
        };
    }

    /**
     * Get list of connected peers
     * @returns {Array} Array of peer info
     */
    getPeers() {
        const peers = [];

        for (const [peerId, peer] of this.peers) {
            peers.push({
                userId: peerId,
                userName: peer.userName,
                role: peer.role,
                isConnected: peer.connection?.connectionState === 'connected'
            });
        }

        return peers;
    }

    /**
     * Add event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function
     */
    on(event, callback) {
        if (!this.listeners.has(event)) {
            this.listeners.set(event, []);
        }
        this.listeners.get(event).push(callback);
    }

    /**
     * Remove event listener
     * @param {string} event - Event name
     * @param {Function} callback - Callback function
     */
    off(event, callback) {
        if (this.listeners.has(event)) {
            const listeners = this.listeners.get(event);
            const index = listeners.indexOf(callback);
            if (index > -1) {
                listeners.splice(index, 1);
            }
        }
    }

    /**
     * Destroy the collaboration manager
     * @returns {Promise<void>}
     */
    async destroy() {
        // Leave session
        await this.leaveSession();

        // Close signaling socket
        if (this.signalingSocket) {
            this.signalingSocket.close();
        }

        // Clear listeners
        this.listeners.clear();

        // Clear state
        this.sharedState.clear();
        this.presence.clear();
        this.peers.clear();

        console.log('[CollaborationManager] Destroyed');
    }

    // Private methods

    /**
     * Connect to signaling server
     * @private
     */
    async _connectToSignalingServer() {
        return new Promise((resolve, reject) => {
            try {
                this.signalingSocket = new WebSocket(this.options.signalingServer);

                this.signalingSocket.onopen = () => {
                    console.log('[CollaborationManager] Connected to signaling server');
                    resolve();
                };

                this.signalingSocket.onerror = (error) => {
                    console.error('[CollaborationManager] Signaling socket error:', error);
                    reject(error);
                };

                this.signalingSocket.onmessage = (event) => {
                    this._handleSignalingMessage(JSON.parse(event.data));
                };

                this.signalingSocket.onclose = () => {
                    console.log('[CollaborationManager] Signaling connection closed');
                    this._handleDisconnection();
                };

                // Set timeout
                setTimeout(() => {
                    if (this.signalingSocket.readyState !== WebSocket.OPEN) {
                        reject(new Error('Signaling connection timeout'));
                    }
                }, 10000);
            } catch (error) {
                reject(error);
            }
        });
    }

    /**
     * Handle signaling server message
     * @private
     */
    _handleSignalingMessage(message) {
        switch (message.type) {
            case 'peer_joined':
                this._handlePeerJoined(message);
                break;
            case 'peer_left':
                this._handlePeerLeft(message);
                break;
            case 'offer':
            case 'answer':
            case 'ice_candidate':
                this._handleWebRTCSignal(message);
                break;
            case 'role_changed':
                this._handleRoleChanged(message);
                break;
            case 'kicked':
                this._handleKicked(message);
                break;
            default:
                console.warn('[CollaborationManager] Unknown message type:', message.type);
        }
    }

    /**
     * Handle peer joined event
     * @private
     */
    async _handlePeerJoined(message) {
        console.log('[CollaborationManager] Peer joined:', message.userId);

        // Create peer connection
        await this._createPeerConnection(message.userId, message.userName, message.role);

        this._emit('peerJoined', {
            userId: message.userId,
            userName: message.userName,
            role: message.role
        });
    }

    /**
     * Handle peer left event
     * @private
     */
    _handlePeerLeft(message) {
        console.log('[CollaborationManager] Peer left:', message.userId);

        const peer = this.peers.get(message.userId);
        if (peer && peer.connection) {
            peer.connection.close();
        }
        this.peers.delete(message.userId);
        this.presence.delete(message.userId);

        this._emit('peerLeft', {
            userId: message.userId
        });
    }

    /**
     * Handle WebRTC signal (offer/answer/ICE)
     * @private
     */
    async _handleWebRTCSignal(message) {
        const peer = this.peers.get(message.senderId);

        if (!peer) {
            console.warn('[CollaborationManager] Received signal for unknown peer:', message.senderId);
            return;
        }

        switch (message.type) {
            case 'offer':
                await peer.connection.setRemoteDescription(new RTCSessionDescription(message.offer));
                const answer = await peer.connection.createAnswer();
                await peer.connection.setLocalDescription(answer);

                this._sendSignalingMessage({
                    type: 'answer',
                    answer: answer,
                    targetId: message.senderId,
                    senderId: this.userId
                });
                break;

            case 'answer':
                await peer.connection.setRemoteDescription(new RTCSessionDescription(message.answer));
                break;

            case 'ice_candidate':
                if (peer.connection.remoteDescription) {
                    await peer.connection.addIceCandidate(new RTCIceCandidate(message.candidate));
                }
                break;
        }
    }

    /**
     * Handle role change event
     * @private
     */
    _handleRoleChanged(message) {
        if (message.targetUserId === this.userId) {
            this.role = message.newRole;
            console.log('[CollaborationManager] Role changed to:', this.role);

            this._emit('roleChanged', {
                newRole: message.newRole
            });
        }
    }

    /**
     * Handle kicked event
     * @private
     */
    _handleKicked(message) {
        console.log('[CollaborationManager] Kicked from session');
        this.leaveSession();

        this._emit('kicked', {
            reason: message.reason || 'Kicked by host'
        });
    }

    /**
     * Create peer connection
     * @private
     */
    async _createPeerConnection(peerId, peerName, peerRole) {
        const config = this.options.peerConfig || {
            iceServers: [
                { urls: 'stun:stun.l.google.com:19302' }
            ]
        };

        const connection = new RTCPeerConnection(config);

        // Create data channel for host
        let dataChannel;
        if (this.isHost) {
            dataChannel = connection.createDataChannel('collaboration', {
                ordered: false
            });

            this._setupDataChannel(dataChannel, peerId);
        }

        // Handle ICE candidates
        connection.onicecandidate = (event) => {
            if (event.candidate) {
                this._sendSignalingMessage({
                    type: 'ice_candidate',
                    candidate: event.candidate,
                    targetId: peerId,
                    senderId: this.userId
                });
            }
        };

        // Handle incoming data channel (for non-host)
        connection.ondatachannel = (event) => {
            this._setupDataChannel(event.channel, peerId);
        };

        // Store peer info
        this.peers.set(peerId, {
            connection: connection,
            dataChannel: dataChannel,
            role: peerRole || 'viewer',
            userName: peerName || `Peer_${peerId.slice(0, 6)}`
        });

        // Create offer if host
        if (this.isHost) {
            const offer = await connection.createOffer();
            await connection.setLocalDescription(offer);

            this._sendSignalingMessage({
                type: 'offer',
                offer: offer,
                targetId: peerId,
                senderId: this.userId
            });
        }
    }

    /**
     * Setup data channel event handlers
     * @private
     */
    _setupDataChannel(channel, peerId) {
        channel.onopen = () => {
            console.log('[CollaborationManager] Data channel opened:', peerId);
        };

        channel.onmessage = (event) => {
            this._handlePeerMessage(peerId, JSON.parse(event.data));
        };

        channel.onclose = () => {
            console.log('[CollaborationManager] Data channel closed:', peerId);
        };

        // Update peer with data channel reference
        const peer = this.peers.get(peerId);
        if (peer) {
            peer.dataChannel = channel;
        }
    }

    /**
     * Handle message from peer
     * @private
     */
    _handlePeerMessage(peerId, message) {
        switch (message.type) {
            case 'state_update':
                this._handleStateUpdate(peerId, message.operation);
                break;
            case 'presence_update':
                this._handlePresenceUpdate(peerId, message.presence);
                break;
            case 'cursor_move':
                this._handleCursorMove(peerId, message.cursor);
                break;
            default:
                console.warn('[CollaborationManager] Unknown peer message type:', message.type);
        }
    }

    /**
     * Handle state update from peer
     * @private
     */
    _handleStateUpdate(peerId, operation) {
        // Apply operation with conflict resolution
        this._applyOperation(operation);

        this._emit('stateChanged', {
            key: operation.key,
            value: operation.value,
            userId: peerId,
            operationId: operation.id
        });
    }

    /**
     * Handle presence update from peer
     * @private
     */
    _handlePresenceUpdate(peerId, presence) {
        this.presence.set(peerId, presence);

        this._emit('presenceChanged', {
            userId: peerId,
            presence: presence
        });
    }

    /**
     * Handle cursor move from peer
     * @private
     */
    _handleCursorMove(peerId, cursor) {
        const peer = this.peers.get(peerId);
        if (!peer) return;

        this.presence.set(peerId, {
            ...this.presence.get(peerId),
            x: cursor.x,
            y: cursor.y,
            visible: true,
            timestamp: Date.now()
        });

        this._emit('cursorMoved', {
            userId: peerId,
            userName: peer.userName,
            cursor: cursor
        });
    }

    /**
     * Connect to existing peers
     * @private
     */
    async _connectToPeers(peers) {
        for (const peer of peers) {
            await this._createPeerConnection(peer.userId, peer.userName, peer.role);
        }
    }

    /**
     * Send message via signaling server
     * @private
     */
    async _sendSignalingMessage(message) {
        return new Promise((resolve, reject) => {
            if (!this.signalingSocket || this.signalingSocket.readyState !== WebSocket.OPEN) {
                reject(new Error('Signaling socket not connected'));
                return;
            }

            try {
                this.signalingSocket.send(JSON.stringify(message));
                resolve({ success: true });
            } catch (error) {
                reject(error);
            }
        });
    }

    /**
     * Broadcast message to all peers
     * @private
     */
    _broadcastToPeers(message) {
        for (const [peerId, peer] of this.peers) {
            if (peer.dataChannel && peer.dataChannel.readyState === 'open') {
                try {
                    peer.dataChannel.send(JSON.stringify(message));
                } catch (error) {
                    console.error(`[CollaborationManager] Error sending to peer ${peerId}:`, error);
                }
            }
        }
    }

    /**
     * Apply operation to shared state with conflict resolution
     * @private
     */
    _applyOperation(operation) {
        // Resolve conflicts using operational transformation
        const conflict = this._detectConflict(operation);

        if (conflict) {
            const resolved = this._resolveConflict(operation, conflict);
            operation = resolved.operation;
        }

        // Apply operation
        this.sharedState.set(operation.key, operation.value);

        // Update vector clock
        this._updateVectorClock(operation.userId);

        // Add to history
        this.stateHistory.push(operation);

        // Limit history size
        if (this.stateHistory.length > 1000) {
            this.stateHistory = this.stateHistory.slice(-1000);
        }
    }

    /**
     * Detect conflicting operations
     * @private
     */
    _detectConflict(operation) {
        const lastOp = this.stateHistory
            .filter(op => op.key === operation.key)
            .pop();

        if (!lastOp) return null;

        // Check if operations are concurrent (based on vector clock)
        const isConcurrent = !this._happenedBefore(lastOp, operation) &&
                           !this._happenedBefore(operation, lastOp);

        if (isConcurrent) {
            return { operation: lastOp };
        }

        return null;
    }

    /**
     * Resolve conflict using operational transformation
     * @private
     */
    _resolveConflict(newOp, conflict) {
        // Last-write-wins for simple types
        // Could be enhanced with application-specific conflict resolution

        let resolvedValue = newOp.value;
        let resolution = 'last_write_wins';

        // Application-specific conflict resolution
        if (newOp.key === 'filter' && typeof newOp.value === 'object') {
            // Merge filter configurations
            resolvedValue = this._mergeFilters(newOp.value, conflict.operation.value);
            resolution = 'merged';
        }

        return {
            operation: {
                ...newOp,
                value: resolvedValue,
                resolved: true,
                resolution: resolution
            }
        };
    }

    /**
     * Merge filter configurations
     * @private
     */
    _mergeFilters(filter1, filter2) {
        return {
            layerIds: [...new Set([...(filter1.layerIds || []), ...(filter2.layerIds || [])])],
            minIntensity: Math.max(filter1.minIntensity || 0, filter2.minIntensity || 0),
            maxIntensity: Math.min(filter1.maxIntensity || 1, filter2.maxIntensity || 1),
            modes: [...new Set([...(filter1.modes || []), ...(filter2.modes || [])])]
        };
    }

    /**
     * Check if operation1 happened before operation2
     * @private
     */
    _happenedBefore(op1, op2) {
        return op1.timestamp < op2.timestamp;
    }

    /**
     * Get vector clock for operation
     * @private
     */
    _getVectorClock() {
        return {
            [this.userId]: Date.now()
        };
    }

    /**
     * Update vector clock
     * @private
     */
    _updateVectorClock(userId) {
        // Simplified vector clock implementation
        // Full implementation would track counters per user
    }

    /**
     * Initialize shared state
     * @private
     */
    _initializeSharedState() {
        this.sharedState.set('version', 1);
        this.sharedState.set('createdAt', Date.now());
        this.sharedState.set('createdBy', this.userId);
    }

    /**
     * Apply initial state from host
     * @private
     */
    _applyInitialState(state) {
        for (const [key, value] of Object.entries(state)) {
            this.sharedState.set(key, value);
        }
    }

    /**
     * Setup WebRTC peer configuration
     * @private
     */
    _setupPeerConfiguration() {
        this.options.peerConfig = this.options.peerConfig || {
            iceServers: [
                { urls: 'stun:stun.l.google.com:19302' },
                { urls: 'stun:stun1.l.google.com:19302' }
            ]
        };
    }

    /**
     * Start heartbeat
     * @private
     */
    _startHeartbeat() {
        this.heartbeatTimer = setInterval(() => {
            if (this.isConnected) {
                this._sendSignalingMessage({
                    type: 'heartbeat',
                    sessionId: this.sessionId,
                    userId: this.userId
                });
            }
        }, this.options.heartbeatInterval);
    }

    /**
     * Handle disconnection
     * @private
     */
    async _handleDisconnection() {
        this.isConnected = false;

        if (this.options.autoReconnect && this.reconnectAttempts < this.options.maxReconnectAttempts) {
            this.reconnectAttempts++;
            console.log(`[CollaborationManager] Attempting to reconnect (${this.reconnectAttempts}/${this.options.maxReconnectAttempts})`);

            setTimeout(async () => {
                try {
                    await this._connectToSignalingServer();

                    if (this.sessionId) {
                        await this.joinSession(this.sessionId);
                    }
                } catch (error) {
                    console.error('[CollaborationManager] Reconnection failed:', error);
                }
            }, this.options.reconnectInterval);
        } else {
            this._emit('disconnected', {
                sessionId: this.sessionId
            });
        }
    }

    /**
     * Record operation
     * @private
     */
    _recordOperation(operation) {
        this.recordingBuffer.push({
            type: 'operation',
            timestamp: Date.now(),
            operation: operation
        });
    }

    /**
     * Apply playback event
     * @private
     */
    _applyPlaybackEvent(event) {
        switch (event.type) {
            case 'recording_start':
                console.log('[CollaborationManager] Playback: Recording started');
                break;
            case 'operation':
                this._applyOperation(event.operation);
                this._emit('playbackEvent', {
                    event: event
                });
                break;
        }
    }

    /**
     * Load saved state from localStorage
     * @private
     */
    _loadSavedState() {
        try {
            const saved = localStorage.getItem(this.options.storageKey);
            if (saved) {
                const data = JSON.parse(saved);
                this.userName = data.userName || this.userName;
            }
        } catch (error) {
            console.warn('[CollaborationManager] Failed to load saved state:', error);
        }
    }

    /**
     * Generate unique user ID
     * @private
     */
    _generateUserId() {
        return 'user_' + Date.now().toString(36) + '_' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Generate unique session ID
     * @private
     */
    _generateSessionId() {
        return 'session_' + Date.now().toString(36) + '_' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Generate unique operation ID
     * @private
     */
    _generateOperationId() {
        return 'op_' + Date.now().toString(36) + '_' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Get join URL
     * @private
     */
    _getJoinUrl() {
        const url = new URL(window.location.href);
        url.searchParams.set('session', this.sessionId);
        return url.toString();
    }

    /**
     * Check if user can edit
     * @private
     */
    _canEdit() {
        return this.rolePermissions[this.role]?.canEdit || false;
    }

    /**
     * Check if user can manage users
     * @private
     */
    _canManageUsers() {
        return this.rolePermissions[this.role]?.canManageUsers || false;
    }

    /**
     * Emit event to listeners
     * @private
     */
    _emit(event, data) {
        const listeners = this.listeners.get(event);
        if (listeners) {
            listeners.forEach(callback => {
                try {
                    callback(data);
                } catch (error) {
                    console.error(`[CollaborationManager] Error in ${event} listener:`, error);
                }
            });
        }

        // Also dispatch DOM event
        if (typeof window !== 'undefined') {
            window.dispatchEvent(new CustomEvent(`collaboration:${event}`, {
                detail: data
            }));
        }
    }
}

// Global collaboration manager instance
if (typeof window !== 'undefined') {
    window.CollaborationManager = CollaborationManager;
}

// Export for module environments
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { CollaborationManager };
}
