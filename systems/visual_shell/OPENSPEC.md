# Visual Shell Subsystem - OpenSpec

**Version**: 1.1
**Status**: Active
**Last Updated**: 2026-01-20  

## Overview

The Visual Shell subsystem provides the primary visual cortex for Geometry OS, integrating an infinite desktop interface with Glass Panel widgets and real-time telemetry. This subsystem serves as the bridge between the neural cortex and the user interface, enabling spatial visualization of system state and interactive control.

## Architecture

```
systems/visual_shell/
├── web/
│   └── index.html              # Main PixiJS-based infinite desktop interface
├── server/
│   └── infinite_desktop_server.py  # WebSocket bridge for real-time data
├── tests/
│   └── test_glass_backend.py   # Backend validation tests
└── OPENSPEC.md                 # This specification
```

## Components

### 1. Web Interface (`web/index.html`)

**Purpose**: Primary visual cortex providing spatial desktop interface

**Technology Stack**:
- PixiJS v7.x for 2D rendering
- WebSocket client for real-time updates
- Glass Panel widget system for telemetry display

**Key Features**:
- Infinite pan/zoom desktop with spatial file visualization
- Orb-based application launcher (.rts.png Pixel Apps)
- Glass Panel overlay system for telemetry widgets
- Real-time daemon state visualization
- Interactive file execution

**Data Flow**:
```
WebSocket Server → index.html → PixiJS Renderer → User Interface
```

**API Endpoints**:
- WebSocket: `ws://localhost:8765`
- HTTP API: `http://localhost:8080/api/{files|daemons}`

### 2. WebSocket Server (`server/infinite_desktop_server.py`)

**Purpose**: Real-time data bridge between neural cortex and visual shell

**Technology Stack**:
- Python 3.8+
- websockets library for WebSocket communication
- aiohttp for HTTP REST API
- HarmonicHub integration for daemon state

**Key Features**:
- WebSocket server for real-time daemon state updates
- File system scanning with spatial coordinate generation
- Neural pattern streaming from HarmonicHub
- HTTP REST API for static data queries
- Telemetry integration with Glass Panel system
- Cortex integration for reflex actions

**Core Classes**:

#### `FileSystemScanner`
- Scans project file system
- Generates spiral-based spatial coordinates
- Caches results with 5-minute TTL
- Filters relevant file types (.py, .js, .html, .rts.png, etc.)

#### `FileExecutor`
- Universal file execution handler
- Supports .rts.png Pixel Apps with unpacking
- Python script execution
- Shell script execution
- Fallback to xdg-open

#### `InfiniteDesktopServer`
- Main WebSocket server class
- Manages client connections
- Broadcasts daemon state updates (10 Hz)
- Handles telemetry streaming to active Glass Panels
- Integrates with PredictiveCortex for reflex actions

**Configuration**:
```python
ws_port = 8765      # WebSocket port
http_port = 8080    # HTTP API port
scan_interval = 300 # File system scan interval (seconds)
broadcast_rate = 10 # Updates per second
```

**Message Types**:
- `INITIAL_DAEMONS`: Initial daemon state sync
- `INITIAL_FILES`: File system spatial data
- `FILES_UPDATE`: Updated file system data
- `DAEMON_UPDATE`: Real-time daemon state changes
- `APP_ACTIVATED`: Application launch event
- `REFLEX_ACTION`: Cortex-generated reflex actions
- `EXECUTE_FILE`: File execution request from client

### 3. Test Suite (`tests/test_glass_backend.py`)

**Purpose**: Validate backend functionality and Glass Panel integration

**Test Coverage**:
- WebSocket connection establishment
- File system data reception
- Application execution simulation
- Glass Panel activation
- Telemetry data streaming

**Usage**:
```bash
python systems/visual_shell/tests/test_glass_backend.py
```

## Data Flow

### 1. Initialization Flow
```
User opens index.html
    ↓
WebSocket connection to localhost:8765
    ↓
Server sends INITIAL_DAEMONS
    ↓
Server sends INITIAL_FILES (spatial coordinates)
    ↓
Client renders infinite desktop with orbs
```

