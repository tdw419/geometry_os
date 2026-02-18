#!/usr/bin/env python3
"""
Phase 16 Client-Side Validation
Validates that context menu and keyboard shortcut features are properly implemented
"""

import re
from pathlib import Path

def validate_phase16_features():
    """Validate Phase 16 features in index.html"""

    print("=" * 60)
    print("PHASE 16: CLIENT-SIDE FEATURE VALIDATION")
    print("=" * 60)

    html_path = Path("systems/visual_shell/web/index.html")

    if not html_path.exists():
        print("❌ index.html not found")
        return False

    with open(html_path, 'r') as f:
        html_content = f.read()

    tests = []

    # Test 1: Context Menu CSS
    print("\n🧪 Test: Context Menu CSS Styles")
    if '.context-menu' in html_content and 'context-menu' in html_content:
        print("✅ Context menu CSS styles found")
        tests.append(("Context Menu CSS", True))
    else:
        print("❌ Context menu CSS styles missing")
        tests.append(("Context Menu CSS", False))

    # Test 2: Context Menu HTML
    print("\n🧪 Test: Context Menu HTML Elements")
    if 'id="context-menu"' in html_content and 'data-action=' in html_content:
        print("✅ Context menu HTML elements found")
        tests.append(("Context Menu HTML", True))
    else:
        print("❌ Context menu HTML elements missing")
        tests.append(("Context Menu HTML", False))

    # Test 3: Context Menu Actions
    print("\n🧪 Test: Context Menu Actions")
    actions = ['open', 'create-panel', 'rename', 'copy', 'delete']
    actions_found = all(f'data-action="{action}"' in html_content for action in actions)
    if actions_found:
        print("✅ All context menu actions found")
        tests.append(("Context Menu Actions", True))
    else:
        print("❌ Some context menu actions missing")
        tests.append(("Context Menu Actions", False))

    # Test 4: Context Menu JavaScript Functions
    print("\n🧪 Test: Context Menu JavaScript Functions")
    functions = ['showContextMenu', 'hideContextMenu', 'handleContextMenuAction']
    functions_found = all(f'function {func}' in html_content for func in functions)
    if functions_found:
        print("✅ Context menu JavaScript functions found")
        tests.append(("Context Menu JS", True))
    else:
        print("❌ Context menu JavaScript functions missing")
        tests.append(("Context Menu JS", False))

    # Test 5: Keyboard Shortcuts CSS
    print("\n🧪 Test: Keyboard Shortcut CSS Styles")
    if '.shortcut-feedback' in html_content and '.shortcuts-help' in html_content:
        print("✅ Keyboard shortcut CSS styles found")
        tests.append(("Keyboard Shortcuts CSS", True))
    else:
        print("❌ Keyboard shortcut CSS styles missing")
        tests.append(("Keyboard Shortcuts CSS", False))

    # Test 6: Keyboard Shortcuts HTML
    print("\n🧪 Test: Keyboard Shortcuts HTML Elements")
    if 'id="shortcut-feedback"' in html_content and 'id="shortcuts-help"' in html_content:
        print("✅ Keyboard shortcut HTML elements found")
        tests.append(("Keyboard Shortcuts HTML", True))
    else:
        print("❌ Keyboard shortcut HTML elements missing")
        tests.append(("Keyboard Shortcuts HTML", False))

    # Test 7: Keyboard Shortcuts JavaScript
    print("\n🧪 Test: Keyboard Shortcuts JavaScript")
    functions = ['handleKeyboardShortcut', 'executeShortcutAction', 'showShortcutFeedback']
    functions_found = all(f'function {func}' in html_content for func in functions)
    if functions_found:
        print("✅ Keyboard shortcut JavaScript functions found")
        tests.append(("Keyboard Shortcuts JS", True))
    else:
        print("❌ Keyboard shortcut JavaScript functions missing")
        tests.append(("Keyboard Shortcuts JS", False))

    # Test 8: Keyboard Shortcuts Definition
    print("\n🧪 Test: Keyboard Shortcuts Definition")
    if 'KEYBOARD_SHORTCUTS' in html_content and 'ArrowUp' in html_content:
        print("✅ Keyboard shortcuts definition found")
        tests.append(("Keyboard Shortcuts Definition", True))
    else:
        print("❌ Keyboard shortcuts definition missing")
        tests.append(("Keyboard Shortcuts Definition", False))

    # Test 9: File Sprite Context Menu Integration
    print("\n🧪 Test: File Sprite Context Menu Integration")
    if 'pointerdown.*button.*2' in html_content or 'e.data.button === 2' in html_content:
        print("✅ File sprite right-click handler found")
        tests.append(("File Sprite Context Menu", True))
    else:
        print("❌ File sprite right-click handler missing")
        tests.append(("File Sprite Context Menu", False))

    # Test 10: File Sprite Rendering
    print("\n🧪 Test: File Sprite Rendering")
    if 'createFileSprite' in html_content and 'fileSprites' in html_content:
        print("✅ File sprite rendering functions found")
        tests.append(("File Sprite Rendering", True))
    else:
        print("❌ File sprite rendering functions missing")
        tests.append(("File Sprite Rendering", False))

    # Print summary
    print("\n" + "=" * 60)
    print("VALIDATION SUMMARY")
    print("=" * 60)

    passed = sum(1 for _, result in tests if result)
    total = len(tests)

    for test_name, result in tests:
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"{status}: {test_name}")

    print("=" * 60)
    print(f"Results: {passed}/{total} tests passed")
    print(f"Success Rate: {(passed/total*100):.1f}%")
    print("=" * 60)

    if passed == total:
        print("\n🎉 PHASE 16 CLIENT-SIDE FEATURES FULLY IMPLEMENTED!")
        return True
    else:
        print(f"\n⚠️  {total - passed} test(s) failed")
        return False

if __name__ == "__main__":
    success = validate_phase16_features()
    exit(0 if success else 1)
