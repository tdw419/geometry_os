"""
Test suite for Native Glyph Shell i18n/localization system
"""

import json
import pytest
from pathlib import Path
from unittest.mock import Mock, patch

# Import the localization modules
import sys
sys.path.insert(0, str(Path(__file__).parent.parent))

from i18n import (
    Localization,
    TranslationManager,
    get_localization,
    set_language,
    get_current_language
)


class TestLocalization:
    """Test the Localization class"""
    
    @pytest.fixture
    def loc(self, tmp_path):
        """Create a localization instance with test translations"""
        # Create test translation files
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # English translations
        en_translations = {
            "window": {
                "buttons": {
                    "close": "Close",
                    "minimize": "Minimize"
                },
                "title": {
                    "default": "Untitled Window"
                }
            },
            "greeting": "Hello, {name}!",
            "items": {
                "zero": "No items",
                "one": "One item",
                "other": "{count} items"
            }
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(en_translations, f)
        
        # Spanish translations
        es_translations = {
            "window": {
                "buttons": {
                    "close": "Cerrar",
                    "minimize": "Minimizar"
                },
                "title": {
                    "default": "Ventana sin título"
                }
            },
            "greeting": "¡Hola, {name}!",
            "items": {
                "zero": "Ningún elemento",
                "one": "Un elemento",
                "other": "{count} elementos"
            }
        }
        
        with open(locales_dir / "es.json", 'w', encoding='utf-8') as f:
            json.dump(es_translations, f)
        
        return Localization("en", locales_dir)
    
    def test_initialization(self, loc):
        """Test localization initialization"""
        assert loc.current_language == "en"
        assert "en" in loc.translations
        assert len(loc.translations["en"]) > 0
    
    def test_simple_translation(self, loc):
        """Test simple string translation"""
        result = loc.get("window.buttons.close")
        assert result == "Close"
    
    def test_nested_translation(self, loc):
        """Test nested key translation"""
        result = loc.get("window.title.default")
        assert result == "Untitled Window"
    
    def test_variable_interpolation(self, loc):
        """Test variable interpolation"""
        result = loc.get("greeting", name="World")
        assert result == "Hello, World!"
    
    def test_pluralization_zero(self, loc):
        """Test pluralization with zero items"""
        result = loc.get("items", count=0)
        assert result == "No items"
    
    def test_pluralization_one(self, loc):
        """Test pluralization with one item"""
        result = loc.get("items", count=1)
        assert result == "One item"
    
    def test_pluralization_many(self, loc):
        """Test pluralization with multiple items"""
        result = loc.get("items", count=5)
        assert result == "5 items"
    
    def test_language_switching(self, loc):
        """Test switching languages"""
        # Switch to Spanish
        assert loc.set_language("es")
        assert loc.current_language == "es"
        
        # Test Spanish translation
        result = loc.get("window.buttons.close")
        assert result == "Cerrar"
        
        # Switch back to English
        assert loc.set_language("en")
        assert loc.current_language == "en"
        
        result = loc.get("window.buttons.close")
        assert result == "Close"
    
    def test_fallback_to_english(self, loc):
        """Test fallback to English for missing translations"""
        # Switch to a language with incomplete translations
        loc.set_language("es")
        
        # Add a key only in English
        loc.translations["en"]["only_english"] = "English only"
        
        # Should fall back to English
        result = loc.get("only_english")
        assert result == "English only"
    
    def test_missing_translation_returns_key(self, loc):
        """Test that missing translations return the key"""
        result = loc.get("nonexistent.key.path")
        assert result == "nonexistent.key.path"
    
    def test_unsupported_language(self, loc):
        """Test switching to unsupported language"""
        result = loc.set_language("xx")
        assert result is False
        assert loc.current_language == "en"  # Should stay at current
    
    def test_get_language_info(self, loc):
        """Test getting language information"""
        info = loc.get_language_info("en")
        assert info.code == "en"
        assert info.name == "English"
        assert info.native_name == "English"
        assert info.rtl is False
    
    def test_rtl_detection(self, loc):
        """Test right-to-left language detection"""
        assert loc.is_rtl("en") is False
        assert loc.is_rtl("ar") is True
    
    def test_get_supported_languages(self, loc):
        """Test getting all supported languages"""
        languages = loc.get_supported_languages()
        assert len(languages) > 0
        assert any(lang.code == "en" for lang in languages)
        assert any(lang.code == "es" for lang in languages)
        assert any(lang.code == "fr" for lang in languages)


class TestTranslationManager:
    """Test the TranslationManager class"""
    
    @pytest.fixture
    def manager(self, tmp_path):
        """Create a translation manager"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Create base English file
        en_translations = {
            "window": {
                "buttons": {
                    "close": "Close"
                }
            },
            "greeting": "Hello"
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(en_translations, f)
        
        return TranslationManager(locales_dir)
    
    def test_create_translation_file(self, manager):
        """Test creating a new translation file"""
        success = manager.create_translation_file("fr")
        assert success
        
        # Check file exists
        fr_file = manager.translations_dir / "fr.json"
        assert fr_file.exists()
        
        # Check structure
        with open(fr_file, 'r', encoding='utf-8') as f:
            translations = json.load(f)
        
        assert "window" in translations
        assert "buttons" in translations["window"]
        assert translations["window"]["buttons"]["close"] == ""
    
    def test_validate_translations(self, manager):
        """Test translation validation"""
        # Create a French file with missing translations
        manager.create_translation_file("fr")
        
        errors = manager.validate_translations("fr")
        
        # Should have errors for empty translations
        assert len(errors) > 0
        assert any("Empty translations" in error for error in errors)
    
    def test_get_completion_stats(self, manager):
        """Test getting completion statistics"""
        manager.create_translation_file("fr")
        
        stats = manager.get_completion_stats("fr")
        
        assert "total" in stats
        assert "translated" in stats
        assert "empty" in stats
        assert "percentage" in stats
        assert stats["total"] > 0
        assert stats["percentage"] == 0.0  # No translations yet
    
    def test_export_import_csv(self, manager, tmp_path):
        """Test exporting and importing translations via CSV"""
        # Create a translation file
        manager.create_translation_file("de")
        
        # Export to CSV
        csv_file = tmp_path / "de_translations.csv"
        success = manager.export_to_csv("de", csv_file)
        assert success
        assert csv_file.exists()
        
        # Modify CSV
        import csv
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)
        
        # Update some translations
        for row in rows:
            if row['Key'] == 'greeting':
                row['Translation'] = 'Hallo'
        
        # Write back
        with open(csv_file, 'w', encoding='utf-8', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=['Key', 'Translation'])
            writer.writeheader()
            writer.writerows(rows)
        
        # Import from CSV
        success = manager.import_from_csv("de", csv_file)
        assert success
        
        # Verify import
        with open(manager.translations_dir / "de.json", 'r', encoding='utf-8') as f:
            translations = json.load(f)
        
        assert translations["greeting"] == "Hallo"


class TestGlobalFunctions:
    """Test global localization functions"""
    
    def test_get_localization_singleton(self):
        """Test that get_localization returns a singleton"""
        loc1 = get_localization()
        loc2 = get_localization()
        
        assert loc1 is loc2
    
    def test_set_language_global(self):
        """Test global language setting"""
        # Set language
        success = set_language("es")
        
        # Check current language
        current = get_current_language()
        assert current == "es"
    
    def test_get_current_language(self):
        """Test getting current language"""
        set_language("en")
        current = get_current_language()
        assert current == "en"


class TestIntegration:
    """Integration tests for i18n with Native Visual Shell"""
    
    def test_multilingual_window_titles(self, tmp_path):
        """Test creating windows with multilingual titles"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Create translations
        translations = {
            "window": {
                "title": {
                    "main": "Main Window"
                }
            }
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f)
        
        loc = Localization("en", locales_dir)
        
        # Get translated title
        title = loc.get("window.title.main")
        assert title == "Main Window"
        
        # Switch language
        spanish = {
            "window": {
                "title": {
                    "main": "Ventana Principal"
                }
            }
        }
        
        with open(locales_dir / "es.json", 'w', encoding='utf-8') as f:
            json.dump(spanish, f)
        
        loc.set_language("es")
        title = loc.get("window.title.main")
        assert title == "Ventana Principal"
    
    def test_error_messages_localized(self, tmp_path):
        """Test that error messages are localized"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        translations = {
            "errors": {
                "window": {
                    "not_found": "Window not found: {id}"
                }
            }
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f)
        
        loc = Localization("en", locales_dir)
        
        # Test error message with variable
        error_msg = loc.get("errors.window.not_found", id="test_window")
        assert error_msg == "Window not found: test_window"
    
    def test_notification_messages(self, tmp_path):
        """Test notification messages with interpolation"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        translations = {
            "notifications": {
                "window": {
                    "created": "Window created: {title}",
                    "closed": "Window closed: {title}"
                }
            }
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f)
        
        loc = Localization("en", locales_dir)
        
        # Test notification with variable
        msg = loc.get("notifications.window.created", title="My Window")
        assert msg == "Window created: My Window"


