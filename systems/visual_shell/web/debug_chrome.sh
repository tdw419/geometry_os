#!/bin/bash
# Geometry OS Visual Shell - Chrome Debug Launcher
# Launches Chrome with remote debugging for MCP integration

set -e

DEBUG_PORT="${1:-9222}"
START_URL="${2:-http://localhost:8000/systems/visual_shell/web/index.html}"
CHROME_BIN="${CHROME_PATH:-google-chrome}"

# Check Chrome exists
if ! command -v "$CHROME_BIN" &> /dev/null; then
    echo "Error: Chrome not found at '$CHROME_BIN'"
    exit 1
fi

# Check port availability
if lsof -Pi :$DEBUG_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "Warning: Port $DEBUG_PORT already in use"
    echo "Connect to existing: http://localhost:$DEBUG_PORT"
    exit 0
fi

echo "========================================"
echo "Geometry OS - Chrome Debug Mode"
echo "========================================"
echo "Port: $DEBUG_PORT"
echo "URL: $START_URL"
echo ""
echo "DevTools Protocol: http://localhost:$DEBUG_PORT/json"
echo ""

exec "$CHROME_BIN" \
    --remote-debugging-port="$DEBUG_PORT" \
    --remote-allow-origins='*' \
    --no-first-run \
    --no-default-browser-check \
    --auto-open-devtools-for-tabs \
    "$START_URL"
