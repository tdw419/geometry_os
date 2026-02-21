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
