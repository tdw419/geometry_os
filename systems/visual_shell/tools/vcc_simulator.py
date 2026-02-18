import time
import json
import random
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("VCC-Simulator")

class BuildSwarmSimulator:
    """
    Simulates the Infrastructure Evolution (Track 4)
    Generates 'Epochs' of build swarm state.
    """
    def __init__(self):
        self.epoch = 0
        self.latency_simulation = 0.01 # 10ms base latency

    def generate_epoch(self):
        self.epoch += 1
        # Randomly spike latency to test VCC back-pressure
        if random.random() > 0.9:
            latency = 0.15 # 150ms (above 100ms threshold)
        else:
            latency = self.latency_simulation

        state = {
            "epoch": self.epoch,
            "timestamp": time.time(),
            "workers": [
                {"worker_id": i, "is_busy": random.random() > 0.5, "isReady": True}
                for i in range(4)
            ]
        }
        
        time.sleep(latency)
        return state

    def run_simulation(self, iterations=10):
        logger.info(f"Starting VCC Simulation: {iterations} epochs")
        for _ in range(iterations):
            epoch_data = self.generate_epoch()
            # Simulation of sending over WebSocket/Bridge
            logger.info(f"[INFRASTRUCTURE] Emit Epoch {epoch_data['epoch']}")
            
            # Note: In a real system, we'd check for VCC_BACK_PRESSURE here
            if epoch_data['epoch'] % 5 == 0:
                logger.info("[SIMULATION] Spike detected. Simulating back-pressure response...")
                time.sleep(0.2)
        
        logger.info("Simulation complete.")

if __name__ == "__main__":
    sim = BuildSwarmSimulator()
    sim.run_simulation()
