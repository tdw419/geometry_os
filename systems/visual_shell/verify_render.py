#!/usr/bin/env python3
"""
Visual Shell Verification Script

Uses headless browser to verify the Visual Shell renders correctly.
Writes results to .geometry/visual_shell_state.ascii for AI perception.

Usage:
    python3 systems/visual_shell/verify_render.py
"""

import asyncio
import sys
from datetime import datetime
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

# Output file for AI perception
STATE_FILE = Path(".geometry/visual_shell_state.ascii")


def write_state(status: str, details: dict):
    """Write state to ASCII file for zero-cost AI perception."""
    STATE_FILE.parent.mkdir(parents=True, exist_ok=True)

    lines = [
        "# Visual Shell State",
        f"# Generated: {datetime.now().isoformat()}",
        "",
        f"status: {status}",
        f"timestamp: {datetime.now().isoformat()}",
        "",
    ]

    for key, value in details.items():
        if isinstance(value, dict):
            lines.append(f"{key}:")
            for k, v in value.items():
                lines.append(f"  {k}: {v}")
        elif isinstance(value, list):
            lines.append(f"{key}:")
            for item in value:
                lines.append(f"  - {item}")
        else:
            lines.append(f"{key}: {value}")

    STATE_FILE.write_text("\n".join(lines))
    return STATE_FILE


async def verify_with_playwright():
    """Verify Visual Shell using Playwright headless browser."""
    try:
        from playwright.async_api import async_playwright

        async with async_playwright() as p:
            browser = await p.chromium.launch(headless=True)
            page = await browser.new_page()

            # Navigate to Visual Shell
            url = "http://127.0.0.1:8080/"
            response = await page.goto(url, wait_until="networkidle", timeout=10000)

            if not response:
                return "FAILED", {"error": "No response from server"}

            if response.status != 200:
                return "FAILED", {"error": f"HTTP {response.status}"}

            # Check for PixiJS canvas
            canvas = await page.query_selector("canvas")
            if not canvas:
                return "FAILED", {"error": "No canvas element found"}

            # Get page title
            title = await page.title()

            # Check for overlay elements
            overlay = await page.query_selector("#overlay")
            stats = await page.query_selector("#main-stats")

            # Get console errors
            errors = []
            page.on("console", lambda msg: errors.append(msg.text) if msg.type == "error" else None)

            # Wait a moment for render
            await asyncio.sleep(2)

            # Take screenshot
            screenshot_path = Path(".geometry/visual_shell_screenshot.png")
            screenshot_path.parent.mkdir(parents=True, exist_ok=True)
            await page.screenshot(path=str(screenshot_path))

            await browser.close()

            details = {
                "url": url,
                "title": title,
                "canvas_found": canvas is not None,
                "overlay_found": overlay is not None,
                "stats_found": stats is not None,
                "console_errors": len(errors),
                "screenshot": str(screenshot_path),
            }

            if errors:
                details["error_messages"] = errors[:5]

            return "RENDERING", details

    except ImportError:
        return "SKIPPED", {"reason": "Playwright not installed", "hint": "pip install playwright && playwright install chromium"}
    except Exception as e:
        return "ERROR", {"error": str(e)}


async def verify_with_requests():
    """Fallback verification using HTTP requests only."""
    try:
        import urllib.error
        import urllib.request

        url = "http://127.0.0.1:8080/"

        try:
            with urllib.request.urlopen(url, timeout=5) as response:
                html = response.read().decode('utf-8')

                # Check for key elements
                checks = {
                    "pixijs": "pixi" in html.lower(),
                    "canvas": "canvas" in html.lower(),
                    "geometry_os": "geometry" in html.lower() or "GEOMETRY OS" in html,
                    "visual_shell": "visual" in html.lower(),
                }

                details = {
                    "url": url,
                    "http_status": response.status,
                    "content_length": len(html),
                    "checks": checks,
                }

                if all(checks.values()):
                    return "LIKELY_OK", details
                else:
                    return "PARTIAL", details

        except urllib.error.URLError as e:
            return "FAILED", {"error": f"Connection failed: {e.reason}"}

    except Exception as e:
        return "ERROR", {"error": str(e)}


async def main():
    """Main verification entry point."""
    print("Verifying Visual Shell...")

    # Try Playwright first (most accurate)
    status, details = await verify_with_playwright()

    if status == "SKIPPED":
        print("Playwright not available, falling back to HTTP check...")
        status, details = await verify_with_requests()

    # Write state for AI perception
    state_file = write_state(status, details)

    # Print summary
    print(f"\nStatus: {status}")
    print(f"State file: {state_file}")

    if status in ["RENDERING", "LIKELY_OK"]:
        print("\n✅ Visual Shell is operational")
        return 0
    else:
        print("\n❌ Visual Shell verification failed")
        print(f"Details: {details}")
        return 1


if __name__ == "__main__":
    exit(asyncio.run(main()))
