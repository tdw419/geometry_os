/**
 * Geometry OS: Geometric Standard Library
 *
 * Pre-compiled Buildings at coordinate (0,0) for:
 * - I/O operations (stdin, stdout, stderr)
 * - Memory management (alloc, free, realloc)
 * - Process scheduling (spawn, kill, wait)
 * - Math functions (sin, cos, sqrt)
 * - String operations (len, concat, compare)
 *
 * These buildings form the "kernel" of the visual OS.
 *
 * Epoch 2: Tectonic Architecture
 */

import { TectonicBuilding } from './TectonicBuilding.js';
import { TectonicCompiler, GeoASMLibrary } from './TectonicCompiler.js';

// Standard library coordinates (all at origin region)
const STDLIB_ORIGIN = { x: 0, y: 0 };
const STDLIB_SPACING = { x: 10, y: 5 };

export class GeometricStdLib {
    constructor() {
        this.compiler = new TectonicCompiler();
        this.buildings = new Map();
        this.categories = {
            arithmetic: [],
            bitwise: [],
            comparison: [],
            memory: [],
            control: [],
            io: [],
            math: [],
            string: []
        };

        this._initialize();
    }

    // ============================================
    // INITIALIZATION
    // ============================================

    /**
     * Initialize all standard library buildings.
     */
    _initialize() {
        let offsetX = STDLIB_ORIGIN.x;
        let offsetY = STDLIB_ORIGIN.y;

        // Arithmetic functions
        for (const name of ['add', 'subtract', 'multiply', 'divide', 'modulo']) {
            const building = this.compiler.compile(GeoASMLibrary.templates[name], {
                originX: offsetX,
                originY: offsetY
            });
            this._registerBuilding(building, 'arithmetic');
            offsetX += STDLIB_SPACING.x;
        }

        // Bitwise functions
        offsetY += STDLIB_SPACING.y;
        offsetX = STDLIB_ORIGIN.x;
        for (const name of ['and', 'or', 'xor', 'not']) {
            const building = this.compiler.compile(GeoASMLibrary.templates[name], {
                originX: offsetX,
                originY: offsetY
            });
            this._registerBuilding(building, 'bitwise');
            offsetX += STDLIB_SPACING.x;
        }

        // Comparison functions
        offsetY += STDLIB_SPACING.y;
        offsetX = STDLIB_ORIGIN.x;
        for (const name of ['equals', 'lessThan', 'greaterThan']) {
            const building = this.compiler.compile(GeoASMLibrary.templates[name], {
                originX: offsetX,
                originY: offsetY
            });
            this._registerBuilding(building, 'comparison');
            offsetX += STDLIB_SPACING.x;
        }

        // Memory functions
        offsetY += STDLIB_SPACING.y;
        offsetX = STDLIB_ORIGIN.x;
        for (const name of ['load', 'store']) {
            const building = this.compiler.compile(GeoASMLibrary.templates[name], {
                originX: offsetX,
                originY: offsetY
            });
            this._registerBuilding(building, 'memory');
            offsetX += STDLIB_SPACING.x;
        }

        // Utility functions
        offsetY += STDLIB_SPACING.y;
        offsetX = STDLIB_ORIGIN.x;
        for (const name of ['increment', 'decrement', 'double', 'square', 'abs', 'max', 'min']) {
            const building = this.compiler.compile(GeoASMLibrary.templates[name], {
                originX: offsetX,
                originY: offsetY
            });
            this._registerBuilding(building, 'arithmetic');
            offsetX += STDLIB_SPACING.x;
        }

        // I/O functions (custom)
        this._createIOBuildings(offsetX, offsetY + STDLIB_SPACING.y);

        // Control functions (custom)
        this._createControlBuildings(offsetX, offsetY + STDLIB_SPACING.y * 2);

        console.log(`[GeometricStdLib] Initialized ${this.buildings.size} buildings across ${Object.keys(this.categories).length} categories`);
    }

    /**
     * Register a building in the library.
     */
    _registerBuilding(building, category) {
        this.buildings.set(building.id, building);
        this.categories[category].push(building);
    }

    // ============================================
    // I/O BUILDINGS
    // ============================================

