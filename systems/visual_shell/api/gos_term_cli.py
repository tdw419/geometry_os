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
import os
import signal
import select
import threading
from typing import Optional, List

# termios for raw terminal mode (Unix only)
try:
    import termios
    import tty
    HAS_TERMIOS = True
except ImportError:
    HAS_TERMIOS = False

try:
    import websockets
    from websockets.exceptions import ConnectionClosed
except ImportError:
    print(
        "Error: 'websockets' package is required.\n"
        "Install it with: pip install websockets\n"
        "Or run: python -m pip install websockets",
        file=sys.stderr
    )
    sys.exit(1)

# NEBBus is optional - may not be available in all environments
try:
    from systems.swarm.neb_bus import NEBBus
    HAS_NEB = True
except ImportError:
    HAS_NEB = False
    NEBBus = None

# Global NEB bus instance (lazy initialized)
_neb_bus = None


def _get_neb_bus():
    """Get or create the global NEB bus instance."""
    global _neb_bus
    if _neb_bus is None and HAS_NEB:
        _neb_bus = NEBBus(node_id="gos-term-cli")
    return _neb_bus


def _publish_to_neb(topic: str, payload: dict):
    """
    Publish an event to the NEB bus.

    Args:
        topic: Event topic (e.g., "gos.term.command")
        payload: Event payload data

    Note:
        Silently succeeds if NEBBus is not available.
    """
    if not HAS_NEB:
        return
    try:
        bus = _get_neb_bus()
        if bus:
            bus.publish(topic, payload)
    except Exception:
        # NEB publishing is best-effort, don't fail command execution
        pass


async def run_command_async(
    command: List[str],
    port: int = 8769,
    timeout: float = 10.0,
    cols: int = 120,
    rows: int = 36,
    neb: bool = False
) -> str:
    """
    Execute a command via WebSocket and return output.

    Args:
        command: Command and arguments to execute
        port: WebSocket port (default: 8769)
        timeout: Command timeout in seconds
        cols: Terminal columns
        rows: Terminal rows
        neb: Publish command to NEB event bus

    Returns:
        Combined stdout/stderr output from command
    """
    uri = f"ws://localhost:{port}/terminal"
    output_lines = []
    command_str = " ".join(command) + "\n"

    # Publish to NEB if requested
    if neb:
        _publish_to_neb("gos.term.command", {
            "command": command,
            "command_str": command_str.strip(),
            "port": port,
            "timeout": timeout
        })

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
                # Combine what output we have so far
                partial_output = "".join(output_lines)
                print(
                    f"Error: Command timed out after {timeout} seconds.\n"
                    "Try increasing the timeout with --timeout option.",
                    file=sys.stderr
                )
                return partial_output.rstrip()

    except ConnectionRefusedError:
        print(
            f"Error: Cannot connect to terminal bridge on port {port}.\n"
            "Make sure the terminal bridge is running:\n"
            f"  python3 systems/visual_shell/api/terminal_websocket_bridge.py --port {port}",
            file=sys.stderr
        )
        raise SystemExit(1)
    except Exception as e:
        print(f"Error connecting to terminal bridge: {e}", file=sys.stderr)
        raise SystemExit(1)

    # Combine output and strip trailing whitespace/newlines
    full_output = "".join(output_lines)
    return full_output.rstrip()


def run_command(
    command: List[str],
    port: int = 8769,
    timeout: float = 10.0,
    neb: bool = False
) -> str:
    """
    Synchronous wrapper for run_command_async.

    Args:
        command: Command and arguments to execute
        port: WebSocket port (default: 8769)
        timeout: Command timeout in seconds
        neb: Publish command to NEB event bus

    Returns:
        Combined stdout/stderr output from command
    """
    return asyncio.run(run_command_async(command, port, timeout, neb=neb))


