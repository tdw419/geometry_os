#!/usr/bin/env python3
"""
ASCII GUI Validation Test Runner

Runs all validation tests and reports results.
Usage:
    python tests/validation/run_ascii_gui_tests.py
    python tests/validation/run_ascii_gui_tests.py --lm-studio
    python tests/validation/run_ascii_gui_tests.py --webmcp
    python tests/validation/run_ascii_gui_tests.py --all
"""

import subprocess
import sys
import argparse
import requests


def check_lm_studio():
    """Check if LM Studio is available."""
    try:
        response = requests.get("http://localhost:1234/v1/models", timeout=2)
        return response.status_code == 200
    except:
        return False


def check_webmcp():
    """Check if WebMCP bridge is available."""
    try:
        response = requests.get("http://localhost:8769/health", timeout=2)
        return response.status_code == 200
    except:
        return False


def run_tests(test_pattern, description):
    """Run tests matching the pattern."""
    print(f"\n{'='*60}")
    print(f"Running: {description}")
    print(f"{'='*60}\n")

    result = subprocess.run(
        ["python3", "-m", "pytest", f"tests/validation/ascii_gui/{test_pattern}", "-v", "--tb=short"],
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    return result.returncode


def main():
    parser = argparse.ArgumentParser(description="Run ASCII GUI validation tests")
    parser.add_argument("--lm-studio", action="store_true", help="Run LM Studio tests only")
    parser.add_argument("--webmcp", action="store_true", help="Run WebMCP tests only")
    parser.add_argument("--e2e", action="store_true", help="Run E2E tests only")
    parser.add_argument("--all", action="store_true", help="Run all tests")
    parser.add_argument("--check", action="store_true", help="Check service availability")

    args = parser.parse_args()

    if args.check:
        print("Checking service availability...")
        lm = check_lm_studio()
        wm = check_webmcp()
        print(f"  LM Studio: {'Available' if lm else 'Not available'}")
        print(f"  WebMCP:    {'Available' if wm else 'Not available'}")
        return 0

    # Check availability
    lm_available = check_lm_studio()
    webmcp_available = check_webmcp()

    print("ASCII GUI Validation Tests")
    print("=" * 60)
    print(f"LM Studio: {'Y' if lm_available else 'N'}")
    print(f"WebMCP:    {'Y' if webmcp_available else 'N'}")

    exit_code = 0

    if args.all or (not args.lm_studio and not args.webmcp and not args.e2e):
        # Run all tests
        if lm_available:
            exit_code |= run_tests("test_lm_studio_*.py", "LM Studio Tests")
        else:
            print("\n Skipping LM Studio tests (service not available)")

        if webmcp_available:
            exit_code |= run_tests("test_webmcp_*.py", "WebMCP Integration Tests")
        else:
            print("\n Skipping WebMCP tests (service not available)")

        if lm_available:
            exit_code |= run_tests("test_e2e_*.py", "End-to-End Loop Tests")
    else:
        if args.lm_studio and lm_available:
            exit_code |= run_tests("test_lm_studio_*.py", "LM Studio Tests")
        elif args.lm_studio:
            print(" LM Studio not available")

        if args.webmcp and webmcp_available:
            exit_code |= run_tests("test_webmcp_*.py", "WebMCP Integration Tests")
        elif args.webmcp:
            print(" WebMCP not available")

        if args.e2e and lm_available:
            exit_code |= run_tests("test_e2e_*.py", "End-to-End Loop Tests")
        elif args.e2e:
            print(" LM Studio not available for E2E tests")

    print("\n" + "=" * 60)
    if exit_code == 0:
        print("All tests passed!")
    else:
        print("Some tests failed")
    print("=" * 60)

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
