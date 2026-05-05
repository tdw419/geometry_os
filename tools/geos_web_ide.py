#!/usr/bin/env python3
"""
GeOS Web IDE Bridge Server

Serves the GeOS IDE and bridges WebSocket commands to the Geometry OS
Unix socket at /tmp/geo_cmd.sock.

Usage:
    python3 geos_web_ide.py [--port 3841] [--socket /tmp/geo_cmd.sock]

Two endpoints on the same port:
    HTTP  /           -> IDE HTML
    HTTP  /api/files  -> list programs
    HTTP  /api/file/* -> GET/PUT file contents
    WS    /ws         -> GeOS command bridge
"""

import asyncio
import json
import os
import socket
import base64
import argparse
import subprocess
from http.server import HTTPServer, BaseHTTPRequestHandler
from threading import Thread, Event
from urllib.parse import unquote

import websockets
from websockets.asyncio.server import serve

GEOS_PROJECT = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
PROGRAMS_DIR = os.path.join(GEOS_PROJECT, "programs")
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
HTML_FILE = os.path.join(SCRIPT_DIR, "geos_ide.html")


# ─── Unix Socket ───
def unix_send(sock_path, command, timeout=5.0):
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.settimeout(timeout)
    try:
        sock.connect(sock_path)
        sock.sendall((command + "\n").encode())
        chunks = []
        while True:
            try:
                chunk = sock.recv(131072)
                if not chunk:
                    break
                chunks.append(chunk)
            except socket.timeout:
                break
        return b"".join(chunks).decode("utf-8", errors="replace")
    finally:
        sock.close()


# ─── File ops ───
def list_programs():
    out = []
    if not os.path.isdir(PROGRAMS_DIR):
        return out
    for f in sorted(os.listdir(PROGRAMS_DIR)):
        if f.endswith(".asm"):
            full = os.path.join(PROGRAMS_DIR, f)
            st = os.stat(full)
            out.append({"name": f, "size": st.st_size, "modified": st.st_mtime})
    return out


def read_program(name):
    path = os.path.join(PROGRAMS_DIR, name)
    real = os.path.realpath(path)
    if not real.startswith(os.path.realpath(PROGRAMS_DIR)):
        raise ValueError(f"Access denied: {name}")
    with open(real, "r") as f:
        return f.read()


def write_program(name, content):
    path = os.path.join(PROGRAMS_DIR, name)
    real = os.path.realpath(path)
    if not real.startswith(os.path.realpath(PROGRAMS_DIR)):
        raise ValueError(f"Access denied: {name}")
    with open(real, "w") as f:
        f.write(content)


# ─── Git ops ───
def git_run(*args, timeout=10):
    """Run a git command in the project dir, return (returncode, stdout, stderr)."""
    try:
        r = subprocess.run(
            ["git"] + list(args),
            capture_output=True, text=True, timeout=timeout,
            cwd=GEOS_PROJECT,
        )
        return r.returncode, r.stdout.strip(), r.stderr.strip()
    except subprocess.TimeoutExpired:
        return -1, "", "timeout"
    except Exception as e:
        return -1, "", str(e)


def git_status():
    rc, out, _ = git_run("status", "--porcelain=v2", "--branch")
    if rc != 0:
        return {"branch": "?", "clean": False, "files": []}
    branch = "detached"
    files = []
    for line in out.split("\n"):
        if not line:
            continue
        if line.startswith("# branch.head "):
            branch = line.split(" ", 2)[-1]
        elif line.startswith("# branch.ab "):
            parts = line.split(" ", 3)
            if len(parts) >= 3:
                branch += f" {parts[2]}"
        elif line[0:1] in "1 2":
            # ordinary / rename
            xy = line[1:3] if line[0] != " " else line[1:3]
            parts = line.split(" ", 5)
            path = parts[-1] if parts else line
            files.append({"status": xy, "path": path})
    return {"branch": branch, "clean": len(files) == 0, "files": files[:200]}


def git_log(count=30):
    rc, out, _ = git_run("log", f"--max-count={count}", "--format=%H|%an|%ae|%at|%s")
    if rc != 0:
        return []
    commits = []
    for line in out.split("\n"):
        if not line:
            continue
        parts = line.split("|", 4)
        if len(parts) == 5:
            commits.append({
                "hash": parts[0][:12],
                "hash_full": parts[0],
                "author": parts[1],
                "email": parts[2],
                "timestamp": int(parts[3]),
                "message": parts[4],
            })
    return commits


def git_diff(ref="HEAD"):
    rc, out, _ = git_run("diff", "--stat", ref)
    return out if rc == 0 else ""


def git_diff_files(ref="HEAD"):
    rc, out, _ = git_run("diff", "--name-status", ref)
    if rc != 0:
        return []
    files = []
    for line in out.split("\n"):
        if not line:
            continue
        parts = line.split("\t", 1)
        if len(parts) == 2:
            files.append({"status": parts[0], "path": parts[1]})
    return files


