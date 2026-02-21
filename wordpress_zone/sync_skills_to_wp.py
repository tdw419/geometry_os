import os
import yaml
import markdown
import requests
import glob
from publish_to_wp import publish_to_wordpress

# Geometry OS: Skills Sync Tool
# -----------------------------
# This script synchronizes markdown-based skills from the repository 
# to the WordPress semantic district for human documentation.

# Get the repository root directory
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SKILLS_DIR = os.path.join(REPO_ROOT, ".gemini/skills")
WP_PUBLISHER_URL = "http://localhost:8080/ai-publisher.php"

def parse_skill_file(file_path):
    """Parse a SKILL.md file, extracting metadata and content."""
    with open(file_path, 'r') as f:
        content = f.read()

    # Check for YAML frontmatter
    if content.startswith('---'):
        parts = content.split('---', 2)
        if len(parts) >= 3:
            try:
                metadata = yaml.safe_load(parts[1])
                markdown_body = parts[2].strip()
                # Ensure category exists
                if metadata is None:
                    metadata = {}
                if 'category' not in metadata:
                    metadata['category'] = 'general'
                return metadata, markdown_body
            except yaml.YAMLError as e:
                print(f"Warning: Error parsing YAML in {file_path}: {e}")

    return {'category': 'general'}, content.strip()

def sync_skills():
    """Scan and sync all skills to WordPress."""
    skill_files = glob.glob(os.path.join(SKILLS_DIR, "**/SKILL.md"), recursive=True)
    
    if not skill_files:
        print("📭 No skills found to sync.")
        return

    print(f"🔄 Syncing {len(skill_files)} skills to WordPress...")
    
    synced_skills = []

    for file_path in skill_files:
        metadata, markdown_body = parse_skill_file(file_path)
        
        # Determine skill name and description
        skill_name = metadata.get('name') if metadata else None
        if not skill_name:
            # Fallback to directory name
            skill_name = os.path.basename(os.path.dirname(file_path))
        
        description = metadata.get('description', '') if metadata else ''
        category = metadata.get('category', 'general') if metadata else 'general'

        # Convert Markdown to HTML
        html_body = markdown.markdown(markdown_body, extensions=['extra', 'codehilite'])

        # Prepare content for WordPress
        wp_title = f"Skill: {skill_name}"
        wp_content = f"""
<div class="skill-entry" data-category="{category}">
    <div class="skill-meta">
        <span class="skill-category badge">{category}</span>
        <p class="skill-description"><em>{description}</em></p>
    </div>
    <hr>
    <div class="skill-content">
        {html_body}
    </div>
    <footer>
        <small>Source: <code>{file_path}</code></small>
    </footer>
</div>
"""
        
        # Use updateArchitecture action to ensure it updates existing pages
        payload = {
            "action": "updateArchitecture",
            "component": f"Skill: {skill_name}",
            "path": file_path,
            "description": wp_content,
            "status": "publish"
        }
        
        try:
            response = requests.post(WP_PUBLISHER_URL, json=payload, timeout=10)
            if response.status_code == 200:
                print(f"✅ Synced: {skill_name}")
                synced_skills.append({"name": skill_name, "path": file_path})
            else:
                print(f"❌ Failed to sync {skill_name}: {response.status_code}")
                print(response.text)
        except Exception as e:
            print(f"❌ Connection error syncing {skill_name}: {e}")

    # Create/Update Index Page
    if synced_skills:
        create_index_page(synced_skills)

def create_index_page(skills):
    """Create a central index page grouped by category."""
    title = "System Skills Directory"

    # Group by category
    by_category = {}
    for skill in skills:
        meta, _ = parse_skill_file(skill['path'])
        cat = meta.get('category', 'general') if meta else 'general'
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append(skill)

    content = "<h2>Available AI Skills</h2>"
    content += "<p>Skills are procedural workflows for common Geometry OS tasks.</p>"

    for category in sorted(by_category.keys()):
        content += f"<h3>{category.title()}</h3><ul>"
        for skill in sorted(by_category[category], key=lambda x: x['name']):
            content += f'<li><b>{skill["name"]}</b> - <code>{skill["path"]}</code></li>'
        content += "</ul>"

    payload = {
        "action": "updateArchitecture",
        "component": title,
        "path": ".gemini/skills/",
        "description": content,
        "status": "publish"
    }

    try:
        requests.post(WP_PUBLISHER_URL, json=payload, timeout=10)
        print("Skills Directory updated.")
    except:
        print("Warning: Failed to update Skills Directory index.")

if __name__ == "__main__":
    sync_skills()
