<?php
/**
 * Plugin Name: Geometry OS Admin UI
 * Description: Admin buttons and metaboxes for triggering Evolution Daemon agents
 * Version: 0.1
 * Author: Geometry OS
 */

// Prevent direct access
if (!defined('ABSPATH')) exit;

/**
 * Register metabox on post editor
 */
add_action('add_meta_boxes', function() {
    add_meta_box(
        'geometry_os_agent',
        'Geometry OS Agent',
        'geometry_os_render_agent_metabox',
        'post',
        'side',
        'default'
    );
});

/**
 * Render agent metabox
 */
function geometry_os_render_agent_metabox($post) {
    if (function_exists('wp_nonce_field')) {
        wp_nonce_field('geometry_os_agent', 'geometry_os_nonce');
    }
    ?>
    <div id="geometry-os-agent-controls">
        <p class="description">Trigger AI agents for this post:</p>

        <p>
            <button type="button" class="button" id="geo-auto-tag" data-post-id="<?php echo esc_attr($post->ID); ?>">
                Auto-Tag
            </button>
        </p>

        <p>
            <button type="button" class="button" id="geo-generate-excerpt" data-post-id="<?php echo esc_attr($post->ID); ?>">
                Generate Excerpt
            </button>
        </p>

        <p>
            <button type="button" class="button" id="geo-suggest-category" data-post-id="<?php echo esc_attr($post->ID); ?>">
                Suggest Category
            </button>
        </p>

        <div id="geo-agent-status" style="margin-top: 10px; display: none;">
            <span class="spinner is-active"></span>
            <span class="status-text">Processing...</span>
        </div>

        <div id="geo-agent-result" style="margin-top: 10px; display: none;">
            <div class="notice notice-success inline">
                <p class="result-text"></p>
            </div>
        </div>
    </div>

    <script>
    jQuery(document).ready(function($) {
        function triggerAgent(action, postId) {
            $('#geo-agent-status').show();
            $('#geo-agent-result').hide();

            $.ajax({
                url: ajaxurl,
                method: 'POST',
                data: {
                    action: 'geometry_os_agent_trigger',
                    agent_action: action,
                    post_id: postId,
                    nonce: $('#geometry_os_nonce').val()
                },
                success: function(response) {
                    $('#geo-agent-status').hide();
                    if (response.success) {
                        $('#geo-agent-result .result-text').text(response.data.message);
                        $('#geo-agent-result').show();
                        if (response.data.tags) {
                            alert('Suggested tags: ' + response.data.tags.join(', '));
                        }
                    } else {
                        alert('Error: ' + response.data.message);
                    }
                },
                error: function() {
                    $('#geo-agent-status').hide();
                    alert('Failed to connect to agent');
                }
            });
        }

        $('#geo-auto-tag').on('click', function() {
            triggerAgent('auto_tag', $(this).data('post-id'));
        });

        $('#geo-generate-excerpt').on('click', function() {
            triggerAgent('generate_excerpt', $(this).data('post-id'));
        });

        $('#geo-suggest-category').on('click', function() {
            triggerAgent('suggest_category', $(this).data('post-id'));
        });
    });
    </script>
    <?php
}

/**
 * AJAX handler for agent triggers
 */
add_action('wp_ajax_geometry_os_agent_trigger', function() {
    // Verify nonce if available
    if (function_exists('check_ajax_referer')) {
        check_ajax_referer('geometry_os_nonce', 'nonce');
    }

    $action_type = '';
    if (isset($_POST['agent_action'])) {
        $action_type = function_exists('sanitize_text_field')
            ? sanitize_text_field($_POST['agent_action'])
            : $_POST['agent_action'];
    }

    $post_id = 0;
    if (isset($_POST['post_id'])) {
        $post_id = intval($_POST['post_id']);
    }

    // Call the bridge function
    if (function_exists('geometry_os_send_agent_request')) {
        $result = geometry_os_send_agent_request('content_intelligence', [
            'post_id' => $post_id,
            'action' => $action_type
        ]);
    } else {
        if (function_exists('wp_send_json_error')) {
            wp_send_json_error(['message' => 'Bridge function not available']);
        }
        return;
    }

    if ($result['status'] === 'queued') {
        // Poll for result (max 10 seconds)
        $task_id = $result['task_id'];
        $attempts = 0;

        while ($attempts < 20) {
            usleep(500000); // 0.5 seconds

            if (function_exists('geometry_os_get_task_status')) {
                $status = geometry_os_get_task_status($task_id);
            } else {
                break;
            }

            if ($status['status'] === 'completed') {
                if (function_exists('wp_send_json_success')) {
                    wp_send_json_success([
                        'message' => 'Agent completed successfully',
                        'result' => $status['result']
                    ]);
                }
                return;
            } elseif ($status['status'] === 'error') {
                $error_msg = isset($status['error']) ? $status['error'] : 'Unknown error';
                if (function_exists('wp_send_json_error')) {
                    wp_send_json_error(['message' => $error_msg]);
                }
                return;
            }

            $attempts++;
        }

        if (function_exists('wp_send_json_success')) {
            wp_send_json_success([
                'message' => 'Task queued (processing in background)',
                'task_id' => $task_id
            ]);
        }
    } else {
        $error_msg = isset($result['message']) ? $result['message'] : 'Failed to queue task';
        if (function_exists('wp_send_json_error')) {
            wp_send_json_error(['message' => $error_msg]);
        }
    }
});

