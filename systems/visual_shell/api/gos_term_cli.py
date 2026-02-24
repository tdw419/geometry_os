#!/usr/bin/env python3
"""
gos-term CLI - Geometry OS Web Terminal Client

A command-line tool for executing commands through the Geometry OS
Web Terminal WebSocket bridge.
"""

import argparse
import sys


def parse_args():
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        prog='gos-term',
        description='Geometry OS Web Terminal Client - Execute commands via WebSocket bridge'
    )

    parser.add_argument(
        'command',
        nargs='*',
        help='Command to execute (e.g., echo hello)'
    )

    parser.add_argument(
        '-i', '--interactive',
        action='store_true',
        help='Start interactive terminal session'
    )

    parser.add_argument(
        '-p', '--port',
        type=int,
        default=8769,
        help='WebSocket port (default: 8769)'
    )

    parser.add_argument(
        '--neb',
        action='store_true',
        help='Publish commands to NEB event bus'
    )

    parser.add_argument(
        '--timeout',
        type=float,
        default=10.0,
        help='Command timeout in seconds (default: 10.0)'
    )

    return parser.parse_args()


def main():
    """Main entry point."""
    args = parse_args()

    # Stub: print args for verification
    print(f"Command: {args.command}")
    print(f"Interactive: {args.interactive}")
    print(f"Port: {args.port}")
    print(f"NEB: {args.neb}")
    print(f"Timeout: {args.timeout}")


if __name__ == '__main__':
    main()
