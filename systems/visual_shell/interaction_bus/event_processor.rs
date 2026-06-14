//! Event Processor - CPU-side event handling and GPU dispatch
//!
//! Processes input events and dispatches them to the GPU for window management.

use super::input_types::{InputEvent, EventQueueHeader, EVENT_QUEUE_SIZE};
use super::window_table::WindowTable;
use std::sync::Arc;
use wgpu::util::DeviceExt;

pub struct EventProcessor {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    pipeline: wgpu::ComputePipeline,
    bind_group_layout: wgpu::BindGroupLayout,
    
    header_buffer: wgpu::Buffer,
    event_buffer: wgpu::Buffer,
    global_state_buffer: wgpu::Buffer,
}

impl EventProcessor {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        let shader_source = include_str!("event_queue.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Event Processor Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Event Processor Bind Group Layout"),
            entries: &[
                // Binding 0: Header (RW)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 1: Queue (Read)
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 2: Window Table (RW)
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 3: Global State (RW)
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Event Processor Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Event Processor Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        let header = EventQueueHeader { head: 0, tail: 0, capacity: EVENT_QUEUE_SIZE, _padding: 0 };
        let header_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Event Queue Header Buffer"),
            contents: bytemuck::cast_slice(&[header]),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
        });

        let events = vec![InputEvent::default(); EVENT_QUEUE_SIZE as usize];
        let event_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Event Queue Buffer"),
            contents: bytemuck::cast_slice(&events),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
        });

        let global_state = [0.0f32; 4]; // x, y, focused_id, drag_id
        let global_state_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Global Interaction State Buffer"),
            contents: bytemuck::cast_slice(&global_state),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
        });

        Self {
            device,
            queue,
            pipeline,
            bind_group_layout,
            header_buffer,
            event_buffer,
            global_state_buffer,
        }
    }

    /// Process pending events on the GPU
    pub fn process_events(&self, window_table: &WindowTable) {
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Event Processor Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self.header_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: self.event_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: window_table.buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: self.global_state_buffer.as_entire_binding(),
                },
            ],
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Event Process Encoder"),
        });
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Event Process Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }
        self.queue.submit(std::iter::once(encoder.finish()));
    }

    /// Push an event from userspace (fallback if kernel module is not used)
    pub fn push_event(&self, event: InputEvent) {
        // This would involve reading the header, updating head, and writing the event.
        // For simplicity in this bridge, we assume the kernel module does this.
    }
}