class TestCrossPlatformCompatibility:
    """Test cross-platform compatibility"""
    
    def test_unicode_handling(self, tmp_path):
        """Test Unicode character handling"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Test various Unicode scripts
        translations = {
            "chinese": "中文测试",
            "japanese": "日本語テスト",
            "arabic": "اختبار عربي",
            "emoji": "😀🎉"
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f, ensure_ascii=False)
        
        loc = Localization("en", locales_dir)
        
        assert loc.get("chinese") == "中文测试"
        assert loc.get("japanese") == "日本語テスト"
        assert loc.get("arabic") == "اختبار عربي"
        assert loc.get("emoji") == "😀🎉"
    
    def test_file_encoding(self, tmp_path):
        """Test file encoding compatibility"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Create file with various encodings
        translations = {
            "french": "Français",
            "german": "Deutsch",
            "russian": "Русский"
        }
        
        # Write with UTF-8
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f, ensure_ascii=False)
        
        # Read back
        loc = Localization("en", locales_dir)
        
        assert loc.get("french") == "Français"
        assert loc.get("german") == "Deutsch"
        assert loc.get("russian") == "Русский"
    
    def test_path_handling(self, tmp_path):
        """Test path handling across platforms"""
        # Test with different path separators
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        translations = {"test": "value"}
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f)
        
        # Should work regardless of platform
        loc = Localization("en", locales_dir)
        assert loc.get("test") == "value"


if __name__ == "__main__":
    # Run tests
    pytest.main([__file__, "-v", "--tb=short"])
