/**
 * Geometry OS: LLM Chat Panel
 *
 * Provides a chat interface for interacting with Pixel LLM tiles on the infinite map.
 * Connects to LM Studio's chat completions API at http://localhost:1234/v1/chat/completions
 */

// ============================================================
// INFERENCE EVENT EMITTER
// Event emitter for inference tracking
// ============================================================

class InferenceEventEmitter {
    constructor() {
        this.listeners = new Map(); // eventName -> Set of callbacks
    }

    on(eventName, callback) {
        if (!this.listeners.has(eventName)) {
            this.listeners.set(eventName, new Set());
        }
        this.listeners.get(eventName).add(callback);
    }

    off(eventName, callback) {
        const callbacks = this.listeners.get(eventName);
        if (callbacks) {
            callbacks.delete(callback);
        }
    }

    emit(eventName, data) {
        const callbacks = this.listeners.get(eventName);
        if (callbacks) {
            callbacks.forEach(cb => {
                try {
                    cb(data);
                } catch (e) {
                    console.error(`[InferenceEventEmitter] Error in ${eventName} handler:`, e);
                }
            });
        }
    }

    clear() {
        this.listeners.clear();
    }
}

// Singleton instance for global inference event tracking
const inferenceEvents = new InferenceEventEmitter();

class LLMChatPanel {
    constructor(config = {}) {
        this.config = {
            apiUrl: 'http://localhost:1234/v1/chat/completions',
            defaultModel: 'tinyllama',
            maxHistory: 20,
            ...config
        };

        // Model registry - maps tile names to model names
        this.modelRegistry = {
            'tinyllama.rts.png': 'tinyllama',
            'qwen_coder.rts.png': 'qwen-coder',
            'test_model.rts.png': 'test-model'
        };

        // Chat state
        this.currentModel = null;
        this.currentTile = null;
        this.chatHistory = [];
        this.isOpen = false;
        this.isTyping = false;

        // UI elements
        this.panel = null;
        this.messagesContainer = null;
        this.inputField = null;
        this.sendButton = null;
        this.modelLabel = null;

        console.log('💬 LLMChatPanel initialized');
    }

    /**
     * Open the chat panel for a specific LLM tile
     */
    open(tileName, tileX, tileY) {
        this.currentTile = { name: tileName, x: tileX, y: tileY };
        this.currentModel = this.modelRegistry[tileName] || this.config.defaultModel;

        if (!this.panel) {
            this.createPanel();
        }

        this.updateModelLabel();
        this.panel.style.display = 'flex';
        this.isOpen = true;
        this.inputField.focus();

        console.log(`💬 Chat opened for ${tileName} (${tileX}, ${tileY}) using model: ${this.currentModel}`);
    }

    /**
     * Close the chat panel
     */
    close() {
        if (this.panel) {
            this.panel.style.display = 'none';
        }
        this.isOpen = false;
        this.currentTile = null;
        console.log('💬 Chat closed');
    }

    /**
     * Create the chat panel UI
     */
    createPanel() {
        // Create panel container
        this.panel = document.createElement('div');
        this.panel.id = 'llm-chat-panel';
        this.panel.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            width: 400px;
            height: 600px;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border: 2px solid #00ffff;
            border-radius: 12px;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.3);
            display: none;
            flex-direction: column;
            z-index: 10000;
            font-family: 'Courier New', monospace;
            overflow: hidden;
        `;

        // Create header
        const header = document.createElement('div');
        header.style.cssText = `
            padding: 15px;
            background: rgba(0, 255, 255, 0.1);
            border-bottom: 1px solid #00ffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        `;

        this.modelLabel = document.createElement('div');
        this.modelLabel.id = 'chat-model-label';
        this.modelLabel.style.cssText = `
            color: #00ffff;
            font-size: 14px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 8px;
        `;

        const closeButton = document.createElement('button');
        closeButton.innerHTML = '×';
        closeButton.style.cssText = `
            background: none;
            border: none;
            color: #00ffff;
            font-size: 24px;
            cursor: pointer;
            padding: 0;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        `;
        closeButton.onclick = () => this.close();

        header.appendChild(this.modelLabel);
        header.appendChild(closeButton);

        // Create messages container
        this.messagesContainer = document.createElement('div');
        this.messagesContainer.id = 'chat-messages';
        this.messagesContainer.style.cssText = `
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 10px;
        `;

