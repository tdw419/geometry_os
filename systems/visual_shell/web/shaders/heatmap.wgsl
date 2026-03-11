// ============================================
// GEOMETRY OS - NEURAL HEATMAP OVERLAY SHADER
// Phase 35.6: Synaptic Action Execution Visualization
// ============================================
//
// Fragment shader that calculates local entropy in 16x16 pixel windows
// and renders heatmap visualizations for neural activity analysis.
//
// Modes:
// - 0: Entropy (variance-based, blue=low, red=high)
// - 1: Layer (depth-based color mapping)
// - 2: Activity (intensity-based)
// - 3: Gradient (spatial derivative)
//
// ============================================

// --- BINDINGS ---

@group(0) @binding(0) var source_texture: texture_2d<f32>;
@group(0) @binding(1) var<uniform> heatmap_params: HeatmapParams;

// --- STRUCTURES ---

struct HeatmapParams {
    mode: u32,           // Visualization mode (0-3)
    opacity: f32,        // Overlay opacity (0.0-1.0)
    time: f32,           // Time for animated effects
    window_size: u32,    // Entropy window size (default 16)
    grid_size: u32,      // Hilbert grid size (power of 2)
    theme_index: u32,    // Color theme selector (0=Default, 1=Cyberpunk, 2=Thermal, 3=Bioluminescent)
    pad1: u32,           // Padding for 16-byte alignment
    pad2: u32,           // Padding for 16-byte alignment
};

struct FragmentOutput {
    @location(0) color: vec4<f32>,
};

// --- VERTEX INPUT (for full-screen quad) ---

struct VertexInput {
    @builtin(vertex_index) vertex_index: u32,
};

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

// --- VERTEX SHADER ---

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Generate full-screen quad triangle strip
    // vertex_index 0-5 covers two triangles
    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0), // 0: bottom-left
        vec2<f32>( 1.0, -1.0), // 1: bottom-right
        vec2<f32>(-1.0,  1.0), // 2: top-left
        vec2<f32>(-1.0,  1.0), // 3: top-left
        vec2<f32>( 1.0, -1.0), // 4: bottom-right
        vec2<f32>( 1.0,  1.0)  // 5: top-right
    );

    let pos = positions[input.vertex_index];
    output.position = vec4<f32>(pos, 0.0, 1.0);
    output.uv = pos * 0.5 + 0.5; // Convert to 0-1 UV space

    return output;
}

// ============================================
// HILBERT CURVE COORDINATE MAPPING
// Reused from llm_inference.wgsl
// ============================================

fn rot(n: u32, x: ptr<function, u32>, y: ptr<function, u32>, rx: u32, ry: u32) {
    if (ry == 0u) {
        if (rx == 1u) {
            *x = n - 1u - *x;
            *y = n - 1u - *y;
        }
        let t = *x;
        *x = *y;
        *y = t;
    }
}

fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;
    var x: u32 = 0u;
    var y: u32 = 0u;

    var s: u32 = 1u;
    for (var i: u32 = 0u; i < 32u; i = i + 1u) {
        if (s >= n) { break; }

        rx = 1u & (t / 2u);
        ry = 1u & (t ^ rx);
        rot(s, &x, &y, rx, ry);

        x = x + s * rx;
        y = y + s * ry;
        t = t / 4u;
        s = s * 2u;
    }

    return vec2<u32>(x, y);
}

fn hilbert_xy2d(n: u32, x: u32, y: u32) -> u32 {
    var rx: u32;
    var ry: u32;
    var d: u32 = 0u;
    var cx: u32 = x;
    var cy: u32 = y;
    var s: u32 = n / 2u;

    for (var i: u32 = 0u; i < 32u; i = i + 1u) {
        if (s == 0u) { break; }

        if ((cx & s) > 0u) { rx = 1u; } else { rx = 0u; }
        if ((cy & s) > 0u) { ry = 1u; } else { ry = 0u; }

        d = d + s * s * ((3u * rx) ^ ry);
        rot(s, &cx, &cy, rx, ry);

        s = s / 2u;
    }

    return d;
}

