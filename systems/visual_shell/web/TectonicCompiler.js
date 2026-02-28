/**
 * Geometry OS: Tectonic Compiler
 *
 * Compiles high-level logic (GeoASM) into Tectonic Buildings.
 *
 * Architecture:
 * - Parses GeoASM assembly syntax
 * - Maps instructions to Resonance Glyph opcodes
 * - Generates 2D glyph layouts
 * - Creates I/O ports based on function signature
 *
 * Epoch 2: Tectonic Architecture
 */

import { TectonicBuilding } from './TectonicBuilding.js';

// WebAssembly Opcodes (subset for GeoASM)
const OPCODES = {
    // Control flow
    'nop': 0x01,
    'block': 0x02,
    'loop': 0x03,
    'if': 0x04,
    'else': 0x05,
    'end': 0x0B,
    'br': 0x0C,
    'br_if': 0x0D,
    'return': 0x0F,
    'call': 0x10,

    // Parametric
    'drop': 0x1A,
    'select': 0x1B,

    // Variable access
    'local.get': 0x20,
    'local.set': 0x21,
    'local.tee': 0x22,
    'global.get': 0x23,
    'global.set': 0x24,

    // Memory
    'i32.load': 0x28,
    'i64.load': 0x29,
    'f32.load': 0x2A,
    'f64.load': 0x2B,
    'i32.store': 0x36,
    'i64.store': 0x37,
    'f32.store': 0x38,
    'f64.store': 0x39,
    'memory.size': 0x3F,
    'memory.grow': 0x40,

    // Constants
    'i32.const': 0x41,
    'i64.const': 0x42,
    'f32.const': 0x43,
    'f64.const': 0x44,

    // Comparison (i32)
    'i32.eqz': 0x45,
    'i32.eq': 0x46,
    'i32.ne': 0x47,
    'i32.lt_s': 0x48,
    'i32.lt_u': 0x49,
    'i32.gt_s': 0x4A,
    'i32.gt_u': 0x4B,
    'i32.le_s': 0x4C,
    'i32.le_u': 0x4D,
    'i32.ge_s': 0x4E,
    'i32.ge_u': 0x4F,

    // Comparison (i64)
    'i64.eqz': 0x50,
    'i64.eq': 0x51,
    'i64.ne': 0x52,

    // Numeric (i32)
    'i32.clz': 0x67,
    'i32.ctz': 0x68,
    'i32.popcnt': 0x69,
    'i32.add': 0x6A,
    'i32.sub': 0x6B,
    'i32.mul': 0x6C,
    'i32.div_s': 0x6D,
    'i32.div_u': 0x6E,
    'i32.rem_s': 0x6F,
    'i32.rem_u': 0x70,
    'i32.and': 0x71,
    'i32.or': 0x72,
    'i32.xor': 0x73,
    'i32.shl': 0x74,
    'i32.shr_s': 0x75,
    'i32.shr_u': 0x76,
    'i32.rotl': 0x77,
    'i32.rotr': 0x78,

    // Numeric (f32)
    'f32.abs': 0x8B,
    'f32.neg': 0x8C,
    'f32.ceil': 0x8D,
    'f32.floor': 0x8E,
    'f32.trunc': 0x8F,
    'f32.sqrt': 0x91,
    'f32.add': 0x92,
    'f32.sub': 0x93,
    'f32.mul': 0x94,
    'f32.div': 0x95,
    'f32.min': 0x96,
    'f32.max': 0x97,
    'f32.copysign': 0x98,

    // Conversions
    'i32.wrap_i64': 0xA7,
    'i32.trunc_f32_s': 0xA8,
    'i64.extend_i32_s': 0xAC,
    'f32.convert_i32_s': 0xB2,
};

// Data type mapping
const DATA_TYPES = {
    'i32': 'i32',
    'i64': 'i32',  // Treat as two i32s
    'f32': 'f32',
    'f64': 'f32',  // Treat as two f32s
    'ptr': 'ptr',
    'void': null
};

export class TectonicCompiler {
    constructor() {
        this.errors = [];
        this.warnings = [];
    }

    // ============================================
    // PARSING
    // ============================================

