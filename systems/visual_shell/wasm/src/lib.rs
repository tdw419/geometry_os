//! Visual Shell WASM Module - WebGPU Rendering
//!
//! Provides high-performance rendering for the visual shell in the browser.
//! Uses WebGPU (with WebGL fallback) for near-native performance.

use wasm_bindgen::prelude::*;
use serde::{Serialize, Deserialize};
use std::collections::HashMap;

// ============================================================================
// Console logging
// ============================================================================

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);

    #[wasm_bindgen(js_namespace = console)]
    fn error(s: &str);
}

macro_rules! console_log {
    ($($t:tt)*) => (log(&format_args!($($t)*).to_string()))
}

macro_rules! console_error {
    ($($t:tt)*) => (error(&format_args!($($t)*).to_string()))
}

// ============================================================================
// Tile Data
// ============================================================================

/// Internal tile data (not exposed to WASM directly)
#[derive(Clone, Debug, Serialize, Deserialize)]
struct TileData {
    x: i32,
    y: i32,
    z: u8,
    tile_type: u8,
    data: Vec<u8>,
    hash: u32,
    last_modified: u64,
}

/// A tile in the infinite map (WASM-friendly wrapper)
#[wasm_bindgen]
#[derive(Clone, Debug)]
pub struct Tile {
    inner: TileData,
}

#[wasm_bindgen]
impl Tile {
    #[wasm_bindgen(constructor)]
    pub fn new(x: i32, y: i32, z: u8, tile_type: u8) -> Self {
        Self {
            inner: TileData {
                x,
                y,
                z,
                tile_type,
                data: vec![0; 64],
                hash: 0,
                last_modified: 0,
            },
        }
    }

    pub fn x(&self) -> i32 { self.inner.x }
    pub fn y(&self) -> i32 { self.inner.y }
    pub fn z(&self) -> u8 { self.inner.z }
    pub fn tile_type(&self) -> u8 { self.inner.tile_type }
    pub fn hash(&self) -> u32 { self.inner.hash }

    pub fn set_data(&mut self, data: Vec<u8>) {
        self.inner.data = data;
        self.inner.hash = Self::compute_hash(&self.inner.data);
    }

    pub fn get_data(&self) -> Vec<u8> {
        self.inner.data.clone()
    }

    fn compute_hash(data: &[u8]) -> u32 {
        // Simple hash function
        let mut hash: u32 = 0;
        for &byte in data {
            hash = hash.wrapping_mul(31).wrapping_add(byte as u32);
        }
        hash
    }

    pub fn to_json(&self) -> String {
        serde_json::to_string(&self.inner).unwrap_or_else(|_| "{}".to_string())
    }
}

// ============================================================================
// Viewport State
// ============================================================================

/// Current viewport state for rendering
#[wasm_bindgen]
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Viewport {
    pub x: f32,
    pub y: f32,
    pub zoom: f32,
    pub width: u32,
    pub height: u32,
}

#[wasm_bindgen]
impl Viewport {
    #[wasm_bindgen(constructor)]
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            x: 0.0,
            y: 0.0,
            zoom: 1.0,
            width,
            height,
        }
    }

    pub fn pan(&mut self, dx: f32, dy: f32) {
        self.x += dx / self.zoom;
        self.y += dy / self.zoom;
    }

    pub fn zoom_at(&mut self, factor: f32, center_x: f32, center_y: f32) {
        let old_zoom = self.zoom;
        self.zoom = (self.zoom * factor).max(0.1).min(10.0);

        // Zoom towards center point
        let zoom_ratio = self.zoom / old_zoom;
        self.x = center_x - (center_x - self.x) * zoom_ratio;
        self.y = center_y - (center_y - self.y) * zoom_ratio;
    }

    /// Convert screen coords to world coords, returns [world_x, world_y]
    pub fn screen_to_world(&self, screen_x: f32, screen_y: f32) -> Vec<f32> {
        vec![
            self.x + screen_x / self.zoom,
            self.y + screen_y / self.zoom,
        ]
    }

    /// Convert world coords to screen coords, returns [screen_x, screen_y]
    pub fn world_to_screen(&self, world_x: f32, world_y: f32) -> Vec<f32> {
        vec![
            (world_x - self.x) * self.zoom,
            (world_y - self.y) * self.zoom,
        ]
    }

    /// Returns visible tile coordinates as flat array [x1, y1, x2, y2, ...]
    pub fn get_visible_tile_coords(&self, tile_size: u32) -> Vec<i32> {
        let half_w = (self.width as f32 / self.zoom / 2.0) as i32;
        let half_h = (self.height as f32 / self.zoom / 2.0) as i32;
        let tile_size = tile_size as i32;

        let min_x = (self.x as i32 - half_w) / tile_size - 1;
        let max_x = (self.x as i32 + half_w) / tile_size + 1;
        let min_y = (self.y as i32 - half_h) / tile_size - 1;
        let max_y = (self.y as i32 + half_h) / tile_size + 1;

        let mut coords = Vec::new();
        for y in min_y..=max_y {
            for x in min_x..=max_x {
                coords.push(x);
                coords.push(y);
            }
        }
        coords
    }

    /// Count of visible tiles (for JS convenience)
    pub fn count_visible_tiles(&self, tile_size: u32) -> usize {
        let half_w = (self.width as f32 / self.zoom / 2.0) as i32;
        let half_h = (self.height as f32 / self.zoom / 2.0) as i32;
        let tile_size = tile_size as i32;

        let min_x = (self.x as i32 - half_w) / tile_size - 1;
        let max_x = (self.x as i32 + half_w) / tile_size + 1;
        let min_y = (self.y as i32 - half_h) / tile_size - 1;
        let max_y = (self.y as i32 + half_h) / tile_size + 1;

        ((max_x - min_x + 1) * (max_y - min_y + 1)) as usize
    }
}