// ============================================
// PIXEL INTENSITY CALCULATION
// ============================================

/// Calculate pixel intensity from RGBA color
/// Uses luminance formula: 0.299*R + 0.587*G + 0.114*B
fn pixel_intensity(color: vec4<f32>) -> f32 {
    return dot(color.rgb, vec3<f32>(0.299, 0.587, 0.114));
}

/// Calculate local entropy (variance) in a window around the pixel
/// Window size is configurable (default 16x16)
fn calculate_local_entropy(
    coords: vec2<i32>,
    texture_dims: vec2<u32>,
    window_size: u32
) -> f32 {
    var sum: f32 = 0.0;
    var sum_squared: f32 = 0.0;
    var count: u32 = 0u;

    let half_window = i32(window_size / 2u);
    let x_min = max(0, coords.x - half_window);
    let x_max = min(i32(texture_dims.x) - 1, coords.x + half_window);
    let y_min = max(0, coords.y - half_window);
    let y_max = min(i32(texture_dims.y) - 1, coords.y + half_window);

    // Sample neighborhood and calculate variance
    for (var dy: i32 = y_min; dy <= y_max; dy = dy + 1) {
        for (var dx: i32 = x_min; dx <= x_max; dx = dx + 1) {
            let sample_coords = vec2<i32>(dx, dy);
            let sample = textureLoad(source_texture, sample_coords, 0);
            let intensity = pixel_intensity(sample);

            sum = sum + intensity;
            sum_squared = sum_squared + intensity * intensity;
            count = count + 1u;
        }
    }

    if (count == 0u) {
        return 0.0;
    }

    // Calculate variance: E[X^2] - (E[X])^2
    let mean = sum / f32(count);
    let mean_squared = sum_squared / f32(count);
    let variance = max(0.0, mean_squared - mean * mean);

    // Normalize variance (typical range 0-0.25 for 0-1 intensities)
    return saturate(variance * 4.0);
}

// ============================================
// COLOR MAPPING FUNCTIONS
// ============================================

/// Map value (0-1) to heatmap color based on theme
fn apply_theme(val: f32, theme: u32) -> vec3<f32> {
    let t = saturate(val);
    switch (theme) {
        case 1u: { // Cyberpunk (Neon Pink/Cyan)
            let color1 = vec3<f32>(0.0, 1.0, 1.0); // Cyan low
            let color2 = vec3<f32>(1.0, 0.0, 1.0); // Magenta high
            return mix(color1, color2, t);
        }
        case 2u: { // Bioluminescent (Deep Blue/Green)
            let color1 = vec3<f32>(0.0, 0.0, 0.2);
            let color2 = vec3<f32>(0.2, 1.0, 0.5);
            return mix(color1, color2, t * t); // Exponential curve for glow
        }
        case 3u: { // Thermal (Classic)
            let color1 = vec3<f32>(0.0, 0.0, 0.0);
            let color2 = vec3<f32>(1.0, 0.0, 0.0);
            let color3 = vec3<f32>(1.0, 1.0, 0.0);
            let color4 = vec3<f32>(1.0, 1.0, 1.0);
            if (t < 0.33) { return mix(color1, color2, t * 3.0); }
            if (t < 0.66) { return mix(color2, color3, (t - 0.33) * 3.0); }
            return mix(color3, color4, (t - 0.66) * 3.0);
        }
        case 4u: { // Monochrome
            return vec3<f32>(t, t, t);
        }
        default: { // Default (Rainbow)
            if (t < 0.25) { return mix(vec3<f32>(0.0, 0.0, 1.0), vec3<f32>(0.0, 1.0, 1.0), t * 4.0); }
            if (t < 0.50) { return mix(vec3<f32>(0.0, 1.0, 1.0), vec3<f32>(0.0, 1.0, 0.0), (t - 0.25) * 4.0); }
            if (t < 0.75) { return mix(vec3<f32>(0.0, 1.0, 0.0), vec3<f32>(1.0, 1.0, 0.0), (t - 0.50) * 4.0); }
            return mix(vec3<f32>(1.0, 1.0, 0.0), vec3<f32>(1.0, 0.0, 0.0), (t - 0.75) * 4.0);
        }
    }
}

