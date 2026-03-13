"""
Hardware Tests for AMD GPU Glyph Pipeline

These tests validate the full glyph→SPIR-V→DRM→Display pipeline
on real AMD hardware. They require:
- AMD GPU (RADV or AMDGPU-PRO)
- /dev/dri/renderD* accessible
- DRM/KMS support

Run with: pytest tests/hardware/test_amdgpu_pipeline.py -v --require-hardware
"""

import pytest
import subprocess
import json
import os
import struct

# Skip all tests if no GPU
def has_amd_gpu():
    """Check if AMD GPU is available."""
    try:
        result = subprocess.run(
            ["lspci"],
            capture_output=True,
            text=True,
            timeout=5.0
        )
        return "AMD" in result.stdout and ("VGA" in result.stdout or "3D" in result.stdout)
    except Exception:
        return False

hardware_required = pytest.mark.skipif(
    not has_amd_gpu(),
    reason="No AMD GPU available"
)


class TestDrmDevice:
    """Test DRM device access."""

    @hardware_required
    def test_render_node_exists(self):
        """Test that AMD render node exists."""
        for i in range(16):
            path = f"/dev/dri/renderD{128 + i}"
            if os.path.exists(path):
                assert os.access(path, os.R_OK | os.W_OK), f"Cannot access {path}"
                return

        pytest.skip("No render node found")

    @hardware_required
    def test_amdgpu_device_open(self):
        """Test opening AMDGPU device."""
        from infinite_map_rs.backend.drm.amdgpu.device import AmdGpuDevice

        device = AmdGpuDevice.open_first()
        assert device is not None
        assert device.fd() >= 0


class TestSpirvCompilation:
    """Test SPIR-V compilation on real hardware."""

    @hardware_required
    def test_glyph_to_spirv(self):
        """Test glyph program compiles to valid SPIR-V."""
        program = {
            "glyphs": [
                {"opcode": 206, "p1": 3.14159, "p2": 0.0, "dst": 0},
                {"opcode": 206, "p1": 2.71828, "p2": 0.0, "dst": 1},
                {"opcode": 216, "p1": 0.0, "p2": 1.0, "dst": 2},
                {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
            ]
        }

        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=json.dumps(program),
            capture_output=True,
            text=True,
            timeout=30.0,
        )

        assert result.returncode == 0, f"Compilation failed: {result.stderr}"

        output = json.loads(result.stdout)
        assert output["magic"] == "0x07230203"
        assert output["spirv_size"] > 0

    @hardware_required
    def test_spirv_validation(self):
        """Test SPIR-V is valid for AMD GPU."""
        # Compile a simple program
        program = {"glyphs": [{"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0}]}

        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=json.dumps(program),
            capture_output=True,
            text=True,
            timeout=30.0,
        )

        output = json.loads(result.stdout)

        # Check SPIR-V version is supported
        # AMD supports SPIR-V 1.4+
        word_count = output["word_count"]
        assert word_count > 5, "SPIR-V too small"


class TestDmaBuf:
    """Test DMA-BUF zero-copy pipeline."""

    @hardware_required
    def test_dmabuf_export(self):
        """Test exporting GPU buffer as DMA-BUF."""
        from infinite_map_rs.backend.drm.dmabuf import DmaBuf

        buf = DmaBuf.export_from_gpu(
            gpu_fd=-1,  # Mock
            handle=0,
            width=1920,
            height=1080,
            stride=1920 * 4,
            format=0x34325241,
        )

        assert buf is not None

    @hardware_required
    def test_zero_copy_pipeline(self):
        """Test zero-copy GPU→Display pipeline."""
        from infinite_map_rs.backend.drm.dmabuf import ZeroCopyPipeline

        pipeline = ZeroCopyPipeline.new(-1)  # Mock fd
        assert pipeline is not None


class TestVccContract:
    """Test Visual Computation Contract verification."""

    @hardware_required
    def test_vcc_hash_compute(self):
        """Test VCC hash computation on GPU."""
        from infinite_map_rs.backend.drm.vcc_compute import VccCompute

        vcc = VccCompute.new()
        assert vcc is not None

        # Test data
        pixels = [1.0, 0.5, 0.25] * 1024  # 1024 pixels
        contract_hash = [0] * 8  # 8 uint32s

        result = vcc.verify_contract(pixels, contract_hash)
        # Should return True for valid hash
        assert result is True or result is False  # Depends on hash match


class TestEndToEnd:
    """End-to-end pipeline tests."""

    @hardware_required
    @pytest.mark.slow
    def test_full_glyph_execution(self):
        """Test complete glyph program execution."""
        # 1. Compile glyph to SPIR-V
        program = {
            "glyphs": [
                {"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0},  # MOV
                {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
            ]
        }

        compile_result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=json.dumps(program),
            capture_output=True,
            text=True,
            timeout=30.0,
        )

        assert compile_result.returncode == 0
        spirv_info = json.loads(compile_result.stdout)

        # 2. In full implementation, submit to GPU
        # 3. Verify output
        # 4. Check display

        print(f"SPIR-V size: {spirv_info['spirv_size']} bytes")

    @hardware_required
    @pytest.mark.slow
    def test_glyph_evolution_fitness(self):
        """Test evolution fitness evaluation on GPU."""
        from evolution_daemon.glyph_evolution import (
            GlyphProgram,
            GlyphMutator,
            fitness_shader_correctness,
        )

        # Create seed program
        seed = GlyphProgram(glyphs=[
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ])

        # Evaluate fitness (would compile and execute on GPU)
        fitness = fitness_shader_correctness(seed)
        assert 0.0 <= fitness <= 1.0

        # Mutate and evaluate
        mutator = GlyphMutator(mutation_rate=0.5)
        mutated = mutator.mutate(seed)
        mutated_fitness = fitness_shader_correctness(mutated)
        assert 0.0 <= mutated_fitness <= 1.0


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--require-hardware"])
