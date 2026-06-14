#!/usr/bin/env python3
"""
xv6_exec.py — xv6-on-GeOS command execution daemon

Wraps the pre-built `geos_native_boot` binary in a PTY, detects the xv6
shell prompt, and exposes a clean JSON-line protocol for sending commands
and receiving their output.

PRE-REQUISITE: build the binary once before using this daemon:
    cargo build --bin geos_native_boot

PROTOCOL (stdin → stdout, one JSON object per line):

  Input  (one per command):
    {"cmd": "ls"}
    {"cmd": "echo hello"}
    {"cmd": "__boot_wait__"}   # special: just wait for initial $ prompt
    {"cmd": "__shutdown__"}    # special: graceful exit

  Output (one per command):
    {"ok": true,  "cmd": "ls", "output": "...", "elapsed_ms": 88}
    {"ok": false, "cmd": "ls", "error": "timeout", "elapsed_ms": 30000}

USAGE:
    # Start daemon, pipe commands:
    echo '{"cmd": "ls"}' | python3 xv6_exec.py

    # Use from Python:
    import subprocess, json
    d = subprocess.Popen(["python3", "xv6_exec.py"],
                         stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    boot = json.loads(d.stdout.readline())   # wait for boot
    d.stdin.write(b'{"cmd": "ls"}\\n'); d.stdin.flush()
    result = json.loads(d.stdout.readline())
    print(result["output"])
"""

import json
import os
import pty
import re
import select
import signal
import sys
import termios
import time
from pathlib import Path

# ── Configuration ─────────────────────────────────────────────────────────────

WORKSPACE = Path(__file__).parent

# Use the pre-built debug binary directly — avoids cargo compile time
BOOT_BIN = WORKSPACE / "target" / "debug" / "geos_native_boot"

# Fallback: use cargo if binary not found
BOOT_CMD = [str(BOOT_BIN)] if BOOT_BIN.exists() else [
    "cargo", "run", "--bin", "geos_native_boot", "--quiet"
]

# xv6 sh.c prints "$ " (dollar-space) as its prompt
PROMPT_BYTES = b"$ "

# Timeouts
BOOT_TIMEOUT  = 120   # seconds — 120s to be safe on first run
CMD_TIMEOUT   = 30    # seconds per command

# ── PTY helpers ────────────────────────────────────────────────────────────────

def read_until(master_fd: int, marker: bytes, timeout: float) -> tuple[bytes, bool]:
    """
    Accumulate bytes from master_fd until `marker` appears at the end of
    the buffer, or until `timeout` seconds elapse.

    Returns (accumulated_bytes, timed_out).
    The search is performed on the trailing 64 bytes to keep it fast.
    """
    buf = bytearray()
    deadline = time.monotonic() + timeout
    tail_check = len(marker) + 32   # window size for marker search

    while True:
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            return bytes(buf), True

        # Wait up to 0.1s for data
        try:
            rlist, _, _ = select.select([master_fd], [], [], min(0.1, remaining))
        except (ValueError, OSError):
            return bytes(buf), True

        if rlist:
            try:
                chunk = os.read(master_fd, 4096)
            except OSError:
                return bytes(buf), True

            if chunk:
                buf.extend(chunk)
                # Match only when marker is at the very end of the buffer
                # (avoids consuming the next command's prompt early)
                if len(buf) >= len(marker) and buf[-len(marker):] == marker:
                    return bytes(buf), False
        # else: nothing yet, loop back


def strip_echo_and_prompt(raw: bytes, cmd: str) -> str:
    """
    Strip the echoed command and trailing "$ " from captured output.

    PTY echo mirrors the command before the output:
        "ls\r\n<output>\r\n$ "
    We remove:
        1. The first non-empty line if it matches the submitted command
        2. Any trailing "$ " prompt lines
    """
    text = raw.decode("utf-8", errors="replace").replace("\r\n", "\n").replace("\r", "\n")
    lines = text.split("\n")

    # Strip leading blank lines
    while lines and not lines[0].strip():
        lines.pop(0)

    # Strip echoed command (first line)
    if lines and lines[0].strip() == cmd.strip():
        lines.pop(0)

    # Strip trailing prompt / blank lines
    while lines and lines[-1].strip() in ("$", "$ ", ""):
        lines.pop()

    return "\n".join(lines).strip()


# ── Daemon ─────────────────────────────────────────────────────────────────────

