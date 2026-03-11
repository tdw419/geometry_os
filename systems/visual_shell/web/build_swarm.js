/**
 * BuildSwarm Visualization Component
 * 
 * Renders the distributed build system as a hexagonal hive of worker nodes.
 * Each worker cell shows its state (idle, busy, error, complete) with
 * visual effects matching the design specification.
 */

class BuildSwarm {
    constructor(pixiApp, worldContainer) {
        this.app = pixiApp;
        this.world = worldContainer;

        // Configuration
        this.config = {
            hexRadius: 40,
            hexGap: 10,
            colors: {
                idle: 0x404040,
                idleGlow: 0x606060,
                compiling: 0x00ffff,
                compilingGlow: 0x0088ff,
                linking: 0xff00ff,
                linkingGlow: 0x8800ff,
                success: 0x00ff9d,
                successGlow: 0x00ff66,
                error: 0xff4444,
                errorGlow: 0xff0000
            },
            animationSpeed: 0.05
        };

        // State
        this.workers = new Map(); // worker_id -> worker data
        this.container = new PIXI.Container();
        this.container.x = 500;
        this.container.y = 300;
        this.world.addChild(this.container);

        // Animation
        this.time = 0;

        // Background
        this.createBackground();

        console.log('🔨 BuildSwarm initialized');
    }

    createBackground() {
        const bg = new PIXI.Graphics();
        bg.beginFill(0x0a0a0a, 0.8);
        bg.drawRoundedRect(-400, -300, 800, 600, 20);
        bg.endFill();

        // Border
        bg.lineStyle(2, 0x00ff9d, 0.3);
        bg.drawRoundedRect(-400, -300, 800, 600, 20);

        // Title
        const title = new PIXI.Text('BUILD SWARM', {
            fontSize: 20,
            fill: 0x00ff9d,
            fontWeight: 'bold',
            letterSpacing: 4
        });
        title.anchor.set(0.5, 0);
        title.x = 0;
        title.y = -280;
        bg.addChild(title);

        this.container.addChild(bg);
        this.background = bg;
    }

    updateSwarmStatus(swarmData) {
        if (!swarmData || !swarmData.workers) {
            return;
        }

        // Update or create workers
        swarmData.workers.forEach(workerData => {
            this.updateWorker(workerData);
        });

        // Update queue status
        this.updateQueueStatus(swarmData.queue_status);
    }

    updateWorker(workerData) {
        const workerId = workerData.worker_id;

        if (!this.workers.has(workerId)) {
            // Create new worker cell
            this.createWorkerCell(workerData);
        } else {
            // Update existing worker
            const worker = this.workers.get(workerId);
            worker.data = workerData;
            this.updateWorkerVisuals(worker);
        }
    }

    createWorkerCell(workerData) {
        const workerId = workerData.worker_id;

        // Calculate hexagonal position
        const pos = this.calculateHexPosition(workerId);

        // Create worker container
        const container = new PIXI.Container();
        container.x = pos.x;
        container.y = pos.y;

        // Create hexagon
        const hex = new PIXI.Graphics();
        this.drawHexagon(hex, 0, 0, this.config.hexRadius, this.config.colors.idle);
        container.addChild(hex);

        // Create glow effect
        const glow = new PIXI.Graphics();
        glow.alpha = 0;
        container.addChild(glow);

        // Create worker ID label
        const label = new PIXI.Text(`W${workerId}`, {
            fontSize: 14,
            fill: 0xffffff,
            fontWeight: 'bold'
        });
        label.anchor.set(0.5);
        container.addChild(label);

        // Create status indicator
        const statusDot = new PIXI.Graphics();
        statusDot.beginFill(0x00ff9d);
        statusDot.drawCircle(0, 0, 5);
        statusDot.endFill();
        statusDot.y = -this.config.hexRadius - 15;
        container.addChild(statusDot);

        // Create job info
        const jobLabel = new PIXI.Text('', {
            fontSize: 10,
            fill: 0xaaaaaa
        });
        jobLabel.anchor.set(0.5);
        jobLabel.y = this.config.hexRadius + 15;
        container.addChild(jobLabel);

        // Add to container
        this.container.addChild(container);

        // Store worker data
        this.workers.set(workerId, {
            id: workerId,
            container: container,
            hex: hex,
            glow: glow,
            label: label,
            statusDot: statusDot,
            jobLabel: jobLabel,
            data: workerData,
            animationPhase: Math.random() * Math.PI * 2
        });

        // Animate in
        container.scale.set(0);
        this.animateIn(container);
    }

