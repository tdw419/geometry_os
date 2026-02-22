#!/usr/bin/env python3
"""
API Contract Tests for WordPress Integration.

Validates that the DirectiveAgent correctly interacts with
the WordPress API according to the expected contracts.

Run: pytest tests/test_directive_contracts.py -v
"""

import pytest
import json
from unittest.mock import patch, MagicMock

from systems.intelligence.directive_agent import DirectiveAgent


class TestGetDirectivesContract:
    """Contract tests for getDirectives API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_getDirectives_returns_list(self, agent):
        """getDirectives should return a list of directives."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {
                "success": True,
                "directives": [
                    {"id": 1, "title": "Test", "content": "", "date": "", "author": ""}
                ]
            }

            result = agent.poll_directives()

            assert isinstance(result, list)

    def test_getDirectives_payload_format(self, agent):
        """getDirectives should send correct payload format."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            agent.poll_directives()

            # Verify payload format
            call_args = mock_api.call_args
            assert call_args[0][0] == "getDirectives"

    def test_getDirectives_handles_empty_response(self, agent):
        """getDirectives should handle empty directives list."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            result = agent.poll_directives()

            assert result == []

    def test_getDirectives_handles_failure(self, agent):
        """getDirectives should handle API failure gracefully."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": False, "error": "Database error"}

            result = agent.poll_directives()

            assert result == []


class TestMarkDirectiveProcessedContract:
    """Contract tests for markDirectiveProcessed API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_markDirectiveProcessed_payload_format(self, agent):
        """markDirectiveProcessed should send post_id in arguments."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            result = agent.mark_processed(123)

            # Verify payload includes post_id
            call_args = mock_api.call_args
            assert call_args[1]["post_id"] == 123
            assert result is True

    def test_markDirectiveProcessed_returns_boolean(self, agent):
        """markDirectiveProcessed should return boolean success."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            result = agent.mark_processed(123)
            assert result is True

            mock_api.return_value = {"success": False}
            result = agent.mark_processed(456)
            assert result is False


class TestPostDirectiveResponseContract:
    """Contract tests for postDirectiveResponse API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_postDirectiveResponse_payload_format(self, agent):
        """postDirectiveResponse should send post_id, response, status."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.COMPLETED, "<p>Test</p>")

            call_args = mock_api.call_args
            assert call_args[1]["post_id"] == 1
            assert "response" in call_args[1]
            assert call_args[1]["status"] == "completed"

    def test_postDirectiveResponse_includes_status_emoji(self, agent):
        """Response should include status emoji in HTML."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.COMPLETED, "<p>Test</p>")

            call_args = mock_api.call_args
            response = call_args[1]["response"]
            assert "✅" in response  # Completed emoji

    def test_postDirectiveResponse_out_of_scope_emoji(self, agent):
        """Out of scope should use 🚫 emoji."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.OUT_OF_SCOPE, "<p>Nope</p>")

            call_args = mock_api.call_args
            response = call_args[1]["response"]
            assert "🚫" in response


class TestSubstrateCacheContract:
    """Contract tests for substrate map cache."""

    def test_substrate_cache_is_dict(self, tmp_path):
        """Substrate cache should be a dictionary."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        assert isinstance(agent._substrate_cache, dict)

    def test_substrate_cache_component_has_required_fields(self, tmp_path):
        """Each component should have required fields."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({
                "test": {
                    "name": "Test Component",
                    "path": "systems/test",
                    "description": "Test description"
                }
            }, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        component = agent._substrate_cache.get("test")
        assert "name" in component
        assert "path" in component or "description" in component  # At least one

    def test_substrate_cache_handles_missing_file(self, tmp_path):
        """Agent should handle missing substrate file gracefully."""
        non_existent = tmp_path / "does_not_exist.json"

        # Should not raise
        agent = DirectiveAgent(substrate_map_path=str(non_existent))

        assert agent._substrate_cache == {}

    def test_substrate_cache_handles_invalid_json(self, tmp_path):
        """Agent should handle invalid JSON gracefully."""
        invalid_file = tmp_path / "invalid.json"
        with open(invalid_file, 'w') as f:
            f.write("not valid json {{{")

        # Should not raise
        agent = DirectiveAgent(substrate_map_path=str(invalid_file))

        assert agent._substrate_cache == {}
