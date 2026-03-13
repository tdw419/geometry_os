// ============================================
// GEOMETRY OS - GLYPH DISTRIBUTED SHADER
// Phase 70: Multi-Node Swarm Substrate
// ============================================
//
// This shader enables multi-GPU / distributed execution of glyph programs.
// Each node processes a portion of the work and coordinates via atomics.
//
// Distributed Execution Model:
// - Program texture is shared across all nodes
// - Each node is assigned a work range (work_offset to work_offset + work_count)
// - Agents can steal work from other nodes (work stealing)
// - Results are aggregated atomically

// ============================================
// BINDINGS
// ============================================

// Binding 0: Program texture shared across nodes
@group(0) @binding(0) var program_texture: texture_2d<f32>;

// Binding 1: Distributed state with synchronization primitives
struct DistributedState {
    node_id: u32,           // Unique ID for this GPU/node
    total_nodes: u32,       // Total number of nodes in the cluster
    work_offset: u32,       // Starting work item index for this node
    work_count: u32,        // Number of work items assigned to this node
    global_cycle: atomic<u32>,  // Global cycle counter across all nodes
    sync_barrier: atomic<u32>,  // Barrier synchronization counter
    result_aggregate: atomic<u32>, // Aggregated results from all nodes
}
@group(0) @binding(1) var<storage, read_write> state: DistributedState;

// Binding 2: Shared memory visible across nodes
@group(0) @binding(2) var<storage, read_write> shared_memory: array<u32>;

// Binding 3: Output texture for visual display
@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Binding 4: Work queue for distributed task scheduling
struct WorkQueue {
    head: atomic<u32>,      // Next work item to claim
    tail: atomic<u32>,      // Where to add new work
    total_work: u32,        // Total work items in queue
}
@group(0) @binding(4) var<storage, read_write> work_queue: WorkQueue;

// Binding 5: Node communication buffer
@group(0) @binding(5) var<storage, read_write> node_buffer: array<u32>;

// ============================================
// OPCODES
// ============================================

// Core opcodes
const OP_DATA: u32 = 9u;
const OP_ADD: u32 = 200u;
const OP_SUB: u32 = 201u;
const OP_MUL: u32 = 202u;
const OP_BRANCH: u32 = 6u;
const OP_BNZ: u32 = 209u;
const OP_HALT: u32 = 255u;

// Distributed opcodes
const OP_SYNC: u32 = 230u;  // Barrier synchronization
const OP_SEND: u32 = 231u;  // Send to another node
const OP_RECV: u32 = 232u;  // Receive from another node
const OP_STEAL: u32 = 233u; // Steal work from queue

// ============================================
// HELPER FUNCTIONS
// ============================================

fn fetch_instruction(pc: u32) -> vec4<u32> {
    let dims = textureDimensions(program_texture);
    let x = pc % dims.x;
    let y = pc / dims.x;

    let pixel = textureLoad(program_texture, vec2<i32>(i32(x), i32(y)), 0);

    return vec4<u32>(
        u32(pixel.r * 255.0 + 0.5),
        u32(pixel.g * 255.0 + 0.5),
        u32(pixel.b * 255.0 + 0.5),
        u32(pixel.a * 255.0 + 0.5),
    );
}

// Check if this agent belongs to this node's work range
fn belongs_to_node(agent_id: u32) -> bool {
    return agent_id >= state.work_offset &&
           agent_id < (state.work_offset + state.work_count);
}

// Barrier synchronization: wait for all nodes to reach this point
fn barrier_sync() {
    let my_node = state.node_id;
    let total = state.total_nodes;

    // Increment the barrier counter
    let arrived = atomicAdd(&state.sync_barrier, 1u);

    // Wait until all nodes have arrived
    // Note: In real GPU execution, this would need a timeout
    var waiting = 0u;
    while (atomicLoad(&state.sync_barrier) < total && waiting < 100000u) {
        waiting = waiting + 1u;
    }
}

// Try to steal work from the global queue
fn steal_work() -> u32 {
    let current_head = atomicLoad(&work_queue.head);
    let current_tail = atomicLoad(&work_queue.tail);

    if (current_head >= current_tail) {
        return 0xFFFFFFFFu; // No work available
    }

    // Atomically claim a work item
    let claimed = atomicAdd(&work_queue.head, 1u);

    if (claimed >= work_queue.total_work) {
        return 0xFFFFFFFFu; // Out of bounds
    }

    return claimed;
}

// Send a value to another node via the node buffer
fn send_to_node(target_node: u32, value: u32) {
    // Node buffer layout: [node0_slot0, node0_slot1, ..., node1_slot0, ...]
    // Each node has 64 slots for incoming messages
    let slot_per_node = 64u;
    let my_node = state.node_id;

    // Write to target node's buffer
    let write_slot = (target_node * slot_per_node) + (my_node % slot_per_node);
    node_buffer[write_slot] = value;
}

