# Native Glyph Shell - Localization (i18n) System

## Overview

The Native Glyph Shell now supports multiple languages through a comprehensive internationalization (i18n) system. This system provides:

- **Multi-language support** for 15+ languages
- **Automatic fallback** to English for missing translations
- **Variable interpolation** for dynamic content
- **Pluralization support** for handling singular/plural forms
- **Right-to-left (RTL) language support** (Arabic, Hebrew, etc.)
- **Cross-platform compatibility** (Windows, macOS, Linux)
- **Translation validation** and quality assurance tools
- **CSV import/export** for easier translation management

## Supported Languages

| Code | Language | Native Name | RTL |
|------|----------|-------------|-----|
| en | English | English | No |
| es | Spanish | Español | No |
| fr | French | Français | No |
| de | German | Deutsch | No |
| ja | Japanese | 日本語 | No |
| zh | Chinese | 中文 | No |
| ko | Korean | 한국어 | No |
| pt | Portuguese | Português | No |
| ru | Russian | Русский | No |
| ar | Arabic | العربية | Yes |
| hi | Hindi | हिन्दी | No |
| it | Italian | Italiano | No |
| nl | Dutch | Nederlands | No |
| pl | Polish | Polski | No |
| tr | Turkish | Türkçe | No |

## Quick Start

### Basic Usage

```python
from systems.visual_shell.api.i18n import get_localization, set_language

# Get the localization instance
i18n = get_localization()

# Get a translation
title = i18n.get("window.title.main")  # "Main Window"

# Switch language
set_language("es")
title = i18n.get("window.title.main")  # "Ventana Principal"
```

### With Variable Interpolation

```python
# Pass variables for interpolation
error_msg = i18n.get("errors.window.not_found", id="window_123")
# "Window not found: window_123" (English)
# "Ventana no encontrada: window_123" (Spanish)
```

### Pluralization

```python
# Plural forms are handled automatically
items_msg = i18n.get("items", count=0)   # "No items"
items_msg = i18n.get("items", count=1)   # "One item"
items_msg = i18n.get("items", count=5)   # "5 items"
```

### Integration with Native Visual Shell API

```python
from systems.visual_shell.api.native_api import NativeVisualShellAPI

# Create API with specific language
api = NativeVisualShellAPI(language="es")

# Switch language dynamically
api.set_language("fr")

# Get supported languages
languages = api.get_supported_languages()
for lang in languages:
    print(f"{lang.code}: {lang.native_name}")
```

## Translation File Structure

Translations are stored as JSON files in `systems/visual_shell/api/i18n/locales/`:

```
locales/
├── en.json    # English (base language)
├── es.json    # Spanish
├── fr.json    # French
├── de.json    # German
├── ja.json    # Japanese
└── zh.json    # Chinese
```

### File Format

```json
{
  "window": {
    "buttons": {
      "close": "Close",
      "minimize": "Minimize",
      "maximize": "Maximize"
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
```

### Key Features

1. **Nested Structure**: Use dot notation to access nested keys (e.g., `window.buttons.close`)
2. **Variables**: Use `{variable_name}` for interpolation
3. **Plurals**: Provide `zero`, `one`, and `other` keys for plural forms

## Adding a New Language

### Step 1: Create Translation File

```python
from systems.visual_shell.api.i18n import TranslationManager

manager = TranslationManager("systems/visual_shell/api/i18n/locales")

# Create new translation file based on English
manager.create_translation_file("pt")  # Portuguese
```

This creates `pt.json` with the same structure as `en.json`, but with empty values.

### Step 2: Translate Content

Edit the new file and fill in the translations:

```json
{
  "window": {
    "buttons": {
      "close": "Fechar",
      "minimize": "Minimizar",
      "maximize": "Maximizar"
    }
  }
}
```

### Step 3: Validate Translations

```python
# Check for missing or invalid translations
errors = manager.validate_translations("pt")

if errors:
    print("Validation errors:")
    for error in errors:
        print(f"  - {error}")
else:
    print("All translations valid!")

# Check completion statistics
stats = manager.get_completion_stats("pt")
print(f"Completion: {stats['percentage']:.1f}%")
```

### Step 4: Test the Language

```python
from systems.visual_shell.api.i18n import set_language, get_localization

# Switch to new language
set_language("pt")

# Test some translations
loc = get_localization()
print(loc.get("window.buttons.close"))  # Should print: Fechar
```

## Translation Management

### Export to CSV

For easier editing by translators:

```python
from pathlib import Path

manager.export_to_csv("es", Path("spanish_translations.csv"))
```

### Import from CSV

After translations are completed:

```python
manager.import_from_csv("es", Path("spanish_translations.csv"))
```

### CSV Format

```csv
Key,Translation
window.buttons.close,Cerrar
window.buttons.minimize,Minimizar
window.buttons.maximize,Maximizar
```

## Right-to-Left (RTL) Languages

The system automatically detects RTL languages:

```python
from systems.visual_shell.api.i18n import get_localization

loc = get_localization()

# Check if a language is RTL
if loc.is_rtl("ar"):
    # Apply RTL layout
    text_direction = "rtl"
    text_alignment = "right"
else:
    text_direction = "ltr"
    text_alignment = "left"
```

## Validation and Quality Assurance

### Translation Completeness

```python
stats = manager.get_completion_stats("es")

print(f"Total keys: {stats['total']}")
print(f"Translated: {stats['translated']}")
print(f"Empty: {stats['empty']}")
print(f"Completion: {stats['percentage']:.1f}%")
```

