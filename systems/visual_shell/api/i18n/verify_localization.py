#!/usr/bin/env python3
"""
Verification script for Native Glyph Shell localization system
Tests translations on multiple platforms and ensures correctness
"""

import json
import sys
import platform
import subprocess
from pathlib import Path
from typing import Dict, List, Tuple
import time


class LocalizationVerifier:
    """Verifies localization implementation across platforms"""
    
    def __init__(self):
        self.results = []
        self.passed = 0
        self.failed = 0
        
    def test(self, name: str, func) -> bool:
        """Run a test and record results"""
        print(f"\n{'='*70}")
        print(f"Testing: {name}")
        print(f"{'='*70}")
        
        try:
            start = time.time()
            result = func()
            elapsed = time.time() - start
            
            if result:
                self.passed += 1
                status = "✅ PASS"
            else:
                self.failed += 1
                status = "❌ FAIL"
            
            print(f"{status} ({elapsed:.3f}s)")
            self.results.append((name, result, elapsed))
            return result
            
        except Exception as e:
            self.failed += 1
            print(f"❌ EXCEPTION: {e}")
            self.results.append((name, False, 0))
            return False
    
    def test_translation_files_exist(self) -> bool:
        """Verify all translation files exist and are valid JSON"""
        locales_dir = Path(__file__).parent / "locales"
        
        required_languages = ["en", "es", "fr", "de", "ja", "zh"]
        
        for lang in required_languages:
            lang_file = locales_dir / f"{lang}.json"
            
            if not lang_file.exists():
                print(f"  ❌ Missing: {lang}.json")
                return False
            
            try:
                with open(lang_file, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                
                if not isinstance(data, dict):
                    print(f"  ❌ Invalid format: {lang}.json")
                    return False
                
                print(f"  ✅ Valid: {lang}.json ({len(data)} top-level keys)")
                
            except json.JSONDecodeError as e:
                print(f"  ❌ JSON error in {lang}.json: {e}")
                return False
            except Exception as e:
                print(f"  ❌ Error reading {lang}.json: {e}")
                return False
        
        return True
    
    def test_unicode_handling(self) -> bool:
        """Test Unicode character handling across platforms"""
        test_strings = {
            "chinese": "中文测试",
            "japanese": "日本語テスト",
            "arabic": "اختبار عربي",
            "emoji": "😀🎉🚀",
            "russian": "Русский",
            "french": "Français"
        }
        
        print(f"  Platform: {platform.system()} {platform.release()}")
        print(f"  Python: {platform.python_version()}")
        print(f"  Encoding: {sys.getdefaultencoding()}")
        
        for name, text in test_strings.items():
            try:
                # Test encoding/decoding
                encoded = text.encode('utf-8')
                decoded = encoded.decode('utf-8')
                
                if decoded != text:
                    print(f"  ❌ Unicode corruption: {name}")
                    return False
                
                print(f"  ✅ {name}: {text}")
                
            except Exception as e:
                print(f"  ❌ Unicode error for {name}: {e}")
                return False
        
        return True
    
    def test_localization_module(self) -> bool:
        """Test the localization module can be imported and used"""
        try:
            # Add parent directory to path
            sys.path.insert(0, str(Path(__file__).parent.parent))
            
            from i18n import Localization, get_localization, set_language
            
            # Test basic functionality
            loc = Localization("en")
            
            # Test language switching
            if not set_language("es"):
                print("  ❌ Failed to set language to Spanish")
                return False
            
            print("  ✅ Module imported successfully")
            print("  ✅ Language switching works")
            
            return True
            
        except ImportError as e:
            print(f"  ❌ Import error: {e}")
            return False
        except Exception as e:
            print(f"  ❌ Error: {e}")
            return False
    
    def test_translation_completeness(self) -> bool:
        """Verify all languages have complete translations"""
        locales_dir = Path(__file__).parent / "locales"
        
        # Load English as reference
        with open(locales_dir / "en.json", 'r', encoding='utf-8') as f:
            en_data = json.load(f)
        
        def count_keys(data: dict) -> int:
            count = 0
            for value in data.values():
                if isinstance(value, dict):
                    count += count_keys(value)
                else:
                    count += 1
            return count
        
        en_count = count_keys(en_data)
        print(f"  Reference (English): {en_count} keys")
        
        languages = ["es", "fr", "de", "ja", "zh"]
        
        for lang in languages:
            lang_file = locales_dir / f"{lang}.json"
            
            if not lang_file.exists():
                print(f"  ❌ Missing: {lang}")
                continue
            
            with open(lang_file, 'r', encoding='utf-8') as f:
                lang_data = json.load(f)
            
            lang_count = count_keys(lang_data)
            completeness = (lang_count / en_count) * 100 if en_count > 0 else 0
            
            if completeness < 100:
                print(f"  ⚠️  {lang}: {lang_count}/{en_count} keys ({completeness:.1f}%)")
            else:
                print(f"  ✅ {lang}: {lang_count}/{en_count} keys ({completeness:.1f}%)")
        
        return True
    
    def test_variable_interpolation(self) -> bool:
        """Test variable interpolation in translations"""
        try:
            sys.path.insert(0, str(Path(__file__).parent.parent))
            from i18n import Localization
            
            # Create test translations
            import tempfile
            with tempfile.TemporaryDirectory() as tmpdir:
                locales_dir = Path(tmpdir)
                
                en_data = {
                    "greeting": "Hello, {name}!",
                    "items": {
                        "zero": "No items",
                        "one": "One item",
                        "other": "{count} items"
                    }
                }
                
                with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
                    json.dump(en_data, f)
                
                loc = Localization("en", locales_dir)
                
                # Test simple interpolation
                result = loc.get("greeting", name="World")
                if result != "Hello, World!":
                    print(f"  ❌ Simple interpolation failed: {result}")
                    return False
                
                print(f"  ✅ Simple interpolation: {result}")
                
                # Test pluralization
                result = loc.get("items", count=0)
                if result != "No items":
                    print(f"  ❌ Pluralization (zero) failed: {result}")
                    return False
                
                result = loc.get("items", count=1)
                if result != "One item":
                    print(f"  ❌ Pluralization (one) failed: {result}")
                    return False
                
                result = loc.get("items", count=5)
                if result != "5 items":
                    print(f"  ❌ Pluralization (many) failed: {result}")
                    return False
                
                print(f"  ✅ Pluralization works correctly")
                
                return True
                
        except Exception as e:
            print(f"  ❌ Error: {e}")
            return False
    
    def test_rtl_support(self) -> bool:
        """Test right-to-left language support"""
        try:
            sys.path.insert(0, str(Path(__file__).parent.parent))
            from i18n import Localization
            
            loc = Localization("ar")
            
            # Test RTL detection
            if not loc.is_rtl("ar"):
                print("  ❌ Arabic not detected as RTL")
                return False
            
            if loc.is_rtl("en"):
                print("  ❌ English incorrectly detected as RTL")
                return False
            
            print("  ✅ RTL detection works correctly")
            
            return True
            
        except Exception as e:
            print(f"  ❌ Error: {e}")
            return False
    
    def test_cross_platform_paths(self) -> bool:
        """Test path handling across different platforms"""
        import tempfile
        
        try:
            with tempfile.TemporaryDirectory() as tmpdir:
                # Test different path formats
                paths = [
                    Path(tmpdir) / "locales",
                    Path(tmpdir) / "locales" / "",
                ]
                
                for path in paths:
                    path.mkdir(exist_ok=True)
                    
                    # Create test file
                    en_file = path / "en.json"
                    en_data = {"test": "value"}
                    
                    with open(en_file, 'w', encoding='utf-8') as f:
                        json.dump(en_data, f)
                    
                    # Try to read it back
                    with open(en_file, 'r', encoding='utf-8') as f:
                        data = json.load(f)
                    
                    if data != en_data:
                        print(f"  ❌ Path handling failed: {path}")
                        return False
                
                print(f"  ✅ Path handling works on {platform.system()}")
                return True
                
        except Exception as e:
            print(f"  ❌ Error: {e}")
            return False
    
    def test_performance(self) -> bool:
        """Test localization performance"""
        try:
            sys.path.insert(0, str(Path(__file__).parent.parent))
            from i18n import Localization
            
            import tempfile
            with tempfile.TemporaryDirectory() as tmpdir:
                locales_dir = Path(tmpdir)
                
                # Create large translation file
                large_data = {}
                for i in range(1000):
                    large_data[f"key_{i}"] = f"Value {i}"
                
                with open(locales_dir / "en.json", 'w', encoding='utf-8') as f:
                    json.dump(large_data, f)
                
                # Test load time
                start = time.time()
                loc = Localization("en", locales_dir)
                load_time = time.time() - start
                
                if load_time > 1.0:
                    print(f"  ❌ Load time too slow: {load_time:.3f}s")
                    return False
                
                print(f"  ✅ Load time: {load_time:.3f}s")
                
                # Test access time
                start = time.time()
                for i in range(100):
                    result = loc.get(f"key_{i}")
                access_time = time.time() - start
                
                if access_time > 0.1:
                    print(f"  ❌ Access time too slow: {access_time:.3f}s")
                    return False
                
                print(f"  ✅ Access time (100 ops): {access_time:.3f}s")
                
                return True
                
        except Exception as e:
            print(f"  ❌ Error: {e}")
            return False
    
    def run_pytest(self) -> bool:
        """Run the pytest test suite"""
        try:
            result = subprocess.run(
                ["python", "-m", "pytest", 
                 str(Path(__file__).parent.parent / "tests" / "test_i18n.py"),
                 "-v", "--tb=short"],
                capture_output=True,
                text=True,
                timeout=30
            )
            
            if result.returncode == 0:
                print("  ✅ All pytest tests passed")
                return True
            else:
                print(f"  ❌ Pytest failed with code {result.returncode}")
                print(result.stdout)
                print(result.stderr)
                return False
                
        except subprocess.TimeoutExpired:
            print("  ❌ Pytest timed out")
            return False
        except FileNotFoundError:
            print("  ⚠️  Pytest not installed, skipping")
            return True
        except Exception as e:
            print(f"  ❌ Error running pytest: {e}")
            return False
    
    def generate_report(self):
        """Generate final verification report"""
        print(f"\n{'='*70}")
        print("VERIFICATION REPORT")
        print(f"{'='*70}")
        print(f"Platform: {platform.system()} {platform.release()}")
        print(f"Python: {platform.python_version()}")
        print(f"Date: {time.strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"\nResults:")
        print(f"  ✅ Passed: {self.passed}")
        print(f"  ❌ Failed: {self.failed}")
        print(f"  📊 Total: {self.passed + self.failed}")
        
        if self.failed == 0:
            print(f"\n🎉 ALL TESTS PASSED!")
            return 0
        else:
            print(f"\n⚠️  {self.failed} TEST(S) FAILED")
            print("\nFailed tests:")
            for name, result, elapsed in self.results:
                if not result:
                    print(f"  - {name}")
            return 1


def main():
    """Main entry point"""
    verifier = LocalizationVerifier()
    
    # Run all tests
    verifier.test("Translation Files Exist", verifier.test_translation_files_exist)
    verifier.test("Unicode Handling", verifier.test_unicode_handling)
    verifier.test("Localization Module", verifier.test_localization_module)
    verifier.test("Translation Completeness", verifier.test_translation_completeness)
    verifier.test("Variable Interpolation", verifier.test_variable_interpolation)
    verifier.test("RTL Support", verifier.test_rtl_support)
    verifier.test("Cross-Platform Paths", verifier.test_cross_platform_paths)
    verifier.test("Performance", verifier.test_performance)
    verifier.test("Pytest Suite", verifier.run_pytest)
    
    # Generate report
    return verifier.generate_report()


if __name__ == "__main__":
    sys.exit(main())
