# Geometry OS LLM Router

A WordPress plugin that provides a management dashboard for the hybrid LLM proxy service, featuring health monitoring, token usage tracking, and analytics.

## Features

- **Proxy Health Monitoring** - Real-time status of the hybrid LLM proxy (port 4000)
- **API Status Tracking** - Claude API and LM Studio connection status
- **Fallback Event Logging** - Track when requests fall back to local models
- **Token Usage Analytics** - Detailed charts and statistics on token consumption
- **Model Selection UI** - Configure primary and fallback models
- **Auto-Refresh Dashboard** - 30-second auto-refresh status updates

## Installation

1. Upload the `geometry-os-llm-router` folder to `/wp-content/plugins/`
2. Activate the plugin through the WordPress admin "Plugins" menu
3. Access via **Geometry OS > LLM Router** in the admin menu

## Database Table

The plugin creates a custom table `wp_geometry_os_llm_usage` with the following structure:

| Column | Type | Description |
|--------|------|-------------|
| id | BIGINT | Auto-increment primary key |
| timestamp | DATETIME | Request timestamp |
| model | VARCHAR(100) | Model identifier |
| tokens_prompt | INT | Prompt tokens used |
| tokens_completion | INT | Completion tokens used |
| tokens_total | INT | Total tokens used |
| source_worktree | VARCHAR(100) | Source worktree (optional) |
| task_type | VARCHAR(50) | Task type (optional) |
| fallback_triggered | TINYINT(1) | Whether fallback was triggered |

## Pages

### LLM Router Dashboard
- Proxy service status (online/offline)
- Claude API connection status
- Local fallback availability
- Fallback event counters (today/week)
- Token usage gauge (current hour)

### Analytics
- Total requests and tokens
- Fallback rate percentage
- Hourly token usage chart
- Model distribution pie chart
- Model usage breakdown table
- Recent fallback events

### Settings
- Proxy port configuration
- Primary model selection
- Fallback model selection
- Enable/disable automatic fallback

## AJAX Actions

- `geometry_os_router_status` - Get current router status
- `geometry_os_router_analytics` - Get analytics data for a period
- `geometry_os_router_models` - Get available models
- `geometry_os_router_set_model` - Set active model

## Usage from Python

To log token usage from the Python proxy:

```python
import requests

def log_token_usage(data):
    wp_url = "https://your-wordpress.com/wp-admin/admin-ajax.php"
    payload = {
        'action': 'geometry_os_llm_log_usage',  # Custom action handler needed
        'model': data['model'],
        'tokens_prompt': data['prompt_tokens'],
        'tokens_completion': data['completion_tokens'],
        'fallback_triggered': data.get('fallback', False),
    }
    requests.post(wp_url, data=payload)
```

## Requirements

- WordPress 5.0+
- PHP 7.4+
- MySQL 5.6+

## License

MIT

## Changelog

### 1.0.0
- Initial release
- Proxy health monitoring
- Token usage tracking
- Fallback event logging
- Analytics dashboard
