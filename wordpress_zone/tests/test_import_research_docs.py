#!/usr/bin/env python3
"""
Unit tests for import_research_docs.py

Tests cover:
- parse_document() with sample filenames
- discover_documents() with mock directory
- SHA256 hash calculation
- Title extraction from filename patterns
- import_batch() with mocked API
- import_document_with_retry() error handling
- update_progress() with mocked requests
"""

import os
import sys
import tempfile
import shutil
import hashlib
import pytest
from unittest.mock import patch, MagicMock

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from import_research_docs import (
    ResearchDocument,
    extract_title_from_filename,
    calculate_file_hash,
    discover_documents,
    parse_document,
    import_document_with_retry,
    import_batch,
    update_progress,
    run_full_import,
)


class TestExtractTitleFromFilename:
    """Tests for title extraction from filename patterns."""

    def test_standard_pattern(self):
        """Test standard pattern: {number}_{topic}{iteration}.txt"""
        # 107_rre_recursive_development_system12.txt -> "Rre Recursive Development System"
        result = extract_title_from_filename(
            "/some/path/107_rre_recursive_development_system12.txt"
        )
        assert result == "Rre Recursive Development System"

    def test_no_iteration_number(self):
        """Test pattern without trailing iteration number."""
        result = extract_title_from_filename(
            "/some/path/42_neural_network_basics.txt"
        )
        assert result == "Neural Network Basics"

    def test_no_leading_number(self):
        """Test fallback when no leading number exists."""
        result = extract_title_from_filename(
            "/some/path/research_notes.md"
        )
        assert result == "Research Notes"

    def test_underscores_replaced_with_spaces(self):
        """Test that underscores are replaced with spaces."""
        result = extract_title_from_filename(
            "/some/path/1_deep_learning_architectures.txt"
        )
        assert " " in result
        assert "_" not in result

    def test_single_word_title(self):
        """Test single word title extraction."""
        result = extract_title_from_filename(
            "/some/path/99_quantum.txt"
        )
        assert result == "Quantum"

    def test_with_md_extension(self):
        """Test .md extension handling."""
        result = extract_title_from_filename(
            "/some/path/15_evolution_strategies.md"
        )
        assert result == "Evolution Strategies"

    def test_complex_iteration_numbers(self):
        """Test complex trailing iteration numbers."""
        # Test 123 at end
        result = extract_title_from_filename(
            "/some/path/5_test_topic123.txt"
        )
        assert result == "Test Topic"

    def test_empty_filename_fallback(self):
        """Test fallback for edge case filenames."""
        # A file that results in empty title after processing
        result = extract_title_from_filename("/some/path/123.txt")
        # Should fallback to the name without extension
        assert result == "123"

    def test_nested_path(self):
        """Test that nested paths are handled correctly."""
        result = extract_title_from_filename(
            "/home/user/docs/research/subdir/25_nested_topic.md"
        )
        assert result == "Nested Topic"

    def test_numbers_in_middle_preserved(self):
        """Test that numbers in the middle of topic are preserved."""
        result = extract_title_from_filename(
            "/some/path/1_phase2_implementation.txt"
        )
        assert "Phase2" in result or "Phase 2" in result


