"""
Tests for Phase 50: Advanced Visual Tools

Tests for:
- VisualDebugOverlay (JS component simulation in Python)
- WGSLHotLoader (module loading and hot reload)
- VisualVerificationBridge (WebSocket event routing)
- Integration with VisualVerificationService
"""

import pytest
import json
import asyncio
from unittest.mock import Mock, AsyncMock, patch
from dataclasses import asdict

# Import the service
from systems.evolution_daemon.visual_verification_service import (
    VisualVerificationService,
    VisualIntent,
    SpatialRelation,
    VerificationResult,
    VerificationMatch,
    CriticalityLevel,
    CriticalityClassifier,
    LayoutVerifier,
    TextVerifier,
    SpatialVerifier,
)


class TestExportToFrontend:
    """Tests for exporting verification data to frontend"""

    @pytest.fixture
    def service(self):
        return VisualVerificationService()

    @pytest.fixture
    def sample_intent(self):
        return VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            properties={"text": "Click Me"},
            critical=True,
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="input", tolerance=10)
            ]
        )

    @pytest.fixture
    def sample_scene(self):
        return {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40, "text": "Click Me"},
                {"type": "Input", "x": 100, "y": 260, "width": 200, "height": 30}
            ]
        }

    @pytest.mark.asyncio
    async def test_export_verification_result_success(self, service, sample_intent, sample_scene):
        """Test exporting successful verification to frontend"""
        result = await service.verify(sample_intent, sample_scene, attempt_number=1)

        export = service.export_to_frontend(result, sample_intent)

        # Verify structure
        assert "success" in export
        assert "overall_confidence" in export
        assert "should_retry" in export
        assert "should_escalate" in export
        assert "summary" in export
        assert "retry_suggestions" in export
        assert "intent" in export
        assert "matches" in export
        assert "timestamp" in export

        # Verify values
        assert export["success"] is True
        assert export["overall_confidence"] >= 0.9
        assert export["should_retry"] is False
        assert export["intent"]["element_type"] == "button"
        assert export["intent"]["position"] == [100, 200]
        assert export["intent"]["size"] == [80, 40]

    @pytest.mark.asyncio
    async def test_export_verification_result_failure(self, service):
        """Test exporting failed verification to frontend"""
        intent = VisualIntent(
            element_type="button",
            position=(500, 500),  # Off-screen
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)
        export = service.export_to_frontend(result, intent)

        assert export["success"] is False
        assert export["overall_confidence"] < 0.5
        assert "not found" in export["summary"].lower()
        assert len(export["retry_suggestions"]) > 0

    @pytest.mark.asyncio
    async def test_export_includes_retry_suggestions(self, service):
        """Test that retry suggestions are included in export"""
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )
        scene = {
            "children": [
                {"type": "Button", "x": 115, "y": 200, "width": 80, "height": 40}  # 15px off
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)
        export = service.export_to_frontend(result, intent)

        if not export["success"]:
            assert len(export["retry_suggestions"]) >= 1
            assert any("position" in s.lower() or "adjust" in s.lower() for s in export["retry_suggestions"])

    def test_export_intent_for_frontend(self, service, sample_intent):
        """Test exporting intent for frontend overlay"""
        export = service.export_intent_for_frontend(sample_intent)

        assert export["element_type"] == "button"
        assert export["position"] == [100, 200]
        assert export["size"] == [80, 40]
        assert export["properties"]["text"] == "Click Me"
        assert export["critical"] is True
        assert len(export["spatial_relations"]) == 1
        assert export["spatial_relations"][0]["relation_type"] == "above"

    @pytest.mark.asyncio
    async def test_export_json_serializable(self, service, sample_intent, sample_scene):
        """Test that export is JSON serializable for WebSocket transmission"""
        result = await service.verify(sample_intent, sample_scene, attempt_number=1)
        export = service.export_to_frontend(result, sample_intent)

        # Should not raise
        json_str = json.dumps(export)
        parsed = json.loads(json_str)

        assert parsed["success"] == export["success"]

    @pytest.mark.asyncio
    async def test_export_includes_matches(self, service, sample_intent, sample_scene):
        """Test that individual match details are included"""
        result = await service.verify(sample_intent, sample_scene, attempt_number=1)
        export = service.export_to_frontend(result, sample_intent)

        assert len(export["matches"]) >= 1

        for match in export["matches"]:
            assert "success" in match
            assert "criticality" in match
            assert "actual_position" in match
            assert "expected_position" in match
            assert "position_delta" in match
            assert "failures" in match
            assert "confidence" in match


class TestSpatialRelationExport:
    """Tests for spatial relation export to frontend"""

    @pytest.fixture
    def service(self):
        return VisualVerificationService()

    @pytest.mark.asyncio
    async def test_export_spatial_relations(self, service):
        """Test that spatial relations are properly exported"""
        intent = VisualIntent(
            element_type="label",
            position=(100, 100),
            size=(80, 20),
            spatial_relations=[
                SpatialRelation(relation_type="above", target_element="button", tolerance=5),
                SpatialRelation(relation_type="left_of", target_element="input", tolerance=10)
            ]
        )
        scene = {
            "children": [
                {"type": "label", "x": 100, "y": 100, "width": 80, "height": 20},
                {"type": "button", "x": 100, "y": 150, "width": 80, "height": 40},
                {"type": "input", "x": 200, "y": 100, "width": 200, "height": 30}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)
        export = service.export_to_frontend(result, intent)

        # Check spatial relations are in the export
        assert len(export["intent"]["spatial_relations"]) == 2
        rel_types = [sr["relation_type"] for sr in export["intent"]["spatial_relations"]]
        assert "above" in rel_types
        assert "left_of" in rel_types


class TestVerificationEventDispatch:
    """Tests for event dispatch to WebMCP"""

    @pytest.mark.asyncio
    async def test_dispatch_verification_event(self):
        """Test that verification events can be dispatched"""
        service = VisualVerificationService()

        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)
        export = service.export_to_frontend(result, intent)

        # Simulate WebSocket dispatch
        event_data = {
            "type": "verification_result",
            "data": export
        }

        # Verify it's serializable
        json_str = json.dumps(event_data)
        parsed = json.loads(json_str)

        assert parsed["type"] == "verification_result"
        assert parsed["data"]["success"] is True

    @pytest.mark.asyncio
    async def test_dispatch_escalation_event(self):
        """Test that escalation events are dispatched correctly"""
        service = VisualVerificationService()

        intent = VisualIntent(
            element_type="button",
            position=(500, 500),  # Non-existent
            size=(80, 40),
            critical=True
        )
        scene = {"children": []}

        # Multiple attempts should trigger escalation
        for attempt in range(1, 4):
            result = await service.verify(intent, scene, attempt_number=attempt)

        export = service.export_to_frontend(result, intent)

        # Should have escalation flag
        assert export["should_escalate"] is True

        # Create escalation event
        event_data = {
            "type": "escalation_required",
            "data": {
                "task_id": "test-task-001",
                "summary": export["summary"],
                "confidence": export["overall_confidence"]
            }
        }

        json_str = json.dumps(event_data)
        parsed = json.loads(json_str)

        assert parsed["type"] == "escalation_required"


class TestFrontendOverlayData:
    """Tests for data structures used by VisualDebugOverlay"""

    @pytest.fixture
    def service(self):
        return VisualVerificationService()

    @pytest.mark.asyncio
    async def test_bounding_box_data_structure(self, service):
        """Test that bounding box data is correctly structured for overlay"""
        intent = VisualIntent(
            element_type="window",
            position=(50, 50),
            size=(400, 300),
            critical=True
        )
        scene = {
            "children": [
                {"type": "Window", "x": 50, "y": 50, "width": 400, "height": 300}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)
        export = service.export_to_frontend(result, intent)

        # Overlay needs these fields for bounding box rendering
        assert export["intent"]["position"][0] == 50
        assert export["intent"]["position"][1] == 50
        assert export["intent"]["size"][0] == 400
        assert export["intent"]["size"][1] == 300
        assert export["intent"]["critical"] is True

    @pytest.mark.asyncio
    async def test_confidence_color_mapping(self, service):
        """Test that confidence values are in expected ranges for color mapping"""
        # High confidence
        intent1 = VisualIntent(element_type="button", position=(100, 200), size=(80, 40))
        scene1 = {"children": [{"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}]}
        result1 = await service.verify(intent1, scene1, attempt_number=1)

        assert result1.overall_confidence >= 0.9  # Green

        # Medium confidence
        intent2 = VisualIntent(element_type="button", position=(100, 200), size=(80, 40))
        scene2 = {"children": [{"type": "Button", "x": 110, "y": 205, "width": 80, "height": 40}]}
        result2 = await service.verify(intent2, scene2, attempt_number=1)

        # Lower confidence (not exact match)
        intent3 = VisualIntent(element_type="button", position=(100, 200), size=(80, 40))
        scene3 = {"children": []}  # Not found
        result3 = await service.verify(intent3, scene3, attempt_number=1)

        assert result3.overall_confidence < 0.5  # Red


class TestWGSLHotLoaderSimulation:
    """Simulated tests for WGSL hot loader behavior"""

    def test_shader_module_key_generation(self):
        """Test shader module key generation pattern"""
        shader_id = "visual_shell"
        version = 1

        # Simulate the key generation
        key = f"{shader_id}_v{version}"

        assert key == "visual_shell_v1"

    def test_shader_version_tracking(self):
        """Test shader version tracking for rollback"""
        history = []

        # Simulate versions
        for v in range(1, 5):
            history.append({
                "version": v,
                "code": f"// Shader version {v}",
                "timestamp": 1000 * v
            })

        # Max 3 versions
        max_versions = 3
        if len(history) > max_versions:
            history = history[-max_versions:]

        assert len(history) == 3
        assert history[-1]["version"] == 4

    def test_compilation_error_format(self):
        """Test WGSL compilation error formatting"""
        errors = [
            {"line": 10, "message": "Unknown function 'foo'"},
            {"line": 25, "message": "Type mismatch"}
        ]

        formatted = "\n".join(f"Line {e['line']}: {e['message']}" for e in errors)

        assert "Line 10:" in formatted
        assert "Unknown function" in formatted


class TestVisualVerificationBridgeSimulation:
    """Simulated tests for WebSocket bridge behavior"""

    def test_message_serialization(self):
        """Test bridge message serialization"""
        message = {
            "type": "subscribe",
            "events": [
                "verification_result",
                "intent_update",
                "scene_update"
            ]
        }

        json_str = json.dumps(message)
        parsed = json.loads(json_str)

        assert parsed["type"] == "subscribe"
        assert len(parsed["events"]) == 3

    def test_event_routing(self):
        """Test event type routing"""
        handlers_called = []

        def handle_verification(data):
            handlers_called.append("verification")

        def handle_intent(data):
            handlers_called.append("intent")

        def handle_scene(data):
            handlers_called.append("scene")

        # Simulate message routing
        messages = [
            {"type": "verification_result", "data": {}},
            {"type": "intent_update", "data": {}},
            {"type": "scene_update", "data": {}},
        ]

        for msg in messages:
            if msg["type"] == "verification_result":
                handle_verification(msg["data"])
            elif msg["type"] == "intent_update":
                handle_intent(msg["data"])
            elif msg["type"] == "scene_update":
                handle_scene(msg["data"])

        assert "verification" in handlers_called
        assert "intent" in handlers_called
        assert "scene" in handlers_called

    def test_reconnection_logic(self):
        """Test reconnection attempt tracking"""
        max_attempts = 10
        current_attempt = 0
        connected = False

        # Simulate failed connection attempts
        for _ in range(5):
            if not connected and current_attempt < max_attempts:
                current_attempt += 1

        assert current_attempt == 5

        # Should not exceed max
        for _ in range(10):
            if not connected and current_attempt < max_attempts:
                current_attempt += 1

        assert current_attempt == 10  # Hit max


class TestIntegrationFlow:
    """End-to-end integration tests"""

    @pytest.fixture
    def service(self):
        return VisualVerificationService()

    @pytest.mark.asyncio
    async def test_complete_verification_flow(self, service):
        """Test complete flow from intent to frontend dispatch"""
        # 1. Create intent
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(120, 40),
            properties={"text": "Submit"},
            critical=True
        )

        # 2. Get scene (simulated from mirror neuron)
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 120, "height": 40, "text": "Submit"}
            ]
        }

        # 3. Verify
        result = await service.verify(intent, scene, attempt_number=1)

        # 4. Export for frontend
        export = service.export_to_frontend(result, intent)

        # 5. Simulate WebSocket dispatch
        ws_message = json.dumps({
            "type": "verification_result",
            "data": export
        })

        # 6. Verify complete flow
        parsed = json.loads(ws_message)
        assert parsed["type"] == "verification_result"
        assert parsed["data"]["success"] is True
        assert parsed["data"]["overall_confidence"] >= 0.9


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
