// ============================================
// GEOMETRY OS - INTERRUPT INJECTOR
// Spatial Program Coordinator
// Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
//
// Events (keyboard, mouse) are injected as spatial glyphs that propagate
// until caught by a handler (@INT_HANDLER).
// ============================================

// Interrupt type constants
const INT_TYPE_KEYBOARD: u32 = 1u;   // 0x01
const INT_TYPE_MOUSE: u32 = 2u;      // 0x02

// Opcode constants
const OP_INT: u32 = 16u;             // 0x10 - Interrupt opcode
const OP_HANDLER: u32 = 17u;         // 0x11 - Handler marker (@INT_HANDLER)
const OP_NOP: u32 = 0u;              // No-op

// Propagation limits
const MAX_TTL: u32 = 64u;            // Max GPU ticks for propagation

// Interrupt packet structure (stored in spatial data)
// Wire format is 5 bytes: type(u8), payload(u8), timestamp(u16 LE), source(u8)
// In GPU memory we use u32 for alignment
struct Interrupt {
    int_type: u32,    // 0x01=KEYBOARD, 0x02=MOUSE
    payload: u32,     // Keycode or button ID
    timestamp: u32,   // Frame counter
    source: u32,      // Device seat ID
    x: u32,           // X coordinate in infinite map
    y: u32,           // Y coordinate in infinite map
    ttl: u32,         // Time-to-live in GPU ticks
}

// Interrupt queue for incoming events from host
struct InterruptQueue {
    count: u32,       // Number of pending interrupts
    _pad: u32,
    _pad2: u32,
    _pad3: u32,
    interrupts: array<Interrupt>,
}

// Handler table entry for fast handler lookup
struct HandlerEntry {
    x: u32,           // Handler X coordinate
    y: u32,           // Handler Y coordinate
    int_type: u32,    // Handler accepts this interrupt type
    active: u32,      // Is this entry valid?
}

// Handler table for registered @INT_HANDLER coordinates
struct HandlerTable {
    count: u32,
    _pad: u32,
    _pad2: u32,
    _pad3: u32,
    handlers: array<HandlerEntry>,
}

// Map metadata for propagation state
// Each cell stores: opcode in lower 8 bits, interrupt data in upper 24 bits
// When an interrupt is present, cell value = (interrupt_id << 8) | OP_INT

// Bindings
@group(0) @binding(0) var<storage, read_write> infinite_map: array<u32>;
@group(0) @binding(1) var<storage, read> interrupt_queue: InterruptQueue;
@group(0) @binding(2) var<storage, read> handler_table: HandlerTable;
@group(0) @binding(3) var<uniform> map_width: u32;
@group(0) @binding(4) var<uniform> map_height: u32;
@group(0) @binding(5) var<uniform> frame_count: u32;

// Active interrupt buffer for propagation (double-buffered)
@group(0) @binding(6) var<storage, read> active_interrupts_in: array<Interrupt>;
@group(0) @binding(7) var<storage, read_write> active_interrupts_out: array<Interrupt>;
@group(0) @binding(8) var<storage, read_write> active_count: atomic<u32>;

// ============================================
// UTILITY FUNCTIONS
// ============================================

/// Convert 2D coordinates to linear index
fn coord_to_index(x: u32, y: u32) -> u32 {
    return y * map_width + x;
}

/// Check if coordinates are within map bounds
fn in_bounds(x: u32, y: u32) -> bool {
    return x < map_width && y < map_height;
}

/// Extract opcode from a map cell
fn get_opcode(cell: u32) -> u32 {
    return cell & 0xFFu;
}

/// Check if cell is an interrupt handler
fn is_handler(cell: u32) -> bool {
    return get_opcode(cell) == OP_HANDLER;
}

/// Check if cell contains a propagating interrupt
fn is_interrupt(cell: u32) -> bool {
    return get_opcode(cell) == OP_INT;
}

// ============================================
// INTERRUPT INJECTION
// ============================================

