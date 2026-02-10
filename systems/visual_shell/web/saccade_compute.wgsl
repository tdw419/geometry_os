/**
 * Saccade Compute Shader - GPU-accelerated eye movement calculations
 *
 * Phase 47 Improvements: GPU-Accelerated Saccade Calculations
 *
 * This compute shader processes multiple saccades in parallel using:
 * - Exponential settling formula: factor = 1 - e^(-5t)
 * - Cubic easing for saccade motion
 * - Double-buffered pipeline for continuous updates
 */

// Saccade state structure
struct SaccadeState {
    position: vec2<f32>,      // Current position (pixels)
    target: vec2<f32>,         // Target position (pixels)
    start_pos: vec2<f32>,      // Saccade start position
    velocity: vec2<f32>,       // Current velocity (pixels/second)

    // Timing
    saccade_start_time: f32,   // When saccade started (seconds)
    settling_start_time: f32,  // When settling started (seconds)

    // Configuration
    saccade_duration: f32,     // Saccade phase duration (seconds)
    settling_duration: f32,    // Settling phase duration (seconds)
    settling_factor: f32,      // 0-1, 1 = fully settled

    // State flags
    phase: u32,                // 0=idle, 1=saccade, 2=settling, 3=fixation
    active: u32,               // Whether this saccade slot is in use
}

// Input/output storage buffers
struct SaccadeInput {
    states: array<SaccadeState>,
}

struct SaccadeOutput {
    positions: array<vec2<f32>>,
    settling_factors: array<f32>,
    phases: array<u32>,
}

// Uniform buffer for global parameters
struct SaccadeUniforms {
    current_time: f32,         // Current time in seconds
    delta_time: f32,           // Frame time in seconds
    saccade_threshold: f32,    // Distance threshold to trigger saccade
    tremor_amount: f32,        // Micro-tremor magnitude during fixation
    max_saccades: u32,         // Maximum number of concurrent saccades
}

@group(0) @binding(0) var<storage, read> input: SaccadeInput;
@group(0) @binding(1) var<storage, read_write> output: SaccadeOutput;
@group(0) @binding(2) var<uniform> uniforms: SaccadeUniforms;

// Random number generator (simple hash-based)
fn random(co: vec2<f32>) -> f32 {
    let dot_product = dot(co, vec2<f32>(12.9898, 78.233));
    return fract(sin(dot_product) * 43758.5453);
}

// Cubic ease-out function
fn ease_out_cubic(t: f32) -> f32 {
    let t_clamped = clamp(t, 0.0, 1.0);
    return 1.0 - pow(1.0 - t_clamped, 3.0);
}

// Exponential settling function
fn exponential_settling(progress: f32) -> f32 {
    let t = clamp(progress, 0.0, 1.0);
    return 1.0 - exp(-5.0 * t);
}

// Update saccade phase (quick jump)
fn update_saccade(state: ptr<function, SaccadeState>, current_time: f32) -> vec2<f32> {
    let elapsed = current_time - (*state).saccade_start_time;
    let progress = elapsed / (*state).saccade_duration;

    if (progress >= 1.0) {
        // Transition to settling
        (*state).phase = 2u;  // settling
        (*state).settling_start_time = current_time;
        return (*state).target;
    }

    // Apply cubic easing
    let eased = ease_out_cubic(progress);
    let new_pos = (*state).start_pos + ((*state).target - (*state).start_pos) * eased;
    return new_pos;
}

// Update settling phase (exponential decay)
fn update_settling(state: ptr<function, SaccadeState>, current_time: f32) -> vec2<f32> {
    let elapsed = current_time - (*state).settling_start_time;
    let progress = elapsed / (*state).settling_duration;

    if (progress >= 1.0) {
        // Transition to fixation
        (*state).phase = 3u;  // fixation
        (*state).settling_factor = 1.0;
        return (*state).target;
    }

    // Apply exponential settling
    (*state).settling_factor = exponential_settling(progress);

    // Interpolate toward target based on settling factor
    let new_pos = mix((*state).position, (*state).target, (*state).settling_factor * 0.1);
    return new_pos;
}

// Update fixation phase (add micro-tremors)
fn update_fixation(state: ptr<function, SaccadeState>) -> vec2<f32> {
    // Micro-tremors: tiny random movements
    let noise_x = (random((*state).position + vec2<f32>(uniforms.current_time, 0.0)) - 0.5) * uniforms.tremor_amount;
    let noise_y = (random((*state).position + vec2<f32>(0.0, uniforms.current_time)) - 0.5) * uniforms.tremor_amount;

    return (*state).position + vec2<f32>(noise_x, noise_y);
}

// Main compute function
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let index = global_id.x;

    // Check bounds
    if (index >= uniforms.max_saccades) {
        return;
    }

    var state = input.states[index];

    // Skip inactive slots
    if (state.active == 0u) {
        output.positions[index] = vec2<f32>(0.0, 0.0);
        output.settling_factors[index] = state.settling_factor;
        output.phases[index] = 0u;
        return;
    }

    var new_pos = state.position;

    // Update based on phase
    switch state.phase {
        case 1u: {  // saccade
            new_pos = update_saccade(&state, uniforms.current_time);
        }
        case 2u: {  // settling
            new_pos = update_settling(&state, uniforms.current_time);
        }
        case 3u: {  // fixation
            new_pos = update_fixation(&state);
        }
        default: {  // idle
            new_pos = state.position;
        }
    }

    // Update position
    state.position = new_pos;

    // Write output
    output.positions[index] = new_pos;
    output.settling_factors[index] = state.settling_factor;
    output.phases[index] = state.phase;
}
