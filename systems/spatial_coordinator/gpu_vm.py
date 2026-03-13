"""GPU Glyph VM Bridge.

Connects Python to WebGPU for executing glyph bytecode on GPU.

Requirements:
- wgpu-py package: pip install wgpu

Usage:
    from systems.spatial_coordinator.gpu_vm import GPUGlyphVM

    vm = GPUGlyphVM()
    vm.load_app(app_bytes)
    vm.run()
    result = vm.read_register(0)
"""
import struct
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, List

# Try to import wgpu
try:
    import wgpu
    HAS_WGPU = True
except ImportError:
    HAS_WGPU = False
    wgpu = None


@dataclass
class GPUAppContext:
    """App context struct (matches WGSL)."""
    app_id: int = 0
    origin_x: int = 0
    origin_y: int = 0
    width: int = 0
    height: int = 0
    pc: int = 0
    halted: int = 0
    flags: int = 0
    _pad: int = 0
    _pad2: int = 0

    def to_bytes(self) -> bytes:
        return struct.pack('<10I',
            self.app_id, self.origin_x, self.origin_y,
            self.width, self.height, self.pc, self.halted,
            self.flags, self._pad, self._pad2
        )


class GPUGlyphVM:
    """GPU-accelerated Glyph VM using WebGPU compute shaders.

    This is the production VM that runs on GPU for maximum performance.
    Falls back to CPU VM if WebGPU not available.
    """

    MAX_APPS = 64
    MAX_STEPS = 1000
    MEMORY_SIZE = 65536  # 64KB per app

    def __init__(self):
        self._device = None
        self._context_buffer = None
        self._register_buffers = None
        self._memory_buffers = None
        self._stack_buffers = None
        self._syscall_buffer = None
        self._pipeline = None

        # CPU fallback state
        self._apps: List[dict] = []
        self._next_app_id = 0

        if HAS_WGPU:
            self._init_wgpu()

    def _init_wgpu(self):
        """Initialize WebGPU device and buffers."""
        try:
            # Create device
            adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
            self._device = adapter.request_device_sync()

            # Create buffers
            # App contexts (64 apps * 40 bytes each)
            self._context_buffer = self._device.create_buffer(
                size=self.MAX_APPS * 40,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # Register files (64 apps * 32 regs * 4 bytes)
            self._register_buffers = self._device.create_buffer(
                size=self.MAX_APPS * 32 * 4,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # App memories (64 apps * 64KB)
            self._memory_buffers = self._device.create_buffer(
                size=self.MAX_APPS * self.MEMORY_SIZE,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # Call stacks (64 apps * 64 frames * 16 bytes)
            self._stack_buffers = self._device.create_buffer(
                size=self.MAX_APPS * 64 * 16,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # Syscall queue (256 * 32 bytes)
            self._syscall_buffer = self._device.create_buffer(
                size=256 * 32,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # Syscall count (atomic counter)
            self._syscall_count_buffer = self._device.create_buffer(
                size=4,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.COPY_SRC
            )

            # Load shader (optional - may not exist yet)
            shader_path = Path(__file__).parent / "wgsl" / "glyph_vm.wgsl"
            if shader_path.exists():
                shader_code = shader_path.read_text()
                self._shader_module = self._device.create_shader_module(code=shader_code)

                # Create compute pipeline with 'auto' layout
                self._pipeline = self._device.create_compute_pipeline(
                    layout="auto",
                    compute={"module": self._shader_module, "entry_point": "execute_all_apps"}
                )
            else:
                self._pipeline = None

        except Exception as e:
            # GPU init failed, will use CPU fallback
            print(f"GPU init failed, using CPU fallback: {e}")
            self._device = None
            self._pipeline = None

    def _create_bind_group_layout(self):
        """Create bind group layout for the shader."""
        return self._device.create_bind_group_layout(
            entries=[
                {"binding": 0, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
                {"binding": 1, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
                {"binding": 2, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
                {"binding": 3, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
                {"binding": 4, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
                {"binding": 5, "visibility": wgpu.ShaderStage.COMPUTE, "buffer": {"type": "storage"}},
            ]
        )

    @property
    def has_gpu(self) -> bool:
        """Check if GPU is available and working."""
        # GPU requires: wgpu library, device, and pipeline
        return HAS_WGPU and self._device is not None and self._pipeline is not None

    def load_app(self, app_bytes: bytes, origin_x: int = 0, origin_y: int = 0) -> Optional[int]:
        """Load app into VM.

        Args:
            app_bytes: Raw app binary (header + code)
            origin_x: Region X coordinate
            origin_y: Region Y coordinate

        Returns:
            app_id on success, None on failure
        """
        if len(app_bytes) < 16:
            return None

        # Parse header
        if app_bytes[:4] != b'GEOS':
            return None

        width = struct.unpack('<H', app_bytes[4:6])[0]
        height = struct.unpack('<H', app_bytes[6:8])[0]

        app_id = self._next_app_id
        self._next_app_id += 1

        # Create app context
        ctx = GPUAppContext(
            app_id=app_id,
            origin_x=origin_x,
            origin_y=origin_y,
            width=width,
            height=height,
            pc=16,  # Entry point after header
        )

        # Store app data (CPU fallback)
        self._apps.append({
            'id': app_id,
            'context': ctx,
            'memory': bytearray(app_bytes) + bytearray(self.MEMORY_SIZE - len(app_bytes)),
            'registers': [0] * 32,
            'halted': False,
            'flags': 0,
            'stack': [],
        })

        # If GPU available, upload to buffers
        if self.has_gpu:
            self._upload_app_to_gpu(app_id)

        return app_id

    def run(self, max_frames: int = 1) -> int:
        """Run VM for specified frames.

        Args:
            max_frames: Number of frames to run (0 = until all halted)

        Returns:
            Total steps executed
        """
        if self.has_gpu:
            return self._run_gpu(max_frames)
        else:
            return self._run_cpu(max_frames)

    def _run_gpu(self, max_frames: int) -> int:
        """Run on GPU using compute shaders."""
        frames_run = 0

        # Sync all CPU state to GPU before execution
        self._sync_all_to_gpu()

        while max_frames == 0 or frames_run < max_frames:
            # Check if any apps still running
            all_halted = all(app['halted'] for app in self._apps if app)
            if all_halted:
                break

            # Create command encoder
            encoder = self._device.create_command_encoder()

            # Create bind group with all buffers
            bind_group = self._device.create_bind_group(
                layout=self._pipeline.get_bind_group_layout(0),
                entries=[
                    {"binding": 0, "resource": {"buffer": self._context_buffer}},
                    {"binding": 1, "resource": {"buffer": self._register_buffers}},
                    {"binding": 2, "resource": {"buffer": self._memory_buffers}},
                    {"binding": 3, "resource": {"buffer": self._stack_buffers}},
                    {"binding": 4, "resource": {"buffer": self._syscall_buffer}},
                    {"binding": 5, "resource": {"buffer": self._syscall_count_buffer}},
                ]
            )

            # Dispatch compute
            compute_pass = encoder.begin_compute_pass()
            compute_pass.set_pipeline(self._pipeline)
            compute_pass.set_bind_group(0, bind_group)
            compute_pass.dispatch_workgroups(self.MAX_APPS)
            compute_pass.end()

            # Submit
            self._device.queue.submit([encoder.finish()])

            # Read back results
            self._read_back_from_gpu()

            frames_run += 1

        return frames_run * self.MAX_STEPS

    def _sync_all_to_gpu(self):
        """Sync all CPU app state to GPU buffers."""
        for app_id, app in enumerate(self._apps):
            if app is None:
                continue
            self._upload_app_to_gpu(app_id)

    def _upload_app_to_gpu(self, app_id: int):
        """Upload app data to GPU buffers."""
        app = self._apps[app_id]

        # Upload context
        offset = app_id * 40
        self._device.queue.write_buffer(self._context_buffer, offset, app['context'].to_bytes())

        # Upload memory
        offset = app_id * self.MEMORY_SIZE
        self._device.queue.write_buffer(self._memory_buffers, offset, bytes(app['memory']))

        # Upload registers
        offset = app_id * 32 * 4
        reg_data = struct.pack('<32I', *app['registers'])
        self._device.queue.write_buffer(self._register_buffers, offset, reg_data)

    def _run_cpu(self, max_frames: int) -> int:
        """Run on CPU (fallback)."""
        # Import CPU VM
        from .glyph_vm import GlyphVM

        total_steps = 0

        for app in self._apps:
            if app is None or app['halted']:
                continue

            # Create CPU VM for this app
            cpu_vm = GlyphVM()

            # Copy state
            cpu_vm.memory[:] = app['memory']
            cpu_vm.registers = app['registers'].copy()
            cpu_vm.pc = app['context'].pc
            cpu_vm.halted = app['halted']
            cpu_vm.flags = app['flags']

            # Run
            steps = cpu_vm.run(max_frames=0)
            total_steps += steps

            # Copy back state
            app['memory'][:] = cpu_vm.memory
            app['registers'] = cpu_vm.registers
            app['context'].pc = cpu_vm.pc
            app['halted'] = cpu_vm.halted
            app['flags'] = cpu_vm.flags

        return total_steps

    def _read_back_from_gpu(self):
        """Read back app state from GPU buffers."""
        if not self._device or not self._apps:
            return

        try:
            # Read context buffer (app states)
            context_data = self._read_buffer_sync(self._context_buffer)
            for i, app in enumerate(self._apps):
                if app is None:
                    continue
                offset = i * 40
                if offset + 40 <= len(context_data):
                    # Parse AppContext struct (10 u32s)
                    ctx_bytes = context_data[offset:offset + 40]
                    values = struct.unpack('<10I', ctx_bytes)
                    app['context'].pc = values[5]
                    app['halted'] = bool(values[6])
                    app['flags'] = values[7]

            # Read register buffer
            reg_data = self._read_buffer_sync(self._register_buffers)
            for i, app in enumerate(self._apps):
                if app is None:
                    continue
                offset = i * 32 * 4
                if offset + 128 <= len(reg_data):
                    app['registers'] = list(struct.unpack('<32I', reg_data[offset:offset + 128]))

        except Exception as e:
            # Read-back failed, apps may have stale state
            print(f"GPU read-back failed: {e}")

    def _read_buffer_sync(self, buffer) -> bytes:
        """Synchronously read GPU buffer contents.

        Creates a staging buffer, copies, maps, and reads.
        """
        size = buffer.size

        # Create staging buffer (MAP_READ | COPY_DST)
        staging = self._device.create_buffer(
            size=size,
            usage=wgpu.BufferUsage.MAP_READ | wgpu.BufferUsage.COPY_DST
        )

        # Create command encoder for copy
        encoder = self._device.create_command_encoder()
        encoder.copy_buffer_to_buffer(buffer, 0, staging, 0, size)
        self._device.queue.submit([encoder.finish()])

        # Map and read (sync)
        staging.map_sync(mode=wgpu.MapMode.READ)
        try:
            data = staging.read_mapped()
            return bytes(data)
        finally:
            staging.unmap()

    def read_register(self, app_id: int, reg: int) -> int:
        """Read a register value."""
        if app_id >= len(self._apps) or self._apps[app_id] is None:
            return 0
        return self._apps[app_id]['registers'][reg]

    def write_register(self, app_id: int, reg: int, value: int):
        """Write a register value."""
        if app_id >= len(self._apps) or self._apps[app_id] is None:
            return
        self._apps[app_id]['registers'][reg] = value & 0xFFFFFFFF

    def read_memory(self, app_id: int, addr: int, size: int = 4) -> bytes:
        """Read from app memory."""
        if app_id >= len(self._apps) or self._apps[app_id] is None:
            return b'\x00' * size
        return bytes(self._apps[app_id]['memory'][addr:addr+size])

    def write_memory(self, app_id: int, addr: int, data: bytes):
        """Write to app memory."""
        if app_id >= len(self._apps) or self._apps[app_id] is None:
            return
        self._apps[app_id]['memory'][addr:addr+len(data)] = data

    def set_interrupt(self, app_id: int, int_type: int, payload: int, source: int = 0):
        """Set interrupt registers for an app."""
        from .opcodes import R_INT_TYPE, R_INT_PAYLOAD, R_INT_SOURCE
        self.write_register(app_id, R_INT_TYPE, int_type)
        self.write_register(app_id, R_INT_PAYLOAD, payload)
        self.write_register(app_id, R_INT_SOURCE, source)

    def is_halted(self, app_id: int) -> bool:
        """Check if app is halted."""
        if app_id >= len(self._apps) or self._apps[app_id] is None:
            return True
        return self._apps[app_id]['halted']

    @property
    def app_count(self) -> int:
        """Number of loaded apps."""
        return sum(1 for app in self._apps if app is not None)


# Demo
if __name__ == "__main__":
    print("GPU Glyph VM Demo")
    print("=" * 40)
    print(f"WebGPU available: {HAS_WGPU}")

    vm = GPUGlyphVM()
    print(f"GPU mode: {vm.has_gpu}")

    if HAS_WGPU:
        print(f"Device: {vm._device}")
    else:
        print("Falling back to CPU execution")
