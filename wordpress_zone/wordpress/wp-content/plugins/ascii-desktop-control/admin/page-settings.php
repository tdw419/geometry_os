<?php
/**
 * Settings page template for ASCII Desktop Control.
 *
 * Uses WordPress Settings API for form handling.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

// Get all existing API keys
$existing_keys = [];
if (class_exists('API_Keys')) {
    $api_keys = new API_Keys();
    $existing_keys = $api_keys->get_all();
}
?>
<div class="wrap">
    <h1><?php echo esc_html(get_admin_page_title()); ?></h1>

    <form method="post" action="options.php">
        <?php
        // Output nonce, action, and option_page fields
        settings_fields('ascii_desktop_control_settings');

        // Output settings sections and their fields
        do_settings_sections('ascii-desktop-control-settings');

        // Submit button
        submit_button(__('Save Settings', 'ascii-desktop-control'));
        ?>
    </form>

    <!-- API Keys Section -->
    <div class="ascii-api-keys-section" style="margin-top: 30px;">
        <h2><?php esc_html_e('API Keys', 'ascii-desktop-control'); ?></h2>
        <p class="description">
            <?php esc_html_e('Manage API keys for external tools and scripts to access the ASCII Desktop Control REST API.', 'ascii-desktop-control'); ?>
        </p>

        <!-- Generate New Key Form -->
        <div class="ascii-generate-key-form" style="margin: 20px 0; padding: 15px; background: #f7f7f7; border: 1px solid #ccd0d4; border-radius: 4px;">
            <h3 style="margin-top: 0;"><?php esc_html_e('Generate New API Key', 'ascii-desktop-control'); ?></h3>
            <form id="ascii-generate-key-form">
                <table class="form-table">
                    <tr>
                        <th scope="row">
                            <label for="ascii-key-name"><?php esc_html_e('Key Name', 'ascii-desktop-control'); ?></label>
                        </th>
                        <td>
                            <input type="text"
                                   id="ascii-key-name"
                                   name="key_name"
                                   placeholder="<?php esc_attr_e('e.g., Python Script, Claude Agent', 'ascii-desktop-control'); ?>"
                                   class="regular-text"
                                   required>
                            <p class="description"><?php esc_html_e('A descriptive name to identify this API key.', 'ascii-desktop-control'); ?></p>
                        </td>
                    </tr>
                </table>
                <?php wp_nonce_field('ascii_generate_api_key', 'nonce'); ?>
                <button type="submit" class="button button-primary">
                    <?php esc_html_e('Generate API Key', 'ascii-desktop-control'); ?>
                </button>
                <span class="spinner" style="float: none; margin: 0 10px;"></span>
            </form>
        </div>

        <!-- Existing API Keys Table -->
        <div class="ascii-keys-table-wrapper">
            <h3><?php esc_html_e('Existing API Keys', 'ascii-desktop-control'); ?></h3>
            <?php if (empty($existing_keys)) : ?>
                <p class="ascii-no-keys-message">
                    <?php esc_html_e('No API keys have been generated yet.', 'ascii-desktop-control'); ?>
                </p>
            <?php else : ?>
                <table class="wp-list-table widefat fixed striped" id="ascii-api-keys-table">
                    <thead>
                        <tr>
                            <th scope="col" class="manage-column column-name" style="width: 25%;">
                                <?php esc_html_e('Key Name', 'ascii-desktop-control'); ?>
                            </th>
                            <th scope="col" class="manage-column column-created" style="width: 20%;">
                                <?php esc_html_e('Created', 'ascii-desktop-control'); ?>
                            </th>
                            <th scope="col" class="manage-column column-last-used" style="width: 20%;">
                                <?php esc_html_e('Last Used', 'ascii-desktop-control'); ?>
                            </th>
                            <th scope="col" class="manage-column column-actions" style="width: 15%;">
                                <?php esc_html_e('Actions', 'ascii-desktop-control'); ?>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($existing_keys as $key) : ?>
                            <tr data-key-id="<?php echo esc_attr($key['id']); ?>">
                                <td class="column-name">
                                    <strong><?php echo esc_html($key['name']); ?></strong>
                                </td>
                                <td class="column-created">
                                    <?php echo esc_html($key['created'] ?? __('Never', 'ascii-desktop-control')); ?>
                                </td>
                                <td class="column-last-used">
                                    <?php echo esc_html($key['last_used'] ?? __('Never', 'ascii-desktop-control')); ?>
                                </td>
                                <td class="column-actions">
                                    <button type="button"
                                            class="button button-small ascii-revoke-key"
                                            data-key-id="<?php echo esc_attr($key['id']); ?>"
                                            data-key-name="<?php echo esc_attr($key['name']); ?>">
                                        <?php esc_html_e('Revoke', 'ascii-desktop-control'); ?>
                                    </button>
                                    <span class="spinner" style="float: none; margin-left: 5px;"></span>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
        </div>
    </div>

    <!-- Modal for displaying new API key (one-time display) -->
    <div id="ascii-key-modal" class="ascii-modal" style="display: none;">
        <div class="ascii-modal-overlay"></div>
        <div class="ascii-modal-content" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 5px 30px rgba(0,0,0,0.3); z-index: 100001; max-width: 600px; width: 90%;">
            <h2 style="margin-top: 0; color: #0073aa;">
                <?php esc_html_e('API Key Generated', 'ascii-desktop-control'); ?>
            </h2>
            <div class="ascii-modal-warning" style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 4px; padding: 15px; margin-bottom: 20px;">
                <p style="margin: 0; font-weight: bold; color: #856404;">
                    <span class="dashicons dashicons-warning" style="color: #ffc107;"></span>
                    <?php esc_html_e('Important: Copy this key now!', 'ascii-desktop-control'); ?>
                </p>
                <p style="margin: 10px 0 0 0; color: #856404;">
                    <?php esc_html_e('This is the only time you will see this key. It cannot be retrieved later for security reasons.', 'ascii-desktop-control'); ?>
                </p>
            </div>
            <div class="ascii-key-display" style="margin-bottom: 20px;">
                <label style="font-weight: bold; display: block; margin-bottom: 5px;">
                    <?php esc_html_e('Your API Key:', 'ascii-desktop-control'); ?>
                </label>
                <div style="display: flex; gap: 10px;">
                    <input type="text"
                           id="ascii-new-key-value"
                           readonly
                           style="flex: 1; font-family: monospace; font-size: 14px; padding: 10px; background: #f7f7f7; border: 1px solid #ddd; border-radius: 4px;">
                    <button type="button"
                            id="ascii-copy-key-btn"
                            class="button button-secondary"
                            style="padding: 10px 15px;">
                        <?php esc_html_e('Copy', 'ascii-desktop-control'); ?>
                    </button>
                </div>
                <span id="ascii-copy-feedback" style="display: none; color: green; margin-left: 10px;">
                    <?php esc_html_e('Copied!', 'ascii-desktop-control'); ?>
                </span>
            </div>
            <div class="ascii-modal-actions" style="text-align: right;">
                <button type="button" id="ascii-close-modal-btn" class="button button-primary">
                    <?php esc_html_e('I have copied the key', 'ascii-desktop-control'); ?>
                </button>
            </div>
        </div>
    </div>
</div>

<style>
.ascii-modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.6);
    z-index: 100000;
}
.ascii-api-keys-section .spinner {
    visibility: hidden;
}
.ascii-api-keys-section .spinner.is-active {
    visibility: visible;
}
#ascii-api-keys-table .column-actions {
    text-align: left;
}
#ascii-api-keys-table .ascii-revoke-key {
    color: #a00;
}
#ascii-api-keys-table .ascii-revoke-key:hover {
    color: #dc3232;
    border-color: #dc3232;
}
.ascii-key-row-deleting {
    opacity: 0.5;
}
</style>

<script>
jQuery(document).ready(function($) {
    'use strict';

    // AJAX URL and nonce for localized data
    var ajaxUrl = '<?php echo esc_url(admin_url('admin-ajax.php')); ?>';

    /**
     * Generate API Key Form Submit
     */
    $('#ascii-generate-key-form').on('submit', function(e) {
        e.preventDefault();

        var $form = $(this);
        var $spinner = $form.find('.spinner');
        var $submitBtn = $form.find('button[type="submit"]');
        var keyName = $('#ascii-key-name').val().trim();

        if (!keyName) {
            alert('<?php esc_html_e('Please enter a name for the API key.', 'ascii-desktop-control'); ?>');
            return;
        }

        // Show loading state
        $spinner.addClass('is-active');
        $submitBtn.prop('disabled', true);

        $.ajax({
            url: ajaxUrl,
            type: 'POST',
            data: {
                action: 'ascii_generate_api_key',
                key_name: keyName,
                nonce: $('#ascii-generate-key-form input[name="nonce"]').val()
            },
            success: function(response) {
                if (response.success) {
                    // Show modal with the new key
                    showKeyModal(response.data.key, response.data.key_id, response.data.name);
                    // Clear the form
                    $('#ascii-key-name').val('');
                    // Add the new key to the table
                    addKeyToTable(response.data.key_id, response.data.name, response.data.created);
                } else {
                    alert(response.data.message || '<?php esc_html_e('Failed to generate API key.', 'ascii-desktop-control'); ?>');
                }
            },
            error: function() {
                alert('<?php esc_html_e('An error occurred. Please try again.', 'ascii-desktop-control'); ?>');
            },
            complete: function() {
                $spinner.removeClass('is-active');
                $submitBtn.prop('disabled', false);
            }
        });
    });

    /**
     * Revoke API Key Button Click
     */
    $(document).on('click', '.ascii-revoke-key', function(e) {
        e.preventDefault();

        var $btn = $(this);
        var keyId = $btn.data('key-id');
        var keyName = $btn.data('key-name');
        var $row = $btn.closest('tr');
        var $spinner = $row.find('.spinner');

        if (!confirm('<?php esc_html_e('Are you sure you want to revoke the API key "', 'ascii-desktop-control'); ?>' + keyName + '"?\n\n<?php esc_html_e('This action cannot be undone.', 'ascii-desktop-control'); ?>')) {
            return;
        }

        // Show loading state
        $spinner.addClass('is-active');
        $btn.prop('disabled', true);
        $row.addClass('ascii-key-row-deleting');

        $.ajax({
            url: ajaxUrl,
            type: 'POST',
            data: {
                action: 'ascii_revoke_api_key',
                key_id: keyId,
                nonce: '<?php echo esc_js(wp_create_nonce('ascii_revoke_api_key')); ?>'
            },
            success: function(response) {
                if (response.success) {
                    // Remove the row with animation
                    $row.fadeOut(300, function() {
                        $(this).remove();
                        // Check if table is now empty
                        if ($('#ascii-api-keys-table tbody tr').length === 0) {
                            location.reload(); // Reload to show "no keys" message
                        }
                    });
                } else {
                    alert(response.data.message || '<?php esc_html_e('Failed to revoke API key.', 'ascii-desktop-control'); ?>');
                    $row.removeClass('ascii-key-row-deleting');
                    $btn.prop('disabled', false);
                }
            },
            error: function() {
                alert('<?php esc_html_e('An error occurred. Please try again.', 'ascii-desktop-control'); ?>');
                $row.removeClass('ascii-key-row-deleting');
                $btn.prop('disabled', false);
            },
            complete: function() {
                $spinner.removeClass('is-active');
            }
        });
    });

    /**
     * Show the modal with the new API key
     */
    function showKeyModal(keyValue, keyId, keyName) {
        var $modal = $('#ascii-key-modal');
        var $keyInput = $('#ascii-new-key-value');

        $keyInput.val(keyValue);
        $modal.show();

        // Focus on the input and select all
        $keyInput.focus().select();
    }

    /**
     * Copy API key to clipboard
     */
    $('#ascii-copy-key-btn').on('click', function() {
        var $keyInput = $('#ascii-new-key-value');
        var $feedback = $('#ascii-copy-feedback');

        $keyInput.select();

        try {
            if (document.execCommand('copy')) {
                $feedback.fadeIn(200).delay(2000).fadeOut(200);
            }
        } catch (err) {
            // Fallback: prompt user to copy manually
            prompt('<?php esc_html_e('Copy this key (Ctrl+C):', 'ascii-desktop-control'); ?>', $keyInput.val());
        }
    });

    /**
     * Close modal
     */
    $('#ascii-close-modal-btn, .ascii-modal-overlay').on('click', function() {
        $('#ascii-key-modal').hide();
    });

    /**
     * Add a new key row to the table
     */
    function addKeyToTable(keyId, keyName, created) {
        var $table = $('#ascii-api-keys-table');

        // If no table exists (first key), reload page
        if ($table.length === 0) {
            location.reload();
            return;
        }

        var newRow = '<tr data-key-id="' + escapeHtml(keyId) + '">' +
            '<td class="column-name"><strong>' + escapeHtml(keyName) + '</strong></td>' +
            '<td class="column-created">' + escapeHtml(created) + '</td>' +
            '<td class="column-last-used"><?php esc_html_e('Never', 'ascii-desktop-control'); ?></td>' +
            '<td class="column-actions">' +
                '<button type="button" class="button button-small ascii-revoke-key" ' +
                'data-key-id="' + escapeHtml(keyId) + '" ' +
                'data-key-name="' + escapeHtml(keyName) + '">' +
                '<?php esc_html_e('Revoke', 'ascii-desktop-control'); ?></button>' +
                '<span class="spinner" style="float: none; margin-left: 5px;"></span>' +
            '</td>' +
        '</tr>';

        // Hide "no keys" message if visible
        $('.ascii-no-keys-message').hide();

        // Add new row at top of table body
        $table.find('tbody').prepend(newRow);
    }

    /**
     * Escape HTML entities
     */
    function escapeHtml(text) {
        var div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    // Prevent accidental page leave with open modal
    $(window).on('beforeunload', function() {
        if ($('#ascii-key-modal').is(':visible')) {
            return '<?php esc_html_e('You have an API key displayed. Make sure you have copied it before leaving!', 'ascii-desktop-control'); ?>';
        }
    });
});
</script>
