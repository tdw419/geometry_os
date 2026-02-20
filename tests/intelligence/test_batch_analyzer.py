#!/usr/bin/env python3
"""
Integration tests for BatchAnalyzer.

Tests the full batch processing pipeline including:
- Initialization with correct data paths
- Processing of 100 Genesis verses
- Report structure validation
- Truth manifold texture generation
- Performance timing validation
"""

import json
import os
import time
import unittest
import tempfile
import shutil
from PIL import Image

from systems.intelligence.batch_analyzer import BatchAnalyzer


class TestBatchAnalyzer(unittest.TestCase):
    """Integration tests for BatchAnalyzer pipeline."""

    def setUp(self):
        """Set up test fixtures with temp directories."""
        # Create temp directory for outputs
        self.test_dir = tempfile.mkdtemp()

        # Path to the real data file
        base_dir = os.path.dirname(os.path.abspath(__file__))
        project_root = os.path.normpath(os.path.join(base_dir, '..', '..'))
        self.data_path = os.path.join(project_root, 'systems', 'intelligence', 'data', 'genesis_kjv.json')

        # Output paths in temp directory
        self.output_path = os.path.join(self.test_dir, 'genesis_pilot_report.json')
        self.texture_path = os.path.join(self.test_dir, 'genesis_truth_manifold.rts.png')

    def tearDown(self):
        """Clean up temp directories."""
        if os.path.exists(self.test_dir):
            shutil.rmtree(self.test_dir)

    def test_batch_initialization(self):
        """BatchAnalyzer creates with correct paths."""
        analyzer = BatchAnalyzer(self.data_path, self.output_path)

        self.assertEqual(analyzer.data_path, self.data_path,
            f"Data path mismatch: {analyzer.data_path} != {self.data_path}")
        self.assertEqual(analyzer.output_path, self.output_path,
            f"Output path mismatch: {analyzer.output_path} != {self.output_path}")
        self.assertIsNotNone(analyzer.analyzer,
            "ScriptureTruthAnalyzer not initialized")

    def test_100_verses_processed(self):
        """Run batch, verify 100 results."""
        analyzer = BatchAnalyzer(self.data_path, self.output_path)

        # Run with limited verses for faster test
        analyzer.run_pilot(max_verses=100)

        # Verify report exists and has 100 verses
        self.assertTrue(os.path.exists(self.output_path),
            f"Report file not created at {self.output_path}")

        with open(self.output_path, 'r') as f:
            report = json.load(f)

        self.assertIn('verses', report, "Report missing 'verses' key")
        self.assertEqual(len(report['verses']), 100,
            f"Expected 100 verses, got {len(report['verses'])}")

    def test_report_structure(self):
        """Report has metadata, ctrm_system_report, verses."""
        analyzer = BatchAnalyzer(self.data_path, self.output_path)
        analyzer.run_pilot(max_verses=100)

        with open(self.output_path, 'r') as f:
            report = json.load(f)

        # Check top-level structure
        self.assertIn('report_metadata', report,
            "Report missing 'report_metadata' key")
        self.assertIn('ctrm_system_report', report,
            "Report missing 'ctrm_system_report' key")
        self.assertIn('verses', report,
            "Report missing 'verses' key")

        # Check metadata structure
        metadata = report['report_metadata']
        self.assertIn('system', metadata,
            "Metadata missing 'system'")
        self.assertIn('total_verses', metadata,
            "Metadata missing 'total_verses'")

        # Check CTRM system report structure
        ctrm = report['ctrm_system_report']
        self.assertIn('system_metrics', ctrm,
            "CTRM report missing 'system_metrics'")

        metrics = ctrm['system_metrics']
        self.assertIn('cronbach_alpha', metrics,
            "System metrics missing 'cronbach_alpha'")
        self.assertIn('pearson_r1', metrics,
            "System metrics missing 'pearson_r1'")

        # Check verse structure
        first_verse = report['verses'][0]
        self.assertIn('reference', first_verse,
            "Verse missing 'reference'")
        self.assertIn('text', first_verse,
            "Verse missing 'text'")
        self.assertIn('category', first_verse,
            "Verse missing 'category'")
        self.assertIn('triad_scores', first_verse,
            "Verse missing 'triad_scores'")

        # Check triad scores structure
        triad = first_verse['triad_scores']
        self.assertIn('E1_archaeology', triad,
            "Triad scores missing 'E1_archaeology'")
        self.assertIn('E2_manuscript', triad,
            "Triad scores missing 'E2_manuscript'")
        self.assertIn('E3_prophecy', triad,
            "Triad scores missing 'E3_prophecy'")

    def test_texture_generated(self):
        """PNG file exists after batch run."""
        analyzer = BatchAnalyzer(self.data_path, self.output_path)

        # Run the batch - this generates the texture at CWD
        # We need to handle this differently since batch_analyzer writes to CWD
        original_cwd = os.getcwd()
        try:
            os.chdir(self.test_dir)
            analyzer.run_pilot(max_verses=100)

            # Check for texture in test directory
            texture_path = os.path.join(self.test_dir, 'genesis_truth_manifold.rts.png')
            self.assertTrue(os.path.exists(texture_path),
                f"Texture file not created at {texture_path}")

            # Verify it's a valid PNG image
            img = Image.open(texture_path)
            self.assertEqual(img.size, (10, 10),
                f"Texture size mismatch: expected (10, 10), got {img.size}")
            self.assertEqual(img.mode, 'RGBA',
                f"Texture mode mismatch: expected RGBA, got {img.mode}")

        finally:
            os.chdir(original_cwd)

    def test_processing_time(self):
        """Batch completes in < 30 seconds."""
        analyzer = BatchAnalyzer(self.data_path, self.output_path)

        start_time = time.time()

        original_cwd = os.getcwd()
        try:
            os.chdir(self.test_dir)
            analyzer.run_pilot(max_verses=100)
        finally:
            os.chdir(original_cwd)

        elapsed_time = time.time() - start_time

        self.assertLess(elapsed_time, 30.0,
            f"Batch processing took {elapsed_time:.2f}s, expected < 30s")


if __name__ == "__main__":
    unittest.main()
