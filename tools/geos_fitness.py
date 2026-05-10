#!/usr/bin/env python3
import subprocess
import time
import json
import re
import sys
from pathlib import Path

# Paths
WORKDIR = Path(__file__).resolve().parent.parent
CMD_SOCK = "/tmp/geo_cmd.sock"
KERNEL_PATH = WORKDIR / ".geometry_os/build/linux-6.14/vmlinux"
INITRD_PATH = WORKDIR / "initrd.cpio"

def run_command(cmd):
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=10)
        return result.stdout.strip()
    except Exception as e:
        return f"ERROR: {e}"

def get_metrics(timeout_secs=45):
    # 1. Restart service
    subprocess.run("systemctl --user restart geos-blast-shield.service", shell=True)
    time.sleep(2)
    
    # 2. Trigger boot
    boot_args = 'earlycon=sbi console=hvc0 nosmp root=/dev/ram0 init=/sbin/init loglevel=8'
    cmd = f'echo "linux_boot kernel={KERNEL_PATH} initrd={INITRD_PATH} ram=512 bootargs=\\\"{boot_args}\\\"" | socat - UNIX-CONNECT:{CMD_SOCK}'
    subprocess.run(cmd, shell=True)
    
    start_time = time.time()
    max_instr = 0
    last_pc = "0x0"
    kernel_booted = False
    earlycon_active = False
    initrd_mounted = False
    userspace_reached = False
    log_tail = []
    
    # Regex patterns
    re_instr = re.compile(r"Executed (\d+)M instructions.*PC=(0x[0-9A-F]+)")
    re_linux = re.compile(r"Linux version 6\.14\.0")
    re_earlycon = re.compile(r"earlycon: sbi0")
    re_initrd = re.compile(r"Freeing unused kernel image memory") # Signal that initrd should be active
    re_welcome = re.compile(r"WELCOME TO GEOMETRY LINUX")
    
    while time.time() - start_time < timeout_secs:
        output = run_command("journalctl --user -u geos-blast-shield.service --since '1 minute ago' --no-pager")
        lines = output.splitlines()
        log_tail = lines[-20:] # Keep last 20 lines
        
        for line in lines:
            if not kernel_booted and re_linux.search(line): kernel_booted = True
            if not earlycon_active and re_earlycon.search(line): earlycon_active = True
            if not initrd_mounted and re_initrd.search(line): initrd_mounted = True
            if not userspace_reached and re_welcome.search(line): userspace_reached = True
            
            instr_match = re_instr.search(line)
            if instr_match:
                val = int(instr_match.group(1))
                if val > max_instr:
                    max_instr = val
                    last_pc = instr_match.group(2)
        
        if userspace_reached:
            break
            
        time.sleep(2)
        
    return {
        "success": kernel_booted,
        "instructions_m": max_instr,
        "last_pc": last_pc,
        "kernel_booted": kernel_booted,
        "earlycon_active": earlycon_active,
        "initrd_mounted": initrd_mounted,
        "userspace_reached": userspace_reached,
        "timestamp": time.time(),
        "log_tail": log_tail
    }

if __name__ == "__main__":
    timeout = 45
    if len(sys.argv) > 1:
        timeout = int(sys.argv[1])
    
    metrics = get_metrics(timeout)
    print(json.dumps(metrics, indent=2))
