# Geometry OS: Web Edition

A high-performance, browser-native infinite map implementation using PixiJS. This is a complete rewrite of the Geometry OS infinite map system, designed to run entirely in the browser with optional backend connectivity.

## Architecture Overview

### Core Components

#### 1. GeometryOSApplication (Main Kernel)
- **File**: [`application.js`](application.js)
- **Purpose**: Main entry point that orchestrates all systems
- **Features**:
  - Initializes PixiJS application
  - Creates scene graph with world container
  - Manages component lifecycle
  - Renders Antigravity Prime at (819200, 819200)

#### 2. ViewportManager (Camera System)
- **File**: [`viewport_manager.js`](viewport_manager.js)
- **Purpose**: Manages camera tracking and viewport calculations
- **Features**:
  - Camera position and zoom tracking
  - World-to-screen and screen-to-world coordinate conversion
  - Viewport bounds calculation for culling
  - Smooth camera interpolation
  - WebSocket camera sync with compositor
  - Mouse/keyboard/touch input handling

#### 3. ChunkManager (Data Loading)
- **File**: [`chunk_manager.js`](chunk_manager.js)
- **Purpose**: Implements viewport-driven chunk loading
- **Features**:
  - Lazy loading: Only fetch visible chunks from server
  - LRU cache: Keep recently used chunks in memory
  - Preloading: Load adjacent chunks before they enter viewport
  - Unloading: Release memory for distant chunks
  - TTL-based cache invalidation

#### 4. SpritePool (Memory Management)
- **File**: [`sprite_pool.js`](sprite_pool.js)
- **Purpose**: Object pooling for PixiJS sprites
- **Features**:
  - Fixed-size pool to prevent memory growth
  - Automatic recycling of off-screen sprites
  - Texture caching to avoid redundant loads
  - Efficient sprite allocation and deallocation

#### 5. SpatialIndex (O(1) Queries)
- **File**: [`spatial_core.js`](spatial_core.js)
- **Purpose**: Foundation for viewport-driven infinite map rendering
- **Features**:
  - O(1) spatial queries using spatial hashing
  - Efficient range queries for viewport culling
  - Memory-efficient sparse storage
  - Quadtree support for hierarchical partitioning

#### 6. LODSystem (Level of Detail)
- **File**: [`lod_system.js`](lod_system.js)
- **Purpose**: Dynamic level of detail rendering
- **Features**:
  - Multiple LOD levels (Full, Medium, Low, Minimal, Semantic)
  - Automatic LOD transitions based on zoom
  - Region texture generation for distant views
  - Performance-optimized rendering

#### 7. InfiniteMapV2 (Main Map Class)
- **File**: [`infinite_map_v2.js`](infinite_map_v2.js)
- **Purpose**: Production-grade infinite map implementation
- **Features**:
  - Integrates all core components
  - Viewport-driven rendering loop
  - Neural activation visualization
  - Security overlay support
  - WebSocket camera sync

#### 8. PixiJSV8Adapter (Browser Compatibility)
- **File**: [`pixi_adapter.js`](pixi_adapter.js)
- **Purpose**: Browser compatibility layer
- **Features**:
  - Wraps standard PixiJS texture loading
  - Provides error texture fallback
  - CORS-aware texture loading

#### 9. WebMCP Bridge (AI Agent Interface)
- **File**: [`webmcp_bridge.js`](webmcp_bridge.js)
- **Purpose**: Model Context Protocol interface for AI agents
- **Features**:
  - 89 WebMCP tools for AI-driven development
  - Navigation, building, and system control
  - Autonomous kernel operation
  - AI project management capabilities
- **Documentation**: [WebMCP Tools Reference](WEBMCP_TOOLS_REFERENCE.md)

## Performance Targets

- **Frame Rate**: 60 FPS (16ms per frame)
- **Latency**: <10ms overhead for chunk loading
- **Memory**: ~50MB for compositor + PixiJS
- **Spatial Queries**: O(1) via spatial hashing
- **Sprite Pool**: Reuses objects to minimize GC

