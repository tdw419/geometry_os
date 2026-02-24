<?php
/**
 * World of Rectification - Scribe Protocol Database
 *
 * Handles database table creation for Scribe Protocol feature.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Scribe_DB {

    /**
     * Create Scribe Protocol database tables
     */
    public static function create_tables(): void {
        global $wpdb;
        $charset_collate = $wpdb->get_charset_collate();

        require_once ABSPATH . 'wp-admin/includes/upgrade.php';

        // Scribes table - expert mentors
        $sql_scribes = "CREATE TABLE {$wpdb->prefix}wor_scribes (
            id BIGINT(20) NOT NULL AUTO_INCREMENT,
            user_id BIGINT(20) NOT NULL,
            cohort ENUM('internal', 'community', 'domain_expert') NOT NULL DEFAULT 'community',
            expertise_tags JSON,
            onboarding_completed TINYINT(1) DEFAULT 0,
            onboarding_step INT DEFAULT 0,
            mentorship_count INT DEFAULT 0,
            avg_sprout_rating DECIMAL(3,2) DEFAULT NULL,
            ghost_training_eligible TINYINT(1) DEFAULT 0,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            UNIQUE KEY user_id (user_id)
        ) {$charset_collate};";

        // Sprouts table - newcomers seeking help
        $sql_sprouts = "CREATE TABLE {$wpdb->prefix}wor_sprouts (
            id BIGINT(20) NOT NULL AUTO_INCREMENT,
            user_id BIGINT(20) NOT NULL,
            primary_sefirah VARCHAR(50) DEFAULT NULL,
            current_quest_id BIGINT(20) DEFAULT NULL,
            assigned_scribe_id BIGINT(20) DEFAULT NULL,
            total_sessions INT DEFAULT 0,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            UNIQUE KEY user_id (user_id),
            KEY assigned_scribe_id (assigned_scribe_id)
        ) {$charset_collate};";

        // Transmissions table - chat sessions
        $sql_transmissions = "CREATE TABLE {$wpdb->prefix}wor_transmissions (
            id BIGINT(20) NOT NULL AUTO_INCREMENT,
            scribe_id BIGINT(20) NOT NULL,
            sprout_id BIGINT(20) NOT NULL,
            quest_context_id BIGINT(20) DEFAULT NULL,
            status ENUM('active', 'completed', 'abandoned') DEFAULT 'active',
            started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            ended_at DATETIME DEFAULT NULL,
            duration_seconds INT DEFAULT NULL,
            scribe_rating INT DEFAULT NULL,
            sprout_feedback TEXT,
            PRIMARY KEY (id),
            KEY scribe_id (scribe_id),
            KEY sprout_id (sprout_id),
            KEY status (status)
        ) {$charset_collate};";

        // Transmission messages table - chat logs
        $sql_transmission_messages = "CREATE TABLE {$wpdb->prefix}wor_transmission_messages (
            id BIGINT(20) NOT NULL AUTO_INCREMENT,
            transmission_id BIGINT(20) NOT NULL,
            sender_type ENUM('scribe', 'sprout', 'system') NOT NULL,
            sender_id BIGINT(20) NOT NULL,
            message_text TEXT NOT NULL,
            intent_label VARCHAR(100) DEFAULT NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            KEY transmission_id (transmission_id)
        ) {$charset_collate};";

        // Intent clusters table - AI training data
        $sql_intent_clusters = "CREATE TABLE {$wpdb->prefix}wor_intent_clusters (
            id BIGINT(20) NOT NULL AUTO_INCREMENT,
            intent_name VARCHAR(100) NOT NULL,
            description TEXT,
            sample_phrases JSON,
            message_count INT DEFAULT 0,
            accuracy_score DECIMAL(4,3) DEFAULT NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            UNIQUE KEY intent_name (intent_name)
        ) {$charset_collate};";

        dbDelta($sql_scribes);
        dbDelta($sql_sprouts);
        dbDelta($sql_transmissions);
        dbDelta($sql_transmission_messages);
        dbDelta($sql_intent_clusters);
    }
}
