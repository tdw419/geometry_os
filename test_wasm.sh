#!/bin/bash
set -e

# Kill any existing daemon
pkill -f gpu_dev_daemon 2>/dev/null || true
sleep 1

# Start daemon in background
echo "Starting daemon..."
./target/release/gpu_dev_daemon &>/tmp/daemon.log 2>&1
DAEMON_PID=$!
echo "Daemon started with PID: $DAEMON_PID"

# Wait for daemon to be ready
echo "Waiting for daemon..."
for i in {1..30}; do
    if curl -s --max-time 1 http://127.0.0.1:8769/status > /dev/null 2>&1; then
        echo "Daemon is ready!"
        break
    fi
    sleep 0.5
done

# Test 1: Check status
echo ""
echo "=== Test 1: Status ==="
curl -s http://127.0.0.1:8769/status
echo ""

# Test 2: Load WASM interpreter glyph to substrate at entry 0
echo ""
echo "=== Test 2: Load WASM interpreter ==="
curl -s -X POST "http://127.0.0.1:8769/load?binary=0x0" \
    --data-binary "@systems/glyph_stratum/programs/wasm_interpreter.rts.png" \
    -H "Content-Type: application/octet-stream"
echo ""

# Test 3: Load WASM binary to linear memory (0x20000)
echo ""
echo "=== Test 3: Load WASM binary ==="
WASM_FILE="systems/glyph_stratum/tests/wasm/host_test/target/wasm32-unknown-unknown/release/deps/wasm_host_test.wasm"
curl -s -X POST "http://127.0.0.1:8769/load?binary=0x20000" \
    --data-binary "@$WASM_FILE" \
    -H "Content-Type: application/octet-stream"
echo ""

# Test 4: Spawn WASM interpreter as VM 2 at entry point 0
echo ""
echo "=== Test 4: Spawn WASM interpreter VM ==="
curl -s -X POST "http://127.0.0.1:8769/chat" \
    -d "spawn 0" \
    -H "Content-Type: text/plain"
echo ""

# Wait for execution
echo ""
echo "=== Waiting for WASM execution ==="
sleep 3

# Test 5: Read substrate at 0x1000 (where WASM should have written 42)
echo ""
echo "=== Test 5: Read substrate at 0x1000 ==="
curl -s "http://127.0.0.1:8769/read?addr=0x1000&len=8" | xxd

# Test 6: Check daemon logs for WASM host function calls
echo ""
echo "=== Test 6: Daemon logs (WASM calls) ==="
grep -i "wasm" /tmp/daemon.log | tail -10 || echo "No WASM logs found"

# Cleanup
echo ""
echo "=== Cleanup ==="
kill $DAEMON_PID 2>/dev/null || true
echo "Done!"
