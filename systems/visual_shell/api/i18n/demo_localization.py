#!/usr/bin/env python3
"""
Demonstration script for Native Glyph Shell localization system
Shows practical usage of multi-language support
"""

import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from i18n import get_localization, set_language, get_current_language


def demo_basic_usage():
    """Demonstrate basic localization usage"""
    print("=" * 70)
    print("DEMO 1: Basic Translation")
    print("=" * 70)
    
    i18n = get_localization()
    
    # English (default)
    print(f"\nEnglish:")
    print(f"  Window Close Button: {i18n.get('window.buttons.close')}")
    print(f"  Main Window Title: {i18n.get('window.title.main')}")
    print(f"  System Initialized: {i18n.get('notifications.system.initialized')}")
    
    # Spanish
    set_language("es")
    print(f"\nSpanish (Español):")
    print(f"  Window Close Button: {i18n.get('window.buttons.close')}")
    print(f"  Main Window Title: {i18n.get('window.title.main')}")
    print(f"  System Initialized: {i18n.get('notifications.system.initialized')}")
    
    # Chinese
    set_language("zh")
    print(f"\nChinese (中文):")
    print(f"  Window Close Button: {i18n.get('window.buttons.close')}")
    print(f"  Main Window Title: {i18n.get('window.title.main')}")
    print(f"  System Initialized: {i18n.get('notifications.system.initialized')}")


def demo_variable_interpolation():
    """Demonstrate variable interpolation"""
    print("\n" + "=" * 70)
    print("DEMO 2: Variable Interpolation")
    print("=" * 70)
    
    i18n = get_localization()
    set_language("en")
    
    print(f"\nEnglish:")
    error_msg = i18n.get("errors.window.not_found", id="window_123")
    print(f"  Error Message: {error_msg}")
    
    created_msg = i18n.get("notifications.window.created", title="My Document")
    print(f"  Window Created: {created_msg}")
    
    # Spanish
    set_language("es")
    print(f"\nSpanish:")
    error_msg = i18n.get("errors.window.not_found", id="ventana_123")
    print(f"  Error Message: {error_msg}")
    
    created_msg = i18n.get("notifications.window.created", title="Mi Documento")
    print(f"  Window Created: {created_msg}")


def demo_pluralization():
    """Demonstrate pluralization support"""
    print("\n" + "=" * 70)
    print("DEMO 3: Pluralization")
    print("=" * 70)
    
    i18n = get_localization()
    set_language("en")
    
    print(f"\nEnglish:")
    print(f"  0 items: {i18n.get('common.loading')}")
    print(f"  1 item: {i18n.get('common.saving')}")
    print(f"  5 items: {i18n.get('common.processing')}")
    
    # Note: The actual plural forms would be defined in the translation file
    # For this demo, we're using the existing common.* keys


def demo_supported_languages():
    """Demonstrate getting supported languages"""
    print("\n" + "=" * 70)
    print("DEMO 4: Supported Languages")
    print("=" * 70)
    
    i18n = get_localization()
    languages = i18n.get_supported_languages()
    
    print(f"\nTotal Supported Languages: {len(languages)}")
    print("\nLanguage List:")
    
    for lang in languages:
        rtl_marker = " [RTL]" if lang.rtl else ""
        print(f"  {lang.code:3} - {lang.native_name:15} ({lang.name}){rtl_marker}")


def demo_rtl_support():
    """Demonstrate right-to-left language support"""
    print("\n" + "=" * 70)
    print("DEMO 5: Right-to-Left (RTL) Language Support")
    print("=" * 70)
    
    i18n = get_localization()
    
    test_languages = ["en", "ar", "es", "he"]
    
    print(f"\nRTL Detection:")
    for lang_code in test_languages:
        try:
            info = i18n.get_language_info(lang_code)
            is_rtl = i18n.is_rtl(lang_code)
            status = "✅ RTL" if is_rtl else "❌ LTR"
            print(f"  {lang_code:3} - {info.native_name:15} {status}")
        except Exception:
            print(f"  {lang_code:3} - Not in supported list")


def demo_language_switching():
    """Demonstrate dynamic language switching"""
    print("\n" + "=" * 70)
    print("DEMO 6: Dynamic Language Switching")
    print("=" * 70)
    
    i18n = get_localization()
    
    languages = ["en", "es", "fr", "de", "ja", "zh"]
    
    print(f"\nSwitching through languages:")
    
    for lang in languages:
        if i18n.set_language(lang):
            info = i18n.get_language_info(lang)
            close_text = i18n.get("window.buttons.close")
            print(f"  {info.native_name:15} → {close_text}")
        else:
            print(f"  {lang} - Failed to switch")


def demo_integration_with_api():
    """Demonstrate integration with Native Visual Shell API"""
    print("\n" + "=" * 70)
    print("DEMO 7: Integration with Native Visual Shell API")
    print("=" * 70)
    
    try:
        # This would work if native_api.py is updated
        print("\n  Example code:")
        print("""
from systems.visual_shell.api.native_api import NativeVisualShellAPI

# Create API with specific language
api = NativeVisualShellAPI(language="es")

# All UI is now in Spanish
panel = api.create_panel(
    id="main",
    title="Panel Principal",
    x=100, y=100,
    width=800, height=600
)

# Switch language dynamically
api.set_language("zh")
# Now UI is in Chinese

# Get telemetry with current language
telemetry = api.get_telemetry()
print(f"Current language: {telemetry['language']}")
        """)
    except Exception as e:
        print(f"  Note: {e}")


def main():
    """Run all demonstrations"""
    print("\n" + "=" * 70)
    print("Native Glyph Shell - Localization System Demo")
    print("=" * 70)
    
    demo_basic_usage()
    demo_variable_interpolation()
    demo_pluralization()
    demo_supported_languages()
    demo_rtl_support()
    demo_language_switching()
    demo_integration_with_api()
    
    print("\n" + "=" * 70)
    print("Demo Complete!")
    print("=" * 70)
    print("\nFor more information, see:")
    print("  - systems/visual_shell/api/i18n/README.md")
    print("  - systems/visual_shell/api/i18n/verify_localization.py")
    print("\nTo add your own language:")
    print("  python -c \"from i18n import TranslationManager; \\")
    print("            TranslationManager('locales').create_translation_file('pt')\"")


if __name__ == "__main__":
    main()