/// Inject pending interrupts from host into the infinite map
/// Called once per frame to process new events
@compute @workgroup_size(64)
fn inject_interrupts(@builtin(global_invocation_id) gid: vec3<u32>) {
    let queue_idx = gid.x;

    // Bounds check
    if (queue_idx >= interrupt_queue.count) { return; }

    let interrupt = interrupt_queue.interrupts[queue_idx];

    // Validate coordinates
    if (!in_bounds(interrupt.x, interrupt.y)) { return; }

    // Check if there's a handler at this location (optimization)
    // If so, we can deliver directly instead of propagating
    let cell_idx = coord_to_index(interrupt.x, interrupt.y);
    let cell = infinite_map[cell_idx];

    if (is_handler(cell)) {
        // Direct delivery - handler is right here
        // Write interrupt data to handler's registers
        // In a full implementation, this would trigger handler execution
        // For now, we mark the cell with the interrupt opcode
        infinite_map[cell_idx] = OP_INT | (interrupt.int_type << 8u);
        return;
    }

    // No handler at injection point - add to active propagation buffer
    let out_idx = atomicAdd(&active_count, 1u);
    if (out_idx < 4096u) {  // Max active interrupts
        var new_interrupt: Interrupt;
        new_interrupt.int_type = interrupt.int_type;
        new_interrupt.payload = interrupt.payload;
        new_interrupt.timestamp = interrupt.timestamp;
        new_interrupt.source = interrupt.source;
        new_interrupt.x = interrupt.x;
        new_interrupt.y = interrupt.y;
        new_interrupt.ttl = MAX_TTL;
        active_interrupts_out[out_idx] = new_interrupt;

        // Mark map cell with interrupt
        infinite_map[cell_idx] = OP_INT | (out_idx << 8u);
    }
}

// ============================================
// INTERRUPT PROPAGATION
// ============================================

/// Propagate active interrupts to 4-connected neighbors
/// Each GPU tick, interrupts spread one cell in all 4 directions
/// Propagation stops when reaching a handler or TTL expires
@compute @workgroup_size(64)
fn propagate_interrupts(@builtin(global_invocation_id) gid: vec3<u32>) {
    let int_idx = gid.x;

    // Read current active count (from previous frame)
    let active_in_count = atomicLoad(&active_count);
    if (int_idx >= active_in_count) { return; }

    let interrupt = active_interrupts_in[int_idx];

    // Check TTL - expired interrupts are silently discarded
    if (interrupt.ttl == 0u) { return; }

    // Get 4-connected neighbors: up, down, left, right
    let neighbors = array<vec2<u32>, 4>(
        vec2(interrupt.x, interrupt.y - 1u),  // up
        vec2(interrupt.x, interrupt.y + 1u),  // down
        vec2(interrupt.x - 1u, interrupt.y),  // left
        vec2(interrupt.x + 1u, interrupt.y),  // right
    );

    // Propagate to each neighbor
    for (var i = 0u; i < 4u; i++) {
        let nx = neighbors[i].x;
        let ny = neighbors[i].y;

        // Skip out-of-bounds
        if (!in_bounds(nx, ny)) { continue; }

        let cell_idx = coord_to_index(nx, ny);
        let cell = infinite_map[cell_idx];

        // Check for handler - propagation stops here
        if (is_handler(cell)) {
            // Handler found - deliver interrupt
            // In full implementation, this would trigger handler execution
            // Mark handler cell with pending interrupt type
            infinite_map[cell_idx] = OP_HANDLER | (interrupt.int_type << 8u);
            continue;
        }

        // Check if cell already has an interrupt (no double-propagation)
        if (is_interrupt(cell)) { continue; }

        // Propagate interrupt to neighbor with decremented TTL
        let out_idx = atomicAdd(&active_count, 1u);
        if (out_idx < 4096u) {
            var propagated: Interrupt;
            propagated.int_type = interrupt.int_type;
            propagated.payload = interrupt.payload;
            propagated.timestamp = interrupt.timestamp;
            propagated.source = interrupt.source;
            propagated.x = nx;
            propagated.y = ny;
            propagated.ttl = interrupt.ttl - 1u;
            active_interrupts_out[out_idx] = propagated;

            // Mark map cell
            infinite_map[cell_idx] = OP_INT | (out_idx << 8u);
        }
    }
}

// ============================================
// HANDLER LOOKUP (OPTIMIZATION)
// ============================================

/// Fast handler lookup for apps with registered handler tables
/// Instead of wavefront propagation, directly find handler coordinates
fn find_handler_for_type(int_type: u32, app_origin_x: u32, app_origin_y: u32,
                          app_width: u32, app_height: u32) -> vec2<u32> {
    // Search handler table for matching type within app bounds
    for (var i = 0u; i < handler_table.count; i++) {
        let handler = handler_table.handlers[i];
        if (handler.int_type == int_type && handler.active == 1u) {
            // Check if handler is within app region
            if (handler.x >= app_origin_x &&
                handler.x < app_origin_x + app_width &&
                handler.y >= app_origin_y &&
                handler.y < app_origin_y + app_height) {
                return vec2(handler.x, handler.y);
            }
        }
    }
    // No handler found
    return vec2(0xFFFFFFFFu, 0xFFFFFFFFu);
}

