
import socket
import json
import sys

def test_daemon():
    host = 'localhost'
    port = 1338
    
    try:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect((host, port))
        print(f"Connected to {host}:{port}")
        
        # Receive welcome message
        welcome = client.recv(4096).decode('utf-8')
        print(f"Welcome: {welcome[:50]}...")

        # Send a chat command
        command = {
            "type": "chat",
            "content": "Hello Ghost, are you running on vectors?"
        }
        
        client.send(json.dumps(command).encode('utf-8'))
        
        # Receive response
        response = client.recv(4096).decode('utf-8')
        print(f"Response: {response}")
        
        client.close()
        
    except Exception as e:
        print(f"Failed: {e}")

if __name__ == "__main__":
    test_daemon()
