"""
Tests for CLI flag parsing in WordPress Evolution Bridge Service.

These tests verify that the argument parser correctly handles:
- --llm flag (enables LLM mode)
- --llm-model flag (specifies LLM model)
- --llm-temperature flag (specifies temperature)
- --no-backup flag (disables backups)
"""

import pytest
from systems.evolution_daemon.wordpress.bridge_service import create_cli_parser


class TestCLIFlags:
    """Test CLI argument parsing."""

    def test_cli_accepts_llm_flag(self):
        """Verify --llm flag sets args.llm to True."""
        parser = create_cli_parser()
        args = parser.parse_args(["--llm"])
        assert args.llm is True

    def test_cli_accepts_llm_config_options(self):
        """Verify --llm-model and --llm-temperature are parsed correctly."""
        parser = create_cli_parser()
        args = parser.parse_args([
            "--llm",
            "--llm-model", "glm-4",
            "--llm-temperature", "0.5"
        ])
        assert args.llm is True
        assert args.llm_model == "glm-4"
        assert args.llm_temperature == 0.5

    def test_cli_llm_defaults_to_false(self):
        """Verify llm defaults to False when not provided."""
        parser = create_cli_parser()
        args = parser.parse_args([])
        assert args.llm is False

    def test_cli_no_backup_flag(self):
        """Verify --no-backup flag sets args.no_backup to True."""
        parser = create_cli_parser()
        args = parser.parse_args(["--no-backup"])
        assert args.no_backup is True

    def test_cli_llm_model_default(self):
        """Verify llm-model defaults to glm-4-plus."""
        parser = create_cli_parser()
        args = parser.parse_args([])
        assert args.llm_model == "glm-4-plus"

    def test_cli_llm_temperature_default(self):
        """Verify llm-temperature defaults to 0.7."""
        parser = create_cli_parser()
        args = parser.parse_args([])
        assert args.llm_temperature == 0.7

    def test_cli_no_backup_defaults_to_false(self):
        """Verify no_backup defaults to False when not provided."""
        parser = create_cli_parser()
        args = parser.parse_args([])
        assert args.no_backup is False

    def test_cli_all_llm_flags_together(self):
        """Verify all LLM flags work together."""
        parser = create_cli_parser()
        args = parser.parse_args([
            "--llm",
            "--llm-model", "custom-model",
            "--llm-temperature", "0.9",
            "--no-backup"
        ])
        assert args.llm is True
        assert args.llm_model == "custom-model"
        assert args.llm_temperature == 0.9
        assert args.no_backup is True

    def test_cli_llm_temperature_accepts_boundary_values(self):
        """Verify llm-temperature accepts 0.0 and 1.0."""
        parser = create_cli_parser()

        # Test 0.0
        args_zero = parser.parse_args(["--llm-temperature", "0.0"])
        assert args_zero.llm_temperature == 0.0

        # Test 1.0
        args_one = parser.parse_args(["--llm-temperature", "1.0"])
        assert args_one.llm_temperature == 1.0
