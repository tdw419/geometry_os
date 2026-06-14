#!/bin/bash
# Ubuntu Monitor - Detects boot issues, silent on success

set -e

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_DIR=".geometry_os/fs/ubuntu_crashes"
LOG_FILE="${LOG_DIR}/ubuntu_monitor_${TIMESTAMP}.txt"

mkdir -p "${LOG_DIR}"

# Kill existing instances
pkill -f qemu-system-riscv64 || true
sleep 2

# Boot Ubuntu
echo "hypervisor_boot arch=riscv64 kernel=/home/jericho/.geometry_os/fs/linux/rv64/Image ram=256M append=console=ttyS0 root=/dev/vda append=rw disk=/home/jericho/.geometry_os/vmfs/ubuntu_disk.img net=user" | nc -U /tmp/geo_cmd.sock > "${LOG_FILE}" 2>&1

# Wait for boot
sleep 20

# Check for successful boot indicators
if grep -qi "login\|shell\|ubuntu\|root@" "${LOG_FILE}" 2>/dev/null; then
    # Boot successful - silent exit
    echo "hypervisor_kill" | nc -U /tmp/geo_cmd.sock >/dev/null 2>&1
    exit 0
fi

# Check for errors/failures
if grep -qi "panic\|kernel\|error\|failed\|fatal" "${LOG_FILE}" 2>/dev/null; then
    # Boot failed - diagnose with ollama
    ANALYSIS=$(ollama-ask -m qwen2.5-coder:14b -f "${LOG_FILE}" -s "Ubuntu boot failed. Diagnose the error and suggest specific fixes. Max 100 words." 2>&1 || echo "Analysis failed")

    echo "hypervisor_kill" | nc -U /tmp/geo_cmd.sock >/dev/null 2>&1

    # Send alert
    echo "Ubuntu Boot Failed: ${ANALYSIS}"
    exit 1
fi

# Clean up if no clear outcome
echo "hypervisor_kill" | nc -U /tmp/geo_cmd.sock >/dev/null 2>&1
exit 0