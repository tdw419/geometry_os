// systems/visual_shell/web/shaders/neural_city.wgsl
// Procedural Building Shader for Neural City Visualization

struct CityUniforms {
    time: f32,
    agent_count: f32,
    metabolism_avg: f32,
    tectonic_active: f32,
}

struct BuildingData {
    position: vec2<f32>,
    height: f32,
    activity: f32,
    district: f32,
}

@group(0) @binding(0) var<uniform> uniforms: CityUniforms;
@group(0) @binding(1) var<storage, read> buildings: array<BuildingData>;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
}

fn get_district_color(district: f32) -> vec3<f32> {
    if (district < 0.5) {
        return vec3<f32>(0.0, 0.67, 1.0);  // Cognitive - Cyan
    } else if (district < 1.5) {
        return vec3<f32>(1.0, 0.53, 0.0);  // Metabolic - Orange
    } else {
        return vec3<f32>(0.0, 1.0, 0.53);  // Substrate - Green
    }
}

fn calculate_luminance(activity: f32, time: f32) -> f32 {
    let base = 0.3 + activity * 0.5;
    let pulse = sin(time * 2.0 + activity * 6.28) * 0.1;
    return clamp(base + pulse, 0.2, 1.0);
}

@vertex
fn vertex_main(
    @builtin(vertex_index) vertex_index: u32,
    @builtin(instance_index) instance_index: u32
) -> VertexOutput {
    var output: VertexOutput;
    let building = buildings[instance_index];
    let base_color = get_district_color(building.district);
    let luminance = calculate_luminance(building.activity, uniforms.time);

    // Generate cube vertices
    let cube_vertices = array<vec3<f32>, 8>(
        vec3<f32>(-0.5, 0.0, -0.5),
        vec3<f32>( 0.5, 0.0, -0.5),
        vec3<f32>( 0.5, 0.0,  0.5),
        vec3<f32>(-0.5, 0.0,  0.5),
        vec3<f32>(-0.5, building.height, -0.5),
        vec3<f32>( 0.5, building.height, -0.5),
        vec3<f32>( 0.5, building.height,  0.5),
        vec3<f32>(-0.5, building.height,  0.5),
    );

    let v = cube_vertices[vertex_index % 8u];
    output.position = vec4<f32>(
        building.position.x + v.x * 10.0,
        v.y,
        building.position.y + v.z * 10.0,
        1.0
    );
    output.color = vec4<f32>(base_color * luminance, 1.0);
    output.uv = vec2<f32>(v.x + 0.5, v.z + 0.5);
    return output;
}

@fragment
fn fragment_main(input: VertexOutput) -> @location(0) vec4<f32> {
    let light = 0.7 + 0.3 * input.uv.y;
    return vec4<f32>(input.color.rgb * light, input.color.a);
}

@compute @workgroup_size(64)
fn compute_layout(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    if (idx >= u32(uniforms.agent_count)) { return; }
    // Animation logic here
}
