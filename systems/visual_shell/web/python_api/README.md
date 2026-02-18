# Neural Heatmap Python API

Complete Python API wrapper for the Neural Heatmap visualization system.

Part of Neural Heatmap Phase 2.3 - Python API Expansion.

## Installation

### Requirements

- Python 3.8+
- Neural Heatmap server running on `http://localhost:8080`

### Install Dependencies

```bash
pip install -r requirements.txt
```

## Quick Start

### Basic Usage

```python
from neural_heatmap import NeuralHeatmapClient, connect

# Connect to server
client = await connect("http://localhost:8080")

# Get correlation matrix
matrix = await client.get_correlation_matrix()
print(f"Correlation matrix: {len(matrix.matrix)}x{len(matrix.matrix[0])}")

# Apply filter
await client.set_filter(layer_ids=["layer1", "layer2"])

# Get temporal patterns
patterns = await client.get_temporal_patterns()

# Export data
await client.export_correlation_matrix("correlation.csv")

# Disconnect
await client.disconnect()
```

### Real-Time Updates

```python
from neural_heatmap import NeuralHeatmapClient

async with NeuralHeatmapClient("http://localhost:8080") as client:
    # Subscribe to heatmap updates
    await client.subscribe_heatmap()

    # Stream updates
    async for update in client.stream_updates():
        print(f"Update: {update}")
```

## API Reference

### Main Client

#### `NeuralHeatmapClient(url, ws_url=None, auto_connect=False)`

Main API client for Neural Heatmap.

