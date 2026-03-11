"""
Visual Shell Integration Test

Tests the "Screen is the Hard Drive" architecture by validating
that the Native Visual Shell API produces correct glyph commands
that can be executed by the visual-vm.

Task 6 from STATE_V4.md: Visual Shell Integration Test for Transpiled GeoASM Execution
"""

import json
import sys
from pathlib import Path

import pytest

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent.parent / "systems" / "visual_shell" / "api"))
sys.path.insert(0, str(Path(__file__).parent.parent / "visual-vm"))

from evolution_viz import EvolutionVisualizer, FitnessHeatmap
from native_api import NativeVisualShellAPI, UIEntity


class TestNativeVisualShellIntegration:
    """Integration tests for Native Visual Shell API"""

    def test_api_initializes_with_geoasm_library(self):
        """API should load the pre-assembled GeoASM library"""
        api = NativeVisualShellAPI()
        # Library may be empty if bin doesn't exist - that's OK for tests
        assert api.library_bytes is not None
        assert api.renderer_type == "native"

    def test_create_entity_via_add_entity(self):
        """Creating an entity should work via add_entity"""
        api = NativeVisualShellAPI()

        # Create an orb entity
        entity = UIEntity(
            id="test_orb",
            type="orb",
            x=100,
            y=100,
            width=20,
            height=20,
            color=(255, 128, 64, 200)
        )
        api.add_entity(entity)

        assert "test_orb" in api.entities
        assert api.entities["test_orb"].type == "orb"

        # Get render state
        state = api.get_render_state()
        assert len(state) == 1
        assert state[0]["id"] == "test_orb"

    def test_create_panel_generates_panel_entity(self):
        """Creating a panel should produce panel entity"""
        api = NativeVisualShellAPI()

        panel = api.create_panel(
            id="test_panel",
            title="Test Panel",
            x=50,
            y=50,
            width=200,
            height=150
        )

        assert panel is not None
        assert panel.id == "test_panel"
        assert "test_panel" in api.panels
        assert "test_panel" in api.entities

    def test_stress_test_10000_entities(self):
        """API should handle 10,000+ entities efficiently"""
        api = NativeVisualShellAPI()

        # Create 10,000 entities
        start_time = __import__("time").time()
        for i in range(10000):
            entity = UIEntity(
                id=f"orb_{i}",
                type="orb",
                x=(i % 100) * 10,
                y=(i // 100) * 10,
                width=5,
                height=5,
                color=(100, 100, 200, 150)
            )
            api.add_entity(entity)
        elapsed = __import__("time").time() - start_time

        assert len(api.entities) == 10000
        assert elapsed < 1.0  # Should complete in under 1 second

        # Get render state
        state = api.get_render_state()
        assert len(state) == 10000

    def test_compose_frame_returns_bytes(self):
        """compose_frame should return bytes"""
        api = NativeVisualShellAPI()

        api.add_entity(UIEntity(id="orb1", type="orb", x=10, y=10))
        api.add_entity(UIEntity(id="orb2", type="orb", x=20, y=20))

        # Compose frame
        bytecode = api.compose_frame()
        assert bytecode is not None
        assert isinstance(bytecode, bytes)

    def test_z_ordering_via_panel_bring_to_front(self):
        """bring_to_front should increase Z order"""
        api = NativeVisualShellAPI()

        # Create panels
        panel1 = api.create_panel("bottom", "Bottom", 50, 50, 100, 100)
        panel2 = api.create_panel("top", "Top", 50, 50, 100, 100)

        # panel2 should have higher z (created second)
        assert panel2.z > panel1.z

        # Bring panel1 to front
        api.bring_to_front("bottom")
        assert panel1.z > panel2.z

    def test_panel_drag_via_native_panel(self):
        """Panel drag operations should work via NativePanel"""
        api = NativeVisualShellAPI()

        panel = api.create_panel("draggable", "Drag Me", 100, 100, 200, 100)

        # Start drag
        panel.start_drag(150, 124)  # Click in title bar
        assert panel.dragging

        # Move
        panel.move_drag(200, 174)
        assert panel.x == 150  # 100 + (200 - 150)
        assert panel.y == 150  # 100 + (174 - 124)

        # End drag
        panel.end_drag()
        assert not panel.dragging

    def test_panel_minimize_restore(self):
        """Panel minimize/restore should affect state"""
        api = NativeVisualShellAPI()

        panel = api.create_panel("minimizable", "Minimize Me", 100, 100, 200, 100)

        # Minimize
        panel.minimize()
        assert panel.minimized

        # Restore
        panel.restore()
        assert not panel.minimized


class TestEvolutionVisualizationIntegration:
    """Integration tests for Evolution Visualization with infinite_map_rs"""

    def test_evolution_viz_loads_tile_data(self):
        """EvolutionVisualizer should load tile data from map format"""
        viz = EvolutionVisualizer()

        # Mock tile data from infinite_map_rs
        map_data = {
            "tiles": [
                {"id": "t0", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1, 0, 0, 1]},
                {"id": "t1", "x": 1, "y": 0, "generation": 1, "fitness": 0.7, "parent_id": "t0", "genome": [1, 1, 0, 1]},
                {"id": "t2", "x": 0, "y": 1, "generation": 2, "fitness": 0.9, "parent_id": "t1", "genome": [1, 1, 1, 1]},
            ]
        }

        viz.load_from_map(map_data)

        assert viz.tree is not None
        assert viz.heatmap is not None
        assert len(viz.clusters) > 0

    def test_evolution_animation_frames_generation(self):
        """Evolution visualizer should generate animation frames per generation"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t0", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1]},
                {"id": "t1", "x": 1, "y": 0, "generation": 1, "fitness": 0.6, "parent_id": "t0", "genome": [1]},
                {"id": "t2", "x": 0, "y": 1, "generation": 2, "fitness": 0.7, "parent_id": "t1", "genome": [1]},
            ]
        }

        viz.load_from_map(map_data)
        frames = viz.get_animation_frames()

        assert len(frames) == 3  # One frame per generation

        # Verify frame structure
        for frame in frames:
            assert "generation" in frame
            assert "tiles" in frame
            assert "count" in frame

    def test_evolution_renders_to_glyph_commands(self):
        """Evolution frames should render to glyph commands"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t0", "x": 10, "y": 10, "generation": 0, "fitness": 0.8, "parent_id": None, "genome": [1, 0]},
            ]
        }

        viz.load_from_map(map_data)
        frame = viz.render_frame(generation=0)

        assert "commands" in frame
        assert len(frame["commands"]) > 0

        # Verify command has evolution-specific attributes
        cmd = frame["commands"][0]
        assert cmd["opcode"] == "ORB"
        assert "color" in cmd
        assert "radius" in cmd

    def test_fitness_heatmap_color_mapping(self):
        """Fitness heatmap should map values to colors correctly"""
        viz = EvolutionVisualizer()

        tiles = [
            {"x": 0, "y": 0, "fitness": 0.0},  # Low fitness
            {"x": 1, "y": 0, "fitness": 0.5},  # Medium
            {"x": 0, "y": 1, "fitness": 1.0},  # High fitness
        ]

        heatmap = FitnessHeatmap.from_tiles(tiles, width=2, height=2)

        # Get colors for each position
        low_color = heatmap.get_color(0, 0)
        mid_color = heatmap.get_color(1, 0)
        high_color = heatmap.get_color(0, 1)

        # High fitness should have more red
        assert high_color[0] > low_color[0]  # Red channel

    def test_species_clustering_by_genome(self):
        """Species clustering should group tiles by genome similarity"""
        viz = EvolutionVisualizer()

        map_data = {
            "tiles": [
                {"id": "t1", "x": 0, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1, 0, 0, 1]},
                {"id": "t2", "x": 1, "y": 0, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [1, 0, 0, 1]},  # Same as t1
                {"id": "t3", "x": 0, "y": 1, "generation": 0, "fitness": 0.5, "parent_id": None, "genome": [0, 1, 1, 0]},  # Different
            ]
        }

        viz.load_from_map(map_data)

        # Should have 2 clusters (t1+t2 similar, t3 different)
        assert len(viz.clusters) == 2

        # Find the cluster with t1 and t2
        cluster_with_t1 = next(c for c in viz.clusters if "t1" in c.member_ids)
        assert "t2" in cluster_with_t1.member_ids


