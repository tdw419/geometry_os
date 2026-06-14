# GeOS Web IDE

A browser-based editor and debugger for Geometry OS assembly programs. Write code, assemble, run, step, and inspect -- all from a web page.

## How It Works

The IDE is two parts:

1. **geos_ide.html** -- A single-file web app (~19KB, no build step). Loads Monaco Editor from CDN, provides a 256x256 framebuffer viewer, file browser, register inspector, and console. Runs entirely in the browser.

2. **geos_web_ide.py** -- A Python bridge server (~7.5KB, zero deps beyond stdlib + `websockets`). Serves the HTML over HTTP and bridges WebSocket commands from the browser to the GeOS Unix socket (`/tmp/geo_cmd.sock`).

Architecture:

```
Browser (geos_ide.html)
  |
  | HTTP  :3841  --  GET/PUT files, serve IDE HTML
  | WS    :3842  --  send commands (run, step, halt, regs, screenshot)
  |
geos_web_ide.py (Python bridge)
  |
  | Unix socket  --  /tmp/geo_cmd.sock
  |
GeOS (Rust VM, cargo run --features native)
```

The bridge is thin -- it translates JSON WebSocket messages into plain-text Unix socket commands and returns the raw responses. No state, no database, no magic.

## Prerequisites

- GeOS built with the `native` feature (creates the command socket):
  ```bash
  cargo run --release --features native
  ```
- Python 3 with `websockets`:
  ```bash
  pip3 install websockets
  ```

## Starting Up

```bash
# Terminal 1: start GeOS (creates /tmp/geo_cmd.sock)
cd geometry_os
cargo run --release --features native

# Terminal 2: start the IDE bridge
python3 tools/geos_web_ide.py
# [ide] HTTP  -> http://localhost:3841
# [ide] WS    -> ws://localhost:3842
# [ide] Files: ~/zion/projects/geometry_os/geometry_os/programs
# [ide] Socket: /tmp/geo_cmd.sock

# Open http://localhost:3841 in your browser
```

CLI options:
```
python3 tools/geos_web_ide.py [--port 3841] [--socket /tmp/geo_cmd.sock]
```

WebSocket always runs on `port + 1` (so 3842 by default).

## IDE Layout

```
+--[GEO]--[filename]--[status]--------------------------------+
| [Run] [Step] [Halt] | [Screenshot] [Refresh] | [Save] [Load] |
+-------------------------+---+--------------------------------+
|                         |   | PROGRAMS  [filter...]          |
|    256x256              | r |  hello.asm          142b        |
|    Framebuffer          | e |  snake.asm          1.2k       |
|    (scaled to fit)      | s |  tetris.asm         3.4k       |
|                         | i |  ...                          |
|                         | z |                                |
+-------------------------+ e |  ; your code here             |
| AGENT VIEW              | r |  LDI r0, 42                   |
| (vmscreen - what        | i |  TEXT r0, 10, 10              |
|  the AI sees)           | z |  HALT                          |
| ▓▒░ ···#···░▒▓         | e |                                |
| ····░▒▓▓▒░····         | r |                                |
+-------------------------+   +--------------------------------+
| R00:0000 R01:0000  ...  |   | [console log]                  |
| R28:8000 R29:0000  ...  |   | > Connected to GeOS             |
| (registers)             |   | > Running snake.asm...          |
+-------------------------+---+ > [ASM OK] 312 words            |
+--------------------------------------------------------------+
```