/// Map value (0-1) to heatmap color (blue=low, red=high)
fn entropy_heatmap(value: f32, theme: u32) -> vec3<f32> {
    return apply_theme(value, theme);
}

/// Map Hilbert distance to layer-based color
/// Uses periodic sine functions and interference patterns
fn layer_heatmap(distance: u32, time: f32, theme: u32) -> vec3<f32> {
    let normalized_d = f32(distance) / 65536.0; // Normalize for 256x256 grid
    
    // Create repeating bands based on distance
    let band_freq = 10.0;
    // Add interference pattern
    let interference = sin(normalized_d * 50.0 + time * 2.0) * 0.1;
    let band = sin(normalized_d * band_freq * 3.14159 + time * 0.5 + interference);
    
    // Map to color space depending on theme
    let scan = 0.8 + 0.2 * sin(normalized_d * 200.0 - time * 5.0);
    
    if (theme == 1u) {
        // Cyberpunk
        let r = (0.5 + 0.5 * sin(normalized_d * 5.0 + time)) * scan;
        let b = (0.5 + 0.5 * sin(normalized_d * 11.0 + time * 0.7)) * scan;
        return vec3<f32>(r, 0.0, b);
    } else {
        // Default
        let r = (0.5 + 0.5 * sin(normalized_d * 5.0 + time)) * scan;
        let g = (0.5 + 0.5 * sin(normalized_d * 7.0 + time * 1.3)) * scan;
        let b = (0.5 + 0.5 * sin(normalized_d * 11.0 + time * 0.7)) * scan;
        return vec3<f32>(r, g, b);
    }
}

/// Map pixel intensity to activity heatmap
/// High activity = bright/yellow, Low activity = dark/purple
/// Adds a pulsating effect based on time
fn activity_heatmap(coords: vec2<i32>, dims: vec2<u32>, time: f32, theme: u32) -> vec3<f32> {
    // 1. Sample center
    let center = pixel_intensity(textureLoad(source_texture, coords, 0));
    
    // 2. Sample 5x5 neighbors for "bloom" (simplified gaussian)
    var bloom_sum: f32 = 0.0;
    var weight_sum: f32 = 0.0;
    
    for (var i = -2; i <= 2; i = i + 1) {
        for (var j = -2; j <= 2; j = j + 1) {
            let s_coords = clamp(
                coords + vec2<i32>(i, j),
                vec2<i32>(0, 0),
                vec2<i32>(i32(dims.x) - 1, i32(dims.y) - 1)
            );
            
            let val = pixel_intensity(textureLoad(source_texture, s_coords, 0));
            
            // Gaussian weight
            let dist_sq = f32(i * i + j * j);
            let weight = exp(-dist_sq / 4.0);
            
            bloom_sum = bloom_sum + val * weight;
            weight_sum = weight_sum + weight;
        }
    }
    
    let bloom = bloom_sum / weight_sum;
    
    // 3. Pulse
    let pulse = 0.8 + 0.2 * sin(time * 3.0);
    
    // 4. Combine
    // Boost the center with bloom
    let final_intensity = (center * 0.6 + bloom * 0.8) * pulse;
    
    return apply_theme(final_intensity * 1.5, theme);
}

/// Calculate spatial gradient magnitude
/// Returns the magnitude of the local gradient
fn calculate_gradient(coords: vec2<i32>, texture_dims: vec2<u32>) -> f32 {
    let x0 = max(0, coords.x - 1);
    let x1 = min(i32(texture_dims.x) - 1, coords.x + 1);
    let y0 = max(0, coords.y - 1);
    let y1 = min(i32(texture_dims.y) - 1, coords.y + 1);
    
    // Sobel-like gradient calculation
    let left = textureLoad(source_texture, vec2<i32>(x0, coords.y), 0);
    let right = textureLoad(source_texture, vec2<i32>(x1, coords.y), 0);
    let top = textureLoad(source_texture, vec2<i32>(coords.x, y0), 0);
    let bottom = textureLoad(source_texture, vec2<i32>(coords.x, y1), 0);
    
    let i_left = pixel_intensity(left);
    let i_right = pixel_intensity(right);
    let i_top = pixel_intensity(top);
    let i_bottom = pixel_intensity(bottom);
    
    let grad_x = i_right - i_left;
    let grad_y = i_bottom - i_top;
    
    return sqrt(grad_x * grad_x + grad_y * grad_y);
}