class TestCalculateFileHash:
    """Tests for SHA256 hash calculation."""

    def test_consistent_hash(self):
        """Test that same content produces same hash."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write("test content for hashing")
            f.flush()
            temp_path = f.name

        try:
            hash1 = calculate_file_hash(temp_path)
            hash2 = calculate_file_hash(temp_path)
            assert hash1 == hash2
            assert len(hash1) == 64  # SHA256 produces 64 hex chars
        finally:
            os.unlink(temp_path)

    def test_hash_matches_standard(self):
        """Test that hash matches standard SHA256."""
        content = "test content"
        expected_hash = hashlib.sha256(content.encode()).hexdigest()

        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write(content)
            f.flush()
            temp_path = f.name

        try:
            result = calculate_file_hash(temp_path)
            assert result == expected_hash
        finally:
            os.unlink(temp_path)

    def test_empty_file_hash(self):
        """Test hash of empty file."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write("")
            f.flush()
            temp_path = f.name

        try:
            result = calculate_file_hash(temp_path)
            # SHA256 of empty string
            assert result == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        finally:
            os.unlink(temp_path)

    def test_large_file_hash(self):
        """Test hash of larger file (tests chunked reading)."""
        content = "x" * 10000  # Larger than 8192 chunk size
        expected_hash = hashlib.sha256(content.encode()).hexdigest()

        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write(content)
            f.flush()
            temp_path = f.name

        try:
            result = calculate_file_hash(temp_path)
            assert result == expected_hash
        finally:
            os.unlink(temp_path)

    def test_nonexistent_file_returns_empty(self):
        """Test that nonexistent file returns empty string."""
        result = calculate_file_hash("/nonexistent/path/file.txt")
        assert result == ""

    def test_binary_content_hash(self):
        """Test hash with binary-like content."""
        content = bytes(range(256)).decode('latin-1')

        with tempfile.NamedTemporaryFile(mode='wb', suffix='.bin', delete=False) as f:
            f.write(content.encode('latin-1'))
            f.flush()
            temp_path = f.name

        try:
            result = calculate_file_hash(temp_path)
            assert len(result) == 64
            assert result != ""
        finally:
            os.unlink(temp_path)

    def test_permission_error_returns_empty(self):
        """Test permission error handling returns empty string."""
        # Create a file and make it unreadable
        with tempfile.NamedTemporaryFile(mode='w', suffix='.txt', delete=False) as f:
            f.write("test content")
            temp_path = f.name

        try:
            # Remove read permissions
            os.chmod(temp_path, 0o000)
            result = calculate_file_hash(temp_path)
            # Should return empty string on permission error
            assert result == ""
        finally:
            # Restore permissions for cleanup
            os.chmod(temp_path, 0o644)
            os.unlink(temp_path)


class TestDiscoverDocuments:
    """Tests for document discovery."""

    @pytest.fixture
    def mock_docs_dir(self):
        """Create a temporary directory with mock documents."""
        temp_dir = tempfile.mkdtemp()

        # Create various test files
        files = [
            "doc1.txt",
            "doc2.md",
            "subdir/doc3.txt",
            "subdir/doc4.md",
            "nested/deep/doc5.txt",
            "ignored.py",  # Should be ignored
            "script.sh",   # Should be ignored
        ]

        for filepath in files:
            full_path = os.path.join(temp_dir, filepath)
            os.makedirs(os.path.dirname(full_path), exist_ok=True)
            with open(full_path, 'w') as f:
                f.write(f"Content of {filepath}")

        yield temp_dir

        # Cleanup
        shutil.rmtree(temp_dir)

    def test_discovers_txt_files(self, mock_docs_dir):
        """Test that .txt files are discovered."""
        result = discover_documents(mock_docs_dir)
        txt_files = [f for f in result if f.endswith('.txt')]
        assert len(txt_files) == 3

    def test_discovers_md_files(self, mock_docs_dir):
        """Test that .md files are discovered."""
        result = discover_documents(mock_docs_dir)
        md_files = [f for f in result if f.endswith('.md')]
        assert len(md_files) == 2

    def test_ignores_other_extensions(self, mock_docs_dir):
        """Test that non-.txt/.md files are ignored."""
        result = discover_documents(mock_docs_dir)
        other_files = [f for f in result if not (f.endswith('.txt') or f.endswith('.md'))]
        assert len(other_files) == 0

    def test_respects_limit(self, mock_docs_dir):
        """Test that limit parameter works."""
        result = discover_documents(mock_docs_dir, limit=2)
        assert len(result) == 2

    def test_returns_sorted_list(self, mock_docs_dir):
        """Test that results are sorted alphabetically."""
        result = discover_documents(mock_docs_dir)
        assert result == sorted(result)

    def test_recursive_discovery(self, mock_docs_dir):
        """Test that subdirectories are searched recursively."""
        result = discover_documents(mock_docs_dir)
        # Check that nested files are found
        nested_files = [f for f in result if 'nested' in f or 'subdir' in f]
        assert len(nested_files) == 3

    def test_empty_directory(self):
        """Test behavior with empty directory."""
        temp_dir = tempfile.mkdtemp()
        try:
            result = discover_documents(temp_dir)
            assert result == []
        finally:
            os.rmdir(temp_dir)

    def test_nonexistent_directory(self):
        """Test behavior with nonexistent directory."""
        result = discover_documents("/nonexistent/directory")
        assert result == []


