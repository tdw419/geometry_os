import time
import asyncio
import threading
import logging
from unittest.mock import MagicMock
import sys
import os

# Add project root to path
sys.path.append(os.getcwd())

from evolution_daemon_v4 import EvolutionDaemonV4
from systems.swarm.telepathy_protocol import TelepathyNode

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [TEST] %(message)s')
logger = logging.getLogger("IntegrationTest")

class MockVectorOSAgent:
    def act_mutate_weights(self, *args, **kwargs):
        pass

class MockAestheticEngine:
    def evaluate_snapshot(self, *args):
        return 1.0, {} # Perfect score
    
    def generate_aesthetic_intent(self, *args):
        return None

def run_peer_node(stop_event, result_container):
    """Runs a separate TelepathyNode to act as a worker peer."""
    async def node_lifecycle():
        # Listen on 6001 (Main daemon is 6000)
        node = TelepathyNode(port=6001, capabilities=["compute", "pixel_rts"])
        node.node_id = "test_peer_01" # Force ID for predictable testing
        
        # Capture incoming signals
        def observer(signal):
            if signal.signal_type == "COMPUTE_OFFLOAD":
                logger.info(f"🧪 PEER RECEIVED TASK: {signal.payload}")
                result_container['received'] = True
                
        node.register_observer(observer)
        
        
        server_task = asyncio.create_task(node.start())
        
        # Give it a moment to initialize
        await asyncio.sleep(0.5)
        
        
        while not stop_event.is_set():
            await asyncio.sleep(0.1)
            
        server_task.cancel()
        
    asyncio.run(node_lifecycle())

def test_integration():
    logger.info("🧪 STARTING SWARM INTEGRATION TEST")
    
    # 1. Setup Peer
    stop_peer = threading.Event()
    results = {'received': False}
    peer_thread = threading.Thread(target=run_peer_node, args=(stop_peer, results))
    peer_thread.start()
    
    # Give peer time to start
    time.sleep(2)
    
    # 2. Setup Daemon
    logger.info("🧠 Initializing Evolution Daemon...")
    daemon = EvolutionDaemonV4()
    
    # Mock heavy components
    daemon.agent = MockVectorOSAgent()
    daemon.consciousness = MockAestheticEngine()
    daemon.vision_cortex = MagicMock() # Mock PixelRTS
    
    # Start Swarm Thread
    daemon._start_swarm_thread()
    time.sleep(2) # Allow daemon swarm to start
    
    # 3. Increase Pressure & Trigger Offload
    logger.info("🔥 Artificially increasing evolutionary pressure...")
    daemon.pressure_score = 10.0
    
    # Wait for discovery
    logger.info("⏳ Waiting for peer discovery...")
    time.sleep(3) 
    
    # FORCE RESONANCE (Simulate that we have exchanged minds)
    logger.info("💉 Injecting peer frame into Relativity Engine...")
    daemon.swarm.relativity.update_peer_frame("test_peer_01", daemon.swarm.local_embedding)
    
    logger.info("🚀 Attempting offload...")
    # Manually trigger the check (simulating the loop)
    daemon._attempt_swarm_offload()
    
    # 4. Verify
    timeout = 10
    start_wait = time.time()
    while time.time() - start_wait < timeout:
        if results['received']:
            logger.info("✅ SUCCESS: Peer received computation task!")
            break
        time.sleep(0.5)
        
    if not results['received']:
        logger.error("❌ FAILURE: Peer did not receive task.")
    
    # Cleanup
    stop_peer.set()
    peer_thread.join()
    # Daemon cleanup is harder since it spawns a daemon thread, but main exit will kill it.
    
    if results['received']:
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == "__main__":
    test_integration()
