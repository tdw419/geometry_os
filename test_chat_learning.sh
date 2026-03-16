#!/bin/bash

echo "Testing chat learning functionality..."

# Start the daemon in background
echo "Starting GPU daemon..."
cd /home/jericho/zion/projects/geometry_os/geometry_os
timeout 10s cargo run --release --bin gpu_dev_daemon &
DAEMON_PID=$!

# Wait for daemon to start
sleep 3

# Test chat endpoint
echo "Testing /chat endpoint..."
CHAT_RESPONSE=$(curl -s -X POST http://127.0.0.1:8769/chat -d "what's at memory address 0x1000?")
echo "Chat response: $CHAT_RESPONSE"

# Extract chat_id
CHAT_ID=$(echo "$CHAT_RESPONSE" | grep -o '"chat_id":"[^"]*' | cut -d'"' -f4)
echo "Extracted chat_id: $CHAT_ID"

if [ -n "$CHAT_ID" ]; then
    # Test rating endpoint with positive feedback
    echo "Testing /rate endpoint with positive feedback..."
    RATE_RESPONSE=$(curl -s -X POST http://127.0.0.1:8769/rate -d "{\"chat_id\":\"$CHAT_ID\",\"rating\":1}")
    echo "Rate response: $RATE_RESPONSE"
    
    # Test rating endpoint with negative feedback
    echo "Testing /rate endpoint with negative feedback..."
    CHAT_RESPONSE2=$(curl -s -X POST http://127.0.0.1:8769/chat -d "tell me about glyphs")
    CHAT_ID2=$(echo "$CHAT_RESPONSE2" | grep -o '"chat_id":"[^"]*' | cut -d'"' -f4)
    RATE_RESPONSE2=$(curl -s -X POST http://127.0.0.1:8769/rate -d "{\"chat_id\":\"$CHAT_ID2\",\"rating\":-1}")
    echo "Negative rate response: $RATE_RESPONSE2"
else
    echo "Failed to get chat_id from response"
fi

# Kill daemon
kill $DAEMON_PID 2>/dev/null
wait $DAEMON_PID 2>/dev/null

echo "Test completed."