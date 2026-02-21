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


class TestSkillFiles:
    """Tests for validating skill files in the skills directory."""

    def test_all_skills_have_skill_md(self, skills_dir):
        """Test that all skill directories contain a SKILL.md file."""
        skill_dirs = [d for d in skills_dir.iterdir() if d.is_dir()]

        assert len(skill_dirs) > 0, "No skill directories found"

        for skill_dir in skill_dirs:
            skill_md = skill_dir / "SKILL.md"
            assert skill_md.exists(), f"Missing SKILL.md in {skill_dir.name}"
            assert skill_md.is_file(), f"SKILL.md in {skill_dir.name} is not a file"

    def test_all_skills_have_required_fields(self, skills_dir):
        """Test that all skill files have required frontmatter fields (name, description, category)."""
        skill_dirs = [d for d in skills_dir.iterdir() if d.is_dir()]

        for skill_dir in skill_dirs:
            skill_md = skill_dir / "SKILL.md"
            metadata, _ = parse_skill_file(skill_md)

            assert "name" in metadata, f"Missing 'name' field in {skill_dir.name}/SKILL.md"
            assert "description" in metadata, f"Missing 'description' field in {skill_dir.name}/SKILL.md"
            assert "category" in metadata, f"Missing 'category' field in {skill_dir.name}/SKILL.md"

            assert metadata["name"], f"'name' field is empty in {skill_dir.name}/SKILL.md"
            assert metadata["description"], f"'description' field is empty in {skill_dir.name}/SKILL.md"
            assert metadata["category"], f"'category' field is empty in {skill_dir.name}/SKILL.md"

    def test_all_categories_valid(self, skills_dir, valid_categories):
        """Test that all skill categories are valid."""
        skill_dirs = [d for d in skills_dir.iterdir() if d.is_dir()]

        for skill_dir in skill_dirs:
            skill_md = skill_dir / "SKILL.md"
            metadata, _ = parse_skill_file(skill_md)

            category = metadata.get("category", "")
            assert category in valid_categories, (
                f"Invalid category '{category}' in {skill_dir.name}/SKILL.md. "
                f"Valid categories: {valid_categories}"
            )


class TestSkillsIndex:
    """Tests for validating the SKILLS.md index file in project root."""

    def test_skills_md_exists(self, project_root):
        """Test that SKILLS.md exists in the project root."""
        skills_md = project_root / "SKILLS.md"
        assert skills_md.exists(), "SKILLS.md not found in project root"
        assert skills_md.is_file(), "SKILLS.md is not a file"

    def test_all_skills_in_index(self, project_root):
        """Test that all 5 skills appear in SKILLS.md content."""
        skills_md = project_root / "SKILLS.md"
        content = skills_md.read_text()

        expected_skills = [
            "golden-path-boot-test",
            "parallel-swarm-production",
            "evolution-daemon-control",
            "visual-shell-debug",
            "infinite-map-testing",
        ]

        for skill_name in expected_skills:
            assert skill_name in content, f"Skill '{skill_name}' not found in SKILLS.md index"
