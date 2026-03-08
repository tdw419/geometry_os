/**
 * ThoughtVisualizer - Real-time thought visualization on Hilbert curve.
 * 
 * Maps Sisyphus daemon thoughts to geometric patterns in the browser.
 */

class ThoughtVisualizer {
    constructor(canvasId, order = 8) {
        this.canvas = document.getElementById(canvasId);
        if (!this.canvas) {
            console.error(`Canvas element #${canvasId} not found.`);
            return;
        }
        this.ctx = this.canvas.getContext('2d');
        this.order = order;
        this.gridSize = 2 ** order;
        this.hilbert = new HilbertLUTBuilder(order);
        
        this.thoughts = []; // Active thoughts
        this.maxThoughts = 1000;
        this.thoughtLifespan = 5000; // ms
        
        this.ws = null;
        this.connected = false;
        
        // Semantic Color Palette (Matching Python)
        this.colors = {
            "task_start": "rgba(0, 255, 255, 1)",    // Cyan
            "task_complete": "rgba(0, 255, 0, 1)", // Green
            "task_failure": "rgba(255, 0, 0, 1)",  // Red
            "gvn": "rgba(255, 255, 0, 1)",           // Yellow
            "dna_synthesis": "rgba(255, 0, 255, 1)", // Magenta
            "heuristic": "rgba(128, 128, 255, 1)",     // Light Blue
            "checkpoint": "rgba(255, 128, 0, 1)",    // Orange
            "default": "rgba(200, 200, 200, 1)"        // Gray
        };
    }

    connect(url = "ws://localhost:3002/ws/v1/thoughts") {
        console.log(`Connecting to Thought Stream: ${url}`);
        this.ws = new WebSocket(url);
        
        this.ws.onopen = () => {
            this.connected = true;
            console.log("Connected to Glass Box Thought Stream.");
        };
        
        this.ws.onmessage = (event) => {
            try {
                const data = JSON.parse(event.data);
                if (data.msg_type === "Thought") {
                    this.addThought(data.payload);
                }
            } catch (e) {
                console.error("Failed to parse thought:", e);
            }
        };
        
        this.ws.onclose = () => {
            this.connected = false;
            console.log("Disconnected from Thought Stream. Reconnecting in 5s...");
            setTimeout(() => this.connect(url), 5000);
        };
    }

    addThought(thought) {
        const type = thought.type || "default";
        const content = thought.content || thought.task_name || "";
        
        // Calculate Hilbert coordinates
        // Using a hash of the content for stable position
        const hash = this._hashString(content);
        const index = hash % (this.gridSize * this.gridSize);
        const [x, y] = this.hilbert.indexToPixel(index);
        
        this.thoughts.push({
            type,
            content,
            x, y,
            startTime: Date.now(),
            color: this.colors[type] || this.colors["default"]
        });
        
        if (this.thoughts.length > this.maxThoughts) {
            this.thoughts.shift();
        }
    }

    _hashString(str) {
        let hash = 0;
        for (let i = 0; i < str.length; i++) {
            hash = ((hash << 5) - hash) + str.charCodeAt(i);
            hash |= 0; // Convert to 32bit integer
        }
        return Math.abs(hash);
    }

    render() {
        const now = Date.now();
        const { ctx, canvas, gridSize } = this;
        
        // Clear canvas
        ctx.fillStyle = "rgba(0, 0, 0, 0.1)"; // Slight trail effect
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        
        const scaleX = canvas.width / gridSize;
        const scaleY = canvas.height / gridSize;
        
        // Filter out expired thoughts
        this.thoughts = this.thoughts.filter(t => now - t.startTime < this.thoughtLifespan);
        
        // Draw active thoughts
        this.thoughts.forEach(t => {
            const age = now - t.startTime;
            const lifePercent = 1.0 - (age / this.thoughtLifespan);
            const pulse = 0.5 + 0.5 * Math.sin(now / 200);
            
            ctx.beginPath();
            ctx.arc(t.x * scaleX, t.y * scaleY, 3 + 5 * pulse * lifePercent, 0, Math.PI * 2);
            ctx.fillStyle = t.color.replace('1)', `${lifePercent})`);
            ctx.fill();
            
            // Add a glow effect for high-priority thoughts
            if (t.type === "task_failure" || t.type === "gvn") {
                ctx.shadowBlur = 10 * lifePercent;
                ctx.shadowColor = t.color;
            } else {
                ctx.shadowBlur = 0;
            }
        });
        
        requestAnimationFrame(() => this.render());
    }

    start() {
        this.connect();
        this.render();
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.ThoughtVisualizer = ThoughtVisualizer;
}