    /**
     * Parse GeoASM source code into AST.
     * @param {string} source - GeoASM source code
     * @returns {Object} Parsed AST
     */
    parse(source) {
        const lines = source.split('\n');
        const ast = {
            functions: [],
            globals: [],
            memory: null
        };

        let currentFunction = null;
        let lineNumber = 0;

        for (const rawLine of lines) {
            lineNumber++;

            // Remove comments
            const line = rawLine.split(';')[0].trim();
            if (!line) continue;

            try {
                // Parse directive
                if (line.startsWith('.')) {
                    this._parseDirective(line, ast);
                    continue;
                }

                // Parse function definition
                const funcMatch = line.match(/^(\w+)\s*:\s*func\s*\(([^)]*)\)\s*(?:->\s*(\w+))?/);
                if (funcMatch) {
                    if (currentFunction) {
                        ast.functions.push(currentFunction);
                    }
                    currentFunction = this._startFunction(funcMatch);
                    continue;
                }

                // Parse instruction
                if (currentFunction) {
                    const instruction = this._parseInstruction(line);
                    if (instruction) {
                        currentFunction.instructions.push(instruction);
                    }
                }
            } catch (e) {
                this.errors.push(`Line ${lineNumber}: ${e.message}`);
            }
        }

        // Close last function
        if (currentFunction) {
            ast.functions.push(currentFunction);
        }

