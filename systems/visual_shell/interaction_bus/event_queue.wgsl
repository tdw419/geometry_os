// Visual Interaction Bus - Event Consumer Shader
//
// Consumes input events from VRAM queue and updates window table.
// This shader runs every frame to process pending events.

const EVENT_QUEUE_SIZE: u32 = 1024u;
const MAX_WINDOWS: u32 = 256u;

// Event types (must match EventType in input_types.rs)
const EVENT_NONE: u32         = 0u;
const EVENT_MOUSE_MOVE: u32   = 1u;
const EVENT_MOUSE_DOWN: u32   = 2u;
const EVENT_MOUSE_UP: u32     = 3u;
const EVENT_KEY_DOWN: u32     = 4u;
const EVENT_KEY_UP: u32       = 5u;
const EVENT_WINDOW_FOCUS: u32 = 6u;
const EVENT_WINDOW_DRAG: u32  = 7u;

struct InputEvent {
    timestamp_ns_low: u32,
    timestamp_ns_high: u32,
    event_type: u32,
    device_id: u32,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    code: u32,
    modifiers: u32,
};

struct EventQueueHeader {
    head: u32,
    tail: u32,
    capacity: u32,
    _padding: u32,
};

struct WindowState {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
    z_order: u32,
    focused: u32,
    window_id: u32,
    _padding: u32,
};

struct GlobalState {
    mouse_x: f32,
    mouse_y: f32,
    focused_id: u32,
    drag_id: u32,
};

@group(0) @binding(0) var<storage, read_write> header: EventQueueHeader;
@group(0) @binding(1) var<storage, read> queue: array<InputEvent, EVENT_QUEUE_SIZE>;
@group(0) @binding(2) var<storage, read_write> window_table: array<WindowState, MAX_WINDOWS>;
@group(0) @binding(3) var<storage, read_write> global: GlobalState;

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Process all events since last frame
    while (header.tail != header.head) {
        let event = queue[header.tail];
        
        process_event(event);
        
        header.tail = (header.tail + 1u) % header.capacity;
    }
}

fn process_event(event: InputEvent) {
    if (event.event_type == EVENT_MOUSE_MOVE) {
        global.mouse_x = event.x;
        global.mouse_y = event.y;
        
        if (global.drag_id != 0xffffffffu) {
            // Update window position if dragging
            let idx = find_window_index(global.drag_id);
            if (idx < MAX_WINDOWS) {
                window_table[idx].x = window_table[idx].x + event.dx;
                window_table[idx].y = window_table[idx].y + event.dy;
            }
        }
    } else if (event.event_type == EVENT_MOUSE_DOWN) {
        // Hit test to find the top window
        let hit_id = perform_hit_test(event.x, event.y);
        
        if (hit_id != 0xffffffffu) {
            global.focused_id = hit_id;
            global.drag_id = hit_id;
            update_z_order(hit_id);
        } else {
            global.focused_id = 0xffffffffu;
            global.drag_id = 0xffffffffu;
        }
    } else if (event.event_type == EVENT_MOUSE_UP) {
        global.drag_id = 0xffffffffu;
    }
}

fn perform_hit_test(x: f32, y: f32) -> u32 {
    var top_id: u32 = 0xffffffffu;
    var max_z: u32 = 0u;
    
    for (var i: u32 = 0u; i < MAX_WINDOWS; i = i + 1u) {
        let win = window_table[i];
        if (win.window_id == 0u) { continue; }
        
        if (x >= win.x && x <= win.x + win.width && y >= win.y && y <= win.y + win.height) {
            if (win.z_order >= max_z) {
                max_z = win.z_order;
                top_id = win.window_id;
            }
        }
    }
    
    return top_id;
}

fn update_z_order(focused_id: u32) {
    var max_z: u32 = 0u;
    for (var i: u32 = 0u; i < MAX_WINDOWS; i = i + 1u) {
        if (window_table[i].window_id != 0u) {
            max_z = max(max_z, window_table[i].z_order);
        }
    }
    
    let idx = find_window_index(focused_id);
    if (idx < MAX_WINDOWS) {
        window_table[idx].z_order = max_z + 1u;
        window_table[idx].focused = 1u;
    }
    
    // Unfocus others
    for (var i: u32 = 0u; i < MAX_WINDOWS; i = i + 1u) {
        if (i != idx && window_table[i].window_id != 0u) {
            window_table[i].focused = 0u;
        }
    }
}

fn find_window_index(id: u32) -> u32 {
    for (var i: u32 = 0u; i < MAX_WINDOWS; i = i + 1u) {
        if (window_table[i].window_id == id) {
            return i;
        }
    }
    return 0xffffffffu;
}
