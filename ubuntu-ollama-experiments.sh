#!/bin/bash
# Ubuntu RISC-V Autodev Loop with Ollama Analysis
# This script boots Ubuntu via Geometry OS hypervisor and uses ollama to analyze results

set -e

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_DIR=".geometry_os/fs/ubuntu_crashes"
LOG_FILE="${LOG_DIR}/ubuntu_exploration_${TIMESTAMP}.txt"
INSIGHTS_FILE=".ubuntu-insights.log"

mkdir -p "${LOG_DIR}"

# Kill any existing QEMU instances
echo "Cleaning up existing instances..." | tee -a "${LOG_FILE}"
pkill -f qemu-system-riscv64 || true
sleep 2

echo "=== Ubuntu RISC-V Boot Experiment ${TIMESTAMP} ===" | tee -a "${LOG_FILE}"
echo "Starting hypervisor boot..." | tee -a "${LOG_FILE}"

# Boot Ubuntu via hypervisor
echo "hypervisor_boot arch=riscv64 kernel=/home/jericho/.geometry_os/fs/linux/rv64/Image ram=256M append=console=ttyS0 root=/dev/vda append=rw disk=/home/jericho/.geometry_os/vmfs/ubuntu_disk.img net=user" | nc -U /tmp/geo_cmd.sock 2>&1 | tee -a "${LOG_FILE}"

# Give time for boot
echo "Waiting for boot..." | tee -a "${LOG_FILE}"
sleep 15

# Check for VM status
echo "Checking VM status..." | tee -a "${LOG_FILE}"
echo "status" | nc -U /tmp/geo_cmd.sock 2>&1 | tee -a "${LOG_FILE}"

# Try to capture some output
sleep 5

# Kill the VM
echo "Cleaning up..." | tee -a "${LOG_FILE}"
echo "hypervisor_kill" | nc -U /tmp/geo_cmd.sock 2>&1 | tee -a "${LOG_FILE}"

# Use ollama to analyze the results if interesting boot patterns detected
if grep -q "kernel\|boot\|panic\|error\|login\|shell" "${LOG_FILE}"; then
    echo "Running ollama analysis on boot results..." | tee -a "${LOG_FILE}"

    ANALYSIS=$(ollama-ask -m qwen2.5-coder:14b -f "${LOG_FILE}" -s "You are analyzing a Ubuntu RISC-V boot attempt in Geometry OS. Focus on:
1. Boot success/failure indicators
2. Console output quality
3. Any errors or hangs
4. Specific Ubuntu features working
5. Suggest improvements for next boot

Keep response concise (max 200 words). Start with 'SUCCESS:', 'PARTIAL:', or 'FAILED:' followed by key findings." 2>&1 || echo "Ollama analysis failed")

    echo "[${TIMESTAMP}] ${ANALYSIS}" >> "${INSIGHTS_FILE}"
    echo "Analysis saved to ${INSIGHTS_FILE}" | tee -a "${LOG_FILE}"
else
    echo "No significant boot patterns detected, skipping ollama analysis" | tee -a "${LOG_FILE}"
fi

echo "Experiment complete. Results in: ${LOG_FILE}" | tee -a "${LOG_FILE}"