        return ast;
    }

    /**
     * Parse directive.
     */
    _parseDirective(line, ast) {
        const parts = line.slice(1).split(/\s+/);
        const directive = parts[0];

        switch (directive) {
            case 'memory':
                ast.memory = {
                    min: parseInt(parts[1]) || 1,
                    max: parts[2] ? parseInt(parts[2]) : undefined
                };
                break;
            case 'global':
                ast.globals.push({
                    name: parts[1],
                    type: parts[2] || 'i32',
                    value: parts[3] || '0'
                });
                break;
        }
    }

    /**
     * Start a new function.
     */
    _startFunction(match) {
        const name = match[1];
        const params = match[2] ? match[2].split(',').map(p => p.trim()).filter(p => p) : [];
        const returnType = match[3] || null;

        return {
            name,
            params: params.map(p => {
                const parts = p.split(/\s+/);
                return { name: parts[0], type: parts[1] || 'i32' };
            }),
            returnType,
            locals: [],
            instructions: []
        };
    }

    /**
     * Parse a single instruction.
     */
    _parseInstruction(line) {
        // Handle labels
        if (line.endsWith(':')) {
            return { type: 'label', name: line.slice(0, -1) };
        }

        // Parse instruction with operands
        const parts = line.split(/\s+/);
        const opcode = parts[0];

        if (!OPCODES[opcode]) {
            this.warnings.push(`Unknown opcode: ${opcode}`);
            return null;
        }

        const operands = parts.slice(1).map(o => {
            // Try parsing as number
            const num = parseInt(o);
            if (!isNaN(num)) return num;
            // Otherwise it's a label or variable reference
            return o;
        });

        return {
            type: 'instruction',
            opcode,
            opcodeByte: OPCODES[opcode],
            operands
        };
    }

    // ============================================
    // COMPILATION
    // ============================================

    /**
     * Compile GeoASM source to TectonicBuilding.
     * @param {string} source - GeoASM source code
     * @param {Object} options - Compilation options
     * @returns {TectonicBuilding} Compiled building
     */
    compile(source, options = {}) {
        this.errors = [];
        this.warnings = [];

        const originX = options.originX || 0;
        const originY = options.originY || 0;

        // Parse
        const ast = this.parse(source);

        if (this.errors.length > 0) {
            throw new Error(`Compilation errors:\n${this.errors.join('\n')}`);
        }

        // Get main function (or first function)
        const func = ast.functions.find(f => f.name === 'main') || ast.functions[0];
        if (!func) {
            throw new Error('No function found in source');
        }

        // Create building
        const building = new TectonicBuilding({
            id: `func_${func.name}_${Date.now()}`,
            name: func.name.toUpperCase(),
            type: 'function',
            originX,
            originY,
            source
        });

        // Calculate layout
        const layout = this._layoutFunction(func);

        // Set building dimensions
        building.width = layout.width;
        building.height = layout.height;

        // Add glyphs
        for (const glyph of layout.glyphs) {
            building.addGlyph(glyph.relX, glyph.relY, {
                opcode: glyph.opcode,
                operand: glyph.operand,
                atlasX: glyph.atlasX,
                atlasY: glyph.atlasY
            });
        }

        // Add input ports
        for (let i = 0; i < func.params.length; i++) {
            const param = func.params[i];
            building.addInputPort(
                param.name,
                'left',
                i,
                DATA_TYPES[param.type] || 'i32'
            );
        }

        // Add output port
        if (func.returnType && func.returnType !== 'void') {
            building.addOutputPort('result', 'right', 0, DATA_TYPES[func.returnType] || 'i32');
        }

        console.log(`[TectonicCompiler] Compiled '${func.name}': ${layout.glyphs.length} glyphs, ${func.params.length} inputs`);

        return building;
    }

    /**
     * Layout function instructions in 2D grid.
     */
    _layoutFunction(func) {
        const glyphs = [];
        let x = 0;
        let y = 0;
        const maxWidth = 8; // Max instructions per row

        for (const inst of func.instructions) {
            if (inst.type === 'label') {
                // Labels don't take space but mark positions
                continue;
            }

            // Calculate atlas position (simple modulo mapping)
            const atlasX = inst.opcodeByte % 16;
            const atlasY = Math.floor(inst.opcodeByte / 16);

            // Get operand
            const operand = typeof inst.operands[0] === 'number' ? inst.operands[0] : 0;

            glyphs.push({
                relX: x,
                relY: y,
                opcode: inst.opcodeByte,
                operand,
                atlasX,
                atlasY,
                instruction: inst.opcode
            });

            x++;
            if (x >= maxWidth) {
                x = 0;
                y++;
            }
        }

        // Add final row if needed
        if (x > 0) y++;

        return {
            width: maxWidth,
            height: Math.max(1, y),
            glyphs
        };
    }

    // ============================================
    // HIGHER-LEVEL API
    // ============================================

    /**
     * Compile a simple function signature.
     * @param {string} name - Function name
     * @param {string} operator - Operator (+, -, *, /, etc.)
     * @param {Array} params - Parameter types
     * @param {string} returnType - Return type
     * @param {Object} options - Options
     */
    compileOperator(name, operator, params, returnType = 'i32', options = {}) {
        let opcode;
        switch (operator) {
            case '+': opcode = 'i32.add'; break;
            case '-': opcode = 'i32.sub'; break;
            case '*': opcode = 'i32.mul'; break;
            case '/': opcode = 'i32.div_s'; break;
            case '%': opcode = 'i32.rem_s'; break;
            case '&': opcode = 'i32.and'; break;
            case '|': opcode = 'i32.or'; break;
            case '^': opcode = 'i32.xor'; break;
            case '<<': opcode = 'i32.shl'; break;
            case '>>': opcode = 'i32.shr_s'; break;
            case '==': opcode = 'i32.eq'; break;
            case '!=': opcode = 'i32.ne'; break;
            case '<': opcode = 'i32.lt_s'; break;
            case '>': opcode = 'i32.gt_s'; break;
            default:
                throw new Error(`Unknown operator: ${operator}`);
        }

        // Generate GeoASM source
        const paramList = params.map((t, i) => `p${i} ${t}`).join(', ');
        const source = `${name}: func(${paramList}) -> ${returnType}
    local.get 0
    local.get 1
    ${opcode}
    return`;

        return this.compile(source, options);
    }

    /**
     * Create a memory load building.
     */
    createMemoryLoad(type = 'i32', options = {}) {
        const opcode = type === 'f32' ? 'f32.load' : 'i32.load';
        const source = `load: func(addr ptr) -> ${type}
    local.get 0
    ${opcode}
    return`;

        return this.compile(source, options);
    }

    /**
     * Create a memory store building.
     */
    createMemoryStore(type = 'i32', options = {}) {
        const opcode = type === 'f32' ? 'f32.store' : 'i32.store';
        const source = `store: func(addr ptr, value ${type})
    local.get 0
    local.get 1
    ${opcode}
    return`;

        return this.compile(source, options);
    }

    // ============================================
    // BATCH COMPILATION
    // ============================================

    /**
     * Compile multiple functions into buildings.
     * @param {string} source - GeoASM source with multiple functions
     * @param {Object} options - Layout options
     * @returns {Array<TectonicBuilding>} Array of buildings
     */
    compileAll(source, options = {}) {
        const ast = this.parse(source);
        const buildings = [];

        let offsetY = options.originY || 0;
        const spacing = options.spacing || 3;

        for (const func of ast.functions) {
            const building = this.compileFunction(func, {
                ...options,
                originY: offsetY,
                source
            });

            buildings.push(building);
            offsetY += building.height + spacing;
        }

        return buildings;
    }

    /**
     * Compile a single parsed function.
     */
    compileFunction(func, options = {}) {
        const originX = options.originX || 0;
        const originY = options.originY || 0;

        const building = new TectonicBuilding({
            id: `func_${func.name}_${Date.now()}`,
            name: func.name.toUpperCase(),
            type: 'function',
            originX,
            originY,
            source: options.source
        });

        const layout = this._layoutFunction(func);

        building.width = layout.width;
        building.height = layout.height;

        for (const glyph of layout.glyphs) {
            building.addGlyph(glyph.relX, glyph.relY, {
                opcode: glyph.opcode,
                operand: glyph.operand,
                atlasX: glyph.atlasX,
                atlasY: glyph.atlasY
            });
        }

        for (let i = 0; i < func.params.length; i++) {
            const param = func.params[i];
            building.addInputPort(param.name, 'left', i, DATA_TYPES[param.type] || 'i32');
        }

        if (func.returnType && func.returnType !== 'void') {
            building.addOutputPort('result', 'right', 0, DATA_TYPES[func.returnType] || 'i32');
        }

        return building;
    }

    // ============================================
    // UTILITY
    // ============================================

    /**
     * Get compilation errors.
     */
    getErrors() {
        return [...this.errors];
    }

    /**
     * Get compilation warnings.
     */
    getWarnings() {
        return [...this.warnings];
    }

    /**
     * Check if last compilation had errors.
     */
    hasErrors() {
        return this.errors.length > 0;
    }
}

