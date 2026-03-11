#!/usr/bin/env python3
"""
Tests for the Native Glyph Shell Training Program

Verifies that all training materials and scripts are functional.
"""

import pytest
import sys
from pathlib import Path
import tempfile
import json

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from scripts.glyph_shell_tutorial import GlyphShellTutorial, Module, Exercise
from scripts.training_feedback_survey import FeedbackSurvey, FeedbackResponse
from scripts.generate_training_certificate import CertificateGenerator


class TestTrainingMaterials:
    """Tests for training documentation and materials."""
    
    def test_training_program_exists(self):
        """Verify training program documentation exists."""
        path = Path("docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md")
        assert path.exists(), "Training program documentation should exist"
    
    def test_quick_reference_exists(self):
        """Verify quick reference guide exists."""
        path = Path("docs/training/GLYPH_SHELL_QUICK_REFERENCE.md")
        assert path.exists(), "Quick reference guide should exist"
    
    def test_training_readme_exists(self):
        """Verify training README exists."""
        path = Path("docs/training/README.md")
        assert path.exists(), "Training README should exist"
    
    def test_training_program_has_modules(self):
        """Verify training program contains all 7 modules."""
        path = Path("docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md")
        content = path.read_text()
        
        for i in range(1, 8):
            assert f"Module {i}" in content, f"Training should include Module {i}"
    
    def test_training_program_has_assessment(self):
        """Verify training program includes assessment."""
        path = Path("docs/training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md")
        content = path.read_text()
        
        assert "Assessment" in content, "Training should include assessment section"
        assert "Quiz" in content, "Training should include quiz"
    
    def test_quick_reference_has_shortcuts(self):
        """Verify quick reference includes keyboard shortcuts."""
        path = Path("docs/training/GLYPH_SHELL_QUICK_REFERENCE.md")
        content = path.read_text()
        
        assert "Ctrl+P" in content, "Quick reference should include Ctrl+P shortcut"
        assert "Ctrl+H" in content, "Quick reference should include Ctrl+H shortcut"


class TestInteractiveTutorial:
    """Tests for the interactive tutorial script."""
    
    def test_tutorial_initialization(self):
        """Verify tutorial initializes correctly."""
        tutorial = GlyphShellTutorial(skip_intro=True)
        
        assert tutorial is not None
        assert len(tutorial.modules) == 7, "Tutorial should have 7 modules"
    
    def test_tutorial_modules_have_exercises(self):
        """Verify all modules have exercises."""
        tutorial = GlyphShellTutorial(skip_intro=True)
        
        for module in tutorial.modules:
            assert len(module.exercises) > 0, f"Module {module.number} should have exercises"
    
    def test_tutorial_command_checking(self):
        """Verify command checking works."""
        tutorial = GlyphShellTutorial(skip_intro=True)
        
        # Test exact match
        assert tutorial._check_command("g help", "g help")
        
        # Test with arguments
        assert tutorial._check_command("g ai test", "g ai anything")
        
        # Test failure
        assert not tutorial._check_command("ls", "g help")
    
    def test_tutorial_score_calculation(self):
        """Verify score calculation."""
        tutorial = GlyphShellTutorial(skip_intro=True)
        
        max_score = tutorial._calculate_max_score()
        assert max_score > 0, "Max score should be positive"


class TestFeedbackSurvey:
    """Tests for the feedback survey system."""
    
    def test_survey_initialization(self):
        """Verify survey initializes correctly."""
        with tempfile.TemporaryDirectory() as tmpdir:
            survey = FeedbackSurvey()
            survey.FEEDBACK_DIR = Path(tmpdir)
            survey.FEEDBACK_FILE = Path(tmpdir) / "feedback_responses.json"
            
            assert survey is not None
    
    def test_survey_response_creation(self):
        """Verify feedback response can be created."""
        response = FeedbackResponse(
            timestamp="2026-03-11T00:00:00",
            user_id="test123",
            session_id="session456",
            overall_rating=5,
            content_quality=4,
            exercise_relevance=4,
            difficulty_level=3,
            pace=4,
            module_ratings={"Module 1: Getting Started": 5},
            most_helpful_module="Module 3: Geometry OS Commands",
            needs_improvement_module="Module 7: Troubleshooting",
            what_worked_well="Interactive exercises",
            what_needs_improvement="More visual examples",
            additional_topics="WGSL shaders",
            suggestions="Add video tutorials",
            time_to_complete_minutes=120,
            completed_all_exercises=True,
            would_recommend=True,
            encountered_issues=False,
            issues_description=""
        )
        
        assert response.overall_rating == 5
        assert response.would_recommend is True
    
    def test_survey_report_generation(self):
        """Verify report generation works."""
        with tempfile.TemporaryDirectory() as tmpdir:
            survey = FeedbackSurvey()
            survey.FEEDBACK_DIR = Path(tmpdir)
            survey.FEEDBACK_FILE = Path(tmpdir) / "feedback_responses.json"
            
            # Add a test response
            survey.responses = [
                FeedbackResponse(
                    timestamp="2026-03-11T00:00:00",
                    user_id="test123",
                    session_id="session456",
                    overall_rating=5,
                    content_quality=4,
                    exercise_relevance=4,
                    difficulty_level=3,
                    pace=4,
                    module_ratings={},
                    most_helpful_module="Module 1",
                    needs_improvement_module="Module 2",
                    what_worked_well="Good",
                    what_needs_improvement="Better",
                    additional_topics="",
                    suggestions="",
                    time_to_complete_minutes=120,
                    completed_all_exercises=True,
                    would_recommend=True,
                    encountered_issues=False,
                    issues_description=""
                )
            ]
            
            report = survey.generate_report()
            
            assert "TRAINING FEEDBACK SUMMARY REPORT" in report
            assert "Total Responses: 1" in report
    
    def test_survey_csv_export(self):
        """Verify CSV export works."""
        with tempfile.TemporaryDirectory() as tmpdir:
            survey = FeedbackSurvey()
            survey.FEEDBACK_DIR = Path(tmpdir)
            survey.FEEDBACK_FILE = Path(tmpdir) / "feedback_responses.json"
            
            # Add a test response
            survey.responses = [
                FeedbackResponse(
                    timestamp="2026-03-11T00:00:00",
                    user_id="test123",
                    session_id="session456",
                    overall_rating=5,
                    content_quality=4,
                    exercise_relevance=4,
                    difficulty_level=3,
                    pace=4,
                    module_ratings={},
                    most_helpful_module="Module 1",
                    needs_improvement_module="Module 2",
                    what_worked_well="Good",
                    what_needs_improvement="Better",
                    additional_topics="",
                    suggestions="",
                    time_to_complete_minutes=120,
                    completed_all_exercises=True,
                    would_recommend=True,
                    encountered_issues=False,
                    issues_description=""
                )
            ]
            
            output_path = Path(tmpdir) / "export.csv"
            survey.export_csv(str(output_path))
            
            assert output_path.exists()
            content = output_path.read_text()
            assert "timestamp" in content
            assert "overall_rating" in content


