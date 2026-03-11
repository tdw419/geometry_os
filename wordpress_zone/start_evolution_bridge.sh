#!/bin/bash
#
# WordPress Evolution Bridge Startup Script
#
# Starts the WordPress Evolution Bridge Service which coordinates:
# - Content analysis for improvement proposals
# - Playwright bridge execution (via Visual Bridge WebSocket)
# - Optional Memory Beam synchronization
#
# Prerequisites:
# - Visual Bridge running on port 8768
# - Playwright Bridge (wordpress_bridge_to_live_tile.py) connected
# - WordPress accessible at http://localhost:8080

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Default configuration
WP_URL="${WP_URL:-http://localhost:8080}"
WS_URI="${WS_URI:-ws://localhost:8768}"
INTERVAL="${INTERVAL:-60}"
MIN_CONFIDENCE="${MIN_CONFIDENCE:-0.5}"
VERBOSE="${VERBOSE:-false}"
AUTO_EXECUTE="${AUTO_EXECUTE:-false}"
SINGLE_CYCLE="${SINGLE_CYCLE:-false}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

show_help() {
    cat << EOF
WordPress Evolution Bridge Startup Script

Usage: $(basename "$0") [OPTIONS]

Starts the WordPress Evolution Bridge Service that autonomously analyzes
WordPress content and proposes/executes improvements.

Prerequisites:
  - Visual Bridge running on port 8768
  - Playwright Bridge connected to Visual Bridge
  - WordPress accessible at http://localhost:8080

Options:
  --wp-url URL           WordPress base URL (default: http://localhost:8080)
  --ws-uri URI           Visual Bridge WebSocket URI (default: ws://localhost:8768)
  --interval SECONDS     Cycle interval in seconds (default: 60)
  --min-confidence FLOAT Minimum confidence threshold (default: 0.5)
  --auto-execute         Automatically execute approved proposals (WARNING: modifies content)
  --single-cycle         Run one cycle and exit
  --verbose, -v          Enable verbose logging
  --skip-checks          Skip prerequisite checks
  --help, -h             Show this help message

Environment Variables:
  WP_URL                 WordPress base URL
  WS_URI                 Visual Bridge WebSocket URI
  INTERVAL               Cycle interval in seconds
  MIN_CONFIDENCE         Minimum confidence threshold
  VERBOSE                Enable verbose logging (true/false)
  AUTO_EXECUTE           Auto-execute proposals (true/false)
  SINGLE_CYCLE           Run single cycle mode (true/false)

Examples:
  # Start with defaults
  $(basename "$0")

  # Run a single analysis cycle
  $(basename "$0") --single-cycle

  # Start with verbose logging
  $(basename "$0") --verbose

  # Auto-execute high-confidence proposals
  $(basename "$0") --auto-execute --min-confidence 0.8

  # Custom WordPress URL
  $(basename "$0") --wp-url http://my-wordpress.local

Safety Notes:
  - By default, proposals are NOT auto-executed (auto_execute=false)
  - Use --auto-execute with caution as it modifies WordPress content
  - Always test with --single-cycle first in new environments

EOF
}

check_prerequisites() {
    echo "Checking prerequisites..."
    local errors=0

    # Check Python
    if command -v python3 &> /dev/null; then
        print_status "Python 3 available"
    else
        print_error "Python 3 not found"
        ((errors++))
    fi

    # Check Visual Bridge (port 8768)
    if command -v nc &> /dev/null; then
        if nc -z localhost 8768 2>/dev/null; then
            print_status "Visual Bridge running on port 8768"
        else
            print_warning "Visual Bridge not detected on port 8768"
            print_warning "Start with: python3 systems/visual_shell/api/visual_bridge.py"
        fi
    elif command -v ss &> /dev/null; then
        if ss -tuln | grep -q ":8768"; then
            print_status "Visual Bridge running on port 8768"
        else
            print_warning "Visual Bridge not detected on port 8768"
            print_warning "Start with: python3 systems/visual_shell/api/visual_bridge.py"
        fi
    else
        print_warning "Cannot check Visual Bridge (nc/ss not available)"
    fi

    # Check WordPress accessibility
    if command -v curl &> /dev/null; then
        if curl -s -o /dev/null -w "%{http_code}" "$WP_URL" | grep -q "200\|301\|302"; then
            print_status "WordPress accessible at $WP_URL"
        else
            print_warning "WordPress may not be accessible at $WP_URL"
        fi
    else
        print_warning "Cannot check WordPress (curl not available)"
    fi

    # Check bridge_service.py exists
    if [[ -f "$PROJECT_ROOT/systems/evolution_daemon/wordpress/bridge_service.py" ]]; then
        print_status "Bridge Service module found"
    else
        print_error "Bridge Service module not found"
        print_error "Expected: $PROJECT_ROOT/systems/evolution_daemon/wordpress/bridge_service.py"
        ((errors++))
    fi

    if [[ $errors -gt 0 ]]; then
        print_error "Prerequisites check failed with $errors error(s)"
        return 1
    fi

    echo ""
    return 0
}

start_bridge() {
    local cmd_args=(
        "--wp-url" "$WP_URL"
        "--ws-uri" "$WS_URI"
        "--interval" "$INTERVAL"
        "--min-confidence" "$MIN_CONFIDENCE"
    )

    if [[ "$VERBOSE" == "true" ]]; then
        cmd_args+=("--verbose")
    fi

    if [[ "$AUTO_EXECUTE" == "true" ]]; then
        cmd_args+=("--auto-execute")
    fi

    if [[ "$SINGLE_CYCLE" == "true" ]]; then
        cmd_args+=("--single-cycle")
    fi

    echo "Starting WordPress Evolution Bridge..."
    echo "  WordPress URL: $WP_URL"
    echo "  WebSocket URI: $WS_URI"
    echo "  Interval: ${INTERVAL}s"
    echo "  Min Confidence: $MIN_CONFIDENCE"
    echo "  Auto Execute: $AUTO_EXECUTE"
    echo "  Single Cycle: $SINGLE_CYCLE"
    echo "  Verbose: $VERBOSE"
    echo ""

    cd "$PROJECT_ROOT"
    python3 -m systems.evolution_daemon.wordpress.bridge_service "${cmd_args[@]}"
}

# Parse command line arguments
SKIP_CHECKS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --wp-url)
            WP_URL="$2"
            shift 2
            ;;
        --ws-uri)
            WS_URI="$2"
            shift 2
            ;;
        --interval)
            INTERVAL="$2"
            shift 2
            ;;
        --min-confidence)
            MIN_CONFIDENCE="$2"
            shift 2
            ;;
        --auto-execute)
            AUTO_EXECUTE="true"
            shift
            ;;
        --single-cycle)
            SINGLE_CYCLE="true"
            shift
            ;;
        --verbose|-v)
            VERBOSE="true"
            shift
            ;;
        --skip-checks)
            SKIP_CHECKS=true
            shift
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Main execution
echo "=========================================="
echo "  WordPress Evolution Bridge"
echo "=========================================="
echo ""

if [[ "$SKIP_CHECKS" != "true" ]]; then
    if ! check_prerequisites; then
        print_warning "Prerequisites not fully met. Continue? (y/N)"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

start_bridge
