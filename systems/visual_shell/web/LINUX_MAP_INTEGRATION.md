# Linux Map Integration

**Version:** 1.0.0 | **Updated:** 2026-02-15

Run Linux VMs with visual representation on the PixiJS Infinite Map. Sessions are associated with spatial coordinates, and execution output can be rendered as tiles.

---

## Table of Contents

1. [Overview](#overview)
2. [Quick Start](#quick-start)
3. [WebMCP Tools](#webmcp-tools)
   - [linux_boot_at_position](#linux_boot_at_position)
   - [linux_exec_to_tile](#linux_exec_to_tile)
   - [linux_session_health](#linux_session_health)
4. [API Reference](#api-reference)
   - [LinuxTileBridge Class](#linuxtilebridge-class)
5. [Architecture](#architecture)
6. [Mock Mode](#mock-mode)
7. [Limitations](#limitations)
8. [Examples](#examples)

---

## Overview

The Linux Map Integration enables you to boot Linux VM sessions and visualize them as tiles on the PixiJS Infinite Map. Each Linux session is associated with a spatial position, allowing for:

- **Spatial Computing**: Linux VMs positioned at specific map coordinates
- **Visual Output**: Command execution results rendered as map tiles
- **Session Health**: Real-time monitoring of CPU, memory, and status
- **WebMCP Integration**: AI agent-friendly tool interface

### Key Components

| Component | File | Purpose |
|-----------|------|---------|
| `LinuxTileBridge` | `linux_tile_bridge.js` | Core bridge between Linux VM and map |
| WebMCP Tools | `webmcp_bridge.js` | AI agent interface |
| Demo Page | `test_linux_map.html` | Interactive demo |
| Python Bridge | `webmcp_linux_bridge.py` | Backend QEMU/KVM bridge |

---

## Quick Start

### 1. Start the Linux Bridge

```bash
# Navigate to project directory
cd /home/jericho/zion/projects/geometry_os/geometry_os

# Start the Python WebSocket bridge
python3 systems/pixel_compiler/webmcp_linux_bridge.py
```

The bridge will start on `ws://localhost:8767` by default.

### 2. Start the Web Server

```bash
# Navigate to web directory
cd systems/visual_shell/web

# Start HTTP server
python3 -m http.server 8001
```

### 3. Open the Demo

Navigate to:
```
http://localhost:8001/test_linux_map.html
```

You should see:
- A PixiJS canvas showing the infinite map
- Control panel on the left side
- Connection status indicator
- Active sessions list

### 4. Boot a Linux Session

```
1. Enter coordinates (default: 500, 300)
2. Click "Boot Linux"
3. A Linux session tile appears on the map
4. Session ID is displayed in the Active Sessions list
```

---

## WebMCP Tools

### linux_boot_at_position

Boot a Linux VM at specific map coordinates.

**Tool Signature:**
```json
{
    "name": "linux_boot_at_position",
    "description": "Boot a Linux VM session and place it at specific coordinates on the Infinite Map.",
    "inputSchema": {
        "type": "object",
        "properties": {
            "kernel": {
                "type": "string",
                "description": "Kernel/distro to boot (e.g., 'alpine')",
                "default": "alpine"
            },
            "x": {
                "type": "number",
                "description": "X coordinate on the map for session tile"
            },
            "y": {
                "type": "number",
                "description": "Y coordinate on the map for session tile"
            },
            "options": {
                "type": "object",
                "description": "Additional boot options",
                "properties": {
                    "memory": {
                        "type": "number",
                        "description": "Memory in MB"
                    },
                    "cores": {
                        "type": "number",
                        "description": "CPU cores"
                    }
                }
            }
        },
        "required": ["x", "y"]
    }
}
```

**Parameters:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `kernel` | string | No | `"alpine"` | Kernel/distro to boot |
| `x` | number | Yes | - | X coordinate for session tile |
| `y` | number | Yes | - | Y coordinate for session tile |
| `options.memory` | number | No | - | Memory in MB |
| `options.cores` | number | No | - | CPU cores |

**Returns:**
```json
{
    "success": true,
    "sessionId": "alpine-abc123",
    "tilePlaced": true,
    "position": { "x": 500, "y": 300 },
    "error": null
}
```

**Examples:**

```javascript
// Boot Alpine Linux at position (500, 300)
await navigator.modelContext.callTool('linux_boot_at_position', {
    kernel: 'alpine',
    x: 500,
    y: 300
});

// Boot with custom memory
await navigator.modelContext.callTool('linux_boot_at_position', {
    kernel: 'alpine',
    x: 600,
    y: 400,
    options: {
        memory: 2048,
        cores: 2
    }
});
```

---

### linux_exec_to_tile

Execute a command in Linux VM and place the output as a tile on the map.

**Tool Signature:**
```json
{
    "name": "linux_exec_to_tile",
    "description": "Execute a command in Linux VM and place the output as a tile on the Infinite Map.",
    "inputSchema": {
        "type": "object",
        "properties": {
            "command": {
                "type": "string",
                "description": "Shell command to execute"
            },
            "x": {
                "type": "number",
                "description": "X coordinate for result tile"
            },
            "y": {
                "type": "number",
                "description": "Y coordinate for result tile"
            },
            "timeout": {
                "type": "number",
                "description": "Execution timeout in seconds",
                "default": 30
            }
        },
        "required": ["command", "x", "y"]
    }
}
```

**Parameters:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `command` | string | Yes | - | Shell command to execute |
| `x` | number | Yes | - | X coordinate for result tile |
| `y` | number | Yes | - | Y coordinate for result tile |
| `timeout` | number | No | 30 | Execution timeout (seconds) |

**Returns:**
```json
{
    "success": true,
    "stdout": "file1.txt\nfile2.txt\n",
    "stderr": "",
    "exitCode": 0,
    "tilePlaced": true,
    "position": { "x": 600, "y": 300 },
    "error": null
}
```

**Examples:**

```javascript
// List directory contents
await navigator.modelContext.callTool('linux_exec_to_tile', {
    command: 'ls -la /',
    x: 600,
    y: 300
});

// Multi-line command
await navigator.modelContext.callTool('linux_exec_to_tile', {
    command: 'echo "Hello from Linux!" && cat /etc/os-release',
    x: 700,
    y: 400,
    timeout: 60
});
```

---

### linux_session_health

Get health status of Linux sessions on the map, including CPU, memory, and position.

**Tool Signature:**
```json
{
    "name": "linux_session_health",
    "description": "Get health status of Linux sessions on the map, including CPU, memory, and position.",
    "inputSchema": {
        "type": "object",
        "properties": {
            "sessionId": {
                "type": "string",
                "description": "Specific session ID (optional, returns all if omitted)"
            }
        }
    }
}
```

**Parameters:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `sessionId` | string | No | - | Specific session ID (all if omitted) |

**Returns (all sessions):**
```json
{
    "sessions": [
        {
            "sessionId": "alpine-abc123",
            "position": { "x": 500, "y": 300 },
            "status": "running",
            "kernel": "alpine",
            "health": {
                "cpu": 15,
                "memory": 256,
                "timestamp": 1739606400000
            }
        }
    ],
    "count": 1
}
```

**Returns (specific session):**
```json
{
    "sessionId": "alpine-abc123",
    "position": { "x": 500, "y": 300 },
    "healthHistory": [
        { "status": "running", "timestamp": 1739606400000 },
        { "status": "booting", "timestamp": 1739606390000 }
    ],
    "found": true
}
```

**Examples:**

```javascript
// Get all sessions
const allSessions = await navigator.modelContext.callTool('linux_session_health', {});
console.log(`Active sessions: ${allSessions.count}`);

// Get specific session health
const sessionHealth = await navigator.modelContext.callTool('linux_session_health', {
    sessionId: 'alpine-abc123'
});
```

---

## API Reference

### LinuxTileBridge Class

Core bridge class for integrating Linux VM sessions with the Infinite Map.

#### Constructor

```javascript
new LinuxTileBridge(map, client, config)
```

**Parameters:**

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `map` | Object | Yes | - | The Infinite Map instance |
| `client` | Object | Yes | - | Linux bridge client (WebSocket wrapper) |
| `config` | Object | No | `{}` | Configuration options |

**Configuration Options:**

```javascript
{
    autoPlace: true,              // Automatically place tiles on map
    defaultTileType: 'linux_session',  // Default tile type
    maxHistoryLength: 100         // Max session history entries
}
```

**Example:**

```javascript
import { LinuxTileBridge } from './linux_tile_bridge.js';

const mockClient = {
    connected: false,
    call: async (command, params) => {
        // WebSocket call implementation
        return { result: '...' };
    }
};

const bridge = new LinuxTileBridge(infiniteMap, mockClient, {
    autoPlace: true,
    maxHistoryLength: 200
});
```

---

#### Methods

##### bootAtPosition

Boot a Linux session at a specific map position.

```javascript
await bridge.bootAtPosition(kernel, position, options)
```

**Parameters:**

| Name | Type | Description |
|------|------|-------------|
| `kernel` | string | Kernel/distro name (e.g., 'alpine') |
| `position` | object | `{x, y}` world coordinates |
| `options` | object | Boot options (memory, cores, etc.) |

**Returns:**
```javascript
{
    success: boolean,
    sessionId: string,
    tilePlaced: boolean,
    position: {x, y}
}
```

**Example:**
```javascript
const result = await bridge.bootAtPosition('alpine', { x: 500, y: 300 });
console.log(`Session ${result.sessionId} booted at (${result.position.x}, ${result.position.y})`);
```

---

##### execToTile

Execute a command and place result as a tile.

```javascript
await bridge.execToTile(command, position, options)
```

**Parameters:**

| Name | Type | Description |
|------|------|-------------|
| `command` | string | Shell command to execute |
| `position` | object | `{x, y}` for result tile placement |
| `options` | object | Execution options (timeout) |

**Returns:**
```javascript
{
    success: boolean,
    result: {stdout, stderr, exit_code},
    tilePlaced: boolean,
    position: {x, y}
}
```

**Example:**
```javascript
const result = await bridge.execToTile('ls -la /', { x: 600, y: 400 });
console.log(`Exit code: ${result.result.exit_code}`);
```

---

##### getSessionPosition

Get the map position for a session.

```javascript
bridge.getSessionPosition(sessionId)
```

**Parameters:**

| Name | Type | Description |
|------|------|-------------|
| `sessionId` | string | Session ID |

**Returns:**
```javascript
{x, y} | null
```

**Example:**
```javascript
const pos = bridge.getSessionPosition('alpine-abc123');
if (pos) {
    console.log(`Session at (${pos.x}, ${pos.y})`);
}
```

---

##### getActiveSessions

Get all active sessions.

```javascript
bridge.getActiveSessions()
```

**Returns:**
```javascript
[
    {
        sessionId: string,
        position: {x, y},
        status: string,
        kernel: string,
        health: {cpu, memory, timestamp} | null
    }
]
```

**Example:**
```javascript
const sessions = bridge.getActiveSessions();
sessions.forEach(s => {
    console.log(`${s.sessionId}: ${s.status} at (${s.position.x}, ${s.position.y})`);
});
```

---

##### updateSessionHealth

Update session health metrics.

```javascript
bridge.updateSessionHealth(sessionId, health)
```

**Parameters:**

| Name | Type | Description |
|------|------|-------------|
| `sessionId` | string | Session ID |
| `health` | object | `{cpu, memory, disk, network}` |

**Example:**
```javascript
bridge.updateSessionHealth('alpine-abc123', {
    cpu: 45,
    memory: 512,
    disk: 80
});
```

---

##### getSessionHealthHistory

Get session health history.

```javascript
bridge.getSessionHealthHistory(sessionId)
```

**Returns:**
```javascript
[
    {status: string, timestamp: number},
    {type: 'health', health: {...}, timestamp: number}
]
```

---

##### updateSessionStatus

Update session status.

```javascript
bridge.updateSessionStatus(sessionId, status)
```

**Parameters:**

| Name | Type | Description |
|------|------|-------------|
| `sessionId` | string | Session ID |
| `status` | string | New status (e.g., 'running', 'stopped') |

---

## Architecture

```
                        +----------------------------------------+
                        |               Browser                  |
                        |                                        |
                        |  +-------------------+   +-----------+  |
                        |  |  LinuxTileBridge  |   | WebMCP    |  |
                        |  |  - bootAtPosition |<--| Bridge    |  |
                        |  |  - execToTile     |   |           |  |
                        |  |  - updateHealth   |   |           |  |
                        |  +---------+---------+   +-----------+  |
                        |            |                              |
                        |            v                              |
                        |  +-------------------------------------+  |
                        |  |        PixiJS Infinite Map           |  |
                        |  |                                     |  |
                        |  |     +----+----+----+----+----+      |  |
                        |  |     |    |    | 🐧 |    | 📝 |      |  |
                        |  |     +----+----+----+----+----+      |  |
                        |  |     |    |    |    |    |    |      |  |
                        |  |     +----+----+----+----+----+      |  |
                        |  |                                     |  |
                        |  |  🐧 = Linux Session Tile            |  |
                        |  |  📝 = Output Tile                   |  |
                        |  +-------------------------------------+  |
                        +---------------------|--------------------+
                                             |
                                             | WebSocket (ws://localhost:8767)
                                             |
                                             v
                        +----------------------------------------+
                        |        webmcp_linux_bridge.py          |
                        |                                        |
                        |  +------------+  +-------------+  +---+ |  |
                        |  |  QEMU/KVM  |  | Serial I/O  |  | WS| |  |
                        |  |  Alpine VM |  |  Bridge     |  |   | |  |
                        |  |            |  |             |  |   | |  |
                        |  +------------+  +-------------+  +---+ |  |
                        |                                        |
                        +----------------------------------------+
```

**Data Flow:**

1. **AI Agent** calls WebMCP tool (e.g., `linux_boot_at_position`)
2. **WebMCP Bridge** forwards to `LinuxTileBridge`
3. **LinuxTileBridge** calls Python bridge via WebSocket
4. **Python Bridge** boots QEMU/KVM VM with Alpine Linux
5. **Session ID** returned and associated with map position
6. **Session Tile** rendered on PixiJS Infinite Map
7. **Commands** execute via serial console, output captured
8. **Output Tiles** placed at specified coordinates

---

## Mock Mode

If the Linux bridge is not running, the system operates in mock mode:

### Behavior

| Operation | Mock Response |
|-----------|---------------|
| `bootAtPosition` | Returns mock session ID: `"mock-" + timestamp` |
| `execToTile` | Returns placeholder output: `"[Mock mode] Command would execute..."` |
| `health check` | Returns `{"status": "mock", "running": false}` |

### Detection

```javascript
// The client indicates connection status
if (!linuxClient.connected) {
    console.log('Running in mock mode - tiles will still be placed');
}
```

### Use Cases

- **Development**: Test UI without QEMU dependency
- **CI/CD**: Run tests without KVM access
- **Prototyping**: Design map layouts before real sessions

### Enabling Real Mode

```bash
# Start the Python bridge
python3 systems/pixel_compiler/webmcp_linux_bridge.py

# The demo will auto-connect and switch to real mode
```

---

## Limitations

### Current Limitations

| Area | Limitation |
|------|------------|
| **Hypervisor** | QEMU/KVM required for real Linux execution |
| **Display** | Serial console only (no GUI framebuffer yet) |
| **Networking** | No network access in VM (isolated) |
| **Persistence** | Sessions lost on bridge restart |
| **Concurrency** | Single WebSocket connection |
| **Storage** | No persistent disk (ephemeral only) |

### Platform Requirements

- **Linux**: KVM acceleration available
- **macOS**: QEMU with TCG (slower)
- **Windows**: QEMU with TCG (slower)

### Performance

| Metric | Typical Value |
|--------|---------------|
| Boot time | 5-15 seconds |
| Command exec | < 1 second |
| Memory per VM | 512MB minimum |
| CPU usage | ~10% per idle VM |

---

## Examples

### Example 1: Boot and Execute

```javascript
// Boot a Linux session
const bootResult = await navigator.modelContext.callTool('linux_boot_at_position', {
    kernel: 'alpine',
    x: 500,
    y: 300
});

// Execute some commands
await navigator.modelContext.callTool('linux_exec_to_tile', {
    command: 'uname -a',
    x: 600,
    y: 300
});

await navigator.modelContext.callTool('linux_exec_to_tile', {
    command: 'cat /proc/cpuinfo | head -5',
    x: 700,
    y: 300
});

// Check session health
const health = await navigator.modelContext.callTool('linux_session_health', {
    sessionId: bootResult.sessionId
});
```

### Example 2: Direct API Usage

```javascript
import { LinuxTileBridge } from './linux_tile_bridge.js';

// Create custom client
const customClient = {
    connected: true,
    call: async (command, params) => {
        const response = await fetch('http://localhost:8767/api', {
            method: 'POST',
            body: JSON.stringify({ command, ...params })
        });
        return response.json();
    }
};

// Initialize bridge
const bridge = new LinuxTileBridge(infiniteMap, customClient);

// Boot session
const result = await bridge.bootAtPosition('alpine', { x: 1000, y: 2000 });

// Check position
const pos = bridge.getSessionPosition(result.sessionId);
console.log(`Session at grid (${Math.floor(pos.x / 100)}, ${Math.floor(pos.y / 100)})`);
```

### Example 3: Health Monitoring

```javascript
// Periodic health check
setInterval(async () => {
    const health = await navigator.modelContext.callTool('linux_session_health', {});

    health.sessions.forEach(session => {
        if (session.health) {
            console.log(`${session.sessionId}: CPU ${session.health.cpu}%`);

            // Update status if needed
            if (session.health.cpu > 90) {
                console.warn(`High CPU usage: ${session.sessionId}`);
            }
        }
    });
}, 5000); // Every 5 seconds
```

### Example 4: Batch Operations

```javascript
// Boot multiple Linux instances at different positions
const positions = [
    { x: 500, y: 300 },
    { x: 700, y: 300 },
    { x: 500, y: 500 }
];

const bootPromises = positions.map(pos =>
    navigator.modelContext.callTool('linux_boot_at_position', {
        kernel: 'alpine',
        x: pos.x,
        y: pos.y
    })
);

const results = await Promise.all(bootPromises);
console.log(`Booted ${results.length} Linux sessions`);
```

---

## Related Documentation

- [WebMCP Tools Reference](WEBMCP_TOOLS_REFERENCE.md) - All available WebMCP tools
- [User Guide](USER_GUIDE.md) - General usage guide
- [API Documentation](API.md) - Complete API reference
- [Infinite Map Integration](PHASE6_INFINITE_MAP_INTEGRATION_COMPLETE.md) - Map system details

---

## Changelog

### v1.0.0 (2026-02-15)
- Initial release of Linux Map Integration
- `linux_boot_at_position` WebMCP tool
- `linux_exec_to_tile` WebMCP tool
- `linux_session_health` WebMCP tool
- `LinuxTileBridge` class with full API
- Demo page: `test_linux_map.html`
- Mock mode support for development

---

**Geometry OS: Web Edition** - Linux Map Integration Documentation
