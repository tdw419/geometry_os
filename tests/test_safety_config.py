# tests/test_safety_config.py
"""
Unit tests for SafetyConfig and ContentBackup.

Tests cover:
- Default safety configuration values
- Backup save/load cycle
- Proposal safety validation
- Backup filename format
"""
import pytest
import sys
import os
import tempfile
import shutil
import time
from pathlib import Path
from unittest.mock import patch, MagicMock

# Ensure the project root is in the path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from systems.evolution_daemon.wordpress.safety_config import (
    SafetyConfig,
    ContentBackup,
    validate_proposal_safety,
    create_default_safety_config
)


class TestSafetyConfigDefaults:
    """Tests for SafetyConfig default values."""

    def test_safety_config_defaults_are_conservative(self):
        """SafetyConfig defaults should be conservative (safe)."""
        config = SafetyConfig()

        # Default should require backup (conservative)
        assert config.require_backup is True

        # Default minimum confidence should be 0.7
        assert config.min_confidence == 0.7

        # Default backup directory
        assert config.backup_dir == "/tmp/wp_evolution_backups"

        # Default rate limit
        assert config.max_modifications_per_hour == 10

    def test_safety_config_accepts_custom_values(self):
        """SafetyConfig should accept custom values."""
        config = SafetyConfig(
            require_backup=False,
            min_confidence=0.5,
            backup_dir="/custom/backup/path",
            max_modifications_per_hour=20
        )

        assert config.require_backup is False
        assert config.min_confidence == 0.5
        assert config.backup_dir == "/custom/backup/path"
        assert config.max_modifications_per_hour == 20

    def test_safety_config_validates_min_confidence_range(self):
        """SafetyConfig should reject invalid min_confidence values."""
        # Below range
        with pytest.raises(ValueError, match="min_confidence"):
            SafetyConfig(min_confidence=-0.1)

        # Above range
        with pytest.raises(ValueError, match="min_confidence"):
            SafetyConfig(min_confidence=1.5)

    def test_safety_config_validates_max_modifications(self):
        """SafetyConfig should reject invalid max_modifications_per_hour."""
        with pytest.raises(ValueError, match="max_modifications_per_hour"):
            SafetyConfig(max_modifications_per_hour=0)

        with pytest.raises(ValueError, match="max_modifications_per_hour"):
            SafetyConfig(max_modifications_per_hour=-5)

    def test_create_default_safety_config(self):
        """create_default_safety_config should create config with defaults."""
        config = create_default_safety_config()

        assert config.require_backup is True
        assert config.min_confidence == 0.7

        # Can override require_backup
        config_no_backup = create_default_safety_config(require_backup=False)
        assert config_no_backup.require_backup is False