// ============================================================================
// Infinite Map Renderer
// ============================================================================

/// High-performance infinite map renderer
#[wasm_bindgen]
pub struct InfiniteMapRenderer {
    tiles: HashMap<(i32, i32), Tile>,
    viewport: Viewport,
    tile_size: u32,
    frame_count: u64,
    last_frame_time: f64,
    fps: f32,
}

#[wasm_bindgen]
impl InfiniteMapRenderer {
    #[wasm_bindgen(constructor)]
    pub fn new(width: u32, height: u32, tile_size: u32) -> Self {
        Self {
            tiles: HashMap::new(),
            viewport: Viewport::new(width, height),
            tile_size,
            frame_count: 0,
            last_frame_time: 0.0,
            fps: 0.0,
        }
    }

    /// Add or update a tile
    pub fn set_tile(&mut self, x: i32, y: i32, tile_type: u8, data: Vec<u8>) {
        let mut tile = Tile::new(x, y, 0, tile_type);
        tile.set_data(data);
        self.tiles.insert((x, y), tile);
    }

    /// Remove a tile
    pub fn remove_tile(&mut self, x: i32, y: i32) {
        self.tiles.remove(&(x, y));
    }

    /// Get tile count
    pub fn tile_count(&self) -> usize {
        self.tiles.len()
    }

    /// Update viewport dimensions
    pub fn resize(&mut self, width: u32, height: u32) {
        self.viewport.width = width;
        self.viewport.height = height;
    }

    /// Pan the viewport
    pub fn pan(&mut self, dx: f32, dy: f32) {
        self.viewport.pan(dx, dy);
    }

    /// Zoom the viewport
    pub fn zoom(&mut self, factor: f32, center_x: f32, center_y: f32) {
        self.viewport.zoom_at(factor, center_x, center_y);
    }

    /// Get viewport state as JSON
    pub fn get_viewport_json(&self) -> String {
        serde_json::to_string(&self.viewport).unwrap_or_else(|_| "{}".to_string())
    }

    /// Get visible tile coordinates as flat array [x1, y1, x2, y2, ...]
    pub fn get_visible_tile_coords(&self) -> Vec<i32> {
        self.viewport.get_visible_tile_coords(self.tile_size)
    }

    /// Count visible tiles
    pub fn count_visible_tiles(&self) -> usize {
        self.viewport.count_visible_tiles(self.tile_size)
    }

    /// Get tile data for a specific position (returns JSON or null)
    pub fn get_tile_json(&self, x: i32, y: i32) -> Option<String> {
        self.tiles.get(&(x, y)).map(|t| t.to_json())
    }

    /// Check if tile exists
    pub fn has_tile(&self, x: i32, y: i32) -> bool {
        self.tiles.contains_key(&(x, y))
    }

    /// Process one frame
    pub fn tick(&mut self, timestamp: f64) -> TickResult {
        // Calculate FPS
        if self.last_frame_time > 0.0 {
            let delta = timestamp - self.last_frame_time;
            if delta > 0.0 {
                let instant_fps = 1000.0 / delta;
                self.fps = self.fps * 0.9f32 + instant_fps as f32 * 0.1f32; // Smoothed FPS
            }
        }
        self.last_frame_time = timestamp;
        self.frame_count += 1;

        TickResult {
            frame: self.frame_count,
            fps: self.fps,
            visible_tiles: self.viewport.count_visible_tiles(self.tile_size),
            total_tiles: self.tiles.len(),
        }
    }

