<?php
/**
 * LLM Router Settings Page
 *
 * Configuration page for the LLM router.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

// Handle form submission
if (isset($_POST['geometry_os_llm_router_settings'])) {
    check_admin_referer('geometry_os_llm_router_settings');

    // Save proxy port
    if (isset($_POST['proxy_port'])) {
        $port = (int) $_POST['proxy_port'];
        if ($port > 0 && $port < 65536) {
            update_option('geometry_os_llm_router_port', $port);
        }
    }

    // Save primary model
    if (isset($_POST['primary_model'])) {
        $model = sanitize_text_field($_POST['primary_model']);
        if (class_exists('Geometry_OS_Model_Selector') &&
            Geometry_OS_Model_Selector::is_valid_model($model)) {
            update_option('geometry_os_llm_router_primary_model', $model);
        }
    }

    // Save fallback model
    if (isset($_POST['fallback_model'])) {
        $model = sanitize_text_field($_POST['fallback_model']);
        if (class_exists('Geometry_OS_Model_Selector') &&
            Geometry_OS_Model_Selector::is_valid_model($model)) {
            update_option('geometry_os_llm_router_fallback_model', $model);
        }
    }

    // Save fallback enabled
    $fallback_enabled = isset($_POST['fallback_enabled']) ? '1' : '0';
    update_option('geometry_os_llm_router_fallback_enabled', $fallback_enabled);

    // Show success message
    echo '<div class="notice notice-success"><p>' .
         esc_html__('Settings saved successfully.', 'geometry-os-llm-router') .
         '</p></div>';
}

// Get current values
$proxy_port = get_option('geometry_os_llm_router_port', 4000);
$primary_model = get_option('geometry_os_llm_router_primary_model', 'claude-sonnet-4-20250514');
$fallback_model = get_option('geometry_os_llm_router_fallback_model', 'lm-studio-local');
$fallback_enabled = get_option('geometry_os_llm_router_fallback_enabled', true);
?>

<div class="wrap geometry-os-llm-settings-wrap">
    <h1 class="geometry-os-llm-settings-title">
        <span class="dashicons dashicons-admin-generic"></span>
        <?php esc_html_e('LLM Router Settings', 'geometry-os-llm-router'); ?>
    </h1>

    <form method="post" action="" id="geometry-os-llm-router-settings-form">
        <?php wp_nonce_field('geometry_os_llm_router_settings'); ?>

        <div class="geometry-os-llm-settings-sections">

            <!-- Proxy Configuration -->
            <div class="geometry-os-llm-settings-section">
                <h2 class="geometry-os-llm-settings-section-title">
                    <span class="dashicons dashicons-admin-network"></span>
                    <?php esc_html_e('Proxy Configuration', 'geometry-os-llm-router'); ?>
                </h2>

                <table class="form-table">
                    <tr>
                        <th scope="row">
                            <label for="proxy_port">
                                <?php esc_html_e('Proxy Port', 'geometry-os-llm-router'); ?>
                            </label>
                        </th>
                        <td>
                            <input type="number" name="proxy_port" id="proxy_port"
                                   value="<?php echo esc_attr($proxy_port); ?>"
                                   class="small-text" min="1" max="65535" />
                            <p class="description">
                                <?php
                                printf(
                                    /* translators: %s: default port number */
                                    esc_html__('The port number for the hybrid LLM proxy service. Default: %s', 'geometry-os-llm-router'),
                                    '4000'
                                );
                                ?>
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Model Selection -->
            <div class="geometry-os-llm-settings-section">
                <h2 class="geometry-os-llm-settings-section-title">
                    <span class="dashicons dashicons-cloud"></span>
                    <?php esc_html_e('Model Selection', 'geometry-os-llm-router'); ?>
                </h2>

                <table class="form-table">
                    <tr>
                        <th scope="row">
                            <label for="primary_model">
                                <?php esc_html_e('Primary Model', 'geometry-os-llm-router'); ?>
                            </label>
                        </th>
                        <td>
                            <select name="primary_model" id="primary_model" class="regular-text">
                                <optgroup label="<?php esc_html_e('Claude API Models', 'geometry-os-llm-router'); ?>">
                                    <option value="claude-opus-4-20250514" <?php selected($primary_model, 'claude-opus-4-20250514'); ?>>
                                        Claude Opus 4 - Most powerful
                                    </option>
                                    <option value="claude-sonnet-4-20250514" <?php selected($primary_model, 'claude-sonnet-4-20250514'); ?>>
                                        Claude Sonnet 4 - Balanced
                                    </option>
                                    <option value="claude-haiku-4-20250514" <?php selected($primary_model, 'claude-haiku-4-20250514'); ?>>
                                        Claude Haiku 4 - Fastest
                                    </option>
                                </optgroup>
                            </select>
                            <p class="description">
                                <?php esc_html_e('The default model used for all LLM requests.', 'geometry-os-llm-router'); ?>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="fallback_model">
                                <?php esc_html_e('Fallback Model', 'geometry-os-llm-router'); ?>
                            </label>
                        </th>
                        <td>
                            <select name="fallback_model" id="fallback_model" class="regular-text">
                                <optgroup label="<?php esc_html_e('Local Models', 'geometry-os-llm-router'); ?>">
                                    <option value="lm-studio-local" <?php selected($fallback_model, 'lm-studio-local'); ?>>
                                        LM Studio (Local)
                                    </option>
                                    <option value="ollama-local" <?php selected($fallback_model, 'ollama-local'); ?>>
                                        Ollama (Local)
                                    </option>
                                </optgroup>
                            </select>
                            <p class="description">
                                <?php esc_html_e('Local model to use when Claude API is unavailable.', 'geometry-os-llm-router'); ?>
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Fallback Configuration -->
            <div class="geometry-os-llm-settings-section">
                <h2 class="geometry-os-llm-settings-section-title">
                    <span class="dashicons dashicons-update-alt"></span>
                    <?php esc_html_e('Fallback Configuration', 'geometry-os-llm-router'); ?>
                </h2>

                <table class="form-table">
                    <tr>
                        <th scope="row">
                            <?php esc_html_e('Enable Fallback', 'geometry-os-llm-router'); ?>
                        </th>
                        <td>
                            <label>
                                <input type="checkbox" name="fallback_enabled" value="1"
                                       <?php checked($fallback_enabled); ?> />
                                <?php esc_html_e('Automatically fallback to local model when Claude API fails', 'geometry-os-llm-router'); ?>
                            </label>
                            <p class="description">
                                <?php esc_html_e('When enabled, requests that fail due to rate limits or API errors will be retried using the local fallback model.', 'geometry-os-llm-router'); ?>
                            </p>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- API Keys Notice -->
            <div class="geometry-os-llm-settings-section">
                <h2 class="geometry-os-llm-settings-section-title">
                    <span class="dashicons dashicons-admin-keys"></span>
                    <?php esc_html_e('API Configuration', 'geometry-os-llm-router'); ?>
                </h2>

                <div class="geometry-os-llm-settings-notice">
                    <p>
                        <?php
                        printf(
                            /* translators: %s: settings page URL */
                            esc_html__('Claude API keys are configured separately in the %sWordPress settings%s.', 'geometry-os-llm-router'),
                            '<a href="' . admin_url('options-general.php?page=geometry-os-api-keys') . '">',
                            '</a>'
                        );
                        ?>
                    </p>
                </div>
            </div>

        </div>

        <?php submit_button(__('Save Settings', 'geometry-os-llm-router')); ?>
    </form>

    <div class="geometry-os-llm-settings-info">
        <h3><?php esc_html_e('Quick Links', 'geometry-os-llm-router'); ?></h3>
        <ul>
            <li>
                <a href="<?php echo admin_url('admin.php?page=geometry-os-llm-router'); ?>">
                    <?php esc_html_e('Router Dashboard', 'geometry-os-llm-router'); ?>
                </a>
            </li>
            <li>
                <a href="<?php echo admin_url('admin.php?page=geometry-os-llm-analytics'); ?>">
                    <?php esc_html_e('Analytics', 'geometry-os-llm-router'); ?>
                </a>
            </li>
            <li>
                <a href="http://localhost:<?php echo esc_attr($proxy_port); ?>/health" target="_blank">
                    <?php esc_html_e('Proxy Health Endpoint', 'geometry-os-llm-router'); ?>
                    <span class="dashicons dashicons-external"></span>
                </a>
            </li>
        </ul>
    </div>
</div>
