"""
Test Evolution Daemon WordPress task handling
"""
import pytest
import json
import tempfile
from pathlib import Path


class TestWordPressTaskHandler:

    def test_handler_exists(self):
        """Test WordPressTaskHandler can be imported"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()
        assert handler is not None

    def test_content_intelligence_task(self):
        """Test content intelligence task execution"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'content_intelligence',
            'payload': {
                'post_id': 1,
                'action': 'auto_tag'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']
        assert 'tags' in result or 'error' in result

    def test_evolution_publish_task(self):
        """Test evolution publish task execution"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'evolution_publish',
            'payload': {
                'commit_hash': 'abc123',
                'message': 'Test evolution'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']

    def test_plugin_analysis_task(self):
        """Test plugin analysis task execution"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'plugin_analysis',
            'payload': {
                'scan_type': 'security'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']
        assert 'plugins' in result or 'error' in result

    def test_unknown_agent_type(self):
        """Test unknown agent type returns error"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'unknown_type',
            'payload': {}
        }

        result = handler.execute(task)
        assert result['status'] == 'error'
        assert 'Unknown agent type' in result['error']

    def test_content_intelligence_generate_excerpt(self):
        """Test content intelligence generate_excerpt action"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'content_intelligence',
            'payload': {
                'post_id': 1,
                'action': 'generate_excerpt'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'excerpt' in result

    def test_content_intelligence_suggest_category(self):
        """Test content intelligence suggest_category action"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'content_intelligence',
            'payload': {
                'post_id': 1,
                'action': 'suggest_category'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'suggested_category' in result

    def test_plugin_analysis_updates(self):
        """Test plugin analysis updates scan type"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        task = {
            'agent_type': 'plugin_analysis',
            'payload': {
                'scan_type': 'updates'
            }
        }

        result = handler.execute(task)
        assert result['status'] in ['success', 'error']
        if result['status'] == 'success':
            assert 'updates_available' in result

    def test_keyword_extraction(self):
        """Test keyword extraction for auto-tagging"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        text = "This is an evolution daemon improvement for the neural architecture system"
        keywords = handler._extract_keywords(text, max_tags=5)

        assert isinstance(keywords, list)
        assert len(keywords) <= 5
        # Stopwords should be filtered
        assert 'this' not in keywords
        assert 'is' not in keywords
        # Should contain meaningful words
        assert any('evolution' in kw or 'daemon' in kw or 'neural' in kw for kw in keywords)

    def test_category_matching(self):
        """Test category matching based on content"""
        from systems.evolution_daemon.wordpress_task_handler import WordPressTaskHandler
        handler = WordPressTaskHandler()

        categories = ['Evolution Log', 'Development', 'Architecture', 'Tutorial', 'News']

        # Test evolution content
        evolution_content = "The evolution daemon has improved the neural network"
        category = handler._match_category(evolution_content, categories)
        assert category == 'Evolution Log'

        # Test architecture content
        arch_content = "The system architecture design has been updated"
        category = handler._match_category(arch_content, categories)
        assert category == 'Architecture'

        # Test tutorial content
        tutorial_content = "How to use the new tutorial feature"
        category = handler._match_category(tutorial_content, categories)
        assert category == 'Tutorial'
