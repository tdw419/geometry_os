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

    def test_missing_category_defaults_general(self, tmp_path):
        """Test that missing category field defaults to 'general'."""
        skill_file = tmp_path / "SKILL.md"
        skill_file.write_text("""---
name: no-category-skill
description: A skill without category
---

# No Category Skill

Content here.
""")

        metadata, content = parse_skill_file(skill_file)

        assert metadata["name"] == "no-category-skill"
        assert metadata["description"] == "A skill without category"
        assert metadata["category"] == "general"
        assert "# No Category Skill" in content

    def test_no_frontmatter_returns_content(self, tmp_path):
        """Test that file without frontmatter returns default metadata and content."""
        skill_file = tmp_path / "SKILL.md"
        skill_file.write_text("""# Plain Skill

This is just markdown with no YAML frontmatter.

- Item 1
- Item 2
""")

        metadata, content = parse_skill_file(skill_file)

        assert metadata == {"category": "general"}
        assert "# Plain Skill" in content
        assert "This is just markdown" in content
        assert "- Item 1" in content

    def test_malformed_yaml_returns_defaults(self, tmp_path):
        """Test that malformed YAML frontmatter falls back to defaults."""
        skill_file = tmp_path / "SKILL.md"
        skill_file.write_text("""---
name: broken
description: [unclosed list
category: testing
---

# Broken YAML

Should fall back gracefully.
""")

        metadata, content = parse_skill_file(skill_file)

        # Malformed YAML should fall back to default behavior
        assert metadata == {"category": "general"}
        assert "---" in content  # Original content preserved
