#!/bin/bash
#
# evolution_ctl.sh - Control script for the Evolution Daemon
#
# Usage:
#   ./evolution_ctl.sh start     - Start the daemon
#   ./evolution_ctl.sh stop      - Stop the daemon
#   ./evolution_ctl.sh status    - Check daemon status
#   ./evolution_ctl.sh tail      - Follow daemon logs
#   ./evolution_ctl.sh report    - Generate current status report
#   ./evolution_ctl.sh restart   - Restart the daemon
#   ./evolution_ctl.sh dry-run   - Run in dry-run mode (foreground)
#

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../../../.." && pwd)"
export PYTHONPATH="${PROJECT_ROOT}:${PYTHONPATH}"
DAEMON_SCRIPT="${SCRIPT_DIR}/evolution_daemon.py"
PID_FILE="${SCRIPT_DIR}/evolution_daemon.pid"
STATE_FILE="${SCRIPT_DIR}/evolution_state.json"
HEARTBEAT_FILE="${SCRIPT_DIR}/evolution_heartbeat.json"
LOG_DIR="${SCRIPT_DIR}/logs/evolution"
LOG_FILE="${LOG_DIR}/evolution_daemon.log"

# Default options
INTERVAL=${EVOLUTION_INTERVAL:-300}
MAX_PER_HOUR=${EVOLUTION_MAX_PER_HOUR:-10}
COOLDOWN=${EVOLUTION_COOLDOWN:-300}
TARGET_DIR="${PROJECT_ROOT}/systems/visual_shell"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_info_blue() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

check_daemon_running() {
    if [ -f "$PID_FILE" ]; then
        local pid=$(cat "$PID_FILE")
        if ps -p "$pid" > /dev/null 2>&1; then
            return 0
        else
            # Stale PID file
            rm -f "$PID_FILE"
            return 1
        fi
    fi
    return 1
}

get_pid() {
    if [ -f "$PID_FILE" ]; then
        cat "$PID_FILE"
    else
        echo ""
    fi
}

wait_for_daemon() {
    local max_wait=${1:-30}
    local waited=0
    while [ $waited -lt $max_wait ]; do
        if check_daemon_running; then
            return 0
        fi
        sleep 1
        waited=$((waited + 1))
    done
    return 1
}

wait_for_shutdown() {
    local max_wait=${1:-30}
    local waited=0
    while [ $waited -lt $max_wait ]; do
        if ! check_daemon_running; then
            return 0
        fi
        sleep 1
        waited=$((waited + 1))
    done
    return 1
}

# Commands
cmd_target() {
    local target_file=$1
    if [ -z "$target_file" ]; then
        log_error "Target file not specified"
        exit 1
    fi

    log_info "Redirecting evolution to: $target_file"
    cmd_stop
    sleep 2
    cmd_start "$target_file"
}

cmd_start() {
    local target_file=$1
    log_info "Starting Evolution Daemon..."

    if check_daemon_running; then
        log_warn "Daemon is already running (PID: $(get_pid))"
        return 0
    fi

    # Ensure log directory exists
    mkdir -p "$LOG_DIR"

    # Build target arg if provided
    local target_arg=""
    if [ -n "$target_file" ]; then
        target_arg="--target-file $target_file"
        log_info "Targeting specific file: $target_file"
    fi

    # Start daemon in background
    nohup python3 "$DAEMON_SCRIPT" \
        --interval "$INTERVAL" \
        --max-per-hour "$MAX_PER_HOUR" \
        --cooldown "$COOLDOWN" \
        --target-dir "$TARGET_DIR" \
        $target_arg \
        > /dev/null 2>&1 &

    local pid=$!
    echo $pid > "$PID_FILE"

    # Wait for daemon to start
    sleep 2

    if check_daemon_running; then
        log_info "Evolution Daemon started (PID: $pid)"
        log_info "Heartbeat: $HEARTBEAT_FILE"
        log_info "Logs: $LOG_FILE"
    else
        log_error "Failed to start Evolution Daemon"
        rm -f "$PID_FILE"
        exit 1
    fi
}

cmd_stop() {
    log_info "Stopping Evolution Daemon..."

    if ! check_daemon_running; then
        log_warn "Daemon is not running"
        rm -f "$PID_FILE"
        return 0
    fi

    local pid=$(get_pid)

    # Send SIGTERM for graceful shutdown
    kill -TERM "$pid" 2>/dev/null

    # Wait for graceful shutdown
    if wait_for_shutdown 30; then
        log_info "Evolution Daemon stopped gracefully"
        rm -f "$PID_FILE"
    else
        log_warn "Daemon did not stop gracefully, sending SIGKILL..."
        kill -KILL "$pid" 2>/dev/null
        sleep 1
        rm -f "$PID_FILE"
        log_info "Evolution Daemon stopped (forced)"
    fi
}

