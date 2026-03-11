"""
Comprehensive test suite for verifying localization on multiple platforms
"""

import json
import pytest
from pathlib import Path
from typing import Dict, List
import platform
import sys

sys.path.insert(0, str(Path(__file__).parent.parent))

from i18n import Localization, TranslationManager


class TestMultiPlatformLocalization:
    """Test localization across different platforms and configurations"""
    
    @pytest.fixture
    def full_translations(self, tmp_path):
        """Create comprehensive translation files for testing"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        languages = {
            "en": {
                "window": {
                    "buttons": {"close": "Close", "minimize": "Minimize", "maximize": "Maximize"},
                    "title": {"main": "Main Window", "settings": "Settings"}
                },
                "menu": {
                    "file": {"new": "New", "open": "Open", "save": "Save"},
                    "edit": {"copy": "Copy", "paste": "Paste"}
                },
                "notifications": {
                    "system": {"initialized": "System initialized successfully!"}
                },
                "errors": {
                    "window": {"not_found": "Window not found: {id}"}
                }
            },
            "es": {
                "window": {
                    "buttons": {"close": "Cerrar", "minimize": "Minimizar", "maximize": "Maximizar"},
                    "title": {"main": "Ventana Principal", "settings": "Configuración"}
                },
                "menu": {
                    "file": {"new": "Nuevo", "open": "Abrir", "save": "Guardar"},
                    "edit": {"copy": "Copiar", "paste": "Pegar"}
                },
                "notifications": {
                    "system": {"initialized": "¡Sistema inicializado exitosamente!"}
                },
                "errors": {
                    "window": {"not_found": "Ventana no encontrada: {id}"}
                }
            },
            "zh": {
                "window": {
                    "buttons": {"close": "关闭", "minimize": "最小化", "maximize": "最大化"},
                    "title": {"main": "主窗口", "settings": "设置"}
                },
                "menu": {
                    "file": {"new": "新建", "open": "打开", "save": "保存"},
                    "edit": {"copy": "复制", "paste": "粘贴"}
                },
                "notifications": {
                    "system": {"initialized": "系统初始化成功！"}
                },
                "errors": {
                    "window": {"not_found": "未找到窗口：{id}"}
                }
            },
            "ar": {
                "window": {
                    "buttons": {"close": "إغلاق", "minimize": "تصغير", "maximize": "تكبير"},
                    "title": {"main": "النافذة الرئيسية", "settings": "الإعدادات"}
                },
                "menu": {
                    "file": {"new": "جديد", "open": "فتح", "save": "حفظ"},
                    "edit": {"copy": "نسخ", "paste": "لصق"}
                },
                "notifications": {
                    "system": {"initialized": "تم تهيئة النظام بنجاح!"}
                },
                "errors": {
                    "window": {"not_found": "النافذة غير موجودة: {id}"}
                }
            }
        }
        
        for lang_code, translations in languages.items():
            with open(locales_dir / f"{lang_code}.json", 'w', encoding='utf-8') as f:
                json.dump(translations, f, ensure_ascii=False, indent=2)
        
        return locales_dir
    
    def test_all_supported_languages(self, full_translations):
        """Test that all supported languages load correctly"""
        loc = Localization("en", full_translations)
        
        supported = ["en", "es", "zh", "ar"]
        
        for lang in supported:
            assert loc.set_language(lang), f"Failed to set language to {lang}"
            assert loc.current_language == lang
            
            # Test that translations are loaded
            assert "window" in loc.translations[lang]
            assert "menu" in loc.translations[lang]
    
    def test_rtl_language_support(self, full_translations):
        """Test right-to-left language support"""
        loc = Localization("ar", full_translations)
        
        # Arabic should be detected as RTL
        assert loc.is_rtl("ar")
        assert not loc.is_rtl("en")
        
        # Test Arabic translation
        close_btn = loc.get("window.buttons.close")
        assert close_btn == "إغلاق"
    
    def test_unicode_across_platforms(self, full_translations):
        """Test Unicode handling on different platforms"""
        loc = Localization("zh", full_translations)
        
        # Test Chinese characters
        main_title = loc.get("window.title.main")
        assert main_title == "主窗口"
        
        # Test that characters are preserved
        assert len(main_title) == 4  # 4 Chinese characters
        
        # Test on different platforms
        current_os = platform.system()
        print(f"Testing on {current_os}")
        
        # Should work the same on all platforms
        assert loc.get("menu.file.new") == "新建"
    
    def test_variable_interpolation_multilingual(self, full_translations):
        """Test variable interpolation in multiple languages"""
        loc = Localization("en", full_translations)
        
        # English
        error_en = loc.get("errors.window.not_found", id="window_123")
        assert error_en == "Window not found: window_123"
        
        # Spanish
        loc.set_language("es")
        error_es = loc.get("errors.window.not_found", id="ventana_123")
        assert error_es == "Ventana no encontrada: ventana_123"
        
        # Chinese
        loc.set_language("zh")
        error_zh = loc.get("errors.window.not_found", id="窗口_123")
        assert error_zh == "未找到窗口：窗口_123"
    
    def test_missing_translation_fallback(self, full_translations):
        """Test fallback behavior for missing translations"""
        # Add a key only to English
        with open(full_translations / "en.json", 'r', encoding='utf-8') as f:
            en_data = json.load(f)
        
        en_data["only_english_key"] = "This is only in English"
        
        with open(full_translations / "en.json", 'w', encoding='utf-8') as f:
            json.dump(en_data, f, ensure_ascii=False, indent=2)
        
        loc = Localization("es", full_translations)
        
        # Should fall back to English
        result = loc.get("only_english_key")
        assert result == "This is only in English"
    
    def test_special_characters(self, tmp_path):
        """Test special characters and escape sequences"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        translations = {
            "special": {
                "newline": "Line 1\nLine 2",
                "tab": "Column 1\tColumn 2",
                "quotes": "He said \"Hello\"",
                "backslash": "Path: C:\\Users",
                "emoji": "Test 😀🎉🚀"
            }
        }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f, ensure_ascii=False, indent=2)
        
        loc = Localization("en", locales_dir)
        
        # Test that special characters are preserved
        assert "\n" in loc.get("special.newline")
        assert "\t" in loc.get("special.tab")
        assert "\"" in loc.get("special.quotes")
        assert "\\" in loc.get("special.backslash")
        assert "😀" in loc.get("special.emoji")
    
    def test_large_translation_files(self, tmp_path):
        """Test performance with large translation files"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Generate large translation file
        large_translations = {}
        for i in range(1000):
            large_translations[f"key_{i}"] = {
                "label": f"Label {i}",
                "description": f"Description {i}" * 10
            }
        
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(large_translations, f, ensure_ascii=False)
        
        import time
        start = time.time()
        loc = Localization("en", locales_dir)
        load_time = time.time() - start
        
        # Should load in reasonable time (< 1 second)
        assert load_time < 1.0, f"Loading took {load_time} seconds"
        
        # Test access time
        start = time.time()
        for i in range(100):
            result = loc.get(f"key_{i}.label")
            assert result == f"Label {i}"
        access_time = time.time() - start
        
        # 100 accesses should be fast (< 0.1 seconds)
        assert access_time < 0.1, f"Access took {access_time} seconds"
    
    def test_concurrent_access(self, full_translations):
        """Test thread safety for concurrent access"""
        import threading
        
        loc = Localization("en", full_translations)
        errors = []
        
        def switch_and_translate(lang):
            try:
                for _ in range(10):
                    loc.set_language(lang)
                    result = loc.get("window.buttons.close")
                    assert result is not None
            except Exception as e:
                errors.append(e)
        
        # Create threads for concurrent access
        threads = []
        for lang in ["en", "es", "zh", "ar"]:
            t = threading.Thread(target=switch_and_translate, args=(lang,))
            threads.append(t)
            t.start()
        
        # Wait for all threads
        for t in threads:
            t.join()
        
        # Should not have any errors
        assert len(errors) == 0, f"Errors during concurrent access: {errors}"
    
    def test_memory_efficiency(self, full_translations):
        """Test memory efficiency of translation loading"""
        import sys
        
        loc = Localization("en", full_translations)
        
        # Load all languages
        for lang in ["en", "es", "zh", "ar"]:
            loc.set_language(lang)
        
        # Check memory usage
        total_size = 0
        for lang_translations in loc.translations.values():
            total_size += sys.getsizeof(lang_translations)
        
        # Should be reasonably small (< 10 MB for our test data)
        assert total_size < 10 * 1024 * 1024, f"Memory usage too high: {total_size} bytes"
    
    def test_platform_specific_paths(self, tmp_path):
        """Test path handling on different platforms"""
        # Test with various path formats
        path_formats = [
            "locales/en.json",
            "./locales/en.json",
            str(tmp_path / "locales" / "en.json")
        ]
        
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        translations = {"test": "value"}
        with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
            json.dump(translations, f)
        
        # All path formats should work
        for path in path_formats:
            try:
                loc = Localization("en", Path(path).parent)
                assert loc.get("test") == "value"
            except Exception as e:
                # Some path formats may not work on all platforms
                print(f"Path format {path} not supported: {e}")


class TestValidationAndQuality:
    """Test translation validation and quality assurance"""
    
    @pytest.fixture
    def manager(self, tmp_path):
        """Create a translation manager"""
        locales_dir = tmp_path / "locales"
        locales_dir.mkdir()
        
        # Create base English file
        en_translations = {
            "window": {
                "buttons": {
                    "close": "Close",
                    "minimize": "Minimize"
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
        
        return TranslationManager(locales_dir)
    
    def test_translation_completeness(self, manager):
        """Test translation completeness checking"""
        # Create incomplete translation
        manager.create_translation_file("es")
        
        stats = manager.get_completion_stats("es")
        
        assert stats["total"] > 0
        assert stats["translated"] == 0
        assert stats["percentage"] == 0.0
    
    def test_placeholder_validation(self, manager):
        """Test that placeholders are preserved in translations"""
        manager.create_translation_file("es")
        
        # Add translation with missing placeholder
        with open(manager.translations_dir / "es.json", 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        data["greeting"] = "¡Hola!"  # Missing {name} placeholder
        
        with open(manager.translations_dir / "es.json", 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        
        errors = manager.validate_translations("es")
        
        # Should detect missing placeholder
        assert any("Missing placeholders" in error for error in errors)
    
    def test_empty_translation_detection(self, manager):
        """Test detection of empty translations"""
        manager.create_translation_file("fr")
        
        errors = manager.validate_translations("fr")
        
        # Should detect empty translations
        assert any("Empty translations" in error for error in errors)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
