# WebMCP Tools Reference

Complete reference for all WebMCP tools available in Geometry OS Web Edition.

**Total Tools: 93** | **Version: 2.1.0** | **Updated: 2026-02-15**

---

## Table of Contents

1. [Overview](#overview)
2. [Tool Categories](#tool-categories)
   - [Phase A: Navigation & Map (4 tools)](#phase-a-navigation--map)
   - [Phase B: Hilbert & Evolution (4 tools)](#phase-b-hilbert--evolution)
   - [Phase D: A2A Protocol (9 tools)](#phase-d-a2a-protocol)
   - [Phase F: AI Visual Builder (9 tools)](#phase-f-ai-visual-builder)
   - [Phase G: Session & Region Management (13 tools)](#phase-g-session--region-management)
   - [Phase H: Hypervisor (1 tool)](#phase-h-hypervisor)
   - [Phase K: Neural Kernel (5 tools)](#phase-k-neural-kernel)
   - [Phase L: Autonomous Operator (5 tools)](#phase-l-autonomous-operator)
   - [Phase M: AI PM Integration (5 tools)](#phase-m-ai-pm-integration)
   - [Phase N: AI-Assisted IDE Tools (4 tools)](#phase-n-ai-assisted-ide-tools)
3. [Usage Examples](#usage-examples)
4. [Error Handling](#error-handling)

---

## Overview

WebMCP (Web Model Context Protocol) provides a standardized interface for AI agents to interact with the Geometry OS visual shell. All tools are registered through the `WebMCPBridge` and accessible via `navigator.modelContext`.

### Connection

```javascript
// Check WebMCP availability
if (window.navigator.modelContext) {
    const tools = await window.navigator.modelContext.listTools();
    console.log(`Available tools: ${tools.length}`);
}
```

### Tool Call Format

```javascript
const result = await navigator.modelContext.callTool('tool_name', {
    param1: 'value1',
    param2: 'value2'
});
```

---

## Tool Categories

### Phase A: Navigation & Map

Core tools for interacting with the infinite map viewport.

| Tool | Description |
|------|-------------|
| `navigate_map` | Pan and zoom the infinite map |
| `get_os_state` | Get current OS and viewport state |
| `execute_pixel_program` | Execute a pixel CPU program |
| `load_rts_cartridge` | Load an RTS cartridge into the system |

#### navigate_map

Navigate the infinite map to specified coordinates.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `x` | number | Yes | Target X coordinate |
| `y` | number | Yes | Target Y coordinate |
| `zoom` | number | No | Zoom level (0.1-10.0) |
| `animate` | boolean | No | Smooth transition (default: true) |

**Example:**
```javascript
await navigator.modelContext.callTool('navigate_map', {
    x: 819200,
    y: 819200,
    zoom: 1.0
});
```

#### get_os_state

Get comprehensive system state including viewport, CPU, and session info.

**Returns:**
```json
{
    "viewport": { "x": 819200, "y": 819200, "zoom": 1.0 },
    "fps": 60,
    "tileCount": 1024,
    "connected": true
}
```

#### execute_pixel_program

Execute a pixel CPU program from a brick file.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `program` | string | Yes | Program name or brick ID |
| `cycles` | number | No | Max cycles to execute |

#### load_rts_cartridge

Load an RTS (Real-Time System) cartridge into the hypervisor.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `kernel_url` | string | Yes | URL to .rts.png cartridge |
| `boot` | boolean | No | Auto-boot after load (default: true) |

---

### Phase B: Hilbert & Evolution

Tools for spatial indexing and shader evolution.

| Tool | Description |
|------|-------------|
| `query_hilbert_address` | Convert between linear and 2D Hilbert coordinates |
| `trigger_evolution` | Trigger WGSL shader evolution |
| `send_llm_prompt` | Send prompt to integrated LLM |
| `spawn_area_agent` | Spawn an area agent at coordinates |

#### query_hilbert_address

Query Hilbert curve spatial indexing system.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `address` | number | No | Linear Hilbert address |
| `x` | number | No | 2D X coordinate |
| `y` | number | No | 2D Y coordinate |
| `order` | number | No | Hilbert curve order (default: 16) |

**Returns:**
```json
{
    "linear": 12345,
    "x": 100,
    "y": 200,
    "distance": 141.4
}
```

#### trigger_evolution

Trigger evolutionary mutation of WGSL shaders.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `shader_id` | string | Yes | Target shader ID |
| `mutation_rate` | number | No | Mutation rate 0.0-1.0 |
| `generations` | number | No | Number of generations |

#### send_llm_prompt

Send a prompt to the integrated LLM for code generation.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `prompt` | string | Yes | The prompt text |
| `context` | object | No | Additional context |
| `max_tokens` | number | No | Max response tokens |

#### spawn_area_agent

Spawn an autonomous area agent at specified coordinates.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `x` | number | Yes | Spawn X coordinate |
| `y` | number | Yes | Spawn Y coordinate |
| `radius` | number | No | Agent patrol radius |
| `behavior` | string | No | Behavior type |

---

### Phase D: A2A Protocol

Agent-to-agent communication and coordination tools.

| Tool | Description |
|------|-------------|
| `send_a2a_message` | Send message to another agent |
| `discover_a2a_agents` | Discover available agents |
| `a2a_coordination` | Coordinate multi-agent tasks |
| `a2a_send_message` | Send WebSocket message |
| `a2a_broadcast` | Broadcast to all agents |
| `a2a_subscribe` | Subscribe to agent channel |
| `a2a_acquire_lock` | Acquire distributed lock |
| `a2a_release_lock` | Release distributed lock |
| `a2a_barrier_enter` | Enter synchronization barrier |

#### send_a2a_message

Send a message to a specific agent.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `target_agent` | string | Yes | Target agent ID |
| `message` | object | Yes | Message payload |
| `priority` | string | No | Message priority |

#### discover_a2a_agents

Discover all available agents in the system.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `filter` | string | No | Filter by capability |
| `region` | string | No | Filter by region |

**Returns:**
```json
{
    "agents": [
        { "id": "agent_001", "capabilities": ["navigation", "building"] }
    ]
}
```

#### a2a_acquire_lock

Acquire a distributed lock for resource coordination.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `resource_id` | string | Yes | Resource to lock |
| `timeout` | number | No | Lock timeout (ms) |

---

### Phase F: AI Visual Builder

Tools for AI-assisted visual building and shader management.

| Tool | Description |
|------|-------------|
| `builder_place_tile` | Place a tile at coordinates |
| `builder_load_shader` | Load a WGSL shader |
| `builder_evolve_shader` | Evolve shader with mutations |
| `builder_assemble_cartridge` | Assemble tiles into cartridge |
| `builder_preview` | Preview build result |
| `builder_get_state` | Get builder state |
| `builder_connect_tiles` | Connect tiles visually |
| `builder_remove_connection` | Remove tile connection |
| `ide_get_state` | Get Neural IDE state |

#### builder_place_tile

Place a tile on the infinite map.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `x` | number | Yes | Tile X coordinate |
| `y` | number | Yes | Tile Y coordinate |
| `type` | string | Yes | Tile type |
| `metadata` | object | No | Additional tile data |

#### builder_evolve_shader

Evolve a shader through genetic programming.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `shader_id` | string | Yes | Shader to evolve |
| `fitness` | string | Yes | Fitness function |
| `population` | number | No | Population size |

#### builder_assemble_cartridge

Assemble multiple tiles into an RTS cartridge.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `tiles` | array | Yes | Array of tile coordinates |
| `name` | string | Yes | Cartridge name |
| `compress` | boolean | No | Enable compression |

---

### Phase G: Session & Region Management

Multi-user session and region management tools.

| Tool | Description |
|------|-------------|
| `session_create` | Create new session |
| `session_join` | Join existing session |
| `session_leave` | Leave current session |
| `session_get_state` | Get session state |
| `region_claim` | Claim a map region |
| `region_release` | Release claimed region |
| `region_query` | Query region status |
| `task_delegate` | Delegate task to agent |
| `task_accept` | Accept delegated task |
| `task_report` | Report task progress |
| `task_get_queue` | Get task queue |
| `build_checkpoint` | Create build checkpoint |
| `build_rollback` | Rollback to checkpoint |

#### session_create

Create a new collaborative session.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | Yes | Session name |
| `max_users` | number | No | Maximum users |
| `permissions` | object | No | Permission settings |

#### region_claim

Claim a region of the infinite map.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `x1` | number | Yes | Top-left X |
| `y1` | number | Yes | Top-left Y |
| `x2` | number | Yes | Bottom-right X |
| `y2` | number | Yes | Bottom-right Y |
| `purpose` | string | No | Claim purpose |

#### task_delegate

Delegate a task to an available agent.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `task_type` | string | Yes | Type of task |
| `params` | object | Yes | Task parameters |
| `agent_id` | string | No | Specific agent |

---

### Phase H: Hypervisor

WGPU hypervisor control tools.

| Tool | Description |
|------|-------------|
| `hypervisor_status` | Get hypervisor status |

#### hypervisor_status

Get comprehensive hypervisor status.

**Returns:**
```json
{
    "running": true,
    "kernels": 2,
    "memory_used_mb": 128,
    "fps": 60
}
```

---

### Phase K: Neural Kernel

Neural kernel management and hot-swapping.

| Tool | Description |
|------|-------------|
| `kernel_list` | List registered kernels |
| `kernel_register` | Register new kernel |
| `kernel_swap` | Hot-swap active kernel |
| `kernel_health` | Check kernel health |
| `kernel_metrics` | Get performance metrics |

#### kernel_list

List all registered neural kernels.

**Returns:**
```json
{
    "kernels": [
        {
            "id": "main_cpu",
            "name": "RISC-V Standard",
            "status": "active",
            "load_time": 0.023
        }
    ]
}
```

#### kernel_register

Register a new kernel from cartridge.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | Yes | Kernel name |
| `url` | string | Yes | Cartridge URL |
| `config` | object | No | Kernel configuration |

#### kernel_swap

Hot-swap the active kernel without restart.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `kernel_name` | string | Yes | Target kernel name |
| `preserve_state` | boolean | No | Preserve CPU state |

**Example:**
```javascript
// Swap to optimized kernel
await navigator.modelContext.callTool('kernel_swap', {
    kernel_name: 'riscv_optimized',
    preserve_state: true
});
```

#### kernel_health

Check health status of a kernel.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `kernel_name` | string | No | Kernel to check (default: active) |

**Returns:**
```json
{
    "status": "healthy",
    "uptime_s": 3600,
    "error_count": 0,
    "last_error": null
}
```

#### kernel_metrics

Get detailed performance metrics for a kernel.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `kernel_name` | string | No | Kernel to measure |
| `duration_s` | number | No | Measurement duration |

**Returns:**
```json
{
    "ips": 1500000,
    "cache_hits": 98.5,
    "memory_mb": 64,
    "gpu_utilization": 45
}
```

---

### Phase L: Autonomous Operator

Autonomous system operation and optimization.

| Tool | Description |
|------|-------------|
| `operator_status` | Get operator state |
| `operator_start` | Start autonomous operation |
| `operator_stop` | Stop operator |
| `operator_recommendations` | Get optimization suggestions |
| `operator_apply` | Apply recommended changes |

#### operator_status

Get current autonomous operator status.

**Returns:**
```json
{
    "running": true,
    "mode": "performance",
    "uptime_s": 86400,
    "optimizations_applied": 12
}
```

#### operator_start

Start autonomous operation with configuration.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `mode` | string | Yes | Operating mode |
| `config` | object | No | Configuration overrides |

**Modes:**
- `performance` - Maximize throughput
- `latency` - Minimize response time
- `reliability` - Maximize uptime
- `balanced` - Balance all metrics

#### operator_stop

Stop the autonomous operator.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `graceful` | boolean | No | Graceful shutdown (default: true) |

#### operator_recommendations

Get AI-generated optimization recommendations.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `category` | string | No | Filter by category |

**Categories:**
- `all` - All recommendations
- `kernel_swap` - Kernel switching suggestions
- `parameter_tune` - Parameter adjustments
- `resource_allocation` - Memory/GPU allocation

**Returns:**
```json
{
    "recommendations": [
        {
            "id": "rec_001",
            "type": "kernel_swap",
            "description": "Switch to optimized kernel for 15% performance gain",
            "confidence": 0.92,
            "impact": "high"
        }
    ]
}
```

#### operator_apply

Apply a recommended optimization.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `recommendation_id` | string | Yes | ID from operator_recommendations |

**Example:**
```javascript
// Get recommendations
const recs = await navigator.modelContext.callTool('operator_recommendations', {
    category: 'kernel_swap'
});

// Apply first recommendation
if (recs.recommendations.length > 0) {
    await navigator.modelContext.callTool('operator_apply', {
        recommendation_id: recs.recommendations[0].id
    });
}
```

---

### Phase M: AI PM Integration

Tools for AI agents to manage their own development process.

| Tool | Description |
|------|-------------|
| `pm_get_roadmap` | Get project roadmap overview |
| `pm_get_phases` | List all phases with status |
| `pm_get_tasks` | Get tasks for a phase |
| `pm_update_task` | Update task status |
| `pm_create_task` | Create new task |

#### pm_get_roadmap

Get current project roadmap status and overview.

**Returns:**
```json
{
    "success": true,
    "roadmap": {
        "name": "Geometry OS",
        "version": "2026.1",
        "currentPhase": "M",
        "totalPhases": 12,
        "completedPhases": 11,
        "progress": 92
    },
    "summary": {
        "complete": 11,
        "inProgress": 1,
        "pending": 0
    }
}
```

#### pm_get_phases

List all phases with their current status.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `status` | string | No | Filter by status (complete/in_progress/pending) |

**Returns:**
```json
{
    "success": true,
    "phases": [
        { "id": "A", "name": "WebMCP Core", "status": "complete", "progress": 100 },
        { "id": "M", "name": "AI PM Integration", "status": "in_progress", "progress": 25 }
    ],
    "total": 12
}
```

#### pm_get_tasks

Get tasks for a specific phase.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `phase_id` | string | Yes | Phase ID (e.g., "M") |
| `status` | string | No | Filter by status |
| `priority` | string | No | Filter by priority |

**Returns:**
```json
{
    "success": true,
    "phase_id": "M",
    "tasks": [
        {
            "id": "M-1",
            "name": "Create pm_tools.js",
            "status": "complete",
            "priority": "high"
        }
    ],
    "summary": {
        "complete": 1,
        "inProgress": 1,
        "pending": 2
    }
}
```

#### pm_update_task

Update the status of a task.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `task_id` | string | Yes | Task ID (e.g., "M-1") |
| `status` | string | Yes | New status (pending/in_progress/complete/blocked) |
| `notes` | string | No | Optional notes |

**Returns:**
```json
{
    "success": true,
    "task": { "id": "M-2", "status": "complete" },
    "previousStatus": "in_progress",
    "message": "Task M-2 updated from in_progress to complete"
}
```

#### pm_create_task

Create a new task in a phase.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `phase_id` | string | Yes | Phase ID |
| `name` | string | Yes | Task name |
| `priority` | string | No | Priority (low/medium/high/critical) |
| `description` | string | No | Task description |

**Returns:**
```json
{
    "success": true,
    "task": {
        "id": "M-5",
        "name": "Integration testing",
        "status": "pending",
        "priority": "high"
    }
}
```

---

### Phase N: AI-Assisted IDE Tools

Tools for AI agents to manage code compilation, testing, debugging, and deployment within the IDE.

| Tool | Description |
|------|-------------|
| `ide_compile` | Compile WGSL/JS/Python code with diagnostics |
| `ide_test` | Run tests with structured results |
| `ide_debug` | Debug code with breakpoints |
| `ide_deploy` | Deploy code/files as .rts.png cartridge to Infinite Map |

#### ide_compile

Compile code with full diagnostics and error reporting.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `source` | string | Yes | Source code to compile |
| `language` | string | Yes | Language (wgsl/js/python) |
| `target` | string | No | Target platform |
| `options` | object | No | Compiler options |

**Returns:**
```json
{
    "success": true,
    "compiled": true,
    "diagnostics": [],
    "output": "compiled_code",
    "errors": []
}
```

#### ide_test

Run tests with structured, parseable results.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `test_filter` | string | No | Filter tests by pattern |
| `timeout` | number | No | Test timeout (ms) |
| `verbose` | boolean | No | Verbose output |

**Returns:**
```json
{
    "success": true,
    "results": [
        { "name": "test_foo", "status": "pass", "duration": 23 }
    ],
    "summary": {
        "total": 42,
        "pass": 40,
        "fail": 2,
        "skip": 0
    }
}
```

#### ide_debug

Debug code with breakpoints and inspection.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `file` | string | Yes | File to debug |
| `breakpoints` | array | Yes | Line numbers |
| `watch` | array | No | Expressions to watch |

#### ide_deploy

Deploy code/files as a .rts.png cartridge to the Infinite Map.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `source_files` | array | Yes* | Files to deploy (path + base64 content) |
| `source_region` | object | Yes* | Legacy: Map region to capture |
| `name` | string | Yes | Cartridge name |
| `description` | string | No | Description metadata |
| `entry_point` | string | No | Entry file:function |
| `location` | object | No | Deploy location {x, y} |

*Either `source_files` or `source_region` required.

**Example - Deploy from files:**
```javascript
const result = await navigator.modelContext.callTool('ide_deploy', {
    source_files: [
        { path: 'main.py', content: btoa('print("hello")') },
        { path: 'lib.py', content: btoa('def helper(): pass') }
    ],
    name: 'my_app',
    description: 'My first cartridge',
    entry_point: 'main.py',
    location: { x: 1000, y: 2000 }
});

// Result:
// {
//   success: true,
//   cartridge: { format: "png", data: "...", size_bytes: 4096 },
//   location: { x: 1000, y: 2000 }
// }
```

**Example - Deploy from map region (legacy):**
```javascript
const result = await navigator.modelContext.callTool('ide_deploy', {
    source_region: { x: 100, y: 100, width: 256, height: 256 },
    name: 'region_cart'
});

// Result:
// {
//   success: true,
//   cartridge: { path: "/cartridges/region_cart.rts.png" },
//   location: { x: 200, y: 200 }
// }
```

**Example - Download cartridge:**
```javascript
const result = await navigator.modelContext.callTool('ide_deploy', {
    source_files: [{ path: 'app.py', content: btoa('print("app")')],
    name: 'download_test'
});

if (result.success && result.cartridge.data) {
    // Convert base64 to blob
    const binary = atob(result.cartridge.data);
    const bytes = new Uint8Array(binary.length);
    for (let i = 0; i < binary.length; i++) {
        bytes[i] = binary.charCodeAt(i);
    }

    const blob = new Blob([bytes], { type: 'image/png' });
    const url = URL.createObjectURL(blob);

    // Trigger download
    const a = document.createElement('a');
    a.href = url;
    a.download = `${result.cartridge.name}.rts.png`;
    a.click();

    URL.revokeObjectURL(url);
}
```

---

## Usage Examples

### Complete Workflow: Navigate and Build

```javascript
// 1. Navigate to build area
await navigator.modelContext.callTool('navigate_map', {
    x: 100000,
    y: 100000,
    zoom: 2.0
});

// 2. Place tiles
await navigator.modelContext.callTool('builder_place_tile', {
    x: 100000,
    y: 100000,
    type: 'cpu_core'
});

// 3. Connect tiles
await navigator.modelContext.callTool('builder_connect_tiles', {
    from: { x: 100000, y: 100000 },
    to: { x: 100100, y: 100000 }
});

// 4. Preview result
const preview = await navigator.modelContext.callTool('builder_preview', {});

// 5. Assemble cartridge
await navigator.modelContext.callTool('builder_assemble_cartridge', {
    tiles: [[100000, 100000], [100100, 100000]],
    name: 'my_kernel'
});
```

### Autonomous Optimization Loop

```javascript
// Start operator in performance mode
await navigator.modelContext.callTool('operator_start', {
    mode: 'performance'
});

// Periodically check recommendations
setInterval(async () => {
    const recs = await navigator.modelContext.callTool('operator_recommendations', {});

    for (const rec of recs.recommendations) {
        if (rec.confidence > 0.9 && rec.impact === 'high') {
            await navigator.modelContext.callTool('operator_apply', {
                recommendation_id: rec.id
            });
            console.log(`Applied: ${rec.description}`);
        }
    }
}, 60000); // Every minute
```

### PM Workflow for AI Agents

```javascript
// Check roadmap
const roadmap = await navigator.modelContext.callTool('pm_get_roadmap', {});
console.log(`Progress: ${roadmap.roadmap.progress}%`);

// Get tasks for current phase
const tasks = await navigator.modelContext.callTool('pm_get_tasks', {
    phase_id: roadmap.roadmap.currentPhase,
    status: 'pending'
});

// Pick a task and mark in progress
const task = tasks.tasks[0];
await navigator.modelContext.callTool('pm_update_task', {
    task_id: task.id,
    status: 'in_progress'
});

// ... do the work ...

// Mark complete
await navigator.modelContext.callTool('pm_update_task', {
    task_id: task.id,
    status: 'complete',
    notes: 'Implemented successfully'
});
```

---

## Error Handling

All tools return a consistent error format:

```json
{
    "success": false,
    "error": "Error message describing the issue",
    "code": "ERROR_CODE"
}
```

### Common Error Codes

| Code | Description |
|------|-------------|
| `INVALID_PARAMS` | Missing or invalid parameters |
| `NOT_FOUND` | Requested resource not found |
| `UNAUTHORIZED` | Insufficient permissions |
| `SYSTEM_ERROR` | Internal system error |
| `TIMEOUT` | Operation timed out |

### Error Handling Example

```javascript
const result = await navigator.modelContext.callTool('kernel_swap', {
    kernel_name: 'nonexistent'
});

if (!result.success) {
    console.error(`Error: ${result.error}`);
    // Handle error appropriately
}
```

---

## Changelog

### v2.0.0 (2026-02-14)
- Added Phase M: AI PM Integration tools (5 tools)
- Total tools: 89
- HTTP bridge ready for Python backend integration

### v1.0.0 (2026-01-01)
- Initial WebMCP Bridge release
- Phases A-H complete

---

**Geometry OS: Web Edition** - WebMCP Tools Reference
