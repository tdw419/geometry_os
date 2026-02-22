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
    """Tests for the parse_skill_file function.

    This test class validates YAML frontmatter parsing behavior including:
    - Valid YAML extraction of name, description, category fields
    - Default category assignment when category is missing
    - Graceful handling of missing frontmatter
    - Fallback to defaults for malformed YAML

    Each test uses tmp_path fixture for isolated temporary files.
    """

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
    """Tests for validating skill files in the .gemini/skills directory.

    This test class ensures all skill files conform to the expected structure:
    - Each skill directory must contain a SKILL.md file
    - SKILL.md must have required frontmatter fields (name, description, category)
    - Category values must be valid (testing, debugging, operations, coordination, general)

    Uses skills_dir fixture for directory path lookup.
    """

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
    """Tests for validating the SKILLS.md index file in project root.

    This test class verifies:
    - SKILLS.md exists at project root level
    - All 5 known skills are documented in the index
    - Index content stays synchronized with actual skill files

    Uses project_root fixture for finding SKILLS.md location.
    """

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


class TestOrphanSkillDetection:
    """Tests for detecting orphan skills not registered in SKILLS.md.

    An orphan skill is a directory in .gemini/skills/ that has no corresponding
    entry in the SKILLS.md index file. This ensures all skills are discoverable
    and documented.
    """

    def test_no_orphan_skills(self, skills_dir, project_root):
        """Test that all skill directories have entries in SKILLS.md.

        Fails if any directory in .gemini/skills/ is not listed in SKILLS.md.
        This prevents skills from being added without proper documentation.

        Args:
            skills_dir: Path to .gemini/skills directory
            project_root: Path to project root (where SKILLS.md lives)
        """
        # Get all skill directories (directories containing SKILL.md files)
        skill_dirs = [d.name for d in skills_dir.iterdir() if d.is_dir()]

        assert len(skill_dirs) > 0, "No skill directories found"

        # Read SKILLS.md and extract skill paths from the table
        skills_md = project_root / "SKILLS.md"
        assert skills_md.exists(), "SKILLS.md not found in project root"

        content = skills_md.read_text()

        # Parse the table for skill paths in format: `.gemini/skills/<skill-name>/SKILL.md`
        import re
        registered_skills = set()
        pattern = r'\.gemini/skills/([^/]+)/SKILL\.md'
        for match in re.finditer(pattern, content):
            registered_skills.add(match.group(1))

        # Find orphan skills (directories not in SKILLS.md)
        orphan_skills = set(skill_dirs) - registered_skills

        assert len(orphan_skills) == 0, (
            f"Orphan skills detected! The following directories exist in "
            f".gemini/skills/ but are not registered in SKILLS.md:\n"
            f"{chr(10).join(f'  - {s}' for s in sorted(orphan_skills))}\n\n"
            f"Please add entries to SKILLS.md for these skills."
        )