### 2. Application Execution Flow
```
User clicks .rts.png orb
    ↓
Client sends EXECUTE_FILE message
    ↓
Server's FileExecutor unpacks .rts.png
    ↓
Server broadcasts APP_ACTIVATED event
    ↓
Client creates Glass Panel for app
    ↓
Server streams telemetry to Glass Panel
```

### 3. Telemetry Streaming Flow
```
Server reads system_telemetry.log
    ↓
Server identifies active Glass Panel apps
    ↓
Server sends APP_ACTIVATED with updated content
    ↓
Client updates Glass Panel display
```

## Integration Points

### HarmonicHub Integration
- **Location**: `systems/neural_cortex/harmonic_hub.py`
- **Purpose**: Provides daemon state synchronization
- **Data**: Daemon frequencies, amplitudes, phases

### PredictiveCortex Integration
- **Location**: `systems/neural_cortex/cortex.py`
- **Purpose**: Generates reflex actions based on sensory input
- **Data**: Reflex actions, neural state

### File System Integration
- **Scope**: Project root directory
- **Pattern**: Spiral spatial layout
- **Filters**: .py, .js, .html, .rts.png, .md, etc.

## Glass Panel System

### Panel Types
1. **System Monitor**: CPU, memory, process statistics
2. **Process Hive**: Active process visualization
3. **Custom Panels**: Extensible via .rts.png metadata

### Panel Lifecycle
```
Activation → Creation → Telemetry Streaming → Updates → Close
```

### Panel Data Format
```json
{
  "type": "system_monitor",
  "title": "System Monitor",
  "icon": "🔮",
  "content": {
    "cpu_load": "42%",
    "memory_usage": "1024MB",
    "timestamp": 1705747200
  },
  "x": 200,
  "y": 200
}
```

## Performance Characteristics

### Target Metrics
- **Frame Rate**: 60 FPS (16ms per frame)
- **WebSocket Latency**: <10ms overhead
- **File Scan Time**: <5s for 150k+ files
- **Memory Usage**: ~50MB for server + WGPU

### Optimization Strategies
- File system caching with 5-minute TTL
- WebSocket message batching
- Spatial indexing for file lookup
- Differential updates for telemetry

## Security Considerations

### Current State
- No authentication (localhost only)
- No encryption (WebSocket plain text)
- File execution requires user interaction

### Future Enhancements
- WebSocket TLS support
- Authentication tokens
- File execution sandboxing
- CORS restrictions

## Deployment

### Local Development
```bash
# Start server
python systems/visual_shell/server/infinite_desktop_server.py

# Open in browser
file:///home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/index.html
```

### Production Considerations
- Run server as systemd service
- Configure firewall rules
- Set up reverse proxy (nginx)
- Enable HTTPS/WSS

## Maintenance

### Log Files
- `infinite_desktop_server.log`: Server operation logs
- `system_telemetry.log`: System metrics for Glass Panels

### Monitoring
- WebSocket connection count
- File scan performance
- Memory usage trends
- Error rates

## Dependencies

### Server Dependencies
```
websockets>=11.0
aiohttp>=3.8.0
pathlib
asyncio
json
```

### Client Dependencies
```
pixi.js@7.x
```

## Future Roadmap

### Phase 16: Enhanced Interactivity ✅ COMPLETED
- [x] Drag-and-drop file organization
- [x] Custom panel creation
- [x] Keyboard shortcuts
- [x] Context menus

**Implementation Details:**

#### Context Menu System
- **Trigger**: Right-click on file orbs
- **Features**:
  - Open file execution
  - Create Glass Panel for file
  - Rename file (F2)
  - Copy file path to clipboard
  - Delete file
- **UI**: Glass-styled menu matching existing design language
- **Positioning**: Appears at mouse cursor location
- **Auto-dismiss**: Click outside menu or press Escape

#### Keyboard Shortcuts
- **Navigation**:
  - Arrow Keys: Pan view
  - Ctrl + Plus: Zoom in
  - Ctrl + Minus: Zoom out
  - Ctrl + 0: Reset view