    /**
     * Create I/O buildings.
     */
    _createIOBuildings(startX, startY) {
        let x = startX;
        let y = startY;

        // stdin: read character from input
        const stdin = new TectonicBuilding({
            id: 'stdlib_stdin',
            name: 'STDIN',
            type: 'io',
            originX: x,
            originY: y,
            width: 2,
            height: 1
        });
        stdin.addGlyph(0, 0, { opcode: 0x28, operand: 0, atlasX: 8, atlasY: 2 }); // i32.load
        stdin.addGlyph(1, 0, { opcode: 0x21, operand: 0, atlasX: 1, atlasY: 2 }); // local.set
        stdin.addOutputPort('char', 'right', 0, 'i32');
        stdin.addInputPort('trigger', 'left', 0, 'i32');
        this._registerBuilding(stdin, 'io');

        // stdout: write character to output
        x += STDLIB_SPACING.x;
        const stdout = new TectonicBuilding({
            id: 'stdlib_stdout',
            name: 'STDOUT',
            type: 'io',
            originX: x,
            originY: y,
            width: 2,
            height: 1
        });
        stdout.addGlyph(0, 0, { opcode: 0x20, operand: 0, atlasX: 0, atlasY: 2 }); // local.get
        stdout.addGlyph(1, 0, { opcode: 0x36, operand: 0, atlasX: 1, atlasY: 3 }); // i32.store
        stdout.addInputPort('char', 'left', 0, 'i32');
        stdout.addOutputPort('ack', 'right', 0, 'i32');
        this._registerBuilding(stdout, 'io');

        // stderr: write to error stream
        x += STDLIB_SPACING.x;
        const stderr = new TectonicBuilding({
            id: 'stdlib_stderr',
            name: 'STDERR',
            type: 'io',
            originX: x,
            originY: y,
            width: 2,
            height: 1
        });
        stderr.addGlyph(0, 0, { opcode: 0x20, operand: 0, atlasX: 0, atlasY: 2 }); // local.get
        stderr.addGlyph(1, 0, { opcode: 0x36, operand: 0, atlasX: 1, atlasY: 3 }); // i32.store
        stderr.addInputPort('char', 'left', 0, 'i32');
        stderr.addOutputPort('ack', 'right', 0, 'i32');
        this._registerBuilding(stderr, 'io');
    }

    // ============================================
    // CONTROL BUILDINGS
    // ============================================

    /**
     * Create control flow buildings.
     */
    _createControlBuildings(startX, startY) {
        let x = startX;
        let y = startY;

        // nop: no operation
        const nop = new TectonicBuilding({
            id: 'stdlib_nop',
            name: 'NOP',
            type: 'control',
            originX: x,
            originY: y,
            width: 1,
            height: 1
        });
        nop.addGlyph(0, 0, { opcode: 0x01, operand: 0, atlasX: 1, atlasY: 0 }); // nop
        this._registerBuilding(nop, 'control');

        // halt: stop execution
        x += STDLIB_SPACING.x;
        const halt = new TectonicBuilding({
            id: 'stdlib_halt',
            name: 'HALT',
            type: 'control',
            originX: x,
            originY: y,
            width: 1,
            height: 1
        });
        halt.addGlyph(0, 0, { opcode: 0x0F, operand: 0, atlasX: 15, atlasY: 0 }); // return
        halt.addInputPort('trigger', 'left', 0, 'i32');
        this._registerBuilding(halt, 'control');

        // branch: conditional branch
        x += STDLIB_SPACING.x;
        const branch = new TectonicBuilding({
            id: 'stdlib_branch',
            name: 'BRANCH',
            type: 'control',
            originX: x,
            originY: y,
            width: 3,
            height: 1
        });
        branch.addGlyph(0, 0, { opcode: 0x20, operand: 0, atlasX: 0, atlasY: 2 }); // local.get condition
        branch.addGlyph(1, 0, { opcode: 0x04, operand: 0, atlasX: 4, atlasY: 0 }); // if
        branch.addGlyph(2, 0, { opcode: 0x0B, operand: 0, atlasX: 11, atlasY: 0 }); // end
        branch.addInputPort('condition', 'left', 0, 'i32');
        branch.addInputPort('true_val', 'top', 0, 'i32');
        branch.addInputPort('false_val', 'bottom', 0, 'i32');
        branch.addOutputPort('result', 'right', 0, 'i32');
        this._registerBuilding(branch, 'control');

        // loop: iteration controller
        x += STDLIB_SPACING.x;
        const loop = new TectonicBuilding({
            id: 'stdlib_loop',
            name: 'LOOP',
            type: 'control',
            originX: x,
            originY: y,
            width: 2,
            height: 2
        });
        loop.addGlyph(0, 0, { opcode: 0x03, operand: 0, atlasX: 3, atlasY: 0 }); // loop
        loop.addGlyph(1, 0, { opcode: 0x0D, operand: 0, atlasX: 13, atlasY: 0 }); // br_if
        loop.addGlyph(0, 1, { opcode: 0x0C, operand: 0, atlasX: 12, atlasY: 0 }); // br
        loop.addGlyph(1, 1, { opcode: 0x0B, operand: 0, atlasX: 11, atlasY: 0 }); // end
        loop.addInputPort('count', 'left', 0, 'i32');
        loop.addInputPort('body', 'top', 0, 'ptr');
        loop.addOutputPort('done', 'right', 0, 'i32');
        this._registerBuilding(loop, 'control');
    }

