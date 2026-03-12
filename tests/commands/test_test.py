import pytest
from argparse import Namespace
from geos.commands.test import run, create_parser


def test_create_parser():
    """Test test command parser creation."""
    parser = create_parser()
    assert parser is not None

    # Test parsing run subcommand
    args = parser.parse_args(["run", "tests/geos"])
    assert args.subcommand == "run"
    assert args.path == "tests/geos"


def test_run_with_json_flag():
    """Test test run with JSON output."""
    args = Namespace(
        subcommand="run",
        path=None,
        scope=None,
        json=True,
        failfast=False,
        verbose=False,
        all=False,
    )
    # This will run actual tests, so we just verify it returns int
    result = run(args)
    assert isinstance(result, int)


def test_run_with_scope():
    """Test test run with scope flag."""
    args = Namespace(
        subcommand="run",
        path=None,
        scope="evolution",
        json=False,
        failfast=False,
        verbose=False,
        all=False,
    )
    result = run(args)
    assert isinstance(result, int)