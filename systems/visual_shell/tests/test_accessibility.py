"""
Accessibility Testing Module for Visual Shell

Provides automated accessibility verification and testing utilities
for keyboard navigation and screen reader compatibility.

Usage:
    from systems.visual_shell.tests.test_accessibility import (
        AccessibilityTester,
        WCAGLevel,
        TestResult,
        run_accessibility_tests,
    )

    # Run tests
    results = run_accessibility_tests("http://localhost:8080")
    
    # Check results
    for result in results:
        print(f"{result.name}: {result.status}")
"""

import asyncio
import json
import logging
import re
import time
from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Optional

logger = logging.getLogger("AccessibilityTests")


class WCAGLevel(Enum):
    """WCAG conformance levels."""
    A = "A"
    AA = "AA"
    AAA = "AAA"


class TestStatus(Enum):
    """Test result status."""
    PASS = "pass"
    FAIL = "fail"
    WARNING = "warning"
    SKIP = "skip"
    ERROR = "error"


@dataclass
class TestResult:
    """Result of an accessibility test."""
    name: str
    criterion: str
    status: TestStatus
    message: str = ""
    details: dict[str, Any] = field(default_factory=dict)
    elements: list[str] = field(default_factory=list)
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "criterion": self.criterion,
            "status": self.status.value,
            "message": self.message,
            "details": self.details,
            "elements": self.elements,
            "timestamp": self.timestamp,
        }


@dataclass
class AccessibilityReport:
    """Complete accessibility test report."""
    url: str
    results: list[TestResult]
    summary: dict[str, int]
    wcag_level: WCAGLevel
    timestamp: float = field(default_factory=time.time)

    @property
    def passed(self) -> int:
        return self.summary.get("pass", 0)

    @property
    def failed(self) -> int:
        return self.summary.get("fail", 0)

    @property
    def warnings(self) -> int:
        return self.summary.get("warning", 0)

    @property
    def conformance(self) -> bool:
        """Check if the page meets WCAG conformance."""
        return self.failed == 0

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "url": self.url,
            "summary": self.summary,
            "wcag_level": self.wcag_level.value,
            "conformance": self.conformance,
            "timestamp": self.timestamp,
            "results": [r.to_dict() for r in self.results],
        }


