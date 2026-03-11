"""
Localization System for Native Glyph Shell
Supports multiple languages with fallback to English
"""

import json
import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Optional

logger = logging.getLogger("i18n.localization")


@dataclass
class LanguageInfo:
    """Information about a supported language."""
    code: str
    name: str
    native_name: str
    rtl: bool = False  # Right-to-left text direction


class Localization:
    """
    Main localization class for translating UI strings.
    
    Features:
    - Multiple language support
    - Fallback to English for missing translations
    - Variable interpolation
    - Pluralization support
    - Context-aware translations
    """
    
    SUPPORTED_LANGUAGES = {
        "en": LanguageInfo("en", "English", "English"),
        "es": LanguageInfo("es", "Spanish", "Español"),
        "fr": LanguageInfo("fr", "French", "Français"),
        "de": LanguageInfo("de", "German", "Deutsch"),
        "ja": LanguageInfo("ja", "Japanese", "日本語"),
        "zh": LanguageInfo("zh", "Chinese", "中文"),
        "ko": LanguageInfo("ko", "Korean", "한국어"),
        "pt": LanguageInfo("pt", "Portuguese", "Português"),
        "ru": LanguageInfo("ru", "Russian", "Русский"),
        "ar": LanguageInfo("ar", "Arabic", "العربية", rtl=True),
        "hi": LanguageInfo("hi", "Hindi", "हिन्दी"),
        "it": LanguageInfo("it", "Italian", "Italiano"),
        "nl": LanguageInfo("nl", "Dutch", "Nederlands"),
        "pl": LanguageInfo("pl", "Polish", "Polski"),
        "tr": LanguageInfo("tr", "Turkish", "Türkçe"),
    }
    
    def __init__(self, language_code: str = "en", translations_dir: Optional[Path] = None):
        """
        Initialize localization system.
        
        Args:
            language_code: ISO 639-1 language code (e.g., 'en', 'es', 'fr')
            translations_dir: Directory containing translation files
        """
        self.current_language = language_code
        self.translations_dir = translations_dir or Path(__file__).parent / "locales"
        self.translations: dict[str, dict[str, Any]] = {}
        self._fallback_language = "en"
        
        # Load translations
        self._load_translations()
        
    def _load_translations(self):
        """Load all translation files from disk."""
        if not self.translations_dir.exists():
            logger.warning(f"Translations directory not found: {self.translations_dir}")
            # Create directory structure
            self.translations_dir.mkdir(parents=True, exist_ok=True)
            return
        
        # Load fallback language first
        self._load_language(self._fallback_language)
        
        # Load current language
        if self.current_language != self._fallback_language:
            self._load_language(self.current_language)
    
    def _load_language(self, language_code: str):
        """Load translations for a specific language."""
        translation_file = self.translations_dir / f"{language_code}.json"
        
        if not translation_file.exists():
            logger.warning(f"Translation file not found: {translation_file}")
            return
        
        try:
            with open(translation_file, 'r', encoding='utf-8') as f:
                self.translations[language_code] = json.load(f)
            logger.info(f"Loaded translations for {language_code}")
        except Exception as e:
            logger.error(f"Failed to load translations for {language_code}: {e}")
    
    def set_language(self, language_code: str) -> bool:
        """
        Switch to a different language.
        
        Args:
            language_code: ISO 639-1 language code
            
        Returns:
            True if language was changed successfully
        """
        if language_code not in self.SUPPORTED_LANGUAGES:
            logger.error(f"Unsupported language: {language_code}")
            return False
        
        self.current_language = language_code
        
        # Load if not already loaded
        if language_code not in self.translations:
            self._load_language(language_code)
        
        logger.info(f"Language changed to {language_code}")
        return True
    
    def get(self, key: str, **kwargs) -> str:
        """
        Get translated string with variable interpolation.
        
        Args:
            key: Translation key (dot-notation, e.g., 'window.buttons.close')
            **kwargs: Variables to interpolate into the string
            
        Returns:
            Translated string with variables substituted
        """
        # Try current language first
        translation = self._get_nested_value(
            self.translations.get(self.current_language, {}),
            key
        )
        
        # Fallback to English if not found
        if translation is None:
            translation = self._get_nested_value(
                self.translations.get(self._fallback_language, {}),
                key
            )
        
        # Return key if no translation found
        if translation is None:
            logger.warning(f"Translation not found: {key}")
            return key
        
        # Handle pluralization
        if isinstance(translation, dict):
            count = kwargs.get('count', 1)
            translation = self._handle_plural(translation, count)
        
        # Interpolate variables
        if kwargs and isinstance(translation, str):
            try:
                translation = translation.format(**kwargs)
            except KeyError as e:
                logger.warning(f"Missing variable in translation: {e}")
        
        return translation
    
    def _get_nested_value(self, data: dict, key: str) -> Optional[Any]:
        """Get a nested value from a dict using dot notation."""
        keys = key.split('.')
        value = data
        
        for k in keys:
            if not isinstance(value, dict):
                return None
            value = value.get(k)
        
        return value
    
    def _handle_plural(self, translation_dict: dict, count: int) -> str:
        """
        Handle plural forms.
        
        Expects translation dict with keys: 'zero', 'one', 'other'
        """
        if count == 0 and 'zero' in translation_dict:
            return translation_dict['zero']
        elif count == 1 and 'one' in translation_dict:
            return translation_dict['one']
        else:
            return translation_dict.get('other', translation_dict.get('one', ''))
    
    def get_language_info(self, language_code: Optional[str] = None) -> LanguageInfo:
        """Get information about a language."""
        code = language_code or self.current_language
        return self.SUPPORTED_LANGUAGES.get(code, self.SUPPORTED_LANGUAGES['en'])
    
    def get_supported_languages(self) -> list[LanguageInfo]:
        """Get list of all supported languages."""
        return list(self.SUPPORTED_LANGUAGES.values())
    
    def is_rtl(self, language_code: Optional[str] = None) -> bool:
        """Check if a language is right-to-left."""
        info = self.get_language_info(language_code)
        return info.rtl
    
    def reload(self):
        """Reload all translations from disk."""
        self.translations.clear()
        self._load_translations()
        logger.info("Translations reloaded")


# Global singleton instance
_localization_instance: Optional[Localization] = None


def get_localization() -> Localization:
    """Get the global localization instance."""
    global _localization_instance
    if _localization_instance is None:
        _localization_instance = Localization()
    return _localization_instance


def set_language(language_code: str) -> bool:
    """Set the global language."""
    loc = get_localization()
    return loc.set_language(language_code)


def get_current_language() -> str:
    """Get the current language code."""
    loc = get_localization()
    return loc.current_language
