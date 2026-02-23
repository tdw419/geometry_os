#!/bin/bash
#
# Test Runner for Geometry OS Map Plugin
#
# Usage: ./run-tests.sh [unit|integration|all]
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Geometry OS Map - Test Runner${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

run_unit_tests() {
    echo -e "${YELLOW}Running Unit Tests...${NC}"
    echo ""

    if [ -f "$PLUGIN_DIR/tests/php/test-core.php" ]; then
        php "$PLUGIN_DIR/tests/php/test-core.php"
        local result=$?
        if [ $result -eq 0 ]; then
            echo -e "${GREEN}✅ Unit tests passed${NC}"
        else
            echo -e "${RED}❌ Unit tests failed${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ test-core.php not found${NC}"
        return 1
    fi
}

run_integration_tests() {
    echo -e "${YELLOW}Running Integration Tests...${NC}"
    echo ""

    if [ -f "$PLUGIN_DIR/tests/php/test-integration.php" ]; then
        php "$PLUGIN_DIR/tests/php/test-integration.php"
        local result=$?
        if [ $result -eq 0 ]; then
            echo -e "${GREEN}✅ Integration tests passed${NC}"
        else
            echo -e "${RED}❌ Integration tests failed${NC}"
            return 1
        fi
    else
        echo -e "${RED}❌ test-integration.php not found${NC}"
        return 1
    fi
}

run_e2e_tests() {
    echo -e "${YELLOW}Running E2E Tests...${NC}"
    echo ""

    # Check if WordPress is running
    if ! curl -s http://localhost:8080 > /dev/null 2>&1; then
        echo -e "${RED}❌ WordPress not running at localhost:8080${NC}"
        echo "   Start with: cd wordpress_zone && ./manage_wp.sh start"
        return 1
    fi

    # Check if visual shell is running
    if ! curl -s http://localhost:8000/application.js > /dev/null 2>&1; then
        echo -e "${YELLOW}⚠️  Visual shell not running, starting it...${NC}"
        cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web
        python3 -m http.server 8000 &
        sleep 2
    fi

    # Run E2E tests if playwright is available
    if command -v npx &> /dev/null; then
        echo -e "${YELLOW}E2E tests require Playwright setup (skipping for now)${NC}"
    else
        echo -e "${YELLOW}E2E tests skipped (npx not available)${NC}"
    fi
}

verify_manual() {
    echo -e "${YELLOW}Manual Verification Checklist:${NC}"
    echo ""

    # Check plugin files
    echo "1. Checking plugin files..."
    local files=(
        "geometry-os-map.php"
        "includes/class-core.php"
        "includes/class-shortcode.php"
        "includes/class-block.php"
        "includes/class-settings.php"
        "includes/class-template.php"
        "assets/js/block-editor.js"
        "assets/css/admin.css"
        "templates/full-map-template.php"
    )

    for file in "${files[@]}"; do
        if [ -f "$PLUGIN_DIR/$file" ]; then
            echo -e "   ${GREEN}✅${NC} $file"
        else
            echo -e "   ${RED}❌${NC} $file (missing)"
        fi
    done

    echo ""
    echo "2. Checking servers..."

    # Check WordPress
    if curl -s http://localhost:8080 > /dev/null 2>&1; then
        echo -e "   ${GREEN}✅${NC} WordPress running (localhost:8080)"
    else
        echo -e "   ${RED}❌${NC} WordPress not running"
    fi

    # Check Visual Shell
    if curl -s http://localhost:8000/application.js > /dev/null 2>&1; then
        echo -e "   ${GREEN}✅${NC} Visual Shell running (localhost:8000)"
    else
        echo -e "   ${RED}❌${NC} Visual Shell not running"
    fi

    echo ""
    echo "3. Manual test steps:"
    echo "   [ ] Activate plugin in WordPress Admin → Plugins"
    echo "   [ ] Go to Settings → Geometry OS Map"
    echo "   [ ] Change default height to 800px and save"
    echo "   [ ] Create page with [geometry_os_map] shortcode"
    echo "   [ ] Verify map renders on frontend"
    echo "   [ ] Create page with Geometry OS Map block"
    echo "   [ ] Verify block appears in editor"
    echo "   [ ] Create page with 'Geometry OS Map (Full Screen)' template"
    echo "   [ ] Verify fullscreen map renders"
}

# Main
case "${1:-all}" in
    unit)
        run_unit_tests
        ;;
    integration)
        run_integration_tests
        ;;
    e2e)
        run_e2e_tests
        ;;
    verify)
        verify_manual
        ;;
    all)
        run_unit_tests
        echo ""
        run_integration_tests
        echo ""
        verify_manual
        ;;
    *)
        echo "Usage: $0 [unit|integration|e2e|verify|all]"
        exit 1
        ;;
esac
