/**
 * Saccade Compute Shader - GPU-accelerated eye movement calculations
 *
 * Phase 47: Tectonic Saccadic Optimization
 *
 * Implements biologically-plausible saccadic eye movements:
 * - Saccade phase: Quick jump with cubic ease-out
 * - Settling phase: Exponential decay to final position
 * - Fixation phase: Stable position with micro-tremors
 */

struct SaccadeState {
    position: vec2f,        // Current position (pixels)
    target: vec2f,          // Target position (pixels)
    startPos: vec2f,        // Saccade start position
    velocity: vec2f,        // Current velocity (pixels/sec)
    settlingFactor: f32,    // 0-1, 1 = fully settled
    phase: u32,             // 0=idle, 1=saccade, 2=settling, 3=fixation
    saccadeStartTime: f64,  // Timestamp when saccade started
    settlingStartTime: f64, // Timestamp when settling started
};

struct SaccadeConfig {
    saccadeDuration: f32,      // ms
    settlingDuration: f32,     // ms
    saccadeThreshold: f32,     // pixels
    tremorAmount: f32,         // pixels for micro-tremors
};

struct ComputeInput {
    currentState: SaccadeState,
    config: SaccadeConfig,
    currentTime: f64,
    deltaTime: f32,
    velocityHistory: array<vec2f, 5>,  // Last 5 velocity samples
    velocityHistoryCount: u32,
};

struct ComputeOutput {
    newState: SaccadeState,
    averagedVelocity: vec2f,
    predictedPosition: vec2f,
};

/**
 * Cubic ease-out function for saccade motion
 * @param t - Progress value [0, 1]
 * @returns Eased value
 */
fn easeOutCubic(t: f32) -> f32 {
    let one_minus_t = 1.0 - t;
    return 1.0 - (one_minus_t * one_minus_t * one_minus_t);
}

/**
 * Exponential settling function
 * factor = 1 - e^(-5t)
 * @param t - Normalized time [0, 1]
 * @returns Settling factor [0, 1]
 */
fn exponentialSettling(t: f32) -> f32 {
    return 1.0 - exp(-5.0 * t);
}

/**
 * Calculate distance between two points
 */
fn distance(p1: vec2f, p2: vec2f) -> f32 {
    let dx = p2.x - p1.x;
    let dy = p2.y - p1.y;
    return sqrt(dx * dx + dy * dy);
}

/**
 * Calculate velocity from position change
 */
fn calculateVelocity(prevPos: vec2f, currPos: vec2f, deltaTime: f32) -> vec2f {
    let dtSeconds = deltaTime / 1000.0;
    return (currPos - prevPos) / dtSeconds;
}

/**
 * Average velocity samples
 */
fn averageVelocity(samples: array<vec2f, 5>, count: u32) -> vec2f {
    var sum = vec2f(0.0, 0.0);
    for (var i: u32 = 0u; i < count; i = i + 1u) {
        sum = sum + samples[i];
    }
    return sum / f32(count);
}

/**
 * Update saccade phase (quick jump to target)
 */
fn updateSaccade(state: ptr<function, SaccadeState>, config: SaccadeConfig, currentTime: f64) -> vec2f {
    let elapsed = f32(currentTime - (*state).saccadeStartTime);
    let progress = min(elapsed / config.saccadeDuration, 1.0);
    let eased = easeOutCubic(progress);

    let direction = (*state).target - (*state).startPos;
    (*state).position = (*state).startPos + direction * eased;

    // Calculate instantaneous velocity
    let velocity = direction * eased / max(elapsed / 1000.0, 0.001);

    if (progress >= 1.0) {
        (*state).phase = 2u;  // Transition to settling
        (*state).settlingStartTime = currentTime;
        (*state).settlingFactor = 0.0;
    }

    return velocity;
}

/**
 * Update settling phase (exponential decay to final position)
 */
fn updateSettling(state: ptr<function, SaccadeState>, config: SaccadeConfig, currentTime: f64) -> vec2f {
    let elapsed = f32(currentTime - (*state).settlingStartTime);
    let progress = elapsed / config.settlingDuration;

    (*state).settlingFactor = exponentialSettling(progress);

    // Decaying velocity as we settle
    let decayFactor = exp(-5.0 * progress);
    let direction = (*state).target - (*state).position;
    let velocity = direction * (1.0 - decayFactor) * 10.0;

    if (progress >= 1.0) {
        (*state).phase = 3u;  // Transition to fixation
        (*state).settlingFactor = 1.0;
    }

    return velocity;
}

/**
 * Update fixation phase (stable with micro-tremors)
 */
fn updateFixation(state: ptr<function, SaccadeState>, config: SaccadeConfig, deltaTime: f32) -> vec2f {
    // Micro-tremors: tiny random movements
    // Using pseudo-random based on time for consistency
    let timeHash = fract(f32(currentTime) * 0.0001);
    let tremorX = (timeHash - 0.5) * config.tremorAmount;
    let tremorY = (fract(timeHash * 1.618) - 0.5) * config.tremorAmount;

    (*state).position = (*state).position + vec2f(tremorX, tremorY);

    return vec2f(0.0, 0.0);  // No net velocity during fixation
}

/**
 * Main compute function
 * @param input - Current state and configuration
 * @returns Updated state and computed values
 */
@compute
@workgroup_size(1)
fn computeSaccade(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // This is a placeholder for WebGPU compute pipeline
    // Actual implementation will use storage buffers for I/O
}

// Pure function version for testing (not using workgroup)
fn computeSaccadePure(input: ComputeInput) -> ComputeOutput {
    var state = input.currentState;
    var velocity = vec2f(0.0, 0.0);

    // Update based on current phase
    if (state.phase == 1u) {  // saccade
        velocity = updateSaccade(&state, input.config, input.currentTime);
    } else if (state.phase == 2u) {  // settling
        velocity = updateSettling(&state, input.config, input.currentTime);
    } else if (state.phase == 3u) {  // fixation
        velocity = updateFixation(&state, input.config, input.deltaTime);
    }

    // Calculate averaged velocity from history
    let avgVelocity = averageVelocity(input.velocityHistory, input.velocityHistoryCount);

    // Predict future position
    let prediction = state.position + avgVelocity * 0.2;  // 200ms ahead

    return ComputeOutput(
        state,
        avgVelocity,
        prediction
    );
}