class TestBackupSaveLoad:
    """Tests for ContentBackup save/load cycle."""

    @pytest.fixture
    def temp_backup_dir(self):
        """Create a temporary directory for backup tests."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir, ignore_errors=True)

    def test_backup_saves_original_content(self, temp_backup_dir):
        """ContentBackup.save() should save content that can be loaded."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        post_id = 123
        original_content = "This is the original WordPress post content."

        # Save backup
        filepath = backup.save(post_id=post_id, content=original_content)

        # Verify file was created
        assert filepath.exists()
        assert filepath.is_file()

        # Load backup
        loaded = backup.load(post_id=post_id)

        assert loaded is not None
        assert loaded["post_id"] == post_id
        assert loaded["content"] == original_content
        assert loaded["restored"] is False
        assert "timestamp" in loaded

    def test_backup_save_with_metadata(self, temp_backup_dir):
        """ContentBackup.save() should store optional metadata."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        metadata = {
            "author": "test_user",
            "version": "1.0",
            "notes": "Before LLM expansion"
        }

        filepath = backup.save(
            post_id=456,
            content="Test content",
            metadata=metadata
        )

        loaded = backup.load(post_id=456)

        assert loaded is not None
        assert loaded["metadata"]["author"] == "test_user"
        assert loaded["metadata"]["version"] == "1.0"
        assert loaded["metadata"]["notes"] == "Before LLM expansion"

    def test_backup_returns_most_recent(self, temp_backup_dir):
        """ContentBackup.load() should return most recent backup."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        post_id = 789

        # Save first backup
        backup.save(post_id=post_id, content="First version")
        time.sleep(1)  # int(time.time()) is second-resolution

        # Save second backup
        backup.save(post_id=post_id, content="Second version")
        time.sleep(1)

        # Save third backup (most recent)
        backup.save(post_id=post_id, content="Third version")

        # Load should return most recent
        loaded = backup.load(post_id=post_id)

        assert loaded is not None
        assert loaded["content"] == "Third version"

    def test_backup_load_nonexistent_post(self, temp_backup_dir):
        """ContentBackup.load() should return None for nonexistent post."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        result = backup.load(post_id=999999)

        assert result is None

    def test_mark_restored_updates_backup(self, temp_backup_dir):
        """ContentBackup.mark_restored() should update restored flag."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        post_id = 111
        backup.save(post_id=post_id, content="Content to restore")

        # Get the timestamp from the loaded backup
        loaded = backup.load(post_id=post_id)
        assert loaded is not None
        timestamp = loaded["timestamp"]

        # Mark as restored
        success = backup.mark_restored(post_id=post_id, timestamp=timestamp)

        assert success is True

        # Verify restored flag
        loaded_again = backup.load(post_id=post_id)
        assert loaded_again["restored"] is True

    def test_mark_restored_nonexistent_backup(self, temp_backup_dir):
        """ContentBackup.mark_restored() should return False for nonexistent."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        success = backup.mark_restored(post_id=999, timestamp=1234567890)

        assert success is False


class TestBackupFilenameFormat:
    """Tests for backup filename format."""

    @pytest.fixture
    def temp_backup_dir(self):
        """Create a temporary directory for backup tests."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir, ignore_errors=True)

    def test_backup_filename_format(self, temp_backup_dir):
        """Backup filename should follow format: post_{id}_{timestamp}.json"""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        post_id = 42
        filepath = backup.save(post_id=post_id, content="Test content")

        filename = filepath.name

        # Should start with post_
        assert filename.startswith("post_")

        # Should contain post_id
        assert f"_{post_id}_" in filename

        # Should end with .json
        assert filename.endswith(".json")

        # Extract timestamp and verify it's numeric
        parts = filename.replace("post_", "").replace(".json", "").split("_")
        assert len(parts) == 2
        assert parts[0] == str(post_id)
        assert parts[1].isdigit()  # timestamp should be numeric

    def test_backup_creates_directory_if_not_exists(self):
        """ContentBackup should create backup directory if it doesn't exist."""
        temp_base = tempfile.mkdtemp()
        backup_dir = os.path.join(temp_base, "nested", "backup", "dir")

        try:
            # Directory doesn't exist yet
            assert not os.path.exists(backup_dir)

            config = SafetyConfig(backup_dir=backup_dir)
            backup = ContentBackup(config)

            # Directory should now exist
            assert os.path.exists(backup_dir)

            # Should be able to save
            filepath = backup.save(post_id=1, content="Test")
            assert filepath.exists()
        finally:
            shutil.rmtree(temp_base, ignore_errors=True)


class TestProposalSafetyValidation:
    """Tests for validate_proposal_safety function."""

    def test_validate_proposal_safety_accepts_valid_proposal(self):
        """Valid proposals should pass safety validation."""
        proposal = {
            "confidence": 0.8,
            "content": "This is a valid proposal with enough content to pass validation."
        }

        is_safe, reason = validate_proposal_safety(proposal)

        assert is_safe is True
        assert "passes" in reason.lower()

    def test_validate_proposal_safety_rejects_low_confidence(self):
        """Proposals with confidence below threshold should be rejected."""
        config = SafetyConfig(min_confidence=0.7)
        proposal = {
            "confidence": 0.5,  # Below 0.7 threshold
            "content": "This is a proposal with enough content but low confidence."
        }

        is_safe, reason = validate_proposal_safety(proposal, config)

        assert is_safe is False
        assert "confidence" in reason.lower()
        assert "0.50" in reason or "0.5" in reason

    def test_validate_proposal_safety_accepts_at_threshold(self):
        """Proposals at exactly the confidence threshold should pass."""
        config = SafetyConfig(min_confidence=0.7)
        proposal = {
            "confidence": 0.7,  # Exactly at threshold
            "content": "This proposal has exactly the minimum required confidence."
        }

        is_safe, reason = validate_proposal_safety(proposal, config)

        assert is_safe is True

    def test_validate_proposal_safety_rejects_short_content(self):
        """Proposals with very short content should be rejected."""
        proposal = {
            "confidence": 0.9,
            "content": "Too short"  # Only 9 chars
        }

        is_safe, reason = validate_proposal_safety(proposal)

        assert is_safe is False
        assert "short" in reason.lower()

    def test_validate_proposal_safety_rejects_empty_content(self):
        """Proposals with empty content should be rejected."""
        proposal = {
            "confidence": 0.9,
            "content": ""
        }

        is_safe, reason = validate_proposal_safety(proposal)

        assert is_safe is False
        assert "short" in reason.lower()

    def test_validate_proposal_safety_rejects_whitespace_only(self):
        """Proposals with only whitespace should be rejected."""
        proposal = {
            "confidence": 0.9,
            "content": "     \n\t   "  # Only whitespace
        }

        is_safe, reason = validate_proposal_safety(proposal)

        assert is_safe is False
        assert "short" in reason.lower()

    def test_validate_proposal_safety_rejects_excessive_content(self):
        """Proposals with content over 100KB should be rejected."""
        config = SafetyConfig()
        proposal = {
            "confidence": 0.9,
            "content": "x" * (101 * 1024)  # 101KB
        }

        is_safe, reason = validate_proposal_safety(proposal, config)

        assert is_safe is False
        assert "long" in reason.lower()

    def test_validate_proposal_safety_uses_default_config(self):
        """validate_proposal_safety should use default config if none provided."""
        # Confidence 0.65 should fail with default 0.7 threshold
        proposal = {
            "confidence": 0.65,
            "content": "This is a decent proposal with enough content."
        }

        is_safe, reason = validate_proposal_safety(proposal)  # No config

        assert is_safe is False

    def test_validate_proposal_safety_missing_confidence_defaults_to_zero(self):
        """Proposals without confidence should default to 0.0 and be rejected."""
        proposal = {
            "content": "This is a proposal without confidence field."
        }

        is_safe, reason = validate_proposal_safety(proposal)

        assert is_safe is False
        assert "confidence" in reason.lower()


