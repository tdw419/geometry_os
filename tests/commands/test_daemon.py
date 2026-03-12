import pytest
from argparse import Namespace
from geos.commands.daemon import run, create_parser


def test_create_parser():
    """Test daemon command parser creation."""
    parser = create_parser()
    assert parser is not None

    args = parser.parse_args(["status"])
    assert args.subcommand == "status"


def test_status_command():
    """Test daemon status command."""
    args = Namespace(
        subcommand="status",
        name=None,
        all=True,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)


def test_status_json():
    """Test daemon status with JSON output."""
    args = Namespace(
        subcommand="status",
        name=None,
        all=True,
        json=True,
    )
    result = run(args)
    assert isinstance(result, int)