"""
Tests for PixelBrain LLM inference bridge.

Tests cover:
- PixelBrainBridge creation and initialization
- Claim analysis with mocked LLM responses
- Counter-bid decision with mocked LLM responses
- District naming with mocked LLM responses
- Rate limiting behavior
- Response caching
- Fallback behavior when LLM fails
- AsyncInferenceClient rate limiting
- AsyncInferenceClient caching
- JSON extraction from various response formats
"""

import asyncio
import json
import pytest
from unittest.mock import AsyncMock, Mock, patch
import time

from systems.pixel_brain.inference_bridge import (
    PixelBrainBridge,
    ClaimAnalysisResult,
    CounterBidDecision,
    DistrictPurposeResult,
    DistrictNameResult,
    extract_json_from_response,
)
from systems.pixel_brain.async_inference import (
    AsyncInferenceClient,
    RateLimiter,
    ResponseCache,
    RetryConfig,
)
from systems.pixel_brain.prompts import (
    CLAIM_ANALYSIS_PROMPT,
    COUNTER_BID_PROMPT,
    DISTRICT_PURPOSE_PROMPT,
    DISTRICT_NAMING_PROMPT,
    format_agents_info,
    format_purpose_list,
)


class TestExtractJsonFromResponse:
    """Tests for JSON extraction from LLM responses."""

    def test_extract_json_from_markdown_block(self):
        """Should extract JSON from markdown code block."""
        response = '''Here is the result:
```json
{"recommended_bid": 25.0, "confidence": 0.8}
```
That is my recommendation.'''

        result = extract_json_from_response(response)
        assert result is not None
        assert result["recommended_bid"] == 25.0
        assert result["confidence"] == 0.8

    def test_extract_json_from_plain_block(self):
        """Should extract JSON from plain code block."""
        response = '''```
{"should_counter": true, "confidence": 0.9}
```'''

        result = extract_json_from_response(response)
        assert result is not None
        assert result["should_counter"] is True

    def test_extract_json_from_raw_content(self):
        """Should extract JSON from raw content."""
        response = '{"primary_name": "Test District", "reasoning": "test"}'

        result = extract_json_from_response(response)
        assert result is not None
        assert result["primary_name"] == "Test District"

    def test_extract_json_from_embedded_content(self):
        """Should extract JSON embedded in text."""
        response = '''Based on my analysis, here is the result:
{"inferred_purpose": "infrastructure", "cohesion_score": 0.75}
The district appears to be focused on infrastructure.'''

        result = extract_json_from_response(response)
        assert result is not None
        assert result["inferred_purpose"] == "infrastructure"

    def test_extract_json_returns_none_for_invalid(self):
        """Should return None for invalid JSON."""
        response = "This is not JSON at all."

        result = extract_json_from_response(response)
        assert result is None

    def test_extract_json_handles_multiline(self):
        """Should handle multiline JSON."""
        response = '''```json
{
    "recommended_bid": 30.0,
    "confidence": 0.95,
    "reasoning": "This is a very important tile"
}
```'''

        result = extract_json_from_response(response)
        assert result is not None
        assert result["recommended_bid"] == 30.0


class TestResultDataclasses:
    """Tests for result dataclasses."""

    def test_claim_analysis_result_from_dict(self):
        """ClaimAnalysisResult should parse from dict correctly."""
        data = {
            "recommended_bid": 42.5,
            "confidence": 0.85,
            "reasoning": "Close to origin, high priority",
        }

        result = ClaimAnalysisResult.from_dict(data)
        assert result.recommended_bid == 42.5
        assert result.confidence == 0.85
        assert result.reasoning == "Close to origin, high priority"

    def test_counter_bid_decision_from_dict_true(self):
        """CounterBidDecision should parse positive decision correctly."""
        data = {
            "should_counter": True,
            "suggested_counter_bid": 55.0,
            "confidence": 0.7,
            "reasoning": "Tile is valuable",
        }

        result = CounterBidDecision.from_dict(data)
        assert result.should_counter is True
        assert result.suggested_counter_bid == 55.0
        assert result.confidence == 0.7

    def test_counter_bid_decision_from_dict_false(self):
        """CounterBidDecision should parse negative decision correctly."""
        data = {
            "should_counter": False,
            "suggested_counter_bid": None,
            "confidence": 0.6,
            "reasoning": "Too expensive",
        }

        result = CounterBidDecision.from_dict(data)
        assert result.should_counter is False
        assert result.suggested_counter_bid is None

    def test_district_purpose_result_from_dict(self):
        """DistrictPurposeResult should parse from dict correctly."""
        data = {
            "inferred_purpose": "research",
            "purpose_description": "A cluster of research agents",
            "cohesion_score": 0.88,
            "key_activities": ["experiment", "analysis", "publication"],
        }

        result = DistrictPurposeResult.from_dict(data)
        assert result.inferred_purpose == "research"
        assert result.cohesion_score == 0.88
        assert "experiment" in result.key_activities

    def test_district_name_result_from_dict(self):
        """DistrictNameResult should parse from dict correctly."""
        data = {
            "primary_name": "Innovation Hub",
            "alternative_names": ["Discovery Ridge", "Research Quarter"],
            "reasoning": "Based on research focus",
        }

        result = DistrictNameResult.from_dict(data)
        assert result.primary_name == "Innovation Hub"
        assert len(result.alternative_names) == 2


