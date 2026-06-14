#!/bin/bash
# test_ubuntu_boot.sh - Automated Ubuntu RISC-V boot and syscall test
#
# Automates:
# 1. Launch geometry_os in CLI mode
# 2. Boot Ubuntu via hypervisor_boot
# 3. Wait for login prompt (~25s)
# 4. Log in as root
# 5. Run /root/linux_syscalls_test_rv64
# 6. Verify test output
# 7. Shut down cleanly
#
# Usage: ./test_ubuntu_boot.sh [--cleanup-only]

set -e

# Configuration
SOCKET_PATH="/tmp/geo_cmd.sock"
GEO_OS_BIN="./target/release/geometry_os"
GEO_OS_LOG="/tmp/geometry_os_test.log"
KERNEL_PATH="/home/jericho/.geometry_os/fs/linux/rv64/Image"
DISK_PATH="/home/jericho/.geometry_os/vmfs/ubuntu_disk.img"
BOOT_CONFIG="arch=riscv64 kernel=${KERNEL_PATH} ram=256M append=console=ttyS0 root=/dev/vda append=rw disk=${DISK_PATH}"
TEST_BINARY="/root/linux_syscalls_test_rv64"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Cleanup function
cleanup() {
    echo -e "${YELLOW}Cleaning up...${NC}"

    # Kill geometry_os if running
    if [ -n "$GEO_PID" ]; then
        kill "$GEO_PID" 2>/dev/null || true
        wait "$GEO_PID" 2>/dev/null || true
    fi
    pkill -f "geometry_os --cli" 2>/dev/null || true

    # Remove socket
    rm -f "$SOCKET_PATH"

    echo -e "${GREEN}Cleanup complete${NC}"
}

# Trap cleanup on exit
trap cleanup EXIT

# Check if cleanup-only flag
if [ "$1" = "--cleanup-only" ]; then
    cleanup
    echo -e "${GREEN}Cleanup only - exiting${NC}"
    exit 0
fi

echo -e "${GREEN}=== Ubuntu RISC-V Boot and Syscall Test ===${NC}"
echo ""

# Step 1: Build geometry_os if needed
echo -e "${YELLOW}[1/7] Building geometry_os...${NC}"
if [ ! -f "$GEO_OS_BIN" ]; then
    cargo build --release
else
    echo -e "${GREEN}geometry_os already built${NC}"
fi

# Step 2: Clean up any existing geometry_os instance
echo -e "${YELLOW}[2/7] Cleaning up previous instances...${NC}"
pkill -f "geometry_os --cli" 2>/dev/null || true
rm -f "$SOCKET_PATH"
sleep 1

# Step 3: Launch geometry_os in CLI mode
echo -e "${YELLOW}[3/7] Launching geometry_os in CLI mode...${NC}"
"$GEO_OS_BIN" --cli > "$GEO_OS_LOG" 2>&1 &
GEO_PID=$!

# Wait for socket to appear
echo "Waiting for socket to appear..."
for i in {1..10}; do
    if [ -S "$SOCKET_PATH" ]; then
        echo -e "${GREEN}Socket ready at $SOCKET_PATH${NC}"
        break
    fi
    if [ $i -eq 10 ]; then
        echo -e "${RED}ERROR: Socket did not appear${NC}"
        echo "Log output:"
        tail -20 "$GEO_OS_LOG"
        exit 1
    fi
    sleep 1
done

# Step 4: Boot Ubuntu
echo -e "${YELLOW}[4/7] Booting Ubuntu...${NC}"
echo "hypervisor_boot $BOOT_CONFIG" | nc -U "$SOCKET_PATH" | grep -q "Booted"
echo -e "${GREEN}Ubuntu boot command sent${NC}"

# Step 5: Wait for boot to complete
echo -e "${YELLOW}[5/7] Waiting for boot to complete (~25s)...${NC}"
sleep 25

# Step 6: Log in and run test
echo -e "${YELLOW}[6/7] Logging in as root and running syscall tests...${NC}"
echo "hypervisor_input root" | nc -U "$SOCKET_PATH" > /dev/null
sleep 3
echo "hypervisor_input $TEST_BINARY" | nc -U "$SOCKET_PATH" > /dev/null

# Wait for test to finish (longer wait for test execution)
sleep 10

# Step 7: Capture and verify test output
echo -e "${YELLOW}[7/7] Capturing test output...${NC}"
# Try multiple times to get console output (buffer may fill up during boot)
for attempt in {1..3}; do
    TEST_OUTPUT=$(echo "hypervisor_console" | nc -U "$SOCKET_PATH" 2>/dev/null)
    if [ -n "$TEST_OUTPUT" ] && [ "$TEST_OUTPUT" != "[no pending console output]" ]; then
        break
    fi
    if [ $attempt -lt 3 ]; then
        echo "Attempt $attempt: Empty console, retrying in 2s..."
        sleep 2
    fi
done

# Extract test summary - look for the last occurrence
echo ""
echo -e "${GREEN}=== Test Output ===${NC}"
echo "$TEST_OUTPUT" | grep -A 15 "Linux Syscall Test Suite" | tail -20 || true

# Parse results from the output
TOTAL=$(echo "$TEST_OUTPUT" | grep -o "Total: [0-9]*" | head -1 | awk '{print $2}' || echo "0")
PASSED=$(echo "$TEST_OUTPUT" | grep -o "Passed: [0-9]*" | head -1 | awk '{print $2}' || echo "0")
FAILED=$(echo "$TEST_OUTPUT" | grep -o "Failed: [0-9]*" | head -1 | awk '{print $2}' || echo "-1")

echo ""
echo -e "${GREEN}=== Summary ===${NC}"
echo "Total tests: $TOTAL"
echo -e "Passed: ${GREEN}$PASSED${NC}"

if [ "$FAILED" = "0" ] || [ "$FAILED" = "-1" ]; then
    if [ "$TOTAL" = "11" ] && [ "$PASSED" = "11" ]; then
        echo -e "Failed: ${GREEN}$FAILED${NC}"
        echo ""
        echo -e "${GREEN}✓ ALL TESTS PASSED${NC}"
        exit 0
    else
        echo -e "Failed: ${YELLOW}unable to parse${NC}"
        echo "Check full output above for actual results"
        exit 1
    fi
else
    echo -e "Failed: ${RED}$FAILED${NC}"
    echo ""
    echo -e "${RED}✗ TESTS FAILED${NC}"
    echo "Full output:"
    echo "$TEST_OUTPUT"
    exit 1
fi