<?php
/**
 * Plugin Name: Geometry OS Swarm Join Page
 */
if (!defined('ABSPATH')) exit;

class GeometryOS_SwarmJoinPage {
    public function __construct() {
        add_action('rest_api_init', [$this, 'register_routes']);
    }

    public function register_routes(): void {
        register_rest_route('geoos/v1', '/swarm/ai-install', [
            'methods' => 'GET',
            'callback' => [$this, 'render_ai_install_page'],
            'permission_callback' => '__return_true'
        ]);
        register_rest_route('geoos/v1', '/swarm/install-script', [
            'methods' => 'GET',
            'callback' => [$this, 'get_install_script'],
            'permission_callback' => '__return_true'
        ]);
    }

    public function render_ai_install_page() {
        $host = $_SERVER['HTTP_HOST'] ?? 'localhost';
        $daemon_url = "http://$host:8765";
        header('Content-Type: text/html; charset=utf-8');
        ?>
<!DOCTYPE html>
<html><head><title>Install Geometry OS with AI</title>
<style>*{box-sizing:border-box}body{font-family:-apple-system,sans-serif;max-width:900px;margin:0 auto;padding:40px 20px;background:linear-gradient(135deg,#1a1a2e,#16213e);min-height:100vh;color:#fff}.container{background:rgba(255,255,255,0.1);border-radius:16px;padding:40px}h1{font-size:2.5em}.step{background:rgba(0,0,0,0.3);border-radius:12px;padding:25px;margin:20px 0}.url-box,.prompt-box{background:#1e1e1e;padding:20px;border-radius:8px;font-family:monospace;font-size:14px;white-space:pre-wrap}.copy-btn{background:#4fc3f7;color:#000;border:none;padding:10px 20px;border-radius:6px;cursor:pointer;font-weight:bold;margin:5px}.ai-btn{padding:15px 25px;border-radius:8px;border:2px solid #333;background:rgba(0,0,0,0.3);color:#fff;margin:5px}.ai-btn.active{border-color:#4fc3f7}.status{padding:15px;border-radius:8px;margin:15px 0;background:#2e7d32}</style>
</head><body>
<div class="container">
<h1>🐝 Install Geometry OS</h1>
<p style="color:#aaa;margin-bottom:40px">Let AI install it for you - copy and paste!</p>

<div class="step">
<h3>📌 Step 1: Installation URL</h3>
<div class="url-box" id="daemon-url"><?php echo $daemon_url; ?></div>
<button class="copy-btn" onclick="copyUrl()">📋 Copy URL</button>
</div>

<div class="step">
<h3>🤖 Step 2: Choose AI</h3>
<button class="ai-btn active" onclick="selectAI('claude')">🤖 Claude</button>
<button class="ai-btn" onclick="selectAI('gemini')">✨ Gemini</button>
</div>

<div class="step">
<h3>📋 Step 3: Copy Prompt</h3>
<div class="prompt-box" id="ai-prompt"></div>
<button class="copy-btn" onclick="copyPrompt()">📋 Copy Prompt</button>
<div id="status" class="status" style="display:none"></div>
</div>

<div style="margin-top:30px;padding:15px;background:rgba(0,0,0,0.2);border-radius:8px">
<strong>Daemon:</strong> <span id="daemon-status">Checking...</span>
</div>
</div>

<script>
const daemonUrl='<?php echo $daemon_url; ?>';
let ai='claude';
const prompts={
claude:`Connect to Geometry OS installation daemon and help me install:\n\n1. GET ${daemonUrl}/ai/instructions\n2. POST ${daemonUrl}/ai/webhook with {"ai_type":"claude"}\n3. Follow daemon guidance step by step`,
gemini:`Install Geometry OS:\n\n1. GET ${daemonUrl}/ai/instructions\n2. POST ${daemonUrl}/ai/webhook\n3. Execute guided installation`
};
function selectAI(x){ai=x;document.querySelectorAll('.ai-btn').forEach(b=>b.classList.remove('active'));event.target.classList.add('active');document.getElementById('ai-prompt').textContent=prompts[x];}
function copyUrl(){navigator.clipboard.writeText(daemonUrl);showStatus('URL copied!',true);}
function copyPrompt(){navigator.clipboard.writeText(document.getElementById('ai-prompt').textContent);showStatus('Prompt copied!',true);}
function showStatus(m,ok){const s=document.getElementById('status');s.textContent=m;s.style.display='block';s.style.background=ok?'#2e7d32':'#c62828';}
async function checkDaemon(){try{const r=await fetch(daemonUrl+'/status');const d=await r.json();document.getElementById('daemon-status').innerHTML='<span style="color:#4caf50">✅ Online</span>';}catch(e){document.getElementById('daemon-status').innerHTML='<span style="color:#f44336">❌ Offline</span> - Run: python3 systems/swarm/install_daemon.py';}}
document.getElementById('ai-prompt').textContent=prompts.claude;
checkDaemon();setInterval(checkDaemon,10000);
</script>
</body></html>
<?php exit; }

    public function get_install_script() {
        header('Content-Type: text/plain');
        echo "#!/bin/bash\n# Geometry OS Installer\nset -e\necho '🐝 Installing...'\n[ ! -d 'geometry_os' ] && git clone https://github.com/tdw419/geometry_os.git\ncd geometry_os/geometry_os\necho '✅ Done! Run: python3 systems/swarm/wp_discovery_daemon.py -f'\n";
        exit;
    }
}
new GeometryOS_SwarmJoinPage();
