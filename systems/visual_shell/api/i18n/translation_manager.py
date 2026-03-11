"""
Translation Manager
Manages translation files and provides utilities for translation workflow
"""

import json
import logging
from pathlib import Path
from typing import Any, Optional

logger = logging.getLogger("i18n.translation_manager")


class TranslationManager:
    """
    Manages translation files and provides utilities for:
    - Creating new translation files
    - Validating translations
    - Comparing translations between languages
    - Exporting/importing translations
    """
    
    def __init__(self, translations_dir: Path):
        self.translations_dir = Path(translations_dir)
        self.translations_dir.mkdir(parents=True, exist_ok=True)
    
    def create_translation_file(self, language_code: str, base_language: str = "en") -> bool:
        """
        Create a new translation file based on an existing language.
        
        Args:
            language_code: Target language code
            base_language: Source language to copy structure from
            
        Returns:
            True if file was created successfully
        """
        target_file = self.translations_dir / f"{language_code}.json"
        
        if target_file.exists():
            logger.warning(f"Translation file already exists: {target_file}")
            return False
        
        # Load base language
        base_file = self.translations_dir / f"{base_language}.json"
        if not base_file.exists():
            logger.error(f"Base language file not found: {base_file}")
            return False
        
        try:
            with open(base_file, 'r', encoding='utf-8') as f:
                base_translations = json.load(f)
            
            # Create template with empty strings
            template = self._create_template(base_translations)
            
            # Write new file
            with open(target_file, 'w', encoding='utf-8') as f:
                json.dump(template, f, ensure_ascii=False, indent=2)
            
            logger.info(f"Created translation file: {target_file}")
            return True
        except Exception as e:
            logger.error(f"Failed to create translation file: {e}")
            return False
    
    def _create_template(self, base_translations: dict) -> dict:
        """Create a translation template with empty values."""
        template = {}
        
        for key, value in base_translations.items():
            if isinstance(value, dict):
                template[key] = self._create_template(value)
            else:
                template[key] = ""  # Empty string to be filled in
        
        return template
    
    def validate_translations(self, language_code: str) -> list[str]:
        """
        Validate a translation file for missing or invalid entries.
        
        Returns:
            List of validation errors
        """
        errors = []
        
        # Load base language (English)
        base_file = self.translations_dir / "en.json"
        if not base_file.exists():
            errors.append("Base language file (en.json) not found")
            return errors
        
        target_file = self.translations_dir / f"{language_code}.json"
        if not target_file.exists():
            errors.append(f"Translation file not found: {language_code}.json")
            return errors
        
        try:
            with open(base_file, 'r', encoding='utf-8') as f:
                base_translations = json.load(f)
            
            with open(target_file, 'r', encoding='utf-8') as f:
                target_translations = json.load(f)
            
            # Check for missing keys
            missing_keys = self._find_missing_keys(base_translations, target_translations)
            if missing_keys:
                errors.append(f"Missing translations: {', '.join(missing_keys)}")
            
            # Check for empty values
            empty_keys = self._find_empty_values(target_translations)
            if empty_keys:
                errors.append(f"Empty translations: {', '.join(empty_keys)}")
            
            # Check for invalid placeholders
            placeholder_errors = self._validate_placeholders(base_translations, target_translations)
            errors.extend(placeholder_errors)
            
        except Exception as e:
            errors.append(f"Validation error: {e}")
        
        return errors
    
    def _find_missing_keys(self, base: dict, target: dict, prefix: str = "") -> list[str]:
        """Find keys present in base but missing in target."""
        missing = []
        
        for key, value in base.items():
            full_key = f"{prefix}.{key}" if prefix else key
            
            if key not in target:
                missing.append(full_key)
            elif isinstance(value, dict):
                missing.extend(self._find_missing_keys(value, target.get(key, {}), full_key))
        
        return missing
    
    def _find_empty_values(self, translations: dict, prefix: str = "") -> list[str]:
        """Find keys with empty string values."""
        empty = []
        
        for key, value in translations.items():
            full_key = f"{prefix}.{key}" if prefix else key
            
            if isinstance(value, dict):
                empty.extend(self._find_empty_values(value, full_key))
            elif value == "":
                empty.append(full_key)
        
        return empty
    
    def _validate_placeholders(self, base: dict, target: dict, prefix: str = "") -> list[str]:
        """Validate that placeholders in translations match the base language."""
        errors = []
        
        for key, base_value in base.items():
            full_key = f"{prefix}.{key}" if prefix else key
            
            if key not in target:
                continue
            
            target_value = target[key]
            
            if isinstance(base_value, dict) and isinstance(target_value, dict):
                errors.extend(self._validate_placeholders(base_value, target_value, full_key))
            elif isinstance(base_value, str) and isinstance(target_value, str):
                # Extract placeholders from both strings
                import re
                base_placeholders = set(re.findall(r'\{(\w+)\}', base_value))
                target_placeholders = set(re.findall(r'\{(\w+)\}', target_value))
                
                if base_placeholders != target_placeholders:
                    missing = base_placeholders - target_placeholders
                    extra = target_placeholders - base_placeholders
                    
                    if missing:
                        errors.append(f"{full_key}: Missing placeholders {missing}")
                    if extra:
                        errors.append(f"{full_key}: Extra placeholders {extra}")
        
        return errors
    
    def get_completion_stats(self, language_code: str) -> dict[str, Any]:
        """
        Get translation completion statistics for a language.
        
        Returns:
            Dict with total, translated, empty, and percentage
        """
        base_file = self.translations_dir / "en.json"
        target_file = self.translations_dir / f"{language_code}.json"
        
        if not base_file.exists() or not target_file.exists():
            return {"error": "Translation files not found"}
        
        try:
            with open(base_file, 'r', encoding='utf-8') as f:
                base_translations = json.load(f)
            
            with open(target_file, 'r', encoding='utf-8') as f:
                target_translations = json.load(f)
            
            total = self._count_keys(base_translations)
            translated = self._count_translated(target_translations)
            
            return {
                "total": total,
                "translated": translated,
                "empty": total - translated,
                "percentage": (translated / total * 100) if total > 0 else 0
            }
        except Exception as e:
            return {"error": str(e)}
    
    def _count_keys(self, translations: dict) -> int:
        """Count total number of translation keys."""
        count = 0
        for value in translations.values():
            if isinstance(value, dict):
                count += self._count_keys(value)
            else:
                count += 1
        return count
    
    def _count_translated(self, translations: dict) -> int:
        """Count number of non-empty translations."""
        count = 0
        for value in translations.values():
            if isinstance(value, dict):
                count += self._count_translated(value)
            elif value != "":
                count += 1
        return count
    
    def export_to_csv(self, language_code: str, output_file: Path) -> bool:
        """
        Export translations to CSV format for easier editing.
        
        Args:
            language_code: Language to export
            output_file: Output CSV file path
            
        Returns:
            True if export was successful
        """
        import csv
        
        translation_file = self.translations_dir / f"{language_code}.json"
        if not translation_file.exists():
            logger.error(f"Translation file not found: {translation_file}")
            return False
        
        try:
            with open(translation_file, 'r', encoding='utf-8') as f:
                translations = json.load(f)
            
            # Flatten translations
            flat = self._flatten_dict(translations)
            
            # Write CSV
            with open(output_file, 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(['Key', 'Translation'])
                
                for key, value in sorted(flat.items()):
                    writer.writerow([key, value])
            
            logger.info(f"Exported translations to {output_file}")
            return True
        except Exception as e:
            logger.error(f"Failed to export translations: {e}")
            return False
    
    def import_from_csv(self, language_code: str, input_file: Path) -> bool:
        """
        Import translations from CSV file.
        
        Args:
            language_code: Target language code
            input_file: Input CSV file path
            
        Returns:
            True if import was successful
        """
        import csv
        
        try:
            # Read CSV
            flat_translations = {}
            with open(input_file, 'r', encoding='utf-8') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    flat_translations[row['Key']] = row['Translation']
            
            # Unflatten
            translations = self._unflatten_dict(flat_translations)
            
            # Write JSON
            output_file = self.translations_dir / f"{language_code}.json"
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(translations, f, ensure_ascii=False, indent=2)
            
            logger.info(f"Imported translations from {input_file}")
            return True
        except Exception as e:
            logger.error(f"Failed to import translations: {e}")
            return False
    
    def _flatten_dict(self, d: dict, parent_key: str = '', sep: str = '.') -> dict:
        """Flatten nested dictionary to dot-notation keys."""
        items = []
        for k, v in d.items():
            new_key = f"{parent_key}{sep}{k}" if parent_key else k
            if isinstance(v, dict):
                items.extend(self._flatten_dict(v, new_key, sep=sep).items())
            else:
                items.append((new_key, v))
        return dict(items)
    
    def _unflatten_dict(self, flat: dict, sep: str = '.') -> dict:
        """Unflatten dot-notation keys to nested dictionary."""
        result = {}
        for key, value in flat.items():
            parts = key.split(sep)
            d = result
            for part in parts[:-1]:
                if part not in d:
                    d[part] = {}
                d = d[part]
            d[parts[-1]] = value
        return result