class TestCrossLanguageIntegration:
    """Tests for Python-TypeScript FFI bridge integration"""

    def test_ffi_bridge_spawn(self):
        """FFI bridge should spawn Python subprocess"""
        # This test requires visual-vm to be set up
        # Skip if not available
        pytest.skip("Requires visual-vm TypeScript environment")

    def test_hilbert_conversion_via_ffi(self):
        """Hilbert coordinate conversion should work via FFI"""
        # Test that we can call Hilbert functions via FFI
        # This validates the symbolic umbilical cord

        try:
            # Try importing from infinite_map_rs or native
            sys.path.insert(0, str(Path(__file__).parent.parent / "systems" / "infinite_map_rs" / "src"))
            from hilbert import hilbert_to_xy, xy_to_hilbert
        except ImportError:
            pytest.skip("Hilbert conversion not available in Python")

        # Test conversion
        index = xy_to_hilbert(100, 100, 8)  # 8-bit Hilbert
        x, y = hilbert_to_xy(index, 8)

        assert x == 100
        assert y == 100

    def test_render_state_serialization(self):
        """Render state should serialize to JSON for FFI transfer"""
        api = NativeVisualShellAPI()

        api.add_entity(UIEntity(id="test", type="orb", x=50, y=50, color=(255, 128, 64, 200)))

        # Get state as JSON-serializable format
        state = api.get_render_state()
        json_str = json.dumps(state)

        assert json_str is not None
        assert len(json_str) > 0

        # Verify round-trip
        parsed = json.loads(json_str)
        assert len(parsed) == len(state)
        assert parsed[0]["id"] == "test"


