import requests
import json
import sys
import os

# Geometry OS WordPress Auto-Blogger Tool
# ---------------------------------------
# This script allows any AI agent to publish updates directly to the 
# WordPress semantic district.

def publish_to_wordpress(title, content, post_type='post'):
    """
    Publish a post to the local WordPress instance.
    """
    url = "http://localhost:8080/ai-publisher.php"
    payload = {
        "title": title,
        "content": content,
        "type": post_type
    }
    
    try:
        response = requests.post(url, json=payload, timeout=5)
        if response.status_code == 200:
            result = response.json()
            print(f"✅ Post published successfully!")
            print(f"🔗 URL: {result.get('url')}")
            print(f"🆔 ID: {result.get('post_id')}")
            return result
        else:
            print(f"❌ Failed to publish: {response.status_code}")
            print(response.text)
            return None
    except Exception as e:
        print(f"❌ Connection error: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 publish_to_wp.py 'Title' 'Content'")
        # Demo post if no args
        title = "System Awareness Initialized"
        content = "The Architect Prime has successfully established a link between the Neural Substrate and the WordPress District."
    else:
        title = sys.argv[1]
        content = sys.argv[2]
    
    publish_to_wordpress(title, content)