class TestCertificateGenerator:
    """Tests for the certificate generator."""
    
    def test_certificate_initialization(self):
        """Verify certificate generator initializes."""
        with tempfile.TemporaryDirectory() as tmpdir:
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            
            assert generator is not None
            assert generator.user_name == "Test User"
            assert generator.certificate_id is not None
    
    def test_certificate_id_generation(self):
        """Verify certificate ID is unique."""
        with tempfile.TemporaryDirectory() as tmpdir:
            gen1 = CertificateGenerator("User 1", output_dir=tmpdir)
            gen2 = CertificateGenerator("User 2", output_dir=tmpdir)
            
            assert gen1.certificate_id != gen2.certificate_id
    
    def test_text_certificate_generation(self):
        """Verify text certificate is generated."""
        with tempfile.TemporaryDirectory() as tmpdir:
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            cert = generator.generate_text_certificate()
            
            assert "CERTIFICATE OF COMPLETION" in cert
            assert "Test User" in cert
            assert generator.certificate_id in cert
    
    def test_markdown_certificate_generation(self):
        """Verify markdown certificate is generated."""
        with tempfile.TemporaryDirectory() as tmpdir:
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            cert = generator.generate_markdown_certificate()
            
            assert "# 🎓 Certificate of Completion" in cert
            assert "Test User" in cert
            assert "Skills Acquired" in cert
    
    def test_html_certificate_generation(self):
        """Verify HTML certificate is generated."""
        with tempfile.TemporaryDirectory() as tmpdir:
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            cert = generator.generate_html_certificate()
            
            assert "<!DOCTYPE html>" in cert
            assert "Test User" in cert
            assert "certificate" in cert.lower()
    
    def test_certificate_saving(self):
        """Verify certificates are saved correctly."""
        with tempfile.TemporaryDirectory() as tmpdir:
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            paths = generator.save_certificates()
            
            assert 'text' in paths
            assert 'markdown' in paths
            assert 'html' in paths
            
            for path in paths.values():
                assert path.exists()


class TestTrainingIntegration:
    """Integration tests for the complete training workflow."""
    
    def test_complete_workflow(self):
        """Test the complete training workflow."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # 1. Initialize tutorial
            tutorial = GlyphShellTutorial(skip_intro=True, practice_mode=True)
            assert len(tutorial.modules) == 7
            
            # 2. Initialize survey
            survey = FeedbackSurvey()
            survey.FEEDBACK_DIR = Path(tmpdir)
            survey.FEEDBACK_FILE = Path(tmpdir) / "feedback_responses.json"
            
            # 3. Add feedback
            survey.responses = [
                FeedbackResponse(
                    timestamp="2026-03-11T00:00:00",
                    user_id="test",
                    session_id="test",
                    overall_rating=5,
                    content_quality=5,
                    exercise_relevance=5,
                    difficulty_level=4,
                    pace=4,
                    module_ratings={},
                    most_helpful_module="Module 3",
                    needs_improvement_module="Module 7",
                    what_worked_well="Everything",
                    what_needs_improvement="Nothing",
                    additional_topics="",
                    suggestions="",
                    time_to_complete_minutes=150,
                    completed_all_exercises=True,
                    would_recommend=True,
                    encountered_issues=False,
                    issues_description=""
                )
            ]
            
            # 4. Generate report
            report = survey.generate_report()
            assert "TRAINING FEEDBACK SUMMARY REPORT" in report
            
            # 5. Generate certificate
            generator = CertificateGenerator("Test User", output_dir=tmpdir)
            paths = generator.save_certificates()
            assert len(paths) == 3


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
