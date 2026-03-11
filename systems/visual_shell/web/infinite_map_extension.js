
// Phase 44: Handle Cognitive State Updates
handleCognitiveUpdate(msg) {
    const { state } = msg;
    if (!state) return;

    // 1. Ensure the Spire Container exists
    if (!this.cognitiveSpire) {
        this.cognitiveSpire = new PIXI.Container();
        this.cognitiveSpire.zIndex = 500; // Above most things
        this.world.addChild(this.cognitiveSpire);

        // Create the Base Structure
        const base = new PIXI.Graphics();
        base.lineStyle(4, 0x00FFFF, 0.8);
        base.beginFill(0x00FFFF, 0.1);
        base.drawCircle(0, 0, state.radius || 1024);
        base.endFill();

        // The Central Spire
        base.lineStyle(2, 0xFFFFFF, 1);
        base.moveTo(0, 0);
        base.lineTo(0, -500); // Tall spire

        this.cognitiveSpire.addChild(base);
        this.cognitiveSpire.x = state.center.x * this.config.gridSize;
        this.cognitiveSpire.y = state.center.y * this.config.gridSize;

        console.log("🏰 Cognitive Spire Constructed at Antigravity Prime");
    }

    // 2. Render Thought Particles
    // (Simplified for now - we would need the particle list from the backend)
    if (state.particle_count > 0) {
        // Pulse effect based on particle count
        const pulse = Math.sin(Date.now() / 500) * 0.1 + 1.0;
        this.cognitiveSpire.scale.set(pulse);
    }
}
