"""Tests for WordPress sync logic with mocking.

This module tests the sync_skills_to_wp.py functions using unittest.mock
to verify WordPress API interactions without requiring a real server.
"""
import pytest
from pathlib import Path
import sys
from unittest.mock import MagicMock, patch, call

# Mock websocket module before importing sync_skills_to_wp
sys.modules['websocket'] = MagicMock()

# Mock requests module initially
mock_requests = MagicMock()
sys.modules['requests'] = mock_requests

# Add wordpress_zone to path for import
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "wordpress_zone"))

# Import the functions to test
from sync_skills_to_wp import (
    generate_skill_html,
    build_skill_payload,
    group_skills_by_category,
    generate_index_html,
    build_index_payload,
)


class TestGenerateSkillHtml:
    """Tests for generate_skill_html function."""

    def test_generates_title_with_skill_name(self):
        """Test that generated title includes skill name."""
        title, content = generate_skill_html(
            skill_name="test-skill",
            description="A test description",
            category="testing",
            markdown_body="# Test\n\nContent here.",
            file_path="/path/to/SKILL.md"
        )
        assert title == "Skill: test-skill"

    def test_includes_category_in_html(self):
        """Test that category appears in HTML output."""
        title, content = generate_skill_html(
            skill_name="test-skill",
            description="A test description",
            category="debugging",
            markdown_body="# Test",
            file_path="/path/to/SKILL.md"
        )
        assert 'data-category="debugging"' in content
        assert "skill-category badge" in content

    def test_includes_description_in_html(self):
        """Test that description appears in HTML output."""
        title, content = generate_skill_html(
            skill_name="test-skill",
            description="This is my custom description",
            category="testing",
            markdown_body="# Test",
            file_path="/path/to/SKILL.md"
        )
        assert "This is my custom description" in content
        assert "<em>" in content

    def test_converts_markdown_to_html(self):
        """Test that markdown body is converted to HTML."""
        title, content = generate_skill_html(
            skill_name="test-skill",
            description="Description",
            category="testing",
            markdown_body="# Heading\n\n- Item 1\n- Item 2",
            file_path="/path/to/SKILL.md"
        )
        assert "<h1>Heading</h1>" in content
        assert "<ul>" in content
        assert "<li>Item 1</li>" in content

    def test_includes_source_path(self):
        """Test that source file path appears in HTML footer."""
        title, content = generate_skill_html(
            skill_name="test-skill",
            description="Description",
            category="testing",
            markdown_body="# Test",
            file_path="/custom/path/to/SKILL.md"
        )
        assert "/custom/path/to/SKILL.md" in content
        assert "<footer>" in content


class TestBuildSkillPayload:
    """Tests for build_skill_payload function."""

    def test_uses_updateArchitecture_action(self):
        """Test that payload uses correct action."""
        payload = build_skill_payload(
            skill_name="my-skill",
            file_path="/path/to/SKILL.md",
            wp_content="<div>Content</div>"
        )
        assert payload["action"] == "updateArchitecture"

    def test_includes_skill_name_in_component(self):
        """Test that skill name appears in component field."""
        payload = build_skill_payload(
            skill_name="custom-skill",
            file_path="/path/to/SKILL.md",
            wp_content="<div>Content</div>"
        )
        assert "Skill: custom-skill" == payload["component"]

    def test_includes_path(self):
        """Test that file path is included in payload."""
        payload = build_skill_payload(
            skill_name="skill",
            file_path="/special/path/SKILL.md",
            wp_content="<div>Content</div>"
        )
        assert payload["path"] == "/special/path/SKILL.md"

    def test_includes_content_as_description(self):
        """Test that HTML content is in description field."""
        payload = build_skill_payload(
            skill_name="skill",
            file_path="/path/SKILL.md",
            wp_content="<div class='test'>My Content</div>"
        )
        assert payload["description"] == "<div class='test'>My Content</div>"

    def test_status_is_publish(self):
        """Test that status is set to publish."""
        payload = build_skill_payload(
            skill_name="skill",
            file_path="/path/SKILL.md",
            wp_content="content"
        )
        assert payload["status"] == "publish"


