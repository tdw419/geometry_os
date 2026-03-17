#!/bin/bash
# train_brain.sh - Train PixelBrain on text data
#
# Usage:
#   ./train_brain.sh                    # Train on sample text
#   ./train_brain.sh my_data.txt 500    # Train on file, 500 epochs
#
# The brain learns via Hebbian updates:
#   Δw = η × pre × post × reward
#   Reward: +1 for correct prediction, -0.1 for incorrect

DAEMON_URL="${DAEMON_URL:-http://localhost:9889}"
EPOCHS="${2:-100}"
LEARNING_RATE="${LEARNING_RATE:-0.01}"

# Sample training data if no file provided
if [ -z "$1" ]; then
    TRAINING_TEXT="hello world
the quick brown fox jumps over the lazy dog
geometry os is a visual operating system
neural networks learn from data
pixels are the fundamental unit of display
learning happens through practice and repetition
the brain adapts to new information
training improves model accuracy
hello world hello world hello world
a b c d e f g h i j k l m n o p q r s t u v w x y z"
else
    TRAINING_TEXT=$(cat "$1")
fi

echo "=== PixelBrain Training ==="
echo "URL: $DAEMON_URL"
echo "Epochs: $EPOCHS"
echo "Learning rate: $LEARNING_RATE"
echo "Text length: ${#TRAINING_TEXT} chars"
echo ""

# Train the brain
echo "Training..."
RESPONSE=$(curl -s -X POST "$DAEMON_URL/train" \
    -H "Content-Type: application/json" \
    -d "$(jq -Rs --argjson epochs "$EPOCHS" --argjson lr "$LEARNING_RATE" \
        '{text: ., epochs: $epochs, learning_rate: $lr}' <<< "$TRAINING_TEXT")")

echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"
echo ""

# Test inference after training
echo "=== Testing Inference ==="
for prompt in "hello" "the" "geometry" "learning"; do
    echo -n "Prompt '$prompt' → "
    curl -s -X POST "$DAEMON_URL/infer" \
        -H "Content-Type: application/json" \
        -d "{\"prompt\": \"$prompt\", \"max_tokens\": 5, \"temperature\": 0.0}" | \
        jq -r '.output_text // .output_tokens // .' 2>/dev/null || echo "(error)"
done

echo ""
echo "=== Training Complete ==="