**Parameters:**
- `url` (str): Base URL of the Neural Heatmap server
- `ws_url` (str, optional): WebSocket URL (defaults to ws://<host>/ws)
- `auto_connect` (bool): Automatically connect on initialization

**Methods:**

##### Connection

- `connect()` - Connect to the server
- `disconnect()` - Disconnect from the server

##### Correlation Matrix

- `get_correlation_matrix(model_ids=None, layer_ids=None, as_dataframe=False)` - Get correlation matrix
- `download_correlation_matrix(filepath, model_ids=None, layer_ids=None)` - Download to file
- `export_correlation_matrix(filename, format=ExportFormat.CSV)` - Server-side export

##### Temporal Patterns

- `get_temporal_patterns(model_id=None, time_window=None, pattern_types=None)` - Get temporal patterns
- `get_temporal_statistics(model_id=None)` - Get temporal statistics

##### Anomaly Detection

- `get_anomalies(severity=None, limit=None, model_id=None)` - Get detected anomalies
- `download_anomalies(filepath, severity=None, limit=None)` - Download to file

##### Filters

- `set_filter(model_ids=None, layer_ids=None, intensity_range=None, spatial_bounds=None, time_range=None)` - Set data filter
- `clear_filter()` - Clear all filters

##### Theme and Layout

- `set_theme(theme)` - Set visualization theme
- `set_layout(layout)` - Set layout configuration
- `get_layout()` - Get current layout

##### Multi-Model Comparison

- `compare_models(model_ids, metrics=None)` - Compare multiple models

##### WebSocket Streaming

- `subscribe_heatmap()` - Subscribe to heatmap updates
- `subscribe_correlations()` - Subscribe to correlation updates
- `subscribe_temporal()` - Subscribe to temporal pattern updates
- `subscribe_anomalies()` - Subscribe to anomaly detection updates
- `stream_updates(message_types=None)` - Stream real-time updates

##### Export

- `export_tensorboard(output_dir, run_name)` - Export for TensorBoard
- `export_all(output_dir, formats=None)` - Export all data in multiple formats

### WebSocket Client

#### `NeuralHeatmapWebSocketClient(url, reconnect=True, reconnect_delay=5.0, max_retries=10)`

WebSocket client for real-time data streaming.

**Methods:**

- `connect()` - Connect to WebSocket server
- `disconnect()` - Disconnect from server
- `subscribe_heatmap()` - Subscribe to heatmap updates
- `subscribe_correlations()` - Subscribe to correlation updates
- `subscribe_temporal()` - Subscribe to temporal pattern updates
- `subscribe_anomalies()` - Subscribe to anomaly detection updates
- `listen()` - Iterate over incoming messages
- `on(message_type, callback)` - Register a callback
- `off(message_type, callback=None)` - Unregister a callback

## Data Types

### `CorrelationMatrix`

```python
@dataclass
class CorrelationMatrix:
    matrix: List[List[float]]
    labels: List[str]
    timestamp: float
    metadata: Dict[str, Any]
```

### `TemporalPattern`

```python
@dataclass
class TemporalPattern:
    pattern_type: str  # 'periodic', 'trend', 'state_change'
    frequency: Optional[float]
    amplitude: Optional[float]
    phase: Optional[float]
    confidence: float
    start_time: Optional[float]
    end_time: Optional[float]
    metadata: Dict[str, Any]
```

### `Anomaly`

```python
@dataclass
class Anomaly:
    anomaly_type: str
    severity: str  # 'low', 'medium', 'high', 'critical'
    timestamp: float
    location: Optional[Dict[str, float]]
    layer: Optional[str]
    model_id: Optional[str]
    score: float
    description: str
    metadata: Dict[str, Any]
```

## Jupyter Notebooks

The `jupyter_examples/` directory contains interactive tutorials:

1. **01_getting_started.ipynb** - Basic connection and queries
2. **02_correlation_analysis.ipynb** - Download and analyze correlations
3. **03_temporal_patterns.ipynb** - Time series visualization
4. **04_anomaly_detection.ipynb** - Export and analyze anomalies
5. **05_custom_workflows.ipynb** - Combine multiple operations

## Examples

### Correlation Analysis

```python
import asyncio
from neural_heatmap import connect

async def analyze_correlations():
    async with await connect("http://localhost:8080") as client:
        # Get correlation as DataFrame
        df = await client.get_correlation_matrix(as_dataframe=True)

        # Find strong correlations
        strong_corr = df[df > 0.7].stack().reset_index()
        print(strong_corr)

asyncio.run(analyze_correlations())
```

### Temporal Pattern Detection

```python
async def detect_patterns():
    async with await connect("http://localhost:8080") as client:
        # Get temporal patterns
        patterns = await client.get_temporal_patterns()

        # Analyze periodic patterns
        periodic = [p for p in patterns if p.pattern_type == 'periodic']
        for p in periodic:
            print(f"Frequency: {p.frequency} Hz, Confidence: {p.confidence}")

asyncio.run(detect_patterns())
```

### Real-Time Monitoring

```python
async def monitor_anomalies():
    async with await connect("http://localhost:8080") as client:
        # Subscribe to anomaly updates
        await client.subscribe_anomalies()

        # Monitor for critical anomalies
        async for update in client.stream_updates():
            if update.severity == 'critical':
                print(f"CRITICAL: {update.description}")

asyncio.run(monitor_anomalies())
```

## Export Formats

The API supports multiple export formats:

- **CSV** - Comma-separated values (requires pandas)
- **JSON** - JavaScript Object Notation
- **TensorBoard** - For TensorBoard visualization
- **Parquet** - Columnar storage format (requires pyarrow)

## Theme System

Available visualization themes:

- `THERMAL` - Blue to red heat map
- `PLASMA` - Purple to yellow gradient
- `HOLOGRAPHIC` - Cyan with scanlines
- `CONTOUR` - Isoline-based visualization

```python
from neural_heatmap import VisualizationTheme

await client.set_theme(VisualizationTheme.PLASMA)
```

## Error Handling

```python
async def safe_api_call():
    try:
        async with await connect("http://localhost:8080") as client:
            matrix = await client.get_correlation_matrix()
            return matrix
    except Exception as e:
        print(f"Error: {e}")
        return None

asyncio.run(safe_api_call())
```

## Testing

Run the test suite:

```bash
python test_api.py
```

## License

Part of the Geometry OS project.

## Support

For issues and questions, see the main project documentation.