/**
 * Register shortcode for agent buttons
 */
add_shortcode('geometry_agent', function($atts) {
    $atts = function_exists('shortcode_atts')
        ? shortcode_atts([
            'type' => 'plugin_analysis',
            'text' => 'Analyze Plugins'
        ], $atts)
        : array_merge([
            'type' => 'plugin_analysis',
            'text' => 'Analyze Plugins'
        ], is_array($atts) ? $atts : []);

    return sprintf(
        '<button class="button geometry-agent-shortcode" data-type="%s">%s</button>',
        esc_attr($atts['type']),
        esc_html($atts['text'])
    );
});

/**
 * Add admin menu for plugin analysis
 */
add_action('admin_menu', function() {
    if (function_exists('add_submenu_page')) {
        add_submenu_page(
            'tools.php',
            'Geometry OS Plugin Analysis',
            'Plugin Analysis',
            'manage_options',
            'geometry-os-analysis',
            'geometry_os_render_analysis_page'
        );
    }
});

/**
 * Render plugin analysis page
 */
function geometry_os_render_analysis_page() {
    $nonce = function_exists('wp_create_nonce')
        ? wp_create_nonce('geometry_os_analysis')
        : 'default-nonce';
    ?>
    <div class="wrap">
        <h1>Geometry OS Plugin Analysis</h1>

        <p>Run security and update analysis on installed WordPress plugins.</p>

        <p>
            <button class="button button-primary" id="geo-security-scan">
                Run Security Scan
            </button>
            <button class="button" id="geo-update-check">
                Check for Updates
            </button>
        </p>

        <div id="geo-analysis-results" style="margin-top: 20px;"></div>
    </div>

    <script>
    jQuery(document).ready(function($) {
        $('#geo-security-scan').on('click', function() {
            $(this).prop('disabled', true).text('Scanning...');
            $('#geo-analysis-results').html('<p>Running security scan...</p>');

            $.post(ajaxurl, {
                action: 'geometry_os_plugin_analysis',
                scan_type: 'security',
                nonce: '<?php echo esc_js($nonce); ?>'
            }, function(response) {
                $('#geo-security-scan').prop('disabled', false).text('Run Security Scan');
                if (response.success) {
                    $('#geo-analysis-results').html('<pre>' + JSON.stringify(response.data, null, 2) + '</pre>');
                } else {
                    $('#geo-analysis-results').html('<p class="error">Error: ' + response.data.message + '</p>');
                }
            });
        });

        $('#geo-update-check').on('click', function() {
            $(this).prop('disabled', true).text('Checking...');
            $('#geo-analysis-results').html('<p>Checking for updates...</p>');

            $.post(ajaxurl, {
                action: 'geometry_os_plugin_analysis',
                scan_type: 'updates',
                nonce: '<?php echo esc_js($nonce); ?>'
            }, function(response) {
                $('#geo-update-check').prop('disabled', false).text('Check for Updates');
                if (response.success) {
                    $('#geo-analysis-results').html('<pre>' + JSON.stringify(response.data, null, 2) + '</pre>');
                } else {
                    $('#geo-analysis-results').html('<p class="error">Error: ' + response.data.message + '</p>');
                }
            });
        });
    });
    </script>
    <?php
}

/**
 * AJAX handler for plugin analysis
 */
