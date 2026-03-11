/**
 * Neural Perception Compute Shader
 *
 * GPU-accelerated feature extraction and classification for RTS memory.
 * Processes 16x16 patches in parallel workgroups.
 */

// Constants
const PATCH_SIZE: u32 = 16u;
const FEATURE_DIM: u32 = 64u;
const NUM_CLASSES: u32 = 4u;

// Input: RGBA texture data
@group(0) @binding(0) var input_texture: texture_2d<f32>;

// Output: Feature vectors
struct FeatureBuffer {
    features: array<f32>,  // [num_patches * FEATURE_DIM]
}

@group(0) @binding(1) var<storage, read_write> feature_buffer: FeatureBuffer;

// Output: Classification results
struct ClassificationBuffer {
    classes: array<u32>,    // [num_patches] class indices
    confidences: array<f32>, // [num_patches] confidence scores
}

@group(0) @binding(2) var<storage, read_write> class_buffer: ClassificationBuffer;

// Weights (loaded from trained model)
struct WeightsBuffer {
    classifier: array<f32>,  // [NUM_CLASSES * FEATURE_DIM]
}

@group(0) @binding(3) var<storage, read> weights: WeightsBuffer;

// Configuration
struct Config {
    image_width: u32,
    image_height: u32,
    num_patches_x: u32,
    num_patches_y: u32,
}

@group(0) @binding(4) var<uniform> config: Config;

/**
 * Extract 64-dim feature vector from a 16x16 patch.
 * Features:
 * - 0-15: Row mean intensities
 * - 16-31: Column mean intensities
 * - 32-47: Horizontal gradients
 * - 48-63: Vertical gradients
 */
fn extract_features(patch_x: u32, patch_y: u32, out_base: u32) {
    var row_means: array<f32, 16>;
    var col_means: array<f32, 16>;
    var h_grads: array<f32, 16>;
    var v_grads: array<f32, 16>;

    // Initialize accumulators
    for (var i = 0u; i < 16u; i++) {
        row_means[i] = 0.0;
        col_means[i] = 0.0;
        h_grads[i] = 0.0;
        v_grads[i] = 0.0;
    }

    // Compute means
    for (var y = 0u; y < PATCH_SIZE; y++) {
        for (var x = 0u; x < PATCH_SIZE; x++) {
            let tex_coord = vec2<u32>(patch_x + x, patch_y + y);
            let pixel = textureLoad(input_texture, tex_coord, 0);
            let gray = (pixel.r + pixel.g + pixel.b) / 3.0;

            row_means[y] += gray;
            col_means[x] += gray;
        }
    }

    // Normalize means
    for (var i = 0u; i < 16u; i++) {
        row_means[i] /= f32(PATCH_SIZE);
        col_means[i] /= f32(PATCH_SIZE);
    }

    // Compute gradients
    for (var y = 0u; y < PATCH_SIZE; y++) {
        for (var x = 0u; x < PATCH_SIZE; x++) {
            let tex_coord = vec2<u32>(patch_x + x, patch_y + y);
            let pixel = textureLoad(input_texture, tex_coord, 0);
            let gray = (pixel.r + pixel.g + pixel.b) / 3.0;

            // Horizontal gradient (except first column)
            if (x > 0u) {
                let prev_coord = vec2<u32>(patch_x + x - 1u, patch_y + y);
                let prev_pixel = textureLoad(input_texture, prev_coord, 0);
                let prev_gray = (prev_pixel.r + prev_pixel.g + prev_pixel.b) / 3.0;
                h_grads[y] += abs(gray - prev_gray);
            }

            // Vertical gradient (except first row)
            if (y > 0u) {
                let prev_coord = vec2<u32>(patch_x + x, patch_y + y - 1u);
                let prev_pixel = textureLoad(input_texture, prev_coord, 0);
                let prev_gray = (prev_pixel.r + prev_pixel.g + prev_pixel.b) / 3.0;
                v_grads[x] += abs(gray - prev_gray);
            }
        }
    }

    // Normalize gradients
    for (var i = 0u; i < 16u; i++) {
        h_grads[i] /= f32(PATCH_SIZE - 1u);
        v_grads[i] /= f32(PATCH_SIZE - 1u);
    }

    // Write features to output buffer
    for (var i = 0u; i < 16u; i++) {
        feature_buffer.features[out_base + i] = row_means[i];
        feature_buffer.features[out_base + 16u + i] = col_means[i];
        feature_buffer.features[out_base + 32u + i] = h_grads[i];
        feature_buffer.features[out_base + 48u + i] = v_grads[i];
    }
}

/**
 * Classify a patch based on extracted features.
 */
fn classify(patch_idx: u32, feature_base: u32) {
    var scores: array<f32, 4>;

    // Compute class scores
    for (var c = 0u; c < NUM_CLASSES; c++) {
        var score = 0.0;
        for (var f = 0u; f < FEATURE_DIM; f++) {
            let weight_idx = c * FEATURE_DIM + f;
            score += feature_buffer.features[feature_base + f] * weights.classifier[weight_idx];
        }
        scores[c] = score;
    }

    // Find best class (argmax)
    var best_class = 0u;
    var best_score = scores[0];
    for (var c = 1u; c < NUM_CLASSES; c++) {
        if (scores[c] > best_score) {
            best_score = scores[c];
            best_class = c;
        }
    }

    // Compute softmax confidence
    let max_score = best_score;
    var sum_exp = 0.0;
    for (var c = 0u; c < NUM_CLASSES; c++) {
        sum_exp += exp(scores[c] - max_score);
    }
    let confidence = exp(best_score - max_score) / sum_exp;

    // Write results
    class_buffer.classes[patch_idx] = best_class;
    class_buffer.confidences[patch_idx] = confidence;
}

/**
 * Main compute entry point.
 * Each workgroup processes one 16x16 patch.
 */
@compute @workgroup_size(1, 1, 1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let patch_x = global_id.x * PATCH_SIZE;
    let patch_y = global_id.y * PATCH_SIZE;

    // Check bounds
    if (patch_x + PATCH_SIZE > config.image_width ||
        patch_y + PATCH_SIZE > config.image_height) {
        return;
    }

    let patch_idx = global_id.y * config.num_patches_x + global_id.x;
    let feature_base = patch_idx * FEATURE_DIM;

    // Extract features
    extract_features(patch_x, patch_y, feature_base);

    // Classify
    classify(patch_idx, feature_base);
}
