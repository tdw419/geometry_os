#!/usr/bin/env bash
# Integration test for hot-load: load program B while program A runs
# Requires: daemon running on port 3101
#
# Usage: ./tests/hot_load_integration.sh [PORT]
# 
# What it does:
#   1. Load program A (LDI r0 42, HALT) via POST /api/v1/programs
#   2. Dispatch one frame so A runs
#   3. Verify A produced correct result (r0=42)
#   4. Load program B (LDI r1 99, HALT) via POST /api/v1/hot-load 
#   5. Dispatch one frame so B runs
#   6. Verify B produced correct result (r1=99)
#   7. Verify A still has its result (r0=42) -- A was not disturbed

set -euo pipefail

PORT="${1:-3101}"
BASE="http://127.0.0.1:${PORT}"

echo "=== Hot-Load Integration Test ==="
echo "Target: ${BASE}"
echo ""

# Check daemon is up
if ! curl -sf "${BASE}/api/v1/status" > /dev/null 2>&1; then
    echo "FAIL: Daemon not responding at ${BASE}"
    exit 1
fi
echo "OK: Daemon is up"

# Step 1: Load program A
echo ""
echo "--- Step 1: Load program A (LDI r0 42) ---"
RESP_A=$(curl -sf -X POST "${BASE}/api/v1/programs" \
    -H "Content-Type: text/plain" \
    -d "LDI r0 42
HALT")
echo "Response: ${RESP_A}"

VM_A=$(echo "${RESP_A}" | python3 -c "import sys,json; print(json.loads(sys.stdin.read())['vm_id'])")
ADDR_A=$(echo "${RESP_A}" | python3 -c "import sys,json; print(json.loads(sys.stdin.read())['address'])")
echo "Program A: vm_id=${VM_A}, addr=${ADDR_A}"

# Step 2: Dispatch one frame
echo ""
echo "--- Step 2: Dispatch frame (A runs) ---"
curl -sf -X POST "${BASE}/api/v1/dispatch" | python3 -c "
import sys, json
resp = json.loads(sys.stdin.read())
print(f'Frame {resp[\"frame\"]} dispatched')
for vm in resp['vm_results']:
    if vm['cycles'] > 0 or not vm['halted']:
        print(f'  VM {vm[\"vm_id\"]}: cycles={vm[\"cycles\"]} halted={vm[\"halted\"]}')
"

# Step 3: Check A's state
echo ""
echo "--- Step 3: Verify A's result ---"
STATUS=$(curl -sf "${BASE}/api/v1/status")
R0_A=$(echo "${STATUS}" | python3 -c "
import sys, json
status = json.loads(sys.stdin.read())
for vm in status['vm_states']:
    if vm['vm_id'] == ${VM_A}:
        print(vm['regs'][0])
        break
")
echo "VM ${VM_A} r0 = ${R0_A}"
if [ "${R0_A}" = "42" ]; then
    echo "OK: Program A produced r0=42"
else
    echo "FAIL: Expected r0=42, got r0=${R0_A}"
    exit 1
fi

# Step 4: Hot-load program B
echo ""
echo "--- Step 4: Hot-load program B (LDI r1 99) ---"
RESP_B=$(curl -sf -X POST "${BASE}/api/v1/hot-load" \
    -H "Content-Type: text/plain" \
    -d "LDI r1 99
HALT")
echo "Response: ${RESP_B}"

VM_B=$(echo "${RESP_B}" | python3 -c "import sys,json; print(json.loads(sys.stdin.read())['vm_id'])")
ADDR_B=$(echo "${RESP_B}" | python3 -c "import sys,json; print(json.loads(sys.stdin.read())['address'])")
echo "Program B: vm_id=${VM_B}, addr=${ADDR_B}"

# Step 5: Dispatch one frame
echo ""
echo "--- Step 5: Dispatch frame (B runs) ---"
curl -sf -X POST "${BASE}/api/v1/dispatch" | python3 -c "
import sys, json
resp = json.loads(sys.stdin.read())
print(f'Frame {resp[\"frame\"]} dispatched')
for vm in resp['vm_results']:
    if vm['cycles'] > 0 or not vm['halted']:
        print(f'  VM {vm[\"vm_id\"]}: cycles={vm[\"cycles\"]} halted={vm[\"halted\"]}')
"

# Step 6: Check B's state
echo ""
echo "--- Step 6: Verify B's result ---"
STATUS=$(curl -sf "${BASE}/api/v1/status")
R1_B=$(echo "${STATUS}" | python3 -c "
import sys, json
status = json.loads(sys.stdin.read())
for vm in status['vm_states']:
    if vm['vm_id'] == ${VM_B}:
        print(vm['regs'][1])
        break
")
echo "VM ${VM_B} r1 = ${R1_B}"
if [ "${R1_B}" = "99" ]; then
    echo "OK: Program B produced r1=99"
else
    echo "FAIL: Expected r1=99, got r1=${R1_B}"
    exit 1
fi

# Step 7: Verify A was NOT disturbed
echo ""
echo "--- Step 7: Verify A was NOT disturbed ---"
STATUS=$(curl -sf "${BASE}/api/v1/status")
R0_A_AFTER=$(echo "${STATUS}" | python3 -c "
import sys, json
status = json.loads(sys.stdin.read())
for vm in status['vm_states']:
    if vm['vm_id'] == ${VM_A}:
        print(vm['regs'][0])
        break
")
echo "VM ${VM_A} r0 = ${R0_A_AFTER} (should still be 42)"
if [ "${R0_A_AFTER}" = "42" ]; then
    echo "OK: Program A undisturbed"
else
    echo "FAIL: Program A was disturbed! r0=${R0_A_AFTER} instead of 42"
    exit 1
fi

echo ""
echo "=== ALL TESTS PASSED ==="