// Receive a value from another node via the node buffer
fn recv_from_node(source_node: u32) -> u32 {
    let slot_per_node = 64u;
    let my_node = state.node_id;

    // Read from our buffer from the source node's slot
    let read_slot = (my_node * slot_per_node) + (source_node % slot_per_node);
    return node_buffer[read_slot];
}

// ============================================
// MAIN COMPUTE FUNCTION
// ============================================

@compute @workgroup_size(128)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let agent_id = global_id.x;

    // Check if agent belongs to this node's work range
    if (!belongs_to_node(agent_id)) {
        return;
    }

    // Initialize registers
    var registers: array<u32, 32>;
    for (var i = 0u; i < 32u; i = i + 1u) {
        registers[i] = 0u;
    }

    var pc: u32 = 0u;
    var halted: u32 = 0u;
    var local_cycle: u32 = 0u;
    let max_cycles = 1000u;

    // Main execution loop
    for (var cycle = 0u; cycle < max_cycles; cycle = cycle + 1u) {
        if (halted != 0u) { break; }

        // Fetch instruction from program texture
        let inst = fetch_instruction(pc);
        let opcode = inst.x;
        let data1 = inst.y;
        let data2 = inst.z;
        let data3 = inst.w;

        var next_pc = pc + 1u;

        // ============================================
        // CORE OPCODES
        // ============================================

        if (opcode == OP_DATA) {
            // Load immediate value into register
            registers[data1 % 32u] = data2;

        } else if (opcode == OP_ADD) {
            registers[data1 % 32u] = registers[data1 % 32u] + registers[data2 % 32u];

        } else if (opcode == OP_SUB) {
            registers[data1 % 32u] = registers[data1 % 32u] - registers[data2 % 32u];

        } else if (opcode == OP_MUL) {
            registers[data1 % 32u] = registers[data1 % 32u] * registers[data2 % 32u];

        } else if (opcode == OP_BRANCH) {
            // Unconditional branch
            next_pc = data2;

        } else if (opcode == OP_BNZ) {
            // Branch if not zero
            if (registers[data1 % 32u] != 0u) {
                next_pc = data2;
            }

        // ============================================
        // DISTRIBUTED OPCODES
        // ============================================

        } else if (opcode == OP_SYNC) {
            // Barrier synchronization across all nodes
            barrier_sync();

        } else if (opcode == OP_SEND) {
            // Send register[data1] to node[data2]
            let target_node = data2 % state.total_nodes;
            let value_to_send = registers[data1 % 32u];
            send_to_node(target_node, value_to_send);

        } else if (opcode == OP_RECV) {
            // Receive from node[data2] into register[data1]
            let source_node = data2 % state.total_nodes;
            registers[data1 % 32u] = recv_from_node(source_node);

        } else if (opcode == OP_STEAL) {
            // Try to steal work from the global queue
            let stolen_work = steal_work();
            if (stolen_work != 0xFFFFFFFFu) {
                // Successfully stole work, store in register
                registers[data1 % 32u] = stolen_work;
            } else {
                // No work available, set to 0
                registers[data1 % 32u] = 0u;
            }

        // ============================================
        // HALT
        // ============================================

        } else if (opcode == OP_HALT) {
            halted = 1u;
        }

        // Update program counter
        pc = next_pc;
        local_cycle = cycle;

        // Check for end of program
        let dims = textureDimensions(program_texture);
        if (pc >= (dims.x * dims.y)) {
            break;
        }
    }

    // ============================================
    // WRITE RESULTS TO SHARED MEMORY
    // ============================================
    // This prevents buffer pruning and shares results across nodes

    let memory_offset = (agent_id - state.work_offset) * 32u;
    for (var i = 0u; i < 32u; i = i + 1u) {
        shared_memory[memory_offset + i] = registers[i];
    }

    // Aggregate result atomically
    let result = registers[0];
    atomicAdd(&state.result_aggregate, result);

    // Update global cycle counter
    atomicAdd(&state.global_cycle, local_cycle);

    // ============================================
    // VISUAL OUTPUT
    // ============================================
    // Write a pixel to show this agent executed

    let output_x = i32((agent_id - state.work_offset) % 256u);
    let output_y = i32((agent_id - state.work_offset) / 256u);

    // Color based on node_id for visual distinction
    let r = f32(state.node_id % 3u == 0u) * 0.8 + 0.2;
    let g = f32(state.node_id % 3u == 1u) * 0.8 + 0.2;
    let b = f32(state.node_id % 3u == 2u) * 0.8 + 0.2;

    textureStore(output_texture, vec2<i32>(output_x, output_y), vec4<f32>(r, g, b, 1.0));
}