class TestParseDocument:
    """Tests for document parsing."""

    @pytest.fixture
    def mock_docs_dir(self):
        """Create a temporary directory with mock documents."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    def test_parse_valid_document(self, mock_docs_dir):
        """Test parsing a valid document."""
        file_path = os.path.join(mock_docs_dir, "42_test_topic.txt")
        with open(file_path, 'w') as f:
            f.write("Line 1\nLine 2\nLine 3")

        result = parse_document(file_path)

        assert result is not None
        assert isinstance(result, ResearchDocument)
        assert result.title == "Test Topic"
        assert result.content == "Line 1\nLine 2\nLine 3"
        assert result.line_count == 3
        assert len(result.file_hash) == 64
        assert result.file_path == file_path

    def test_parse_empty_file_returns_none(self, mock_docs_dir):
        """Test that empty files return None."""
        file_path = os.path.join(mock_docs_dir, "empty.txt")
        with open(file_path, 'w') as f:
            pass  # Create empty file

        result = parse_document(file_path)
        assert result is None

    def test_parse_whitespace_only_file_returns_none(self, mock_docs_dir):
        """Test that whitespace-only files return None."""
        file_path = os.path.join(mock_docs_dir, "whitespace.txt")
        with open(file_path, 'w') as f:
            f.write("   \n\t\n   ")

        result = parse_document(file_path)
        assert result is None

    def test_parse_nonexistent_file_returns_none(self, mock_docs_dir):
        """Test that nonexistent files return None."""
        result = parse_document("/nonexistent/file.txt")
        assert result is None

    def test_parse_md_file(self, mock_docs_dir):
        """Test parsing markdown files."""
        file_path = os.path.join(mock_docs_dir, "10_markdown_doc.md")
        with open(file_path, 'w') as f:
            f.write("# Header\n\nContent here")

        result = parse_document(file_path)

        assert result is not None
        assert result.title == "Markdown Doc"
        assert "# Header" in result.content

    def test_parse_unicode_content(self, mock_docs_dir):
        """Test parsing files with unicode content."""
        file_path = os.path.join(mock_docs_dir, "1_unicode.txt")
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write("Unicode: cafe, naive, resume")

        result = parse_document(file_path)

        assert result is not None
        assert "cafe" in result.content

    def test_parse_large_file(self, mock_docs_dir):
        """Test parsing larger files."""
        file_path = os.path.join(mock_docs_dir, "large.txt")
        large_content = "x" * 100000
        with open(file_path, 'w') as f:
            f.write(large_content)

        result = parse_document(file_path)

        assert result is not None
        assert len(result.content) == 100000
        assert result.line_count == 1

    def test_line_count_accurate(self, mock_docs_dir):
        """Test that line count is accurate."""
        file_path = os.path.join(mock_docs_dir, "lines.txt")
        with open(file_path, 'w') as f:
            f.write("\n".join(["line"] * 100))  # 100 lines, no trailing newline

        result = parse_document(file_path)

        assert result is not None
        assert result.line_count == 100

    def test_hash_matches_content(self, mock_docs_dir):
        """Test that hash matches file content."""
        file_path = os.path.join(mock_docs_dir, "hash_test.txt")
        content = "Test content for hash verification"
        with open(file_path, 'w') as f:
            f.write(content)

        result = parse_document(file_path)
        expected_hash = hashlib.sha256(content.encode()).hexdigest()

        assert result is not None
        assert result.file_hash == expected_hash

    def test_directory_path_returns_none(self, mock_docs_dir):
        """Test that directory path returns None."""
        result = parse_document(mock_docs_dir)
        assert result is None

    def test_parse_permission_denied(self, mock_docs_dir):
        """Test permission denied handling."""
        file_path = os.path.join(mock_docs_dir, "no_read.txt")
        with open(file_path, 'w') as f:
            f.write("test content")

        # Remove read permissions
        os.chmod(file_path, 0o000)

        try:
            result = parse_document(file_path)
            assert result is None
        finally:
            os.chmod(file_path, 0o644)


class TestResearchDocument:
    """Tests for ResearchDocument dataclass."""

    def test_dataclass_creation(self):
        """Test creating a ResearchDocument instance."""
        doc = ResearchDocument(
            file_path="/test/path.txt",
            title="Test Title",
            content="Test content",
            file_hash="abc123",
            line_count=5
        )

        assert doc.file_path == "/test/path.txt"
        assert doc.title == "Test Title"
        assert doc.content == "Test content"
        assert doc.file_hash == "abc123"
        assert doc.line_count == 5

    def test_dataclass_immutability_check(self):
        """Test dataclass field access."""
        doc = ResearchDocument(
            file_path="/test/path.txt",
            title="Test Title",
            content="Test content",
            file_hash="abc123",
            line_count=5
        )

        # Should be able to read all fields
        assert hasattr(doc, 'file_path')
        assert hasattr(doc, 'title')
        assert hasattr(doc, 'content')
        assert hasattr(doc, 'file_hash')
        assert hasattr(doc, 'line_count')


class TestIntegration:
    """Integration tests combining multiple functions."""

    @pytest.fixture
    def full_test_dir(self):
        """Create a full test directory structure."""
        temp_dir = tempfile.mkdtemp()

        # Create realistic test files
        test_files = {
            "107_rre_recursive_development_system12.txt": "Content about recursive development",
            "42_neural_network_basics.txt": "Neural network fundamentals",
            "99_quantum_computing.md": "# Quantum Computing\n\nNotes on quantum",
            "subdir/25_nested_topic.txt": "Nested document content",
        }

        for filename, content in test_files.items():
            filepath = os.path.join(temp_dir, filename)
            os.makedirs(os.path.dirname(filepath), exist_ok=True)
            with open(filepath, 'w') as f:
                f.write(content)

        yield temp_dir

        shutil.rmtree(temp_dir)

    def test_full_discovery_and_parse(self, full_test_dir):
        """Test discovering and parsing all documents."""
        files = discover_documents(full_test_dir)
        assert len(files) == 4

        docs = []
        for filepath in files:
            doc = parse_document(filepath)
            if doc:
                docs.append(doc)

        assert len(docs) == 4

        # Check titles extracted correctly
        titles = [d.title for d in docs]
        assert any("Recursive" in t for t in titles)
        assert any("Neural" in t for t in titles)
        assert any("Quantum" in t for t in titles)

    def test_consistent_hashing_in_workflow(self, full_test_dir):
        """Test that hashes are consistent through the workflow."""
        files = discover_documents(full_test_dir, limit=1)
        doc = parse_document(files[0])

        # Direct hash calculation should match
        direct_hash = calculate_file_hash(files[0])

        assert doc is not None
        assert doc.file_hash == direct_hash


class TestImportDocumentWithRetry:
    """Tests for import_document_with_retry with mocked API."""

    @pytest.fixture
    def sample_doc(self):
        """Create a sample ResearchDocument for testing."""
        return ResearchDocument(
            file_path="/test/doc.txt",
            title="Test Document",
            content="Test content",
            file_hash="abc123",
            line_count=1
        )

    @patch('import_research_docs.requests.post')
    def test_success_created(self, mock_post, sample_doc):
        """Test successful document creation."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {"success": True, "status": "created"}
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "created"
        assert error is None
        mock_post.assert_called_once()

    @patch('import_research_docs.requests.post')
    def test_success_updated(self, mock_post, sample_doc):
        """Test successful document update."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {"success": True, "status": "updated"}
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "updated"
        assert error is None

    @patch('import_research_docs.requests.post')
    def test_success_skipped(self, mock_post, sample_doc):
        """Test document skipped (no changes)."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {"success": True, "status": "skipped"}
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "skipped"
        assert error is None

    @patch('import_research_docs.requests.post')
    def test_api_error_response(self, mock_post, sample_doc):
        """Test API error response handling."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {"success": False, "message": "Database error"}
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "error"
        assert "Database error" in error

    @patch('import_research_docs.requests.post')
    def test_server_error_with_retry(self, mock_post, sample_doc):
        """Test server error triggers retry."""
        # First call: 500 error
        mock_response_500 = MagicMock()
        mock_response_500.status_code = 500

        # Second call: success
        mock_response_ok = MagicMock()
        mock_response_ok.status_code = 200
        mock_response_ok.json.return_value = {"success": True, "status": "created"}

        mock_post.side_effect = [mock_response_500, mock_response_ok]

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "created"
        assert error is None
        assert mock_post.call_count == 2

    @patch('import_research_docs.requests.post')
    @patch('import_research_docs.time.sleep')
    def test_server_error_max_retries(self, mock_sleep, mock_post, sample_doc):
        """Test server error after max retries."""
        mock_response = MagicMock()
        mock_response.status_code = 500
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001", max_retries=2)

        assert status == "error"
        assert "500" in error
        assert mock_post.call_count == 3  # Initial + 2 retries

    @patch('import_research_docs.requests.post')
    def test_client_error_no_retry(self, mock_post, sample_doc):
        """Test client error (4xx) doesn't retry."""
        mock_response = MagicMock()
        mock_response.status_code = 400
        mock_post.return_value = mock_response

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "error"
        assert "400" in error
        mock_post.assert_called_once()  # No retries

    @patch('import_research_docs.requests.post')
    @patch('import_research_docs.time.sleep')
    def test_timeout_with_retry(self, mock_sleep, mock_post, sample_doc):
        """Test timeout triggers retry."""
        import requests

        # First call: timeout
        mock_post.side_effect = [
            requests.exceptions.Timeout(),
            MagicMock(status_code=200, json=lambda: {"success": True, "status": "created"})
        ]

        status, error = import_document_with_retry(sample_doc, "batch_001")

        assert status == "created"
        assert error is None
        assert mock_post.call_count == 2

    @patch('import_research_docs.requests.post')
    @patch('import_research_docs.time.sleep')
    def test_connection_error_max_retries(self, mock_sleep, mock_post, sample_doc):
        """Test connection error after max retries."""
        import requests
        mock_post.side_effect = requests.exceptions.ConnectionError("Connection refused")

        status, error = import_document_with_retry(sample_doc, "batch_001", max_retries=1)

        assert status == "error"
        assert "Connection" in error
        assert mock_post.call_count == 2  # Initial + 1 retry

    @patch('import_research_docs.requests.post')
    def test_large_file_uses_longer_timeout(self, mock_post, sample_doc):
        """Test that large files use longer timeout."""
        # Create a large document (>1MB)
        large_doc = ResearchDocument(
            file_path="/test/large.txt",
            title="Large Document",
            content="x" * 1_100_000,  # > 1MB
            file_hash="large_hash",
            line_count=1
        )

        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {"success": True, "status": "created"}
        mock_post.return_value = mock_response

        import_document_with_retry(large_doc, "batch_001")

        # Check that timeout was set to LARGE_FILE_TIMEOUT (120s)
        call_kwargs = mock_post.call_args[1]
        assert call_kwargs['timeout'] == 120


