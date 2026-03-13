// syscall_handler.wgsl
// Syscall processing for Spatial Coordinator
//
// NOTE: WGSL does not not support #include. This file is concatenated at build time with:
//   interrupt_injector.wgsl, app_loader.wgsl, coordinator.wgsl
// See: build_shaders.py

struct SyscallRequest {
    app_id: u32,
    syscall_id: u32,
    arg1: u32,
    arg2: u32,
    return_value: atomic<u32>,
}

// Syscall IDs
const SYS_RESIZE: u32 = 1u;
const SYS_CLOSE: u32 = 2u;
const SYS_SPAWN: u32 = 3u;
const SYS_READ_CLIP: u32 = 4u;
const SYS_WRITE_CLIP: u32 = 5u;
const SYS_GET_TIME: u32 = 6u;
const SYS_REQUEST_FOCUS: u32 = 7u;
const SYS_YIELD_FOCUS: u32 = 8u;

// Error codes
const ERR_SUCCESS: u32 = 0u;
const ERR_INVALID_ARGS: u32 = 1u;
const ERR_OUT_OF_MEMORY: u32 = 2u;
const ERR_PERMISSION_DENIED: u32 = 3u;
const ERR_NOT_FOUND: u32 = 4u;

const MAX_QUEUE_DEPTH: u32 = 16u;

@group(0) @binding(5) var<storage, read_write> syscall_queue: array<SyscallRequest>;
@group(0) @binding(6) var<uniform> frame_count: u32;

var<private> queue_depth: u32 = 0u;

fn enqueue_syscall(req: SyscallRequest) -> bool {
    if (queue_depth >= MAX_QUEUE_DEPTH) {
        // Drop oldest (index 0)
        for (var i = 0u; i < MAX_QUEUE_DEPTH - 1u; i++) {
            syscall_queue[i] = syscall_queue[i + 1];
        }
        syscall_queue[MAX_QUEUE_DEPTH - 1] = req;
        queue_depth++;
        return true;
    }
    syscall_queue[queue_depth] = req;
    queue_depth++;
    return false
}

 return true;
}

fn process_syscall(req: ptr<function<u32>) -> u32 {
    let syscall = *syscall_queue[req_idx];

    switch syscall.syscall_id {
        case SYS_GET_TIME: {
            syscall.return_value = frame_count;
            return ERR_SUCCESS;
        }
        case SYS_RESIZE: {
            // Mark for host processing
            syscall.return_value = 1u; // Pending
            return ERR_SUCCESS
        }
        case SYS_CLOSE: {
            // Mark app for closure
            syscall.return_value = 0u;
            return ERR_SUCCESS
        }
        case SYS_REQUEST_FOCUS: {
                // Focus arbitration handled by coordinator
            syscall.return_value = 1u; // Pending
            return ERR_SUCCESS
        }
        case SYS_YIELD_FOCUS: {
                syscall.return_value = 0u;
            return ERR_SUCCESS
        }
        default: {
            return ERR_INVALID_ARGS
        }
    }
}

fn process_all_syscalls() {
    var idx = 0u;
    while (idx < queue_depth) {
        let req = &syscall_queue[idx];
        process_syscall(idx);
        idx++;
    }
    queue_depth = 0u;
}
