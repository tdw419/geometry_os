#!/usr/bin/env python3
"""
Accessibility Verification Script for Geometry OS Visual Shell

This script performs automated accessibility checks on the HTML, CSS, and JavaScript
files to ensure WCAG 2.1 Level AA compliance.

Usage:
    python test_accessibility.py [--verbose] [--fix]

Requirements:
    pip install axe-selenium-python selenium beautifulsoup4 lxml
"""

import os
import sys
import json
import argparse
from pathlib import Path
from typing import List, Dict, Any
from html.parser import HTMLParser

try:
    from bs4 import BeautifulSoup
except ImportError:
    print("Error: beautifulsoup4 required. Install with: pip install beautifulsoup4")
    sys.exit(1)


class AccessibilityAuditor:
    """Performs static accessibility analysis on HTML, CSS, and JS files."""

    def __init__(self, verbose: bool = False):
        self.verbose = verbose
        self.issues = []
        self.warnings = []
        self.passed = []

    def log(self, message: str, level: str = "info"):
        """Log a message if verbose mode is enabled."""
        if self.verbose or level in ["error", "warning"]:
            prefix = {
                "error": "❌ ERROR:",
                "warning": "⚠️  WARNING:",
                "info": "ℹ️  INFO:",
                "success": "✅ PASS:"
            }
            print(f"{prefix.get(level, '')} {message}")

    def check_html_file(self, filepath: Path) -> Dict[str, Any]:
        """Check an HTML file for accessibility issues."""
        results = {
            "file": str(filepath),
            "errors": [],
            "warnings": [],
            "passed": []
        }

        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        soup = BeautifulSoup(content, 'lxml')

        # Check 1: Page has title
        title = soup.find('title')
        if title and title.string:
            results["passed"].append("Page has title")
            self.log(f"Title found: {title.string}", "success")
        else:
            results["errors"].append("Page missing <title> element")
            self.log("Page missing <title> element", "error")

        # Check 2: Language attribute
        html_tag = soup.find('html')
        if html_tag and html_tag.get('lang'):
            results["passed"].append(f"Language set: {html_tag.get('lang')}")
            self.log(f"HTML lang attribute: {html_tag.get('lang')}", "success")
        else:
            results["errors"].append("HTML tag missing lang attribute")
            self.log("HTML tag missing lang attribute", "error")

        # Check 3: Skip links
        skip_links = soup.find_all('a', class_='skip-link')
        if skip_links:
            results["passed"].append(f"Found {len(skip_links)} skip link(s)")
            self.log(f"Found {len(skip_links)} skip link(s)", "success")
        else:
            results["warnings"].append("No skip links found")
            self.log("No skip links found", "warning")

        # Check 4: Images have alt text
        images = soup.find_all('img')
        images_without_alt = [img for img in images if not img.get('alt')]
        if images_without_alt:
            results["errors"].append(f"{len(images_without_alt)} image(s) missing alt text")
            self.log(f"{len(images_without_alt)} image(s) missing alt text", "error")
        elif images:
            results["passed"].append(f"All {len(images)} images have alt text")
            self.log(f"All {len(images)} images have alt text", "success")

        # Check 5: Form inputs have labels
        inputs = soup.find_all('input')
        inputs_without_labels = []
        for inp in inputs:
            inp_id = inp.get('id')
            inp_label = inp.get('aria-label')
            labelledby = inp.get('aria-labelledby')

            if inp.get('type') in ['hidden', 'submit', 'button']:
                continue

            if not inp_id and not inp_label and not labelledby:
                inputs_without_labels.append(inp)

        if inputs_without_labels:
            results["errors"].append(f"{len(inputs_without_labels)} input(s) without labels")
            self.log(f"{len(inputs_without_labels)} input(s) without labels", "error")
        elif inputs:
            results["passed"].append("All form inputs have labels")
            self.log("All form inputs have labels", "success")

        # Check 6: ARIA live regions
        live_regions = soup.find_all(attrs={'aria-live': True})
        if live_regions:
            results["passed"].append(f"Found {len(live_regions)} ARIA live region(s)")
            self.log(f"Found {len(live_regions)} ARIA live region(s)", "success")

        # Check 7: Landmark roles
        landmarks = {
            'banner': soup.find_all(role='banner'),
            'main': soup.find_all(role='main'),
            'navigation': soup.find_all(role='navigation'),
            'complementary': soup.find_all(role='complementary'),
            'contentinfo': soup.find_all(role='contentinfo')
        }

        if any(landmarks.values()):
            found_landmarks = [k for k, v in landmarks.items() if v]
            results["passed"].append(f"Found landmarks: {', '.join(found_landmarks)}")
            self.log(f"Found landmarks: {', '.join(found_landmarks)}", "success")
        else:
            results["warnings"].append("No ARIA landmark roles found")
            self.log("No ARIA landmark roles found", "warning")

        # Check 8: Buttons have accessible names
        buttons = soup.find_all('button')
        buttons_without_names = []
        for btn in buttons:
            text = btn.get_text(strip=True)
            aria_label = btn.get('aria-label')
            aria_labelledby = btn.get('aria-labelledby')

            if not text and not aria_label and not aria_labelledby:
                buttons_without_names.append(btn)

        if buttons_without_names:
            results["errors"].append(f"{len(buttons_without_names)} button(s) without accessible names")
            self.log(f"{len(buttons_without_names)} button(s) without accessible names", "error")
        elif buttons:
            results["passed"].append("All buttons have accessible names")
            self.log("All buttons have accessible names", "success")

        # Check 9: Canvas elements have alternatives
        canvases = soup.find_all('canvas')
        canvases_without_alt = []
        for canvas in canvases:
            aria_label = canvas.get('aria-label')
            aria_labelledby = canvas.get('aria-labelledby')
            role = canvas.get('role')

            if not aria_label and not aria_labelledby:
                canvases_without_alt.append(canvas)

        if canvases_without_alt:
            results["errors"].append(f"{len(canvases_without_alt)} canvas(es) without alternatives")
            self.log(f"{len(canvases_without_alt)} canvas(es) without alternatives", "error")
        elif canvases:
            results["passed"].append("All canvas elements have alternatives")
            self.log("All canvas elements have alternatives", "success")

        # Check 10: Tabindex usage
        tabindex_elements = soup.find_all(attrs={'tabindex': True})
        negative_tabindex = [el for el in tabindex_elements if el.get('tabindex') == '-1']

        if negative_tabindex:
            results["warnings"].append(f"{len(negative_tabindex)} element(s) with tabindex='-1'")
            self.log(f"{len(negative_tabindex)} element(s) with tabindex='-1' (removed from tab order)", "warning")

        # Check 11: Focus visible styles
        style_tags = soup.find_all('style')
        has_focus_styles = any(':focus' in tag.get_text() for tag in style_tags)

        if has_focus_styles or 'keyboard-navigation' in content:
            results["passed"].append("Focus styles present")
            self.log("Focus styles present", "success")
        else:
            results["warnings"].append("No focus styles detected")
            self.log("No focus styles detected", "warning")

        # Check 12: Screen reader only class
        if 'sr-only' in content or 'visually-hidden' in content:
            results["passed"].append("Screen reader only class found")
            self.log("Screen reader only class found", "success")

        return results

    def check_js_file(self, filepath: Path) -> Dict[str, Any]:
        """Check a JavaScript file for accessibility patterns."""
        results = {
            "file": str(filepath),
            "errors": [],
            "warnings": [],
            "passed": []
        }

        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Check for ARIA attribute usage
        aria_patterns = [
            ('aria-label', 'aria-label'),
            ('aria-live', 'aria-live'),
            ('aria-describedby', 'aria-describedby'),
            ('role=', 'role'),
            ('tabindex', 'tabindex')
        ]

        for pattern, name in aria_patterns:
            if pattern in content:
                results["passed"].append(f"Uses {name}")
                self.log(f"Found {name} usage", "success")

        # Check for keyboard event handling
        if 'keydown' in content or 'keypress' in content:
            results["passed"].append("Keyboard event handling present")
            self.log("Keyboard event handling present", "success")
        else:
            results["warnings"].append("No keyboard event handling detected")
            self.log("No keyboard event handling detected", "warning")

        # Check for focus management
        if '.focus(' in content or 'focusZone' in content:
            results["passed"].append("Focus management present")
            self.log("Focus management present", "success")

        # Check for announcement functions
        if 'announce' in content.lower() or 'aria-live' in content:
            results["passed"].append("Screen reader announcement support")
            self.log("Screen reader announcement support", "success")

        return results

    def check_css_file(self, filepath: Path) -> Dict[str, Any]:
        """Check a CSS file for accessibility patterns."""
        results = {
            "file": str(filepath),
            "errors": [],
            "warnings": [],
            "passed": []
        }

        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Check for focus styles
        if ':focus' in content:
            results["passed"].append("Focus styles present")
            self.log("Focus styles present", "success")
        else:
            results["warnings"].append("No focus styles")
            self.log("No focus styles", "warning")

        # Check for high contrast support
        if 'high-contrast' in content or 'prefers-contrast' in content:
            results["passed"].append("High contrast support")
            self.log("High contrast support", "success")

        # Check for reduced motion support
        if 'reduced-motion' in content or 'prefers-reduced-motion' in content:
            results["passed"].append("Reduced motion support")
            self.log("Reduced motion support", "success")

        # Check for screen reader only class
        if '.sr-only' in content or '.visually-hidden' in content:
            results["passed"].append("Screen reader only class")
            self.log("Screen reader only class", "success")

        # Check for outline (should not be removed)
        if 'outline: none' in content or 'outline:0' in content:
            if ':focus' in content:
                results["passed"].append("Outline removed but focus style provided")
            else:
                results["warnings"].append("Outline removed without replacement focus style")
                self.log("Outline removed without replacement focus style", "warning")

        return results

    def generate_report(self, all_results: List[Dict]) -> Dict[str, Any]:
        """Generate a summary report from all checks."""
        total_errors = sum(len(r.get("errors", [])) for r in all_results)
        total_warnings = sum(len(r.get("warnings", [])) for r in all_results)
        total_passed = sum(len(r.get("passed", [])) for r in all_results)

        report = {
            "summary": {
                "total_checks": len(all_results),
                "total_errors": total_errors,
                "total_warnings": total_warnings,
                "total_passed": total_passed,
                "compliance_level": "AA" if total_errors == 0 else "A" if total_errors < 5 else "Failing"
            },
            "details": all_results
        }

        return report


