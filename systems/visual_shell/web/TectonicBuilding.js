/**
 * Geometry OS: Tectonic Building
 *
 * A "Building" is a 2D cluster of Resonance Glyphs that represents
 * a complete function or process in the visual computation substrate.
 *
 * Architecture:
 * - Buildings have a coordinate origin (x, y) on the Infinite Map
 * - Contains multiple glyphs in a 2D layout
 * - Has input/output "ports" for data flow connections
 * - Registers with GlyphExecutor as a batch
 *
 * Epoch 2: Tectonic Architecture
 */

export class TectonicBuilding {
    /**
     * @param {Object} config - Building configuration
     * @param {string} config.id - Unique building identifier
     * @param {string} config.name - Human-readable name
     * @param {string} config.type - Building type (function, process, library)
     * @param {number} config.originX - X coordinate on Infinite Map
     * @param {number} config.originY - Y coordinate on Infinite Map
     * @param {number} config.width - Building width in glyph units
     * @param {number} config.height - Building height in glyph units
     */
    constructor(config) {
        this.id = config.id || `building_${Date.now()}`;
        this.name = config.name || 'Unnamed Building';
        this.type = config.type || 'function';
        this.originX = config.originX || 0;
        this.originY = config.originY || 0;
        this.width = config.width || 4;
        this.height = config.height || 4;

        // Glyph layout (2D array of glyph data)
        // Each cell: { opcode, operand, atlasX, atlasY, sprite }
        this.glyphs = [];

        // I/O Ports for data flow
        this.inputPorts = [];
        this.outputPorts = [];

        // State
        this.state = 'idle'; // idle | running | halted | error
        this.executionCount = 0;
        this.lastOutput = null;

        // Visual elements
        this.container = null; // PIXI.Container
        this.border = null; // PIXI.Graphics

        // Connections
        this.incomingWires = [];
        this.outgoingWires = [];

        // Metadata
        this.metadata = {
            created: Date.now(),
            modified: Date.now(),
            source: config.source || null, // Source code if compiled
            author: config.author || 'system'
        };
    }

    // ============================================
    // GLYPH MANAGEMENT
    // ============================================

    /**
     * Add a glyph to the building at relative position.
     * @param {number} relX - Relative X position within building
     * @param {number} relY - Relative Y position within building
     * @param {Object} glyphData - Glyph data { opcode, operand, atlasX, atlasY }
     */
    addGlyph(relX, relY, glyphData) {
        if (relX < 0 || relX >= this.width || relY < 0 || relY >= this.height) {
            throw new Error(`Glyph position (${relX},${relY}) outside building bounds`);
        }

        // Remove existing glyph at this position
        this.glyphs = this.glyphs.filter(g => !(g.relX === relX && g.relY === relY));

        this.glyphs.push({
            relX,
            relY,
            absX: this.originX + relX,
            absY: this.originY + relY,
            ...glyphData,
            sprite: null
        });

        this.metadata.modified = Date.now();
    }

    /**
     * Set the entire glyph grid from a 2D array.
     * @param {Array<Array<Object>>} grid - 2D array of glyph data
     */
    setGlyphGrid(grid) {
        this.glyphs = [];
        this.height = grid.length;
        this.width = grid[0]?.length || 0;

        for (let y = 0; y < grid.length; y++) {
            for (let x = 0; x < grid[y].length; x++) {
                const glyphData = grid[y][x];
                if (glyphData) {
                    this.addGlyph(x, y, glyphData);
                }
            }
        }
    }

    /**
     * Get glyph at relative position.
     * @param {number} relX - Relative X position
     * @param {number} relY - Relative Y position
     * @returns {Object|null} Glyph data or null
     */
    getGlyph(relX, relY) {
        return this.glyphs.find(g => g.relX === relX && g.relY === relY) || null;
    }

    /**
     * Get all glyphs with absolute coordinates.
     * @returns {Array} Array of glyph data with absX, absY
     */
    getAllGlyphs() {
        return this.glyphs.map(g => ({ ...g }));
    }

    // ============================================
    // PORT MANAGEMENT
    // ============================================

    /**
     * Add an input port.
     * @param {string} name - Port name
     * @param {string} side - Side: 'top', 'bottom', 'left', 'right'
     * @param {number} position - Position along side (0 to width/height-1)
     * @param {string} dataType - Data type: 'i32', 'f32', 'ptr'
     */
    addInputPort(name, side, position, dataType = 'i32') {
        const port = {
            id: `${this.id}_in_${name}`,
            name,
            type: 'input',
            side,
            position,
            dataType,
            connected: false,
            wire: null
        };
        this.inputPorts.push(port);
        return port;
    }

    /**
     * Add an output port.
     * @param {string} name - Port name
     * @param {string} side - Side: 'top', 'bottom', 'left', 'right'
     * @param {number} position - Position along side
     * @param {string} dataType - Data type
     */
    addOutputPort(name, side, position, dataType = 'i32') {
        const port = {
            id: `${this.id}_out_${name}`,
            name,
            type: 'output',
            side,
            position,
            dataType,
            connected: false,
            wire: null
        };
        this.outputPorts.push(port);
        return port;
    }