/// Direct delivery optimization for registered handlers
/// Bypasses wavefront propagation when handler coordinates are known
@compute @workgroup_size(64)
fn deliver_to_handlers(@builtin(global_invocation_id) gid: vec3<u32>) {
    let queue_idx = gid.x;

    if (queue_idx >= interrupt_queue.count) { return; }

    let interrupt = interrupt_queue.interrupts[queue_idx];

    // Find handler for this interrupt type near injection point
    // Search in expanding rings around injection point
    for (var radius = 0u; radius < MAX_TTL; radius++) {
        let handler_pos = find_handler_in_radius(
            interrupt.x, interrupt.y, interrupt.int_type, radius
        );
        if (handler_pos.x != 0xFFFFFFFFu) {
            // Handler found - deliver directly
            let cell_idx = coord_to_index(handler_pos.x, handler_pos.y);
            infinite_map[cell_idx] = OP_HANDLER | (interrupt.int_type << 8u);
            return;
        }
    }
    // No handler found within TTL - interrupt expires
}

/// Search for handler in a ring at given radius from center
fn find_handler_in_radius(cx: u32, cy: u32, int_type: u32, radius: u32) -> vec2<u32> {
    if (radius == 0u) {
        // Check center point
        if (in_bounds(cx, cy)) {
            let cell_idx = coord_to_index(cx, cy);
            let cell = infinite_map[cell_idx];
            if (is_handler(cell)) {
                return vec2(cx, cy);
            }
        }
        return vec2(0xFFFFFFFFu, 0xFFFFFFFFu);
    }

    // Search ring at radius
    // Top and bottom edges
    for (var dx = 0u - min(radius, cx); dx <= min(radius, map_width - cx - 1u); dx++) {
        let x = cx + dx;

        // Top edge
        if (cy >= radius) {
            let y = cy - radius;
            let cell_idx = coord_to_index(x, y);
            let cell = infinite_map[cell_idx];
            if (is_handler(cell)) {
                // Check if handler type matches
                for (var h = 0u; h < handler_table.count; h++) {
                    let handler = handler_table.handlers[h];
                    if (handler.x == x && handler.y == y &&
                        handler.int_type == int_type && handler.active == 1u) {
                        return vec2(x, y);
                    }
                }
            }
        }

        // Bottom edge
        if (cy + radius < map_height) {
            let y = cy + radius;
            let cell_idx = coord_to_index(x, y);
            let cell = infinite_map[cell_idx];
            if (is_handler(cell)) {
                for (var h = 0u; h < handler_table.count; h++) {
                    let handler = handler_table.handlers[h];
                    if (handler.x == x && handler.y == y &&
                        handler.int_type == int_type && handler.active == 1u) {
                        return vec2(x, y);
                    }
                }
            }
        }
    }

    // Left and right edges (excluding corners already checked)
    for (var dy = 1u; dy < radius; dy++) {
        // Left edge
        if (cx >= radius) {
            let x = cx - radius;
            let y_top = cy - min(dy, cy);
            let y_bot = cy + min(dy, map_height - cy - 1u);

            for (var y = y_top; y <= y_bot; y += max(1u, 2u * dy - 1u)) {
                if (in_bounds(x, y)) {
                    let cell_idx = coord_to_index(x, y);
                    let cell = infinite_map[cell_idx];
                    if (is_handler(cell)) {
                        for (var h = 0u; h < handler_table.count; h++) {
                            let handler = handler_table.handlers[h];
                            if (handler.x == x && handler.y == y &&
                                handler.int_type == int_type && handler.active == 1u) {
                                return vec2(x, y);
                            }
                        }
                    }
                }
            }
        }

        // Right edge
        if (cx + radius < map_width) {
            let x = cx + radius;
            let y_top = cy - min(dy, cy);
            let y_bot = cy + min(dy, map_height - cy - 1u);

            for (var y = y_top; y <= y_bot; y += max(1u, 2u * dy - 1u)) {
                if (in_bounds(x, y)) {
                    let cell_idx = coord_to_index(x, y);
                    let cell = infinite_map[cell_idx];
                    if (is_handler(cell)) {
                        for (var h = 0u; h < handler_table.count; h++) {
                            let handler = handler_table.handlers[h];
                            if (handler.x == x && handler.y == y &&
                                handler.int_type == int_type && handler.active == 1u) {
                                return vec2(x, y);
                            }
                        }
                    }
                }
            }
        }
    }

    return vec2(0xFFFFFFFFu, 0xFFFFFFFFu);
}

// ============================================
// CLEAR PROPAGATION STATE
// ============================================

/// Clear interrupt markers from map cells (end of frame cleanup)
@compute @workgroup_size(64)
fn clear_interrupts(@builtin(global_invocation_id) gid: vec3<u32>) {
    let cell_idx = gid.x;
    let total_cells = map_width * map_height;

    if (cell_idx >= total_cells) { return; }

    let cell = infinite_map[cell_idx];

    // Clear interrupt markers (keep original opcodes)
    if (is_interrupt(cell)) {
        infinite_map[cell_idx] = OP_NOP;
    }
}