        // Custom scrollbar
        const style = document.createElement('style');
        style.textContent = `
            #chat-messages::-webkit-scrollbar {
                width: 8px;
            }
            #chat-messages::-webkit-scrollbar-track {
                background: rgba(0, 0, 0, 0.3);
            }
            #chat-messages::-webkit-scrollbar-thumb {
                background: #00ffff;
                border-radius: 4px;
            }
        `;
        document.head.appendChild(style);

        // Create input area
        const inputArea = document.createElement('div');
        inputArea.style.cssText = `
            padding: 15px;
            background: rgba(0, 0, 0, 0.3);
            border-top: 1px solid #00ffff;
            display: flex;
            gap: 10px;
        `;

        this.inputField = document.createElement('input');
        this.inputField.type = 'text';
        this.inputField.placeholder = 'Type a message...';
        this.inputField.style.cssText = `
            flex: 1;
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid #00ffff;
            border-radius: 6px;
            padding: 10px 15px;
            color: #ffffff;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            outline: none;
        `;
        this.inputField.onkeypress = (e) => {
            if (e.key === 'Enter') {
                this.sendMessage();
            }
        };

        this.sendButton = document.createElement('button');
        this.sendButton.innerHTML = 'Send';
        this.sendButton.style.cssText = `
            background: #00ffff;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            color: #000000;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
        `;
        this.sendButton.onmouseover = () => {
            this.sendButton.style.background = '#00cccc';
        };
        this.sendButton.onmouseout = () => {
            this.sendButton.style.background = '#00ffff';
        };
        this.sendButton.onclick = () => this.sendMessage();

        inputArea.appendChild(this.inputField);
        inputArea.appendChild(this.sendButton);

        // Assemble panel
        this.panel.appendChild(header);
        this.panel.appendChild(this.messagesContainer);
        this.panel.appendChild(inputArea);

        // Add to document
        document.body.appendChild(this.panel);