class TestImportBatch:
    """Tests for batch import functionality."""

    @pytest.fixture
    def sample_docs(self):
        """Create sample documents for batch testing."""
        return [
            ResearchDocument(
                file_path=f"/test/doc{i}.txt",
                title=f"Document {i}",
                content=f"Content {i}",
                file_hash=f"hash{i}",
                line_count=1
            )
            for i in range(3)
        ]

    @patch('import_research_docs.import_document_with_retry')
    def test_batch_creates_all(self, mock_import, sample_docs):
        """Test batch creating all documents."""
        mock_import.side_effect = [("created", None), ("created", None), ("created", None)]

        results = import_batch(sample_docs, "batch_001", dry_run=False)

        assert results["created"] == 3
        assert results["updated"] == 0
        assert results["skipped"] == 0
        assert results["errors"] == 0

    @patch('import_research_docs.import_document_with_retry')
    def test_batch_mixed_results(self, mock_import, sample_docs):
        """Test batch with mixed results."""
        mock_import.side_effect = [
            ("created", None),
            ("updated", None),
            ("skipped", None)
        ]

        results = import_batch(sample_docs, "batch_001", dry_run=False)

        assert results["created"] == 1
        assert results["updated"] == 1
        assert results["skipped"] == 1

    @patch('import_research_docs.import_document_with_retry')
    def test_batch_with_errors(self, mock_import, sample_docs):
        """Test batch with some errors."""
        mock_import.side_effect = [
            ("created", None),
            ("error", "Connection failed"),
            ("skipped", None)
        ]

        results = import_batch(sample_docs, "batch_001", dry_run=False)

        assert results["created"] == 1
        assert results["errors"] == 1
        assert results["skipped"] == 1

    def test_batch_dry_run(self, sample_docs):
        """Test dry run doesn't import."""
        results = import_batch(sample_docs, "batch_001", dry_run=True)

        assert results["created"] == 3  # All marked as created in dry run
        assert results["updated"] == 0

    def test_batch_empty_list(self):
        """Test batch with empty document list."""
        results = import_batch([], "batch_001", dry_run=False)

        assert results["created"] == 0
        assert results["errors"] == 0


