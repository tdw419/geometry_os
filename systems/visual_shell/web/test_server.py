#!/usr/bin/env python3
"""
Test script for Geometry OS Mock Server.
Tests HTTP API and WebSocket functionality.
"""

import json
import asyncio
import aiohttp
import websockets
from io import BytesIO
from PIL import Image


async def test_http_api():
    """Test HTTP API endpoints."""
    print("\n" + "=" * 60)
    print("Testing HTTP API")
    print("=" * 60)
    
    base_url = "http://127.0.0.1:8000"
    
    async with aiohttp.ClientSession() as session:
        # Test health check
        print("\n1. Testing health check...")
        async with session.get(f"{base_url}/health") as resp:
            data = await resp.json()
            print(f"   Status: {data.get('status')}")
            assert data.get('status') == 'ok', "Health check failed"
            print("   ✅ Health check passed")
        
        # Test chunk API
        print("\n2. Testing chunk API...")
        async with session.get(f"{base_url}/api/chunk?x=512&y=512&size=16") as resp:
            data = await resp.json()
            print(f"   Chunk: ({data.get('chunkX')}, {data.get('chunkY')})")
            print(f"   Tiles: {len(data.get('tiles', {}))}")
            assert data.get('chunkX') == 512, "Chunk X mismatch"
            assert data.get('chunkY') == 512, "Chunk Y mismatch"
            assert len(data.get('tiles', {})) > 0, "No tiles returned"
            print("   ✅ Chunk API passed")
        
        # Test texture API
        print("\n3. Testing texture API...")
        brick_types = ['system_core', 'data_block', 'neural_link']
        for brick_type in brick_types:
            async with session.get(f"{base_url}/builder/queue/{brick_type}") as resp:
                assert resp.status == 200, f"Texture request failed for {brick_type}"
                data = await resp.read()
                img = Image.open(BytesIO(data))
                print(f"   {brick_type}: {img.size[0]}x{img.size[1]}px")
        print("   ✅ Texture API passed")


async def test_websocket():
    """Test WebSocket functionality."""
    print("\n" + "=" * 60)
    print("Testing WebSocket")
    print("=" * 60)
    
    uri = "ws://127.0.0.1:8765"
    
    async with websockets.connect(uri) as websocket:
        print("\n1. Connected to WebSocket")
        print(f"   URI: {uri}")
        
        # Test heartbeat
        print("\n2. Testing heartbeat...")
        await websocket.send(json.dumps({
            "type": "heartbeat",
            "timestamp": 1234567890
        }))
        response = await websocket.recv()
        data = json.loads(response)
        assert data.get('type') == 'heartbeat', "Heartbeat response invalid"
        print(f"   ✅ Heartbeat received")
        
        # Test camera update
        print("\n3. Testing camera update...")
        await websocket.send(json.dumps({
            "type": "camera_update",
            "x": 819200,
            "y": 819200,
            "zoom": 0.5,
            "timestamp": 1234567890
        }))
        print(f"   ✅ Camera update sent")
        
        print("\n4. Waiting for messages...")
        try:
            # Wait for any incoming messages
            for i in range(3):
                try:
                    message = await asyncio.wait_for(websocket.recv(), timeout=1.0)
                    data = json.loads(message)
                    print(f"   Received: {data.get('type')}")
                except asyncio.TimeoutError:
                    break
        except Exception as e:
            print(f"   Note: {e}")
        
        print("   ✅ WebSocket test passed")


async def main():
    """Run all tests."""
    print("\n" + "=" * 60)
    print("Geometry OS Mock Server Test Suite")
    print("=" * 60)
    print("\nMake sure the mock server is running:")
    print("  python3 mock_server.py")
    print("\nPress Enter to continue or Ctrl+C to cancel...")
    
    try:
        await asyncio.get_event_loop().run_in_executor(None, input)
    except KeyboardInterrupt:
        print("\n\nTest cancelled.")
        return
    
    try:
        # Test HTTP API
        await test_http_api()
        
        # Test WebSocket
        await test_websocket()
        
        print("\n" + "=" * 60)
        print("✅ All tests passed!")
        print("=" * 60)
        print("\nThe mock server is ready to use.")
        print("Open http://localhost:8000/index.html in your browser.")
        
    except aiohttp.ClientConnectorError:
        print("\n❌ Error: Could not connect to mock server.")
        print("Make sure the mock server is running:")
        print("  python3 mock_server.py")
    except AssertionError as e:
        print(f"\n❌ Test failed: {e}")
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()


if __name__ == '__main__':
    asyncio.run(main())