class Xv6Daemon:
    def __init__(self):
        self.master_fd: int | None = None
        self.child_pid: int | None = None
        self._booted = False

    def start(self):
        """Spawn the boot binary inside a PTY."""
        master_fd, slave_fd = pty.openpty()

        # Put master in raw mode so we see all bytes unmodified
        old = termios.tcgetattr(master_fd)
        new = termios.tcgetattr(master_fd)
        new[0] &= ~(termios.IXON | termios.IXOFF | termios.ICRNL)  # iflag
        new[1] &= ~termios.OPOST                                      # oflag
        new[3] &= ~(termios.ECHO | termios.ICANON | termios.ISIG)    # lflag
        termios.tcsetattr(master_fd, termios.TCSANOW, new)

        self.master_fd = master_fd

        pid = os.fork()
        if pid == 0:
            # ── Child ────────────────────────────────────────────────
            os.close(master_fd)
            os.setsid()

            # Make slave the controlling terminal
            import fcntl
            fcntl.ioctl(slave_fd, termios.TIOCSCTTY, 0)

            # Redirect stdin/stdout to slave PTY
            # Redirect stderr to /dev/null — prevents Rust eprintln! debug
            # output from leaking into the PTY and burying the shell prompt
            devnull = os.open(os.devnull, os.O_WRONLY)
            os.dup2(slave_fd, 0)
            os.dup2(slave_fd, 1)
            os.dup2(devnull, 2)
            if slave_fd > 2:
                os.close(slave_fd)
            os.close(devnull)

            os.chdir(str(WORKSPACE))

            # Inherit environment but ensure no buffering in Rust binary
            env = os.environ.copy()
            env["RUST_LOG"] = ""        # silence any log noise
            # Force line-buffered output (Rust's stdout is line-buffered to ttys anyway)

            os.execve(BOOT_CMD[0], BOOT_CMD, env)
            os._exit(1)  # unreachable

        else:
            # ── Parent ───────────────────────────────────────────────
            os.close(slave_fd)
            self.child_pid = pid

    def wait_for_boot(self) -> dict:
        """Wait for the xv6 shell to print its first prompt."""
        t0 = time.monotonic()
        raw, timed_out = read_until(self.master_fd, PROMPT_BYTES, BOOT_TIMEOUT)
        elapsed_ms = int((time.monotonic() - t0) * 1000)

        if timed_out:
            # Dump whatever we received to help diagnose
            snippet = raw[-500:].decode("utf-8", errors="replace") if raw else "(nothing)"
            return {
                "ok": False,
                "cmd": "__boot_wait__",
                "error": "boot timeout",
                "last_output": snippet,
                "elapsed_ms": elapsed_ms,
            }

        self._booted = True
        return {
            "ok": True,
            "cmd": "__boot_wait__",
            "output": "",
            "elapsed_ms": elapsed_ms,
        }

    def exec(self, cmd: str) -> dict:
        """Send one command to xv6 and capture its output."""
        if not self._booted:
            return {"ok": False, "cmd": cmd, "error": "not booted"}

        t0 = time.monotonic()

        # Write command + newline to the PTY master
        payload = (cmd.rstrip("\n") + "\n").encode()
        try:
            os.write(self.master_fd, payload)
        except OSError as e:
            return {"ok": False, "cmd": cmd, "error": f"write failed: {e}"}

        # Collect output until the next prompt
        raw, timed_out = read_until(self.master_fd, PROMPT_BYTES, CMD_TIMEOUT)
        elapsed_ms = int((time.monotonic() - t0) * 1000)

        if timed_out:
            return {"ok": False, "cmd": cmd, "error": "command timeout", "elapsed_ms": elapsed_ms}

        output = strip_echo_and_prompt(raw, cmd)
        return {"ok": True, "cmd": cmd, "output": output, "elapsed_ms": elapsed_ms}

    def shutdown(self):
        """Kill the child process and close the PTY."""
        if self.child_pid:
            try:
                os.kill(self.child_pid, signal.SIGTERM)
                os.waitpid(self.child_pid, 0)
            except (ProcessLookupError, ChildProcessError, OSError):
                pass
            self.child_pid = None

        if self.master_fd is not None:
            try:
                os.close(self.master_fd)
            except OSError:
                pass
            self.master_fd = None


# ── Main loop ──────────────────────────────────────────────────────────────────

def main():
    # Validate binary exists before starting
    if not BOOT_BIN.exists():
        sys.stderr.write(
            f"[xv6_exec] ERROR: binary not found at {BOOT_BIN}\n"
            f"[xv6_exec] Run: cargo build --bin geos_native_boot\n"
        )
        sys.stderr.flush()
        boot_error = {
            "ok": False, "cmd": "__boot_wait__",
            "error": f"binary not found: {BOOT_BIN}"
        }
        print(json.dumps(boot_error), flush=True)
        sys.exit(1)

    daemon = Xv6Daemon()

    def _sigterm(sig, frame):
        daemon.shutdown()
        sys.exit(0)
    signal.signal(signal.SIGINT, _sigterm)
    signal.signal(signal.SIGTERM, _sigterm)

    sys.stderr.write(f"[xv6_exec] Launching {BOOT_CMD[0]}...\n")
    sys.stderr.flush()

    daemon.start()
    boot_result = daemon.wait_for_boot()
    print(json.dumps(boot_result), flush=True)

    if not boot_result["ok"]:
        daemon.shutdown()
        sys.exit(1)

    sys.stderr.write(f"[xv6_exec] xv6 booted in {boot_result['elapsed_ms']}ms. Ready.\n")
    sys.stderr.flush()

    # ── Command loop ──────────────────────────────────────────────────
    for raw_line in sys.stdin:
        line = raw_line.strip()
        if not line:
            continue

        try:
            req = json.loads(line)
        except json.JSONDecodeError as e:
            print(json.dumps({"ok": False, "error": f"bad JSON: {e}"}), flush=True)
            continue

        cmd = req.get("cmd", "")

        if cmd == "__shutdown__":
            print(json.dumps({"ok": True, "cmd": "__shutdown__", "output": ""}), flush=True)
            break

        if cmd == "__boot_wait__":
            print(json.dumps({"ok": True, "cmd": "__boot_wait__", "output": "", "elapsed_ms": 0}), flush=True)
            continue

        result = daemon.exec(cmd)
        print(json.dumps(result), flush=True)

    daemon.shutdown()


if __name__ == "__main__":
    main()