class TestUpdateProgress:
    """Tests for progress update functionality."""

    @patch('import_research_docs.requests.post')
    def test_update_progress_success(self, mock_post):
        """Test successful progress update."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_post.return_value = mock_response

        result = update_progress(50, 100, 30, 10, 5, 5, "running")

        assert result is True
        mock_post.assert_called_once()

        # Check payload
        call_data = mock_post.call_args[1]['data']
        assert call_data['processed'] == 50
        assert call_data['total'] == 100
        assert call_data['status'] == "running"

    @patch('import_research_docs.requests.post')
    def test_update_progress_complete(self, mock_post):
        """Test progress update for completion."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_post.return_value = mock_response

        result = update_progress(100, 100, 80, 10, 5, 5, "complete")

        assert result is True
        call_data = mock_post.call_args[1]['data']
        assert call_data['status'] == "complete"
        assert "complete" in call_data['message']

    @patch('import_research_docs.requests.post')
    def test_update_progress_http_error(self, mock_post):
        """Test progress update with HTTP error."""
        mock_response = MagicMock()
        mock_response.status_code = 500
        mock_post.return_value = mock_response

        result = update_progress(50, 100, 30, 10, 5, 5, "running")

        assert result is False

    @patch('import_research_docs.requests.post')
    def test_update_progress_exception(self, mock_post):
        """Test progress update with exception."""
        mock_post.side_effect = Exception("Network error")

        result = update_progress(50, 100, 30, 10, 5, 5, "running")

        assert result is False

    @patch('import_research_docs.requests.post')
    def test_update_progress_percent_calculation(self, mock_post):
        """Test percentage calculation."""
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_post.return_value = mock_response

        update_progress(25, 100, 20, 5, 0, 0, "running")

        call_data = mock_post.call_args[1]['data']
        assert call_data['percent'] == 25


