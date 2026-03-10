"""
PixelBrain Inference Pipeline

Orchestrates the 4 WGSL shaders for inference:
1. embed (0xD0) - Token -> Hidden
2. attend (0xD1) - Self-Attention
3. project (0xD2) - FFN
4. sample (0xD3) - Hidden -> Token

WebGPU native execution for production.

Task 9.2: Glass Box Introspection
- Attention output buffer for visualization
- Real-time ATTENTION_UPDATE emissions
"""

import json
import numpy as np
from pathlib import Path
from typing import Optional, List, Any
import logging
import time

try:
    import wgpu
except ImportError:
    wgpu = None

logger = logging.getLogger(__name__)

# Constants for attention visualization
NUM_HEADS = 8
MAX_SEQ_LEN = 1024


class PixelBrainPipeline:
    """
    Native Geometry OS LLM inference pipeline.

    Loads a Hilbert-folded RTS.PNG brain atlas and executes
    inference using WGSL compute shaders on WGPU.
    """

    def __init__(self, brain_path: str, visual_bridge: Optional[Any] = None):
        """
        Initialize pipeline from a PixelBrain RTS.PNG.

        Args:
            brain_path: Path to .rts.png file (meta.json should be adjacent)
            visual_bridge: Optional VisualBridge for telemetry/glow effects
        """
        self.brain_path = Path(brain_path)
        self.visual_bridge = visual_bridge
        self.atlas: Optional[np.ndarray] = None
        self.metadata: dict = {}
        self.config: dict = {}
        self.model_id: str = "unknown"
        self.encoding: str = "uint8-normalized"
        self._hilbert = None

        self.device = None
        self.pipelines = {}
        self.buffers = {}
        self.textures = {}
        self._wgpu_initialized = False

        self._load_metadata()
        self._load_atlas()
        self._init_hilbert()
        self._init_wgpu()

    def _load_metadata(self):
        """Load brain configuration from meta.json."""
        meta_path = Path(str(self.brain_path) + ".meta.json")
        if not meta_path.exists():
            raise FileNotFoundError(f"Brain metadata not found: {meta_path}")

        with open(meta_path) as f:
            self.metadata = json.load(f)

        self.config = self.metadata.get("config", {})
        self.model_id = self.metadata.get("model_id", "unknown")
        self.encoding = self.metadata.get("encoding", "uint8-normalized")

        logger.info(f"Loaded PixelBrain: {self.model_id}")
        logger.info(
            f"  dim={self.config.get('dim')}, "
            f"layers={self.config.get('layers')}, "
            f"vocab={self.config.get('vocab')}"
        )

    def _load_atlas(self):
        """Load the weight atlas into memory."""
        # 1. Try raw .f16 sidecar first (best for precision)
        f16_path = self.brain_path.with_suffix(self.brain_path.suffix + ".f16")
        if f16_path.exists():
            logger.info(f"Loading raw float16 atlas: {f16_path}")
            size = self.config.get("grid_size", 2048) # Default 2048
            raw_data = np.fromfile(f16_path, dtype=np.float16)
            # Reshape to (size, size, 4)
            # If size * size * 4 doesn't match raw_data.size, we calculate the actual size
            if raw_data.size != size * size * 4:
                size = int(np.sqrt(raw_data.size / 4))
            self.atlas = raw_data.reshape((size, size, 4))
            logger.info(f"Atlas shape (f16): {self.atlas.shape}")
            return

        try:
            import imageio

            if not self.brain_path.exists():
                raise FileNotFoundError(f"Brain atlas not found: {self.brain_path}")

            self.atlas = imageio.imread(str(self.brain_path))
            logger.info(f"Atlas shape: {self.atlas.shape}, dtype: {self.atlas.dtype}")

        except ImportError:
            # Fallback to PIL if imageio not available
            from PIL import Image

            if not self.brain_path.exists():
                raise FileNotFoundError(f"Brain atlas not found: {self.brain_path}")

            img = Image.open(str(self.brain_path))
            self.atlas = np.array(img)
            logger.info(f"Atlas shape: {self.atlas.shape}, dtype: {self.atlas.dtype}")

    def _init_hilbert(self):
        """Initialize Hilbert curve for coordinate lookup."""
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        # Calculate order from atlas size
        size = self.atlas.shape[0]
        order = int(np.log2(size))
        self._hilbert = HilbertCurve(order)
        self._hilbert.generate_lut()

    def _init_wgpu(self):
        """Initialize WebGPU device and pipelines."""
        if wgpu is None:
            logger.warning("wgpu-py not installed, WGPU execution unavailable")
            return

        try:
            # Request adapter and device
            adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
            if not adapter:
                logger.warning("No WGPU adapter found")
                return
            self.device = adapter.request_device_sync()

            # Create buffers and textures
            self._create_gpu_resources()

            # Compile shaders and create pipelines
            self._create_pipelines()

            self._wgpu_initialized = True
            logger.info("WGPU initialized successfully")
        except Exception as e:
            logger.error(f"Failed to initialize WGPU: {e}")

    def _create_gpu_resources(self):
        """Create storage buffers and textures on GPU."""
        dim = self.config.get("dim", 64)
        vocab = self.config.get("vocab", 50257)
        max_seq_len = MAX_SEQ_LEN

        # 1. Atlas Texture
        atlas_size = self.atlas.shape[0]
        self.textures["atlas"] = self.device.create_texture(
            size=(atlas_size, atlas_size, 1),
            usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
            format=wgpu.TextureFormat.rgba32float,
        )

        # Prepare atlas data
        atlas_data = self.atlas.astype(np.float32)
        if self.atlas.dtype == np.uint8:
            atlas_data = (atlas_data / 255.0) * 2.0 - 1.0

        # Ensure RGBA
        if atlas_data.ndim == 2:
            # Expand grayscale to RGBA (though atlas should be RGBA)
            rgba = np.zeros((atlas_size, atlas_size, 4), dtype=np.float32)
            for i in range(4): rgba[:,:,i] = atlas_data
            atlas_data = rgba
        elif atlas_data.shape[2] == 3:
            # Add alpha channel
            rgba = np.zeros((atlas_size, atlas_size, 4), dtype=np.float32)
            rgba[:,:,:3] = atlas_data
            rgba[:,:,3] = 1.0
            atlas_data = rgba

        self.device.queue.write_texture(
            {"texture": self.textures["atlas"]},
            atlas_data,
            {"bytes_per_row": atlas_size * 16, "rows_per_image": atlas_size},
            (atlas_size, atlas_size, 1),
        )

        # 2. Hidden State Buffer (R2)
        # Size: max_seq_len * dim * 4 bytes
        self.buffers["hidden"] = self.device.create_buffer(
            size=max_seq_len * dim * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
        )

        # 3. Token Buffer (R1/R3)
        self.buffers["tokens"] = self.device.create_buffer(
            size=max_seq_len * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
        )

        # 4. Logits Buffer
        self.buffers["logits"] = self.device.create_buffer(
            size=vocab * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
        )

        # 5. RNG Buffer
        self.buffers["rng"] = self.device.create_buffer(
            size=4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST,
        )
        self.device.queue.write_buffer(self.buffers["rng"], 0, np.array([int(time.time())], dtype=np.uint32))

        # ====================================================================
        # Task 9.2: Attention Output Buffer for Glass Box Introspection
        # Size: NUM_HEADS * MAX_SEQ_LEN * 4 bytes (one float per head per position)
        # ====================================================================
        attention_buffer_size = NUM_HEADS * MAX_SEQ_LEN * 4
        self.buffers["attention"] = self.device.create_buffer(
            size=attention_buffer_size,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
        )
        logger.info(f"Created attention output buffer: {attention_buffer_size} bytes")

        # 6. KV-Cache Texture (1024x1024 RGBA32Float)
        self.textures["kv_cache"] = self.device.create_texture(
            size=(MAX_SEQ_LEN, 1024, 1),
            usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.TEXTURE_BINDING,
            format=wgpu.TextureFormat.rgba32float,
        )
        logger.info(f"Created KV-Cache texture: {MAX_SEQ_LEN}x1024")

    def _create_pipelines(self):
        """Compile WGSL shaders into pipelines."""
        shader_dir = Path(__file__).parent

        def create_comp_pipeline(shader_name, entry_point="main"):
            shader_path = shader_dir / f"{shader_name}.wgsl"
            with open(shader_path) as f:
                code = f.read()

            module = self.device.create_shader_module(code=code)
            return self.device.create_compute_pipeline(
                layout="auto",
                compute={"module": module, "entry_point": entry_point},
            )

        self.pipelines["embed"] = create_comp_pipeline("pixel_brain_embed")
        self.pipelines["attend"] = create_comp_pipeline("pixel_brain_attention")
        self.pipelines["project"] = create_comp_pipeline("pixel_brain_project")
        self.pipelines["kv_append"] = create_comp_pipeline("kv_append")

        # Sample shader has multiple entry points
        self.pipelines["sample_logits"] = create_comp_pipeline("pixel_brain_sample", "compute_logits")
        self.pipelines["sample_greedy"] = create_comp_pipeline("pixel_brain_sample", "sample_greedy")
        self.pipelines["sample_stochastic"] = create_comp_pipeline("pixel_brain_sample", "sample")

    def kv_append_gpu(self, layer: int, position: int, hidden: np.ndarray, kv_type: int = 0):
        """
        Append a vector (K or V) to the persistent GPU KV-cache.
        
        Args:
            layer: Transformer layer (0-7)
            position: Sequence position (0-1023)
            hidden: Vector data (64-dim)
            kv_type: 0 for Key, 1 for Value
        """
        if not self._wgpu_initialized:
            return

        # 1. Update temporary vector buffer (reuse RNG buffer or similar, or create new)
        # Better: Hidden state buffer R2 is usually where the vector is.
        # But for this API, we upload from CPU for now.
        temp_buffer = self.device.create_buffer(
            size=hidden.nbytes, 
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
        )
        self.device.queue.write_buffer(temp_buffer, 0, hidden.astype(np.float32))

        # 2. Update KV Config
        # struct KVConfig { layer_idx: u32, position: u32, kv_type: u32, _pad: u32 }
        config_data = np.array([layer, position, kv_type, 0], dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=16, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        # 3. Create bind group
        bind_group = self.device.create_bind_group(
            layout=self.pipelines["kv_append"].get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": {"buffer": config_buffer, "offset": 0, "size": 16}},
                {"binding": 1, "resource": {"buffer": temp_buffer, "offset": 0, "size": temp_buffer.size}},
                {"binding": 2, "resource": self.textures["kv_cache"].create_view()},
            ],
        )

        # 4. Dispatch
        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["kv_append"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups(1) # 16 threads in one workgroup
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

        logger.debug(f"KV_APPEND: layer={layer} pos={position} type={'K' if kv_type==0 else 'V'}")


    def embed_token(self, token_id: int, position: int = 0) -> np.ndarray:
        """
        Look up token embedding from atlas using WGPU.
        """
        if not self._wgpu_initialized:
            return self._embed_token_cpu(token_id)

        dim = self.config.get("dim", 64)
        atlas_size = self.atlas.shape[0]

        # 1. Update input tokens buffer
        self.device.queue.write_buffer(self.buffers["tokens"], position * 4, np.array([token_id], dtype=np.uint32))

        # 2. Update config uniform
        # struct EmbedConfig { batch_size: u32, atlas_size: u32, embed_sector_start: u32, position_offset: u32 }
        config_data = np.array([1, atlas_size, 0, position], dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=config_data.nbytes, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        # 3. Create bind group
        bind_group = self.device.create_bind_group(
            layout=self.pipelines["embed"].get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": self.textures["atlas"].create_view()},
                {"binding": 1, "resource": {"buffer": self.buffers["tokens"], "offset": 0, "size": self.buffers["tokens"].size}},
                {"binding": 2, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 3, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
            ],
        )

        # 4. Dispatch
        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["embed"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups(1)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

        # Visualization trigger
        if self.visual_bridge:
            # Embedding uses pixels starting from Hilbert index 0
            # 16 pixels per token for dim=64
            pixels_per_token = dim // 4
            weight_indices = [token_id * pixels_per_token + i for i in range(pixels_per_token)]
            self.visual_bridge.emit_atlas_glow(weight_indices, intensity=0.8)

        # 5. Read back (for this specific method API, though forward() won't)
        return self._read_hidden(position)

    def _embed_token_cpu(self, token_id: int) -> np.ndarray:
        """CPU fallback for embedding."""
        dim = self.config.get("dim", 64)
        vocab = self.config.get("vocab", 50257)
        if token_id < 0 or token_id >= vocab: raise ValueError(f"Invalid token_id: {token_id}")
        hidden = np.zeros(dim, dtype=np.float32)
        for i in range(dim):
            atlas_idx = token_id * dim + i
            if atlas_idx < len(self._hilbert._lut):
                x, y = self._hilbert._lut[atlas_idx]
                channel = atlas_idx % 4
                val = self.atlas[y, x, channel] if self.atlas.ndim == 3 else self.atlas[y, x]
                if self.atlas.dtype == np.uint8:
                    hidden[i] = (val / 255.0) * 2.0 - 1.0
                else:
                    hidden[i] = float(val)
        return hidden

    def _read_hidden(self, position: int) -> np.ndarray:
        """Read hidden state from GPU."""
        dim = self.config.get("dim", 64)
        # Create staging buffer
        staging_buffer = self.device.create_buffer(
            size=dim * 4,
            usage=wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.MAP_READ,
        )
        encoder = self.device.create_command_encoder()
        encoder.copy_buffer_to_buffer(
            self.buffers["hidden"], position * dim * 4,
            staging_buffer, 0,
            dim * 4
        )
        self.device.queue.submit([encoder.finish()])

        staging_buffer.map_sync(wgpu.MapMode.READ)
        data = staging_buffer.read_mapped()
        return np.frombuffer(data, dtype=np.float32)

    def forward(self, token_id: int, position: int = 0) -> np.ndarray:
        """
        Run complete forward pass using WGPU.
        """
        if not self._wgpu_initialized:
            # Step 1: Embed
            hidden = self._embed_token_cpu(token_id)
            # Step 2: Transformer layers (attention + ffn stubs)
            num_layers = self.config.get("layers", 8)
            for layer in range(num_layers):
                hidden = self._attention_layer(hidden, layer)
                hidden = self._ffn_layer(hidden, layer)
            # Step 3: LM Head
            return self._lm_head(hidden)

        # 1. Embed
        self.embed_token(token_id, position)

        # 2. Layers
        num_layers = self.config.get("layers", 8)
        for layer in range(num_layers):
            self._attention_layer_gpu(layer, position)
            self._ffn_layer_gpu(layer, position)

        # 3. Sample (Logits)
        return self._sample_gpu(position)

    def _attention_layer_gpu(self, layer: int, position: int):
        """Execute attention shader on GPU."""
        atlas_size = self.atlas.shape[0]
        # struct AttentionConfig { layer_idx: u32, seq_len: u32, atlas_size: u32, _pad: u32 }
        config_data = np.array([layer, position + 1, atlas_size, 0], dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=config_data.nbytes, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        # ====================================================================
        # Task 9.2: Include attention output buffer in bind group (binding 2)
        # ====================================================================
        bind_group = self.device.create_bind_group(
            layout=self.pipelines["attend"].get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": self.textures["atlas"].create_view()},
                {"binding": 1, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 2, "resource": {"buffer": self.buffers["attention"], "offset": 0, "size": self.buffers["attention"].size}},
                {"binding": 3, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
            ],
        )

        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["attend"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups(1)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

        # Visualization
        if self.visual_bridge:
            # Highlight attention weights sector for this layer
            # Approximate indices for visualization
            EMBED_SIZE = 50257 * 64
            LAYER_SIZE = 4 * 64 * 64 + 3 * 64 * 256 # Match WGSL approx
            layer_start_pixel = (EMBED_SIZE + layer * LAYER_SIZE) // 4
            self.visual_bridge.emit_atlas_glow(
                [layer_start_pixel + i for i in range(0, 1024, 64)], # Sparsely highlight the sector
                intensity=0.4
            )

        # ====================================================================
        # Task 9.2: Read and emit attention weights for visualization
        # ====================================================================
        if self.visual_bridge:
            # Read attention weights for each head and emit updates
            seq_len = position + 1
            for head in range(NUM_HEADS):
                try:
                    weights = self._read_attention_weights(layer, head, seq_len)
                    # Emit ATTENTION_UPDATE message via visual bridge
                    self.visual_bridge.emit_attention_update(
                        layer=layer,
                        head=head,
                        weights=weights.tolist()
                    )
                except Exception as e:
                    logger.debug(f"Could not read attention weights for head {head}: {e}")

    def _read_attention_weights(self, layer: int, head: int, seq_len: int) -> np.ndarray:
        """
        Read attention weights from GPU for a specific head.

        Task 9.2: Glass Box Introspection

        Args:
            layer: Transformer layer index (0-7)
            head: Attention head index (0-7)
            seq_len: Current sequence length

        Returns:
            numpy array of attention weights (seq_len values)
        """
        # Calculate offset for this head in the attention buffer
        # Layout: [head_0_weights, head_1_weights, ..., head_7_weights]
        # Each head has MAX_SEQ_LEN weights
        head_offset = head * MAX_SEQ_LEN * 4  # in bytes

        # Create staging buffer for reading
        staging_buffer = self.device.create_buffer(
            size=seq_len * 4,  # Only read seq_len weights
            usage=wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.MAP_READ,
        )

        # Copy from attention buffer to staging buffer
        encoder = self.device.create_command_encoder()
        encoder.copy_buffer_to_buffer(
            self.buffers["attention"], head_offset,
            staging_buffer, 0,
            seq_len * 4
        )
        self.device.queue.submit([encoder.finish()])

        # Map and read
        staging_buffer.map_sync(wgpu.MapMode.READ)
        data = staging_buffer.read_mapped()
        return np.frombuffer(data, dtype=np.float32)

    def _ffn_layer_gpu(self, layer: int, position: int):
        """Execute FFN shader on GPU."""
        atlas_size = self.atlas.shape[0]
        # struct ProjectConfig { layer_idx: u32, atlas_size: u32, _pad1: u32, _pad2: u32 }
        config_data = np.array([layer, atlas_size, 0, 0], dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=config_data.nbytes, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["project"].get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": self.textures["atlas"].create_view()},
                {"binding": 1, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 3, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
            ],
        )

        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["project"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups(1)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

    def _sample_gpu(self, position: int) -> np.ndarray:
        """Execute sample shader on GPU to get logits."""
        vocab = self.config.get("vocab", 50257)
        atlas_size = self.atlas.shape[0]

        # struct SampleConfig { position: u32, temperature: f32, top_k: u32, atlas_size: u32 }
        config_data = np.zeros(4, dtype=np.uint32)
        config_data[0] = position
        config_data[1] = struct_pack_f32(1.0) # Temperature 1.0
        config_data[2] = 0 # top_k
        config_data[3] = atlas_size

        config_buffer = self.device.create_buffer(size=16, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["sample_logits"].get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": self.textures["atlas"].create_view()},
                {"binding": 1, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 2, "resource": {"buffer": self.buffers["tokens"], "offset": 0, "size": self.buffers["tokens"].size}},
                {"binding": 3, "resource": {"buffer": self.buffers["logits"], "offset": 0, "size": self.buffers["logits"].size}},
                {"binding": 4, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
                {"binding": 5, "resource": {"buffer": self.buffers["rng"], "offset": 0, "size": self.buffers["rng"].size}},
            ],
        )

        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["sample_logits"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups((vocab + 255) // 256)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

        # Read back logits
        staging_buffer = self.device.create_buffer(
            size=vocab * 4,
            usage=wgpu.BufferUsage.COPY_DST | wgpu.BufferUsage.MAP_READ,
        )
        encoder = self.device.create_command_encoder()
        encoder.copy_buffer_to_buffer(self.buffers["logits"], 0, staging_buffer, 0, vocab * 4)
        self.device.queue.submit([encoder.finish()])

        staging_buffer.map_sync(wgpu.MapMode.READ)
        data = staging_buffer.read_mapped()
        return np.frombuffer(data, dtype=np.float32)

    def _attention_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        return hidden
    def _ffn_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        return hidden
    def _lm_head(self, hidden: np.ndarray) -> np.ndarray:
        vocab = self.config.get("vocab", 50257)
        return np.zeros(vocab, dtype=np.float32)

    def generate(self, prompt_tokens: List[int], max_tokens: int = 32) -> List[int]:
        """Generate tokens autoregressively."""
        generated: List[int] = []
        current_token = prompt_tokens[-1] if prompt_tokens else 0

        for i in range(max_tokens):
            logits = self.forward(current_token, position=i)
            next_token = int(np.argmax(logits))
            generated.append(next_token)
            current_token = next_token
        return generated

def struct_pack_f32(f):
    import struct
    return struct.unpack('I', struct.pack('f', f))[0]