class TestBackupEdgeCases:
    """Tests for edge cases in ContentBackup."""

    @pytest.fixture
    def temp_backup_dir(self):
        """Create a temporary directory for backup tests."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir, ignore_errors=True)

    def test_backup_empty_content(self, temp_backup_dir):
        """ContentBackup should handle empty content."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        filepath = backup.save(post_id=1, content="")
        loaded = backup.load(post_id=1)

        assert loaded is not None
        assert loaded["content"] == ""

    def test_backup_unicode_content(self, temp_backup_dir):
        """ContentBackup should handle unicode content."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        unicode_content = "Unicode: emoji, accents, symbols."

        filepath = backup.save(post_id=1, content=unicode_content)
        loaded = backup.load(post_id=1)

        assert loaded is not None
        assert loaded["content"] == unicode_content

    def test_backup_large_content(self, temp_backup_dir):
        """ContentBackup should handle large content."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        # 50KB of content
        large_content = "x" * (50 * 1024)

        filepath = backup.save(post_id=1, content=large_content)
        loaded = backup.load(post_id=1)

        assert loaded is not None
        assert loaded["content"] == large_content

    def test_list_backups_filters_by_post(self, temp_backup_dir):
        """ContentBackup.list_backups should filter by post_id."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        # Create backups for multiple posts (need 1s delay for timestamp resolution)
        backup.save(post_id=1, content="Post 1 content")
        time.sleep(1)  # int(time.time()) is second-resolution
        backup.save(post_id=2, content="Post 2 content")
        time.sleep(1)
        backup.save(post_id=1, content="Post 1 update")

        # List backups for post 1
        post1_backups = backup.list_backups(post_id=1)

        assert len(post1_backups) == 2, f"Expected 2 backups for post 1, got {len(post1_backups)}"
        for b in post1_backups:
            assert b["post_id"] == 1

        # List all backups
        all_backups = backup.list_backups()

        assert len(all_backups) == 3, f"Expected 3 total backups, got {len(all_backups)}"

    def test_load_with_restored_filter(self, temp_backup_dir):
        """ContentBackup.load should filter by restored flag."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        post_id = 1
        backup.save(post_id=post_id, content="First")
        time.sleep(1)  # int(time.time()) is second-resolution
        backup.save(post_id=post_id, content="Second")

        # Mark most recent (Second) as restored
        loaded = backup.load(post_id=post_id)
        backup.mark_restored(post_id=post_id, timestamp=loaded["timestamp"])

        # Load only non-restored - should return First
        non_restored = backup.load(post_id=post_id, restored=False)

        assert non_restored is not None, "Expected to find non-restored backup 'First'"
        assert non_restored["content"] == "First"
        assert non_restored["restored"] is False

        # Load only restored - should return Second
        restored = backup.load(post_id=post_id, restored=True)

        assert restored is not None, "Expected to find restored backup 'Second'"
        assert restored["content"] == "Second"
        assert restored["restored"] is True

    def test_cleanup_old_backups(self, temp_backup_dir):
        """ContentBackup.cleanup_old_backups should remove old backups."""
        config = SafetyConfig(backup_dir=temp_backup_dir)
        backup = ContentBackup(config)

        # Create a backup file with an old timestamp manually
        import json
        old_timestamp = int(time.time()) - (2 * 3600)  # 2 hours ago
        old_backup_data = {
            "post_id": 1,
            "content": "Old content",
            "timestamp": old_timestamp,
            "restored": False,
            "metadata": {}
        }
        old_filepath = Path(temp_backup_dir) / f"post_1_{old_timestamp}.json"
        with open(old_filepath, 'w') as f:
            json.dump(old_backup_data, f)

        # Create a recent backup via save()
        backup.save(post_id=2, content="Recent")

        # Cleanup with 1 hour should remove only old backup
        removed = backup.cleanup_old_backups(max_age_hours=1)

        assert removed == 1, f"Expected 1 backup removed, got {removed}"
        # Old backup should be gone
        assert not old_filepath.exists()
        # Recent backup should still exist
        assert backup.load(post_id=2) is not None
