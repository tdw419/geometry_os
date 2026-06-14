#!/usr/bin/env python3
"""
Sisyphus CLI - Agent-native command line interface for the Sisyphus daemon.

Installation:
    pip install -e .

Usage:
    sisyphus status --json
    sisyphus tasks --state pending
    sisyphus run
    sisyphus repl
"""

from setuptools import setup, find_packages

setup(
    name="sisyphus-cli",
    version="1.0.0",
    description="Agent-native CLI for the Sisyphus evolution daemon",
    author="Geometry OS",
    packages=find_packages(),
    install_requires=[
        "click>=8.0",
    ],
    entry_points={
        "console_scripts": [
            "sisyphus=systems.sisyphus.cli.core.main:cli",
        ],
    },
    python_requires=">=3.10",
)