    /// Get performance metrics
    pub fn get_metrics(&self) -> String {
        serde_json::json!({
            "frame_count": self.frame_count,
            "fps": self.fps,
            "tile_count": self.tiles.len(),
            "viewport": {
                "x": self.viewport.x,
                "y": self.viewport.y,
                "zoom": self.viewport.zoom,
            }
        }).to_string()
    }
}

// ============================================================================
// Tick Result
// ============================================================================

/// Result of a simulation tick
#[wasm_bindgen]
#[derive(Serialize)]
pub struct TickResult {
    pub frame: u64,
    pub fps: f32,
    pub visible_tiles: usize,
    pub total_tiles: usize,
}

#[wasm_bindgen]
impl TickResult {
    pub fn to_json(&self) -> String {
        serde_json::to_string(self).unwrap_or_else(|_| "{}".to_string())
    }
}

// ============================================================================
// Neural City Integration
// ============================================================================

/// Bridge to Neural City WASM for citizen rendering
#[wasm_bindgen]
pub struct NeuralCityBridge {
    citizens: Vec<CitizenRender>,
    tick_count: u64,
}

/// Citizen render data
#[wasm_bindgen]
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct CitizenRender {
    pub id: u32,
    pub x: f32,
    pub y: f32,
    pub guild: u8,
    pub energy: f32,
    pub state: u8,
}

#[wasm_bindgen]
impl NeuralCityBridge {
    #[wasm_bindgen(constructor)]
    pub fn new() -> Self {
        Self {
            citizens: Vec::new(),
            tick_count: 0,
        }
    }

    /// Add a citizen for rendering
    pub fn add_citizen(&mut self, id: u32, x: f32, y: f32, guild: u8, energy: f32, state: u8) {
        self.citizens.push(CitizenRender {
            id,
            x,
            y,
            guild,
            energy,
            state,
        });
    }

    /// Update citizen position
    pub fn update_citizen(&mut self, id: u32, x: f32, y: f32, energy: f32, state: u8) {
        if let Some(citizen) = self.citizens.iter_mut().find(|c| c.id == id) {
            citizen.x = x;
            citizen.y = y;
            citizen.energy = energy;
            citizen.state = state;
        }
    }

    /// Remove a citizen
    pub fn remove_citizen(&mut self, id: u32) {
        self.citizens.retain(|c| c.id != id);
    }

    /// Get all citizens as JSON
    pub fn get_citizens_json(&self) -> String {
        serde_json::to_string(&self.citizens).unwrap_or_else(|_| "[]".to_string())
    }

    /// Get citizen count
    pub fn count(&self) -> usize {
        self.citizens.len()
    }

    /// Clear all citizens
    pub fn clear(&mut self) {
        self.citizens.clear();
    }

    /// Tick and return render data
    pub fn tick(&mut self) -> String {
        self.tick_count += 1;
        serde_json::json!({
            "tick": self.tick_count,
            "citizens": self.citizens,
            "count": self.citizens.len()
        }).to_string()
    }
}

// ============================================================================
// Initialization
// ============================================================================

/// Initialize WASM module
#[wasm_bindgen(start)]
pub fn init() {
    #[cfg(feature = "console_error_panic_hook")]
    console_error_panic_hook::set_once();

    console_log!("Visual Shell WASM initialized");
}

// ============================================================================
// Tests
// ============================================================================

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::*;

    #[wasm_bindgen_test]
    fn test_viewport_creation() {
        let viewport = Viewport::new(1024, 768);
        assert_eq!(viewport.width, 1024);
        assert_eq!(viewport.height, 768);
        assert_eq!(viewport.zoom, 1.0);
    }

    #[wasm_bindgen_test]
    fn test_viewport_pan() {
        let mut viewport = Viewport::new(1024, 768);
        viewport.pan(100.0, 50.0);
        assert_eq!(viewport.x, 100.0);
        assert_eq!(viewport.y, 50.0);
    }

    #[wasm_bindgen_test]
    fn test_tile_creation() {
        let tile = Tile::new(10, 20, 0, 1);
        assert_eq!(tile.x, 10);
        assert_eq!(tile.y, 20);
        assert_eq!(tile.tile_type, 1);
    }

    #[wasm_bindgen_test]
    fn test_infinite_map_renderer() {
        let mut renderer = InfiniteMapRenderer::new(1024, 768, 64);
        renderer.set_tile(0, 0, 1, vec![1; 64]);
        assert_eq!(renderer.tile_count(), 1);
    }

    #[wasm_bindgen_test]
    fn test_neural_city_bridge() {
        let mut bridge = NeuralCityBridge::new();
        bridge.add_citizen(1, 100.0, 200.0, 0, 1.0, 1);
        assert_eq!(bridge.count(), 1);

        bridge.update_citizen(1, 150.0, 250.0, 0.8, 1);
        let json = bridge.get_citizens_json();
        assert!(json.contains("\"x\":150.0"));
    }
}