        // Add welcome message
        this.addMessage('system', `Connected to ${this.currentModel}. Type a message to start chatting!`);
    }

    /**
     * Update the model label in the header
     */
    updateModelLabel() {
        if (this.modelLabel) {
            const icon = '🤖';
            this.modelLabel.innerHTML = `
                <span>${icon}</span>
                <span>${this.currentModel.toUpperCase()}</span>
                <span style="font-size: 11px; opacity: 0.7; margin-left: 5px;">
                    (${this.currentTile.x}, ${this.currentTile.y})
                </span>
            `;
        }
    }

    /**
     * Add a message to the chat
     */
    addMessage(role, content) {
        const messageDiv = document.createElement('div');
        messageDiv.style.cssText = `
            max-width: 85%;
            padding: 10px 14px;
            border-radius: 12px;
            word-wrap: break-word;
            animation: fadeIn 0.3s ease-in;
        `;

        if (role === 'user') {
            messageDiv.style.cssText += `
                align-self: flex-end;
                background: linear-gradient(135deg, #00ffff 0%, #00cccc 100%);
                color: #000000;
                border-bottom-right-radius: 4px;
            `;
        } else if (role === 'assistant') {
            messageDiv.style.cssText += `
                align-self: flex-start;
                background: rgba(255, 255, 255, 0.1);
                color: #ffffff;
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-bottom-left-radius: 4px;
            `;
        } else {
            messageDiv.style.cssText += `
                align-self: center;
                background: rgba(0, 255, 255, 0.1);
                color: #00ffff;
                font-size: 12px;
                text-align: center;
                border: 1px dashed rgba(0, 255, 255, 0.3);
            `;
        }

        messageDiv.textContent = content;
        this.messagesContainer.appendChild(messageDiv);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;

        // Add to history
        this.chatHistory.push({ role, content });
        if (this.chatHistory.length > this.config.maxHistory) {
            this.chatHistory.shift();
        }
    }

    /**
     * Send a message to the LLM
     */
    async sendMessage() {
        const content = this.inputField.value.trim();
        if (!content || this.isTyping) {
            return;
        }

        // Add user message
        this.addMessage('user', content);
        this.inputField.value = '';
        this.isTyping = true;

        // Show typing indicator
        const typingIndicator = this.showTypingIndicator();

        const inferenceStartTime = performance.now();

        // Emit inference start event (Phase 1: Real Data Integration)
        inferenceEvents.emit('inference:start', {
            model: this.currentModel,
            tile: this.currentTile,
            timestamp: inferenceStartTime
        });

        try {
            // Prepare messages for API
            const messages = [
                { role: 'system', content: `You are ${this.currentModel}, an AI assistant. Respond concisely and helpfully.` },
                ...this.chatHistory.filter(m => m.role !== 'system')
            ];

            // Call LM Studio API
            const response = await fetch(this.config.apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    model: this.currentModel,
                    messages: messages,
                    temperature: 0.7,
                    max_tokens: 500
                })
            });

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();
            const assistantMessage = data.choices[0]?.message?.content || 'No response from model.';
            const inferenceEndTime = performance.now();

            // Emit inference complete event
            inferenceEvents.emit('inference:complete', {
                model: this.currentModel,
                tile: this.currentTile,
                timestamp: inferenceEndTime,
                duration: inferenceEndTime - inferenceStartTime,
                tokens: data.usage?.total_tokens || 0
            });

            // Emit simulated layer activations for visualization
            inferenceEvents.emit('inference:layer', {
                model: this.currentModel,
                layer: 'tok_embeddings',
                position: { x: this.currentTile?.x || 50, y: this.currentTile?.y || 50 },
                intensity: 0.8,
                timestamp: inferenceEndTime
            });

            inferenceEvents.emit('inference:layer', {
                model: this.currentModel,
                layer: 'output',
                position: { x: this.currentTile?.x || 50, y: this.currentTile?.y || 50 },
                intensity: 0.6,
                timestamp: inferenceEndTime + 50
            });

            // Remove typing indicator
            this.hideTypingIndicator(typingIndicator);

            // Add assistant response
            this.addMessage('assistant', assistantMessage);

        } catch (error) {
            // Remove typing indicator
            this.hideTypingIndicator(typingIndicator);

            // Show error message
            console.error('LLM API Error:', error);
            this.addMessage('system', `Error: ${error.message}. Make sure LM Studio is running at ${this.config.apiUrl}`);
        }

        this.isTyping = false;
    }

    /**
     * Show a typing indicator
     */
    showTypingIndicator() {
        const indicator = document.createElement('div');
        indicator.className = 'typing-indicator';
        indicator.style.cssText = `
            align-self: flex-start;
            background: rgba(255, 255, 255, 0.1);
            color: #00ffff;
            padding: 10px 14px;
            border-radius: 12px;
            border-bottom-left-radius: 4px;
            display: flex;
            gap: 4px;
            align-items: center;
        `;

        for (let i = 0; i < 3; i++) {
            const dot = document.createElement('span');
            dot.style.cssText = `
                width: 8px;
                height: 8px;
                background: #00ffff;
                border-radius: 50%;
                animation: typingBounce 1.4s infinite ease-in-out;
                animation-delay: ${i * 0.2}s;
            `;
            indicator.appendChild(dot);
        }

        this.messagesContainer.appendChild(indicator);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;

        // Add typing animation
        if (!document.getElementById('typing-animation-style')) {
            const style = document.createElement('style');
            style.id = 'typing-animation-style';
            style.textContent = `
                @keyframes typingBounce {
                    0%, 60%, 100% { transform: translateY(0); }
                    30% { transform: translateY(-4px); }
                }
                @keyframes fadeIn {
                    from { opacity: 0; transform: translateY(10px); }
                    to { opacity: 1; transform: translateY(0); }
                }
            `;
            document.head.appendChild(style);
        }

        return indicator;
    }

    /**
     * Hide the typing indicator
     */
    hideTypingIndicator(indicator) {
        if (indicator && indicator.parentNode) {
            indicator.parentNode.removeChild(indicator);
        }
    }

    /**
     * Clear chat history
     */
    clearHistory() {
        this.chatHistory = [];
        this.messagesContainer.innerHTML = '';
        if (this.currentModel) {
            this.addMessage('system', `Connected to ${this.currentModel}. Type a message to start chatting!`);
        }
    }

    /**
     * Check if a tile is an LLM tile
     */
    isLLMTile(tileName) {
        return tileName in this.modelRegistry || tileName.includes('.rts.png');
    }

    /**
     * Register a new model
     */
    registerModel(tileName, modelName) {
        this.modelRegistry[tileName] = modelName;
        console.log(`💬 Registered model: ${tileName} -> ${modelName}`);
    }
}

// Global export
window.LLMChatPanel = LLMChatPanel;
