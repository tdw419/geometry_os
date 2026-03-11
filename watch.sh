#!/bin/bash
# Geometry OS File Watcher
# Automatically runs tests when files change
#
# Usage:
#   ./watch.sh              # Watch all files
#   ./watch.sh --python     # Watch Python files only
#   ./watch.sh --rust       # Watch Rust files only
#   ./watch.sh --fast       # Fast mode (only run affected tests)
#
# Requirements:
#   pip install watchdog pytest-watch
#   cargo install cargo-watch (for Rust)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Default settings
WATCH_MODE="all"
FAST_MODE=false
DEBOUNCE_SECONDS=1
LAST_RUN=0

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --python)
            WATCH_MODE="python"
            shift
            ;;
        --rust)
            WATCH_MODE="rust"
            shift
            ;;
        --fast)
            FAST_MODE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --python    Watch Python files only"
            echo "  --rust      Watch Rust files only"
            echo "  --fast      Only run tests related to changed files"
            echo "  --help      Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check dependencies
check_dependencies() {
    local missing=()
    
    if [[ "$WATCH_MODE" == "python" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        if ! command -v python3 &>/dev/null; then
            missing+=("python3")
        fi
    fi
    
    if [[ "$WATCH_MODE" == "rust" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        if ! command -v cargo &>/dev/null; then
            missing+=("cargo")
        fi
        if ! command -v cargo-watch &>/dev/null; then
            echo -e "${YELLOW}Note: cargo-watch not found. Installing...${RESET}"
            cargo install cargo-watch 2>/dev/null || true
        fi
    fi
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        echo -e "${RED}Missing dependencies: ${missing[*]}${RESET}"
        exit 1
    fi
}

# Run Python tests
run_python_tests() {
    local changed_file="$1"
    local test_target=""
    
    echo -e "${CYAN}$(date '+%H:%M:%S') Running Python tests...${RESET}"
    
    if [[ "$FAST_MODE" == "true" ]] && [[ -n "$changed_file" ]]; then
        # Try to find corresponding test file
        local basename=$(basename "$changed_file" .py)
        local dirname=$(dirname "$changed_file")
        
        # Check for test file in tests/ directory
        if [[ -f "tests/test_${basename}.py" ]]; then
            test_target="tests/test_${basename}.py"
        elif [[ "$dirname" == "tests" ]]; then
            test_target="$changed_file"
        fi
    fi
    
    local start_time=$(date +%s.%N)
    
    if python3 -m pytest ${test_target:-tests} \
        --tb=short \
        --no-header \
        -q \
        -x \
        --ignore=tests/stress \
        2>&1; then
        local end_time=$(date +%s.%N)
        local duration=$(echo "$end_time - $start_time" | bc)
        echo -e "${GREEN}✓ Python tests passed (${duration}s)${RESET}"
    else
        echo -e "${RED}✗ Python tests failed${RESET}"
    fi
}

# Run Rust tests
run_rust_tests() {
    local changed_file="$1"
    
    echo -e "${CYAN}$(date '+%H:%M:%S') Running Rust tests...${RESET}"
    
    local start_time=$(date +%s.%N)
    
    if cd systems/infinite_map_rs && cargo test --all-features --no-fail-fast -q 2>&1; then
        local end_time=$(date +%s.%N)
        local duration=$(echo "$end_time - $start_time" | bc)
        echo -e "${GREEN}✓ Rust tests passed (${duration}s)${RESET}"
    else
        echo -e "${RED}✗ Rust tests failed${RESET}"
    fi
}

# Find related test file for a source file
find_related_test() {
    local source_file="$1"
    local basename=$(basename "$source_file" .py)
    local dirname=$(dirname "$source_file")
    
    # Common test file patterns
    local patterns=(
        "tests/test_${basename}.py"
        "tests/${basename}_test.py"
        "tests/unit/test_${basename}.py"
        "tests/integration/test_${basename}.py"
    )
    
    for pattern in "${patterns[@]}"; do
        if [[ -f "$pattern" ]]; then
            echo "$pattern"
            return
        fi
    done
}

# Watch using inotifywait (Linux)
watch_with_inotify() {
    local dirs=()
    
    if [[ "$WATCH_MODE" == "python" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        dirs+=(systems tests)
    fi
    
    if [[ "$WATCH_MODE" == "rust" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        dirs+=(systems/infinite_map_rs/src)
    fi
    
    echo -e "${BLUE}Watching directories: ${dirs[*]}${RESET}"
    echo -e "${YELLOW}Press Ctrl+C to stop${RESET}"
    echo ""
    
    # Check for inotifywait
    if ! command -v inotifywait &>/dev/null; then
        echo -e "${YELLOW}inotifywait not found, falling back to polling...${RESET}"
        watch_with_polling
        return
    fi
    
    inotifywait -m -r -e modify,create,delete "${dirs[@]}" 2>/dev/null | while read dir event file; do
        # Debounce
        local current_time=$(date +%s)
        if [[ $((current_time - LAST_RUN)) -lt $DEBOUNCE_SECONDS ]]; then
            continue
        fi
        LAST_RUN=$current_time
        
        local full_path="${dir}${file}"
        
        # Skip non-source files
        if [[ ! "$full_path" =~ \.(py|rs)$ ]]; then
            continue
        fi
        
        echo -e "${YELLOW}Change detected: ${full_path}${RESET}"
        
        # Run appropriate tests
        if [[ "$full_path" == *.py ]] && [[ "$WATCH_MODE" != "rust" ]]; then
            run_python_tests "$full_path"
        elif [[ "$full_path" == *.rs ]] && [[ "$WATCH_MODE" != "python" ]]; then
            run_rust_tests "$full_path"
        fi
        
        echo ""
    done
}

# Fallback polling watcher
watch_with_polling() {
    local dirs=()
    
    if [[ "$WATCH_MODE" == "python" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        dirs+=(systems tests)
    fi
    
    if [[ "$WATCH_MODE" == "rust" ]] || [[ "$WATCH_MODE" == "all" ]]; then
        dirs+=(systems/infinite_map_rs/src)
    fi
    
    echo -e "${BLUE}Watching directories (polling mode): ${dirs[*]}${RESET}"
    echo -e "${YELLOW}Press Ctrl+C to stop${RESET}"
    echo ""
    
    # Simple polling implementation
    declare -A file_times
    
    while true; do
        for dir in "${dirs[@]}"; do
            if [[ -d "$dir" ]]; then
                while IFS= read -r -d '' file; do
                    if [[ "$file" =~ \.(py|rs)$ ]]; then
                        local current_time=$(stat -c %Y "$file" 2>/dev/null || echo 0)
                        local last_time="${file_times[$file]:-0}"
                        
                        if [[ $current_time -gt $last_time ]]; then
                            if [[ $last_time -gt 0 ]]; then
                                echo -e "${YELLOW}Change detected: ${file}${RESET}"
                                
                                if [[ "$file" == *.py ]] && [[ "$WATCH_MODE" != "rust" ]]; then
                                    run_python_tests "$file"
                                elif [[ "$file" == *.rs ]] && [[ "$WATCH_MODE" != "python" ]]; then
                                    run_rust_tests "$file"
                                fi
                                
                                echo ""
                            fi
                            file_times[$file]=$current_time
                        fi
                    fi
                done < <(find "$dir" -type f -print0 2>/dev/null)
            fi
        done
        
        sleep 1
    done
}

# Use cargo-watch for Rust only mode
watch_rust_cargo() {
    echo -e "${BLUE}Using cargo-watch for Rust files...${RESET}"
    echo -e "${YELLOW}Press Ctrl+C to stop${RESET}"
    echo ""
    
    cd systems/infinite_map_rs
    cargo watch -x "test --all-features --no-fail-fast" -q
}

# Main
main() {
    echo -e "${BLUE}╔══════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║     Geometry OS File Watcher             ║${RESET}"
    echo -e "${BLUE}╚══════════════════════════════════════════╝${RESET}"
    echo ""
    
    check_dependencies
    
    case "$WATCH_MODE" in
        rust)
            if command -v cargo-watch &>/dev/null; then
                watch_rust_cargo
            else
                watch_with_inotify
            fi
            ;;
        python)
            watch_with_inotify
            ;;
        all)
            watch_with_inotify
            ;;
    esac
}

main
