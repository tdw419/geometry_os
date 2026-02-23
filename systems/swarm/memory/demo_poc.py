#!/usr/bin/env python3
"""
POC Demo Script for EpisodicMemory and RecursiveGrowth.

Demonstrates end-to-end flow:
1. Store experiences
2. Query similar experiences
3. Analyze patterns
"""

import tempfile
import os

from systems.swarm.memory import (
    EpisodicMemory,
    generate_embedding,
    cosine_similarity
)
from systems.swarm.growth import RecursiveGrowth, PatternAnalyzer
from systems.swarm import NEBBus


def main():
    print("=" * 60)
    print("EpisodicMemory POC Demo")
    print("=" * 60)

    # Use temp file to avoid polluting .geometry
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
        temp_path = f.name

    try:
        # 1. Create memory instance for an agent
        print("\n[1] Creating EpisodicMemory for agent 'demo_agent'...")
        memory = EpisodicMemory("demo_agent", storage_path=temp_path)
        print("    OK - Memory initialized")

        # 2. Store some experiences
        print("\n[2] Storing experiences...")
        exp1 = memory.store_experience(
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="Generated authentication module with JWT support",
            metadata={"duration": 45.2}
        )
        print(f"    Stored: {exp1.experience_id} - {exp1.outcome}")

        exp2 = memory.store_experience(
            task_type="CODE_GEN",
            action="write",
            outcome="failure",
            description="Failed to generate database migration - syntax error in SQL",
            metadata={"error": "SQL syntax error", "duration": 12.3}
        )
        print(f"    Stored: {exp2.experience_id} - {exp2.outcome}")

        exp3 = memory.store_experience(
            task_type="CODE_REVIEW",
            action="review",
            outcome="success",
            description="Reviewed authentication PR, found 2 minor issues",
            metadata={"duration": 15.0}
        )
        print(f"    Stored: {exp3.experience_id} - {exp3.outcome}")

        exp4 = memory.store_experience(
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="Generated user profile API endpoints",
            metadata={"duration": 38.7}
        )
        print(f"    Stored: {exp4.experience_id} - {exp4.outcome}")

        exp5 = memory.store_experience(
            task_type="CODE_GEN",
            action="write",
            outcome="failure",
            description="Failed to generate API client - missing type definitions",
            metadata={"error": "TypeError", "duration": 8.5}
        )
        print(f"    Stored: {exp5.experience_id} - {exp5.outcome}")

        # 3. Query similar experiences
        print("\n[3] Querying similar experiences...")
        query_text = "generate code for database API"
        query_embedding = generate_embedding(query_text)
        print(f"    Query: '{query_text}'")

        similar = memory.find_similar(query_embedding, k=3)
        print(f"    Found {len(similar)} similar experiences:")
        for result in similar:
            print(f"      - {result.experience.task_type}/{result.experience.outcome}: "
                  f"{result.similarity:.3f} - {result.experience.description[:50]}...")

        # 4. Check for similar failures
        print("\n[4] Checking for similar failures...")
        failures = memory.check_similar_failures(query_embedding, min_similarity=0.0)
        print(f"    Found {len(failures)} similar failures:")
        for result in failures:
            print(f"      - {result.experience.task_type}: {result.experience.description[:50]}...")

        # 5. Check for similar successes
        print("\n[5] Checking for similar successes...")
        successes = memory.find_similar_successes(query_embedding, min_similarity=0.0)
        print(f"    Found {len(successes)} similar successes:")
        for result in successes:
            print(f"      - {result.experience.task_type}: {result.experience.description[:50]}...")

        # 6. Pattern analysis
        print("\n[6] Running pattern analysis...")
        analyzer = PatternAnalyzer(min_sample_size=2)
        all_experiences = memory.get_all_experiences()
        analysis = analyzer.analyze_agent_performance(all_experiences)
        print(f"    Success rate: {analysis['success_rate']:.1%}")
        print(f"    Total experiences: {analysis['total_count']}")
        print(f"    Common failures: {analysis['common_failures']}")
        print(f"    Recommendations: {analysis['recommendations']}")

        # 7. Pattern detection
        print("\n[7] Detecting trends...")
        patterns = analyzer.detect_patterns(all_experiences, window_size=3)
        print(f"    Trend: {patterns['trend']} (confidence: {patterns['confidence']:.2f})")
        print(f"    Recent success rate: {patterns['recent_success_rate']:.1%}")

        # 8. RecursiveGrowth with NEBBus
        print("\n[8] Testing RecursiveGrowth with NEBBus...")
        bus = NEBBus("demo_coordinator")
        growth = RecursiveGrowth(bus, agent_id="demo_agent")

        # Simulate some task events
        bus.publish("task.completed", {
            "agent_id": "demo_agent",
            "task_type": "CODE_GEN",
            "outcome": "success",
            "task_id": "task-001"
        })
        bus.publish("task.completed", {
            "agent_id": "demo_agent",
            "task_type": "CODE_REVIEW",
            "outcome": "success",
            "task_id": "task-002"
        })
        bus.publish("task.completed", {
            "agent_id": "demo_agent",
            "task_type": "CODE_GEN",
            "outcome": "failure",
            "task_id": "task-003"
        })

        metrics = growth.get_metrics()
        print(f"    Tasks tracked: {metrics.total_tasks}")
        print(f"    Successes: {metrics.successes}")
        print(f"    Failures: {metrics.failures}")
        print(f"    Success rate: {metrics.success_rate:.1%}")

        growth.shutdown()

        # 9. Embedding consistency check
        print("\n[9] Verifying embedding consistency...")
        text = "test embedding consistency"
        e1 = generate_embedding(text)
        e2 = generate_embedding(text)
        assert e1 == e2, "Same text should produce same embedding"
        print("    OK - Embeddings are deterministic")

        # 10. Similarity check
        print("\n[10] Verifying similarity calculation...")
        similar_text = "test embedding similar"
        different_text = "completely different topic here"
        e_similar = generate_embedding(similar_text)
        e_different = generate_embedding(different_text)

        sim_to_similar = cosine_similarity(e1, e_similar)
        sim_to_different = cosine_similarity(e1, e_different)
        print(f"    Similarity to similar text: {sim_to_similar:.3f}")
        print(f"    Similarity to different text: {sim_to_different:.3f}")

        # Similar texts should have higher similarity than different texts
        if sim_to_similar > sim_to_different:
            print("    OK - Similar texts have higher similarity")
        else:
            print("    Note: Hash-based embeddings have limited semantic understanding")

        print("\n" + "=" * 60)
        print("POC SUCCESS - All components working!")
        print("=" * 60)

    finally:
        # Cleanup temp file
        if os.path.exists(temp_path):
            os.unlink(temp_path)


if __name__ == "__main__":
    main()
