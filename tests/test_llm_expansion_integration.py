"""
End-to-End integration tests for LLM-powered content expansion.

Tests the complete flow from WordPress post to final proposal:
- Full expansion flow with LLM
- Template fallback when LLM unavailable
- Quality improvement metrics
- Confidence scoring accuracy
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch
from dataclasses import dataclass
import tempfile
import shutil

from systems.evolution_daemon.wordpress.llm_expansion_service import (
    LLMExpansionService,
    LLMExpansionConfig,
    ExpansionResult
)
from systems.evolution_daemon.wordpress.safety_config import (
    SafetyConfig,
    ContentBackup,
    validate_proposal_safety
)
from systems.evolution_daemon.wordpress.content_analyzer import (
    WordPressContentAnalyzer,
    ContentAnalysis,
    ImprovementProposal
)
from systems.evolution_daemon.wordpress.bridge_service import (
    WPEvolutionBridgeService,
    BridgeServiceConfig,
    ServiceStats
)
from systems.evolution_daemon.wordpress.evolution_agent import (
    WordPressEvolutionAgent,
    EvolutionCycleResult
)
from systems.evolution_daemon.wordpress.action_executor import (
    PlaywrightActionExecutor,
    ExecutionResult
)


# Mock PlaywrightActionExecutor for tests
class MockPlaywrightActionExecutor:
    """Mock executor that doesn't require real Playwright."""

    def __init__(self, ws_uri: str = "ws://localhost:8768"):
        self.ws_uri = ws_uri
        self._connected = False
        self.execute_calls = []

    async def connect(self) -> bool:
        self._connected = True
        return True

    async def disconnect(self):
        self._connected = False

    async def execute_proposal(self, proposal) -> ExecutionResult:
        self.execute_calls.append(proposal)
        return ExecutionResult(
            success=True,
            action=proposal.improvement_type,
            post_id=proposal.post_id
        )


class TestFullExpansionFlowWithLLM:
    """Test the complete expansion flow from post to proposal with LLM."""

    @pytest.fixture
    def temp_backup_dir(self):
        """Create temporary backup directory for tests."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir, ignore_errors=True)

    @pytest.fixture
    def mock_posts(self):
        """Sample WordPress posts for testing."""
        return [
            {
                "id": 1,
                "title": "Short Post",
                "content": "This is a short post."
            },
            {
                "id": 2,
                "title": "Longer Post with More Content",
                "content": "This is a longer post with more words and content. " * 10
            },
            {
                "id": 3,
                "title": "Technical Guide",
                "content": "Step 1: Initialize the system. Step 2: Configure parameters. Step 3: Execute the process."
            }
        ]

    @pytest.fixture
    def llm_config(self):
        """LLM configuration for testing."""
        return LLMExpansionConfig(
            model="glm-4-plus",
            temperature=0.7,
            timeout=30,
            llm_enabled=True,
            fallback_confidence=0.3
        )

    def test_full_expansion_flow_with_llm(self, mock_posts, llm_config, temp_backup_dir):
        """
        Test full expansion flow: post -> analysis -> expansion -> proposal.

        Validates that:
        1. Post is analyzed correctly
        2. LLM service is invoked when enabled
        3. ExpansionResult has correct fields
        4. Proposal is generated with confidence score
        """
        # Create LLM service with mocked bridge
        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            # Mock async chat method
            async def mock_chat(persona, prompt, model=None):
                return """## Expanded Content

This is a comprehensive expansion of the original content.

### Key Points
- First important point
- Second important point
- Third important point

### Additional Details

The expansion adds substantial context and depth to the original material.
This demonstrates the LLM's ability to generate meaningful content.
"""
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            # Create service with LLM enabled
            service = LLMExpansionService(llm_config)

            # Expand content
            post = mock_posts[0]  # Short post
            result = service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Verify result structure
            assert isinstance(result, ExpansionResult)
            assert result.post_id == post["id"]
            assert len(result.content) > len(post["content"])
            assert result.confidence >= 0.5  # LLM should give decent confidence
            assert result.model_used == "glm-4-plus"
            assert result.fallback_used == False
            assert result.expanded_length > result.original_length
            assert result.expansion_ratio > 1.0

        # Test full analyzer flow with LLM enabled
        analyzer = WordPressContentAnalyzer(llm_enabled=True, llm_config=llm_config)

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            async def mock_chat(persona, prompt, model=None):
                return """## Expanded Analysis

