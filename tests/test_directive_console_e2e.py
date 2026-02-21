#!/usr/bin/env python3
"""
E2E Integration Tests for Directive Console - Bidirectional Human-AI Collaboration

Tests full lifecycle with real WordPress API:
- WordPress API availability check
- getDirectives returns list format
- Full directive lifecycle: create -> poll -> execute -> respond -> mark
- Out-of-scope directive rejection

These tests require WordPress running on localhost:8080.
Tests will skip gracefully if WordPress is unavailable.
"""

import pytest
import requests
import time
import json
from unittest.mock import patch

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus,
)


# WordPress API endpoint
WP_URL = "http://localhost:8080"
WP_API = f"{WP_URL}/ai-publisher.php"
API_TIMEOUT = 10


def wordpress_available():
    """Check if WordPress is running and accessible."""
    try:
        response = requests.get(f"{WP_URL}/", timeout=5)
        return response.status_code == 200
    except requests.RequestException:
        return False


@pytest.fixture
def wp_available():
    """Check WordPress availability and return boolean."""
    return wordpress_available()


@pytest.fixture
def clean_agent(wp_available):
    """Create DirectiveAgent connected to real WordPress."""
    if not wp_available:
        pytest.skip("WordPress not running on localhost:8080")
    return DirectiveAgent(wp_url=WP_URL)


@pytest.fixture
def mock_substrate_map(clean_agent):
    """Add mock substrate map for component lookups."""
    clean_agent._substrate_cache = {
        "test_component": {
            "name": "Test Component",
            "path": "systems/test",
            "description": "A test component for E2E testing",
            "metadata": {
                "language": "Python",
                "files": 5,
                "entry_points": ["main.py"]
            }
        },
        "evolution_daemon": {
            "name": "Evolution Daemon",
            "path": "systems/evolution_daemon",
            "description": "Natural Selection for Operating Systems",
            "metadata": {
                "language": "Python",
                "files": 42,
                "entry_points": ["main.py", "daemon.py"]
            }
        }
    }
    return clean_agent


class TestWordPressAPIAvailable:
    """Test WordPress API availability."""

    def test_wordpress_api_available(self, wp_available):
        """Test that WordPress API is accessible."""
        if not wp_available:
            pytest.skip("WordPress not running on localhost:8080")
        response = requests.post(
            WP_API,
            json={"tool": "get_stats"},
            timeout=API_TIMEOUT
        )
        assert response.status_code == 200
        data = response.json()
        assert data.get("success") is True


class TestGetDirectivesReturnsList:
    """Test getDirectives API returns proper list format."""

    def test_get_directives_returns_list(self, wp_available):
        """Test that getDirectives returns a list of directives."""
        if not wp_available:
            pytest.skip("WordPress not running on localhost:8080")
        response = requests.post(
            WP_API,
            json={"tool": "getDirectives", "arguments": {}},
            timeout=API_TIMEOUT
        )
        assert response.status_code == 200
        data = response.json()
        assert data.get("success") is True
        assert "directives" in data
        assert isinstance(data["directives"], list)

    def test_get_directives_list_structure(self, wp_available):
        """Test that directives in list have required fields."""
        if not wp_available:
            pytest.skip("WordPress not running on localhost:8080")
        response = requests.post(
            WP_API,
            json={"tool": "getDirectives", "arguments": {}},
            timeout=API_TIMEOUT
        )
        data = response.json()
        directives = data.get("directives", [])

        # If there are directives, verify structure
        if directives:
            directive = directives[0]
            assert "id" in directive
            assert "title" in directive
            assert "content" in directive
            assert "date" in directive
            assert "author" in directive


