"""Tests for geos repl command."""

import pytest
from argparse import Namespace
from geos.commands.repl import create_parser


def test_create_parser():
    """Test repl command parser creation."""
    parser = create_parser()
    assert parser is not None


def test_repl_banner(capsys):
    """Test REPL banner output."""
    from geos.commands.repl import print_banner
    print_banner()
    captured = capsys.readouterr()
    assert "GEOS DevOps CLI" in captured.out