- **Left panel, top**: Live 256x256 framebuffer (nearest-neighbor upscaled) -- what the program actually renders
- **Left panel, middle**: AGENT VIEW -- the `vmscreen` ASCII dump of the same framebuffer, showing exactly what AI agents perceive. Polled in lockstep with the canvas screenshot so both update together. When they disagree visually, that's a vision-pipeline bug.
- **Left panel, bottom**: Register inspector
- **Right panel**: Filterable file browser + Monaco editor + console log
- **Resizer**: Drag the divider between panels

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+S` | Save file to disk |
| `Ctrl+Enter` or `F5` | Save + loadasm + run |
| `F10` | Single step |
| `Escape` | Halt execution |

## Toolbar Buttons

| Button | Action |
|--------|--------|
| **Run** | Save the open file, load it into GeOS (`loadasm`), then run. Starts screenshot polling at 5fps. |
| **Step** | Execute one instruction. Updates framebuffer and registers. |
| **Halt** | Stop execution. Stops screenshot polling. |
| **Screenshot** | Take one screenshot, update framebuffer display and registers. |
| **Refresh** | Alias for Screenshot. |
| **Save** | Write editor contents to disk (same as Ctrl+S). |
| **Load Canvas** | Load the current file into GeOS's canvas text buffer (for programs that use canvas text mode). |

## Console

The console at the bottom shows status messages:

- Green: successful operations (connected, saved, assembled)
- Red: errors (assembly failures, socket errors)
- Gray: informational messages (halted, loaded)

## Commands (WebSocket Protocol)

The browser sends JSON to the WebSocket. The bridge forwards to the Unix socket and returns the response.

### Raw command (general purpose)
```json
{"cmd": "raw", "data": "loadasm programs/snake.asm", "id": 12345}
```
Response:
```json
{"type": "resp", "cmd": "loadasm programs/snake.asm", "data": "[ASM OK] 312 words", "id": 12345}
```
The `id` field is used to correlate requests with responses. If omitted, the response is broadcast to all handlers.

Common raw commands: `loadasm <file>`, `run`, `step`, `halt`, `load <file>`, `regs`

### Screenshot
```json
{"cmd": "screenshot_b64"}
```
Response:
```json
{"type": "b64", "data": "iVBORw0KGgoAAAANSUhEUg..."}
```
Returns a base64-encoded PNG of the current framebuffer.

### Registers
```json
{"cmd": "regs"}
```
Response:
```json
{"type": "regs", "data": "R00=0000 R01=002A\nR02=0000 ..."}
```

### Agent View (ASCII screen)
```json
{"cmd": "vmscreen"}
```
Response:
```json
{"type": "vmscreen", "data": "····░░▓▓██▓▓░░····\n··░░████████░░··\n..."}
```
Returns the 64x32 ASCII art representation of the framebuffer -- the same view agents use via `vm_screen_ascii`. Polled in lockstep with screenshots so you can compare pixel output against agent perception.

## File API (HTTP)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/files` | List all `.asm` files in `programs/`. Returns JSON array with name, size, modified. |
| GET | `/api/file/<name>` | Read file contents. |
| POST | `/api/file/<name>` | Write file contents (body = file text). Returns `{"ok": true}`. |

All file access is restricted to the `programs/` directory (path traversal blocked via `realpath` check).

## Screenshot Polling

When a program is running (after clicking Run), the IDE polls for screenshots at 5fps (every 200ms). This gives a live view of the framebuffer as the program executes. Polling stops when you click Halt or the connection drops.

## Auto-Reconnect

If the WebSocket disconnects (GeOS restart, bridge restart, network hiccup), the browser automatically reconnects after 3 seconds. The status indicator in the header shows connection state.

## Monaco Editor

The editor uses Monaco Editor v0.50.0 (loaded from jsdelivr CDN) with a custom language definition for GeOS assembly:

- **Keywords**: GeOS opcodes highlighted in cyan (the keyword list in `geos_ide.html` may lag behind newly-added opcodes — update it when adding instructions)
- **Registers**: `r0`-`r31` highlighted in purple
- **Numbers**: Hex (`0x`), binary (`0b`), decimal in amber
- **Strings**: Double and single quoted in green
- **Comments**: `;` and `#` line comments in gray italic
- **Labels**: `name:` in orange

Custom dark theme matching the IDE's color scheme.

## Troubleshooting

**"Socket not found: /tmp/geo_cmd.sock"**
Start GeOS with `--features native`. The socket is only created when the native MCP command handler is compiled in.

**"geos_ide.html not found"**
Run the bridge from the project root, or ensure `geos_ide.html` is in the same directory as `geos_web_ide.py`.

**Framebuffer is black / no output**
The program might have already halted before the first screenshot poll. Click "Screenshot" to grab a single frame. Or check the console for assembly errors.

**Editor shows no syntax highlighting**
Monaco loads from CDN. If you're offline or behind a firewall, you'll get a plain textarea. The IDE still works, just without highlighting.

## The Long Arc

This web IDE is scaffolding. The canonical editor is `editor.asm` running inside GeOS as a WINSYS app -- the OS dogfooding itself. This external web wrapper exists to make building that self-hosted editor easier: faster edit-run cycles, better debugging visibility, and a familiar development environment while the in-VM editor matures.
