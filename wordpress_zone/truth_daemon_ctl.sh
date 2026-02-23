#!/bin/bash
# WordPress Truth Daemon Control Script
# Usage: ./truth_daemon_ctl.sh {start|stop|restart|status|tail|report}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DAEMON_SCRIPT="$SCRIPT_DIR/wordpress_truth_daemon.py"
PID_FILE="$SCRIPT_DIR/.truth_daemon.pid"
LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/truth_daemon.log"
DB_FILE="$SCRIPT_DIR/../ctrm_llm_os.db"

start() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "Truth daemon already running (PID: $PID)"
            return 1
        fi
    fi

    mkdir -p "$LOG_DIR"
    echo "Starting WordPress Truth Daemon..."
    cd "$SCRIPT_DIR"
    nohup python3 "$DAEMON_SCRIPT" --verbose >> "$LOG_FILE" 2>&1 &
    echo $! > "$PID_FILE"
    sleep 1
    if ps -p $(cat "$PID_FILE") > /dev/null 2>&1; then
        echo "Started with PID: $(cat $PID_FILE)"
        echo "Logs: $LOG_FILE"
    else
        echo "Failed to start. Check logs: $LOG_FILE"
        rm -f "$PID_FILE"
        return 1
    fi
}

stop() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "Stopping truth daemon (PID: $PID)..."
            kill $PID 2>/dev/null
            sleep 2
            if ps -p $PID > /dev/null 2>&1; then
                kill -9 $PID 2>/dev/null
            fi
            rm -f "$PID_FILE"
            echo "Stopped"
        else
            echo "Daemon not running (stale PID file)"
            rm -f "$PID_FILE"
        fi
    else
        echo "No PID file found - daemon may not be running"
    fi
}

restart() {
    stop
    sleep 2
    start
}

status() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p $PID > /dev/null 2>&1; then
            echo "✅ Truth daemon running (PID: $PID)"
            echo ""
            echo "Recent log entries:"
            tail -5 "$LOG_FILE" 2>/dev/null || echo "No log file"
        else
            echo "❌ Daemon not running (stale PID file exists)"
        fi
    else
        echo "❌ Truth daemon not running"
    fi
}

tail_logs() {
    if [ -f "$LOG_FILE" ]; then
        tail -f "$LOG_FILE"
    else
        echo "No log file found at $LOG_FILE"
    fi
}

report() {
    echo "=== WordPress Truth Daemon Report ==="
    echo ""
    echo "Status:"
    status
    echo ""
    echo "=== Database Statistics ==="
    if [ -f "$DB_FILE" ]; then
        echo "Total truths: $(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM ctrm_truths;" 2>/dev/null || echo 'N/A')"
        echo "WordPress truths: $(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM ctrm_truths WHERE category='wordpress_extracted';" 2>/dev/null || echo 'N/A')"
        echo "High confidence (>0.8): $(sqlite3 "$DB_FILE" "SELECT COUNT(*) FROM ctrm_truths WHERE confidence > 0.8;" 2>/dev/null || echo 'N/A')"
        echo ""
        echo "Recent extractions:"
        sqlite3 "$DB_FILE" "SELECT id, ROUND(confidence,2), substr(statement,1,50) FROM ctrm_truths WHERE category='wordpress_extracted' ORDER BY created_at DESC LIMIT 5;" 2>/dev/null || echo 'N/A'
    else
        echo "Database not found at $DB_FILE"
    fi
    echo ""
    echo "=== Recent Logs ==="
    tail -20 "$LOG_FILE" 2>/dev/null | grep -E "(extracted|truth|ERROR|WARNING)" | tail -10
}

case "${1:-}" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    tail)
        tail_logs
        ;;
    report)
        report
        ;;
    *)
        echo "WordPress Truth Daemon Control"
        echo ""
        echo "Usage: $0 {start|stop|restart|status|tail|report}"
        echo ""
        echo "Commands:"
        echo "  start   - Start the daemon"
        echo "  stop    - Stop the daemon"
        echo "  restart - Restart the daemon"
        echo "  status  - Check daemon status"
        echo "  tail    - Follow log output"
        echo "  report  - Show statistics and recent activity"
        exit 1
        ;;
esac
