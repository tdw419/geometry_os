/**
 * IDE Tile Types Registry
 *
 * Defines IDE-specific tile types for the Visual Builder.
 * Each type has visual properties, icons, and semantic tags.
 *
 * @module ide_tile_types
 * @phase Phase J.2: Neural IDE
 */

/**
 * IDE Tile Type definitions
 * @type {Object.<string, Object>}
 */
const IDETileTypes = {
    code_editor: {
        name: 'Code Editor',
        color: 0x00ff88,
        icon: '📝',
        semantic_tags: ['code', 'edit', 'syntax', 'highlight'],
        description: 'Syntax-highlighted code editing with multi-file support',
        connection_inputs: ['file_data', 'cursor_position'],
        connection_outputs: ['file_content', 'cursor_move']
    },

    file_browser: {
        name: 'File Browser',
        color: 0x00ffff,
        icon: '📁',
        semantic_tags: ['files', 'navigation', 'tree', 'directory'],
        description: 'Tree-structured file system navigation',
        connection_inputs: ['root_path', 'filter'],
        connection_outputs: ['file_path', 'file_data']
    },

    terminal: {
        name: 'Terminal',
        color: 0xff8800,
        icon: '⌘',
        semantic_tags: ['shell', 'command', 'repl', 'execute'],
        description: 'Interactive shell/REPL for command execution',
        connection_inputs: ['command', 'stdin'],
        connection_outputs: ['stdout', 'stderr', 'exit_code']
    },

    debugger: {
        name: 'Debugger',
        color: 0xff00ff,
        icon: '🐛',
        semantic_tags: ['debug', 'breakpoint', 'inspect', 'step'],
        description: 'Breakpoint management and variable inspection',
        connection_inputs: ['source_file', 'line_number'],
        connection_outputs: ['breakpoint', 'variable_value', 'call_stack']
    },

    output_panel: {
        name: 'Output Panel',
        color: 0xffff00,
        icon: '📊',
        semantic_tags: ['output', 'build', 'test', 'log'],
        description: 'Build and test output display',
        connection_inputs: ['log_stream', 'error_stream'],
        connection_outputs: ['filtered_output']
    },

    semantic_nav: {
        name: 'Semantic Navigator',
        color: 0x88ff88,
        icon: '🧭',
        semantic_tags: ['navigate', 'semantic', 'concept', 'jump'],
        description: 'Navigate code by semantic concepts',
        connection_inputs: ['query', 'context'],
        connection_outputs: ['location', 'definition']
    }
};

/**
 * Validate if a tile type is a known IDE tile type
 * @param {string} type - Tile type to validate
 * @returns {boolean} - True if valid IDE tile type
 */
function validateTileType(type) {
    return type in IDETileTypes;
}

/**
 * Get tile type information
 * @param {string} type - Tile type name
 * @returns {Object|null} - Tile type info or null if not found
 */
function getTileTypeInfo(type) {
    return IDETileTypes[type] || null;
}

/**
 * Get all IDE tile type names
 * @returns {string[]} - Array of tile type names
 */
function getIDETileTypeNames() {
    return Object.keys(IDETileTypes);
}

/**
 * Get tile types that can accept a specific connection type
 * @param {string} connectionType - Connection type to match
 * @returns {string[]} - Tile types that accept this connection
 */
function getTilesAcceptingConnection(connectionType) {
    return Object.entries(IDETileTypes)
        .filter(([_, info]) => info.connection_inputs?.includes(connectionType))
        .map(([name, _]) => name);
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        IDETileTypes,
        validateTileType,
        getTileTypeInfo,
        getIDETileTypeNames,
        getTilesAcceptingConnection
    };
}