cmd_status() {
    log_info_blue "Evolution Daemon Status"
    echo ""

    if check_daemon_running; then
        local pid=$(get_pid)
        echo -e "Status:    ${GREEN}RUNNING${NC}"
        echo "PID:       $pid"
    else
        echo -e "Status:    ${RED}STOPPED${NC}"
    fi

    echo ""

    # Show heartbeat info if available
    if [ -f "$HEARTBEAT_FILE" ]; then
        echo "Heartbeat:"
        python3 -c "
import json
import sys
from datetime import datetime

try:
    with open('$HEARTBEAT_FILE', 'r') as f:
        data = json.load(f)

    print(f\"  Timestamp: {data.get('timestamp', 'N/A')}\")
    print(f\"  Running: {data.get('running', False)}\")
    print(f\"  PID: {data.get('pid', 'N/A')}\")
    print(f\"  Uptime: {data.get('uptime_seconds', 0):.0f}s\")

    state = data.get('state', {})
    print(f\"  Cycles: {state.get('total_cycles', 0)}\")
    print(f\"  Improvements: {state.get('total_improvements', 0)}\")
    print(f\"  Rejections: {state.get('total_rejections', 0)}\")

    orch = data.get('orchestrator', {})
    print(f\"  Phase: {orch.get('phase', 'N/A')}\")
    print(f\"  Orchestrator State: {orch.get('state', 'N/A')}\")

    if state.get('current_target'):
        print(f\"  Current Target: {state.get('current_target')}\")

except Exception as e:
    print(f'  Error reading heartbeat: {e}')
" 2>/dev/null || echo "  (Could not parse heartbeat file)"
    else
        echo "Heartbeat: (not available)"
    fi

    echo ""

    # Show state info if available
    if [ -f "$STATE_FILE" ]; then
        echo "State:"
        python3 -c "
import json
try:
    with open('$STATE_FILE', 'r') as f:
        data = json.load(f)
    print(f\"  Started: {data.get('started_at', 'N/A')}\")
    print(f\"  Last Cycle: {data.get('last_cycle_at', 'N/A')}\")
    print(f\"  Last Improvement: {data.get('last_improvement_at', 'N/A')}\")
    print(f\"  Rate Limit: {len(data.get('recent_improvements', []))} improvements this hour\")
except Exception as e:
    print(f'  Error reading state: {e}')
" 2>/dev/null || echo "  (Could not parse state file)"
    else
        echo "State: (not available)"
    fi
}

cmd_tail() {
    if [ ! -f "$LOG_FILE" ]; then
        log_warn "Log file not found: $LOG_FILE"
        log_info "Daemon may not have started yet, or logs are in a different location"
        exit 1
    fi

    log_info "Following logs (Ctrl+C to exit)..."
    echo ""
    tail -f "$LOG_FILE"
}

cmd_report() {
    log_info "Generating status report..."
    echo ""

    python3 "$DAEMON_SCRIPT" --report 2>/dev/null || {
        log_error "Could not generate report"

        # Fallback to reading files directly
        if [ -f "$HEARTBEAT_FILE" ]; then
            echo "Heartbeat file contents:"
            cat "$HEARTBEAT_FILE"
        fi

        if [ -f "$STATE_FILE" ]; then
            echo ""
            echo "State file contents:"
            cat "$STATE_FILE"
        fi
    }
}

cmd_restart() {
    log_info "Restarting Evolution Daemon..."
    cmd_stop
    sleep 2
    cmd_start
}

cmd_dry_run() {
    log_info "Running Evolution Daemon in dry-run mode (foreground)..."
    log_info "Press Ctrl+C to stop"
    echo ""

    python3 "$DAEMON_SCRIPT" \
        --dry-run \
        --interval "$INTERVAL" \
        --max-per-hour "$MAX_PER_HOUR" \
        --cooldown "$COOLDOWN" \
        --target-dir "$TARGET_DIR"
}

cmd_help() {
    echo "Evolution Daemon Control Script"
    echo ""
    echo "Usage: $0 <command> [options]"
    echo ""
    echo "Commands:"
    echo "  start       Start the daemon in background"
    echo "  stop        Stop the daemon gracefully"
    echo "  status      Check daemon status"
    echo "  tail        Follow daemon logs"
    echo "  report      Generate current status report"
    echo "  restart     Restart the daemon"
    echo "  target      Focus evolution on a specific file"
    echo "  dry-run     Run in dry-run mode (foreground, no changes)"
    echo "  help        Show this help message"
    echo ""
    echo "Environment Variables:"
    echo "  EVOLUTION_INTERVAL     Seconds between cycles (default: 300)"
    echo "  EVOLUTION_MAX_PER_HOUR Max improvements per hour (default: 10)"
    echo "  EVOLUTION_COOLDOWN     Cooldown seconds (default: 300)"
    echo ""
    echo "Files:"
    echo "  PID File:    $PID_FILE"
    echo "  State File:  $STATE_FILE"
    echo "  Heartbeat:   $HEARTBEAT_FILE"
    echo "  Log File:    $LOG_FILE"
}

# Main
case "${1:-help}" in
    start)
        cmd_start
        ;;
    stop)
        cmd_stop
        ;;
    status)
        cmd_status
        ;;
    tail)
        cmd_tail
        ;;
    report)
        cmd_report
        ;;
    restart)
        cmd_restart
        ;;
    dry-run)
        cmd_dry_run
        ;;
    help|--help|-h)
        cmd_help
        ;;
    target)
        cmd_target "$2"
        ;;
    *)
        log_error "Unknown command: $1"
        cmd_help
        exit 1
        ;;
esac
