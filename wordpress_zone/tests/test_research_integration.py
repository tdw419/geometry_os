#!/usr/bin/env python3
"""
Integration tests for research document import.

Tests cover:
- Import of 5 sample documents via real API
- Verification of posts created in WordPress via searchResearch API
- Verification of meta fields populated correctly
- Re-import produces "skipped" status
- Content update (modified hash) produces "updated" status

These tests require a running WordPress instance at localhost:8080.

Each test is independent and creates its own documents.
"""

import os
import sys
import time
import tempfile
import shutil
import hashlib
import pytest
import requests
import uuid

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from import_research_docs import (
    ResearchDocument,
    import_document_with_retry,
    parse_document,
    calculate_file_hash,
)

# Configuration - must match import_research_docs.py
WP_PUBLISHER_URL = "http://localhost:8080/ai-publisher.php"
WP_REST_URL = "http://localhost:8080/index.php?rest_route=/wp/v2/research_document"


def is_wordpress_available():
    """Check if WordPress is available."""
    try:
        response = requests.get(WP_REST_URL, timeout=5)
        return response.status_code == 200
    except:
        return False


def create_doc_with_fixed_path(content, source_path, title):
    """Create a ResearchDocument with a fixed source path for testing deduplication."""
    file_hash = hashlib.sha256(content.encode()).hexdigest()
    line_count = content.count('\n') + 1
    return ResearchDocument(
        file_path=source_path,
        title=title,
        content=content,
        file_hash=file_hash,
        line_count=line_count
    )


def import_doc_direct(doc, batch_id):
    """Import a document directly via API."""
    payload = {
        "action": "importResearchDocument",
        "title": doc.title,
        "content": doc.content,
        "meta": {
            "source_path": doc.file_path,
            "file_hash": doc.file_hash,
            "line_count": doc.line_count,
            "import_batch": batch_id
        }
    }

    response = requests.post(WP_PUBLISHER_URL, json=payload, timeout=30)

    if response.status_code == 200:
        data = response.json()
        if data.get("success"):
            return (data.get("status", "unknown"), None, data.get("post_id"))
        else:
            return ("error", data.get("error", "Unknown error"), None)
    else:
        return ("error", f"HTTP {response.status_code}", None)


def search_research(query, limit=100):
    """Search for research documents using the searchResearch API."""
    response = requests.post(
        WP_PUBLISHER_URL,
        json={"action": "searchResearch", "q": query, "limit": limit},
        timeout=30
    )

    if response.status_code == 200:
        data = response.json()
        if data.get("success"):
            return data.get("results", []), data.get("total", 0)
    return [], 0


@pytest.fixture(scope="module")
def wordpress_available():
    """Skip all tests if WordPress is not available."""
    if not is_wordpress_available():
        pytest.skip("WordPress not available at localhost:8080")


class TestImportFiveDocuments:
    """Test importing 5 sample documents and verifying them."""

    def test_import_5_documents(self, wordpress_available):
        """Test import of 5 sample documents and verify they are created."""
        test_id = str(uuid.uuid4())[:8]
        batch_id = f"test_{test_id}"
        results = {"created": 0, "updated": 0, "skipped": 0, "errors": 0}

        for i in range(5):
            content = f"Test Document {i} ID:{test_id}\nLine 2\nLine 3\nLine 4\nLine 5"
            source_path = f"/test/integration/{test_id}/doc_{i}.txt"
            title = f"Integration Test {test_id} Doc {i}"

            doc = create_doc_with_fixed_path(content, source_path, title)
            status, error, _ = import_doc_direct(doc, batch_id)

            assert error is None, f"Import error for doc {i}: {error}"
            if status == "created":
                results["created"] += 1
            elif status == "updated":
                results["updated"] += 1
            elif status == "skipped":
                results["skipped"] += 1

        assert results["created"] == 5, f"Expected 5 created, got: {results}"

        # Verify via search
        search_results, _ = search_research(test_id)
        found = [r for r in search_results if test_id in r.get('source_path', '')]
        assert len(found) == 5, f"Expected 5 searchable, found {len(found)}"

    def test_reimport_same_content_skipped(self, wordpress_available):
        """Test re-import with same content produces skipped status."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/skip/{test_id}/doc.txt"
        content = f"Same content ID:{test_id}"
        batch_id = f"skip_{test_id}"

        doc = create_doc_with_fixed_path(content, source_path, f"Skip Test {test_id}")

        # First import
        status1, error1, _ = import_doc_direct(doc, batch_id)
        assert error1 is None
        assert status1 in ['created', 'updated'], f"First: {status1}"

        # Second import - should skip
        status2, error2, _ = import_doc_direct(doc, batch_id)
        assert error2 is None
        assert status2 == "skipped", f"Expected skipped, got {status2}"

    def test_modified_content_updated(self, wordpress_available):
        """Test modified content produces updated status."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/update/{test_id}/doc.txt"
        batch_id = f"update_{test_id}"

        # First import
        content1 = f"Original content ID:{test_id}"
        doc1 = create_doc_with_fixed_path(content1, source_path, f"Update Test {test_id}")
        status1, error1, _ = import_doc_direct(doc1, batch_id)
        assert error1 is None
        assert status1 in ['created', 'updated']

        # Second import with modified content
        content2 = f"MODIFIED content ID:{test_id} timestamp:{time.time()}"
        doc2 = create_doc_with_fixed_path(content2, source_path, f"Update Test {test_id}")
        status2, error2, _ = import_doc_direct(doc2, batch_id)
        assert error2 is None
        assert status2 == "updated", f"Expected updated, got {status2}"

        # Verify via search
        results, _ = search_research("MODIFIED " + test_id)
        assert len(results) >= 1, "Updated content not found"
        assert "MODIFIED" in results[0].get('excerpt', '')


