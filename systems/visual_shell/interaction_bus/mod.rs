//! Visual Interaction Bus Module
//!
//! Connects physical HID events to the Glyph VM window table via zero-copy VRAM path.

pub mod input_types;
pub mod window_table;
pub mod event_processor;

pub use input_types::{InputEvent, EventType, WindowState, EventQueueHeader, EVENT_QUEUE_SIZE, MAX_WINDOWS};
