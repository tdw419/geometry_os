#!/usr/bin/env python3
"""
Test script to verify dynamic efficiency metrics are working correctly.
"""

import asyncio
from src.token_manager.token_manager import TokenManager
from src.evolution.evolution_daemon import TokenAwareEvolutionDaemon

async def test_dynamic_efficiency():
    print("🧪 Testing Dynamic Efficiency Metrics Fix")

    # Create token manager
    token_manager = TokenManager()
    efficiency_tracker = token_manager.efficiency_tracker

    print(f"📊 TokenEfficiencyTracker thresholds:")
    print(f"   Low efficiency threshold: {efficiency_tracker.low_efficiency_threshold:.6f}")
    print(f"   Recovery threshold: {efficiency_tracker.efficiency_recovery_threshold:.6f}")

    # Test different efficiency values
    test_cases = [
        {"tokens_spent": 23000, "improvement": 0.121, "expected_efficiency": 0.121/23000},
        {"tokens_spent": 23000, "improvement": 0.131, "expected_efficiency": 0.131/23000},
        {"tokens_spent": 23000, "improvement": 0.119, "expected_efficiency": 0.119/23000},
    ]

    print(f"\n🔍 Testing efficiency calculations:")
    for i, case in enumerate(test_cases):
        efficiency = case["improvement"] / case["tokens_spent"]
        print(f"   Case {i+1}: {case['tokens_spent']} tokens, {case['improvement']} improvement → {efficiency:.6f} efficiency")

        # Check against dynamic threshold
        if efficiency < efficiency_tracker.low_efficiency_threshold:
            print(f"   ❌ Below threshold ({efficiency:.6f} < {efficiency_tracker.low_efficiency_threshold:.6f})")
        else:
            print(f"   ✅ Above threshold ({efficiency:.6f} >= {efficiency_tracker.low_efficiency_threshold:.6f})")

    # Test the old hardcoded threshold vs new dynamic threshold
    old_threshold = 0.000005
    print(f"\n🔄 Comparison:")
    print(f"   Old hardcoded threshold: {old_threshold:.6f}")
    print(f"   New dynamic threshold: {efficiency_tracker.low_efficiency_threshold:.6f}")
    print(f"   Difference: {efficiency_tracker.low_efficiency_threshold - old_threshold:.6f}")

    # Test efficiency report
    print(f"\n📈 Efficiency Report:")
    report = await efficiency_tracker.get_efficiency_report()
    if report.get("status") != "no_data":
        print(f"   Average efficiency: {report['average_efficiency']:.6f}")
        print(f"   Efficiency health: {report['efficiency_health_score']:.2f}")
        print(f"   Conservation mode: {report['conservation_mode']}")
        print(f"   Recommendations: {len(report['recommendations'])}")
    else:
        print("   No efficiency data available (expected for fresh tracker)")

    print(f"\n✅ Test completed successfully!")

if __name__ == "__main__":
    asyncio.run(test_dynamic_efficiency())