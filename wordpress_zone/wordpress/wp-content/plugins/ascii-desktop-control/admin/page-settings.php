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
</div>