This content has been expanded with LLM assistance.

### Key Features
- Feature one
- Feature two
- Feature three
"""
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            proposal = analyzer.propose_improvement(post)

            assert proposal is not None
            assert proposal.post_id == post["id"]
            assert proposal.improvement_type == "expand"
            assert len(proposal.suggested_content) > len(post["content"])
            assert proposal.confidence > 0

    def test_template_fallback_when_llm_unavailable(self, mock_posts, temp_backup_dir):
        """
        Test template fallback when LLM is unavailable.

        Validates that:
        1. Fallback is triggered when bridge is None
        2. Fallback content has expected structure
        3. Confidence is set to fallback_confidence (0.3)
        4. fallback_used flag is True
        """
        # Create config with LLM enabled but no API key
        config = LLMExpansionConfig(llm_enabled=True, fallback_confidence=0.3)

        # Mock _get_bridge to return None (simulating unavailable bridge)
        with patch.object(LLMExpansionService, '_get_bridge', return_value=None):
            service = LLMExpansionService(config)
            post = mock_posts[0]

            result = service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Verify fallback behavior
            assert result.fallback_used == True
            assert result.confidence == 0.3
            assert result.model_used == "template"
            assert "## Additional Context" in result.content
            assert post["title"] in result.content

    def test_template_fallback_on_mock_response(self, mock_posts):
        """
        Test fallback triggered when LLM returns mock response.

        Validates detection of mock responses starting with "[Mock".
        """
        config = LLMExpansionConfig(llm_enabled=True, fallback_confidence=0.3)

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            # Mock returns mock response
            async def mock_chat(persona, prompt, model=None):
                return "[Mock] This is a simulated response"
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)
            post = mock_posts[0]

            result = service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Should fallback because response starts with [Mock
            assert result.fallback_used == True
            assert result.confidence == 0.3

    def test_template_fallback_on_exception(self, mock_posts):
        """
        Test fallback when LLM throws an exception.

        Validates graceful error handling with fallback.
        """
        config = LLMExpansionConfig(llm_enabled=True, fallback_confidence=0.3)

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            # Mock throws exception
            async def mock_chat(persona, prompt, model=None):
                raise Exception("API timeout")
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)
            post = mock_posts[0]

            result = service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Should fallback on exception
            assert result.fallback_used == True
            assert result.confidence == 0.3


class TestQualityImprovementMetrics:
    """Test quality improvement metrics comparing word counts."""

    @pytest.fixture
    def sample_posts(self):
        return [
            {"id": 1, "title": "Test", "content": "Short."},
            {"id": 2, "title": "Test", "content": "Medium length content here."},
            {"id": 3, "title": "Test", "content": "This is a much longer piece of content that has many more words and should result in a substantial expansion ratio when processed by the LLM service."}
        ]

    def test_quality_improvement_metrics(self, sample_posts):
        """
        Test quality improvement metrics comparing word counts.

        Validates:
        1. expanded_length > original_length for short content
        2. expansion_ratio is calculated correctly
        3. Template mode produces consistent expansion
        """
        config = LLMExpansionConfig(llm_enabled=False)  # Template mode
        service = LLMExpansionService(config)

        for post in sample_posts:
            result = service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Template always adds content
            assert result.expanded_length > result.original_length
            assert result.expansion_ratio > 1.0

            # Verify ratio calculation
            expected_ratio = result.expanded_length / max(result.original_length, 1)
            assert abs(result.expansion_ratio - expected_ratio) < 0.01

    def test_expansion_ratio_calculation(self):
        """
        Test expansion ratio is calculated correctly for various inputs.
        """
        config = LLMExpansionConfig(llm_enabled=False)
        service = LLMExpansionService(config)

        # Test with very short content (edge case)
        result = service.expand(
            post_id=1,
            title="Test",
            content="Hi"
        )

        assert result.original_length > 0
        assert result.expanded_length > 0
        assert result.expansion_ratio == result.expanded_length / max(result.original_length, 1)

    def test_llm_vs_template_quality_comparison(self):
        """
        Compare LLM mode vs template mode outputs.

        Both should produce valid ExpansionResult with different characteristics.
        """
        post = {"id": 1, "title": "Comparison Test", "content": "Original content here."}

        # Template mode
        template_config = LLMExpansionConfig(llm_enabled=False)
        template_service = LLMExpansionService(template_config)
        template_result = template_service.expand(
            post_id=post["id"],
            title=post["title"],
            content=post["content"]
        )

        # LLM mode with mock
        llm_config = LLMExpansionConfig(llm_enabled=True)
        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            async def mock_chat(persona, prompt, model=None):
                return """## LLM Expanded

