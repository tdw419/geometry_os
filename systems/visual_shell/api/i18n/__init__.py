"""
Internationalization (i18n) module for Native Glyph Shell
Provides localization support for multiple languages
"""

from .localization import Localization, get_localization, set_language, get_current_language
from .translation_manager import TranslationManager

__all__ = [
    'Localization',
    'TranslationManager',
    'get_localization',
    'set_language',
    'get_current_language',
]