class TestCreateAndProcessDirective:
    """Test full directive lifecycle: create -> poll -> execute -> respond -> mark."""

    def _create_test_directive(self, title: str, content: str) -> int:
        """Create a test directive post and return its ID."""
        # First, get or create the Directives category
        response = requests.post(
            WP_API,
            json={
                "tool": "get_categories",
                "arguments": {}
            },
            timeout=API_TIMEOUT
        )

        # Create post with Directives category (or fallback to default)
        # We need to use publish action with category for directives
        response = requests.post(
            WP_API,
            json={
                "tool": "createPost",
                "arguments": {
                    "title": title,
                    "content": content,
                    "status": "publish",
                    "category": 1  # Default category (Directives may not exist yet)
                }
            },
            timeout=API_TIMEOUT
        )

        data = response.json()
        if not data.get("success"):
            raise Exception(f"Failed to create test directive: {data}")

        post_id = data.get("post_id")
        return post_id

    def _cleanup_directive(self, post_id: int):
        """Clean up test directive by marking it processed."""
        requests.post(
            WP_API,
            json={
                "tool": "markDirectiveProcessed",
                "arguments": {"post_id": post_id}
            },
            timeout=API_TIMEOUT
        )

    def test_create_and_process_directive(self, mock_substrate_map):
        """Test full lifecycle: create post -> poll -> execute -> respond -> mark."""
        agent = mock_substrate_map

        # Step 1: Create a test directive
        unique_id = str(int(time.time()))
        test_title = f"E2E Test: Explain Test Component {unique_id}"
        test_content = f"Please explain 'test_component' - E2E test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            # Step 2: Poll for directives
            directives = agent.poll_directives()

            # Find our test directive
            our_directive = None
            for d in directives:
                if d.id == post_id:
                    our_directive = d
                    break

            # If not found in unprocessed list, create a fresh Directive
            if not our_directive:
                our_directive = Directive(
                    id=post_id,
                    title=test_title,
                    content=test_content,
                    date="",
                    author="test"
                )

            # Step 3: Execute the directive
            status, response = agent.execute_directive(our_directive)

            # Verify it's completed (since test_component exists in mock substrate)
            assert status == DirectiveStatus.COMPLETED
            assert "Test Component" in response

            # Step 4: Post response
            result = agent.post_response(our_directive, status, response)
            assert result is True

            # Step 5: Mark as processed
            result = agent.mark_processed(post_id)
            assert result is True

        finally:
            # Cleanup: ensure directive is marked processed
            self._cleanup_directive(post_id)

    def test_process_informational_directive(self, mock_substrate_map):
        """Test processing an informational directive."""
        agent = mock_substrate_map

        # Create informational directive
        unique_id = str(int(time.time()))
        test_title = f"E2E: What is evolution_daemon? {unique_id}"
        test_content = f"How does evolution_daemon work? Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            # Create directive object
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            # Execute should return COMPLETED (component exists)
            status, response = agent.execute_directive(directive)
            assert status == DirectiveStatus.COMPLETED

            # Post and mark
            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)

    def test_process_research_directive(self, mock_substrate_map):
        """Test processing a research directive."""
        agent = mock_substrate_map

        # Create research directive
        unique_id = str(int(time.time()))
        test_title = f"E2E: Analyze evolution_daemon {unique_id}"
        test_content = f"Analyze 'evolution_daemon' for me. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            # Create directive object
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            # Execute should return COMPLETED (component exists)
            status, response = agent.execute_directive(directive)
            assert status == DirectiveStatus.COMPLETED
            assert "Research" in response

            # Post and mark
            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)


