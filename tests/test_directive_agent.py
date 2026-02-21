#!/usr/bin/env python3
"""
Unit tests for DirectiveAgent - Bidirectional Human-AI Collaboration

Tests cover:
- DirectiveParsing: informational/research/out-of-scope parsing
- DirectiveExecution: execute with mock substrate map
- DirectiveAPI: WordPress API calls with mocked requests
- ComponentLookup: exact/partial/empty map lookups
"""

import pytest
from unittest.mock import Mock, patch, mock_open
import json
import os
import sys
from datetime import datetime, timedelta
from pathlib import Path

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus,
    INFORMATIONAL_KEYWORDS,
    RESEARCH_KEYWORDS,
    OUT_OF_SCOPE_PATTERNS,
)


class TestDirectiveParsing:
    """Test directive scope parsing and classification."""

    def test_informational_keyword_explain(self):
        """Test INFORMATIONAL scope detection with 'explain' keyword."""
        directive = Directive(
            id=1,
            title="Explain the Evolution Daemon",
            content="Please explain how it works",
            date="2026-02-21",
            author="user1"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL
        assert directive.action == "explain"

    def test_informational_keyword_how_does(self):
        """Test INFORMATIONAL scope detection with 'how does' keyword."""
        directive = Directive(
            id=2,
            title="Question",
            content="How does the healer agent work?",
            date="2026-02-21",
            author="user2"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL
        assert directive.action == "how does"

    def test_informational_keyword_describe(self):
        """Test INFORMATIONAL scope detection with 'describe' keyword."""
        directive = Directive(
            id=3,
            title="Describe component",
            content="Describe the substrate map",
            date="2026-02-21",
            author="user3"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL
        assert directive.action == "describe"

    def test_informational_keyword_tell_me_about(self):
        """Test INFORMATIONAL scope detection with 'tell me about' keyword."""
        directive = Directive(
            id=4,
            title="Info request",
            content="Tell me about the neural CPU",
            date="2026-02-21",
            author="user4"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL
        assert directive.action == "tell me about"

    def test_research_keyword_investigate(self):
        """Test RESEARCH scope detection with 'investigate' keyword."""
        directive = Directive(
            id=5,
            title="Investigate error",
            content="Please investigate the timeout issue",
            date="2026-02-21",
            author="user5"
        )
        assert directive.scope == DirectiveScope.RESEARCH
        assert directive.action == "investigate"

    def test_research_keyword_analyze(self):
        """Test RESEARCH scope detection with 'analyze' keyword."""
        directive = Directive(
            id=6,
            title="Analyze performance",
            content="Analyze the memory usage patterns",
            date="2026-02-21",
            author="user6"
        )
        assert directive.scope == DirectiveScope.RESEARCH
        assert directive.action == "analyze"

    def test_research_keyword_why_is(self):
        """Test RESEARCH scope detection with research intent."""
        directive = Directive(
            id=7,
            title="Why is this slow?",
            content="Research why the daemon is slow",
            date="2026-02-21",
            author="user7"
        )
        assert directive.scope == DirectiveScope.RESEARCH
        assert directive.action == "research"

    def test_out_of_scope_delete(self):
        """Test OUT_OF_SCOPE detection with 'delete' keyword."""
        directive = Directive(
            id=8,
            title="Delete file",
            content="Please delete the log file",
            date="2026-02-21",
            author="user8"
        )
        # Scope should be UNKNOWN (treated as out-of-scope in execution)
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_out_of_scope_restart(self):
        """Test OUT_OF_SCOPE detection with 'restart' keyword."""
        directive = Directive(
            id=9,
            title="Restart daemon",
            content="Can you restart the daemon?",
            date="2026-02-21",
            author="user9"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_out_of_scope_modify_code(self):
        """Test OUT_OF_SCOPE detection with 'modify code' pattern."""
        directive = Directive(
            id=10,
            title="Modify code",
            content="Please modify the code to fix bug",
            date="2026-02-21",
            author="user10"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_out_of_scope_create_file(self):
        """Test OUT_OF_SCOPE detection with 'create file' pattern."""
        directive = Directive(
            id=11,
            title="Create file",
            content="Create a new file for the feature",
            date="2026-02-21",
            author="user11"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_out_of_scope_write_code(self):
        """Test OUT_OF_SCOPE detection with 'write code' pattern."""
        directive = Directive(
            id=12,
            title="Write code",
            content="Write code to implement the feature",
            date="2026-02-21",
            author="user12"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_out_of_scope_priority_over_informational(self):
        """Test that out-of-scope patterns take priority over informational keywords."""
        # "explain" is informational, but "delete" makes it out-of-scope
        directive = Directive(
            id=13,
            title="Explain how to delete",
            content="Explain how to delete files",
            date="2026-02-21",
            author="user13"
        )
        # Out-of-scope is checked first in _detect_scope
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_unknown_scope_no_keywords(self):
        """Test UNKNOWN scope when no keywords match."""
        directive = Directive(
            id=14,
            title="Random text",
            content="This has no action keywords",
            date="2026-02-21",
            author="user14"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_target_extraction_quoted(self):
        """Test target extraction from quoted string."""
        directive = Directive(
            id=15,
            title="Explain 'evolution_daemon'",
            content="What is 'evolution_daemon'?",
            date="2026-02-21",
            author="user15"
        )
        assert directive.target == "evolution_daemon"

    def test_target_extraction_about_pattern(self):
        """Test target extraction from 'about X' pattern."""
        directive = Directive(
            id=16,
            title="Question",
            content="Tell me about the healer agent",
            date="2026-02-21",
            author="user16"
        )
        # Should match "the healer agent" or "healer agent"
        assert "healer" in directive.target.lower()

    def test_directive_post_init_auto_parsing(self):
        """Test that __post_init__ automatically parses scope, action, target."""
        directive = Directive(
            id=17,
            title="Explain Evolution Daemon",
            content="Please explain the evolution daemon component",
            date="2026-02-21",
            author="user17"
        )
        # All fields should be auto-populated
        assert directive.scope == DirectiveScope.INFORMATIONAL
        assert directive.action == "explain"
        assert directive.target != ""


class TestDirectiveExecution:
    """Test directive execution with mock substrate map."""

    @pytest.fixture
    def mock_substrate_map(self):
        """Create mock substrate map for testing."""
        return {
            "evolution_daemon": {
                "name": "Evolution Daemon",
                "path": "systems/evolution_daemon",
                "description": "Natural Selection for Operating Systems",
                "metadata": {
                    "language": "Python",
                    "files": 42,
                    "entry_points": ["main.py", "daemon.py"]
                }
            },
            "healer_agent": {
                "name": "Healer Agent",
                "path": "systems/visual_shell/healer_agent.py",
                "description": "Self-healing system component",
                "metadata": {
                    "language": "Python",
                    "files": 5,
                    "entry_points": ["healer_agent.py"]
                }
            },
            "neural_cpu": {
                "name": "Neural CPU",
                "path": "systems/neural_cpu",
                "description": "AI-powered CPU emulation",
                "metadata": {
                    "language": "Rust",
                    "files": 120,
                    "entry_points": ["main.rs"]
                }
            }
        }

    @pytest.fixture
    def agent(self, mock_substrate_map):
        """Create DirectiveAgent with mock substrate map."""
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(wp_url="http://test.local")
            agent._substrate_cache = mock_substrate_map
            return agent

    def test_execute_informational_found(self, agent):
        """Test informational execution with component found."""
        directive = Directive(
            id=1,
            title="Explain Evolution Daemon",
            content="Explain 'evolution_daemon'",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.COMPLETED
        assert "Evolution Daemon" in response
        assert "Natural Selection" in response
        assert "systems/evolution_daemon" in response

    def test_execute_informational_not_found(self, agent):
        """Test informational execution with component not found."""
        directive = Directive(
            id=2,
            title="Explain unknown",
            content="Explain 'nonexistent_component'",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.NEEDS_CLARIFICATION
        assert "Not Found" in response
        assert "nonexistent_component" in response

    def test_execute_research_found(self, agent):
        """Test research execution with component found."""
        directive = Directive(
            id=3,
            title="Analyze healer agent",
            content="Analyze 'healer_agent'",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.COMPLETED
        assert "Research: Healer Agent" in response
        assert "Self-healing" in response
        assert "small codebase" in response  # 5 files

    def test_execute_research_large_codebase(self, agent):
        """Test research execution classifies large codebase correctly."""
        directive = Directive(
            id=4,
            title="Analyze neural CPU",
            content="Analyze 'neural_cpu'",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.COMPLETED
        assert "large codebase" in response  # 120 files

    def test_execute_research_not_found(self, agent):
        """Test research execution with component not found."""
        directive = Directive(
            id=5,
            title="Research missing",
            content="Research 'missing_component'",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.NEEDS_CLARIFICATION
        assert "Not Found" in response

    def test_execute_out_of_scope_delete(self, agent):
        """Test out-of-scope execution for delete request."""
        directive = Directive(
            id=6,
            title="Delete file",
            content="Delete the config file",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.OUT_OF_SCOPE
        assert "Out of Scope" in response
        assert "Phase 3" in response

    def test_execute_out_of_scope_restart(self, agent):
        """Test out-of-scope execution for restart request."""
        directive = Directive(
            id=7,
            title="Restart daemon",
            content="Please restart the daemon",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.OUT_OF_SCOPE
        assert "Out of Scope" in response

    def test_execute_out_of_scope_modify_code(self, agent):
        """Test out-of-scope execution for modify code request."""
        directive = Directive(
            id=8,
            title="Modify code",
            content="Modify the code to add feature",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.OUT_OF_SCOPE

    def test_execute_unknown_scope(self, agent):
        """Test unknown scope returns NEEDS_CLARIFICATION."""
        directive = Directive(
            id=9,
            title="Random request",
            content="This has no recognizable keywords",
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.NEEDS_CLARIFICATION
        assert "Needs Clarification" in response
        assert "explain" in response or "describe" in response

    def test_execute_empty_target(self, agent):
        """Test execution with empty target."""
        directive = Directive(
            id=10,
            title="Explain",
            content="Explain",  # No target
            date="2026-02-21",
            author="user"
        )
        status, response = agent.execute_directive(directive)
        assert status == DirectiveStatus.NEEDS_CLARIFICATION


class TestDirectiveAPI:
    """Test WordPress API calls with mocked requests."""

    @pytest.fixture
    def agent(self):
        """Create DirectiveAgent with mocked substrate map."""
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(wp_url="http://test.local")
            agent._substrate_cache = {"test": {"name": "Test"}}
            return agent

    def test_poll_directives_success(self, agent):
        """Test successful poll_directives API call."""
        mock_response = Mock()
        mock_response.json.return_value = {
            "success": True,
            "directives": [
                {
                    "id": 1,
                    "title": "Test Directive",
                    "content": "Explain the system",
                    "date": "2026-02-21",
                    "author": "user"
                }
            ]
        }
        mock_response.raise_for_status = Mock()

        with patch('requests.post', return_value=mock_response):
            directives = agent.poll_directives()

        assert len(directives) == 1
        assert directives[0].id == 1
        assert directives[0].title == "Test Directive"

    def test_poll_directives_empty(self, agent):
        """Test poll_directives with no directives."""
        mock_response = Mock()
        mock_response.json.return_value = {
            "success": True,
            "directives": []
        }
        mock_response.raise_for_status = Mock()

        with patch('requests.post', return_value=mock_response):
            directives = agent.poll_directives()

        assert len(directives) == 0

    def test_poll_directives_api_failure(self, agent):
        """Test poll_directives with API failure."""
        import requests
        with patch('systems.intelligence.directive_agent.requests.post', side_effect=requests.RequestException("Connection error")):
            directives = agent.poll_directives()

        assert len(directives) == 0

    def test_post_response_success(self, agent):
        """Test successful post_response API call."""
        directive = Directive(
            id=1,
            title="Test",
            content="Test content",
            date="2026-02-21",
            author="user"
        )

        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "comment_id": 42}
        mock_response.raise_for_status = Mock()

        with patch('requests.post', return_value=mock_response):
            result = agent.post_response(
                directive,
                DirectiveStatus.COMPLETED,
                "<p>Test response</p>"
            )

        assert result is True

    def test_post_response_failure(self, agent):
        """Test post_response with API failure."""
        import requests
        directive = Directive(
            id=1,
            title="Test",
            content="Test content",
            date="2026-02-21",
            author="user"
        )

        with patch('systems.intelligence.directive_agent.requests.post', side_effect=requests.RequestException("API error")):
            result = agent.post_response(
                directive,
                DirectiveStatus.COMPLETED,
                "<p>Test response</p>"
            )

        assert result is False

    def test_mark_processed_success(self, agent):
        """Test successful mark_processed API call."""
        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "post_id": 1}
        mock_response.raise_for_status = Mock()

        with patch('requests.post', return_value=mock_response):
            result = agent.mark_processed(1)

        assert result is True

    def test_mark_processed_failure(self, agent):
        """Test mark_processed with API failure."""
        import requests
        with patch('systems.intelligence.directive_agent.requests.post', side_effect=requests.RequestException("API error")):
            result = agent.mark_processed(1)

        assert result is False

    def test_api_call_payload_format(self, agent):
        """Test API call payload format."""
        mock_response = Mock()
        mock_response.json.return_value = {"success": True}
        mock_response.raise_for_status = Mock()

        with patch('requests.post') as mock_post:
            mock_post.return_value = mock_response
            agent._api_call("testTool", param1="value1", param2=123)

            call_args = mock_post.call_args
            payload = call_args.kwargs['json']

            assert payload['tool'] == "testTool"
            assert payload['param1'] == "value1"
            assert payload['param2'] == 123

    def test_post_response_includes_status_emoji(self, agent):
        """Test post_response includes status emoji in response."""
        directive = Directive(
            id=1,
            title="Test",
            content="Test content",
            date="2026-02-21",
            author="user"
        )

        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "comment_id": 1}
        mock_response.raise_for_status = Mock()

        with patch('requests.post') as mock_post:
            mock_post.return_value = mock_response
            agent.post_response(
                directive,
                DirectiveStatus.COMPLETED,
                "<p>Done</p>"
            )

            call_args = mock_post.call_args
            payload = call_args.kwargs['json']
            response = payload['response']

            assert "✅" in response
            assert "Completed" in response


class TestComponentLookup:
    """Test component lookup in substrate map."""

    @pytest.fixture
    def agent(self):
        """Create DirectiveAgent with mock substrate map."""
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(wp_url="http://test.local")
            agent._substrate_cache = {
                "evolution_daemon": {
                    "name": "Evolution Daemon",
                    "path": "systems/evolution_daemon",
                    "description": "Test description",
                    "metadata": {"language": "Python"}
                },
                "healer_agent": {
                    "name": "Healer Agent",
                    "path": "systems/healer",
                    "description": "Healer description"
                },
                "NeuralCPU": {
                    "name": "Neural CPU",
                    "path": "systems/neural_cpu"
                }
            }
            return agent

    def test_exact_match(self, agent):
        """Test exact match component lookup."""
        result = agent._lookup_component("evolution_daemon")
        assert result is not None
        assert result["name"] == "Evolution Daemon"

    def test_partial_match_in_key(self, agent):
        """Test partial match in component key."""
        result = agent._lookup_component("evolution")
        assert result is not None
        assert "Evolution" in result["name"]

    def test_partial_match_in_value(self, agent):
        """Test partial match in component value."""
        result = agent._lookup_component("Healer")
        assert result is not None
        assert result["name"] == "Healer Agent"

    def test_case_insensitive_match(self, agent):
        """Test case-insensitive partial match."""
        result = agent._lookup_component("neuralcpu")
        assert result is not None
        assert result["name"] == "Neural CPU"

    def test_no_match(self, agent):
        """Test lookup with no match."""
        result = agent._lookup_component("nonexistent")
        assert result is None

    def test_empty_target(self, agent):
        """Test lookup with empty target string."""
        result = agent._lookup_component("")
        assert result is None

    def test_empty_substrate_map(self):
        """Test lookup with empty substrate map."""
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(wp_url="http://test.local")
            agent._substrate_cache = {}

            result = agent._lookup_component("anything")
            assert result is None

    def test_none_target(self, agent):
        """Test lookup with None target."""
        result = agent._lookup_component(None)
        assert result is None

    def test_substring_in_description(self, agent):
        """Test partial match in description field."""
        result = agent._lookup_component("description")
        # Should match since "description" appears in description values
        # Implementation checks if target_lower is IN the stringified value
        # This may or may not match depending on implementation
        # The lookup checks: target_lower in str(value).lower()
        # So "description" would match any component with "description" in its data
        assert result is not None  # At least one has "description" in value


class TestProcessOneCycle:
    """Test the process_one_cycle method."""

    @pytest.fixture
    def agent(self):
        """Create DirectiveAgent with mocked dependencies."""
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(wp_url="http://test.local")
            agent._substrate_cache = {
                "test_component": {
                    "name": "Test Component",
                    "description": "A test component"
                }
            }
            return agent

    def test_process_one_cycle_empty(self, agent):
        """Test process_one_cycle with no directives."""
        with patch.object(agent, 'poll_directives', return_value=[]):
            result = agent.process_one_cycle()
        assert result == 0

    def test_process_one_cycle_success(self, agent):
        """Test process_one_cycle with successful processing."""
        directive = Directive(
            id=1,
            title="Explain Test Component",
            content="Explain 'test_component'",
            date="2026-02-21",
            author="user"
        )

        with patch.object(agent, 'poll_directives', return_value=[directive]):
            with patch.object(agent, 'post_response', return_value=True):
                with patch.object(agent, 'mark_processed', return_value=True):
                    result = agent.process_one_cycle()

        assert result == 1

    def test_process_one_cycle_multiple(self, agent):
        """Test process_one_cycle with multiple directives."""
        directives = [
            Directive(
                id=1,
                title="Explain A",
                content="Explain 'test_component'",
                date="2026-02-21",
                author="user"
            ),
            Directive(
                id=2,
                title="Analyze B",
                content="Analyze 'test_component'",
                date="2026-02-21",
                author="user"
            )
        ]

        with patch.object(agent, 'poll_directives', return_value=directives):
            with patch.object(agent, 'post_response', return_value=True):
                with patch.object(agent, 'mark_processed', return_value=True):
                    result = agent.process_one_cycle()

        assert result == 2

    def test_process_one_cycle_handles_exception(self, agent):
        """Test process_one_cycle continues on exception without crashing."""
        directive = Directive(
            id=1,
            title="Test",
            content="Test",
            date="2026-02-21",
            author="user"
        )

        with patch.object(agent, 'poll_directives', return_value=[directive]):
            with patch.object(agent, 'post_response', side_effect=Exception("Error")):
                with patch.object(agent, 'mark_processed', return_value=True):
                    # Should not raise exception, returns 0 since error occurred
                    result = agent.process_one_cycle()

        # Exception caught, processed count is 0 (not incremented on error)
        assert result == 0


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_directive_with_special_characters(self):
        """Test directive with special characters in content."""
        directive = Directive(
            id=1,
            title="Explain <script>alert('xss')</script>",
            content="Explain the component with & special <chars>",
            date="2026-02-21",
            author="user"
        )
        # Should not raise exception
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_directive_with_unicode(self):
        """Test directive with unicode content."""
        directive = Directive(
            id=1,
            title="Explain",
            content="Explain the daemon",
            date="2026-02-21",
            author="user"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_very_long_directive_content(self):
        """Test directive with very long content."""
        long_content = "Explain " + "x" * 10000
        directive = Directive(
            id=1,
            title="Long directive",
            content=long_content,
            date="2026-02-21",
            author="user"
        )
        # Should handle without error
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_empty_directive_fields(self):
        """Test directive with empty fields."""
        directive = Directive(
            id=0,
            title="",
            content="",
            date="",
            author=""
        )
        assert directive.scope == DirectiveScope.UNKNOWN
        assert directive.action == "unknown"
        assert directive.target == ""

    def test_substrate_map_file_not_found(self):
        """Test DirectiveAgent with missing substrate map file."""
        with patch('pathlib.Path.exists', return_value=False):
            agent = DirectiveAgent(
                wp_url="http://test.local",
                substrate_map_path="/nonexistent/path.json"
            )
            assert agent._substrate_cache == {}

    def test_substrate_map_invalid_json(self):
        """Test DirectiveAgent with invalid JSON in substrate map."""
        with patch('pathlib.Path.exists', return_value=True):
            with patch('builtins.open', mock_open(read_data="not valid json")):
                agent = DirectiveAgent(
                    wp_url="http://test.local",
                    substrate_map_path="/path/to/map.json"
                )
                assert agent._substrate_cache == {}


class TestHeartbeatSupport:
    """Test heartbeat support for daemon monitoring."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create DirectiveAgent with temp heartbeat path."""
        heartbeat_path = tmp_path / "heartbeat.json"
        with patch.object(
            DirectiveAgent,
            '_load_substrate_map',
            return_value=None
        ):
            agent = DirectiveAgent(
                wp_url="http://test.local",
                heartbeat_path=str(heartbeat_path)
            )
            agent._substrate_cache = {"test": {"name": "Test"}}
            return agent, heartbeat_path

    def test_write_heartbeat_creates_file(self, agent):
        """Test that write_heartbeat creates the heartbeat file."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()

        agent_instance.write_heartbeat()

        assert heartbeat_path.exists()

    def test_heartbeat_contains_required_fields(self, agent):
        """Test that heartbeat contains all required fields."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()
        agent_instance._directives_processed = 5

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Check all required fields
        assert "timestamp" in data
        assert "pid" in data
        assert "running" in data
        assert "uptime_seconds" in data
        assert "directives_processed" in data
        assert "wp_url" in data
        assert "poll_interval" in data
        assert "substrate_components" in data

        # Check field values
        assert data["pid"] == os.getpid()
        assert data["running"] is True
        assert data["directives_processed"] == 5
        assert data["wp_url"] == "http://test.local"
        assert data["poll_interval"] == 30
        assert data["substrate_components"] == 1

    def test_heartbeat_updates_on_cycle(self, agent):
        """Test that heartbeat updates after process_one_cycle."""
        agent_instance, heartbeat_path = agent

        # Process a directive
        directive = Directive(
            id=1,
            title="Explain test",
            content="Explain 'test'",
            date="2026-02-21",
            author="user"
        )

        with patch.object(agent_instance, 'poll_directives', return_value=[directive]):
            with patch.object(agent_instance, 'post_response', return_value=True):
                with patch.object(agent_instance, 'mark_processed', return_value=True):
                    agent_instance.process_one_cycle()

        # Check heartbeat was written
        assert heartbeat_path.exists()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Should have processed 1 directive
        assert data["directives_processed"] == 1
        assert data["running"] is True
        assert data["uptime_seconds"] > 0

    def test_heartbeat_not_running_before_first_cycle(self, agent):
        """Test that running is False before first cycle."""
        agent_instance, heartbeat_path = agent

        # Don't call process_one_cycle, just write heartbeat directly
        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # _start_time is None, so running should be False
        assert data["running"] is False
        assert data["uptime_seconds"] == 0.0

    def test_heartbeat_uptime_increases(self, agent):
        """Test that uptime increases over time."""
        agent_instance, heartbeat_path = agent

        # Set start time in the past
        agent_instance._start_time = datetime.utcnow() - timedelta(seconds=10)

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Uptime should be at least 10 seconds
        assert data["uptime_seconds"] >= 10.0

    def test_heartbeat_creates_parent_directory(self, tmp_path):
        """Test that write_heartbeat creates parent directories."""
        heartbeat_path = tmp_path / "nested" / "dir" / "heartbeat.json"

        with patch.object(DirectiveAgent, '_load_substrate_map', return_value=None):
            agent = DirectiveAgent(
                wp_url="http://test.local",
                heartbeat_path=str(heartbeat_path)
            )
            agent._start_time = datetime.utcnow()
            agent.write_heartbeat()

        assert heartbeat_path.exists()
        assert heartbeat_path.parent.is_dir()


class TestCLIInterface:
    """Test CLI interface for daemon control."""

    def test_cli_help_shows_options(self):
        """Test that --help shows all expected options."""
        import subprocess

        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.directive_agent", "--help"],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert "--wp-url" in result.stdout
        assert "--poll-interval" in result.stdout
        assert "--heartbeat" in result.stdout
        assert "--substrate-map" in result.stdout
        assert "--once" in result.stdout
        assert "--version" in result.stdout

    def test_cli_version_flag(self):
        """Test that --version returns correct version."""
        import subprocess

        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.directive_agent", "--version"],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert "DirectiveAgent 1.0.0" in result.stdout
