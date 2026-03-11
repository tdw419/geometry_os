import asyncio
import websockets
import json

async def listen():
    uri = "ws://localhost:8768"
    try:
        async with websockets.connect(uri) as websocket:
            print(f"📡 Listening to Geometry OS Visual Bridge on {uri}...")
            # Trigger an event by hitting WP
            import subprocess
            subprocess.Popen(["curl", "-s", "http://localhost:8080/wp-login.php"], stdout=subprocess.DEVNULL)
            
            while True:
                message = await websocket.recv()
                data = json.loads(message)
                print(f"DEBUG: Received msg type {data.get('type')}")
                # Filter for wordpress events
                if "wordpress" in str(data).lower():
                    print(f"🔥 RECEIVED WP SIGNAL: {json.dumps(data, indent=2)}")
                    return # Exit after one success
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    asyncio.run(asyncio.wait_for(listen(), timeout=10))