    // ============================================
    // ACCESSORS
    // ============================================

    /**
     * Get building by name.
     * @param {string} name - Building name (e.g., 'ADD', 'STDIN')
     * @returns {TectonicBuilding|null}
     */
    getBuilding(name) {
        const upperName = name.toUpperCase();
        for (const building of this.buildings.values()) {
            if (building.name === upperName) {
                return building;
            }
        }
        return null;
    }

    /**
     * Get building by ID.
     * @param {string} id - Building ID
     * @returns {TectonicBuilding|null}
     */
    getBuildingById(id) {
        return this.buildings.get(id) || null;
    }

    /**
     * Get all buildings in a category.
     * @param {string} category - Category name
     * @returns {Array<TectonicBuilding>}
     */
    getCategory(category) {
        return this.categories[category] || [];
    }

    /**
     * Get all buildings.
     * @returns {Array<TectonicBuilding>}
     */
    getAllBuildings() {
        return Array.from(this.buildings.values());
    }

    /**
     * List available functions.
     * @returns {Array<Object>} Function info objects
     */
    listFunctions() {
        return this.getAllBuildings().map(b => ({
            name: b.name,
            id: b.id,
            type: b.type,
            inputs: b.inputPorts.map(p => ({ name: p.name, type: p.dataType })),
            outputs: b.outputPorts.map(p => ({ name: p.name, type: p.dataType })),
            origin: { x: b.originX, y: b.originY }
        }));
    }

    // ============================================
    // SERIALIZATION
    // ============================================

    /**
     * Serialize library for persistence.
     * @returns {Object}
     */
    serialize() {
        return {
            buildings: this.getAllBuildings().map(b => b.serialize()),
            categories: Object.fromEntries(
                Object.entries(this.categories).map(([k, v]) => [k, v.map(b => b.id)])
            )
        };
    }

    /**
     * Restore library from serialized data.
     * @param {Object} data - Serialized data
     */
    static deserialize(data) {
        const lib = new GeometricStdLib();
        lib.buildings.clear();

        // Clear categories
        for (const key of Object.keys(lib.categories)) {
            lib.categories[key] = [];
        }

        // Restore buildings
        for (const buildingData of data.buildings) {
            const building = TectonicBuilding.deserialize(buildingData);
            lib.buildings.set(building.id, building);
        }

        // Restore category mappings
        for (const [category, ids] of Object.entries(data.categories || {})) {
            if (lib.categories[category]) {
                lib.categories[category] = ids.map(id => lib.buildings.get(id)).filter(Boolean);
            }
        }

        return lib;
    }

    // ============================================
    // UTILITY
    // ============================================

    /**
     * Find building by coordinate.
     * @param {number} x - X coordinate
     * @param {number} y - Y coordinate
     * @returns {TectonicBuilding|null}
     */
    getBuildingAt(x, y) {
        for (const building of this.buildings.values()) {
            if (x >= building.originX && x < building.originX + building.width &&
                y >= building.originY && y < building.originY + building.height) {
                return building;
            }
        }
        return null;
    }

    /**
     * Get library statistics.
     * @returns {Object}
     */
    getStats() {
        const stats = {
            totalBuildings: this.buildings.size,
            totalGlyphs: 0,
            byCategory: {},
            byType: {}
        };

        for (const [category, buildings] of Object.entries(this.categories)) {
            stats.byCategory[category] = buildings.length;
        }

        for (const building of this.buildings.values()) {
            stats.totalGlyphs += building.glyphs.length;
            stats.byType[building.type] = (stats.byType[building.type] || 0) + 1;
        }

        return stats;
    }
}

// ============================================
// SINGLETON INSTANCE
// ============================================

let _stdlibInstance = null;

/**
 * Get the global standard library instance.
 * @returns {GeometricStdLib}
 */
export function getStdLib() {
    if (!_stdlibInstance) {
        _stdlibInstance = new GeometricStdLib();
    }
    return _stdlibInstance;
}

/**
 * Reset the standard library (for testing).
 */
export function resetStdLib() {
    _stdlibInstance = null;
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GeometricStdLib, getStdLib, resetStdLib };
}
