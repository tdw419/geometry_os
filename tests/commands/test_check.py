"""Tests for the check command."""

import pytest
from argparse import Namespace
from geos.commands.check import run, create_parser


def test_create_parser():
    """Test check command parser creation."""
    parser = create_parser()
    assert parser is not None

    args = parser.parse_args(["lint"])
    assert args.subcommand == "lint"


def test_lint_command():
    """Test check lint command."""
    args = Namespace(
        subcommand="lint",
        path=None,
        fix=False,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)


def test_types_command():
    """Test check types command."""
    args = Namespace(
        subcommand="types",
        path=None,
        fix=False,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)