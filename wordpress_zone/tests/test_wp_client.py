"""Unit tests for WordPressClient.

These tests verify the WordPressClient initialization and methods
using mocked HTTP requests.
"""
import pytest
from unittest.mock import patch
import sys
sys.path.insert(0, '..')
from wp_client import WordPressClient


class TestWordPressClient:
    """Tests for WordPressClient class."""

    def test_init_with_default_url(self):
        """Client defaults to 'http://localhost:8080'."""
        client = WordPressClient()
        assert client.base_url == "http://localhost:8080"

    def test_init_with_custom_url(self):
        """Client accepts custom URL."""
        client = WordPressClient(base_url="http://custom:9000")
        assert client.base_url == "http://custom:9000"

    def test_get_modified_posts_returns_list(self):
        """get_modified_posts returns list of posts."""
        client = WordPressClient()
        with patch.object(client, '_make_request') as mock_request:
            mock_request.return_value = {
                "success": True,
                "posts": [{"id": 1, "title": "Test"}]
            }
            posts = client.get_modified_posts()
            assert len(posts) == 1
            assert posts[0]["id"] == 1