class TestMetaFields:
    """Test that meta fields are populated correctly."""

    def test_meta_fields_in_search_results(self, wordpress_available):
        """Verify meta fields are returned in search results."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/meta/{test_id}/doc.txt"
        content = f"Meta test ID:{test_id}\nLine 2\nLine 3"
        batch_id = f"meta_{test_id}"

        doc = create_doc_with_fixed_path(content, source_path, f"Meta Test {test_id}")
        status, error, _ = import_doc_direct(doc, batch_id)
        assert error is None

        # Search and verify meta fields
        results, _ = search_research(test_id)
        our_doc = [r for r in results if test_id in r.get('source_path', '')]

        assert len(our_doc) >= 1, "Document not found"
        result = our_doc[0]

        assert 'source_path' in result, "Missing source_path"
        assert 'line_count' in result, "Missing line_count"
        assert result['source_path'] == source_path, f"Wrong source_path: {result['source_path']}"
        assert result['line_count'] == 3, f"Wrong line_count: {result['line_count']}"


class TestDeduplication:
    """Tests for deduplication logic."""

    def test_same_path_same_hash_skipped(self, wordpress_available):
        """Test that same path with same hash is skipped."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/dedup/{test_id}/same.txt"
        content = f"Same content ID:{test_id}"
        batch_id = f"dedup_same_{test_id}"

        doc = create_doc_with_fixed_path(content, source_path, "Dedup Same")

        status1, _, _ = import_doc_direct(doc, batch_id)
        assert status1 in ['created', 'updated']

        status2, _, _ = import_doc_direct(doc, batch_id)
        assert status2 == "skipped", f"Expected skipped, got {status2}"

    def test_same_path_different_hash_updated(self, wordpress_available):
        """Test that same path with different hash is updated."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/dedup/{test_id}/diff.txt"
        batch_id = f"dedup_diff_{test_id}"

        content1 = f"Initial ID:{test_id}"
        doc1 = create_doc_with_fixed_path(content1, source_path, "Dedup Diff")
        status1, _, _ = import_doc_direct(doc1, batch_id)
        assert status1 in ['created', 'updated']

        content2 = f"Modified ID:{test_id} ts:{time.time()}"
        doc2 = create_doc_with_fixed_path(content2, source_path, "Dedup Diff")
        assert doc2.file_hash != doc1.file_hash, "Hash should differ"

        status2, _, _ = import_doc_direct(doc2, batch_id)
        assert status2 == "updated", f"Expected updated, got {status2}"


class TestAPIResponseStructure:
    """Tests for API response structure."""

    def test_import_response_structure(self, wordpress_available):
        """Test that import API returns correct response structure."""
        test_id = str(uuid.uuid4())[:8]
        source_path = f"/test/api/{test_id}/response.txt"
        content = f"API test ID:{test_id}"

        payload = {
            "action": "importResearchDocument",
            "title": f"API Test {test_id}",
            "content": content,
            "meta": {
                "source_path": source_path,
                "file_hash": hashlib.sha256(content.encode()).hexdigest(),
                "line_count": 1,
                "import_batch": f"api_{test_id}"
            }
        }

        response = requests.post(WP_PUBLISHER_URL, json=payload, timeout=30)
        assert response.status_code == 200

        data = response.json()
        assert data.get('success') is True, f"Import failed: {data}"
        assert 'status' in data, "Missing status"
        assert data['status'] in ['created', 'updated', 'skipped']
        assert 'post_id' in data, "Missing post_id"
        assert data['post_id'] is not None

    def test_search_response_structure(self, wordpress_available):
        """Test that search API returns correct response structure."""
        response = requests.post(
            WP_PUBLISHER_URL,
            json={"action": "searchResearch", "q": "test", "limit": 5},
            timeout=30
        )

        assert response.status_code == 200
        data = response.json()
        assert data.get('success') is True
        assert 'results' in data
        assert 'total' in data
        assert isinstance(data['results'], list)

        if data['results']:
            result = data['results'][0]
            assert 'id' in result
            assert 'title' in result
            assert 'source_path' in result


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