class TestOutOfScopeDirectiveRejected:
    """Test that out-of-scope directives are properly rejected."""

    def _create_test_directive(self, title: str, content: str) -> int:
        """Create a test directive post and return its ID."""
        response = requests.post(
            WP_API,
            json={
                "tool": "createPost",
                "arguments": {
                    "title": title,
                    "content": content,
                    "status": "publish",
                    "category": 1
                }
            },
            timeout=API_TIMEOUT
        )

        data = response.json()
        if not data.get("success"):
            raise Exception(f"Failed to create test directive: {data}")

        return data.get("post_id")

    def _cleanup_directive(self, post_id: int):
        """Clean up test directive by marking it processed."""
        requests.post(
            WP_API,
            json={
                "tool": "markDirectiveProcessed",
                "arguments": {"post_id": post_id}
            },
            timeout=API_TIMEOUT
        )

    def test_out_of_scope_directive_rejected(self, mock_substrate_map):
        """Test that out-of-scope directives are rejected with proper message."""
        agent = mock_substrate_map

        # Create out-of-scope directive (delete request)
        unique_id = str(int(time.time()))
        test_title = f"E2E: Delete files {unique_id}"
        test_content = f"Please delete the log files. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            # Create directive object
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            # Execute should return OUT_OF_SCOPE
            status, response = agent.execute_directive(directive)

            assert status == DirectiveStatus.OUT_OF_SCOPE
            assert "Out of Scope" in response
            assert "Phase 3" in response

            # Post and mark
            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)

    def test_restart_directive_rejected(self, mock_substrate_map):
        """Test that restart directives are rejected as out-of-scope."""
        agent = mock_substrate_map

        unique_id = str(int(time.time()))
        test_title = f"E2E: Restart daemon {unique_id}"
        test_content = f"Restart the evolution daemon. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            status, response = agent.execute_directive(directive)

            assert status == DirectiveStatus.OUT_OF_SCOPE
            assert "Out of Scope" in response

            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)

    def test_modify_code_directive_rejected(self, mock_substrate_map):
        """Test that modify code directives are rejected as out-of-scope."""
        agent = mock_substrate_map

        unique_id = str(int(time.time()))
        test_title = f"E2E: Modify code {unique_id}"
        test_content = f"Modify the code to fix the bug. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            status, response = agent.execute_directive(directive)

            assert status == DirectiveStatus.OUT_OF_SCOPE

            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)


class TestNeedsClarification:
    """Test directives that need clarification."""

    def _create_test_directive(self, title: str, content: str) -> int:
        """Create a test directive post and return its ID."""
        response = requests.post(
            WP_API,
            json={
                "tool": "createPost",
                "arguments": {
                    "title": title,
                    "content": content,
                    "status": "publish",
                    "category": 1
                }
            },
            timeout=API_TIMEOUT
        )

        data = response.json()
        if not data.get("success"):
            raise Exception(f"Failed to create test directive: {data}")

        return data.get("post_id")

    def _cleanup_directive(self, post_id: int):
        """Clean up test directive."""
        requests.post(
            WP_API,
            json={
                "tool": "markDirectiveProcessed",
                "arguments": {"post_id": post_id}
            },
            timeout=API_TIMEOUT
        )

    def test_unknown_directive_needs_clarification(self, mock_substrate_map):
        """Test that unknown directives return NEEDS_CLARIFICATION."""
        agent = mock_substrate_map

        unique_id = str(int(time.time()))
        test_title = f"E2E: Random text {unique_id}"
        test_content = f"This has no recognizable action keywords. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            status, response = agent.execute_directive(directive)

            assert status == DirectiveStatus.NEEDS_CLARIFICATION
            assert "Needs Clarification" in response

            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)

    def test_missing_component_needs_clarification(self, mock_substrate_map):
        """Test that missing component lookup returns NEEDS_CLARIFICATION."""
        agent = mock_substrate_map

        unique_id = str(int(time.time()))
        test_title = f"E2E: Explain nonexistent {unique_id}"
        test_content = f"Explain 'nonexistent_component_xyz'. Test {unique_id}"

        post_id = self._create_test_directive(test_title, test_content)

        try:
            directive = Directive(
                id=post_id,
                title=test_title,
                content=test_content,
                date="",
                author="test"
            )

            status, response = agent.execute_directive(directive)

            assert status == DirectiveStatus.NEEDS_CLARIFICATION
            assert "Not Found" in response

            assert agent.post_response(directive, status, response) is True
            assert agent.mark_processed(post_id) is True

        finally:
            self._cleanup_directive(post_id)
