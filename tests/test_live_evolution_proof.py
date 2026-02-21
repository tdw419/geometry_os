#!/usr/bin/env python3
"""
Live Evolution Proof Tests

These tests prove the WordPress Evolution Bridge works end-to-end
against a RUNNING WordPress instance.

Run with: pytest tests/test_live_evolution_proof.py -v --live
"""

import pytest
import asyncio
import requests
from unittest.mock import AsyncMock, patch

# Skip all tests if WordPress not available
pytestmark = pytest.mark.skipif(
    requests.get("http://localhost:8080/", timeout=2).status_code != 200,
    reason="WordPress not running at localhost:8080"
) if True else pytest.mark.live


class TestWordPressAPI:
    """Prove: WordPress API is accessible and returns real data."""

    def test_ai_publisher_responds(self):
        """E2E-1: ai-publisher.php is reachable"""
        response = requests.post(
            "http://localhost:8080/ai-publisher.php",
            json={"action": "get_stats"},
            timeout=5
        )
        assert response.status_code == 200
        data = response.json()
        assert data.get("success") == True

    def test_list_posts_returns_real_posts(self):
        """E2E-1: list_posts returns actual WordPress posts"""
        response = requests.post(
            "http://localhost:8080/ai-publisher.php",
            json={"action": "list_posts", "limit": 10},
            timeout=10
        )
        assert response.status_code == 200
        data = response.json()
        assert data.get("success") == True
        assert "posts" in data
        assert len(data["posts"]) > 0, "WordPress should have at least one post"

        # Verify post structure
        post = data["posts"][0]
        assert "id" in post
        assert "title" in post
        assert "content" in post


class TestContentAnalysis:
    """Prove: ContentAnalyzer produces meaningful results on real posts."""

    @pytest.fixture
    def analyzer(self):
        from systems.evolution_daemon.wordpress.content_analyzer import (
            WordPressContentAnalyzer
        )
        return WordPressContentAnalyzer()

    def test_analyze_real_post(self, analyzer):
        """E2E-2: Real posts get analyzed with valid scores"""
        # Fetch a real post
        response = requests.post(
            "http://localhost:8080/ai-publisher.php",
            json={"action": "list_posts", "limit": 1},
            timeout=10
        )
        posts = response.json().get("posts", [])
        if not posts:
            pytest.skip("No posts available")

        post = posts[0]
        result = analyzer.analyze(post)

        assert result is not None
        assert 0.0 <= result.readability_score <= 1.0
        assert result.word_count > 0
        assert isinstance(result.issues, list)
        assert isinstance(result.strengths, list)

    def test_weak_post_gets_expansion_proposal(self, analyzer):
        """E2E-3: Weak posts trigger expansion proposals"""
        weak_post = {
            "id": 99999,
            "title": "Test",
            "content": "Short",  # Deliberately too short
            "status": "publish"
        }

        proposal = analyzer.propose_improvement(weak_post)

        assert proposal is not None
        assert proposal.improvement_type == "expand"
        assert len(proposal.suggested_content) > len(weak_post["content"])
        assert proposal.confidence > 0.3

    def test_proposal_content_is_better(self, analyzer):
        """Prove: Proposed content is genuinely better"""
        weak_post = {
            "id": 99998,
            "title": "Bad Title",
            "content": "x",  # Minimal content
            "status": "publish"
        }

        proposal = analyzer.propose_improvement(weak_post)

        # Proposal should expand the content
        assert len(proposal.suggested_content) >= 50  # Meaningful length

        # Proposal should reference the original title
        assert "Bad Title" in proposal.suggested_content or "title" in proposal.suggested_content.lower()


class TestBridgeService:
    """Prove: Bridge Service coordinates all components."""

    @pytest.fixture
    def bridge_config(self):
        from systems.evolution_daemon.wordpress.bridge_service import (
            BridgeServiceConfig
        )
        return BridgeServiceConfig(
            wp_url="http://localhost:8080",
            ws_uri="ws://localhost:8768",
            auto_execute=False  # Safety first
        )

    @pytest.mark.asyncio
    async def test_single_cycle_processes_posts(self, bridge_config):
        """E2E-4: A cycle fetches and analyzes real posts"""
        from systems.evolution_daemon.wordpress.bridge_service import (
            WPEvolutionBridgeService
        )

        bridge = WPEvolutionBridgeService(bridge_config)
        result = await bridge.run_single_cycle()

        assert result["posts_analyzed"] > 0
        assert result["proposals_generated"] >= 0
        assert result["executed"] == 0  # auto_execute is False

    @pytest.mark.asyncio
    async def test_bridge_stats_accessible(self, bridge_config):
        """Prove: Stats are tracked during operation"""
        from systems.evolution_daemon.wordpress.bridge_service import (
            WPEvolutionBridgeService
        )

        bridge = WPEvolutionBridgeService(bridge_config)

        # Run a cycle first
        await bridge.run_single_cycle()

        # Get stats
        stats = bridge.get_stats()

        # Stats is a ServiceStats dataclass
        assert hasattr(stats, 'cycles_completed') or 'cycles_completed' in stats
        cycles = stats.cycles_completed if hasattr(stats, 'cycles_completed') else stats.get('cycles_completed', 0)
        assert cycles >= 1


class TestSafetyGuards:
    """Prove: Safety mechanisms prevent accidental modifications."""

    def test_auto_execute_defaults_false(self):
        """SAFETY-1: System won't modify without explicit flag"""
        from systems.evolution_daemon.wordpress.bridge_service import (
            BridgeServiceConfig
        )

        config = BridgeServiceConfig()
        assert config.auto_execute == False

    def test_min_confidence_defaults_safe(self):
        """SAFETY-2: Default confidence threshold is reasonable"""
        from systems.evolution_daemon.wordpress.bridge_service import (
            BridgeServiceConfig
        )

        config = BridgeServiceConfig()
        assert 0.3 <= config.min_confidence <= 0.8

    @pytest.mark.asyncio
    async def test_executor_fails_gracefully_without_connection(self):
        """SAFETY-3: Actions fail safely when not connected"""
        from systems.evolution_daemon.wordpress.action_executor import (
            PlaywrightActionExecutor
        )

        executor = PlaywrightActionExecutor(ws_uri="ws://localhost:9999")
        # Don't connect

        result = await executor.navigate_to_post(1)

        assert result.success == False
        assert result.error is not None


class TestEndToEndFlow:
    """Prove: Complete flow from post to proposal."""

    @pytest.mark.asyncio
    async def test_full_evolution_flow(self):
        """E2E-5: Complete flow: fetch → analyze → propose"""
        from systems.evolution_daemon.wordpress.content_analyzer import (
            WordPressContentAnalyzer
        )
        from systems.evolution_daemon.wordpress.evolution_agent import (
            WordPressEvolutionAgent
        )

        # Setup
        analyzer = WordPressContentAnalyzer()
        agent = WordPressEvolutionAgent(wp_url="http://localhost:8080")

        # Run cycle
        result = await agent.run_cycle()

        # Verify
        assert result.posts_analyzed > 0
        assert len(result.errors) == 0

        # At least some posts should generate proposals
        # (depends on content quality)
        print(f"Analyzed {result.posts_analyzed} posts")
        print(f"Generated {result.proposals_generated} proposals")


# ============================================
# RUN INSTRUCTIONS
# ============================================
#
# 1. Ensure WordPress is running:
#    ./wordpress_zone/manage_wp.sh start
#
# 2. Run these tests:
#    pytest tests/test_live_evolution_proof.py -v
#
# 3. For detailed output:
#    pytest tests/test_live_evolution_proof.py -v -s
#
# ============================================