async def interactive_session_async(port: int = 8769, cols: int = 120, rows: int = 36) -> int:
    """
    Start an interactive terminal session via WebSocket.

    Args:
        port: WebSocket port (default: 8769)
        cols: Terminal columns
        rows: Terminal rows

    Returns:
        Exit code (0 for normal exit, 1 for error)
    """
    uri = f"ws://localhost:{port}/terminal"
    original_term = None
    exit_code = 0

    # Save original terminal settings (Unix only)
    if HAS_TERMIOS and sys.stdin.isatty():
        original_term = termios.tcgetattr(sys.stdin.fileno())
        tty.setraw(sys.stdin.fileno())

    # Queue for stdin data (thread-safe)
    stdin_queue = asyncio.Queue()
    stop_reader = threading.Event()

    def stdin_reader_thread():
        """Read from stdin in a thread and put data in queue."""
        stdin_fd = sys.stdin.fileno()
        while not stop_reader.is_set():
            try:
                # Use select to check if data is available (with timeout)
                ready, _, _ = select.select([stdin_fd], [], [], 0.1)
                if ready:
                    data = os.read(stdin_fd, 1024)
                    if not data:
                        # EOF
                        break
                    # Schedule queue put in event loop
                    try:
                        loop.call_soon_threadsafe(stdin_queue.put_nowait, data)
                    except Exception:
                        break
            except (OSError, ValueError):
                # stdin closed or invalid
                break
            except Exception:
                break

    try:
        loop = asyncio.get_event_loop()
        reader_thread = threading.Thread(target=stdin_reader_thread, daemon=True)
        reader_thread.start()

        async with websockets.connect(uri, ping_interval=None) as ws:
            # Send resize message
            await ws.send(json.dumps({
                "type": "resize",
                "cols": cols,
                "rows": rows
            }))

            # Flag to signal shutdown
            shutdown = asyncio.Event()
            eof_seen = asyncio.Event()

            async def stdin_to_ws():
                """Read from queue and send to WebSocket."""
                while not shutdown.is_set():
                    try:
                        # Get data with timeout to check shutdown
                        try:
                            data = await asyncio.wait_for(stdin_queue.get(), timeout=0.1)
                            await ws.send(json.dumps({
                                "type": "input",
                                "data": data.decode('utf-8', errors='replace')
                            }))
                        except asyncio.TimeoutError:
                            # Check if reader thread is dead (EOF)
                            if not reader_thread.is_alive() and stdin_queue.empty():
                                eof_seen.set()
                                shutdown.set()
                                break
                            continue
                    except asyncio.CancelledError:
                        break
                    except Exception:
                        break

            async def ws_to_stdout():
                """Read from WebSocket and write to stdout."""
                while not shutdown.is_set():
                    try:
                        message = await asyncio.wait_for(ws.recv(), timeout=0.1)
                        data = json.loads(message)
                        msg_type = data.get("type")

                        if msg_type == "output":
                            sys.stdout.write(data.get("data", ""))
                            sys.stdout.flush()
                        elif msg_type == "exit":
                            shutdown.set()
                            break
                    except asyncio.TimeoutError:
                        continue
                    except asyncio.CancelledError:
                        break
                    except websockets.ConnectionClosed:
                        shutdown.set()
                        break
                    except Exception:
                        break

            # Run both tasks concurrently
            stdin_task = asyncio.create_task(stdin_to_ws())
            stdout_task = asyncio.create_task(ws_to_stdout())

            # Wait for shutdown signal
            await shutdown.wait()

            # Signal thread to stop
            stop_reader.set()

            # Cancel and cleanup tasks
            stdin_task.cancel()
            stdout_task.cancel()
            try:
                await stdin_task
            except asyncio.CancelledError:
                pass
            try:
                await stdout_task
            except asyncio.CancelledError:
                pass

    except ConnectionRefusedError:
        print(
            f"\r\nError: Cannot connect to terminal bridge on port {port}.\n"
            "Make sure the terminal bridge is running:\n"
            f"  python3 systems/visual_shell/api/terminal_websocket_bridge.py --port {port}",
            file=sys.stderr
        )
        exit_code = 1
    except asyncio.TimeoutError:
        print(
            f"\r\nError: Connection timed out.\n"
            "The terminal bridge may be overloaded or unreachable.",
            file=sys.stderr
        )
        exit_code = 1
    except Exception as e:
        print(f"\r\nError: {e}", file=sys.stderr)
        exit_code = 1
    finally:
        # Signal thread to stop
        stop_reader.set()
        # Restore original terminal settings
        if original_term:
            termios.tcsetattr(sys.stdin.fileno(), termios.TCSADRAIN, original_term)

    return exit_code


def interactive_session(port: int = 8769) -> int:
    """
    Synchronous wrapper for interactive_session_async.

    Args:
        port: WebSocket port (default: 8769)

    Returns:
        Exit code
    """
    # Get terminal size
    try:
        cols, rows = os.get_terminal_size()
    except OSError:
        cols, rows = 120, 36

    return asyncio.run(interactive_session_async(port, cols, rows))


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
        exit_code = interactive_session(port=args.port)
        sys.exit(exit_code)

    if not args.command:
        print("Error: No command specified. Use -h for help.", file=sys.stderr)
        sys.exit(1)

    # Execute command via WebSocket
    output = run_command(
        command=args.command,
        port=args.port,
        timeout=args.timeout,
        neb=args.neb
    )

    # Print output to stdout
    print(output)


if __name__ == '__main__':
    main()
