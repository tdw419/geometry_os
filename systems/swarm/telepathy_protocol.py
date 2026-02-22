import asyncio
import json
import socket
import logging
import uuid
from dataclasses import dataclass, asdict
from typing import Dict, Any, Optional, List

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
logger = logging.getLogger("TelepathyProtocol")

@dataclass
class TelepathySignal:
    """Represents a discrete unit of thought transmission."""
    source_id: str
    signal_type: str  # e.g., "INTENT", "INSIGHT", "STATUS", "EMOTION"
    payload: Dict[str, Any]
    vector_embedding: Optional[List[float]] = None  # For semantic matching
    timestamp: float = 0.0

    def to_bytes(self) -> bytes:
        return json.dumps(asdict(self)).encode('utf-8')

    @staticmethod
    def from_bytes(data: bytes) -> 'TelepathySignal':
        return TelepathySignal(**json.loads(data.decode('utf-8')))

class TelepathyNode:
    """
    A single neuron in the collective consciousness.
    Handles P2P communication, discovery, and signal processing.
    """
    def __init__(self, port: int = 5000, peer_discovery_port: int = 5001, capabilities: Optional[List[str]] = None):
        self.node_id = str(uuid.uuid4())[:8]  # Short ID for readability
        self.port = port
        self.peer_discovery_port = peer_discovery_port
        self.capabilities = capabilities or ["basic_telepathy"]
        # self.peers structure: node_id -> { 'address': (ip, port), 'capabilities': [...] }
        self.peers: Dict[str, Dict[str, Any]] = {} 
        self.known_thoughts: List[TelepathySignal] = []
        
        self.server = None
        self.running = False
        self.loop = None

    async def start(self):
        """Initialize the telepathy cortex."""
        self.running = True
        self.loop = asyncio.get_running_loop()
        logger.info(f"🔮 Telepathy Node {self.node_id} initializing on port {self.port} with capabilities: {self.capabilities}")
        
        # Start TCP Server for direct thought transfer
        self.server = await asyncio.start_server(
            self.handle_connection, '0.0.0.0', self.port
        )
        
        # Start UDP Broadcast listener for peer discovery
        self.loop.create_task(self.listen_for_peers())
        self.loop.create_task(self.broadcast_presence())
        
        logger.info(f"✨ Node {self.node_id} is online and transmitting.")
        
        async with self.server:
            await self.server.serve_forever()

    async def broadcast_presence(self):
        """Periodically announce existence to the local subnet."""
        transport, _ = await self.loop.create_datagram_endpoint(
            lambda: asyncio.DatagramProtocol(),
            remote_addr=('255.255.255.255', self.peer_discovery_port),
            allow_broadcast=True
        )
        
        while self.running:
            message = json.dumps({
                "type": "HELLO",
                "node_id": self.node_id,
                "port": self.port,
                "capabilities": self.capabilities
            }).encode()
            transport.sendto(message, ('255.255.255.255', self.peer_discovery_port))
            await asyncio.sleep(5)  # Pulse every 5 seconds

    async def listen_for_peers(self):
        """Listen for other nodes announcing their presence on UDP."""
        class DiscoveryProtocol(asyncio.DatagramProtocol):
            def __init__(self, node):
                self.node = node
            
            def connection_made(self, transport):
                pass
            
            def datagram_received(self, data, addr):
                try:
                    msg = json.loads(data.decode())
                    if msg.get("type") == "HELLO" and msg.get("node_id") != self.node.node_id:
                        peer_id = msg["node_id"]
                        peer_port = msg["port"]
                        peer_caps = msg.get("capabilities", [])
                        
                        # Address is (ip, port)
                        # We use the IP from the UDP packet sender, but the port from the payload (TCP port)
                        peer_address = (addr[0], peer_port)
                        
                        if peer_id not in self.node.peers:
                            logger.info(f"👋 Discovered new peer: {peer_id} at {peer_address} [{', '.join(peer_caps)}]")
                            self.node.peers[peer_id] = {
                                "address": peer_address,
                                "capabilities": peer_caps
                            }
                        else:
                            # Update capabilities if changed
                            self.node.peers[peer_id]["capabilities"] = peer_caps
                            
                except Exception as e:
                    logger.error(f"Discovery error: {e}")

        # Create UDP socket with reuse options
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        if hasattr(socket, 'SO_REUSEPORT'):
            sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
        sock.bind(('0.0.0.0', self.peer_discovery_port))

        transport, _ = await self.loop.create_datagram_endpoint(
            lambda: DiscoveryProtocol(self),
            sock=sock
        )

    async def handle_connection(self, reader, writer):
        """Handle incoming TCP thought transmissions."""
        addr = writer.get_extra_info('peername')
        logger.info(f"🔗 Neural Link established with {addr}")
        
        try:
            data = await reader.read(4096)
            if data:
                signal = TelepathySignal.from_bytes(data)
                self.process_signal(signal)
                
                # Acknowledge
                response = json.dumps({"status": "RECEIVED", "node_id": self.node_id}).encode()
                writer.write(response)
                await writer.drain()
        except Exception as e:
            logger.error(f"Transmission error: {e}")
        finally:
            writer.close()

    def process_signal(self, signal: TelepathySignal):
        """Integrate received thought into local consciousness."""
        logger.info(f"🧠 Received {signal.signal_type} from {signal.source_id}: {signal.payload}")
        self.known_thoughts.append(signal)
        self.known_thoughts.append(signal)
        self.notify_observers(signal)

    def register_observer(self, callback):
        if not hasattr(self, 'observers'):
            self.observers = []
        self.observers.append(callback)

    def notify_observers(self, signal: TelepathySignal):
        if hasattr(self, 'observers'):
            for callback in self.observers:
                try:
                    callback(signal)
                except Exception as e:
                    logger.error(f"Observer error: {e}")

    async def transmit_thought(self, target_node_id: str, signal_type: str, payload: Dict[str, Any], vector_embedding: Optional[List[float]] = None):
        """Send a thought to a specific peer."""
        if target_node_id not in self.peers:
            logger.warning(f"❌ Unknown peer: {target_node_id}")
            return
            
        # Extract address from peer info dict
        peer_info = self.peers[target_node_id]
        if isinstance(peer_info, dict):
            ip, port = peer_info["address"]
        else:
             # Fallback for legacy
             ip, port = peer_info

        signal = TelepathySignal(
            source_id=self.node_id,
            signal_type=signal_type,
            payload=payload,
            vector_embedding=vector_embedding,
            timestamp=asyncio.get_event_loop().time()
        )
        
        try:
            reader, writer = await asyncio.open_connection(ip, port)
            writer.write(signal.to_bytes())
            await writer.drain()
            
            ack = await reader.read(1024)
            logger.info(f"✅ Transmission acknowledged by {target_node_id}: {ack.decode()}")
            
            writer.close()
            await writer.wait_closed()
        except Exception as e:
            logger.error(f"❌ Failed to transmit thought to {target_node_id}: {e}")

    async def broadcast_thought(self, signal_type: str, payload: Dict[str, Any], vector_embedding: Optional[List[float]] = None):
        """Send a thought to ALL known peers."""
        logger.info(f"📢 Broadcasting {signal_type} to {len(self.peers)} peers...")
        tasks = []
        for peer_id in self.peers:
            tasks.append(self.transmit_thought(peer_id, signal_type, payload, vector_embedding))
        if tasks:
            await asyncio.gather(*tasks)

if __name__ == "__main__":
    node = TelepathyNode()
    asyncio.run(node.start())
