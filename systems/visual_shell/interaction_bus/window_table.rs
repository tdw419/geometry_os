//! Window Table - GPU-resident window state management
//!
//! The window table lives in VRAM and is accessed directly by the GPU event consumer shader.

use super::input_types::{WindowState, MAX_WINDOWS};
use std::sync::Arc;
use wgpu::util::DeviceExt;

/// Window table stored in GPU buffer
pub struct WindowTable {
    /// GPU buffer containing window states
    pub buffer: wgpu::Buffer,
    /// Local copy of window states for quick lookups
    pub states: Vec<WindowState>,
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
}

impl WindowTable {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        let states = vec![WindowState {
            x: 0.0,
            y: 0.0,
            width: 0.0,
            height: 0.0,
            z_order: 0,
            focused: 0,
            window_id: 0,
            _padding: 0,
        }; MAX_WINDOWS as usize];

        let buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Window Table Buffer"),
            contents: bytemuck::cast_slice(&states),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
        });

        Self {
            buffer,
            states,
            device,
            queue,
        }
    }

    /// Register a new window in the table
    pub fn register_window(&mut self, id: u32, x: f32, y: f32, width: f32, height: f32) -> Option<usize> {
        if let Some(idx) = self.states.iter().position(|w| w.window_id == 0) {
            self.states[idx] = WindowState {
                x, y, width, height,
                z_order: (idx + 1) as u32,
                focused: 0,
                window_id: id,
                _padding: 0,
            };
            self.sync_to_gpu();
            Some(idx)
        } else {
            None
        }
    }

    /// Sync the entire local table to GPU memory
    pub fn sync_to_gpu(&self) {
        self.queue.write_buffer(&self.buffer, 0, bytemuck::cast_slice(&self.states));
    }

    /// Update window position (called by CPU logic if needed, though shader handles most)
    pub fn move_window(&mut self, id: u32, x: f32, y: f32) {
        if let Some(win) = self.states.iter_mut().find(|w| w.window_id == id) {
            win.x = x;
            win.y = y;
            self.sync_to_gpu();
        }
    }
}