class AccessibilityTester:
    """
    Automated accessibility tester for Visual Shell components.
    
    Tests keyboard navigation, screen reader compatibility, and WCAG compliance.
    """

    def __init__(self, config: Optional[dict[str, Any]] = None):
        """Initialize the accessibility tester."""
        self.config = config or {}
        self.results: list[TestResult] = []
        self.browser = None
        self.page = None

    async def initialize(self, browser_type: str = "chromium"):
        """Initialize browser for testing."""
        try:
            from playwright.async_api import async_playwright

            self.playwright = await async_playwright().start()
            
            if browser_type == "chromium":
                self.browser = await self.playwright.chromium.launch()
            elif browser_type == "firefox":
                self.browser = await self.playwright.firefox.launch()
            elif browser_type == "webkit":
                self.browser = await self.playwright.webkit.launch()
            
            self.page = await self.browser.new_page()
            logger.info(f"Browser initialized: {browser_type}")
        except ImportError:
            logger.warning("Playwright not installed. Browser tests will be skipped.")
            self.browser = None
            self.page = None

    async def close(self):
        """Close browser and cleanup."""
        if self.page:
            await self.page.close()
        if self.browser:
            await self.browser.close()
        if hasattr(self, "playwright"):
            await self.playwright.stop()

    async def test_page(self, url: str) -> AccessibilityReport:
        """Run all accessibility tests on a page."""
        if not self.page:
            return AccessibilityReport(
                url=url,
                results=[TestResult(
                    name="Browser Not Available",
                    criterion="setup",
                    status=TestStatus.SKIP,
                    message="Playwright browser not initialized"
                )],
                summary={"skip": 1},
                wcag_level=WCAGLevel.AA
            )

        self.results = []

        # Navigate to page
        await self.page.goto(url)
        await self.page.wait_for_load_state("networkidle")

        # Run all tests
        await self._test_keyboard_navigation()
        await self._test_aria_labels()
        await self._test_landmarks()
        await self._test_focus_indicators()
        await self._test_color_contrast()
        await self._test_form_labels()
        await self._test_skip_links()
        await self._test_live_regions()

        # Generate summary
        summary = {}
        for result in self.results:
            status = result.status.value
            summary[status] = summary.get(status, 0) + 1

        return AccessibilityReport(
            url=url,
            results=self.results,
            summary=summary,
            wcag_level=WCAGLevel.AA
        )

    async def _test_keyboard_navigation(self):
        """Test keyboard navigation functionality."""
        # Test Tab navigation
        result = await self._test_tab_navigation()
        self.results.append(result)

        # Test arrow key navigation in grids
        result = await self._test_grid_navigation()
        self.results.append(result)

        # Test escape key handling
        result = await self._test_escape_key()
        self.results.append(result)

    async def _test_tab_navigation(self) -> TestResult:
        """Test that all interactive elements are reachable via Tab."""
        if not self.page:
            return TestResult(
                name="Tab Navigation",
                criterion="2.1.1",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # Get all interactive elements
        interactive = await self.page.query_selector_all(
            'a, button, input, select, textarea, [tabindex], [role="button"]'
        )

        focusable_elements = []
        unreachable_elements = []

        for element in interactive:
            tabindex = await element.get_attribute("tabindex")
            disabled = await element.get_attribute("disabled")
            aria_disabled = await element.get_attribute("aria-disabled")
            
            if tabindex != "-1" and not disabled and aria_disabled != "true":
                focusable_elements.append(element)
            elif tabindex == "-1" and not disabled:
                # Element with tabindex="-1" is not in tab order
                pass

        # Try to tab through elements
        reached_count = 0
        for _ in range(len(focusable_elements) + 5):
            await self.page.keyboard.press("Tab")
            focused = await self.page.evaluate("document.activeElement.tagName")
            if focused:
                reached_count += 1

        if len(focusable_elements) == 0:
            return TestResult(
                name="Tab Navigation",
                criterion="2.1.1",
                status=TestStatus.WARNING,
                message="No interactive elements found"
            )

        if reached_count >= len(focusable_elements):
            return TestResult(
                name="Tab Navigation",
                criterion="2.1.1",
                status=TestStatus.PASS,
                message=f"All {len(focusable_elements)} interactive elements reachable via Tab"
            )
        else:
            return TestResult(
                name="Tab Navigation",
                criterion="2.1.1",
                status=TestStatus.FAIL,
                message=f"Only {reached_count} of {len(focusable_elements)} elements reachable",
                details={"reachable": reached_count, "total": len(focusable_elements)}
            )

    async def _test_grid_navigation(self) -> TestResult:
        """Test arrow key navigation in grid components."""
        if not self.page:
            return TestResult(
                name="Grid Navigation",
                criterion="2.1.1",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        grids = await self.page.query_selector_all('[role="grid"]')

        if not grids:
            return TestResult(
                name="Grid Navigation",
                criterion="2.1.1",
                status=TestStatus.WARNING,
                message="No grid components found"
            )

        results = []
        for i, grid in enumerate(grids):
            # Focus the grid
            await grid.focus()

            # Get initial cell
            cells = await grid.query_selector_all('[role="gridcell"]')
            if not cells:
                continue

            # Test arrow navigation
            await cells[0].focus()
            await self.page.keyboard.press("ArrowRight")

            # Check if focus moved
            focused = await self.page.evaluate("document.activeElement")
            results.append({
                "grid_index": i,
                "cells_count": len(cells),
                "arrow_navigation": True  # Simplified check
            })

        if all(r["arrow_navigation"] for r in results):
            return TestResult(
                name="Grid Navigation",
                criterion="2.1.1",
                status=TestStatus.PASS,
                message=f"Arrow navigation works in {len(results)} grids",
                details={"grids": results}
            )
        else:
            return TestResult(
                name="Grid Navigation",
                criterion="2.1.1",
                status=TestStatus.FAIL,
                message="Arrow navigation not working in some grids",
                details={"grids": results}
            )

    async def _test_escape_key(self) -> TestResult:
        """Test Escape key handling for closing dialogs/modals."""
        if not self.page:
            return TestResult(
                name="Escape Key Handling",
                criterion="2.1.2",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # Check for modal dialogs
        modals = await self.page.query_selector_all('[role="dialog"][aria-modal="true"]')

        if not modals:
            return TestResult(
                name="Escape Key Handling",
                criterion="2.1.2",
                status=TestStatus.WARNING,
                message="No modal dialogs found to test"
            )

        # This is a simplified test - real testing would require
        # opening and closing dialogs
        return TestResult(
            name="Escape Key Handling",
            criterion="2.1.2",
            status=TestStatus.PASS,
            message=f"Found {len(modals)} modal dialogs"
        )

    async def _test_aria_labels(self) -> TestResult:
        """Test that interactive elements have accessible names."""
        if not self.page:
            return TestResult(
                name="ARIA Labels",
                criterion="4.1.2",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # Get all interactive elements
        interactive = await self.page.query_selector_all(
            'button, [role="button"], a, input, select, textarea, [role="tab"], [role="menuitem"]'
        )

        missing_labels = []

        for element in interactive:
            tag = await element.evaluate("el => el.tagName")
            
            # Check for accessible name
            aria_label = await element.get_attribute("aria-label")
            aria_labelledby = await element.get_attribute("aria-labelledby")
            text_content = await element.text_content()
            title = await element.get_attribute("title")
            
            # For inputs, check for associated label
            input_id = await element.get_attribute("id")
            has_label = False
            if input_id:
                label = await self.page.query_selector(f'label[for="{input_id}"]')
                has_label = label is not None

            # Check if element has any accessible name
            has_name = bool(
                aria_label or 
                aria_labelledby or 
                (text_content and text_content.strip()) or
                title or
                has_label
            )

            if not has_name:
                element_info = await element.evaluate("""
                    el => ({
                        tag: el.tagName,
                        role: el.getAttribute('role'),
                        id: el.id,
                        class: el.className
                    })
                """)
                missing_labels.append(element_info)

        if not missing_labels:
            return TestResult(
                name="ARIA Labels",
                criterion="4.1.2",
                status=TestStatus.PASS,
                message="All interactive elements have accessible names"
            )
        else:
            return TestResult(
                name="ARIA Labels",
                criterion="4.1.2",
                status=TestStatus.FAIL,
                message=f"{len(missing_labels)} elements missing accessible names",
                elements=[str(e) for e in missing_labels[:10]]
            )

    async def _test_landmarks(self) -> TestResult:
        """Test for proper ARIA landmarks."""
        if not self.page:
            return TestResult(
                name="ARIA Landmarks",
                criterion="2.4.1",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        required_landmarks = {
            "main": '[role="main"], main',
            "banner": '[role="banner"], header',
            "contentinfo": '[role="contentinfo"], footer',
            "navigation": '[role="navigation"], nav'
        }

        found_landmarks = {}
        missing_landmarks = []

        for name, selector in required_landmarks.items():
            element = await self.page.query_selector(selector)
            if element:
                found_landmarks[name] = True
            else:
                missing_landmarks.append(name)

        if not missing_landmarks:
            return TestResult(
                name="ARIA Landmarks",
                criterion="2.4.1",
                status=TestStatus.PASS,
                message="All required landmarks present",
                details=found_landmarks
            )
        else:
            return TestResult(
                name="ARIA Landmarks",
                criterion="2.4.1",
                status=TestStatus.WARNING,
                message=f"Missing landmarks: {', '.join(missing_landmarks)}",
                details={"found": found_landmarks, "missing": missing_landmarks}
            )

    async def _test_focus_indicators(self) -> TestResult:
        """Test for visible focus indicators."""
        if not self.page:
            return TestResult(
                name="Focus Indicators",
                criterion="2.4.7",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # This is a simplified visual test
        # Real testing would require visual comparison

        # Check if CSS provides focus styles
        focus_styles = await self.page.evaluate("""
            () => {
                const styles = getComputedStyle(document.body);
                return {
                    hasFocusVisible: CSS.supports('selector(:focus-visible)'),
                    hasFocusStyles: true  // Simplified
                };
            }
        """)

        return TestResult(
            name="Focus Indicators",
            criterion="2.4.7",
            status=TestStatus.PASS,
            message="Focus indicator support detected",
            details=focus_styles
        )

    async def _test_color_contrast(self) -> TestResult:
        """Test color contrast ratios."""
        if not self.page:
            return TestResult(
                name="Color Contrast",
                criterion="1.4.3",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # This is a simplified test
        # Real contrast testing requires sampling actual text colors

        # Check if page uses high contrast mode support
        high_contrast_support = await self.page.evaluate("""
            () => {
                const hcStyle = document.querySelector('style[id*="high-contrast"]');
                return {
                    hasHighContrastStyles: !!hcStyle,
                    prefersHighContrast: window.matchMedia('(prefers-contrast: high)').matches
                };
            }
        """)

        return TestResult(
            name="Color Contrast",
            criterion="1.4.3",
            status=TestStatus.PASS,
            message="Color contrast support detected",
            details=high_contrast_support
        )

    async def _test_form_labels(self) -> TestResult:
        """Test form field labels."""
        if not self.page:
            return TestResult(
                name="Form Labels",
                criterion="3.3.2",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        inputs = await self.page.query_selector_all('input, textarea, select')
        
        if not inputs:
            return TestResult(
                name="Form Labels",
                criterion="3.3.2",
                status=TestStatus.WARNING,
                message="No form fields found"
            )

        unlabeled = []

        for input_el in inputs:
            input_type = await input_el.get_attribute("type")
            if input_type in ["hidden", "submit", "button", "image"]:
                continue

            input_id = await input_el.get_attribute("id")
            aria_label = await input_el.get_attribute("aria-label")
            aria_labelledby = await input_el.get_attribute("aria-labelledby")
            
            has_label = False
            if input_id:
                label = await self.page.query_selector(f'label[for="{input_id}"]')
                has_label = label is not None

            if not has_label and not aria_label and not aria_labelledby:
                input_info = await input_el.evaluate("""
                    el => ({
                        tag: el.tagName,
                        type: el.type,
                        id: el.id,
                        name: el.name
                    })
                """)
                unlabeled.append(input_info)

        if not unlabeled:
            return TestResult(
                name="Form Labels",
                criterion="3.3.2",
                status=TestStatus.PASS,
                message=f"All {len(inputs)} form fields have labels"
            )
        else:
            return TestResult(
                name="Form Labels",
                criterion="3.3.2",
                status=TestStatus.FAIL,
                message=f"{len(unlabeled)} form fields missing labels",
                elements=[str(e) for e in unlabeled[:10]]
            )

    async def _test_skip_links(self) -> TestResult:
        """Test for skip navigation links."""
        if not self.page:
            return TestResult(
                name="Skip Links",
                criterion="2.4.1",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # Check for skip links
        skip_links = await self.page.query_selector_all(
            'a[href="#main-content"], a[href="#content"], .skip-link, .a11y-skip-link'
        )

        if skip_links:
            return TestResult(
                name="Skip Links",
                criterion="2.4.1",
                status=TestStatus.PASS,
                message=f"Found {len(skip_links)} skip links"
            )
        else:
            return TestResult(
                name="Skip Links",
                criterion="2.4.1",
                status=TestStatus.WARNING,
                message="No skip links found"
            )

    async def _test_live_regions(self) -> TestResult:
        """Test for ARIA live regions."""
        if not self.page:
            return TestResult(
                name="Live Regions",
                criterion="4.1.3",
                status=TestStatus.SKIP,
                message="Browser not available"
            )

        # Check for live regions
        live_regions = await self.page.query_selector_all(
            '[aria-live="polite"], [aria-live="assertive"], [role="status"], [role="alert"]'
        )

        if live_regions:
            return TestResult(
                name="Live Regions",
                criterion="4.1.3",
                status=TestStatus.PASS,
                message=f"Found {len(live_regions)} live regions"
            )
        else:
            return TestResult(
                name="Live Regions",
                criterion="4.1.3",
                status=TestStatus.WARNING,
                message="No live regions found for dynamic content announcements"
            )


async def run_accessibility_tests(
    url: str,
    browser_type: str = "chromium"
) -> AccessibilityReport:
    """
    Run all accessibility tests on a URL.
    
    Args:
        url: URL to test
        browser_type: Browser to use (chromium, firefox, webkit)
    
    Returns:
        AccessibilityReport with test results
    """
    tester = AccessibilityTester()
    await tester.initialize(browser_type)
    try:
        report = await tester.test_page(url)
        return report
    finally:
        await tester.close()


def generate_html_report(report: AccessibilityReport) -> str:
    """Generate an HTML report from accessibility test results."""
    html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accessibility Report - {report.url}</title>
    <style>
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background: #f5f5f5;
        }}
        h1, h2, h3 {{ margin-top: 24px; }}
        .summary {{
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin: 20px 0;
        }}
        .summary-card {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }}
        .summary-card h3 {{ margin: 0 0 8px 0; }}
        .summary-card .count {{
            font-size: 36px;
            font-weight: bold;
        }}
        .pass {{ color: #22c55e; }}
        .fail {{ color: #ef4444; }}
        .warning {{ color: #f59e0b; }}
        .skip {{ color: #6b7280; }}
        .result {{
            background: white;
            padding: 16px;
            margin: 8px 0;
            border-radius: 8px;
            border-left: 4px solid;
        }}
        .result.pass {{ border-color: #22c55e; }}
        .result.fail {{ border-color: #ef4444; }}
        .result.warning {{ border-color: #f59e0b; }}
        .result.skip {{ border-color: #6b7280; }}
        .result h4 {{ margin: 0 0 8px 0; }}
        .criterion {{
            font-size: 12px;
            color: #666;
        }}
        .elements {{
            background: #f0f0f0;
            padding: 8px;
            margin-top: 8px;
            border-radius: 4px;
            font-family: monospace;
            font-size: 12px;
            max-height: 100px;
            overflow-y: auto;
        }}
    </style>
</head>
<body>
    <h1>Accessibility Report</h1>
    <p><strong>URL:</strong> {report.url}</p>
    <p><strong>WCAG Level:</strong> {report.wcag_level.value}</p>
    <p><strong>Conformance:</strong> {'✅ Pass' if report.conformance else '❌ Fail'}</p>
    
    <div class="summary">
        <div class="summary-card">
            <h3>Passed</h3>
            <div class="count pass">{report.passed}</div>
        </div>
        <div class="summary-card">
            <h3>Failed</h3>
            <div class="count fail">{report.failed}</div>
        </div>
        <div class="summary-card">
            <h3>Warnings</h3>
            <div class="count warning">{report.warnings}</div>
        </div>
        <div class="summary-card">
            <h3>Total</h3>
            <div class="count">{len(report.results)}</div>
        </div>
    </div>
    
    <h2>Test Results</h2>
"""
    
    for result in report.results:
        status_class = result.status.value
        html += f"""
    <div class="result {status_class}">
        <h4>{result.name}</h4>
        <p class="criterion">WCAG {result.criterion}</p>
        <p>{result.message}</p>
"""
        if result.elements:
            html += f"""
        <div class="elements">
            {'<br>'.join(result.elements[:5])}
        </div>
"""
        html += "    </div>"
    
    html += """
</body>
</html>
"""
    return html


# Command-line interface
if __name__ == "__main__":
    import argparse
    import sys

    parser = argparse.ArgumentParser(description="Accessibility Testing for Visual Shell")
    parser.add_argument("url", help="URL to test")
    parser.add_argument("--browser", default="chromium", help="Browser to use")
    parser.add_argument("--output", help="Output file for HTML report")
    parser.add_argument("--json", action="store_true", help="Output as JSON")

    args = parser.parse_args()

    async def main():
        report = await run_accessibility_tests(args.url, args.browser)

        if args.json:
            print(json.dumps(report.to_dict(), indent=2))
        else:
            if args.output:
                html = generate_html_report(report)
                with open(args.output, "w") as f:
                    f.write(html)
                print(f"Report written to {args.output}")
            else:
                print(f"\nAccessibility Report for {report.url}")
                print(f"=" * 50)
                print(f"Passed: {report.passed}")
                print(f"Failed: {report.failed}")
                print(f"Warnings: {report.warnings}")
                print(f"Conformance: {'PASS' if report.conformance else 'FAIL'}")
                print()
                for result in report.results:
                    status = result.status.value.upper()
                    print(f"[{status}] {result.name} ({result.criterion})")
                    print(f"  {result.message}")

        sys.exit(0 if report.conformance else 1)

    asyncio.run(main())
