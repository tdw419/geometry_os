//! Visual Interaction Bus - Input Types
//!
//! Shared types between kernel module, GPU shaders, and userspace.
//! These MUST stay in sync with geometry_input.ko and event_queue.wgsl

use bytemuck::{Pod, Zeroable};

/// Maximum events in the VRAM ring buffer
pub const EVENT_QUEUE_SIZE: u32 = 1024;
/// Maximum windows in the global window table
pub const MAX_WINDOWS: u32 = 256;

/// Event types supported by the Visual Interaction Bus
#[repr(u32)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EventType {
    None = 0,
    MouseMove = 1,
    MouseDown = 2,
    MouseUp = 3,
    KeyDown = 4,
    KeyUp = 5,
    WindowFocus = 6,
    WindowDrag = 7,
    WindowResize = 8,
}

/// Input event structure (Matches C struct in geometry_input.c)
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct InputEvent {
    pub timestamp_ns: u64,
    pub event_type: u32,
    pub device_id: u32,
    pub x: f32,
    pub y: f32,
    pub dx: f32,
    pub dy: f32,
    pub code: u32,
    pub modifiers: u32,
    /// Attention weight for prioritization (0.0 = ignore, 1.0 = normal, >1.0 = boosted)
    pub attention_weight: f32,
}

impl Default for InputEvent {
    fn default() -> Self {
        Self {
            timestamp_ns: 0,
            event_type: EventType::None as u32,
            device_id: 0,
            x: 0.0,
            y: 0.0,
            dx: 0.0,
            dy: 0.0,
            code: 0,
            modifiers: 0,
            attention_weight: 1.0, // Normal attention weight by default
        }
    }
}

/// Event queue header for the VRAM ring buffer
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct EventQueueHeader {
    pub head: u32, // Written by Kernel Module
    pub tail: u32, // Read by GPU Shader
    pub capacity: u32,
    pub _padding: u32,
}

/// Window state in the global window table
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct WindowState {
    pub x: f32,
    pub y: f32,
    pub width: f32,
    pub height: f32,
    pub z_order: u32,
    pub focused: u32,
    pub window_id: u32,
    pub _padding: u32,
}