/// Map gradient to color (edge detection style)
/// Edges = bright, flat regions = dark
fn gradient_heatmap(gradient: f32, theme: u32) -> vec3<f32> {
    let t = saturate(gradient * 3.0); // Amplify for visibility
    
    // Background is dark
    let bg = vec3<f32>(0.0, 0.0, 0.0);
    
    // Foreground color based on theme
    var fg: vec3<f32>;
    switch (theme) {
        case 1u: { fg = vec3<f32>(1.0, 0.0, 1.0); } // Cyberpunk Magenta
        case 2u: { fg = vec3<f32>(0.2, 1.0, 0.5); } // Bio Green
        case 3u: { fg = vec3<f32>(1.0, 0.5, 0.0); } // Thermal Orange
        case 4u: { fg = vec3<f32>(1.0, 1.0, 1.0); } // Monochrome White
        default: { fg = vec3<f32>(0.0, 1.0, 1.0); } // Default Cyan
    }
    
    return mix(bg, fg, t); 
}

// ============================================
// FRAGMENT SHADER
// ============================================

@fragment
fn fs_main(input: VertexOutput) -> FragmentOutput {
    var output: FragmentOutput;
    
    // Get texture dimensions
    let texture_dims = textureDimensions(source_texture);
    
    // Convert UV to pixel coordinates
    let pixel_x = i32(input.uv.x * f32(texture_dims.x));
    let pixel_y = i32(input.uv.y * f32(texture_dims.y));
    let coords = vec2<i32>(pixel_x, pixel_y);
    
    // Read source pixel
    let source_pixel = textureLoad(source_texture, coords, 0);
    // intensity not used directly anymore by activity, but kept if needed
    
    // Calculate Hilbert distance for layer mapping
    let hilbert_d = hilbert_xy2d(
        heatmap_params.grid_size,
        u32(pixel_x) % heatmap_params.grid_size,
        u32(pixel_y) % heatmap_params.grid_size
    );
    
    // Select visualization mode
    var heatmap_color: vec3<f32>;
    
    switch (heatmap_params.mode) {
        case 0u: {
            // Entropy mode
            let entropy = calculate_local_entropy(
                coords,
                texture_dims,
                heatmap_params.window_size
            );
            heatmap_color = entropy_heatmap(entropy, heatmap_params.theme_index);
        }
        case 1u: {
            // Layer mode
            heatmap_color = layer_heatmap(hilbert_d, heatmap_params.time, heatmap_params.theme_index);
        }
        case 2u: {
            // Activity mode
            heatmap_color = activity_heatmap(
                coords,
                texture_dims,
                heatmap_params.time,
                heatmap_params.theme_index
            );
        }
        case 3u: {
            // Gradient mode
            let gradient = calculate_gradient(coords, texture_dims);
            heatmap_color = gradient_heatmap(gradient, heatmap_params.theme_index);
        }
        default: {
            // Fallback to entropy
            let entropy = calculate_local_entropy(
                coords,
                texture_dims,
                heatmap_params.window_size
            );
            heatmap_color = entropy_heatmap(entropy, heatmap_params.theme_index);
        }
    }

    // Apply global holographic scanline for Cyberpunk theme
    if (heatmap_params.theme_index == 1u) {
        let scanline = 0.9 + 0.1 * sin(input.uv.y * 1000.0 + heatmap_params.time * 10.0);
        heatmap_color = heatmap_color * scanline;
    }
    
    // Combine heatmap with source texture using opacity
    // Use screen blend mode for better visibility
    let final_color = mix(source_pixel.rgb, heatmap_color, heatmap_params.opacity);
    
    // Output with full alpha
    output.color = vec4<f32>(final_color, 1.0);
    
    return output;
}
