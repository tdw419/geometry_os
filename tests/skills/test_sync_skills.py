"""Tests for sync_skills_to_wp.py functions."""
import pytest
from pathlib import Path
import sys
from unittest.mock import MagicMock

# Mock websocket module before importing sync_skills_to_wp
sys.modules['websocket'] = MagicMock()

# Add wordpress_zone to path for import
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "wordpress_zone"))

from sync_skills_to_wp import parse_skill_file


class TestParseSkillFile:
    """Tests for the parse_skill_file function."""

    def test_valid_yaml_frontmatter(self, tmp_path):
        """Test parsing a file with valid YAML frontmatter extracts metadata and content."""
        # Create a temporary skill file with valid frontmatter
        skill_file = tmp_path / "SKILL.md"
        skill_file.write_text("""---
name: test-skill
description: A test skill for verification
category: testing
---

# Test Skill

This is the markdown content of the skill.
""")

        metadata, content = parse_skill_file(skill_file)

        assert metadata["name"] == "test-skill"
        assert metadata["description"] == "A test skill for verification"
        assert metadata["category"] == "testing"
        assert "# Test Skill" in content
        assert "This is the markdown content" in content