### Placeholder Validation

The system automatically validates that placeholders like `{name}` are preserved in translations:

```python
# English: "Hello, {name}!"
# Spanish: "¡Hola, {name}!"  ✅ Correct
# Spanish: "¡Hola!"           ❌ Missing placeholder

errors = manager.validate_translations("es")
# Will detect: "Missing placeholders: {'name'}"
```

## Testing and Verification

### Run Verification Script

```bash
python systems/visual_shell/api/i18n/verify_localization.py
```

This script tests:
- ✅ Translation file existence and validity
- ✅ Unicode handling across platforms
- ✅ Variable interpolation
- ✅ Pluralization
- ✅ RTL support
- ✅ Performance
- ✅ Cross-platform compatibility

### Run Pytest Suite

```bash
python -m pytest systems/visual_shell/api/tests/test_i18n.py -v
python -m pytest systems/visual_shell/api/tests/test_localization_integration.py -v
```

## Performance Characteristics

- **Load Time**: < 1 second for 1000+ translations
- **Access Time**: < 0.001 seconds per translation lookup
- **Memory Usage**: < 10 MB for all supported languages
- **Concurrent Access**: Thread-safe for multi-threaded applications

## Best Practices

### 1. Use Namespaced Keys

```json
{
  "window": {
    "buttons": {
      "close": "Close"
    }
  }
}
```

Access: `i18n.get("window.buttons.close")`

### 2. Provide Context in Keys

```json
{
  "actions": {
    "file": {
      "delete": "Delete File",
      "save": "Save File"
    },
    "window": {
      "close": "Close Window"
    }
  }
}
```

### 3. Use Variables for Dynamic Content

❌ **Bad**: String concatenation
```python
msg = i18n.get("greeting") + ", " + username + "!"
```

✅ **Good**: Variable interpolation
```python
msg = i18n.get("greeting", name=username)
```

### 4. Test All Languages

Before deployment, verify that:
- All translation files are valid JSON
- All required keys are present
- Placeholders are preserved
- RTL languages display correctly
- Unicode characters render properly

### 5. Keep Translations Updated

When adding new features:
1. Add keys to `en.json` first
2. Run validation to find missing translations
3. Update all language files
4. Test with verification script

## Troubleshooting

### Translation Not Found

**Problem**: `i18n.get("some.key")` returns the key itself

**Solution**: 
1. Check that the key exists in the JSON file
2. Verify the JSON structure is correct
3. Ensure the file was loaded (check logs)

### Unicode Characters Not Displaying

**Problem**: Chinese/Arabic/etc characters show as `???` or boxes

**Solution**:
1. Ensure files are saved with UTF-8 encoding
2. Use `ensure_ascii=False` when writing JSON:
   ```python
   json.dump(data, f, ensure_ascii=False, indent=2)
   ```
3. Verify font supports the character set

### Missing Placeholders

**Problem**: Variable interpolation not working

**Solution**:
1. Check placeholder syntax: `{variable_name}`
2. Verify you're passing the variable:
   ```python
   i18n.get("key", variable_name="value")
   ```
3. Run validation to check for missing placeholders

### Language Not Switching

**Problem**: `set_language()` returns `False`

**Solution**:
1. Verify language code is supported (check `SUPPORTED_LANGUAGES`)
2. Check that translation file exists
3. Verify JSON file is valid

## Architecture

```
i18n/
├── __init__.py              # Module exports
├── localization.py          # Core localization class
├── translation_manager.py   # Translation file management
├── verify_localization.py   # Verification script
├── locales/                 # Translation files
│   ├── en.json
│   ├── es.json
│   └── ...
└── README.md               # This file
```

## API Reference

### Localization Class

```python
class Localization:
    def __init__(language_code: str = "en", translations_dir: Path = None)
    def set_language(language_code: str) -> bool
    def get(key: str, **kwargs) -> str
    def get_language_info(language_code: str = None) -> LanguageInfo
    def get_supported_languages() -> list[LanguageInfo]
    def is_rtl(language_code: str = None) -> bool
    def reload()
```

### TranslationManager Class

```python
class TranslationManager:
    def __init__(translations_dir: Path)
    def create_translation_file(language_code: str, base_language: str = "en") -> bool
    def validate_translations(language_code: str) -> list[str]
    def get_completion_stats(language_code: str) -> dict
    def export_to_csv(language_code: str, output_file: Path) -> bool
    def import_from_csv(language_code: str, input_file: Path) -> bool
```

### Global Functions

```python
def get_localization() -> Localization
def set_language(language_code: str) -> bool
def get_current_language() -> str
```

## Contributing Translations

We welcome contributions for new languages or improvements to existing translations!

### Process

1. Fork the repository
2. Add or update translation files in `systems/visual_shell/api/i18n/locales/`
3. Run validation: `python systems/visual_shell/api/i18n/verify_localization.py`
4. Run tests: `python -m pytest systems/visual_shell/api/tests/test_i18n.py`
5. Submit a pull request

### Translation Guidelines

- **Accuracy**: Ensure translations are accurate and contextually appropriate
- **Consistency**: Use consistent terminology across all translations
- **Completeness**: Translate all keys from the English base file
- **Testing**: Verify translations in the actual UI context
- **Native Speakers**: Prefer translations by native speakers

## License

This localization system is part of the Geometry OS project and follows the same license.

---

**Last Updated**: 2026-03-11  
**Version**: 1.0.0  
**Maintainers**: Geometry OS Team