class TestRunFullImport:
    """Tests for run_full_import orchestration."""

    @pytest.fixture
    def mock_docs_dir(self):
        """Create a temporary directory with test documents."""
        temp_dir = tempfile.mkdtemp()

        # Create test files
        for i in range(3):
            filepath = os.path.join(temp_dir, f"{i}_test_doc_{i}.txt")
            with open(filepath, 'w') as f:
                f.write(f"Content {i}")

        yield temp_dir
        shutil.rmtree(temp_dir)

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_dry_run(self, mock_batch, mock_progress, mock_docs_dir):
        """Test dry run doesn't import anything."""
        mock_batch.return_value = {"created": 3, "updated": 0, "skipped": 0, "errors": 0}
        mock_progress.return_value = True

        results = run_full_import(
            docs_dir=mock_docs_dir,
            limit=3,
            dry_run=True,
            batch_size=10,
            batch_delay=0
        )

        assert results["total"] == 3
        mock_batch.assert_called()

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_with_limit(self, mock_batch, mock_progress, mock_docs_dir):
        """Test limit parameter."""
        mock_batch.return_value = {"created": 2, "updated": 0, "skipped": 0, "errors": 0}
        mock_progress.return_value = True

        results = run_full_import(
            docs_dir=mock_docs_dir,
            limit=2,
            dry_run=True,
            batch_size=10,
            batch_delay=0
        )

        assert results["total"] == 2

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_empty_directory(self, mock_batch, mock_progress):
        """Test empty directory handling."""
        temp_dir = tempfile.mkdtemp()
        try:
            results = run_full_import(
                docs_dir=temp_dir,
                dry_run=True,
                batch_delay=0
            )
            assert results["total"] == 0
            assert results["created"] == 0
            mock_batch.assert_not_called()
        finally:
            os.rmdir(temp_dir)

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_batching(self, mock_batch, mock_progress, mock_docs_dir):
        """Test that documents are batched correctly."""
        mock_batch.return_value = {"created": 1, "updated": 0, "skipped": 0, "errors": 0}
        mock_progress.return_value = True

        # Use batch_size=1 to force multiple batches
        results = run_full_import(
            docs_dir=mock_docs_dir,
            limit=3,
            dry_run=True,
            batch_size=1,
            batch_delay=0
        )

        assert results["total"] == 3
        # Should be called 3 times (1 doc per batch)
        assert mock_batch.call_count == 3

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_skips_none_docs(self, mock_batch, mock_progress, mock_docs_dir):
        """Test that None documents (parse failures) are skipped."""
        # Create an empty file that will return None from parse_document
        empty_file = os.path.join(mock_docs_dir, "999_empty.txt")
        with open(empty_file, 'w') as f:
            pass  # Empty file

        mock_batch.return_value = {"created": 1, "updated": 0, "skipped": 0, "errors": 0}
        mock_progress.return_value = True

        results = run_full_import(
            docs_dir=mock_docs_dir,
            dry_run=True,
            batch_delay=0
        )

        # Empty file should be skipped
        assert results["total"] == 4  # 3 content files + 1 empty file

    @patch('import_research_docs.update_progress')
    @patch('import_research_docs.import_batch')
    def test_run_full_import_progress_updates(self, mock_batch, mock_progress, mock_docs_dir):
        """Test that progress is updated during import."""
        mock_batch.return_value = {"created": 1, "updated": 0, "skipped": 0, "errors": 0}
        mock_progress.return_value = True

        run_full_import(
            docs_dir=mock_docs_dir,
            limit=3,
            dry_run=True,
            batch_size=1,
            batch_delay=0
        )

        # Progress should be called (initial + during + final)
        assert mock_progress.call_count >= 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
