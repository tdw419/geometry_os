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


def generate_skill_html(skill_name, description, category, markdown_body, file_path):
    """Generate HTML content for a skill entry.

    Args:
        skill_name: Name of the skill
        description: Skill description from frontmatter
        category: Skill category (e.g., 'testing', 'debugging')
        markdown_body: Markdown content to convert to HTML
        file_path: Source file path for attribution

    Returns:
        Tuple of (wp_title, wp_content) strings
    """
    html_body = markdown.markdown(markdown_body, extensions=['extra', 'codehilite'])

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
    return wp_title, wp_content


def build_skill_payload(skill_name, file_path, wp_content):
    """Build the WordPress API payload for a skill.

    Args:
        skill_name: Name of the skill
        file_path: Source file path
        wp_content: HTML content for the skill

    Returns:
        Dict payload for updateArchitecture action
    """
    return {
        "action": "updateArchitecture",
        "component": f"Skill: {skill_name}",
        "path": file_path,
        "description": wp_content,
        "status": "publish"
    }


def group_skills_by_category(skills):
    """Group skills by their category.

    Args:
        skills: List of skill dicts with 'name' and 'path' keys

    Returns:
        Dict mapping category names to lists of skills
    """
    by_category = {}
    for skill in skills:
        meta, _ = parse_skill_file(skill['path'])
        cat = meta.get('category', 'general') if meta else 'general'
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append(skill)
    return by_category


def generate_index_html(skills):
    """Generate HTML for the skills index page.

    Args:
        skills: List of skill dicts with 'name' and 'path' keys

    Returns:
        Tuple of (title, content) strings
    """
    title = "System Skills Directory"
    by_category = group_skills_by_category(skills)

    content = "<h2>Available AI Skills</h2>"
    content += "<p>Skills are procedural workflows for common Geometry OS tasks.</p>"

    for category in sorted(by_category.keys()):
        content += f"<h3>{category.title()}</h3><ul>"
        for skill in sorted(by_category[category], key=lambda x: x['name']):
            content += f'<li><b>{skill["name"]}</b> - <code>{skill["path"]}</code></li>'
        content += "</ul>"

    return title, content


def build_index_payload(title, content):
    """Build the WordPress API payload for the index page.

    Args:
        title: Page title
        content: HTML content

    Returns:
        Dict payload for updateArchitecture action
    """
    return {
        "action": "updateArchitecture",
        "component": title,
        "path": ".gemini/skills/",
        "description": content,
        "status": "publish"
    }


def sync_skills(publisher_url=None):
    """Scan and sync all skills to WordPress.

    Args:
        publisher_url: Optional custom URL for WordPress publisher endpoint.
                      If None, uses WP_PUBLISHER_URL global.
    """
    url = publisher_url or WP_PUBLISHER_URL
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

        # Generate HTML using extracted function
        wp_title, wp_content = generate_skill_html(
            skill_name, description, category, markdown_body, file_path
        )

        # Build payload using extracted function
        payload = build_skill_payload(skill_name, file_path, wp_content)

        try:
            response = requests.post(url, json=payload, timeout=10)
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
        create_index_page(synced_skills, url)


def create_index_page(skills, publisher_url=None):
    """Create a central index page grouped by category.

    Args:
        skills: List of skill dicts with 'name' and 'path' keys
        publisher_url: Optional custom URL for WordPress publisher endpoint.
    """
    url = publisher_url or WP_PUBLISHER_URL
    title, content = generate_index_html(skills)
    payload = build_index_payload(title, content)

    try:
        requests.post(url, json=payload, timeout=10)
        print("Skills Directory updated.")
    except:
        print("Warning: Failed to update Skills Directory index.")


if __name__ == "__main__":
    sync_skills()
