# PixiJS Ecosystem Integration - Quick Reference Guide

**Purpose**: Map specific code sections in [`index.html`](systems/visual_shell/web/index.html) to library replacements

---

## pixi-viewport Integration

### Replace Manual Pan/Zoom System

**Current Code**: Lines 1146-1201 in [`index.html`](systems/visual_shell/web/index.html:1146-1201)

```javascript
// CURRENT CODE (TO BE REPLACED)
// 6. INPUT HANDLING (Pan & Zoom)
let zoom = 1.0;
let targetZoom = 1.0;
let isDraggingGrid = false;
let lastGridPos = null;

app.view.addEventListener('wheel', (e) => {
    e.preventDefault();
    const zoomFactor = 1.1;
    const direction = e.deltaY > 0 ? 1 / zoomFactor : zoomFactor;
    targetZoom *= direction;
    targetZoom = Math.max(0.1, Math.min(5.0, targetZoom));
}, { passive: false });

app.view.addEventListener('pointerdown', (e) => {
    if (e.data.button === 2 || e.data.button === 1) {
        isDraggingGrid = true;
        lastGridPos = { x: e.data.global.x, y: e.data.global.y };
    }
});

app.view.addEventListener('pointerup', () => { isDraggingGrid = false; });

app.view.addEventListener('pointermove', (e) => {
    if (isDraggingGrid && lastGridPos) {
        const dx = e.data.global.x - lastGridPos.x;
        const dy = e.data.global.y - lastGridPos.y;
        world.x += dx;
        world.y += dy;
        lastGridPos = { x: e.data.global.x, y: e.data.global.y };
    }
});
```

**Replacement with pixi-viewport**:

```javascript
// NEW CODE (pixi-viewport)
// Load library
<script src="https://cdn.jsdelivr.net/npm/pixi-viewport@5.0.2/dist/pixi-viewport.min.js"></script>

// Replace world container initialization (lines 755-757)
const viewport = new Viewport({
    screenWidth: window.innerWidth,
    screenHeight: window.innerHeight,
    worldWidth: 10000,
    worldHeight: 10000,
    interaction: app.renderer.plugins.interaction
});

app.stage.addChild(viewport);

// Enable viewport plugins
viewport
    .drag({ mouseButtons: 'right' })  // Right-click to drag
    .pinch()                          // Pinch-to-zoom
    .wheel()                          // Mouse wheel zoom
    .clampZoom({ minScale: 0.1, maxScale: 5.0 })
    .decelerate({ friction: 0.95 }); // Kinetic scrolling

// Add world to viewport instead of app.stage
viewport.addChild(world);

// Remove manual zoom handling (delete lines 1146-1201)
```

### Update Animation Loop

**Current Code**: Lines 1184-1201 in [`index.html`](systems/visual_shell/web/index.html:1184-1201)

```javascript
// CURRENT CODE
app.ticker.add(() => {
    // Smooth Zoom
    zoom += (targetZoom - zoom) * 0.1;
    world.scale.set(zoom);
    world.sortableChildren = true;

    // Re-draw grid to fit new boundaries
    drawGrid();

    // Update BuildSwarm animations
    if (buildSwarm) {
        buildSwarm.animate();
    }

    // Update HUD
    updateHUD();
});
```

**Updated with pixi-viewport**:

```javascript
// NEW CODE
app.ticker.add(() => {
    // Viewport handles zoom/pan automatically
    world.sortableChildren = true;

    // Re-draw grid to fit new boundaries
    drawGrid();

    // Update BuildSwarm animations
    if (buildSwarm) {
        buildSwarm.animate();
    }

    // Update HUD with viewport values
    updateHUD();
});

function updateHUD() {
    document.getElementById('zoom-level').textContent = 
        viewport.scale.x.toFixed(2) + 'x';
    document.getElementById('world-position').textContent = 
        `(${Math.floor(viewport.x)}, ${Math.floor(viewport.y)})`;
}
```

---

## @pixi/ui Integration

### Replace Button Creation

**Current Code**: Lines 931-956 in [`index.html`](systems/visual_shell/web/index.html:931-956)

