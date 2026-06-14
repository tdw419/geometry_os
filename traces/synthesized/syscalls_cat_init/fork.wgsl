
// Auto-generated from 1 fork() syscalls
// Original xv6: fork() → ECALL_U → kernel process table → child PID
// Pixel-native: Direct spatial process table manipulation

const PROCESS_TABLE_BASE: u32 = 262144;  // Process table base address
const PROCESS_TABLE_SIZE: u32 = 1024;    // Max processes
const PROCESS_ENTRY_SIZE: u32 = 256;     // Bytes per process entry

@group(0) @binding(0) var<storage, read_write> memory_palace: array<vec4<u32>>;

struct ProcessEntry {
    state: u32,
    pid: u32,
    parent_pid: u32,
    page_table_root: u32,
    heap_start: u32,
    heap_end: u32,
}

@compute @workgroup_size(1)
fn fork_process(@builtin(global_invocation_id) gid: vec3<u32>) {
    let parent_idx = params.process_idx;
    let parent_entry_offset = PROCESS_TABLE_BASE + (parent_idx * PROCESS_ENTRY_SIZE / 4u);

    // Find free process table entry
    let child_idx = find_free_process_slot();
    if (child_idx == u32(-1)) {
        // No free slots, return error
        return;
    }

    let child_entry_offset = PROCESS_TABLE_BASE + (child_idx * PROCESS_ENTRY_SIZE / 4u);

    // Copy parent state to child (pixel-level memory copy)
    let parent_state = memory_palace[parent_entry_offset];
    let parent_pid = memory_palace[parent_entry_offset + 1].r;
    let parent_page_table = memory_palace[parent_entry_offset + 2].r;

    // Initialize child state
    memory_palace[child_entry_offset] = vec4<u32>(1u, parent_pid, parent_page_table, 0u);  // state=RUNNING, parent_pid

    // Copy page table (Hilbert region duplication)
    let page_table_base = parent_page_table;
    let page_table_size = 4096u;  // One page of page table entries

    for (var i: u32 = 0u; i < page_table_size; i++) {
        let src_coord = page_table_base + i;
        let dst_coord = page_table_base + page_table_size + i;
        memory_palace[dst_coord] = memory_palace[src_coord];
    }

    // Set return values
    // Parent gets child PID
    // Child gets 0
}

fn find_free_process_slot() -> u32 {
    for (var i: u32 = 0u; i < PROCESS_TABLE_SIZE; i++) {
        let offset = PROCESS_TABLE_BASE + (i * PROCESS_ENTRY_SIZE / 4u);
        let state = memory_palace[offset].r;

        if (state == 0u) {  // FREE
            return i;
        }
    }
    return u32(-1);  // No free slots
}