# ─── HTTP Handler (threaded) ───
class Handler(BaseHTTPRequestHandler):
    def log_message(self, *a):
        pass

    def do_GET(self):
        if self.path in ("/", "/index.html"):
            try:
                with open(HTML_FILE, "r") as f:
                    body = f.read()
                self._ok("text/html; charset=utf-8", body)
            except FileNotFoundError:
                self.send_error(404, "geos_ide.html not found")
        elif self.path == "/git":
            git_html = os.path.join(SCRIPT_DIR, "geos_git.html")
            try:
                with open(git_html, "r") as f:
                    body = f.read()
                self._ok("text/html; charset=utf-8", body)
            except FileNotFoundError:
                self.send_error(404, "geos_git.html not found")
        elif self.path == "/api/files":
            self._json(list_programs())
        elif self.path == "/api/git/status":
            self._json(git_status())
        elif self.path == "/api/git/log":
            self._json(git_log())
        elif self.path.startswith("/api/git/log/"):
            count = self.path.split("/")[-1]
            try:
                count = int(count)
            except ValueError:
                count = 30
            self._json(git_log(count))
        elif self.path.startswith("/api/git/diff/"):
            ref = unquote(self.path[len("/api/git/diff/"):])
            self._json({"stat": git_diff(ref), "files": git_diff_files(ref)})
        elif self.path == "/api/git/diff":
            self._json({"stat": git_diff(), "files": git_diff_files()})
        elif self.path.startswith("/api/file/"):
            name = unquote(self.path[len("/api/file/"):])
            try:
                self._ok("text/plain", read_program(name))
            except (FileNotFoundError, ValueError) as e:
                self.send_error(404, str(e))
        else:
            self.send_error(404)

    def do_POST(self):
        if self.path.startswith("/api/file/"):
            name = unquote(self.path[len("/api/file/"):])
            length = int(self.headers.get("Content-Length", 0))
            body = self.rfile.read(length).decode("utf-8")
            try:
                write_program(name, body)
                self._json({"ok": True})
            except (ValueError, IOError) as e:
                self.send_error(500, str(e))
        else:
            self.send_error(404)

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def _ok(self, ctype, body):
        self.send_response(200)
        self.send_header("Content-Type", ctype)
        self.end_headers()
        self.wfile.write(body.encode() if isinstance(body, str) else body)

    def _json(self, obj):
        self._ok("application/json", json.dumps(obj))


# ─── WebSocket Handler ───
async def handle_ws(websocket, sock_path):
    print("[ws] connected")
    try:
        async for raw in websocket:
            try:
                msg = json.loads(raw)
            except json.JSONDecodeError:
                continue

            cmd = msg.get("cmd", "")

            if cmd == "raw":
                raw_cmd = msg.get("data", "")
                msg_id = msg.get("id")
                try:
                    resp = await asyncio.to_thread(unix_send, sock_path, raw_cmd, 8.0)
                    out = {"type": "resp", "cmd": raw_cmd.strip(), "data": resp}
                    if msg_id is not None:
                        out["id"] = msg_id
                    await websocket.send(json.dumps(out))
                except Exception as e:
                    out = {"type": "err", "error": str(e)}
                    if msg_id is not None:
                        out["id"] = msg_id
                    await websocket.send(json.dumps(out))

            elif cmd == "screenshot_b64":
                try:
                    resp = await asyncio.to_thread(unix_send, sock_path, "screenshot_b64", 8.0)
                    await websocket.send(json.dumps({"type": "b64", "data": resp.strip()}))
                except Exception as e:
                    await websocket.send(json.dumps({"type": "err", "error": str(e)}))

            elif cmd == "regs":
                try:
                    resp = await asyncio.to_thread(unix_send, sock_path, "regs", 3.0)
                    await websocket.send(json.dumps({"type": "regs", "data": resp}))
                except Exception as e:
                    await websocket.send(json.dumps({"type": "err", "error": str(e)}))

    except websockets.ConnectionClosed:
        pass
    finally:
        print("[ws] disconnected")


# ─── Main ───
async def main(port, sock_path):
    if not os.path.exists(sock_path):
        print(f"[!] Socket not found: {sock_path}")
        print(f"    Start GeOS: cd {GEOS_PROJECT} && cargo run --features native")

    # HTTP server in a background thread
    httpd = HTTPServer(("0.0.0.0", port), Handler)
    http_thread = Thread(target=httpd.serve_forever, daemon=True)
    http_thread.start()

    # WebSocket server on port+1
    ws_port = port + 1
    print(f"[ide] HTTP  -> http://localhost:{port}")
    print(f"[ide] WS    -> ws://localhost:{ws_port}")
    print(f"[ide] Files: {PROGRAMS_DIR}")
    print(f"[ide] Socket: {sock_path}")

    async def handler(ws):
        await handle_ws(ws, sock_path)

    async with serve(handler, "0.0.0.0", ws_port):
        await asyncio.Future()


if __name__ == "__main__":
    p = argparse.ArgumentParser(description="GeOS Web IDE Bridge")
    p.add_argument("--port", type=int, default=3841)
    p.add_argument("--socket", type=str, default="/tmp/geo_cmd.sock")
    a = p.parse_args()
    try:
        asyncio.run(main(a.port, a.socket))
    except KeyboardInterrupt:
        print("\n[ide] bye")
