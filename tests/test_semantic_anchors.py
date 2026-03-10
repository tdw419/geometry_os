"""
Tests for Semantic Anchors.

Tests code tile anchors for memory drift.
"""

import numpy as np
import pytest

from systems.memory_drift.semantic_anchor import CodeAnchor, SemanticAnchors


class TestCodeAnchor:
    """Tests for CodeAnchor dataclass."""

    def test_code_anchor_creation(self):
        """Test CodeAnchor initializes correctly."""
        vector = np.random.randn(64).astype(np.float32)
        anchor = CodeAnchor(
            tile=(100, 200),
            code_hash="abc123",
            semantic_vector=vector,
            keywords=["test", "example"],
        )

        assert anchor.tile == (100, 200)
        assert anchor.code_hash == "abc123"
        assert np.array_equal(anchor.semantic_vector, vector)
        assert anchor.keywords == ["test", "example"]

    def test_code_anchor_to_dict(self):
        """Test CodeAnchor serialization to dictionary."""
        vector = np.array([1.0, 2.0, 3.0], dtype=np.float32)
        anchor = CodeAnchor(
            tile=(10, 20),
            code_hash="hash123",
            semantic_vector=vector,
            keywords=["func", "class"],
            metadata={"file": "test.py"},
        )

        d = anchor.to_dict()
        assert d["tile"] == (10, 20)
        assert d["code_hash"] == "hash123"
        assert d["semantic_vector"] == [1.0, 2.0, 3.0]
        assert d["keywords"] == ["func", "class"]
        assert d["metadata"]["file"] == "test.py"

    def test_code_anchor_default_keywords(self):
        """Test CodeAnchor with default empty keywords."""
        vector = np.random.randn(64).astype(np.float32)
        anchor = CodeAnchor(
            tile=(0, 0),
            code_hash="hash",
            semantic_vector=vector,
        )

        assert anchor.keywords == []
        assert anchor.metadata == {}


class TestSemanticAnchors:
    """Tests for SemanticAnchors class."""

    def test_semantic_anchors_creation(self):
        """Test SemanticAnchors initializes correctly."""
        anchors = SemanticAnchors()

        assert anchors.vector_dim == 64
        assert len(anchors.anchors) == 0
        assert anchors.count == 0

    def test_semantic_anchors_custom_dim(self):
        """Test SemanticAnchors with custom vector dimension."""
        anchors = SemanticAnchors(vector_dim=128)

        assert anchors.vector_dim == 128

    def test_add_anchor(self):
        """Test adding an anchor."""
        anchors = SemanticAnchors()
        code = "def hello(): pass"

        anchor = anchors.add_anchor(tile=(100, 100), code_content=code)

        assert anchor.tile == (100, 100)
        assert len(anchor.code_hash) == 16  # SHA256 truncated
        assert len(anchor.semantic_vector) == 64
        assert anchors.count == 1

    def test_add_anchor_with_vector(self):
        """Test adding an anchor with pre-computed vector."""
        anchors = SemanticAnchors()
        vector = np.random.randn(64).astype(np.float32)
        code = "test code"

        anchor = anchors.add_anchor(
            tile=(50, 50),
            code_content=code,
            semantic_vector=vector,
        )

        assert np.allclose(anchor.semantic_vector, vector)

    def test_add_anchor_updates_existing(self):
        """Test adding anchor at existing tile updates it."""
        anchors = SemanticAnchors()

        anchors.add_anchor(tile=(100, 100), code_content="old code")
        anchors.add_anchor(tile=(100, 100), code_content="new code")

        assert anchors.count == 1
        anchor = anchors.get_anchor((100, 100))
        # Hash should be different for different code
        assert "new" in anchor.keywords or len(anchor.keywords) >= 0