## Getting Started

### Prerequisites

- Python 3.6+ (for mock server)
- Modern web browser (Chrome, Firefox, Safari, Edge)
- PIL/Pillow (for texture generation)

### Installation

1. Install Python dependencies:
```bash
pip install pillow websockets
```

2. Start the mock server:
```bash
python3 systems/visual_shell/web/mock_server.py
```

The mock server provides:
- HTTP API: `http://127.0.0.1:8000`
- WebSocket: `ws://127.0.0.1:8765`

### Running the Application

#### Option 1: Using Python HTTP Server
```bash
cd systems/visual_shell/web
python3 -m http.server 8001
```

Then open: `http://localhost:8001/index.html`

#### Option 2: Using Mock Server (Recommended)
The mock server includes both HTTP and WebSocket support:
```bash
python3 systems/visual_shell/web/mock_server.py
```

Then open: `http://localhost:8000/index.html`

### Custom Ports

You can specify custom ports:
```bash
python3 mock_server.py <http_port> <websocket_port>
```

Example:
```bash
python3 mock_server.py 9000 9001
```

## API Reference

### HTTP API

#### Get Chunk Data
```
GET /api/chunk?x=<chunk_x>&y=<chunk_y>&size=<chunk_size>
```

Response:
```json
{
  "chunkX": 512,
  "chunkY": 512,
  "tiles": {
    "8192,8192": {
      "x": 8192,
      "y": 8192,
      "brick": "system_core",
      "timestamp": 1234567890
    }
  },
  "metadata": {
    "generated_at": 1234567890,
    "version": "1.0"
  }
}
```

#### Get Tile Texture
```
GET /builder/queue/<brick_type>?t=<timestamp>
```

Returns: PNG image

#### Health Check
```
GET /health
```

Response:
```json
{
  "status": "ok"
}
```

### WebSocket API

#### Connect
```
ws://127.0.0.1:8765
```

#### Messages

**Camera Update** (Client → Server)
```json
{
  "type": "camera_update",
  "x": 819200,
  "y": 819200,
  "zoom": 0.5,
  "timestamp": 1234567890
}
```

**Camera Sync** (Server → Client)
```json
{
  "type": "camera_update",
  "x": 819200,
  "y": 819200,
  "zoom": 0.5
}
```

**Heartbeat** (Bidirectional)
```json
{
  "type": "heartbeat",
  "timestamp": 1234567890
}
```

## Brick Types

The system supports the following brick types:

| Brick Type | Color | Description |
|------------|-------|-------------|
| `system_core` | Cyan | Core system components |
| `data_block` | Blue | Data storage blocks |
| `neural_link` | Magenta | Neural network connections |
| `memory_cell` | Yellow | Memory storage cells |
| `processing_unit` | Red | Processing units |
| `storage_sector` | Green | Storage sectors |
| `network_node` | Purple | Network nodes |
| `security_layer` | Orange | Security layers |

## Configuration

### Application Configuration

Edit [`application.js`](application.js) to customize:

```javascript
this.config = {
    gridSize: 100,              // Grid size in pixels
    chunkSize: 16,              // Chunk size in tiles
    backgroundColor: 0x111111,   // Background color
    enableAntigravity: true      // Enable Antigravity Prime
};
```

### Viewport Configuration

Edit [`viewport_manager.js`](viewport_manager.js) to customize:

```javascript
this.config = {
    initialX: 819200,          // Initial camera X
    initialY: 819200,          // Initial camera Y
    initialZoom: 0.5,           // Initial zoom level
    minZoom: 0.1,              // Minimum zoom
    maxZoom: 10.0,             // Maximum zoom
    enableSmoothing: true,       // Enable camera smoothing
    smoothingFactor: 0.1,        // Smoothing factor (0-1)
    websocketUrl: 'ws://127.0.0.1:8765'  // WebSocket URL
};
```

### Chunk Manager Configuration

Edit [`chunk_manager.js`](chunk_manager.js) to customize:

```javascript
this.config = {
    chunkSize: 16,              // Chunk size in tiles
    maxCachedChunks: 64,        // Maximum chunks in cache
    preloadRadius: 1,           // Chunks to preload
    apiEndpoint: '/api/chunk',  // API endpoint
    chunkTTL: 300000           // Chunk TTL in ms (5 minutes)
};
```

## Controls

### Mouse
- **Left Click + Drag**: Pan the map
- **Scroll Wheel**: Zoom in/out

### Keyboard
- **Arrow Keys**: Pan the map
- **+ / -**: Zoom in/out

### Touch
- **One Finger Drag**: Pan the map
- **Pinch**: Zoom in/out

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                   Geometry OS Web Edition                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────────────────────────────────────────────────┐  │
│  │         GeometryOSApplication (Main Kernel)           │  │
│  └───────────────────────────────────────────────────────┘  │
│                           │                                │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              InfiniteMapV2 (Map Manager)             │  │
│  └───────────────────────────────────────────────────────┘  │
│                           │                                │
│  ┌──────────┬──────────┬──────────┬──────────┬──────────┐ │
│  │Viewport  │ Chunk    │ Sprite   │ Spatial  │   LOD    │ │
│  │ Manager  │ Manager  │  Pool    │  Index   │  System  │ │
│  └──────────┴──────────┴──────────┴──────────┴──────────┘ │
│                           │                                │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              PixiJS Rendering Engine                │  │
│  └───────────────────────────────────────────────────────┘  │
│                           │                                │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              Browser Canvas / WebGL                 │  │
│  └───────────────────────────────────────────────────────┘  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    Mock Server (Python)                    │
├─────────────────────────────────────────────────────────────┤
│  ┌──────────────────┐  ┌──────────────────┐             │
│  │   HTTP API       │  │   WebSocket     │             │
│  │   (Port 8000)    │  │   (Port 8765)   │             │
│  └──────────────────┘  └──────────────────┘             │
│           │                      │                          │
│  ┌──────────────────────────────────────────────────┐      │
│  │         Mock Data Generators                   │      │
│  │  - Chunk Data    - Textures                   │      │
│  └──────────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────────────┘
```

## Performance Optimization

### Spatial Indexing
- O(1) queries via spatial hashing
- Efficient viewport culling
- Memory-efficient sparse storage

### Object Pooling
- Reuses PixiJS sprites
- Minimizes garbage collection
- Fixed memory footprint

### Chunk Loading
- Lazy loading of visible chunks
- LRU cache for recently used chunks
- Preloading of adjacent chunks
- TTL-based cache invalidation

### Level of Detail
- Multiple LOD levels
- Automatic transitions
- Region textures for distant views
- Semantic view for extreme zoom-out

## Debugging

### Browser Console

Open the browser console (F12) to see:
- Initialization messages
- Chunk loading status
- Performance metrics
- WebSocket connection status

### Statistics

Access statistics from the browser console:

```javascript
// Get application stats
window.geometryOSApp.getStats();

// Get viewport stats
window.geometryOSApp.viewport.getStats();

// Get chunk manager stats
window.geometryOSApp.chunkManager.getStats();

