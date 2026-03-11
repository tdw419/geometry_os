#!/usr/bin/env python3
"""
Test Neural City UI wiring - verify visual bridge connects to PixelBrain
and emits atlas glow events during inference.
"""

import asyncio
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

from systems.visual_shell.api.pixel_brain_service import (
    get_pixel_brain_service,
    connect_visual_bridge_to_brain
)
from systems.visual_shell.api.visual_bridge import get_multi_vm_streamer


async def test_wiring():
    print("=" * 60)
    print("Neural City Wiring Test")
    print("=" * 60)

    # 1. Get PixelBrain service
    print("\n1. Getting PixelBrain service...")
    service = get_pixel_brain_service()

    if not service.is_available():
        print("   ERROR: PixelBrain service not available")
        return False
    print(f"   ✓ Service available, brain: {service.brain_path}")

    # 2. Check initial visual bridge state
    print("\n2. Initial visual bridge state...")
    print(f"   visual_bridge = {service.visual_bridge}")

    # 3. Connect visual bridge
    print("\n3. Connecting visual bridge...")
    success = connect_visual_bridge_to_brain()
    print(f"   connect_visual_bridge_to_brain() = {success}")
    print(f"   visual_bridge = {service.visual_bridge}")

    # 4. Get the multi vm streamer directly
    print("\n4. Checking MultiVmStreamer...")
    streamer = get_multi_vm_streamer()
    print(f"   streamer = {streamer}")
    print(f"   active_websockets = {len(streamer.active_websockets)}")

    # 5. Test generation (without actual websocket, just check emit path)
    print("\n5. Running test generation...")
    result = await service.generate("Hello", max_tokens=3, emit_visual=True)
    print(f"   Generated: {result['text']!r}")
    print(f"   Visual feedback: {result.get('visual_feedback', {})}")

    # 6. Check that pipeline has visual_bridge set
    print("\n6. Pipeline visual_bridge state...")
    if service.pipeline:
        print(f"   pipeline.visual_bridge = {service.pipeline.visual_bridge}")
    else:
        print("   ERROR: Pipeline not initialized")

    print("\n" + "=" * 60)
    print("Wiring test complete!")
    print("=" * 60)
    print("\nTo see atlas glow in Neural City:")
    print("  1. Start the visual bridge server: python -m systems.visual_shell.api.visual_bridge")
    print("  2. Open Neural City in browser")
    print("  3. Run inference - atlas glow should appear")

    return True


if __name__ == "__main__":
    asyncio.run(test_wiring())
