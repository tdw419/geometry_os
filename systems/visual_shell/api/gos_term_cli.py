#!/usr/bin/env python3
"""
gos-term CLI - Geometry OS Web Terminal Client

A command-line tool for executing commands through the Geometry OS
Web Terminal WebSocket bridge.
"""

import argparse
import asyncio
import json
import sys
from typing import Optional, List

try:
    import websockets
except ImportError:
    print("Installing websockets...", file=sys.stderr)
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "websockets"])
    import websockets


async def run_command_async(
    command: List[str],
    port: int = 8769,
    timeout: float = 10.0,
    cols: int = 120,
    rows: int = 36
) -> str:
    """
    Execute a command via WebSocket and return output.

    Args:
        command: Command and arguments to execute
        port: WebSocket port (default: 8769)
        timeout: Command timeout in seconds
        cols: Terminal columns
        rows: Terminal rows

    Returns:
        Combined stdout/stderr output from command
    """
    uri = f"ws://localhost:{port}/terminal"
    output_lines = []
    command_str = " ".join(command) + "\n"

    try:
        async with websockets.connect(uri, ping_interval=None) as ws:
            # Send resize message
            await ws.send(json.dumps({
                "type": "resize",
                "cols": cols,
                "rows": rows
            }))

            # Send command input
            await ws.send(json.dumps({
                "type": "input",
                "data": command_str
            }))

            # Collect output with timeout
            try:
                async with asyncio.timeout(timeout):
                    async for message in ws:
                        try:
                            data = json.loads(message)
                            msg_type = data.get("type")

                            if msg_type == "output":
                                output_lines.append(data.get("data", ""))
                            elif msg_type == "exit":
                                break
                        except json.JSONDecodeError:
                            pass
            except asyncio.TimeoutError:
                # Timeout reached, return what we have
                pass

    except Exception as e:
        print(f"Error connecting to terminal bridge: {e}", file=sys.stderr)
        sys.exit(1)

    # Combine output and strip trailing whitespace/newlines
    full_output = "".join(output_lines)
    return full_output.rstrip()


def run_command(
    command: List[str],
    port: int = 8769,
    timeout: float = 10.0
) -> str:
    """
    Synchronous wrapper for run_command_async.

    Args:
        command: Command and arguments to execute
        port: WebSocket port (default: 8769)
        timeout: Command timeout in seconds

    Returns:
        Combined stdout/stderr output from command
    """
    return asyncio.run(run_command_async(command, port, timeout))


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

    if args.interactive:
        print("Interactive mode not yet implemented", file=sys.stderr)
        sys.exit(1)

    if not args.command:
        print("Error: No command specified. Use -h for help.", file=sys.stderr)
        sys.exit(1)

    # Execute command via WebSocket
    output = run_command(
        command=args.command,
        port=args.port,
        timeout=args.timeout
    )

    # Print output to stdout
    print(output)


if __name__ == '__main__':
    main()
