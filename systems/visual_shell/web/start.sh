#!/bin/bash
# Geometry OS Web Edition - Quick Start Script
# This script starts the mock server and opens the application in your browser

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
HTTP_PORT=${1:-8000}
WS_PORT=${2:-8765}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   Geometry OS: Web Edition${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if Python 3 is available
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python 3 is not installed${NC}"
    exit 1
fi

# Check Python version
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
echo -e "${GREEN}✓${NC} Python version: ${PYTHON_VERSION}"

# Check dependencies
echo ""
echo -e "${YELLOW}Checking dependencies...${NC}"

MISSING_DEPS=()

# Check for Pillow
if ! python3 -c "from PIL import Image" 2>/dev/null; then
    MISSING_DEPS+=("pillow")
fi

# Check for websockets
if ! python3 -c "import websockets" 2>/dev/null; then
    MISSING_DEPS+=("websockets")
fi

# Check for aiohttp (for testing)
if ! python3 -c "import aiohttp" 2>/dev/null; then
    MISSING_DEPS+=("aiohttp")
fi

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    echo -e "${RED}✗ Missing dependencies: ${MISSING_DEPS[*]}${NC}"
    echo ""
    echo -e "${YELLOW}Installing missing dependencies...${NC}"
    pip install "${MISSING_DEPS[@]}"
    echo -e "${GREEN}✓${NC} Dependencies installed"
else
    echo -e "${GREEN}✓${NC} All dependencies installed"
fi

echo ""
echo -e "${YELLOW}Starting Geometry OS Mock Server...${NC}"
echo -e "  HTTP API:  http://127.0.0.1:${HTTP_PORT}"
echo -e "  WebSocket: ws://127.0.0.1:${WS_PORT}"
echo ""

# Start the mock server
cd "$SCRIPT_DIR"
python3 mock_server.py "$HTTP_PORT" "$WS_PORT" &
SERVER_PID=$!

# Wait for server to start
echo -e "${YELLOW}Waiting for server to start...${NC}"
sleep 2

# Check if server is running
if ! kill -0 $SERVER_PID 2>/dev/null; then
    echo -e "${RED}Error: Server failed to start${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Server started successfully (PID: $SERVER_PID)"
echo ""

# Open browser
echo -e "${YELLOW}Opening browser...${NC}"
BROWSER_URL="http://127.0.0.1:${HTTP_PORT}/index.html"

# Try to open browser based on OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v xdg-open &> /dev/null; then
        xdg-open "$BROWSER_URL" 2>/dev/null &
    elif command -v firefox &> /dev/null; then
        firefox "$BROWSER_URL" 2>/dev/null &
    elif command -v google-chrome &> /dev/null; then
        google-chrome "$BROWSER_URL" 2>/dev/null &
    elif command -v chromium-browser &> /dev/null; then
        chromium-browser "$BROWSER_URL" 2>/dev/null &
    else
        echo -e "${YELLOW}Could not auto-open browser${NC}"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "$BROWSER_URL" 2>/dev/null &
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]]; then
    start "$BROWSER_URL" 2>/dev/null &
fi

echo -e "${GREEN}✓${NC} Browser opened: ${BROWSER_URL}"
echo ""

# Print instructions
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   Geometry OS is Running${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "  ${GREEN}Application:${NC} ${BROWSER_URL}"
echo -e "  ${GREEN}HTTP API:${NC}     http://127.0.0.1:${HTTP_PORT}"
echo -e "  ${GREEN}WebSocket:${NC}    ws://127.0.0.1:${WS_PORT}"
echo ""
echo -e "${YELLOW}Controls:${NC}"
echo -e "  • Mouse drag: Pan the map"
echo -e "  • Scroll wheel: Zoom in/out"
echo -e "  • Arrow keys: Pan the map"
echo -e "  • +/- keys: Zoom in/out"
echo ""
echo -e "${YELLOW}To stop the server, press Ctrl+C${NC}"
echo ""

# Wait for server process
wait $SERVER_PID
