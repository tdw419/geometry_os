#!/usr/bin/env python3
"""
End-to-end test for Atlas Glow visualization.
Connects to visual bridge websocket, runs inference, captures glow events.
"""

import asyncio
import json
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

import websockets


async def test_atlas_glow():
    print("=" * 60)
    print("Atlas Glow E2E Test")
    print("=" * 60)

    ws_url = "ws://localhost:3002/ws/v1/multiplexed"

    # Add Origin header to pass CORS check
    headers = {"Origin": "http://localhost:3000"}

    try:
        async with websockets.connect(ws_url, additional_headers=headers) as ws:
            print(f"\n✓ Connected to {ws_url}")

            # Connect visual bridge to PixelBrain
            from systems.visual_shell.api.pixel_brain_service import (
                get_pixel_brain_service,
                connect_visual_bridge_to_brain
            )

            print("\n1. Connecting visual bridge to PixelBrain...")
            connect_visual_bridge_to_brain()
            service = get_pixel_brain_service()
            print(f"   visual_bridge = {service.visual_bridge}")

            # Run inference in a task while listening for events
            print("\n2. Running inference...")

            # Start a task to collect events
            events_received = []

            async def collect_events():
                try:
                    while True:
                        msg = await asyncio.wait_for(ws.recv(), timeout=2.0)
                        data = json.loads(msg)
                        events_received.append(data)
                except asyncio.TimeoutError:
                    pass

            # Run inference
            async def run_inference():
                result = await service.generate("Hello world", max_tokens=5, emit_visual=True)
                return result

            # Run both concurrently
            collect_task = asyncio.create_task(collect_events())
            await asyncio.sleep(0.1)  # Let collector start

            result = await run_inference()
            print(f"   Generated: {result['text']!r}")

            # Wait a bit for events to arrive
            await asyncio.sleep(0.5)
            collect_task.cancel()

            # Check results
            print(f"\n3. Events received: {len(events_received)}")

            glow_events = [e for e in events_received if e.get('type') == 'ATLAS_GLOW']
            attention_events = [e for e in events_received if e.get('type') == 'ATTENTION_UPDATE']
            thought_events = [e for e in events_received if e.get('type') == 'THOUGHT_PULSE']

            print(f"   ATLAS_GLOW events: {len(glow_events)}")
            print(f"   ATTENTION_UPDATE events: {len(attention_events)}")
            print(f"   THOUGHT_PULSE events: {len(thought_events)}")

            if glow_events:
                print(f"\n   Sample ATLAS_GLOW:")
                sample = glow_events[0]
                print(f"     indices count: {len(sample.get('indices', []))}")
                print(f"     intensity: {sample.get('intensity')}")

            print("\n" + "=" * 60)
            if glow_events:
                print("✅ SUCCESS: Atlas glow events are being emitted!")
            else:
                print("⚠️  No glow events received (may need investigation)")
            print("=" * 60)

    except Exception as e:
        print(f"\n❌ Error: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    asyncio.run(test_atlas_glow())
