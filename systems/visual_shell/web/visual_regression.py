#!/usr/bin/env python3
"""
Visual Regression Testing for Geometry OS Visual Shell

Usage:
    python visual_regression.py baseline   # Capture baseline screenshots
    python visual_regression.py compare    # Compare current vs baseline
    python visual_regression.py ci         # Run in CI mode (exit 1 on diff)
"""

import subprocess
import json
import sys
from pathlib import Path
from datetime import datetime
import hashlib

# Try to import pixelmatch
try:
    from pixelmatch import pixelmatch
    from PIL import Image
    PIXELMATCH_AVAILABLE = True
except ImportError:
    PIXELMATCH_AVAILABLE = False

BASELINE_DIR = Path(__file__).parent / "visual_baselines"
CURRENT_DIR = Path(__file__).parent / "visual_current"
DIFF_DIR = Path(__file__).parent / "visual_diffs"
REPORT_FILE = Path(__file__).parent / "visual_regression_report.json"

# Viewports to test
VIEWPORTS = [
    {"name": "desktop", "width": 1920, "height": 1080},
    {"name": "tablet", "width": 768, "height": 1024},
    {"name": "mobile", "width": 375, "height": 667},
]

# Scenarios to capture
SCENARIOS = [
    {"name": "infinite_map_default", "url": "http://localhost:8000/systems/visual_shell/web/index.html", "wait": 2},
    {"name": "infinite_map_zoomed", "url": "http://localhost:8000/systems/visual_shell/web/index.html?zoom=2", "wait": 2},
    {"name": "test_page", "url": "http://localhost:8000/systems/visual_shell/web/test_webmcp_bridge.html", "wait": 1},
]


def check_chrome_debug():
    """Check if Chrome is running with remote debugging."""
    import urllib.request
    try:
        urllib.request.urlopen("http://localhost:9222/json/version")
        return True
    except:
        return False


def capture_screenshot(url: str, output_path: Path, width: int, height: int, wait: float = 2):
    """Capture screenshot via Chrome DevTools Protocol."""
    import urllib.request
    import json
    import time
    
    # Get current tab or create new one
    tabs = json.loads(urllib.request.urlopen("http://localhost:9222/json").read())
    
    # Find or create tab with URL
    tab = None
    for t in tabs:
        if t.get("url", "").startswith("http://localhost:8000"):
            tab = t
            break
    
    if not tab:
        # Create new tab
        tab = json.loads(urllib.request.urlopen(f"http://localhost:9222/json/new?{url}").read())
        time.sleep(wait)
    else:
        # Navigate existing tab
        ws_url = tab["webSocketDebuggerUrl"]
        # For simplicity, just use the tab
        pass
    
    # Capture screenshot
    screenshot_url = f"http://localhost:9222/screenshot"
    # Note: This is simplified - real implementation would use WebSocket for CDP
    
    # Alternative: Use puppeteer/playwright if available
    result = subprocess.run([
        "node", "-e", f"""
const puppeteer = require('puppeteer');
(async () => {{
    const browser = await puppeteer.connect('http://localhost:9222');
    const pages = await browser.pages();
    const page = pages[0] || await browser.newPage();
    await page.setViewport({{ width: {width}, height: {height} }});
    await page.goto('{url}', {{ waitUntil: 'networkidle0' }});
    await new Promise(r => setTimeout(r, {int(wait * 1000)}));
    await page.screenshot({{ path: '{output_path}', fullPage: false }});
    console.log('Screenshot saved');
}})().catch(console.error);
"""
    ], capture_output=True, text=True)
    
    return result.returncode == 0


def compare_images(baseline: Path, current: Path, diff: Path, threshold: float = 0.1) -> dict:
    """Compare two images and return diff metrics."""
    if not PIXELMATCH_AVAILABLE:
        return {"error": "pixelmatch not installed", "diff_pixels": 0}
    
    img_a = Image.open(baseline)
    img_b = Image.open(current)
    
    if img_a.size != img_b.size:
        return {"error": "Size mismatch", "diff_pixels": -1}
    
    diff_img = Image.new("RGBA", img_a.size)
    
    diff_pixels = pixelmatch(
        list(img_a.getdata()),
        list(img_b.getdata()),
        list(diff_img.getdata()),
        img_a.width,
        img_a.height,
        threshold=threshold
    )
    
    diff_img.save(diff)
    
    total_pixels = img_a.width * img_a.height
    diff_percent = (diff_pixels / total_pixels) * 100
    
    return {
        "diff_pixels": diff_pixels,
        "total_pixels": total_pixels,
        "diff_percent": round(diff_percent, 2),
        "passed": diff_percent < 1.0  # 1% threshold
    }


def run_baseline():
    """Capture baseline screenshots."""
    BASELINE_DIR.mkdir(exist_ok=True)
    
    if not check_chrome_debug():
        print("ERROR: Chrome not running with remote debugging on port 9222")
        print("Run: ./debug_chrome.sh")
        return 1
    
    results = []
    for scenario in SCENARIOS:
        for viewport in VIEWPORTS:
            name = f"{scenario['name']}_{viewport['name']}"
            output = BASELINE_DIR / f"{name}.png"
            
            print(f"Capturing baseline: {name}")
            success = capture_screenshot(
                scenario["url"],
                output,
                viewport["width"],
                viewport["height"],
                scenario["wait"]
            )
            results.append({"name": name, "success": success})
    
    print(f"\nCaptured {len(results)} baseline screenshots")
    return 0


def run_compare():
    """Compare current screenshots against baseline."""
    CURRENT_DIR.mkdir(exist_ok=True)
    DIFF_DIR.mkdir(exist_ok=True)
    
    if not check_chrome_debug():
        print("ERROR: Chrome not running with remote debugging")
        return 1
    
    report = {
        "timestamp": datetime.now().isoformat(),
        "results": [],
        "passed": 0,
        "failed": 0
    }
    
    for scenario in SCENARIOS:
        for viewport in VIEWPORTS:
            name = f"{scenario['name']}_{viewport['name']}"
            baseline = BASELINE_DIR / f"{name}.png"
            current = CURRENT_DIR / f"{name}.png"
            diff = DIFF_DIR / f"{name}_diff.png"
            
            if not baseline.exists():
                print(f"SKIP: No baseline for {name}")
                continue
            
            print(f"Comparing: {name}")
            capture_screenshot(
                scenario["url"],
                current,
                viewport["width"],
                viewport["height"],
                scenario["wait"]
            )
            
            if current.exists():
                result = compare_images(baseline, current, diff)
                result["name"] = name
                report["results"].append(result)
                
                if result.get("passed"):
                    report["passed"] += 1
                    print(f"  ✓ PASSED ({result.get('diff_percent', 0)}%)")
                else:
                    report["failed"] += 1
                    print(f"  ✗ FAILED ({result.get('diff_percent', 0)}%)")
    
    # Save report
    with open(REPORT_FILE, "w") as f:
        json.dump(report, f, indent=2)
    
    print(f"\nResults: {report['passed']} passed, {report['failed']} failed")
    print(f"Report: {REPORT_FILE}")
    
    return 0 if report["failed"] == 0 else 1


def run_ci():
    """Run in CI mode - exit with error code on failures."""
    return run_compare()


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 1
    
    command = sys.argv[1]
    
    if command == "baseline":
        return run_baseline()
    elif command == "compare":
        return run_compare()
    elif command == "ci":
        return run_ci()
    else:
        print(f"Unknown command: {command}")
        return 1


if __name__ == "__main__":
    sys.exit(main())