    drawHexagon(graphics, x, y, radius, color) {
        graphics.clear();
        graphics.beginFill(color);
        graphics.lineStyle(2, 0xffffff, 0.3);

        for (let i = 0; i < 6; i++) {
            const angle = (Math.PI / 3) * i;
            const px = x + radius * Math.cos(angle);
            const py = y + radius * Math.sin(angle);

            if (i === 0) {
                graphics.moveTo(px, py);
            } else {
                graphics.lineTo(px, py);
            }
        }

        graphics.closePath();
        graphics.endFill();
    }

    calculateHexPosition(workerId) {
        // Hexagonal grid layout
        const cols = 4;
        const row = Math.floor(workerId / cols);
        const col = workerId % cols;

        const hexWidth = this.config.hexRadius * 2 + this.config.hexGap;
        const hexHeight = Math.sqrt(3) * (this.config.hexRadius + this.config.hexGap / 2);

        const x = (col - (cols - 1) / 2) * hexWidth * 0.75;
        const y = (row - 1) * hexHeight + (col % 2 === 1 ? hexHeight / 2 : 0);

        return { x, y };
    }

    updateWorkerVisuals(worker) {
        const data = worker.data;
        const isBusy = data.is_busy;
        const isReady = data.isReady;

        let color, glowColor;

        if (!isReady) {
            // Worker not ready (offline)
            color = this.config.colors.error;
            glowColor = this.config.colors.errorGlow;
        } else if (isBusy) {
            // Worker busy (compiling)
            color = this.config.colors.compiling;
            glowColor = this.config.colors.compilingGlow;
        } else {
            // Worker idle
            color = this.config.colors.idle;
            glowColor = this.config.colors.idleGlow;
        }

        // Update hexagon color
        this.drawHexagon(worker.hex, 0, 0, this.config.hexRadius, color);

        // Update glow
        if (isBusy) {
            worker.glow.alpha = 0.3 + Math.sin(this.time + worker.animationPhase) * 0.2;
            worker.glow.clear();
            worker.glow.beginFill(glowColor, worker.glow.alpha);
            worker.glow.drawCircle(0, 0, this.config.hexRadius + 10);
            worker.glow.endFill();
        } else {
            worker.glow.alpha = 0;
        }

        // Update status dot
        worker.statusDot.clear();
        if (isReady) {
            worker.statusDot.beginFill(isBusy ? 0xffff00 : 0x00ff9d);
        } else {
            worker.statusDot.beginFill(0xff4444);
        }
        worker.statusDot.drawCircle(0, 0, 5);
        worker.statusDot.endFill();

        // Update job label
        if (data.current_job) {
            worker.jobLabel.text = `Job: ${data.current_job.substring(0, 10)}...`;
            worker.jobLabel.style.fill = 0x00ff9d;
        } else {
            worker.jobLabel.text = 'Idle';
            worker.jobLabel.style.fill = 0x666666;
        }
    }

    updateQueueStatus(queueData) {
        // Update queue statistics
        if (!this.queueLabel) {
            this.queueLabel = new PIXI.Text('', {
                fontSize: 12,
                fill: 0xaaaaaa
            });
            this.queueLabel.x = -380;
            this.queueLabel.y = 250;
            this.container.addChild(this.queueLabel);
        }

        const text = `Queue: ${queueData.queued} | Active: ${queueData.active} | Completed: ${queueData.completed}`;
        this.queueLabel.text = text;
    }

    animateIn(container) {
        let scale = 0;
        const animate = () => {
            scale += 0.1;
            container.scale.set(scale);

            if (scale < 1) {
                requestAnimationFrame(animate);
            }
        };
        animate();
    }

    animate() {
        this.time += this.config.animationSpeed;

        // Update all workers
        this.workers.forEach(worker => {
            if (worker.data.is_busy) {
                // Pulse effect for busy workers
                const pulse = 1 + Math.sin(this.time * 2 + worker.animationPhase) * 0.05;
                worker.container.scale.set(pulse);

                // Update glow
                worker.glow.alpha = 0.3 + Math.sin(this.time + worker.animationPhase) * 0.2;
            }
        });
    }

    show() {
        this.container.visible = true;
        this.container.alpha = 0;

        let alpha = 0;
        const fadeIn = () => {
            alpha += 0.05;
            this.container.alpha = alpha;

            if (alpha < 1) {
                requestAnimationFrame(fadeIn);
            }
        };
        fadeIn();
    }

    hide() {
        let alpha = 1;
        const fadeOut = () => {
            alpha -= 0.05;
            this.container.alpha = alpha;

            if (alpha > 0) {
                requestAnimationFrame(fadeOut);
            } else {
                this.container.visible = false;
            }
        };
        fadeOut();
    }

    destroy() {
        this.workers.forEach(worker => {
            this.container.removeChild(worker.container);
        });
        this.world.removeChild(this.container);
        this.workers.clear();
    }
}

// Export for use in main application
if (typeof module !== 'undefined' && module.exports) {
    module.exports = BuildSwarm;
}