add_action('wp_ajax_geometry_os_plugin_analysis', function() {
    // Verify nonce if available
    if (function_exists('check_ajax_referer')) {
        check_ajax_referer('geometry_os_analysis', 'nonce');
    }

    $scan_type = 'security';
    if (isset($_POST['scan_type'])) {
        $scan_type = function_exists('sanitize_text_field')
            ? sanitize_text_field($_POST['scan_type'])
            : $_POST['scan_type'];
    }

    // Call the bridge function
    if (function_exists('geometry_os_send_agent_request')) {
        $result = geometry_os_send_agent_request('plugin_analysis', [
            'scan_type' => $scan_type
        ]);
    } else {
        if (function_exists('wp_send_json_error')) {
            wp_send_json_error(['message' => 'Bridge function not available']);
        }
        return;
    }

    if ($result['status'] === 'queued') {
        $task_id = $result['task_id'];
        $attempts = 0;

        while ($attempts < 30) {
            usleep(500000); // 0.5 seconds

            if (function_exists('geometry_os_get_task_status')) {
                $status = geometry_os_get_task_status($task_id);
            } else {
                break;
            }

            if ($status['status'] === 'completed') {
                if (function_exists('wp_send_json_success')) {
                    wp_send_json_success($status['result']);
                }
                return;
            } elseif ($status['status'] === 'error') {
                $error_msg = isset($status['error']) ? $status['error'] : 'Unknown error';
                if (function_exists('wp_send_json_error')) {
                    wp_send_json_error(['message' => $error_msg]);
                }
                return;
            }

            $attempts++;
        }

        if (function_exists('wp_send_json_success')) {
            wp_send_json_success([
                'status' => 'processing',
                'message' => 'Analysis running in background',
                'task_id' => $task_id
            ]);
        }
    } else {
        $error_msg = isset($result['message']) ? $result['message'] : 'Failed to start analysis';
        if (function_exists('wp_send_json_error')) {
            wp_send_json_error(['message' => $error_msg]);
        }
    }
});

/**
 * Geometry OS Admin HUD - Dashboard Widget for Real-Time Health Metrics
 */
class GeometryOS_AdminHUD {

