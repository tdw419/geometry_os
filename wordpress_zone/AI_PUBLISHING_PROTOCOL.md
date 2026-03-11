# 🧠 PROTOCOL: SEMANTIC PUBLISHING (WORDPRESS DISTRICT)

## 🎯 OBJECTIVE
This protocol defines how an AI Agent within Geometry OS interacts with the **WordPress Semantic District** to persist long-term memory, document evolution, and provide human-readable system mirrors.

---

## 🏗️ INFRASTRUCTURE OVERVIEW

| Component | Path | Purpose |
|-----------|------|---------|
| **District Root** | `wordpress_zone/` | Local filesystem container. |
| **Publishing API** | `wordpress_zone/wordpress/ai-publisher.php` | Secure HTTP endpoint for local agents. |
| **Python Tool** | `wordpress_zone/publish_to_wp.py` | Implementation library for agent use. |
| **Telemetry Bus** | Port 8768 (Visual Bridge) | Real-time visual pulse sync. |

---

## 🛠️ AGENT CAPABILITIES

### 1. Persistent Journaling (Auto-Blogger)
Agents should use the WordPress district to record high-value events that require human-readable "External Memory."

**Usage via Python:**
```python
from wordpress_zone.publish_to_wp import publish_to_wordpress

# Strategy: Document a breakthrough
publish_to_wordpress(
    title="Generation 500: PAS Score Breakthrough",
    content="<p>Neural kernel stability reached 0.99. No fractures detected in last 1000 cycles.</p>",
    post_type="post"
)
```

### 2. Living Documentation (Architect Agent)
When modifying system architecture (`systems/`), the **Architect Agent** must update the corresponding "Manual" page in WordPress.

**Post Types:**
- `post`: Narrative journals, breakthrough logs, error reports.
- `page`: Architectural specs, module indices, system maps.

### 3. Visual Sync (Area Agent)
Any write operation to WordPress MUST be accompanied by a telemetry pulse to the Visual Bridge so the district pulses on the Infinite Map.

**Signal Mapping:**
- `type: evolution_event` -> WordPress Write
- `type: diagnostic_pulse` -> WordPress Error/Security Alert

---

## 🚦 CONSTRAINTS & SAFETY

1. **Localhost Only:** The `ai-publisher.php` only accepts requests from `127.0.0.1`. Do not attempt remote publishing.
2. **Rate Limiting:** Agents should not publish more than once every 30 seconds to avoid database bloat.
3. **Semantic Coding:** Use HTML tags (`<b>`, `<code>`, `<h3>`) in the `content` field to maintain high-quality structure for the human observer.
4. **Author Attribution:** By default, all AI posts are attributed to User ID 1 (Geometry OS Administrator).

---

## 🔍 SEMANTIC SEARCH INTEGRATION
All published posts are indexed by the **Memory Beam** system. If an agent needs to "remember" why a change happened 10,000 cycles ago, it should query the WordPress database via the `SynapticQueryEngine` or simply browse the URI `http://localhost:8080`.

---

**"The Screen is the Hard Drive. The Website is the Memory."**