// ============================================
// GEOASM STANDARD LIBRARY
// ============================================

export const GeoASMLibrary = {
    /**
     * Generate common function sources.
     */
    templates: {
        add: `add: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.add
    return`,

        subtract: `sub: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.sub
    return`,

        multiply: `mul: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.mul
    return`,

        divide: `div: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.div_s
    return`,

        modulo: `mod: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.rem_s
    return`,

        and: `and: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.and
    return`,

        or: `or: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.or
    return`,

        xor: `xor: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.xor
    return`,

        not: `not: func(a i32) -> i32
    local.get 0
    i32.const -1
    i32.xor
    return`,

        equals: `eq: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.eq
    return`,

        lessThan: `lt: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.lt_s
    return`,

        greaterThan: `gt: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.gt_s
    return`,

        load: `load: func(addr ptr) -> i32
    local.get 0
    i32.load
    return`,

        store: `store: func(addr ptr, value i32)
    local.get 0
    local.get 1
    i32.store
    return`,

        increment: `inc: func(val i32) -> i32
    local.get 0
    i32.const 1
    i32.add
    return`,

        decrement: `dec: func(val i32) -> i32
    local.get 0
    i32.const 1
    i32.sub
    return`,

        double: `double: func(val i32) -> i32
    local.get 0
    i32.const 2
    i32.mul
    return`,

        square: `square: func(val i32) -> i32
    local.get 0
    local.get 0
    i32.mul
    return`,

        abs: `abs: func(val i32) -> i32
    local.get 0
    i32.const 31
    i32.shr_s
    local.get 0
    i32.add
    local.get 0
    local.get 0
    i32.const 31
    i32.shr_s
    i32.xor
    i32.sub
    return`,

        max: `max: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.gt_s
    if
        local.get 0
    else
        local.get 1
    end
    return`,

        min: `min: func(a i32, b i32) -> i32
    local.get 0
    local.get 1
    i32.lt_s
    if
        local.get 0
    else
        local.get 1
    end
    return`,

        swap: `swap: func(addr ptr)
    local.get 0
    i32.load
    local.get 0
    i32.load
    local.get 0
    i32.store
    return`,

        factorial: `factorial: func(n i32) -> i32
    local.get 0
    i32.const 1
    i32.le_s
    if
        i32.const 1
    else
        local.get 0
        local.get 0
        i32.const 1
        i32.sub
        call factorial
        i32.mul
    end
    return`
    },

    /**
     * Get all standard library templates.
     */
    getAll() {
        return Object.entries(this.templates).map(([name, source]) => ({
            name,
            source
        }));
    }
};

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { TectonicCompiler, GeoASMLibrary };
}