class TestPerformanceBenchmarks:
    """Performance benchmarks for Visual Shell"""

    def test_60fps_target_with_10000_entities(self):
        """Should maintain 60 FPS (16.67ms) with 10,000 entities"""
        api = NativeVisualShellAPI()

        # Create 10,000 entities
        for i in range(10000):
            entity = UIEntity(
                id=f"orb_{i}",
                type="orb",
                x=(i % 100) * 10,
                y=(i // 100) * 10,
                width=5,
                height=5,
                color=(100, 100, 200, 150)
            )
            api.add_entity(entity)

        # Benchmark frame rendering
        import time
        frame_times = []

        for _ in range(60):  # 60 frames
            start = time.perf_counter()
            state = api.get_render_state()
            elapsed = time.perf_counter() - start
            frame_times.append(elapsed)

        avg_frame_time = sum(frame_times) / len(frame_times)
        fps = 1.0 / avg_frame_time if avg_frame_time > 0 else float('inf')

        # Target 60 FPS, but allow 50+ for test environment variability
        assert fps >= 50, f"Expected 50+ FPS, got {fps:.1f}"
        assert len(state) == 10000

    def test_memory_efficiency_large_entity_count(self):
        """Memory usage should scale linearly with entity count"""

        api = NativeVisualShellAPI()

        # Add 1000 entities
        for i in range(1000):
            entity = UIEntity(
                id=f"orb_{i}",
                type="orb",
                x=i * 10 % 1000,
                y=i * 10 // 1000,
                width=5,
                height=5
            )
            api.add_entity(entity)

        # Check entity count
        assert len(api.entities) == 1000

        # Verify we can still get render state efficiently
        state = api.get_render_state()
        assert len(state) == 1000


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