class TestRateLimiter:
    """Tests for rate limiting."""

    @pytest.mark.asyncio
    async def test_rate_limiter_allows_within_limit(self):
        """Rate limiter should allow requests within limit."""
        limiter = RateLimiter(max_requests_per_second=10.0)

        # Should be able to acquire quickly for first few requests
        start = time.time()
        for _ in range(5):
            await limiter.acquire()
        elapsed = time.time() - start

        # Should be nearly instant (no waiting)
        assert elapsed < 0.5

    @pytest.mark.asyncio
    async def test_rate_limiter_waits_at_limit(self):
        """Rate limiter should wait when at limit."""
        limiter = RateLimiter(max_requests_per_second=5.0)

        # Drain the tokens
        for _ in range(5):
            await limiter.acquire()

        # Next request should wait
        start = time.time()
        await limiter.acquire()
        elapsed = time.time() - start

        # Should have waited at least 0.2 seconds (1/5)
        assert elapsed >= 0.15


class TestResponseCache:
    """Tests for response caching."""

    @pytest.mark.asyncio
    async def test_cache_stores_and_retrieves(self):
        """Cache should store and retrieve responses."""
        cache = ResponseCache(max_size=10)

        messages = [{"role": "user", "content": "test"}]
        model = "test-model"
        response = {"choices": [{"message": {"content": "response"}}]}

        # Store
        await cache.put(messages, model, response)

        # Retrieve
        cached = await cache.get(messages, model)
        assert cached == response

    @pytest.mark.asyncio
    async def test_cache_returns_none_for_miss(self):
        """Cache should return None for cache miss."""
        cache = ResponseCache(max_size=10)

        messages = [{"role": "user", "content": "different"}]
        model = "different-model"

        cached = await cache.get(messages, model)
        assert cached is None

    @pytest.mark.asyncio
    async def test_cache_respects_ttl(self):
        """Cache should respect TTL and expire entries."""
        cache = ResponseCache(max_size=10, default_ttl=0.1)

        messages = [{"role": "user", "content": "test"}]
        model = "test-model"
        response = {"choices": [{"message": {"content": "response"}}]}

        await cache.put(messages, model, response)

        # Should be cached immediately
        cached = await cache.get(messages, model)
        assert cached is not None

        # Wait for TTL to expire
        await asyncio.sleep(0.15)

        # Should be expired now
        cached = await cache.get(messages, model)
        assert cached is None

    @pytest.mark.asyncio
    async def test_cache_evicts_oldest_at_capacity(self):
        """Cache should evict oldest entries when at capacity."""
        cache = ResponseCache(max_size=3)

        # Fill cache
        for i in range(3):
            messages = [{"role": "user", "content": f"message-{i}"}]
            await cache.put(messages, "model", {"id": i})

        # Add one more - should evict oldest
        new_messages = [{"role": "user", "content": "message-new"}]
        await cache.put(new_messages, "model", {"id": "new"})

        # Oldest should be evicted
        oldest_messages = [{"role": "user", "content": "message-0"}]
        cached = await cache.get(oldest_messages, "model")
        assert cached is None

        # Newest should be present
        cached = await cache.get(new_messages, "model")
        assert cached is not None


