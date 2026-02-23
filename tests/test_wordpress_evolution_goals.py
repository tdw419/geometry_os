# tests/test_wordpress_evolution_goals.py
import pytest
import asyncio
import json
from unittest.mock import Mock, AsyncMock, patch
from systems.evolution_daemon.wordpress.content_analyzer import WordPressContentAnalyzer
from systems.evolution_daemon.wordpress.bridge_service import WPEvolutionBridgeService, BridgeServiceConfig
from systems.evolution_daemon.wordpress.evolution_agent import EvolutionCycleResult
from systems.evolution_daemon.wordpress.content_analyzer import ImprovementProposal

@pytest.mark.asyncio
async def test_low_confidence_proposals_not_executed():
    """CRITICAL SAFETY: Proposals below min_confidence threshold are never executed."""
    config = BridgeServiceConfig(
        auto_execute=True,
        min_confidence=0.8
    )
    
    # Mock components
    agent = AsyncMock()
    executor = AsyncMock()
    
    # Setup agent to return two proposals: one high confidence (0.9), one low (0.1)
    p1 = ImprovementProposal(post_id=1, improvement_type="expand", suggested_content="This is longer content that meets the minimum length requirement.", confidence=0.9, reason="test")
    p2 = ImprovementProposal(post_id=2, improvement_type="correct", suggested_content="This is corrected content that meets the minimum length requirement.", confidence=0.1, reason="test")
    
    agent.run_cycle.return_value = EvolutionCycleResult(
        cycle_number=1,
        posts_analyzed=2,
        proposals_generated=2,
        proposals=[p1, p2]
    )
    
    # Connect executor mock
    executor.connect.return_value = True
    executor.execute_proposal.return_value = Mock(success=True)
    
    service = WPEvolutionBridgeService(config, agent=agent, executor=executor)
    
    # Run cycle
    result = await service.run_single_cycle()
    
    # Verify: only p1 was executed
    assert result["executed"] == 1
    executor.execute_proposal.assert_called_once_with(p1)
    
    # Double check p2 was NOT passed to executor
    call_args_list = executor.execute_proposal.call_args_list
    executed_post_ids = [call.args[0].post_id for call in call_args_list]
    assert 2 not in executed_post_ids

def test_readability_improves_after_edit():
    """QUALITY GOAL: Modified posts have higher readability scores than before."""
    analyzer = WordPressContentAnalyzer()
    
    # Text with poor readability (long words, long sentences)
    # The current heuristic prefers words around 5 chars and sentences around 17 words.
    # Let's create a very "dense" sentence.
    poor_text = "The implementation of the multi-agent orchestration framework necessitates significant architectural considerations regarding the synchronization of distributed state machines across the neural substrate."
    post = {"id": 1, "title": "Architecture", "content": poor_text}
    
    initial_analysis = analyzer.analyze(post)
    
    # Enhancement should add structure and simplify (simulated by our generator)
    proposal = analyzer.propose_improvement(post)
    enhanced_post = {"id": 1, "title": "Architecture", "content": proposal.suggested_content}
    
    final_analysis = analyzer.analyze(enhanced_post)
    
    # The enhancement template adds headers and bullet points which reduces average word length
    # and increases "sentence" count (delimiters), improving readability score in our simple metric.
    print(f"Initial Readability: {initial_analysis.readability_score:.4f}")
    print(f"Final Readability: {final_analysis.readability_score:.4f}")
    
    assert final_analysis.readability_score >= initial_analysis.readability_score

@pytest.mark.asyncio
async def test_rate_limiting_prevents_mass_changes():
    """SAFETY: Max N posts can be modified per cycle to prevent runaway."""
    config = BridgeServiceConfig(
        auto_execute=True,
        min_confidence=0.5,
        max_executions_per_cycle=3
    )
    
    agent = AsyncMock()
    executor = AsyncMock()
    
    # Return 10 qualified proposals
    proposals = [
        ImprovementProposal(post_id=i, improvement_type="correct", suggested_content="This is corrected content that meets the minimum length validation.", confidence=0.9, reason="test")
        for i in range(10)
    ]
    
    agent.run_cycle.return_value = EvolutionCycleResult(
        cycle_number=1,
        posts_analyzed=10,
        proposals_generated=10,
        proposals=proposals
    )
    
    executor.connect.return_value = True
    executor.execute_proposal.return_value = Mock(success=True)
    
    service = WPEvolutionBridgeService(config, agent=agent, executor=executor)
    
    result = await service.run_single_cycle()
    
    # Verify: only 3 were executed despite 10 being qualified
    assert result["executed"] == 3
    assert executor.execute_proposal.call_count == 3