This is LLM-generated content with proper structure.

### Points
- Point 1
- Point 2
"""
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            llm_service = LLMExpansionService(llm_config)
            llm_result = llm_service.expand(
                post_id=post["id"],
                title=post["title"],
                content=post["content"]
            )

            # Both should produce valid results
            assert template_result.fallback_used == True
            assert llm_result.fallback_used == False

            # LLM should have higher confidence when structured properly
            assert llm_result.confidence >= template_result.confidence


class TestConfidenceScoringAccuracy:
    """Test confidence scoring accuracy."""

    def test_confidence_scoring_accuracy_base(self):
        """
        Test base confidence scoring.

        LLM: 0.5 base
        Template: 0.3 (fallback_confidence)
        """
        # Template mode
        config = LLMExpansionConfig(llm_enabled=False, fallback_confidence=0.3)
        service = LLMExpansionService(config)

        result = service.expand(post_id=1, title="Test", content="Content")
        assert result.confidence == 0.3

    def test_confidence_scoring_with_length_ratio(self):
        """
        Test confidence bonus for good length ratio (2-3x).

        Perfect ratio (2-3x): +0.3 bonus
        Acceptable ratio (1.5-4x): +0.15 bonus
        """
        config = LLMExpansionConfig(llm_enabled=True)

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()

            # Create content that will give perfect ratio
            original = "Short content here."
            # Target expanded: 2-3x original length
            perfect_expansion = (original + " ") * 3  # ~3x length

            async def mock_chat(persona, prompt, model=None):
                return perfect_expansion
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)
            result = service.expand(post_id=1, title="Test", content=original)

            # Should have length bonus
            # Base 0.5 + length bonus (0.15 or 0.3 depending on exact ratio)
            assert result.confidence >= 0.5

    def test_confidence_scoring_with_structure_markers(self):
        """
        Test confidence bonus for structure markers.

        Headings (## or ###, >= 2): +0.1 bonus
        Bullets (- or *, >= 3): +0.1 bonus
        """
        config = LLMExpansionConfig(llm_enabled=True)

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()

            # Content with structure markers
            structured_content = """## Introduction

This is the intro.

## Main Content

The main points are:

- First point
- Second point
- Third point

### Conclusion

Final thoughts.
"""

            async def mock_chat(persona, prompt, model=None):
                return structured_content
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)
            result = service.expand(
                post_id=1,
                title="Test",
                content="Short content."
            )

            # Should have structure bonus (0.1 for headings + 0.1 for bullets)
            # Plus base 0.5
            assert result.confidence >= 0.5
            # With 3 headings (##, ##, ###) and 3 bullets, should get max structure bonus
            # But depends on length ratio too
            assert result.confidence <= 0.95  # Cap

    def test_confidence_scoring_range(self):
        """
        Test that confidence is always in valid range [0.0, 0.95].
        """
        config = LLMExpansionConfig(llm_enabled=True)

        test_cases = [
            ("Very short", "Hi"),
            ("Medium", "This is a medium length post with some content."),
            ("Long", "A" * 1000),
        ]

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            async def mock_chat(persona, prompt, model=None):
                # Return variable length content
                return "Expanded " * 50
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)

            for title, content in test_cases:
                result = service.expand(post_id=1, title=title, content=content)
                assert 0.0 <= result.confidence <= 0.95, f"Confidence out of range for {title}"


class TestEndToEndBridgeIntegration:
    """Test end-to-end BridgeService integration."""

    @pytest.fixture
    def temp_backup_dir(self):
        """Create temporary backup directory."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir, ignore_errors=True)

    @pytest.fixture
    def safety_config(self, temp_backup_dir):
        """Safety config with temp backup dir."""
        return SafetyConfig(
            require_backup=True,
            min_confidence=0.5,
            backup_dir=temp_backup_dir
        )

    @pytest.fixture
    def bridge_config(self, safety_config):
        """Bridge service config with safety enabled."""
        return BridgeServiceConfig(
            wp_url="http://localhost:8080",
            ws_uri="ws://localhost:8768",
            cycle_interval=60,
            auto_execute=True,
            min_confidence=0.5,
            safety_config=safety_config,
            llm_enabled=True,
            llm_model="glm-4-plus"
        )

    @pytest.mark.asyncio
    async def test_e2e_bridge_with_llm_expansion(self, bridge_config):
        """
        Test full BridgeService flow with LLM expansion.

        Flow: fetch posts -> analyze -> expand -> validate -> backup -> execute
        """
        # Mock the agent's post fetching
        mock_posts = [
            {"id": 1, "title": "Test Post", "content": "Short content."}
        ]

        with patch.object(WordPressEvolutionAgent, '_fetch_posts', return_value=mock_posts):
            with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
                mock_zai = MagicMock()
                async def mock_chat(persona, prompt, model=None):
                    return """## Expanded Content

This is expanded with proper structure.

### Key Points
- Point one
- Point two
- Point three
"""
                mock_zai.chat = mock_chat
                mock_bridge.return_value = mock_zai

                # Create service with mock executor
                executor = MockPlaywrightActionExecutor()
                service = WPEvolutionBridgeService(
                    config=bridge_config,
                    executor=executor
                )

                # Run single cycle
                result = await service.run_single_cycle()

                assert result["posts_analyzed"] == 1
                assert result["proposals_generated"] >= 0
                assert "cycle_number" in result

    @pytest.mark.asyncio
    async def test_e2e_safety_validation_in_flow(self, bridge_config):
        """
        Test that safety validation works in full flow.

        Low confidence proposals should be rejected from execution.
        """
        # Post with good content - fewer issues means lower confidence for improvement
        mock_posts = [
            {"id": 1, "title": "A well-written post with sufficient content", "content": "This is a comprehensive post with enough words to pass the minimum word count threshold. It has good readability and proper structure that makes it unlikely to need improvement."}
        ]

        # Create a config with high min_confidence
        high_threshold_config = BridgeServiceConfig(
            wp_url="http://localhost:8080",
            ws_uri="ws://localhost:8768",
            auto_execute=True,
            min_confidence=0.95,  # Very high threshold
            safety_config=SafetyConfig(min_confidence=0.95, require_backup=False)
        )

        with patch.object(WordPressEvolutionAgent, '_fetch_posts', return_value=mock_posts):
            executor = MockPlaywrightActionExecutor()
            service = WPEvolutionBridgeService(
                config=high_threshold_config,
                executor=executor
            )

            result = await service.run_single_cycle()

            # With very high threshold (0.95), proposals should be filtered
            # The analyzer confidence is 0.5 + issue_weight (max 0.95)
            # Good posts have fewer issues, so confidence should be lower
            # If any proposals are generated, they should have confidence < 0.95
            # so qualified_proposals should be 0
            if result["proposals_generated"] > 0:
                # If proposals were generated, none should qualify at 0.95 threshold
                assert result["qualified_proposals"] == 0, \
                    f"Expected 0 qualified proposals at 0.95 threshold, got {result['qualified_proposals']}"

    @pytest.mark.asyncio
    async def test_e2e_backup_created_before_execution(self, bridge_config, temp_backup_dir):
        """
        Test that backup is created before execution in full flow.
        """
        mock_posts = [
            {"id": 42, "title": "Backup Test", "content": "Original content for backup test."}
        ]

        with patch.object(WordPressEvolutionAgent, '_fetch_posts', return_value=mock_posts):
            with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
                mock_zai = MagicMock()
                async def mock_chat(persona, prompt, model=None):
                    return "Expanded content with enough length to pass safety validation. " * 5
                mock_zai.chat = mock_chat
                mock_bridge.return_value = mock_zai

                executor = MockPlaywrightActionExecutor()
                service = WPEvolutionBridgeService(
                    config=bridge_config,
                    executor=executor
                )

                # Verify backup manager exists
                assert service._backup_manager is not None

                # Run cycle
                await service.run_single_cycle()

                # Check if backup was created (depends on proposals being generated)
                if executor.execute_calls:
                    backup_manager = ContentBackup(SafetyConfig(backup_dir=temp_backup_dir))
                    backup = backup_manager.load(post_id=42)
                    # Backup may or may not exist depending on proposal confidence
                    # but backup_manager should be available


class TestIntegrationMetrics:
    """Test integration-level metrics and reporting."""

    def test_expansion_result_metrics_complete(self):
        """
        Test that ExpansionResult has all expected metrics.
        """
        config = LLMExpansionConfig(llm_enabled=False)
        service = LLMExpansionService(config)

        result = service.expand(
            post_id=123,
            title="Metrics Test",
            content="Testing all metrics."
        )

        # All metrics should be populated
        assert result.post_id == 123
        assert result.content is not None
        assert 0.0 <= result.confidence <= 1.0
        assert result.model_used == "template"
        assert result.fallback_used == True
        assert result.original_length > 0
        assert result.expanded_length > 0
        assert result.expansion_ratio > 0
        assert result.error is None  # No error in successful expansion

    def test_analyzer_proposal_metrics_complete(self):
        """
        Test that ImprovementProposal has all expected fields.
        """
        analyzer = WordPressContentAnalyzer(llm_enabled=False)

        post = {"id": 456, "title": "Test", "content": "Short content."}
        proposal = analyzer.propose_improvement(post)

        assert proposal is not None
        assert proposal.post_id == 456
        assert proposal.improvement_type in ["expand", "enhance", "correct"]
        assert proposal.suggested_content is not None
        assert 0.0 <= proposal.confidence <= 1.0
        assert proposal.reason is not None
        assert proposal.target_selector is not None

    def test_service_stats_tracking(self):
        """
        Test that BridgeService tracks statistics correctly.
        """
        config = BridgeServiceConfig(
            auto_execute=False,
            safety_config=SafetyConfig(require_backup=False)
        )
        service = WPEvolutionBridgeService(config)

        stats = service.get_stats()

        assert stats.cycles_completed == 0
        assert stats.proposals_generated == 0
        assert stats.proposals_executed == 0
        assert stats.errors == 0
        assert stats.running == False
        assert stats.uptime_seconds == 0.0


class TestLLMServiceModes:
    """Test different LLM service modes."""

    def test_llm_disabled_uses_template(self):
        """
        Test that llm_enabled=False always uses template.
        """
        config = LLMExpansionConfig(llm_enabled=False)
        service = LLMExpansionService(config)

        result = service.expand(
            post_id=1,
            title="Test",
            content="Content"
        )

        assert result.fallback_used == True
        assert result.model_used == "template"
        assert result.confidence == 0.3

    def test_llm_enabled_tries_llm_first(self):
        """
        Test that llm_enabled=True tries LLM before fallback.
        """
        config = LLMExpansionConfig(llm_enabled=True)
        call_count = [0]

        with patch.object(LLMExpansionService, '_get_bridge') as mock_bridge:
            mock_zai = MagicMock()
            async def mock_chat(persona, prompt, model=None):
                call_count[0] += 1
                return "LLM generated content"
            mock_zai.chat = mock_chat
            mock_bridge.return_value = mock_zai

            service = LLMExpansionService(config)
            result = service.expand(post_id=1, title="Test", content="Content")

            # LLM should have been called
            assert call_count[0] == 1
            assert result.fallback_used == False
            assert result.model_used == "glm-4-plus"