class TestGroupSkillsByCategory:
    """Tests for group_skills_by_category function."""

    def test_groups_by_category(self, tmp_path):
        """Test that skills are grouped by their category."""
        # Create mock skill files
        skill1_dir = tmp_path / "skill1"
        skill1_dir.mkdir()
        skill1_file = skill1_dir / "SKILL.md"
        skill1_file.write_text("""---
name: skill1
description: Test skill 1
category: testing
---
# Skill 1
""")

        skill2_dir = tmp_path / "skill2"
        skill2_dir.mkdir()
        skill2_file = skill2_dir / "SKILL.md"
        skill2_file.write_text("""---
name: skill2
description: Test skill 2
category: debugging
---
# Skill 2
""")

        skills = [
            {"name": "skill1", "path": str(skill1_file)},
            {"name": "skill2", "path": str(skill2_file)},
        ]

        grouped = group_skills_by_category(skills)

        assert "testing" in grouped
        assert "debugging" in grouped
        assert len(grouped["testing"]) == 1
        assert len(grouped["debugging"]) == 1

    def test_defaults_to_general_category(self, tmp_path):
        """Test that skills without category default to general."""
        skill_dir = tmp_path / "no-category-skill"
        skill_dir.mkdir()
        skill_file = skill_dir / "SKILL.md"
        skill_file.write_text("""---
name: no-category
description: No category specified
---
# No Category
""")

        skills = [{"name": "no-category", "path": str(skill_file)}]
        grouped = group_skills_by_category(skills)

        assert "general" in grouped
        assert grouped["general"][0]["name"] == "no-category"


class TestGenerateIndexHtml:
    """Tests for generate_index_html function."""

    def test_title_is_system_skills_directory(self, tmp_path):
        """Test that index page has correct title."""
        skill_dir = tmp_path / "skill"
        skill_dir.mkdir()
        skill_file = skill_dir / "SKILL.md"
        skill_file.write_text("""---
name: test
description: Test
category: testing
---
# Test
""")

        title, content = generate_index_html([{"name": "test", "path": str(skill_file)}])
        assert title == "System Skills Directory"

    def test_includes_header_content(self, tmp_path):
        """Test that index includes header section."""
        skill_dir = tmp_path / "skill"
        skill_dir.mkdir()
        skill_file = skill_dir / "SKILL.md"
        skill_file.write_text("""---
name: test
description: Test
category: testing
---
# Test
""")

        title, content = generate_index_html([{"name": "test", "path": str(skill_file)}])
        assert "<h2>Available AI Skills</h2>" in content
        assert "Skills are procedural workflows" in content

    def test_groups_by_category_headers(self, tmp_path):
        """Test that index groups skills by category with headers."""
        # Create multiple skills in different categories
        testing_dir = tmp_path / "testing-skill"
        testing_dir.mkdir()
        testing_file = testing_dir / "SKILL.md"
        testing_file.write_text("""---
name: testing-skill
description: A testing skill
category: testing
---
# Testing
""")

        debug_dir = tmp_path / "debug-skill"
        debug_dir.mkdir()
        debug_file = debug_dir / "SKILL.md"
        debug_file.write_text("""---
name: debug-skill
description: A debugging skill
category: debugging
---
# Debug
""")

        ops_dir = tmp_path / "ops-skill"
        ops_dir.mkdir()
        ops_file = ops_dir / "SKILL.md"
        ops_file.write_text("""---
name: ops-skill
description: An operations skill
category: operations
---
# Ops
""")

        skills = [
            {"name": "testing-skill", "path": str(testing_file)},
            {"name": "debug-skill", "path": str(debug_file)},
            {"name": "ops-skill", "path": str(ops_file)},
        ]

        title, content = generate_index_html(skills)

        # Verify multiple category headers exist
        assert "<h3>Debugging</h3>" in content
        assert "<h3>Operations</h3>" in content
        assert "<h3>Testing</h3>" in content

    def test_lists_skills_under_categories(self, tmp_path):
        """Test that skills are listed under their category."""
        skill_dir = tmp_path / "my-skill"
        skill_dir.mkdir()
        skill_file = skill_dir / "SKILL.md"
        skill_file.write_text("""---
name: my-skill
description: My skill
category: verification
---
# My Skill
""")

        title, content = generate_index_html([{"name": "my-skill", "path": str(skill_file)}])

        assert "<h3>Verification</h3>" in content
        assert "my-skill" in content


class TestBuildIndexPayload:
    """Tests for build_index_payload function."""

    def test_uses_updateArchitecture_action(self):
        """Test that index payload uses correct action."""
        payload = build_index_payload("Test Title", "<div>Content</div>")
        assert payload["action"] == "updateArchitecture"

    def test_includes_title_as_component(self):
        """Test that title appears in component field."""
        payload = build_index_payload("Custom Title", "content")
        assert payload["component"] == "Custom Title"

    def test_uses_skills_path(self):
        """Test that path points to skills directory."""
        payload = build_index_payload("Title", "content")
        assert payload["path"] == ".gemini/skills/"

    def test_includes_html_as_description(self):
        """Test that HTML content is in description field."""
        payload = build_index_payload("Title", "<div class='index'>Skills List</div>")
        assert payload["description"] == "<div class='index'>Skills List</div>"

    def test_status_is_publish(self):
        """Test that status is set to publish."""
        payload = build_index_payload("Title", "content")
        assert payload["status"] == "publish"