class TestIndexMetadataSync:
    """Tests for verifying that descriptions in SKILLS.md match frontmatter in SKILL.md files.

    This test class ensures the SKILLS.md index stays synchronized with the actual
    skill file metadata. If a skill's description is updated in its SKILL.md but
    not in the root SKILLS.md, this test will fail.

    The test validates that descriptions in SKILLS.md are either:
    1. An exact match to the SKILL.md frontmatter description, or
    2. A meaningful subset/summary that captures the essence

    Uses skills_dir and project_root fixtures for path lookups.
    """

    def _parse_skills_md_table(self, content: str) -> dict:
        """Parse SKILLS.md markdown table to extract skill names and descriptions.

        Args:
            content: The full content of SKILLS.md file

        Returns:
            dict: Mapping of skill_name -> description from the table
        """
        import re

        skills = {}
        # Match table rows: | skill-name | Category | Description | Location |
        # The description is in the third column (Purpose column)
        pattern = r'^\|\s*([a-zA-Z0-9-]+)\s*\|\s*[^|]+\|\s*([^|]+)\s*\|'
        for match in re.finditer(pattern, content, re.MULTILINE):
            skill_name = match.group(1).strip()
            description = match.group(2).strip()
            # Skip header row and separator row
            if skill_name and skill_name != 'Skill' and not skill_name.startswith('-'):
                skills[skill_name] = description

        return skills

    def _descriptions_match(self, index_desc: str, skill_desc: str) -> bool:
        """Check if index description matches or is a valid subset of skill description.

        The index (SKILLS.md) description should either:
        1. Be an exact match (after normalization)
        2. Be a subset/summary that appears in the full description
        3. Contain the same key information (first sentence match)

        Args:
            index_desc: Description from SKILLS.md table
            skill_desc: Description from SKILL.md frontmatter

        Returns:
            bool: True if descriptions are considered matching
        """
        # Normalize both descriptions
        index_normalized = index_desc.strip().rstrip('.')
        skill_normalized = skill_desc.strip().rstrip('.')

        # Exact match
        if index_normalized == skill_normalized:
            return True

        # Index description is a prefix/substring of skill description
        if index_normalized in skill_normalized:
            return True

        # Check if first sentence matches (common case for summaries)
        # Split on period followed by space or end
        import re
        index_first = re.split(r'\.\s+', index_normalized)[0]
        skill_first = re.split(r'\.\s+', skill_normalized)[0]

        if index_first == skill_first:
            return True

        # Check for significant word overlap (>80% of index words in skill)
        index_words = set(index_normalized.lower().split())
        skill_words = set(skill_normalized.lower().split())

        if not index_words:
            return False

        overlap = index_words & skill_words
        overlap_ratio = len(overlap) / len(index_words)

        return overlap_ratio >= 0.8

    def test_index_metadata_sync(self, skills_dir, project_root):
        """Test that SKILLS.md descriptions match SKILL.md frontmatter descriptions.

        Fails if a skill's description in SKILL.md has been updated but the
        corresponding entry in SKILLS.md has not been updated to match.

        This ensures the index file stays synchronized with the actual skill
        definitions and provides accurate information for skill discovery.

        Args:
            skills_dir: Path to .gemini/skills directory
            project_root: Path to project root (where SKILLS.md lives)
        """
        # Read and parse SKILLS.md
        skills_md = project_root / "SKILLS.md"
        assert skills_md.exists(), "SKILLS.md not found in project root"

        skills_md_content = skills_md.read_text()
        index_skills = self._parse_skills_md_table(skills_md_content)

        assert len(index_skills) > 0, "No skills found in SKILLS.md table"

        mismatches = []
        missing_skill_files = []

        # For each skill in SKILLS.md, check its SKILL.md frontmatter
        for skill_name, index_description in index_skills.items():
            skill_dir = skills_dir / skill_name
            skill_md = skill_dir / "SKILL.md"

            if not skill_md.exists():
                missing_skill_files.append(skill_name)
                continue

            # Parse SKILL.md frontmatter
            metadata, _ = parse_skill_file(skill_md)
            skill_description = metadata.get("description", "")

            if not skill_description:
                mismatches.append(
                    f"{skill_name}: SKILL.md has empty or missing description"
                )
                continue

            # Check if descriptions match
            if not self._descriptions_match(index_description, skill_description):
                mismatches.append(
                    f"{skill_name}:\n"
                    f"  SKILLS.md: {index_description[:100]}{'...' if len(index_description) > 100 else ''}\n"
                    f"  SKILL.md:  {skill_description[:100]}{'...' if len(skill_description) > 100 else ''}"
                )

        # Report all issues
        error_messages = []

        if missing_skill_files:
            error_messages.append(
                f"SKILL.md files not found for: {', '.join(missing_skill_files)}"
            )

        if mismatches:
            error_messages.append(
                f"Description mismatches detected:\n"
                f"{chr(10).join(mismatches)}\n\n"
                f"Please update SKILLS.md to match the SKILL.md frontmatter descriptions."
            )

        assert len(error_messages) == 0, chr(10).join(error_messages)