// Get sprite pool stats
window.geometryOSApp.tileManager.config.spritePool.getStats();
```

## Troubleshooting

### Textures Not Loading

1. Check browser console for CORS errors
2. Ensure mock server is running
3. Verify texture URLs are correct

### WebSocket Connection Failed

1. Ensure mock server is running
2. Check firewall settings
3. Verify WebSocket URL in configuration

### Poor Performance

1. Reduce chunk size in configuration
2. Increase LOD threshold
3. Reduce maximum zoom level
4. Check browser console for warnings

## Documentation Index

| Document | Description |
|----------|-------------|
| [WebMCP Tools Reference](WEBMCP_TOOLS_REFERENCE.md) | Complete reference for 89 WebMCP tools |
| [API Reference](API.md) | Pixel CPU PixiJS integration API |
| [Pixel CPU Usage Guide](PIXEL_CPU_USAGE_GUIDE.md) | Guide for using Pixel CPU features |
| [Pixel Exec Protocol](PIXEL_EXEC_PROTOCOL.md) | Pixel execution protocol specification |
| [WebGPU Integration](WEBGPU_INTEGRATION.md) | WebGPU integration documentation |
| [GPU Native RISC-V Execution](GPU_NATIVE_RISCV_EXECUTION.md) | GPU-accelerated RISC-V execution |
| [Neural Heatmap](NEURAL_HEATMAP_README.md) | Neural activation visualization |
| [Pattern Recognizer](PATTERN_RECOGNIZER_README.md) | Pattern recognition system |
| [Bottleneck Detector](BOTTLENECK_DETECTOR_README.md) | Performance bottleneck detection |
| [Holographic Dict](HOLOGRAPHIC_DICT_README.md) | Holographic dictionary system |
| [GeoScript Spec](GEOSCRIPT_SPEC_V1.md) | GeoScript language specification |
| [PixelLang Specification](PIXELLANG_SPECIFICATION.md) | PixelLang language specification |
| [PixelLang IDE](PIXELLANG_IDE_README.md) | PixelLang IDE documentation |
| [Semantic Token Library](SEMANTIC_TOKEN_LIBRARY_README.md) | Semantic token system |
| [Kernels README](kernels/README.md) | Kernel format and building guide |
| [MMU Architecture](docs/MMU_ARCHITECTURE.md) | Memory management unit architecture |

## Future Enhancements

### Backend Integration
- Connect to Rust infinite_map_rs backend
- Real-time tile updates via WebSocket
- Persistent data storage

### Advanced Features
- Multi-user collaboration
- Real-time synchronization
- Advanced LOD algorithms
- GPU-accelerated rendering

### Performance
- Web Workers for chunk loading
- Service Worker for offline support
- IndexedDB for local caching

## E2E Visual Shell Demo

The E2E demo brings together all visual shell features into one unified experience.

### Quick Start

```bash
# 1. Start all backend services
./start_demo.sh start

# 2. Start web server
cd systems/visual_shell/web
python3 -m http.server 8080

# 3. Open demo in browser
# http://localhost:8080/demo.html
```

### Backend Services

| Service | Port | Purpose |
|---------|------|---------|
| terminal_positions.py | 8765 | Terminal window position persistence |
| git_diff.py | 8766 | Git diff/status/log/blame API |
| shell_bridge.py | 8767 | PTY WebSocket for live shells |
| file_api.py | 8768 | File read/write with backups |

### Demo Features

- **Live Shells**: Real terminal I/O through morphological glyphs
- **Code Viewer**: Read-only code with syntax highlighting
- **Code Editor**: Full editing with undo/redo, auto-save
- **Infinite Canvas**: Pan/zoom navigation with minimap
- **Window Particles**: NEB-registered draggable windows
- **Command Palette**: Quick actions (Ctrl+P)

### Managing Services

```bash
./start_demo.sh start    # Start all services
./start_demo.sh status   # Check service status
./start_demo.sh logs     # View logs
./start_demo.sh stop     # Stop all services
./start_demo.sh restart  # Restart all services
```

### Test Pages

| Page | URL | Description |
|------|-----|-------------|
| E2E Demo | `/demo.html` | Full integrated demo |
| Terminal Manager | `/test_terminal_manager.html` | Multi-terminal test |
| Live Shell | `/test_live_shell.html` | Shell bridge test |
| Code Viewer | `/test_code_viewer.html` | Code viewing test |
| Code Editor | `/test_code_editor.html` | Code editing test |
| Infinite Map | `/test_infinite_map.html` | Window particles test |

## License

This project is part of the Geometry OS ecosystem.

## Contributing

Contributions are welcome! Please ensure:
- Code follows existing patterns
- All features are tested
- Documentation is updated

## Support

For issues and questions:
1. Check the troubleshooting section
2. Review browser console logs
3. Check mock server logs
4. Open an issue with details

---

**Geometry OS: Web Edition** - The infinite map, now in your browser.