```javascript
// CURRENT CODE
function createPanelButton(text, onClick) {
    const btn = new PIXI.Graphics();
    btn.beginFill('rgba(0, 255, 157, 0.2)');
    btn.lineStyle(1, 'rgba(0, 255, 157, 0.4)');
    btn.drawRoundedRect(0, 0, 32, 32, 6);
    btn.endFill();

    const label = new PIXI.Text(text, {
        fontSize: 16,
        fontWeight: 'bold',
        fill: '#00ff9d'
    });
    label.anchor.set(0.5);
    label.x = 16;
    label.y = 16;

    const btnContainer = new PIXI.Container();
    btnContainer.addChild(btn);
    btnContainer.addChild(label);
    btnContainer.eventMode = 'static';
    btnContainer.cursor = 'pointer';

    btnContainer.on('pointerdown', onClick);

    return btnContainer;
}
```

**Replacement with @pixi/ui**:

```javascript
// NEW CODE (@pixi/ui)
// Load library
<script src="https://cdn.jsdelivr.net/npm/@pixi/ui@0.8.0/dist/pixi-ui.min.js"></script>

function createPanelButton(text, onClick) {
    const btn = new Button({
        text: text,
        style: {
            backgroundColor: 'rgba(0, 255, 157, 0.2)',
            borderColor: 'rgba(0, 255, 157, 0.4)',
            textColor: '#00ff9d',
            borderRadius: 6,
            width: 32,
            height: 32,
            fontSize: 16,
            fontWeight: 'bold'
        }
    });
    btn.onPress.connect(onClick);
    return btn;
}
```

### Add Scrollable Content to Panels

**Current Code**: Lines 876-893 in [`index.html`](systems/visual_shell/web/index.html:876-893)

```javascript
// CURRENT CODE
// Content area
const contentMask = new PIXI.Graphics();
contentMask.beginFill(0x000000);
contentMask.drawRoundedRect(0, 0, appData.width - 24, appData.height - 80, { tl: 0, tr: 0, bl: 0, br: 0 });
contentMask.endFill();

const content = new PIXI.Container();
content.mask = contentMask;
content.y = 10;

// Render app-specific content
if (appData.type === 'system_monitor') {
    renderSystemMonitor(content, appData);
} else if (appData.type === 'process_hive') {
    renderProcessHive(content, appData);
} else {
    renderGenericApp(content, appData);
}

panel.addChild(content);
```

**Enhanced with ScrollBox**:

```javascript
// NEW CODE (@pixi/ui)
// Create content container
const content = new PIXI.Container();

// Render app-specific content
if (appData.type === 'system_monitor') {
    renderSystemMonitor(content, appData);
} else if (appData.type === 'process_hive') {
    renderProcessHive(content, appData);
} else {
    renderGenericApp(content, appData);
}

// Wrap in ScrollBox
const scrollBox = new ScrollBox({
    width: appData.width - 24,
    height: appData.height - 80,
    backgroundColor: 0x000000,
    borderRadius: 0,
    padding: 10
});
scrollBox.content.addChild(content);
scrollBox.y = 10;

panel.addChild(scrollBox);
```

---

## pixi-filters Integration

### Replace Manual Glow Effects

**Current Code**: Lines 1338-1396 in [`index.html`](systems/visual_shell/web/index.html:1338-1396)

```javascript
// CURRENT CODE
// Add glow effect
orb.lineStyle(2, color, 0.5);
orb.drawCircle(0, 0, 14);

// ... later in hover effect
sprite.on('pointerover', () => {
    orb.clear();
    orb.beginFill(color);
    orb.drawCircle(0, 0, 14);
    orb.endFill();
    orb.lineStyle(3, color, 0.8);
    orb.drawCircle(0, 0, 16);
});
```

**Replacement with GlowFilter**:

```javascript
// NEW CODE (pixi-filters)
// Load library
<script src="https://cdn.jsdelivr.net/npm/pixi-filters@4.1.1/dist/pixi-filters.min.js"></script>

// Create glow filter
const glowFilter = new GlowFilter({
    distance: 15,
    outerStrength: 2,
    innerStrength: 0,
    color: 0x00ccff,
    quality: 0.5
});

// Apply to sprite (remove manual line drawing)
function createFileSprite(fileData) {
    const sprite = new PIXI.Container();
    sprite.x = fileData.x || 0;
    sprite.y = fileData.y || 0;
    sprite.fileData = fileData;

    // Determine color based on file type
    let color = CONFIG.COLORS.FILE_OTHER;
    if (fileData.type === 'app' || fileData.name.endsWith('.rts.png')) {
        color = CONFIG.COLORS.FILE_APP;
    } else if (fileData.type === 'folder') {
        color = CONFIG.COLORS.FOLDER_NODE;
    } else {
        color = CONFIG.COLORS.FILE_NODE;
    }

    // Create orb/circle (no manual glow)
    const orb = new PIXI.Graphics();
    orb.beginFill(color);
    orb.drawCircle(0, 0, 12);
    orb.endFill();
    sprite.addChild(orb);

    // Add file name label
    const label = new PIXI.Text(fileData.name, {
        fontSize: 10,
        fill: 0xffffff,
        align: 'center'
    });
    label.anchor.set(0.5, 1.5);
    label.y = 15;
    sprite.addChild(label);

    // Enable interaction
    sprite.eventMode = 'static';
    sprite.cursor = 'pointer';

    // Hover effect with glow filter
    sprite.on('pointerover', () => {
        sprite.filters = [glowFilter];
        orb.clear();
        orb.beginFill(color);
        orb.drawCircle(0, 0, 14);
        orb.endFill();
    });

    sprite.on('pointerout', () => {
        sprite.filters = [];
        orb.clear();
        orb.beginFill(color);
        orb.drawCircle(0, 0, 12);
        orb.endFill();
    });

    // ... rest of function
}
```

