# gos-term - Geometry OS Web Terminal Client

A command-line tool for executing commands through the Geometry OS Web Terminal WebSocket bridge.

## Installation

### Prerequisites

- Python 3.8+
- `websockets` package

Install the websockets package:

```bash
pip install websockets
```

### Setup

The `gos-term` wrapper script is located at:

```
systems/visual_shell/api/gos-term
```

Make it executable:

```bash
chmod +x systems/visual_shell/api/gos-term
```

For convenient access, you can add an alias to your shell:

```bash
alias gos-term='/path/to/geometry_os/systems/visual_shell/api/gos-term'
```

Or add the directory to your PATH:

```bash
export PATH="$PATH:/path/to/geometry_os/systems/visual_shell/api"
```

## Starting the Terminal Bridge

gos-term requires the terminal WebSocket bridge to be running:

```bash
python3 systems/visual_shell/api/terminal_websocket_bridge.py
```

For a custom port:

```bash
python3 systems/visual_shell/api/terminal_websocket_bridge.py --port 8770
```

## Usage

### Basic Command Execution

```bash
# Execute a single command
gos-term echo "Hello, Geometry OS!"

# List files
gos-term ls -la

# Run with pipes
gos-term sh -c "cat /etc/hostname | tr 'a-z' 'A-Z'"
```

### Interactive Mode

Start an interactive terminal session:

```bash
gos-term -i
```

Exit with `Ctrl+D` or type `exit`.

### Custom Port

Connect to a bridge on a different port:

```bash
gos-term -p 8770 echo "Connected to custom port"
```

### Timeout Control

Adjust command timeout (default: 10 seconds):

```bash
# Allow 30 seconds for long-running commands
gos-term --timeout 30 find / -name "*.py"
```

### NEB Event Publishing

Publish command events to the Neural Event Bus:

```bash
# Publishes to topic: gos.term.command
gos-term --neb echo "This command is broadcast to NEB"
```

## Command Reference

| Option | Short | Description | Default |
|--------|-------|-------------|---------|
| `--interactive` | `-i` | Start interactive terminal session | off |
| `--port PORT` | `-p PORT` | WebSocket port | 8769 |
| `--timeout SEC` | | Command timeout in seconds | 10.0 |
| `--neb` | | Publish commands to NEB event bus | off |
| `--help` | `-h` | Show help message | - |

## Examples

### Quick System Check

```bash
# Check current directory
gos-term pwd

# View system info
gos-term uname -a

# Check disk usage
gos-term df -h
```

### Development Workflow

```bash
# Run tests
gos-term python -m pytest tests/ -v

# Check code style
gos-term flake8 src/

# Build a project
gos-term make build
```

### Scripting

Use gos-term in shell scripts for remote command execution:

```bash
#!/bin/bash
# deploy.sh - Deploy via gos-term

gos-term git pull origin main
gos-term pip install -r requirements.txt
gos-term python manage.py migrate
gos-term systemctl restart myapp
```

## Error Handling

gos-term provides clear error messages:

- **Connection refused**: Terminal bridge not running. Start it with the command shown.
- **Timeout**: Command took too long. Increase with `--timeout`.
- **Missing websockets**: Install with `pip install websockets`.

## Architecture

```
+-------------+     WebSocket      +-------------------+
|  gos-term   | -----------------> | Terminal Bridge   |
|  (CLI)      |     ws://localhost | (PTY + WebSocket) |
+-------------+       :8769        +-------------------+
                                         |
                                         v
                                    +----------+
                                    |  Shell   |
                                    |  (bash)  |
                                    +----------+
```

## Related Files

- `gos_term_cli.py` - Python CLI implementation
- `gos-term` - Shell wrapper script
- `terminal_websocket_bridge.py` - WebSocket server
- `tests/test_gos_term_cli.py` - Unit and integration tests

## License

Part of Geometry OS.