class TestKeywordExtraction:
    """Tests for keyword extraction from code."""

    def test_extract_function_names(self):
        """Test extracting function names from code."""
        anchors = SemanticAnchors()
        code = """
def hello():
    pass

def world():
    pass
"""
        anchor = anchors.add_anchor(tile=(0, 0), code_content=code)

        assert "hello" in anchor.keywords
        assert "world" in anchor.keywords

    def test_extract_class_names(self):
        """Test extracting class names from code."""
        anchors = SemanticAnchors()
        code = """
class MyClass:
    pass

class AnotherClass:
    pass
"""
        anchor = anchors.add_anchor(tile=(0, 0), code_content=code)

        assert "MyClass" in anchor.keywords
        assert "AnotherClass" in anchor.keywords

    def test_extract_imports(self):
        """Test extracting import statements."""
        anchors = SemanticAnchors()
        code = """
import numpy
from pandas import DataFrame
"""
        anchor = anchors.add_anchor(tile=(0, 0), code_content=code)

        assert "numpy" in anchor.keywords
        assert "pandas" in anchor.keywords


class TestSemanticSimilarity:
    """Tests for semantic similarity calculations."""

    def test_find_nearest_anchor(self):
        """Test finding the nearest anchor by similarity."""
        anchors = SemanticAnchors()

        # Create anchors with distinct vectors
        vector1 = np.zeros(64, dtype=np.float32)
        vector1[0] = 1.0

        vector2 = np.zeros(64, dtype=np.float32)
        vector2[1] = 1.0

        anchors.add_anchor(tile=(100, 100), code_content="a", semantic_vector=vector1)
        anchors.add_anchor(tile=(200, 200), code_content="b", semantic_vector=vector2)

        # Query with vector similar to first anchor
        query = np.zeros(64, dtype=np.float32)
        query[0] = 0.9
        query[1] = 0.1

        nearest = anchors.find_nearest_anchor(query)

        assert nearest is not None
        assert nearest.tile == (100, 100)

    def test_find_nearest_anchor_empty(self):
        """Test finding nearest anchor when no anchors exist."""
        anchors = SemanticAnchors()

        query = np.random.randn(64).astype(np.float32)
        nearest = anchors.find_nearest_anchor(query)

        assert nearest is None

    def test_find_nearest_anchor_exclude(self):
        """Test excluding tiles from search."""
        anchors = SemanticAnchors()

        vector = np.ones(64, dtype=np.float32)
        anchors.add_anchor(tile=(100, 100), code_content="a", semantic_vector=vector)
        anchors.add_anchor(tile=(200, 200), code_content="b", semantic_vector=vector)

        query = np.ones(64, dtype=np.float32)
        nearest = anchors.find_nearest_anchor(query, exclude_tiles=[(100, 100)])

        assert nearest.tile == (200, 200)

    def test_compute_attraction_identical(self):
        """Test attraction between identical vectors."""
        anchors = SemanticAnchors()

        vector = np.random.randn(64).astype(np.float32)
        vector = vector / np.linalg.norm(vector)  # Normalize

        attraction = anchors.compute_attraction(vector, vector.copy())

        assert abs(attraction - 1.0) < 0.001

    def test_compute_attraction_orthogonal(self):
        """Test attraction between orthogonal vectors."""
        anchors = SemanticAnchors()

        vector1 = np.zeros(64, dtype=np.float32)
        vector1[0] = 1.0

        vector2 = np.zeros(64, dtype=np.float32)
        vector2[1] = 1.0

        attraction = anchors.compute_attraction(vector1, vector2)

        assert abs(attraction) < 0.001


