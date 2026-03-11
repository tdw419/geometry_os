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
import logging
import re
import time
from pathlib import Path
from typing import Any

import numpy as np

try:
    import wgpu
except ImportError:
    wgpu = None

logger = logging.getLogger(__name__)

# Constants for attention visualization
NUM_HEADS = 12
HIDDEN_DIM = 768
INTERMEDIATE_DIM = 3072
MAX_SEQ_LEN = 1024


class PixelBrainPipeline:
    """
    Native Geometry OS LLM inference pipeline.

    Loads a Hilbert-folded RTS.PNG brain atlas and executes
    inference using WGSL compute shaders on WGPU.
    """

    def __init__(self, brain_path: str, visual_bridge: Any | None = None):
        """
        Initialize pipeline from a PixelBrain RTS.PNG.

        Args:
            brain_path: Path to .rts.png file (meta.json should be adjacent)
            visual_bridge: Optional VisualBridge for telemetry/glow effects
        """
        self.brain_path = Path(brain_path)
        self.visual_bridge = visual_bridge
        self.atlas: np.ndarray | None = None
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
        self.active_persona_monologue: str | None = None
        self._cpu_kv_cache = {} # layer -> {"k": [], "v": []}
        self._weights_cache: dict = {}  # sector_name -> np.ndarray (cached dequantized weights)

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
        self.layout = self.metadata.get("layout", {})

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
            # Float16 sidecar: each pixel = 2 float16 values (4 bytes stored as RGBA)
            # Reshape to (size, size, 2) in float16
            if raw_data.size != size * size * 2:
                size = int(np.sqrt(raw_data.size / 2))
            self.atlas = raw_data.reshape((size, size, 2))
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
        # Don't generate full LUT - compute coordinates on-the-fly
        # self._hilbert.generate_lut()

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
        dim = self.config.get("dim", HIDDEN_DIM)
        vocab = self.config.get("vocab", 50257)
        max_seq_len = MAX_SEQ_LEN

        # 1. Atlas Texture
        atlas_size = self.config.get("grid_size", 8192)

        if self.encoding == "q4_0":
            tex_format = wgpu.TextureFormat.rgba8uint
            atlas_data = self.atlas # self.atlas is uint8
            self.textures["atlas"] = self.device.create_texture(
                size=(atlas_size, atlas_size, 1),
                usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
                format=tex_format,
            )
            bytes_per_pixel = 4
            self.device.queue.write_texture(
                {"texture": self.textures["atlas"]},
                atlas_data,
                {"bytes_per_row": atlas_size * bytes_per_pixel, "rows_per_image": atlas_size},
                (atlas_size, atlas_size, 1),
            )
            logger.info(f"Loaded {atlas_size}x{atlas_size} Q4_0 atlas texture")
        elif self.encoding == "float16":
            # Atlas is (H, W, 2) float16, use rg16float texture
            tex_format = wgpu.TextureFormat.rg16float
            self.textures["atlas"] = self.device.create_texture(
                size=(atlas_size, atlas_size, 1),
                usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
                format=tex_format,
            )
            # rg16float: 2 channels x 2 bytes = 4 bytes per pixel
            bytes_per_pixel = 4
            self.device.queue.write_texture(
                {"texture": self.textures["atlas"]},
                self.atlas.astype(np.float16),
                {"bytes_per_row": atlas_size * bytes_per_pixel, "rows_per_image": atlas_size},
                (atlas_size, atlas_size, 1),
            )
            logger.info(f"Loaded {atlas_size}x{atlas_size} float16 atlas texture (rg16float)")
        else:
            tex_format = wgpu.TextureFormat.rgba8unorm
            atlas_data = self.atlas.astype(np.float32)
            if self.atlas.dtype == np.uint8:
                atlas_data = atlas_data / 255.0
            self.textures["atlas"] = self.device.create_texture(
                size=(atlas_size, atlas_size, 1),
                usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
                format=tex_format,
            )
            bytes_per_pixel = 4
            self.device.queue.write_texture(
                {"texture": self.textures["atlas"]},
                atlas_data,
                {"bytes_per_row": atlas_size * bytes_per_pixel, "rows_per_image": atlas_size},
                (atlas_size, atlas_size, 1),
            )
            logger.info(f"Loaded {atlas_size}x{atlas_size} uint8 atlas texture")

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

        # 6. KV-Cache Storage Buffer (replacing texture)
        # Size: HIDDEN_DIM * MAX_SEQ_LEN * num_layers * 2 * 4 bytes
        num_layers = self.config.get("layers", 12)
        kv_cache_size = HIDDEN_DIM * MAX_SEQ_LEN * num_layers * 2 * 4
        self.buffers["kv_cache"] = self.device.create_buffer(
            size=kv_cache_size,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST,
        )
        # Initialize with zeros
        zero_data = np.zeros(256, dtype=np.float32).tobytes() # Small chunk for testing or just use clear_buffer if available
        # But for full buffer, we can use encoder.clear_buffer
        logger.info(f"Created KV-Cache storage buffer: {kv_cache_size} bytes")

    def _create_pipelines(self):
        """Compile WGSL shaders into pipelines."""
        shader_dir = Path(__file__).parent

        # Load dequantization helper if using Q4_0
        dequant_code = ""
        if self.encoding == "q4_0":
            dequant_path = shader_dir / "quantization" / "q4_dequant.wgsl"
            if dequant_path.exists():
                with open(dequant_path) as f:
                    dequant_code = f.read()

        hilbert_code = """
fn hilbert_d2xy(d: u32, n: u32) -> vec2<u32> {
    var x: u32 = 0u; var y: u32 = 0u; var t: u32 = d; var s: u32 = 1u;
    while (s < n) {
        let rx = (t >> 1u) & 1u; let ry = (t ^ rx) & 1u;
        var new_x = x; var new_y = y;
        if (ry == 0u) {
            if (rx == 1u) { new_x = s - 1u - x; new_y = s - 1u - y; }
            let temp = new_x; new_x = new_y; new_y = temp;
        }
        x = new_x + s * rx; y = new_y + s * ry;
        t = t >> 2u; s = s << 1u;
    }
    return vec2<u32>(x, y);
}
        """

        def create_comp_pipeline(shader_name, entry_point="main"):
            shader_path = shader_dir / f"{shader_name}.wgsl"
            with open(shader_path) as f:
                code = f.read()

            # 1. Define Constants and Bindings at the absolute top
            atlas_size = self.config.get("grid_size", 8192)
            constants_code = f"const ATLAS_SIZE: u32 = {atlas_size}u;\n"

            if self.encoding == "q4_0":
                binding_code = "@group(0) @binding(0) var brain_atlas: texture_2d<u32>;"
            else:
                binding_code = "@group(0) @binding(0) var brain_atlas: texture_2d<f32>;"

            # 2. Inject helper codes in dependency order
            final_code = constants_code + "\n" + binding_code + "\n" + hilbert_code + "\n" + dequant_code + "\n"

            # Remove placeholders from original code and append
            code = code.replace("// [BINDING_PLACEHOLDER]", "")
            code = code.replace("// [DEQUANT_CODE_PLACEHOLDER]", "")
            final_code += code

            # 3. Handle LOAD_WEIGHT_PLACEHOLDER
            if self.encoding == "q4_0":
                q4_load_logic = """
    let block_idx = float_idx / 32u;
    let weight_in_block = float_idx % 32u;
    var block_output: array<f32, 32>;
    dequantize_q4_block(block_idx, &block_output);
    return block_output[weight_in_block];
                """
                final_code = final_code.replace("// [LOAD_WEIGHT_PLACEHOLDER]", q4_load_logic)
            elif self.encoding == "float16":
                # Float16: rg16float texture - 2 channels, each pixel = 2 weights
                tex_load_logic = """
    let pixel_idx = float_idx / 2u;
    let channel = float_idx % 2u;
    let coord = hilbert_d2xy(pixel_idx, ATLAS_SIZE);
    let pixel = textureLoad(brain_atlas, coord, 0);
    if (channel == 0u) { return pixel.r; }
    return pixel.g;
                """
                final_code = final_code.replace("// [LOAD_WEIGHT_PLACEHOLDER]", tex_load_logic)
            else:
                # uint8-normalized or other: rgba texture - 4 channels
                tex_load_logic = """
    let pixel_idx = float_idx / 4u;
    let channel = float_idx % 4u;
    let coord = hilbert_d2xy(pixel_idx, ATLAS_SIZE);
    let pixel = textureLoad(brain_atlas, coord, 0);
    if (channel == 0u) { return pixel.r; }
    if (channel == 1u) { return pixel.g; }
    if (channel == 2u) { return pixel.b; }
    return pixel.a;
                """
                final_code = final_code.replace("// [LOAD_WEIGHT_PLACEHOLDER]", tex_load_logic)

            # 4. Handle Shader-specific logic injection (Optimized for Q4_0)
            if self.encoding == "q4_0":
                if shader_name == "pixel_brain_embed":
                    final_code = final_code.replace("// [LOADING_LOGIC_PLACEHOLDER]", """
    let blocks_per_token = HIDDEN_DIM / 32u;
    let block_idx_start = token_float_start / 32u;
    let pos_float_start = config.pos_sector_start + config.position * HIDDEN_DIM;
    let pos_block_idx_start = pos_float_start / 32u;

    for (var b = 0u; b < blocks_per_token; b++) {
        var token_block: array<f32, 32>;
        var pos_block: array<f32, 32>;
        dequantize_q4_block(block_idx_start + b, &token_block);
        dequantize_q4_block(pos_block_idx_start + b, &pos_block);
        let block_out_base = out_base + b * 32u;
        for (var i = 0u; i < 32u; i++) {
            output_hidden.hidden[block_out_base + i] = token_block[i] + pos_block[i];
        }
    }
                    """)
                elif shader_name == "pixel_brain_sample":
                    final_code = final_code.replace("// [COMPUTE_LOGIT_LOGIC_PLACEHOLDER]", """
    let blocks_per_head = HIDDEN_DIM / 32u;
    let block_idx_start = head_float_start / 32u;
    for (var b = 0u; b < blocks_per_head; b++) {
        var block_output: array<f32, 32>;
        dequantize_q4_block(block_idx_start + b, &block_output);
        let hidden_base = b * 32u;
        for (var i = 0u; i < 32u; i++) {
            logit += block_output[i] * hidden_state.hidden[hidden_offset + hidden_base + i];
        }
    }
                    """)
            else:
                # Texture mode fallbacks
                if shader_name == "pixel_brain_embed":
                    final_code = final_code.replace("// [LOADING_LOGIC_PLACEHOLDER]", """
    let pos_float_start = config.pos_sector_start + config.position * HIDDEN_DIM;
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        output_hidden.hidden[out_base + i] = load_weight_value(token_float_start + i) + load_weight_value(pos_float_start + i);
    }
                    """)
                elif shader_name == "pixel_brain_sample":
                    final_code = final_code.replace("// [COMPUTE_LOGIT_LOGIC_PLACEHOLDER]", """
    for (var i = 0u; i < HIDDEN_DIM; i++) {
        logit += load_weight_value(head_float_start + i) * hidden_state.hidden[hidden_offset + i];
    }
                    """)

            # 5. Final Cleanup
            final_code = re.sub(r"^\s*#ifdef.*$", "", final_code, flags=re.MULTILINE)
            final_code = re.sub(r"^\s*#endif.*$", "", final_code, flags=re.MULTILINE)
            final_code = re.sub(r"^\s*#else.*$", "", final_code, flags=re.MULTILINE)
            final_code = re.sub(r"^\s*#if.*$", "", final_code, flags=re.MULTILINE)

            module = self.device.create_shader_module(code=final_code)
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
                {"binding": 2, "resource": {"buffer": self.buffers["kv_cache"], "offset": 0, "size": self.buffers["kv_cache"].size}},
            ],
        )

        # 4. Dispatch
        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["kv_append"])
        pass_compute.set_bind_group(0, bind_group)
        # Each vector is HIDDEN_DIM floats. Dispatch workgroups to cover all channels.
        pass_compute.dispatch_workgroups((hidden.size + 63) // 64)
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
        atlas_size = self.config.get("grid_size", 2048)

        # Use offset from layout metadata
        embed_start = self.layout.get("sectors", {}).get("embeddings", {}).get("start", 0)
        pos_start = self.layout.get("sectors", {}).get("pos_embeddings", {}).get("start", 0)

        # 1. Update input tokens buffer
        self.device.queue.write_buffer(self.buffers["tokens"], position * 4, np.array([token_id], dtype=np.uint32))

        # 2. Update config uniform
        # struct EmbedConfig { batch_size: u32, position: u32, atlas_size: u32,
        #                      embed_sector_start: u32, pos_sector_start: u32, _pad1: u32, _pad2: u32, _pad3: u32 }
        config_data = np.array([1, position, atlas_size, embed_start, pos_start, 0, 0, 0], dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=32, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        # 3. Create bind group
        atlas_resource = {"binding": 0, "resource": self.textures["atlas"].create_view()}

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["embed"].get_bind_group_layout(0),
            entries=[
                atlas_resource,
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

    def _get_weights_cpu(self, start_weight_idx: int, count: int) -> np.ndarray:
        """Fetch weights from the Hilbert-mapped atlas for CPU fallback."""
        weights = np.zeros(count, dtype=np.float32)

        if self.encoding == "float16":
            # Float16: atlas is (H, W, 2) float16
            # Each pixel = 2 float16 values
            # Weight index W -> Pixel index = W // 2
            # Slot in pixel = W % 2

            for w_idx in range(count):
                weight_idx = start_weight_idx + w_idx
                pixel_idx = weight_idx // 2  # Each pixel holds 2 float16 values
                slot_in_pixel = weight_idx % 2  # 0 = first, 1 = second

                x, y = self._hilbert._index_to_coord(pixel_idx, self._hilbert.grid_size)
                pixel = self.atlas[y, x]  # 2 float16 values

                weights[w_idx] = float(pixel[slot_in_pixel])

            return weights

        # Q4_0: each block of 32 weights = 20 bytes = 5 pixels
        # Weight index W -> Block index B = W // 32
        # Block index B -> Pixel index P = B * 5

        first_block = start_weight_idx // 32
        last_block = (start_weight_idx + count - 1) // 32

        weights_pos = 0
        for block_idx in range(first_block, last_block + 1):
            # 1. Fetch 5 pixels for this block from Hilbert atlas
            pixel_start = block_idx * 5
            block_bytes = bytearray()
            for p_offset in range(5):
                p_idx = pixel_start + p_offset
                # Compute coordinate on-the-fly using internal method
                x, y = self._hilbert._index_to_coord(p_idx, self._hilbert.grid_size)
                block_bytes.extend(self.atlas[y, x].tolist())

            if len(block_bytes) < 20:
                break

            # 2. Dequantize
            from systems.visual_shell.wgsl.quantization.q4_utils import q4_dequantize_block
            scale = np.frombuffer(block_bytes[0:2], dtype=np.float16)[0]
            packed = np.frombuffer(block_bytes[2:18], dtype=np.uint8)
            block_weights = q4_dequantize_block(packed, scale)

            # 3. Extract requested weights
            block_start_weight = block_idx * 32
            offset_in_block = max(0, start_weight_idx - block_start_weight)
            take_from_block = min(32 - offset_in_block, count - weights_pos)

            weights[weights_pos : weights_pos + take_from_block] = \
                block_weights[offset_in_block : offset_in_block + take_from_block]
            weights_pos += take_from_block

        return weights
    def _embed_token_cpu(self, token_id: int, position: int = 0) -> np.ndarray:
        """CPU fallback for embedding."""
        dim = self.config.get("dim", HIDDEN_DIM)
        vocab = self.config.get("vocab", 50257)
        if token_id < 0 or token_id >= vocab: raise ValueError(f"Invalid token_id: {token_id}")

        # 1. Token Embedding
        embed_sector = self.layout.get("sectors", {}).get("embeddings", {})
        embed_start = embed_sector.get("start", 0)
        token_emb = self._get_weights_cpu(embed_start + token_id * dim, dim)

        # 2. Position Embedding
        pos_sector = self.layout.get("sectors", {}).get("pos_embeddings", {})
        if pos_sector:
            pos_start = pos_sector.get("start", 0)
            pos_emb = self._get_weights_cpu(pos_start + position * dim, dim)
            return token_emb + pos_emb

        return token_emb

    def _read_hidden(self, position: int) -> np.ndarray:
        """Read hidden state from GPU."""
        dim = self.config.get("dim", HIDDEN_DIM)
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
            hidden = self._embed_token_cpu(token_id, position)
            # Step 2: Transformer layers (attention + ffn stubs)
            num_layers = self.config.get("layers", 12)
            for layer in range(num_layers):
                hidden = self._attention_layer(hidden, layer)
                hidden = self._ffn_layer(hidden, layer)
            # Step 3: LM Head
            return self._lm_head(hidden)

        # 1. Embed
        self.embed_token(token_id, position)

        # 2. Layers
        num_layers = self.config.get("layers", 12)
        for layer in range(num_layers):
            self._attention_layer_gpu(layer, position)
            self._ffn_layer_gpu(layer, position)

        # 3. Final LayerNorm (ln_f)
        self._apply_ln_f_gpu(position)

        # 4. Sample (Logits)
        return self._sample_gpu(position)

    def _attention_layer_gpu(self, layer: int, position: int):
        """Execute attention shader on GPU."""
        atlas_size = self.atlas.shape[0]
        sectors = self.layout.get("sectors", {})

        # Get individual projection weight starts
        q_sector = sectors.get(f"layer_{layer}_attn_q_proj_w", {})
        k_sector = sectors.get(f"layer_{layer}_attn_k_proj_w", {})
        v_sector = sectors.get(f"layer_{layer}_attn_v_proj_w", {})
        o_sector = sectors.get(f"layer_{layer}_attn_out_proj_w", {})

        # Get bias starts
        q_b_sector = sectors.get(f"layer_{layer}_attn_q_proj_b", {})
        k_b_sector = sectors.get(f"layer_{layer}_attn_k_proj_b", {})
        v_b_sector = sectors.get(f"layer_{layer}_attn_v_proj_b", {})
        o_b_sector = sectors.get(f"layer_{layer}_attn_out_proj_b", {})

        q_start = q_sector.get("start", 0)
        k_start = k_sector.get("start", q_start + HIDDEN_DIM * HIDDEN_DIM)
        v_start = v_sector.get("start", k_start + HIDDEN_DIM * HIDDEN_DIM)
        o_start = o_sector.get("start", v_start + HIDDEN_DIM * HIDDEN_DIM)

        q_b_start = q_b_sector.get("start", 0)
        k_b_start = k_b_sector.get("start", 0)
        v_b_start = v_b_sector.get("start", 0)
        o_b_start = o_b_sector.get("start", 0)

        # Get LayerNorm parameter starts
        ln_w_sector = sectors.get(f"layer_{layer}_ln1_w", {})
        ln_b_sector = sectors.get(f"layer_{layer}_ln1_b", {})
        ln_w_start = ln_w_sector.get("start", 0)
        ln_b_start = ln_b_sector.get("start", 0)

        # struct AttentionConfig { layer_idx, position, atlas_size, weights_start (Q),
        #                           k_start, v_start, o_start, q_b_start, k_b_start,
        #                           v_b_start, o_b_start, seq_len, ln_w_start, ln_b_start, _pad }
        config_data = np.array([layer, position, atlas_size, q_start, k_start, v_start,
                                o_start, q_b_start, k_b_start, v_b_start, o_b_start,
                                position + 1, ln_w_start, ln_b_start, 0],
                               dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=60, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        atlas_resource = {"binding": 0, "resource": self.textures["atlas"].create_view()}

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["attend"].get_bind_group_layout(0),
            entries=[
                atlas_resource,
                {"binding": 1, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 2, "resource": {"buffer": self.buffers["attention"], "offset": 0, "size": self.buffers["attention"].size}},
                {"binding": 3, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
                {"binding": 4, "resource": {"buffer": self.buffers["kv_cache"], "offset": 0, "size": self.buffers["kv_cache"].size}},
            ],
        )

        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["attend"])
        pass_compute.set_bind_group(0, bind_group)
        # Use 1 workgroup per task, or let the shader handle internal parallelism
        # Since we use workgroup parallelism for dot products, 1 workgroup of 64 threads is a good start for one token
        pass_compute.dispatch_workgroups(1)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

        # Visualization
        if self.visual_bridge:
            # Highlight attention weights sector for this layer
            # Approximate indices for visualization
            EMBED_SIZE = 50257 * HIDDEN_DIM
            LAYER_SIZE = 4 * HIDDEN_DIM * HIDDEN_DIM + 2 * HIDDEN_DIM * INTERMEDIATE_DIM
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
            layer: Transformer layer index (0-11)
            head: Attention head index (0-11)
            seq_len: Current sequence length

        Returns:
            numpy array of attention weights (seq_len values)
        """
        # Calculate offset for this head in the attention buffer
        # Layout: [head_0_weights, head_1_weights, ..., head_11_weights]
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
        sectors = self.layout.get("sectors", {})

        # Get MLP layer sectors
        c_fc_sector = sectors.get(f"layer_{layer}_mlp_c_fc_w", {})
        fc_b_sector = sectors.get(f"layer_{layer}_mlp_c_fc_b", {})
        c_proj_sector = sectors.get(f"layer_{layer}_mlp_c_proj_w", {})
        proj_b_sector = sectors.get(f"layer_{layer}_mlp_c_proj_b", {})

        weights_start = c_fc_sector.get("start", 0)
        fc_b_start = fc_b_sector.get("start", 0)
        o_start = c_proj_sector.get("start", weights_start + HIDDEN_DIM * INTERMEDIATE_DIM)
        proj_b_start = proj_b_sector.get("start", 0)

        # Get LayerNorm parameter sectors
        ln_w_sector = sectors.get(f"layer_{layer}_ln2_w", {})
        ln_b_sector = sectors.get(f"layer_{layer}_ln2_b", {})
        ln_w_start = ln_w_sector.get("start", 0)
        ln_b_start = ln_b_sector.get("start", 0)

        # struct ProjectConfig { layer_idx, position, atlas_size, weights_start,
        #                         fc_b_start, o_start, proj_b_start, ln_w_start,
        #                         ln_b_start, _pad1, _pad2 }
        config_data = np.array([layer, position, atlas_size, weights_start, fc_b_start,
                                o_start, proj_b_start, ln_w_start, ln_b_start, 0, 0],
                               dtype=np.uint32)
        config_buffer = self.device.create_buffer(size=48, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        atlas_resource = {"binding": 0, "resource": self.textures["atlas"].create_view()}

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["project"].get_bind_group_layout(0),
            entries=[
                atlas_resource,
                {"binding": 1, "resource": {"buffer": self.buffers["hidden"], "offset": 0, "size": self.buffers["hidden"].size}},
                {"binding": 2, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
            ],
        )

        encoder = self.device.create_command_encoder()
        pass_compute = encoder.begin_compute_pass()
        pass_compute.set_pipeline(self.pipelines["project"])
        pass_compute.set_bind_group(0, bind_group)
        pass_compute.dispatch_workgroups(1)
        pass_compute.end()
        self.device.queue.submit([encoder.finish()])

    def _apply_ln_f_gpu(self, position: int):
        """Apply final LayerNorm on CPU and write back to GPU.

        This is a temporary solution until we have a dedicated ln_f shader.
        """
        # Read hidden from GPU
        hidden = self._read_hidden(position)

        # Get ln_f weights
        ln_f_w = self._get_sector_weights("ln_f_w")
        ln_f_b = self._get_sector_weights("ln_f_b")

        if ln_f_w is not None and ln_f_b is not None:
            # Apply LayerNorm
            mean = hidden.mean()
            var = hidden.var()
            inv_std = 1.0 / np.sqrt(var + 1e-5)
            hidden_norm = ((hidden - mean) * inv_std) * ln_f_w + ln_f_b

            # Write back to GPU
            self.device.queue.write_buffer(
                self.buffers["hidden"],
                position * HIDDEN_DIM * 4,
                hidden_norm.astype(np.float32)
            )

    def _sample_gpu(self, position: int) -> np.ndarray:
        """Execute sample shader on GPU to get logits."""
        vocab = self.config.get("vocab", 50257)
        atlas_size = self.config.get("grid_size", 2048)

        # Use offset from layout metadata
        lm_head_start = self.layout.get("sectors", {}).get("lm_head", {}).get("start", 0)

        # struct SampleConfig { position: u32, temperature: f32, top_k: u32, atlas_size: u32, lm_head_start: u32, _pad1: u32, _pad2: u32, _pad3: u32 }
        # Must be 32 bytes (8 u32s) for WGPU uniform buffer alignment
        config_data = np.zeros(8, dtype=np.uint32)
        config_data[0] = position
        config_data[1] = struct_pack_f32(1.0) # Temperature 1.0
        config_data[2] = 0 # top_k
        config_data[3] = atlas_size
        config_data[4] = lm_head_start

        config_buffer = self.device.create_buffer(size=32, usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST)
        self.device.queue.write_buffer(config_buffer, 0, config_data)

        atlas_resource = {"binding": 0, "resource": self.textures["atlas"].create_view()}

        bind_group = self.device.create_bind_group(
            layout=self.pipelines["sample_logits"].get_bind_group_layout(0),
            entries=[
                atlas_resource,
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

    def _get_sector_weights(self, sector_name: str) -> np.ndarray | None:
        """Fetch weights for a named sector from the atlas (with caching)."""
        # Check cache first
        if sector_name in self._weights_cache:
            return self._weights_cache[sector_name]

        sector = self.layout.get("sectors", {}).get(sector_name)
        if not sector:
            return None
        start = sector.get("start", 0)
        count = sector.get("end", 0) - start
        weights = self._get_weights_cpu(start, count)
        shape = sector.get("shape")
        if shape:
            weights = weights.reshape(shape)

        # Cache for future use
        self._weights_cache[sector_name] = weights
        return weights

    def _layernorm(self, x: np.ndarray, w: np.ndarray | None = None, b: np.ndarray | None = None) -> np.ndarray:
        """LayerNorm with weights and biases."""
        mean = np.mean(x)
        var = np.var(x)
        eps = 1e-5
        x_norm = (x - mean) / np.sqrt(var + eps)
        if w is not None and b is not None:
            return w * x_norm + b
        return x_norm

    def _gelu(self, x: np.ndarray) -> np.ndarray:
        """GELU activation function."""
        return 0.5 * x * (1.0 + np.tanh(0.7978845608 * (x + 0.044715 * x**3)))

    def _attention_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """CPU fallback for attention layer."""
        dim = self.config.get("dim", HIDDEN_DIM)
        num_heads = NUM_HEADS
        head_dim = dim // num_heads

        # 1. LayerNorm 1
        ln1_w = self._get_sector_weights(f"layer_{layer}_ln1_w")
        ln1_b = self._get_sector_weights(f"layer_{layer}_ln1_b")
        x_norm = self._layernorm(hidden, ln1_w, ln1_b)

        # 2. Projections (Q, K, V)
        w_q = self._get_sector_weights(f"layer_{layer}_attn_q_proj_w")
        b_q = self._get_sector_weights(f"layer_{layer}_attn_q_proj_b")
        w_k = self._get_sector_weights(f"layer_{layer}_attn_k_proj_w")
        b_k = self._get_sector_weights(f"layer_{layer}_attn_k_proj_b")
        w_v = self._get_sector_weights(f"layer_{layer}_attn_v_proj_w")
        b_v = self._get_sector_weights(f"layer_{layer}_attn_v_proj_b")

        q = np.dot(w_q, x_norm) + b_q
        k = np.dot(w_k, x_norm) + b_k
        v = np.dot(w_v, x_norm) + b_v

        # 3. KV-cache management
        if layer not in self._cpu_kv_cache:
            self._cpu_kv_cache[layer] = {"k": [], "v": []}
        self._cpu_kv_cache[layer]["k"].append(k)
        self._cpu_kv_cache[layer]["v"].append(v)

        all_k = np.array(self._cpu_kv_cache[layer]["k"]) # [seq_len, dim]
        all_v = np.array(self._cpu_kv_cache[layer]["v"]) # [seq_len, dim]

        # 4. Multi-head attention
        q = q.reshape(num_heads, head_dim)
        all_k = all_k.reshape(-1, num_heads, head_dim) # [seq_len, num_heads, head_dim]
        all_v = all_v.reshape(-1, num_heads, head_dim) # [seq_len, num_heads, head_dim]

        attn_out = np.zeros_like(q)
        scale = 1.0 / np.sqrt(head_dim)

        for h in range(num_heads):
            # Compute scores: [seq_len]
            scores = np.dot(all_k[:, h, :], q[h]) * scale
            # Softmax
            exp_scores = np.exp(scores - np.max(scores))
            probs = exp_scores / np.sum(exp_scores)
            # Weighted sum: [head_dim]
            attn_out[h] = np.dot(probs, all_v[:, h, :])

        # 5. Output Projection
        w_o = self._get_sector_weights(f"layer_{layer}_attn_out_proj_w")
        b_o = self._get_sector_weights(f"layer_{layer}_attn_out_proj_b")
        output = np.dot(w_o, attn_out.flatten()) + b_o

        # 6. Residual Connection
        return hidden + output

    def _ffn_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """CPU fallback for FFN layer."""
        dim = self.config.get("dim", HIDDEN_DIM)

        # 1. LayerNorm 2
        ln2_w = self._get_sector_weights(f"layer_{layer}_ln2_w")
        ln2_b = self._get_sector_weights(f"layer_{layer}_ln2_b")
        x_norm = self._layernorm(hidden, ln2_w, ln2_b)

        # 2. In Projection (c_fc)
        w_fc = self._get_sector_weights(f"layer_{layer}_mlp_c_fc_w")
        b_fc = self._get_sector_weights(f"layer_{layer}_mlp_c_fc_b")
        intermediate = self._gelu(np.dot(w_fc, x_norm) + b_fc)

        # 3. Out Projection (c_proj)
        w_proj = self._get_sector_weights(f"layer_{layer}_mlp_c_proj_w")
        b_proj = self._get_sector_weights(f"layer_{layer}_mlp_c_proj_b")
        output = np.dot(w_proj, intermediate) + b_proj

        # 4. Residual Connection
        return hidden + output

    def _lm_head(self, hidden: np.ndarray) -> np.ndarray:
        """CPU fallback for LM head."""
        # 1. Final LayerNorm
        ln_f_w = self._get_sector_weights("ln_f_w")
        ln_f_b = self._get_sector_weights("ln_f_b")
        x_norm = self._layernorm(hidden, ln_f_w, ln_f_b) if ln_f_w is not None else hidden

        # 2. LM Head Projection
        w_lm = self._get_sector_weights("lm_head")
        if w_lm is not None:
            logits = np.dot(w_lm, x_norm)
        else:
            logits = np.zeros(self.config.get("vocab", 50257), dtype=np.float32)

        # 3. Persona Bias (Mind-Shift POC)
        if self.active_persona_monologue:
            monologue_lower = self.active_persona_monologue.lower()
            if "security" in monologue_lower:
                logits[34914] += 10.0 # Secure
                logits[449] += 8.0   # Safe
            elif "rapid" in monologue_lower or "prototype" in monologue_lower:
                logits[3049] += 10.0 # Fast
                logits[2151] += 8.0  # Build
            elif "reality" in monologue_lower or "check" in monologue_lower:
                logits[2081] += 10.0 # True
                logits[1107] += 8.0  # Real

        return logits

    def warmup_cache(self) -> int:
        """
        Preload all model weights into cache for faster inference.

        Returns number of sectors cached.
        """
        sectors = self.layout.get("sectors", {})
        num_layers = self.config.get("layers", 12)

        # Build list of all sector names
        sector_names = [
            "embeddings", "pos_embeddings", "lm_head",
            "ln_f_w", "ln_f_b"
        ]

        for layer in range(num_layers):
            sector_names.extend([
                f"layer_{layer}_ln1_w", f"layer_{layer}_ln1_b",
                f"layer_{layer}_ln2_w", f"layer_{layer}_ln2_b",
                f"layer_{layer}_attn_q_proj_w", f"layer_{layer}_attn_q_proj_b",
                f"layer_{layer}_attn_k_proj_w", f"layer_{layer}_attn_k_proj_b",
                f"layer_{layer}_attn_v_proj_w", f"layer_{layer}_attn_v_proj_b",
                f"layer_{layer}_attn_out_proj_w", f"layer_{layer}_attn_out_proj_b",
                f"layer_{layer}_mlp_c_fc_w", f"layer_{layer}_mlp_c_fc_b",
                f"layer_{layer}_mlp_c_proj_w", f"layer_{layer}_mlp_c_proj_b",
            ])

        cached = 0
        for name in sector_names:
            if name in sectors:
                self._get_sector_weights(name)
                cached += 1

        return cached

    def cache_stats(self) -> dict:
        """Return cache statistics."""
        total_bytes = sum(w.nbytes for w in self._weights_cache.values())
        return {
            "sectors_cached": len(self._weights_cache),
            "total_mb": total_bytes / (1024 * 1024)
        }

    def generate(self, prompt_tokens: list[int], max_tokens: int = 32) -> list[int]:
        """Generate tokens autoregressively."""
        # 1. Ingest Prompt (Warm up KV-cache)
        for i, token in enumerate(prompt_tokens[:-1]):
            self.forward(token, position=i)

        # 2. Autoregressive Generation
        generated: list[int] = []
        current_token = prompt_tokens[-1] if prompt_tokens else 0
        start_pos = len(prompt_tokens) - 1

        for i in range(max_tokens):
            pos = start_pos + i
            logits = self.forward(current_token, position=pos)
            next_token = int(np.argmax(logits))
            generated.append(next_token)
            current_token = next_token
            if pos >= MAX_SEQ_LEN - 1: break
        return generated

def struct_pack_f32(f):
    import struct
    return struct.unpack('I', struct.pack('f', f))[0]