### Add CRT Filter for Global Aesthetic

**Add after app initialization** (after line 753):

```javascript
// NEW CODE (pixi-filters)
// Create CRT filter
const crtFilter = new CRTFilter({
    curvature: 0.5,
    lineWidth: 2.0,
    lineContrast: 0.3,
    noise: 0.15,
    noiseSize: 1.0,
    vignetting: 0.2,
    vignettingAlpha: 0.5,
    vignettingBlur: 0.5,
    time: 0
});

// Apply to app.stage for global effect
app.stage.filters = [crtFilter];

// Animate in ticker
app.ticker.add(() => {
    crtFilter.time += 0.1;
});
```

### Add Glitch Filter for Neural Distortion Events

**Add new function**:

```javascript
// NEW CODE (pixi-filters)
// Create glitch filter
const glitchFilter = new GlitchFilter({
    slices: 5,
    offset: 50,
    direction: 0,
    fillMode: 0,
    seed: 0,
    red: [0, 0],
    green: [0, 0],
    blue: [0, 0]
});

// Trigger glitch on events
function triggerGlitch() {
    app.stage.filters = [crtFilter, glitchFilter];
    glitchFilter.seed = Math.random();
    
    setTimeout(() => {
        glitchFilter.seed = 0;
        app.stage.filters = [crtFilter];
    }, 200);
}

// Call on neural distortion events
function handleNeuralDistortion() {
    triggerGlitch();
    // ... other handling
}
```

---

## @pixi/particle-emitter Integration

### Add Particle Effects for Build Operations

**Add after buildSwarm initialization** (after line 760):

```javascript
// NEW CODE (@pixi/particle-emitter)
// Load library
<script src="https://cdn.jsdelivr.net/npm/@pixi/particle-emitter@5.0.0/dist/particle-emitter.min.js"></script>

// Create emitter for build progress
const buildEmitter = new Emitter(
    world,
    {
        lifetime: { min: 0.5, max: 1.0 },
        frequency: 0.05,
        spawnChance: 1,
        particlesPerWave: 1,
        emitterLifetime: -1,
        maxParticles: 1000,
        pos: { x: 0, y: 0 },
        addAtBack: false,
        behaviors: [
            {
                type: 'alpha',
                config: {
                    alpha: {
                        list: [
                            { value: 1, time: 0 },
                            { value: 0, time: 1 }
                        ]
                    }
                }
            },
            {
                type: 'moveSpeed',
                config: {
                    speed: {
                        list: [
                            { value: 100, time: 0 },
                            { value: 50, time: 1 }
                        ]
                    },
                    minMult: 1
                }
            },
            {
                type: 'scale',
                config: {
                    scale: {
                        list: [
                            { value: 1, time: 0 },
                            { value: 0, time: 1 }
                        ]
                    },
                    minMult: 1
                }
            },
            {
                type: 'color',
                config: {
                    color: {
                        list: [
                            { value: '#00ff9d', time: 0 },
                            { value: '#00ccff', time: 1 }
                        ]
                    }
                }
            }
        ]
    }
);

// Emit particles at specific position
function emitBuildParticles(x, y, count = 10) {
    buildEmitter.emit = true;
    buildEmitter.updateSpawnPos(x, y);
    for (let i = 0; i < count; i++) {
        buildEmitter.emitOnce();
    }
}

// Update in ticker (add to existing ticker)
app.ticker.add(() => {
    buildEmitter.update(app.ticker.deltaMS);
});
```

### Add Particle Effects for File Operations

