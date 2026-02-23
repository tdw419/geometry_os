<?php
/**
 * Admin settings page for Geometry OS Map plugin
 *
 * Provides configuration UI under Settings menu.
 *
 * @package Geometry_OS_Map
 */

if (!defined('ABSPATH')) exit;

/**
 * Settings class for Geometry OS Map
 */
class Geometry_OS_Map_Settings {

    /**
     * Constructor - hooks into WordPress
     */
    public function __construct() {
        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_init', [$this, 'register_settings']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_admin_styles']);
    }

    /**
     * Add settings page under Settings menu
     *
     * @return void
     */
    public function add_menu() {
        add_options_page(
            __('Geometry OS Map Settings', 'geometry-os-map'),
            __('Geometry OS Map', 'geometry-os-map'),
            'manage_options',
            'geometry-os-map',
            [$this, 'render_settings_page']
        );
    }

    /**
     * Enqueue admin styles for settings page
     *
     * @param string $hook Current admin page hook
     * @return void
     */
    public function enqueue_admin_styles($hook) {
        if ($hook !== 'settings_page_geometry-os-map') {
            return;
        }
        wp_enqueue_style(
            'geometry-os-map-admin',
            GEOMETRY_OS_MAP_URL . 'assets/css/admin.css',
            [],
            '1.0.0'
        );
    }

    /**
     * Register settings and fields
     *
     * @return void
     */
    public function register_settings() {
        // Register settings with sanitization callbacks
        register_setting(
            'geometry_os_map_settings',
            'geometry_os_map_asset_base',
            [
                'type'              => 'string',
                'sanitize_callback' => [$this, 'sanitize_url'],
                'default'           => 'http://localhost:8000',
            ]
        );

        register_setting(
            'geometry_os_map_settings',
            'geometry_os_map_default_width',
            [
                'type'              => 'string',
                'sanitize_callback' => 'sanitize_text_field',
                'default'           => '100%',
            ]
        );

        register_setting(
            'geometry_os_map_settings',
            'geometry_os_map_default_height',
            [
                'type'              => 'string',
                'sanitize_callback' => 'sanitize_text_field',
                'default'           => '600px',
            ]
        );

        register_setting(
            'geometry_os_map_settings',
            'geometry_os_map_default_theme',
            [
                'type'              => 'string',
                'sanitize_callback' => [$this, 'sanitize_theme'],
                'default'           => 'dark',
            ]
        );

        register_setting(
            'geometry_os_map_settings',
            'geometry_os_map_show_tutorial',
            [
                'type'              => 'boolean',
                'sanitize_callback' => [$this, 'sanitize_checkbox'],
                'default'           => true,
            ]
        );

        // Add settings section
        add_settings_section(
            'geometry_os_map_main',
            __('Configuration', 'geometry-os-map'),
            [$this, 'render_section_description'],
            'geometry-os-map'
        );

        // Add fields
        add_settings_field(
            'geometry_os_map_asset_base',
            __('Asset Base URL', 'geometry-os-map'),
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_main',
            [
                'name'        => 'geometry_os_map_asset_base',
                'description' => __('The base URL where Geometry OS visual shell assets are served.', 'geometry-os-map'),
                'type'        => 'url',
            ]
        );

        add_settings_field(
            'geometry_os_map_default_width',
            __('Default Width', 'geometry-os-map'),
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_main',
            [
                'name'        => 'geometry_os_map_default_width',
                'description' => __('Default width for map containers (CSS value).', 'geometry-os-map'),
                'type'        => 'text',
            ]
        );

        add_settings_field(
            'geometry_os_map_default_height',
            __('Default Height', 'geometry-os-map'),
            [$this, 'render_field'],
            'geometry-os-map',
            'geometry_os_map_main',
            [
                'name'        => 'geometry_os_map_default_height',
                'description' => __('Default height for map containers (CSS value).', 'geometry-os-map'),
                'type'        => 'text',
            ]
        );

        add_settings_field(
            'geometry_os_map_default_theme',
            __('Default Theme', 'geometry-os-map'),
            [$this, 'render_theme_field'],
            'geometry-os-map',
            'geometry_os_map_main',
            [
                'name'        => 'geometry_os_map_default_theme',
                'description' => __('Color theme for the map display.', 'geometry-os-map'),
            ]
        );

        add_settings_field(
            'geometry_os_map_show_tutorial',
            __('Show Tutorial', 'geometry-os-map'),
            [$this, 'render_checkbox_field'],
            'geometry-os-map',
            'geometry_os_map_main',
            [
                'name'        => 'geometry_os_map_show_tutorial',
                'description' => __('Display tutorial overlay when map loads.', 'geometry-os-map'),
            ]
        );
    }

    /**
     * Sanitize URL field
     *
     * @param string $value Input value
     * @return string Sanitized URL
     */
    public function sanitize_url($value) {
        return esc_url_raw(trim($value));
    }

    /**
     * Sanitize theme selection
     *
     * @param string $value Input value
     * @return string Sanitized theme value
     */
    public function sanitize_theme($value) {
        $valid_themes = ['dark', 'light', 'highContrast'];
        if (in_array($value, $valid_themes, true)) {
            return $value;
        }
        return 'dark';
    }

    /**
     * Sanitize checkbox (returns boolean)
     *
     * @param mixed $value Input value
     * @return bool Whether checkbox is checked
     */
    public function sanitize_checkbox($value) {
        return !empty($value);
    }

    /**
     * Render section description
     *
     * @return void
     */
    public function render_section_description() {
        echo '<p>' . esc_html__('Configure default settings for the Geometry OS Map plugin. These values are used when not overridden by shortcode attributes or filters.', 'geometry-os-map') . '</p>';
    }

    /**
     * Render a text/URL input field
     *
     * @param array $args Field arguments
     * @return void
     */
    public function render_field($args) {
        $name = isset($args['name']) ? $args['name'] : '';
        $description = isset($args['description']) ? $args['description'] : '';
        $type = isset($args['type']) ? $args['type'] : 'text';

        $value = get_option($name, '');
        $field_id = esc_attr($name);
        $field_name = esc_attr($name);

        printf(
            '<input type="%s" id="%s" name="%s" value="%s" class="regular-text" />',
            esc_attr($type),
            $field_id,
            $field_name,
            esc_attr($value)
        );

        if ($description) {
            printf(
                '<p class="description">%s</p>',
                esc_html($description)
            );
        }
    }

    /**
     * Render theme select field
     *
     * @param array $args Field arguments
     * @return void
     */
    public function render_theme_field($args) {
        $name = isset($args['name']) ? $args['name'] : '';
        $description = isset($args['description']) ? $args['description'] : '';

        $value = get_option($name, 'dark');
        $field_id = esc_attr($name);
        $field_name = esc_attr($name);

        $themes = [
            'dark'         => __('Dark', 'geometry-os-map'),
            'light'        => __('Light', 'geometry-os-map'),
            'highContrast' => __('High Contrast', 'geometry-os-map'),
        ];

        printf('<select id="%s" name="%s">', $field_id, $field_name);
        foreach ($themes as $theme_value => $theme_label) {
            printf(
                '<option value="%s" %s>%s</option>',
                esc_attr($theme_value),
                selected($value, $theme_value, false),
                esc_html($theme_label)
            );
        }
        echo '</select>';

        if ($description) {
            printf(
                '<p class="description">%s</p>',
                esc_html($description)
            );
        }
    }

    /**
     * Render checkbox field
     *
     * @param array $args Field arguments
     * @return void
     */
    public function render_checkbox_field($args) {
        $name = isset($args['name']) ? $args['name'] : '';
        $description = isset($args['description']) ? $args['description'] : '';

        $value = get_option($name, true);
        $field_id = esc_attr($name);
        $field_name = esc_attr($name);

        printf(
            '<label for="%s">',
            $field_id
        );
        printf(
            '<input type="checkbox" id="%s" name="%s" value="1" %s />',
            $field_id,
            $field_name,
            checked($value, true, false)
        );
        echo '</label>';

        if ($description) {
            printf(
                '<p class="description">%s</p>',
                esc_html($description)
            );
        }
    }

    /**
     * Render the settings page
     *
     * @return void
     */
    public function render_settings_page() {
        if (!current_user_can('manage_options')) {
            wp_die(esc_html__('You do not have sufficient permissions to access this page.', 'geometry-os-map'));
        }
        ?>
        <div class="wrap">
            <h1><?php echo esc_html(get_admin_page_title()); ?></h1>

            <form method="post" action="options.php">
                <?php
                settings_fields('geometry_os_map_settings');
                do_settings_sections('geometry-os-map');
                submit_button();
                ?>
            </form>

            <hr />

            <h2><?php esc_html_e('Usage Examples', 'geometry-os-map'); ?></h2>

            <h3><?php esc_html_e('Shortcode', 'geometry-os-map'); ?></h3>
            <p><?php esc_html_e('Use the shortcode in any post or page:', 'geometry-os-map'); ?></p>

            <table class="widefat">
                <thead>
                    <tr>
                        <th><?php esc_html_e('Usage', 'geometry-os-map'); ?></th>
                        <th><?php esc_html_e('Description', 'geometry-os-map'); ?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><code>[geometry_os_map]</code></td>
                        <td><?php esc_html_e('Uses all default settings from above.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>[geometry_os_map height="800px"]</code></td>
                        <td><?php esc_html_e('Override default height.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>[geometry_os_map width="80%" height="500px"]</code></td>
                        <td><?php esc_html_e('Custom width and height.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>[geometry_os_map mode="desktop"]</code></td>
                        <td><?php esc_html_e('Launch in desktop control mode.', 'geometry-os-map'); ?></td>
                    </tr>
                </tbody>
            </table>

            <h3><?php esc_html_e('PHP Function', 'geometry-os-map'); ?></h3>
            <p><?php esc_html_e('Use in theme templates:', 'geometry-os-map'); ?></p>
            <pre><?php echo esc_html("<?php\necho geometry_os_render_map(['height' => '800px']);\n?>"); ?></pre>

            <h3><?php esc_html_e('Filter Override', 'geometry-os-map'); ?></h3>
            <p><?php esc_html_e('Override the asset base URL programmatically:', 'geometry-os-map'); ?></p>
            <pre><?php echo esc_html("<?php\nadd_filter('geometry_os_asset_base_url', function() {\n    return 'https://your-server.com/assets';\n});\n?>"); ?></pre>

            <h3><?php esc_html_e('Attributes Reference', 'geometry-os-map'); ?></h3>
            <table class="widefat">
                <thead>
                    <tr>
                        <th><?php esc_html_e('Attribute', 'geometry-os-map'); ?></th>
                        <th><?php esc_html_e('Type', 'geometry-os-map'); ?></th>
                        <th><?php esc_html_e('Default', 'geometry-os-map'); ?></th>
                        <th><?php esc_html_e('Description', 'geometry-os-map'); ?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><code>width</code></td>
                        <td><?php esc_html_e('CSS width', 'geometry-os-map'); ?></td>
                        <td><?php echo esc_html(get_option('geometry_os_map_default_width', '100%')); ?></td>
                        <td><?php esc_html_e('Width of the map container.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>height</code></td>
                        <td><?php esc_html_e('CSS height', 'geometry-os-map'); ?></td>
                        <td><?php echo esc_html(get_option('geometry_os_map_default_height', '600px')); ?></td>
                        <td><?php esc_html_e('Height of the map container.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>fullscreen</code></td>
                        <td><?php esc_html_e('boolean', 'geometry-os-map'); ?></td>
                        <td>false</td>
                        <td><?php esc_html_e('Render in fullscreen mode.', 'geometry-os-map'); ?></td>
                    </tr>
                    <tr>
                        <td><code>mode</code></td>
                        <td><?php esc_html_e('string', 'geometry-os-map'); ?></td>
                        <td>""</td>
                        <td><?php esc_html_e('Application mode (e.g., "desktop").', 'geometry-os-map'); ?></td>
                    </tr>
                </tbody>
            </table>

            <h3><?php esc_html_e('Gutenberg Block', 'geometry-os-map'); ?></h3>
            <p><?php esc_html_e('In the block editor, search for "Geometry OS Map" and add it to your page. Configure options in the block sidebar.', 'geometry-os-map'); ?></p>

            <h3><?php esc_html_e('Full-Screen Template', 'geometry-os-map'); ?></h3>
            <p><?php esc_html_e('Create a new Page and select "Geometry OS Map (Full Screen)" from the Page Attributes template dropdown for an immersive experience.', 'geometry-os-map'); ?></p>
        </div>
        <?php
    }
}
