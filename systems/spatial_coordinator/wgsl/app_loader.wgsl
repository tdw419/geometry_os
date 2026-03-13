// app_loader.wgsl
// Application header parsing and region loading for Spatial Coordinator
//
// NOTE: WGSL does not not support #include. This file is concatenated at build time with:
//   interrupt_injector.wgsl, syscall_handler.wgsl, coordinator.wgsl
// See: build_shaders.py

struct AppHeader {
    magic: vec4<u32>,      // "GEOS" as 4 u32s
    width: u32,
    height: u32,
    mem_size: u32,
    entry_x: u32,
    entry_y: u32,
    handler_table_offset: u32,
    flags: u32,
}

// Capability flag bits
const WANTS_KEYBOARD: u32 = 1u;
const WANTS_MOUSE: u32 = 2u;
const WANTS_HOVER: u32 = 4u;
const CAN_RESIZE: u32 = 8u;
const CAN_SPAWN: u32 = 16u;

@group(0) @binding(0) var<storage, read> app_registry: array<AppHeader>;
@group(0) @binding(2) var<storage, read> app_binary: array<u32>;
@group(0) @binding(3) var<uniform> map_width: u32;
@group(0) @binding(4) var<uniform> map_height: u32;

const HEADER_SIZE: u32 = 16u;
const GEOS_MAGIC: u32 = 0x534F4F53u; // "GEOS" as u32

fn parse_header(app_id: u32) -> AppHeader {
    return app_registry[app_id];
}

fn has_capability(flags: u32, flag: u32) -> bool {
    return (flags & flag) != 0u;
}

fn app_to_global(app_id: u32, local_x: u32, local_y: u32) -> vec2<u32> {
    let header = app_registry[app_id];
    let global_x = header.entry_x + local_x;
    let global_y = header.entry_y + local_y;
    return vec2<u32>(global_x, global_y);
}

fn load_app_region(app_id: u32, target_x: u32, target_y: u32) {
    let header = app_registry[app_id];
    let width = header.width;
    let height = header.height;

    // Copy app glyphs to map region
    for (var y = 0u; y < height; y++) {
        for (var x = 0u; x < width; x++) {
            let local_idx = y * width + x;
            let global_x = target_x + x;
            let global_y = target_y + y;
            let global_idx = global_y * map_width + global_x;

            // Copy glyph (would be actual storage write in real impl)
        }
    }
}
