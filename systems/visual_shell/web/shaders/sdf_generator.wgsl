// Geometry OS: SDF Generator Compute Shader
// Converts Hilbert sequences to signed distance fields via WebGPU
//
// Phase: Morphological Font Layer
// Input: hilbertSequence - array of vec2<f32> curve points
// Output: texture_storage_2d for distance field
//
// Usage:
//   1. Populate hilbertSequence with 256 curve points
//   2. Set params.numPoints and params.size
//   3. Dispatch (16, 16, 1) workgroups for 16x16 output
//   4. Read output texture as SDF

struct SequenceParams {
    numPoints: u32,      // Number of valid points in sequence
    size: f32,           // Grid size (16.0 for 16x16)
    smoothing: f32,      // Edge smoothing factor (0.0 - 1.0)
    padding: f32,        // Border padding
}

struct GlyphMetrics {
    minX: f32,
    maxX: f32,
    minY: f32,
    maxY: f32,
    centroidX: f32,
    centroidY: f32,
    _pad: f32,
}

@group(0) @binding(0) var<uniform> params: SequenceParams;
@group(0) @binding(1) var<storage, read> hilbertSequence: array<vec2<f32>>;
@group(0) @binding(2) var<storage, read_write> metrics: GlyphMetrics;
@group(0) @binding(3) var output: texture_storage_2d<r32float, write>;

// Constants
const PI: f32 = 3.14159265359;
const MAX_POINTS: u32 = 256u;

/// Compute signed distance from point to line segment
fn pointToSegmentDistance(p: vec2<f32>, a: vec2<f32>, b: vec2<f32>) -> f32 {
    let ab = b - a;
    let ap = p - a;

    let abLenSq = dot(ab, ab);
    if (abLenSq < 0.0001) {
        // Degenerate segment (point)
        return length(ap);
    }

    // Project point onto line, clamped to segment
    let t = clamp(dot(ap, ab) / abLenSq, 0.0, 1.0);
    let closest = a + t * ab;

    return length(p - closest);
}

/// Compute distance from point to entire curve
fn computeCurveDistance(p: vec2<f32>, numPoints: u32) -> f32 {
    var minDist = 1e10;

    // Distance to curve segments
    for (var i = 0u; i < numPoints - 1u; i++) {
        let a = hilbertSequence[i];
        let b = hilbertSequence[i + 1u];
        let dist = pointToSegmentDistance(p, a, b);
        minDist = min(minDist, dist);
    }

    // Also check distance to endpoints
    if (numPoints > 0u) {
        minDist = min(minDist, length(p - hilbertSequence[0u]));
        minDist = min(minDist, length(p - hilbertSequence[numPoints - 1u]));
    }

    return minDist;
}

/// Compute winding number for inside/outside determination
fn computeWindingNumber(p: vec2<f32>, numPoints: u32) -> f32 {
    var winding = 0.0;

    for (var i = 0u; i < numPoints; i++) {
        let j = (i + 1u) % numPoints;
        let a = hilbertSequence[i];
        let b = hilbertSequence[j];

        if (a.y <= p.y) {
            if (b.y > p.y) {
                // Upward crossing
                let cross = (b.x - a.x) * (p.y - a.y) - (p.x - a.x) * (b.y - a.y);
                if (cross > 0.0) {
                    winding += 1.0;
                }
            }
        } else {
            if (b.y <= p.y) {
                // Downward crossing
                let cross = (b.x - a.x) * (p.y - a.y) - (p.x - a.x) * (b.y - a.y);
                if (cross < 0.0) {
                    winding -= 1.0;
                }
            }
        }
    }

    return winding;
}

/// Smoothstep with configurable smoothing
fn smoothDistance(d: f32, smoothing: f32) -> f32 {
    let halfWidth = smoothing * 0.5;
    return smoothstep(-halfWidth, halfWidth, d);
}

/// Apply morphological dilation/erosion
fn morphologicalTransform(d: f32, radius: f32) -> f32 {
    return d - radius;
}

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;

    // Bounds check
    let size = u32(params.size);
    if (x >= size || y >= size) {
        return;
    }

    // Convert to normalized coordinates (centered)
    let px = f32(x) + 0.5;
    let py = f32(y) + 0.5;

    let p = vec2<f32>(px, py);

    // Compute unsigned distance to curve
    let unsignedDist = computeCurveDistance(p, params.numPoints);

    // Compute winding number for sign
    let winding = computeWindingNumber(p, params.numPoints);
    let isInside = winding != 0.0;

    // Signed distance: negative inside, positive outside
    var signedDist = unsignedDist;
    if (isInside) {
        signedDist = -signedDist;
    }

    // Normalize to [0, 1] range for SDF texture
    // Values near curve (distance ≈ 0) should be ≈ 0.5
    // Values far inside (large negative) should be ≈ 0.0
    // Values far outside (large positive) should be ≈ 1.0
    let maxDist = params.size * 0.5;
    let normalizedDist = (signedDist / maxDist + 1.0) * 0.5;

    // Apply smoothing
    let smoothed = smoothDistance(signedDist, params.smoothing);

    // Combine for final output
    // Output: 0.5 at edge, >0.5 outside, <0.5 inside
    let outputValue = clamp(normalizedDist, 0.0, 1.0);

    // Write to output texture
    textureStore(output, vec2<i32>(i32(x), i32(y)), vec4<f32>(outputValue, 0.0, 0.0, 1.0));
}

/// Compute glyph bounding box (separate dispatch)
@compute @workgroup_size(1)
fn computeMetrics(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (params.numPoints == 0u) {
        metrics.minX = 0.0;
        metrics.maxX = params.size;
        metrics.minY = 0.0;
        metrics.maxY = params.size;
        metrics.centroidX = params.size * 0.5;
        metrics.centroidY = params.size * 0.5;
        return;
    }

    // Initialize bounds
    var minX = 1e10;
    var maxX = -1e10;
    var minY = 1e10;
    var maxY = -1e10;
    var sumX = 0.0;
    var sumY = 0.0;

    // Compute bounds and centroid
    for (var i = 0u; i < params.numPoints; i++) {
        let p = hilbertSequence[i];
        minX = min(minX, p.x);
        maxX = max(maxX, p.x);
        minY = min(minY, p.y);
        maxY = max(maxY, p.y);
        sumX += p.x;
        sumY += p.y;
    }

    metrics.minX = minX;
    metrics.maxX = maxX;
    metrics.minY = minY;
    metrics.maxY = maxY;
    metrics.centroidX = sumX / f32(params.numPoints);
    metrics.centroidY = sumY / f32(params.numPoints);
}