    /**
     * Get port absolute position on Infinite Map.
     * @param {Object} port - Port object
     * @returns {Object} { x, y } absolute coordinates
     */
    getPortPosition(port) {
        const tileSize = 16; // Glyph tile size

        switch (port.side) {
            case 'top':
                return { x: this.originX + port.position, y: this.originY - 1 };
            case 'bottom':
                return { x: this.originX + port.position, y: this.originY + this.height };
            case 'left':
                return { x: this.originX - 1, y: this.originY + port.position };
            case 'right':
                return { x: this.originX + this.width, y: this.originY + port.position };
            default:
                return { x: this.originX, y: this.originY };
        }
    }

    /**
     * Get all ports (input and output).
     * @returns {Array} Combined port array
     */
    getAllPorts() {
        return [...this.inputPorts, ...this.outputPorts];
    }

    // ============================================
    // BUILDING OPERATIONS
    // ============================================

    /**
     * Move building to new origin.
     * @param {number} newOriginX - New X coordinate
     * @param {number} newOriginY - New Y coordinate
     */
    moveTo(newOriginX, newOriginY) {
        const deltaX = newOriginX - this.originX;
        const deltaY = newOriginY - this.originY;

        this.originX = newOriginX;
        this.originY = newOriginY;

        // Update all glyph absolute positions
        for (const glyph of this.glyphs) {
            glyph.absX += deltaX;
            glyph.absY += deltaY;
        }

        this.metadata.modified = Date.now();
    }

    /**
     * Resize building (may truncate glyphs).
     * @param {number} newWidth - New width
     * @param {number} newHeight - New height
     */
    resize(newWidth, newHeight) {
        this.width = newWidth;
        this.height = newHeight;

        // Remove glyphs outside new bounds
        this.glyphs = this.glyphs.filter(g =>
            g.relX >= 0 && g.relX < newWidth &&
            g.relY >= 0 && g.relY < newHeight
        );

        this.metadata.modified = Date.now();
    }

    /**
     * Set building state.
     * @param {string} state - New state
     */
    setState(state) {
        this.state = state;

        // Update all glyph sprites
        for (const glyph of this.glyphs) {
            if (glyph.sprite) {
                this._updateGlyphVisual(glyph, state);
            }
        }

        // Update border color
        if (this.border) {
            this._updateBorderVisual();
        }
    }

    /**
     * Update glyph visual based on state.
     */
    _updateGlyphVisual(glyph, state) {
        const colors = {
            idle: 0xFFFFFF,
            running: 0x00FF88,
            halted: 0xFFAA00,
            error: 0xFF4444
        };
        glyph.sprite.tint = colors[state] || 0xFFFFFF;
    }

    /**
     * Update border visual based on state.
     */
    _updateBorderVisual() {
        if (!this.border) return;

        const colors = {
            idle: 0x4488FF,
            running: 0x00FF88,
            halted: 0xFFAA00,
            error: 0xFF4444
        };

        this.border.clear();
        this.border.lineStyle(2, colors[this.state] || 0x4488FF);
        this.border.drawRect(
            -8, -8,
            this.width * 16 + 16,
            this.height * 16 + 16
        );
    }

    // ============================================
    // SERIALIZATION
    // ============================================

    /**
     * Serialize building for persistence.
     * @returns {Object} Serializable building data
     */
    serialize() {
        return {
            id: this.id,
            name: this.name,
            type: this.type,
            originX: this.originX,
            originY: this.originY,
            width: this.width,
            height: this.height,
            glyphs: this.glyphs.map(g => ({
                relX: g.relX,
                relY: g.relY,
                opcode: g.opcode,
                operand: g.operand,
                atlasX: g.atlasX,
                atlasY: g.atlasY
            })),
            inputPorts: this.inputPorts,
            outputPorts: this.outputPorts,
            state: this.state,
            metadata: this.metadata
        };
    }

    /**
     * Deserialize building from data.
     * @param {Object} data - Serialized building data
     * @returns {TectonicBuilding} New building instance
     */
    static deserialize(data) {
        const building = new TectonicBuilding({
            id: data.id,
            name: data.name,
            type: data.type,
            originX: data.originX,
            originY: data.originY,
            width: data.width,
            height: data.height
        });

        // Restore glyphs
        for (const glyph of data.glyphs) {
            building.addGlyph(glyph.relX, glyph.relY, {
                opcode: glyph.opcode,
                operand: glyph.operand,
                atlasX: glyph.atlasX,
                atlasY: glyph.atlasY
            });
        }

        // Restore ports
        building.inputPorts = data.inputPorts || [];
        building.outputPorts = data.outputPorts || [];
        building.state = data.state || 'idle';
        building.metadata = data.metadata || building.metadata;

        return building;
    }

