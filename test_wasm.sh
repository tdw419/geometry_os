#!/bin/bash
set -e

# Kill any existing daemon
pkill -f gpu_dev_daemon 2>/dev/null || true
sleep 1

# Start daemon in background
echo "Starting daemon..."
./target/release/gpu_dev_daemon &>/tmp/daemon.log &
DAEMON_PID=$!
echo "Daemon PID: $DAEMON_PID"

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

# Test 2: Load WASM interpreter glyph to VM 2
echo ""
echo "=== Test 2: Load WASM interpreter ==="
curl -s -X POST "http://127.0.0.1:8769/load?vm=2" \
    -d "systems/glyph_stratum/programs/wasm_interpreter.png"
echo ""

# Test 3: Load WASM binary to linear memory (0x20000)
echo ""
echo "=== Test 3: Load WASM binary ==="
WASM_FILE="systems/glyph_stratum/tests/wasm/host_test/target/wasm32-unknown-unknown/release/deps/wasm_host_test.wasm"
curl -s -X POST "http://127.0.0.1:8769/load?binary=0x20000" \
    --data-binary "@$WASM_FILE" \
    -H "Content-Type: application/octet-stream"
echo ""

# Test 4: Set entry point for WASM interpreter
# WASM interpreter expects entry point in WASM_IP_ADDR (0x30004)
# The _start function in WASM is typically at offset 0 in the code section
echo ""
echo "=== Test 4: Set WASM IP ==="
curl -s "http://127.0.0.1:8769/poke?addr=0x30004&value=0x0"
echo ""

# Test 5: Set WASM status to running (0x3000C = 1)
echo ""
echo "=== Test 5: Start WASM interpreter ==="
curl -s "http://127.0.0.1:8769/poke?addr=0x3000C&value=0x1"
echo ""

# Wait for WASM to execute
echo ""
echo "=== Waiting for WASM execution ==="
sleep 2

# Test 6: Read substrate at 0x1000 (where WASM should have written 42)
echo ""
echo "=== Test 6: Read substrate at 0x1000 ==="
curl -s "http://127.0.0.1:8769/read?addr=0x1000&len=8" | xxd

# Test 7: Check daemon logs for WASM host function calls
echo ""
echo "=== Test 7: Daemon logs (WASM calls) ==="
grep -i "wasm" /tmp/daemon.log | tail -10 || echo "No WASM logs found"

# Cleanup
echo ""
echo "=== Cleanup ==="
kill $DAEMON_PID 2>/dev/null || true
echo "Done!"