    /**
     * Constructor - register hooks
     */
    public function __construct() {
        add_action('wp_dashboard_setup', [$this, 'add_dashboard_widget']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_styles']);
    }

    /**
     * Add the dashboard widget
     */
    public function add_dashboard_widget() {
        if (function_exists('wp_add_dashboard_widget')) {
            wp_add_dashboard_widget(
                'geometry_os_health_hud',
                'Geometry OS Health',
                [$this, 'render_hud']
            );
        }
    }

    /**
     * Enqueue inline styles for the HUD
     */
    public function enqueue_styles($hook) {
        // Only add styles on dashboard
        if ($hook !== 'index.php') {
            return;
        }

        if (function_exists('wp_add_inline_style')) {
            wp_add_inline_style('wp-admin', $this->get_hud_styles());
        }
    }

    /**
     * Get inline CSS for dark theme HUD
     */
    private function get_hud_styles() {
        return '
            #geometry_os_health_hud .inside {
                background: #1a1a2e;
                border: 2px solid #00ffcc;
                border-radius: 8px;
                padding: 15px;
                margin: 0;
            }
            #geometry_os_health_hud .hud-title {
                color: #00ffcc;
                font-family: monospace;
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 10px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            #geometry_os_health_hud .hud-table {
                width: 100%;
                border-collapse: collapse;
                font-family: monospace;
                font-size: 12px;
                margin-bottom: 15px;
            }
            #geometry_os_health_hud .hud-table td {
                padding: 6px 8px;
                border-bottom: 1px solid #333;
            }
            #geometry_os_health_hud .hud-table .metric-label {
                color: #888;
                width: 50%;
            }
            #geometry_os_health_hud .hud-table .metric-value {
                color: #fff;
                text-align: right;
                font-weight: bold;
            }
            #geometry_os_health_hud .status-pass { color: #00ff00; }
            #geometry_os_health_hud .status-warn { color: #ffcc00; }
            #geometry_os_health_hud .status-fail { color: #ff4444; }
            #geometry_os_health_hud .hud-buttons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }
            #geometry_os_health_hud .hud-btn {
                flex: 1;
                padding: 8px 12px;
                font-family: monospace;
                font-size: 11px;
                cursor: pointer;
                border: 1px solid #00ffcc;
                background: transparent;
                color: #00ffcc;
                border-radius: 4px;
                transition: all 0.2s;
            }
            #geometry_os_health_hud .hud-btn:hover:not(:disabled) {
                background: #00ffcc;
                color: #1a1a2e;
            }
            #geometry_os_health_hud .hud-btn:disabled {
                opacity: 0.4;
                cursor: not-allowed;
                border-color: #555;
                color: #555;
            }
            #geometry_os_health_hud .hud-btn-emergency {
                border-color: #ff4444;
                color: #ff4444;
            }
            #geometry_os_health_hud .hud-btn-emergency:hover:not(:disabled) {
                background: #ff4444;
                color: #1a1a2e;
            }
            #geometry_os_health_hud .hud-alert {
                background: rgba(255, 68, 68, 0.2);
                border: 1px solid #ff4444;
                color: #ff4444;
                padding: 10px;
                margin-top: 10px;
                font-family: monospace;
                font-size: 11px;
                border-radius: 4px;
            }
            #geometry_os_health_hud .hud-timestamp {
                color: #555;
                font-family: monospace;
                font-size: 10px;
                margin-top: 10px;
            }
        ';
    }

    /**
     * Render the HUD widget content
     */
    public function render_hud() {
        // Get stored health metrics
        $metrics = [];
        if (function_exists('get_option')) {
            $stored = get_option('geometry_os_health_metrics', []);
            if (is_array($stored)) {
                $metrics = $stored;
            }
        }

        // Extract values with defaults
        $bridge_latency = isset($metrics['bridge_latency']) ? (float)$metrics['bridge_latency'] : 0;
        $swarm_capacity = isset($metrics['swarm_capacity']) ? (int)$metrics['swarm_capacity'] : 0;
        $health_score = isset($metrics['health_score']) ? (int)$metrics['health_score'] : 0;
        $buffer_drops = isset($metrics['buffer_drops']) ? (int)$metrics['buffer_drops'] : 0;
        $reconnects = isset($metrics['reconnects']) ? (int)$metrics['reconnects'] : 0;
        $timestamp = isset($metrics['timestamp']) ? $metrics['timestamp'] : '';

        // Determine status classes
        $latency_class = $bridge_latency < 100 ? 'status-pass' : ($bridge_latency < 200 ? 'status-warn' : 'status-fail');
        $health_class = $health_score >= 80 ? 'status-pass' : ($health_score >= 50 ? 'status-warn' : 'status-fail');

        // Emergency button enabled when health < 50
        $emergency_disabled = $health_score >= 50;
        $show_alert = $health_score < 50;

        ?>
        <div class="hud-title">System Health Monitor</div>

        <table class="hud-table">
            <tr>
                <td class="metric-label">Bridge Latency</td>
                <td class="metric-value <?php echo esc_attr($latency_class); ?>">
                    <?php echo esc_html($bridge_latency); ?> ms
                </td>
            </tr>
            <tr>
                <td class="metric-label">Swarm Capacity</td>
                <td class="metric-value">
                    <?php echo esc_html($swarm_capacity); ?>%
                </td>
            </tr>
            <tr>
                <td class="metric-label">Health Score</td>
                <td class="metric-value <?php echo esc_attr($health_class); ?>">
                    <?php echo esc_html($health_score); ?>%
                </td>
            </tr>
            <tr>
                <td class="metric-label">Buffer Drops</td>
                <td class="metric-value">
                    <?php echo esc_html($buffer_drops); ?>
                </td>
            </tr>
            <tr>
                <td class="metric-label">Reconnects</td>
                <td class="metric-value">
                    <?php echo esc_html($reconnects); ?>
                </td>
            </tr>
        </table>

        <div class="hud-buttons">
            <button type="button" class="hud-btn" id="geo-hud-refresh">
                Refresh
            </button>
            <button type="button" class="hud-btn hud-btn-emergency" id="geo-hud-emergency" <?php echo $emergency_disabled ? 'disabled' : ''; ?>>
                Emergency Reset
            </button>
        </div>

        <?php if ($show_alert) : ?>
        <div class="hud-alert">
            WARNING: CRITICAL - Health score below 50%. Emergency reset available.
        </div>
        <?php endif; ?>

        <?php if ($timestamp) : ?>
        <div class="hud-timestamp">
            Last updated: <?php echo esc_html($timestamp); ?>
        </div>
        <?php endif; ?>

        <script>
        jQuery(document).ready(function($) {
            // Refresh button
            $('#geo-hud-refresh').on('click', function() {
                $(this).prop('disabled', true).text('Refreshing...');
                location.reload();
            });

            // Emergency reset button
            $('#geo-hud-emergency').on('click', function() {
                if (!confirm('Are you sure you want to trigger an emergency reset?')) {
                    return;
                }

                var $btn = $(this);
                $btn.prop('disabled', true).text('Resetting...');

                $.ajax({
                    url: '<?php echo function_exists('rest_url') ? esc_js(rest_url('geometry-os/v1/emergency-reset')) : ''; ?>',
                    method: 'POST',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('X-WP-Nonce', '<?php echo function_exists('wp_create_nonce') ? esc_js(wp_create_nonce('wp_rest')) : ''; ?>');
                    },
                    success: function(response) {
                        alert('Emergency reset triggered. Check logs for details.');
                        location.reload();
                    },
                    error: function(xhr) {
                        var msg = 'Failed to trigger emergency reset.';
                        if (xhr.responseJSON && xhr.responseJSON.message) {
                            msg += ' Error: ' + xhr.responseJSON.message;
                        }
                        alert(msg);
                        $btn.prop('disabled', false).text('Emergency Reset');
                    }
                });
            });
        });
        </script>
        <?php
    }
}

// Initialize the Admin HUD
new GeometryOS_AdminHUD();
