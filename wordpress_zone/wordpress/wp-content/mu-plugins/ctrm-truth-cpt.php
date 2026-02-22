<?php
/**
 * Plugin Name: CTRM Truth Custom Post Types
 * Description: Registers custom post types for CTRM/TMS integration (truth_entry, ansmo_cycle)
 * Version: 0.1
 * Author: Geometry OS Agent
 */

if (!defined('ABSPATH')) exit;

/**
 * Register CTRM custom post types on init
 */
add_action('init', 'ctrm_register_custom_post_types');

function ctrm_register_custom_post_types() {
    // Register truth_entry custom post type
    register_post_type('truth_entry', array(
        'labels' => array(
            'name'               => 'Truth Entries',
            'singular_name'      => 'Truth Entry',
            'add_new'            => 'Add New Truth',
            'add_new_item'       => 'Add New Truth Entry',
            'edit_item'          => 'Edit Truth Entry',
            'new_item'           => 'New Truth Entry',
            'view_item'          => 'View Truth Entry',
            'search_items'       => 'Search Truth Entries',
            'not_found'          => 'No truth entries found',
            'not_found_in_trash' => 'No truth entries found in trash',
        ),
        'public'        => true,
        'has_archive'   => true,
        'show_in_rest'  => true,
        'supports'      => array('title', 'editor', 'custom-fields'),
        'rewrite'       => array('slug' => 'truths'),
        'show_admin_column' => true,
    ));

    // Register ansmo_cycle custom post type
    register_post_type('ansmo_cycle', array(
        'labels' => array(
            'name'               => 'ANSMO Cycles',
            'singular_name'      => 'ANSMO Cycle',
            'add_new'            => 'Add New Cycle',
            'add_new_item'       => 'Add New ANSMO Cycle',
            'edit_item'          => 'Edit ANSMO Cycle',
            'new_item'           => 'New ANSMO Cycle',
            'view_item'          => 'View ANSMO Cycle',
            'search_items'       => 'Search ANSMO Cycles',
            'not_found'          => 'No ANSMO cycles found',
            'not_found_in_trash' => 'No ANSMO cycles found in trash',
        ),
        'public'        => true,
        'has_archive'   => true,
        'show_in_rest'  => true,
        'supports'      => array('title', 'editor', 'custom-fields'),
        'rewrite'       => array('slug' => 'ansmo-cycles'),
        'show_admin_column' => true,
    ));
}

/**
 * Register meta boxes for truth_entry
 */
add_action('init', 'ctrm_register_truth_meta');

function ctrm_register_truth_meta() {
    register_post_meta('truth_entry', 'truth_id', array(
        'type'          => 'string',
        'description'   => 'Unique identifier for the truth entry',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'confidence', array(
        'type'          => 'number',
        'description'   => 'Confidence score (0-1)',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'transparency_score', array(
        'type'          => 'number',
        'description'   => 'Transparency score (0-1)',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'evidence', array(
        'type'          => 'string',
        'description'   => 'Evidence supporting the truth claim',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'reasoning_path', array(
        'type'          => 'string',
        'description'   => 'JSON-encoded reasoning path',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'agent_id', array(
        'type'          => 'string',
        'description'   => 'ID of the agent that logged this truth',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('truth_entry', 'subject', array(
        'type'          => 'string',
        'description'   => 'Subject of the truth claim',
        'single'        => true,
        'show_in_rest'  => true,
    ));
}

/**
 * Register meta boxes for ansmo_cycle
 */
add_action('init', 'ctrm_register_ansmo_meta');

function ctrm_register_ansmo_meta() {
    register_post_meta('ansmo_cycle', 'cycle_id', array(
        'type'          => 'string',
        'description'   => 'Unique identifier for the ANSMO cycle',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('ansmo_cycle', 'phase', array(
        'type'          => 'string',
        'description'   => 'ANSMO phase (introspection|synthesis|optimization)',
        'single'        => true,
        'show_in_rest'  => true,
    ));

    register_post_meta('ansmo_cycle', 'improvement_delta', array(
        'type'          => 'number',
        'description'   => 'Improvement delta value',
        'single'        => true,
        'show_in_rest'  => true,
    ));
}