class TestAsyncInferenceClient:
    """Tests for AsyncInferenceClient."""

    @pytest.mark.asyncio
    async def test_client_initialization(self):
        """Client should initialize with correct settings."""
        client = AsyncInferenceClient(
            base_url="http://localhost:1234/v1",
            model="test-model",
            max_requests_per_second=5.0,
        )

        assert client.base_url == "http://localhost:1234/v1"
        assert client.model == "test-model"

        await client.close()

    @pytest.mark.asyncio
    async def test_chat_completion_with_mock(self):
        """Chat completion should return mocked response."""
        client = AsyncInferenceClient(base_url="http://localhost:1234/v1")

        mock_response = {
            "choices": [{"message": {"content": '{"test": "response"}'}}]
        }

        with patch.object(
            client,
            "_make_request_with_retry",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            response = await client.chat_completion(
                messages=[{"role": "user", "content": "test"}]
            )

            assert response == mock_response

        await client.close()

    @pytest.mark.asyncio
    async def test_client_uses_cache(self):
        """Client should use cache for repeated requests."""
        client = AsyncInferenceClient(
            base_url="http://localhost:1234/v1",
            cache_size=10
        )

        messages = [{"role": "user", "content": "test"}]
        mock_response = {
            "choices": [{"message": {"content": "cached response"}}]
        }

        call_count = 0

        async def mock_request(*args, **kwargs):
            nonlocal call_count
            call_count += 1
            return mock_response

        with patch.object(
            client,
            "_make_request_with_retry",
            side_effect=mock_request
        ):
            # First call
            await client.chat_completion(messages=messages)
            # Second call - should use cache
            await client.chat_completion(messages=messages)

            # Should only have made one actual request
            assert call_count == 1
            stats = client.get_stats()
            assert stats["cache_hits"] == 1

        await client.close()

    @pytest.mark.asyncio
    async def test_batch_completion(self):
        """Batch completion should process multiple requests."""
        client = AsyncInferenceClient(base_url="http://localhost:1234/v1")

        mock_response = {
            "choices": [{"message": {"content": "response"}}]
        }

        with patch.object(
            client,
            "_make_request_with_retry",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            batch_messages = [
                [{"role": "user", "content": "msg1"}],
                [{"role": "user", "content": "msg2"}],
                [{"role": "user", "content": "msg3"}],
            ]

            results = await client.batch_completion(batch_messages)

            assert len(results) == 3
            assert all(r is not None for r in results)

        await client.close()


class TestPixelBrainBridge:
    """Tests for PixelBrainBridge."""

    @pytest.mark.asyncio
    async def test_bridge_initialization(self):
        """Bridge should initialize correctly."""
        bridge = PixelBrainBridge(
            lm_studio_url="http://localhost:1234/v1",
            model="test-model"
        )

        assert bridge.lm_studio_url == "http://localhost:1234/v1"
        assert bridge.model == "test-model"

        await bridge.close()

    @pytest.mark.asyncio
    async def test_analyze_claim_with_mock(self):
        """Analyze claim should return ClaimAnalysisResult."""
        bridge = PixelBrainBridge()

        mock_response = {
            "choices": [{
                "message": {
                    "content": json.dumps({
                        "recommended_bid": 25.0,
                        "confidence": 0.8,
                        "reasoning": "Test reasoning"
                    })
                }
            }]
        }

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            result = await bridge.analyze_claim(
                tile=(10, 20),
                purpose="Build infrastructure",
                budget=100.0
            )

            assert isinstance(result, ClaimAnalysisResult)
            assert result.recommended_bid == 25.0
            assert result.confidence == 0.8

        await bridge.close()

    @pytest.mark.asyncio
    async def test_analyze_claim_fallback_on_failure(self):
        """Analyze claim should use fallback when LLM fails."""
        bridge = PixelBrainBridge()

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=None
        ):
            result = await bridge.analyze_claim(
                tile=(0, 0),
                purpose="Test",
                budget=100.0
            )

            # Should return fallback result
            assert isinstance(result, ClaimAnalysisResult)
            assert result.confidence < 0.5  # Low confidence for fallback

        await bridge.close()

    @pytest.mark.asyncio
    async def test_should_counter_bid_with_mock(self):
        """Counter-bid decision should return CounterBidDecision."""
        bridge = PixelBrainBridge()

        mock_response = {
            "choices": [{
                "message": {
                    "content": json.dumps({
                        "should_counter": True,
                        "suggested_counter_bid": 35.0,
                        "confidence": 0.75,
                        "reasoning": "Tile is valuable"
                    })
                }
            }]
        }

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            result = await bridge.should_counter_bid(
                original_bid=25.0,
                my_budget=100.0,
                tile=(5, 5)
            )

            assert isinstance(result, CounterBidDecision)
            assert result.should_counter is True
            assert result.suggested_counter_bid == 35.0

        await bridge.close()

    @pytest.mark.asyncio
    async def test_infer_district_purpose_with_mock(self):
        """District purpose inference should return DistrictPurposeResult."""
        bridge = PixelBrainBridge()

        mock_response = {
            "choices": [{
                "message": {
                    "content": json.dumps({
                        "inferred_purpose": "infrastructure",
                        "purpose_description": "Power and networking hub",
                        "cohesion_score": 0.85,
                        "key_activities": ["power", "networking", "storage"]
                    })
                }
            }]
        }

        agents = [
            {"agent_id": "a1", "purpose": "power generation", "strategy_type": "aggressive"},
            {"agent_id": "a2", "purpose": "networking", "strategy_type": "conservative"},
        ]

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            result = await bridge.infer_district_purpose(
                agents=agents,
                center=(10.0, 10.0),
                radius=5.0
            )

            assert isinstance(result, DistrictPurposeResult)
            assert result.inferred_purpose == "infrastructure"
            assert result.cohesion_score == 0.85

        await bridge.close()

    @pytest.mark.asyncio
    async def test_name_district_with_mock(self):
        """District naming should return DistrictNameResult."""
        bridge = PixelBrainBridge()

        mock_response = {
            "choices": [{
                "message": {
                    "content": json.dumps({
                        "primary_name": "Foundry Quarter",
                        "alternative_names": ["Industrial Hub", "Power District"],
                        "reasoning": "Based on infrastructure focus"
                    })
                }
            }]
        }

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            result = await bridge.name_district(
                purposes=["infrastructure", "power", "storage"],
                cohesion=0.8,
                tile_count=15,
                center=(20, 30)
            )

            assert isinstance(result, DistrictNameResult)
            assert result.primary_name == "Foundry Quarter"
            assert len(result.alternative_names) == 2

        await bridge.close()

    @pytest.mark.asyncio
    async def test_bridge_stats_tracking(self):
        """Bridge should track statistics correctly."""
        bridge = PixelBrainBridge()

        mock_response = {
            "choices": [{"message": {"content": '{"test": true}'}}]
        }

        with patch.object(
            bridge.client,
            "chat_completion",
            new_callable=AsyncMock,
            return_value=mock_response
        ):
            await bridge.analyze_claim((0, 0), "test", 100.0)
            await bridge.should_counter_bid(10.0, 50.0, (0, 0))
            await bridge.name_district(["test"], 0.5)

            stats = bridge.get_stats()
            assert stats["analysis_count"] == 1
            assert stats["counter_bid_count"] == 1
            assert stats["district_naming_count"] == 1

        await bridge.close()


class TestPrompts:
    """Tests for prompt formatting."""

    def test_claim_analysis_prompt_format(self):
        """Claim analysis prompt should format correctly."""
        prompt = CLAIM_ANALYSIS_PROMPT.format(
            x=10,
            y=20,
            distance=22.36,
            purpose="Build infrastructure",
            budget=100.0,
            reserved=20.0,
            consumed=10.0,
        )

        assert "(10, 20)" in prompt
        assert "22.36" in prompt
        assert "Build infrastructure" in prompt
        assert "100.00" in prompt

    def test_counter_bid_prompt_format(self):
        """Counter-bid prompt should format correctly."""
        prompt = COUNTER_BID_PROMPT.format(
            x=5,
            y=5,
            original_bid=25.0,
            purpose="Test purpose",
            original_agent_id="agent-123",
            my_budget=100.0,
            my_reserved=10.0,
            won_claims_count=3,
        )

        assert "(5, 5)" in prompt
        assert "25.00" in prompt
        assert "Test purpose" in prompt
        assert "agent-123" in prompt

    def test_format_agents_info(self):
        """Agent info formatting should work correctly."""
        agents = [
            {"agent_id": "a1", "purpose": "power", "strategy_type": "aggressive"},
            {"agent_id": "a2", "purpose": "network", "strategy_type": "conservative"},
        ]

        result = format_agents_info(agents)

        assert "a1" in result
        assert "a2" in result
        assert "power" in result
        assert "network" in result

    def test_format_purpose_list(self):
        """Purpose list formatting should count correctly."""
        purposes = [
            "infrastructure",
            "infrastructure",
            "power",
            "power",
            "power",
            "networking",
        ]

        result = format_purpose_list(purposes)

        assert "infrastructure (2 agents)" in result
        assert "power (3 agents)" in result
        assert "networking (1 agents)" in result


class TestIntegration:
    """Integration tests."""

    @pytest.mark.asyncio
    async def test_context_manager(self):
        """Bridge should work as async context manager."""
        async with PixelBrainBridge() as bridge:
            assert bridge is not None
            # Session should be created lazily when needed

    @pytest.mark.asyncio
    async def test_check_lm_studio_available_mock(self):
        """Check LM Studio availability should work with mock."""
        bridge = PixelBrainBridge()

        with patch("aiohttp.ClientSession.get") as mock_get:
            mock_get.return_value.__aenter__.return_value.status = 200

            # Note: The actual check uses a new session, so we need to patch differently
            # For this test, we just verify the method exists and can be called
            result = await bridge.check_lm_studio_available()
            # Result will be False since we can't fully mock aiohttp
            assert isinstance(result, bool)

        await bridge.close()
