<?php
/**
 * Uninstall Plugin
 *
 * Removes database tables and options when plugin is uninstalled.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('WP_UNINSTALL_PLUGIN')) {
    exit;
}

/**
 * Drop database table
 */
function geometry_os_llm_drop_table()
{
    global $wpdb;
    $table_name = $wpdb->prefix . 'geometry_os_llm_usage';

    $wpdb->query("DROP TABLE IF EXISTS {$table_name}");
}

/**
 * Delete plugin options
 */
function geometry_os_llm_delete_options()
{
    $options = [
        'geometry_os_llm_router_port',
        'geometry_os_llm_router_primary_model',
        'geometry_os_llm_router_fallback_model',
        'geometry_os_llm_router_fallback_enabled',
        'geometry_os_llm_fallback_log',
    ];

    foreach ($options as $option) {
        delete_option($option);
    }
}

/**
 * Clean up transients
 */
function geometry_os_llm_delete_transients()
{
    // Delete any transients used by the plugin
    delete_transient('geometry_os_llm_router_status');
    delete_transient('geometry_os_llm_proxy_health');
}

// Execute cleanup
geometry_os_llm_drop_table();
geometry_os_llm_delete_options();
geometry_os_llm_delete_transients();