- **File Operations**:
  - Enter: Open selected file
  - Ctrl + N: Create Glass Panel
  - F2: Rename file
  - Delete: Delete file
  - Ctrl + C: Copy file path
- **Panel Management**:
  - Escape: Close active panel/menu
  - Ctrl + M: Toggle panel minimize
- **System**:
  - ?: Show keyboard shortcuts help
  - Ctrl + R: Refresh files

#### Visual Feedback
- **Shortcut Feedback**: Bottom-right toast notification shows triggered shortcuts
- **Help Panel**: Press ? to display comprehensive keyboard shortcuts reference
- **Hover Effects**: File orbs highlight on hover with glow effect
- **Selection Feedback**: Visual indication when file is selected

#### File Sprite Rendering
- **Dynamic Creation**: File sprites rendered on INITIAL_FILES message
- **Color Coding**:
  - Gold (.rts.png): Pixel Apps
  - Orange: Folders
  - Cyan: Other files
- **Interactive Events**:
  - Left-click: Select file
  - Right-click: Show context menu
  - Double-click: Open file
  - Hover: Visual highlight

**Testing**:
- Validation suite: `systems/visual_shell/tests/validate_phase16_client.py`
- Test results: 10/10 tests passed (100% success rate)
- Coverage: Context menu CSS/HTML/JS, Keyboard shortcuts CSS/HTML/JS, File sprite integration

**Performance Impact**:
- Minimal overhead: Event-driven architecture
- No additional WebSocket messages required
- Client-side only implementation

### Phase 17: Multi-User Support
- Shared desktop sessions
- Collaborative cursors
- Real-time sync

### Phase 18: Advanced Visualization
- 3D spatial view
- Neural network visualization
- Time-based system state replay

## Change Log

### v1.1 (2026-01-20) - Phase 16: Enhanced Interactivity
- Implemented Context Menu system with right-click file operations
- Added comprehensive Keyboard Shortcuts for navigation and file management
- Created file sprite rendering with interactive events
- Added visual feedback for keyboard shortcuts (toast notifications)
- Implemented keyboard shortcuts help panel (press ?)
- Enhanced HUD with file count display and shortcuts hint
- Added file type color coding (Gold for .rts.png apps, Orange for folders, Cyan for files)
- Created validation test suite: `tests/validate_phase16_client.py`
- Test results: 10/10 tests passed (100% success rate)
- PAS Score improvement: 0.85 → 0.88 (target: 0.90)

### v1.0 (2026-01-20)
- Initial structural consolidation
- Moved from root directory to `systems/visual_shell/`
- Updated relative paths
- Created OpenSpec documentation
- PAS Score improvement: 0.69 → 0.85 (target: 0.90)

## References

- [INFINITE_DESKTOP_README.md](../../INFINITE_DESKTOP_README.md)
- [INFINITE_DESKTOP_SUMMARY.md](../../INFINITE_DESKTOP_SUMMARY.md)
- [HarmonicHub Documentation](../neural_cortex/harmonic_hub.py)
- [PredictiveCortex Documentation](../neural_cortex/cortex.py)

## Contact & Support

For issues or questions regarding the Visual Shell subsystem:
- Check server logs: `infinite_desktop_server.log`
- Run validation tests: `python systems/visual_shell/tests/test_glass_backend.py`
- Review this OpenSpec for architecture details

## Architectural Pivot: v8 Reactivity

> "The CPU bubble is the enemy of the Infinite Desktop."

### Why v8?
We are moving to **PixiJS v8** to leverage the **Reactive Render Loop** and **RenderGroups**.
- **Current State**: Nodes are re-evaluated every frame.
- **Future State**: Static background nodes (99% of the file system) are cached in a RenderGroup. Only the active window (GlassPanel) and cursor micro-animations update.
- **Impact**: Enables 100,000+ node visualization without CPU bottleneck.

### Implementation Strategy
The **Geometry Development Kit (GDK)** (`@geometry-os/ui`) targets v8 APIs exclusively.
- `GlassPanel` extends `PIXI.Container` but will be wrapped in a `RenderGroup` for isolation.
- `NeuralGrid` will be a single static draw call reused across frames.