**Add to file creation/deletion handlers**:

```javascript
// NEW CODE (@pixi/particle-emitter)
// Create emitter for file operations
const fileEmitter = new Emitter(
    world,
    {
        lifetime: { min: 0.3, max: 0.6 },
        frequency: 0.02,
        particlesPerWave: 1,
        maxParticles: 500,
        behaviors: [
            {
                type: 'alpha',
                config: {
                    alpha: {
                        list: [
                            { value: 1, time: 0 },
                            { value: 0, time: 1 }
                        ]
                    }
                }
            },
            {
                type: 'moveSpeed',
                config: {
                    speed: {
                        list: [
                            { value: 80, time: 0 },
                            { value: 20, time: 1 }
                        ]
                    }
                }
            },
            {
                type: 'color',
                config: {
                    color: {
                        list: [
                            { value: '#ffaa00', time: 0 },
                            { value: '#ff6600', time: 1 }
                        ]
                    }
                }
            }
        ]
    }
);

// Emit particles on file creation
function onFileCreated(fileData) {
    emitFileParticles(fileData.x, fileData.y, 20);
}

function emitFileParticles(x, y, count = 10) {
    fileEmitter.emit = true;
    fileEmitter.updateSpawnPos(x, y);
    for (let i = 0; i < count; i++) {
        fileEmitter.emitOnce();
    }
}

// Update in ticker
app.ticker.add(() => {
    fileEmitter.update(app.ticker.deltaMS);
});
```

---

## Complete Integration Checklist

### Phase 1: Core Infrastructure
- [ ] Load pixi-viewport CDN
- [ ] Replace world container with viewport
- [ ] Remove manual pan/zoom code (lines 1146-1201)
- [ ] Update animation loop
- [ ] Test kinetic scrolling
- [ ] Test pinch-to-zoom
- [ ] Test boundaries and clamping

### Phase 2: UI Components
- [ ] Load @pixi/ui CDN
- [ ] Replace createPanelButton function
- [ ] Add ScrollBox to panels
- [ ] Test all UI components
- [ ] Update panel styling

### Phase 3: Visual Effects
- [ ] Load pixi-filters CDN
- [ ] Replace manual glow with GlowFilter
- [ ] Add CRT filter for global aesthetic
- [ ] Add Glitch filter for events
- [ ] Test all filters
- [ ] Optimize filter performance

### Phase 4: Particle Systems
- [ ] Load @pixi/particle-emitter CDN
- [ ] Create build emitter
- [ ] Create file operation emitter
- [ ] Integrate with existing systems
- [ ] Test particle performance
- [ ] Optimize particle count

### Phase 5: Optional Features
- [ ] Load pixi-sound CDN (optional)
- [ ] Add audio feedback
- [ ] Load pixi-tilemap CDN (optional)
- [ ] Optimize grid rendering
- [ ] Performance testing

---

## Testing Checklist

### Functional Testing
- [ ] Pan works smoothly
- [ ] Zoom works with mouse wheel
- [ ] Zoom works with pinch gesture
- [ ] Buttons are clickable
- [ ] Scroll boxes work correctly
- [ ] Filters render correctly
- [ ] Particles emit on events
- [ ] Audio plays on interactions (if enabled)

### Performance Testing
- [ ] Frame rate stays at 60 FPS
- [ ] Memory usage is acceptable
- [ ] No memory leaks
- [ ] Smooth animations
- [ ] Fast load times

### Cross-Browser Testing
- [ ] Chrome
- [ ] Firefox
- [ ] Safari
- [ ] Edge
- [ ] Mobile browsers

---

## Rollback Plan

If any integration causes issues:

1. **Comment out new code** - Keep old code in comments
2. **Restore old implementation** - Uncomment old code
3. **Test functionality** - Ensure system works
4. **Document issue** - Record what went wrong
5. **Report to team** - Share findings

---

## Additional Resources

- [PixiJS Official Documentation](https://pixijs.io/)
- [pixi-viewport Examples](https://davidfig.github.io/pixi-viewport/)
- [@pixi/ui Examples](https://pixijs.io/ui/examples/)
- [pixi-filters Examples](https://pixijs.io/pixi-filters/examples/)
- [@pixi/particle-emitter Examples](https://pixijs.io/particle-emitter/examples/)

---

**Document Version**: 1.0
**Last Updated**: 2026-01-20
**Related**: [PIXIJS_ECOSYSTEM_INTEGRATION.md](./PIXIJS_ECOSYSTEM_INTEGRATION.md)
