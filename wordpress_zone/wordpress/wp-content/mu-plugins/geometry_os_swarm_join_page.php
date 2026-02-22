<?php
/**
 * Plugin Name: Geometry OS Swarm Join Page
 * Description: Provides a "Clone & Join Swarm" page for visitors
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_SwarmJoinPage {

    public function __construct() {
        // Register REST endpoint for join requests
        add_action('rest_api_init', [$this, 'register_routes']);

        // Add shortcode for join button
        add_shortcode('geoos_join_swarm', [$this, 'render_join_button']);

        // Add admin page for managing join requests
        add_action('admin_menu', [$this, 'add_admin_menu']);
    }

    public function register_routes(): void {
        // Endpoint for remote nodes to request to join
        register_rest_route('geoos/v1', '/swarm/join-request', [
            'methods' => 'POST',
            'callback' => [$this, 'handle_join_request'],
            'permission_callback' => '__return_true'
        ]);

        // Endpoint to get installation script
        register_rest_route('geoos/v1', '/swarm/install-script', [
            'methods' => 'GET',
            'callback' => [$this, 'get_install_script'],
            'permission_callback' => '__return_true'
        ]);

        // AI-assisted install page
        register_rest_route('geoos/v1', '/swarm/ai-install', [
            'methods' => 'GET',
            'callback' => [$this, 'render_ai_install_page'],
            'permission_callback' => '__return_true'
        ]);

        // Endpoint to trigger remote AI assistant
        register_rest_route('geoos/v1', '/swarm/trigger-ai', [
            'methods' => 'POST',
            'callback' => [$this, 'trigger_remote_ai'],
            'permission_callback' => '__return_true'
        ]);

        // Direct HTML page for joining
        register_rest_route('geoos/v1', '/swarm/join-page', [
            'methods' => 'GET',
            'callback' => [$this, 'render_join_page'],
            'permission_callback' => '__return_true'
        ]);
    }

    /**
     * Render the join button shortcode
     */
    public function render_join_button($atts = []): string {
        $atts = shortcode_atts([
            'text' => 'Clone & Join Swarm',
            'style' => 'primary'
        ], $atts);

        $api_url = rest_url('geoos/v1/swarm/info');
        $join_url = rest_url('geoos/v1/swarm/join-request');
        $script_url = rest_url('geoos/v1/swarm/install-script');

        ob_start();
        ?>
        <div class="geoos-join-swarm" style="margin: 20px 0; padding: 20px; background: #f0f0f1; border-radius: 8px;">
            <h3>🐝 Join the Geometry OS Swarm</h3>
            <p>Clone the project and connect your WordPress to our distributed AI network.</p>

            <div style="margin: 15px 0;">
                <button id="geoos-show-instructions" class="button button-primary button-large">
                    <?php echo esc_html($atts['text']); ?>
                </button>
            </div>

            <div id="geoos-instructions" style="display: none; margin-top: 20px; padding: 15px; background: #fff; border-radius: 4px;">
                <h4>📋 Quick Install Script</h4>
                <p>Run this on your server:</p>
                <pre style="background: #23282d; color: #f0f0f1; padding: 15px; border-radius: 4px; overflow-x: auto; font-size: 12px;">curl -s "<?php echo esc_url($script_url); ?>" | bash</pre>

                <h4 style="margin-top: 15px;">🤖 AI-Assisted Install</h4>
                <p>Or use your local AI assistant (Claude CLI, Gemini CLI, etc.):</p>
                <pre style="background: #23282d; color: #f0f0f1; padding: 15px; border-radius: 4px; overflow-x: auto; font-size: 12px;"># For Claude CLI:
claude "Clone and set up Geometry OS from <?php echo esc_url(site_url()); ?> and join the swarm"

# For Gemini CLI:
gemini "Clone and set up Geometry OS from <?php echo esc_url(site_url()); ?> and join the swarm"</pre>

                <h4 style="margin-top: 15px;">🔗 Manual Configuration</h4>
                <p>Add this to your <code>remote_nodes.json</code>:</p>
                <pre style="background: #23282d; color: #f0f0f1; padding: 15px; border-radius: 4px; overflow-x: auto; font-size: 12px;">{
  "node_id": "<?php echo esc_attr('node-' . preg_replace('/[^a-z0-9]/', '', strtolower(parse_url(site_url(), PHP_URL_HOST)))); ?>",
  "url": "<?php echo esc_url(site_url()); ?>",
  "api_url": "<?php echo esc_url(rest_url('geoos/v1')); ?>",
  "enabled": true
}</pre>

                <h4 style="margin-top: 15px;">📥 Clone Repository</h4>
                <pre style="background: #23282d; color: #f0f0f1; padding: 15px; border-radius: 4px; overflow-x: auto; font-size: 12px;">git clone https://github.com/tdw419/geometry_os.git
cd geometry_os/geometry_os</pre>

                <div style="margin-top: 15px;">
                    <button id="geoos-send-join-request" class="button button-secondary">
                        🚀 Notify Swarm of My Join
                    </button>
                    <span id="geoos-join-status"></span>
                </div>
            </div>
        </div>

        <script>
        document.getElementById('geoos-show-instructions').addEventListener('click', function() {
            var div = document.getElementById('geoos-instructions');
            div.style.display = div.style.display === 'none' ? 'block' : 'none';
        });

        document.getElementById('geoos-send-join-request').addEventListener('click', function() {
            var btn = this;
            var status = document.getElementById('geoos-join-status');
            btn.disabled = true;
            status.textContent = ' Sending...';

            var data = {
                remote_url: window.location.origin,
                remote_name: '<?php echo esc_attr(get_bloginfo('name')); ?>'
            };

            fetch('<?php echo esc_url($join_url); ?>', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
            })
            .then(r => r.json())
            .then(resp => {
                status.textContent = resp.success ? ' ✅ Join request sent!' : ' ❌ ' + (resp.error || 'Failed');
                btn.disabled = false;
            })
            .catch(e => {
                status.textContent = ' ❌ Error: ' + e.message;
                btn.disabled = false;
            });
        });
        </script>
        <?php
        return ob_get_clean();
    }

    /**
     * Handle join request from remote node
     */
    public function handle_join_request($request): array {
        $remote_url = $request->get_param('remote_url');
        $remote_name = $request->get_param('remote_name') ?: 'remote-node';

        if (!$remote_url) {
            return ['success' => false, 'error' => 'remote_url required'];
        }

        // Generate node ID from URL
        $node_id = 'wp-joined-' . preg_replace('/[^a-z0-9]/', '-', strtolower(parse_url($remote_url, PHP_URL_HOST) ?: 'unknown'));

        // Store join request as an option (could also store in custom table)
        $join_requests = get_option('geoos_join_requests', []);
        $join_requests[$node_id] = [
            'node_id' => $node_id,
            'url' => $remote_url,
            'name' => $remote_name,
            'api_url' => $remote_url . '/?rest_route=/geoos/v1',
            'requested_at' => current_time('mysql'),
            'status' => 'pending'
        ];
        update_option('geoos_join_requests', $join_requests);

        // Log the request
        error_log("Swarm join request from: $remote_url ($remote_name)");

        return [
            'success' => true,
            'node_id' => $node_id,
            'message' => 'Join request received. The swarm administrator will approve your request.',
            'config' => [
                'node_id' => $node_id,
                'url' => $remote_url,
                'api_url' => $remote_url . '/?rest_route=/geoos/v1'
            ]
        ];
    }

    /**
     * Generate installation script
     */
    public function get_install_script() {
        $repo_url = 'https://github.com/tdw419/geometry_os.git';
        $main_url = site_url();
        $api_url = rest_url('geoos/v1');

        $script = <<<BASH
#!/bin/bash
# Geometry OS Swarm Node Installer
# Generated by: $main_url

set -e

echo "🐝 Installing Geometry OS Swarm Node..."

# Check for dependencies
command -v git >/dev/null 2>&1 || { echo "❌ git is required"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "❌ python3 is required"; exit 1; }

# Clone repository
if [ ! -d "geometry_os" ]; then
    echo "📦 Cloning repository..."
    git clone $repo_url
fi

cd geometry_os/geometry_os

# Create remote nodes config
echo "📝 Creating config for main swarm node..."
mkdir -p systems/swarm
cat > systems/swarm/remote_nodes.json << EOF
{
  "nodes": [{
    "node_id": "swarm-main",
    "url": "$main_url",
    "api_url": "$api_url",
    "enabled": true
  }]
}
EOF

echo ""
echo "✅ Installation complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. Start WordPress on this machine"
echo "   2. Copy the swarm plugin to wp-content/mu-plugins/"
echo "   3. Run: python3 systems/swarm/wp_discovery_daemon.py -f"
echo ""
echo "📡 Main swarm node: $main_url"
echo ""

BASH;

        // Return as plain text for direct download
        header('Content-Type: text/plain');
        echo $script;
        exit;
    }

    /**
     * Trigger remote AI assistant (webhook for Claude/Gemini CLI)
     */
    public function trigger_remote_ai($request): array {
        $ai_type = $request->get_param('ai_type') ?: 'claude'; // claude, gemini, etc.
        $remote_url = $request->get_param('remote_url');
        $task = $request->get_param('task') ?: 'install';

        if (!$remote_url) {
            return ['success' => false, 'error' => 'remote_url required'];
        }

        // Store AI trigger request
        $ai_requests = get_option('geoos_ai_requests', []);
        $request_id = uniqid('ai-req-');
        $ai_requests[$request_id] = [
            'ai_type' => $ai_type,
            'remote_url' => $remote_url,
            'task' => $task,
            'created_at' => current_time('mysql'),
            'status' => 'pending'
        ];
        update_option('geoos_ai_requests', $ai_requests);

        // Generate the prompt for the AI
        $prompt = $this->generate_ai_prompt($ai_type, $remote_url, $task);

        return [
            'success' => true,
            'request_id' => $request_id,
            'ai_type' => $ai_type,
            'prompt' => $prompt,
            'command' => $ai_type === 'claude'
                ? "claude \"$prompt\""
                : "gemini \"$prompt\"",
            'instructions' => "Run the above command on your remote server to trigger AI-assisted installation."
        ];
    }

    /**
     * Generate AI prompt for installation
     */
    private function generate_ai_prompt(string $ai_type, string $remote_url, string $task): string {
        $main_url = site_url();

        return "I need you to help me set up Geometry OS and connect to the swarm at $main_url. " .
               "Please: 1) Clone https://github.com/tdw419/geometry_os.git 2) Set up the WordPress swarm plugin " .
               "3) Configure remote_nodes.json to connect to $main_url 4) Start the sync daemon. " .
               "My local WordPress is at $remote_url";
    }

    /**
     * Add admin menu
     */
    public function add_admin_menu(): void {
        add_submenu_page(
            'geometry-os-swarm',
            'Join Requests',
            'Join Requests',
            'manage_options',
            'geoos-join-requests',
            [$this, 'render_admin_page']
        );
    }

    /**
     * Render admin page
     */
    public function render_admin_page(): void {
        $join_requests = get_option('geoos_join_requests', []);

        echo '<div class="wrap"><h1>🐝 Swarm Join Requests</h1>';

        if (empty($join_requests)) {
            echo '<p>No pending join requests.</p>';
        } else {
            echo '<table class="wp-list-table widefat fixed striped">';
            echo '<thead><tr><th>Node</th><th>URL</th><th>Requested</th><th>Status</th><th>Actions</th></tr></thead>';
            echo '<tbody>';

            foreach ($join_requests as $node_id => $req) {
                echo '<tr>';
                echo '<td>' . esc_html($req['name'] ?? $node_id) . '</td>';
                echo '<td><code>' . esc_html($req['url']) . '</code></td>';
                echo '<td>' . esc_html($req['requested_at']) . '</td>';
                echo '<td>' . esc_html($req['status']) . '</td>';
                echo '<td>';
                echo '<button class="button" onclick="approveNode(\'' . esc_attr($node_id) . '\')">Approve</button> ';
                echo '<button class="button" onclick="testNode(\'' . esc_url($req['api_url']) . '\')">Test</button>';
                echo '</td>';
                echo '</tr>';
            }

            echo '</tbody></table>';
        }

        echo '</div>';
    }

    /**
     * Render full join page (HTML)
     */
    public function render_join_page() {
        $main_url = site_url();
        $api_url = rest_url('geoos/v1');
        $script_url = rest_url('geoos/v1/swarm/install-script');
        $join_url = rest_url('geoos/v1/swarm/join-request');
        $trigger_url = rest_url('geoos/v1/swarm/trigger-ai');

        header('Content-Type: text/html; charset=utf-8');
        ?>
<!DOCTYPE html>
<html>
<head>
    <title>Join Geometry OS Swarm</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; max-width: 800px; margin: 50px auto; padding: 20px; background: #f5f5f5; }
        .card { background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #2271b1; margin-bottom: 10px; }
        .subtitle { color: #666; margin-bottom: 30px; }
        .option { background: #f9f9f9; padding: 20px; border-radius: 8px; margin: 15px 0; border-left: 4px solid #2271b1; }
        .option h3 { margin-top: 0; color: #333; }
        pre { background: #1e1e1e; color: #d4d4d4; padding: 15px; border-radius: 6px; overflow-x: auto; font-size: 13px; }
        code { background: #e8e8e8; padding: 2px 6px; border-radius: 3px; }
        .btn { display: inline-block; background: #2271b1; color: #fff; padding: 12px 24px; border-radius: 6px; text-decoration: none; margin: 5px; }
        .btn:hover { background: #135e96; }
        .btn-secondary { background: #666; }
        .copy-btn { background: #333; color: #fff; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 12px; }
        .copy-btn:hover { background: #555; }
        .status { margin-top: 10px; padding: 10px; border-radius: 4px; }
        .status.success { background: #d4edda; color: #155724; }
        .status.error { background: #f8d7da; color: #721c24; }
        input[type="text"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; margin: 10px 0; box-sizing: border-box; }
    </style>
</head>
<body>
    <div class="card">
        <h1>🐝 Join the Geometry OS Swarm</h1>
        <p class="subtitle">Connect your WordPress to our distributed AI network</p>

        <div class="option">
            <h3>⚡ Quick Install</h3>
            <p>Run this one-liner on your server:</p>
            <pre>curl -s "<?php echo esc_url($script_url); ?>" | bash</pre>
            <button class="copy-btn" onclick="copyToBoard('install-script')">Copy</button>
        </div>

        <div class="option">
            <h3>🤖 AI-Assisted Install</h3>
            <p>Enter your WordPress URL and get an AI command:</p>
            <input type="text" id="remote-url" placeholder="http://your-server:8080" value="">
            <select id="ai-type" style="padding: 10px; border-radius: 4px; border: 1px solid #ddd;">
                <option value="claude">Claude CLI</option>
                <option value="gemini">Gemini CLI</option>
            </select>
            <button class="btn" onclick="generateAICommand()">Generate Command</button>
            <pre id="ai-command" style="display: none;"></pre>
            <div id="ai-status"></div>
        </div>

        <div class="option">
            <h3>📥 Manual Clone</h3>
            <pre>git clone https://github.com/tdw419/geometry_os.git
cd geometry_os/geometry_os
# Copy plugin: cp -r wordpress_zone/wordpress/wp-content/mu-plugins/geometry_os_swarm_node.php /path/to/your/wordpress/wp-content/mu-plugins/
# Start daemon: python3 systems/swarm/wp_discovery_daemon.py -f</pre>
        </div>

        <div class="option">
            <h3>🔗 Your Swarm Config</h3>
            <p>Add to your <code>remote_nodes.json</code>:</p>
            <pre id="config-json">{
  "nodes": [{
    "node_id": "swarm-main",
    "url": "<?php echo esc_url($main_url); ?>",
    "api_url": "<?php echo esc_url($api_url); ?>",
    "enabled": true
  }]
}</pre>
            <button class="copy-btn" onclick="copyToBoard('config-json')">Copy</button>
        </div>

        <div class="option">
            <h3>✋ Request to Join</h3>
            <p>Notify the swarm that you want to join:</p>
            <input type="text" id="join-name" placeholder="Your Node Name">
            <button class="btn" onclick="sendJoinRequest()">Send Join Request</button>
            <div id="join-status"></div>
        </div>

        <p style="text-align: center; color: #999; margin-top: 30px;">
            <a href="https://github.com/tdw419/geometry_os">GitHub</a> •
            Main Swarm: <code><?php echo esc_html($main_url); ?></code>
        </p>
    </div>

    <script>
    function copyToBoard(id) {
        var text = document.getElementById(id) ? document.getElementById(id).textContent : document.querySelector('#' + id.replace('install-script', 'pre')).textContent;
        if (id === 'install-script') text = 'curl -s "<?php echo esc_url($script_url); ?>" | bash';
        navigator.clipboard.writeText(text);
        alert('Copied!');
    }

    function generateAICommand() {
        var remoteUrl = document.getElementById('remote-url').value || window.location.origin;
        var aiType = document.getElementById('ai-type').value;

        fetch('<?php echo esc_url($trigger_url); ?>', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                ai_type: aiType,
                remote_url: remoteUrl,
                task: 'install'
            })
        })
        .then(r => r.json())
        .then(data => {
            document.getElementById('ai-command').style.display = 'block';
            document.getElementById('ai-command').textContent = data.command;
            document.getElementById('ai-status').innerHTML = '<div class="status success">✅ Run this command on your remote server</div>';
        })
        .catch(e => {
            document.getElementById('ai-status').innerHTML = '<div class="status error">❌ Error: ' + e.message + '</div>';
        });
    }

    function sendJoinRequest() {
        var name = document.getElementById('join-name').value || 'Anonymous Node';
        var remoteUrl = document.getElementById('remote-url').value || window.location.origin;

        fetch('<?php echo esc_url($join_url); ?>', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                remote_url: remoteUrl,
                remote_name: name
            })
        })
        .then(r => r.json())
        .then(data => {
            document.getElementById('join-status').innerHTML = data.success
                ? '<div class="status success">✅ ' + data.message + '</div>'
                : '<div class="status error">❌ ' + (data.error || 'Failed') + '</div>';
        })
        .catch(e => {
            document.getElementById('join-status').innerHTML = '<div class="status error">❌ Error: ' + e.message + '</div>';
        });
    }
    </script>
</body>
</html>
        <?php
        exit;
    }
}


new GeometryOS_SwarmJoinPage();