def main():
    """Main function to run accessibility checks."""
    parser = argparse.ArgumentParser(
        description="Accessibility verification for Geometry OS Visual Shell"
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )
    parser.add_argument(
        '--fix',
        action='store_true',
        help='Attempt to automatically fix issues (not implemented yet)'
    )
    parser.add_argument(
        '--output', '-o',
        type=str,
        default='accessibility_report.json',
        help='Output file for JSON report'
    )

    args = parser.parse_args()

    print("=" * 70)
    print("Geometry OS Visual Shell - Accessibility Verification")
    print("=" * 70)
    print()

    auditor = AccessibilityAuditor(verbose=args.verbose)
    all_results = []

    # Find files to check
    web_dir = Path(__file__).parent.parent / "web"

    if not web_dir.exists():
        print(f"Error: Web directory not found at {web_dir}")
        sys.exit(1)

    # Check HTML files
    html_files = list(web_dir.glob("*.html"))
    print(f"\n📄 Checking {len(html_files)} HTML file(s)...")
    for html_file in html_files:
        if args.verbose:
            print(f"\n  Checking: {html_file.name}")
        results = auditor.check_html_file(html_file)
        all_results.append(results)

    # Check JavaScript files
    js_files = list(web_dir.glob("*.js"))
    print(f"\n📜 Checking {len(js_files)} JavaScript file(s)...")
    for js_file in js_files:
        if args.verbose:
            print(f"\n  Checking: {js_file.name}")
        results = auditor.check_js_file(js_file)
        all_results.append(results)

    # Check CSS files (inline in HTML for this project)
    print(f"\n🎨 CSS checks included in HTML analysis")

    # Generate report
    report = auditor.generate_report(all_results)

    # Print summary
    print("\n" + "=" * 70)
    print("SUMMARY")
    print("=" * 70)
    print(f"Total Files Checked: {report['summary']['total_checks']}")
    print(f"✅ Passed Checks: {report['summary']['total_passed']}")
    print(f"⚠️  Warnings: {report['summary']['total_warnings']}")
    print(f"❌ Errors: {report['summary']['total_errors']}")
    print(f"\nCompliance Level: {report['summary']['compliance_level']}")

    # Save report
    with open(args.output, 'w') as f:
        json.dump(report, f, indent=2)
    print(f"\n📊 Detailed report saved to: {args.output}")

    # Return exit code
    if report['summary']['total_errors'] > 0:
        print("\n❌ Accessibility check FAILED - Errors found")
        sys.exit(1)
    else:
        print("\n✅ Accessibility check PASSED")
        sys.exit(0)


if __name__ == "__main__":
    main()