    // ============================================
    // VISUAL RENDERING (PIXI.js)
    // ============================================

    /**
     * Create PIXI container for this building.
     * @param {PIXI.Container} parent - Parent container
     * @returns {PIXI.Container} Building container
     */
    createVisual(parent) {
        const tileSize = 16;

        this.container = new PIXI.Container();
        this.container.position.set(this.originX * tileSize, this.originY * tileSize);

        // Create border
        this.border = new PIXI.Graphics();
        this._updateBorderVisual();
        this.container.addChild(this.border);

        // Port indicators
        this._createPortVisuals();

        parent.addChild(this.container);
        return this.container;
    }

    /**
     * Create visual indicators for ports.
     */
    _createPortVisuals() {
        const tileSize = 16;
        const portRadius = 4;

        for (const port of this.getAllPorts()) {
            const indicator = new PIXI.Graphics();

            const color = port.type === 'input' ? 0x00FF00 : 0xFF8800;
            indicator.beginFill(color);
            indicator.drawCircle(0, 0, portRadius);
            indicator.endFill();

            const pos = this.getPortPosition(port);
            const relX = (pos.x - this.originX) * tileSize + tileSize / 2;
            const relY = (pos.y - this.originY) * tileSize + tileSize / 2;

            indicator.position.set(relX, relY);
            this.container.addChild(indicator);

            port.visual = indicator;
        }
    }

    /**
     * Destroy visual elements.
     */
    destroyVisual() {
        if (this.container) {
            this.container.destroy({ children: true });
            this.container = null;
            this.border = null;
        }
    }
}

// ============================================
// BUILDING TEMPLATES (Standard Library)
// ============================================

export const BuildingTemplates = {
    /**
     * Create a simple ADD function building.
     * @param {number} x - Origin X
     * @param {number} y - Origin Y
     */
    createAdd: (x, y) => {
        const building = new TectonicBuilding({
            id: `add_${Date.now()}`,
            name: 'ADD',
            type: 'function',
            originX: x,
            originY: y,
            width: 3,
            height: 2
        });

        // Opcode layout: i32.add (0x6A)
        building.addGlyph(0, 0, { opcode: 0x20, operand: 0, atlasX: 0, atlasY: 0 }); // local.get 0
        building.addGlyph(1, 0, { opcode: 0x20, operand: 1, atlasX: 1, atlasY: 0 }); // local.get 1
        building.addGlyph(2, 0, { opcode: 0x6A, operand: 0, atlasX: 2, atlasY: 0 }); // i32.add
        building.addGlyph(0, 1, { opcode: 0x21, operand: 0, atlasX: 0, atlasY: 1 }); // local.set 0

        building.addInputPort('a', 'left', 0, 'i32');
        building.addInputPort('b', 'left', 1, 'i32');
        building.addOutputPort('result', 'right', 0, 'i32');

        return building;
    },

    /**
     * Create a NOP (no-op) placeholder building.
     */
    createNop: (x, y) => {
        const building = new TectonicBuilding({
            id: `nop_${Date.now()}`,
            name: 'NOP',
            type: 'placeholder',
            originX: x,
            originY: y,
            width: 1,
            height: 1
        });

        building.addGlyph(0, 0, { opcode: 0x01, operand: 0, atlasX: 0, atlasY: 0 }); // nop

        return building;
    },

    /**
     * Create a memory load building.
     */
    createLoad: (x, y) => {
        const building = new TectonicBuilding({
            id: `load_${Date.now()}`,
            name: 'LOAD',
            type: 'function',
            originX: x,
            originY: y,
            width: 2,
            height: 1
        });

        building.addGlyph(0, 0, { opcode: 0x28, operand: 0, atlasX: 0, atlasY: 0 }); // i32.load
        building.addGlyph(1, 0, { opcode: 0x21, operand: 0, atlasX: 1, atlasY: 0 }); // local.set

        building.addInputPort('addr', 'left', 0, 'ptr');
        building.addOutputPort('value', 'right', 0, 'i32');

        return building;
    },

    /**
     * Create a memory store building.
     */
    createStore: (x, y) => {
        const building = new TectonicBuilding({
            id: `store_${Date.now()}`,
            name: 'STORE',
            type: 'function',
            originX: x,
            originY: y,
            width: 2,
            height: 2
        });

        building.addGlyph(0, 0, { opcode: 0x20, operand: 0, atlasX: 0, atlasY: 0 }); // local.get addr
        building.addGlyph(1, 0, { opcode: 0x20, operand: 1, atlasX: 1, atlasY: 0 }); // local.get value
        building.addGlyph(0, 1, { opcode: 0x36, operand: 0, atlasX: 0, atlasY: 1 }); // i32.store

        building.addInputPort('addr', 'left', 0, 'ptr');
        building.addInputPort('value', 'left', 1, 'i32');

        return building;
    }
};

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TectonicBuilding, BuildingTemplates };
}