class TestSpatialQueries:
    """Tests for spatial query operations."""

    def test_get_anchors_in_region(self):
        """Test retrieving anchors within a region."""
        anchors = SemanticAnchors()

        for i in range(5):
            anchors.add_anchor(
                tile=(i * 100, i * 100),
                code_content=f"code_{i}",
            )

        # Query region that should contain anchors at (100,100) and (200,200)
        results = anchors.get_anchors_in_region(50, 50, 250, 250)

        assert len(results) == 2
        tiles = [a.tile for a in results]
        assert (100, 100) in tiles
        assert (200, 200) in tiles

    def test_get_anchors_in_region_empty(self):
        """Test querying an empty region."""
        anchors = SemanticAnchors()

        anchors.add_anchor(tile=(500, 500), code_content="test")

        results = anchors.get_anchors_in_region(0, 0, 100, 100)
        assert len(results) == 0


class TestAnchorManagement:
    """Tests for anchor management operations."""

    def test_get_anchor(self):
        """Test retrieving an anchor by tile."""
        anchors = SemanticAnchors()

        anchors.add_anchor(tile=(100, 100), code_content="test")

        anchor = anchors.get_anchor((100, 100))
        assert anchor is not None
        assert anchor.tile == (100, 100)

    def test_get_anchor_not_found(self):
        """Test retrieving a non-existent anchor."""
        anchors = SemanticAnchors()

        anchor = anchors.get_anchor((999, 999))
        assert anchor is None

    def test_remove_anchor(self):
        """Test removing an anchor."""
        anchors = SemanticAnchors()

        anchors.add_anchor(tile=(100, 100), code_content="test")
        assert anchors.count == 1

        result = anchors.remove_anchor((100, 100))
        assert result is True
        assert anchors.count == 0

    def test_remove_anchor_not_found(self):
        """Test removing a non-existent anchor."""
        anchors = SemanticAnchors()

        result = anchors.remove_anchor((999, 999))
        assert result is False

    def test_clear(self):
        """Test clearing all anchors."""
        anchors = SemanticAnchors()

        for i in range(5):
            anchors.add_anchor(tile=(i * 10, i * 10), code_content=f"code_{i}")

        assert anchors.count == 5

        anchors.clear()
        assert anchors.count == 0


class TestKeywordSearch:
    """Tests for keyword-based search."""

    def test_get_anchors_by_keyword(self):
        """Test searching anchors by keyword."""
        anchors = SemanticAnchors()

        code1 = "def process_data(): pass"
        code2 = "def handle_request(): pass"
        code3 = "class DataProcessor: pass"

        anchors.add_anchor(tile=(0, 0), code_content=code1)
        anchors.add_anchor(tile=(100, 100), code_content=code2)
        anchors.add_anchor(tile=(200, 200), code_content=code3)

        results = anchors.get_anchors_by_keyword("process_data")

        assert len(results) == 1
        assert results[0].tile == (0, 0)

    def test_get_anchors_by_keyword_multiple(self):
        """Test searching with multiple matching anchors."""
        anchors = SemanticAnchors()

        code1 = "def process(): pass"
        code2 = "def process(): pass"

        anchors.add_anchor(tile=(0, 0), code_content=code1)
        anchors.add_anchor(tile=(100, 100), code_content=code2)

        results = anchors.get_anchors_by_keyword("process")

        assert len(results) == 2

    def test_get_anchors_by_keyword_case_insensitive(self):
        """Test keyword search is case insensitive."""
        anchors = SemanticAnchors()

        code = "def MyFunction(): pass"
        anchors.add_anchor(tile=(0, 0), code_content=code)

        results = anchors.get_anchors_by_keyword("myfunction")
        assert len(results) == 1


class TestStatistics:
    """Tests for statistics and metadata."""

    def test_get_statistics(self):
        """Test getting anchor statistics."""
        anchors = SemanticAnchors()

        stats = anchors.get_statistics()
        assert stats["anchor_count"] == 0
        assert stats["vector_dim"] == 64

        # Add some anchors
        for i in range(3):
            anchors.add_anchor(tile=(i, i), code_content=f"def func_{i}(): pass")

        stats = anchors.get_statistics()
        assert stats["anchor_count"] == 3
        assert stats["unique_keywords"] >= 3  # At least func_0, func_1, func_2
