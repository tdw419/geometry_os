<?php
/**
 * Token Usage Tracker
 *
 * Logs and analyzes token usage from the LLM proxy.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Geometry_OS_Token_Tracker
 *
 * Manages token usage logging and analytics.
 */
class Geometry_OS_Token_Tracker
{
    /**
     * Database table name
     *
     * @var string
     */
    private $table_name;

    /**
     * Constructor
     */
    public function __construct()
    {
        global $wpdb;
        $this->table_name = $wpdb->prefix . 'geometry_os_llm_usage';
    }

    /**
     * Create database table
     *
     * @return bool True if table created or exists
     */
    public function create_table()
    {
        global $wpdb;
        $charset_collate = $wpdb->get_charset_collate();

        $sql = "CREATE TABLE IF NOT EXISTS {$this->table_name} (
            id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            timestamp datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
            model varchar(100) NOT NULL,
            tokens_prompt int(11) NOT NULL DEFAULT 0,
            tokens_completion int(11) NOT NULL DEFAULT 0,
            tokens_total int(11) NOT NULL DEFAULT 0,
            source_worktree varchar(100) DEFAULT NULL,
            task_type varchar(50) DEFAULT NULL,
            fallback_triggered tinyint(1) NOT NULL DEFAULT 0,
            PRIMARY KEY (id),
            KEY idx_timestamp (timestamp),
            KEY idx_model (model),
            KEY idx_fallback (fallback_triggered),
            KEY idx_worktree (source_worktree)
        ) $charset_collate;";

        require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
        dbDelta($sql);

        return $this->table_exists();
    }

    /**
     * Check if table exists
     *
     * @return bool
     */
    public function table_exists()
    {
        global $wpdb;
        $table = $wpdb->prefix . 'geometry_os_llm_usage';
        $result = $wpdb->get_var("SHOW TABLES LIKE '{$table}'");
        return $result === $table;
    }

    /**
     * Log token usage
     *
     * @param array $data Usage data
     * @return int|false Insert ID or false on failure
     */
    public function log_usage($data)
    {
        if (!$this->table_exists()) {
            return false;
        }

        global $wpdb;

        $insert = [
            'model'             => sanitize_text_field($data['model'] ?? 'unknown'),
            'tokens_prompt'     => (int) ($data['tokens_prompt'] ?? 0),
            'tokens_completion' => (int) ($data['tokens_completion'] ?? 0),
            'tokens_total'      => (int) (($data['tokens_prompt'] ?? 0) + ($data['tokens_completion'] ?? 0)),
            'source_worktree'   => isset($data['source_worktree']) ? sanitize_text_field($data['source_worktree']) : null,
            'task_type'         => isset($data['task_type']) ? sanitize_text_field($data['task_type']) : null,
            'fallback_triggered' => isset($data['fallback_triggered']) ? (int) $data['fallback_triggered'] : 0,
        ];

        return $wpdb->insert($this->table_name, $insert);
    }

    /**
     * Get token usage for current hour
     *
     * @return int Total tokens used this hour
     */
    public function get_usage_current_hour()
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT COALESCE(SUM(tokens_total), 0) FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL 1 HOUR)",
            []
        );

        return (int) $wpdb->get_var($sql);
    }

    /**
     * Get token usage for today
     *
     * @return int Total tokens used today
     */
    public function get_usage_today()
    {
        global $wpdb;

        $sql = "SELECT COALESCE(SUM(tokens_total), 0) FROM {$this->table_name}
                WHERE DATE(timestamp) = CURDATE()";

        return (int) $wpdb->get_var($sql);
    }

    /**
     * Get token usage for this week
     *
     * @return int Total tokens used this week
     */
    public function get_usage_week()
    {
        global $wpdb;

        $sql = "SELECT COALESCE(SUM(tokens_total), 0) FROM {$this->table_name}
                WHERE YEARWEEK(timestamp, 1) = YEARWEEK(CURDATE(), 1)";

        return (int) $wpdb->get_var($sql);
    }

    /**
     * Get token usage for a time period
     *
     * @param int $seconds Seconds in the past
     * @return int Total tokens used
     */
    public function get_token_usage($seconds)
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT COALESCE(SUM(tokens_total), 0) FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d SECOND)",
            $seconds
        );

        return (int) $wpdb->get_var($sql);
    }

    /**
     * Get request count for a time period
     *
     * @param int $seconds Seconds in the past
     * @return int Request count
     */
    public function get_request_count($seconds)
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT COUNT(*) FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d SECOND)",
            $seconds
        );

        return (int) $wpdb->get_var($sql);
    }

    /**
     * Get usage by model
     *
     * @param int $seconds Seconds in the past
     * @return array Usage data by model
     */
    public function get_usage_by_model($seconds)
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT model,
                    COUNT(*) as requests,
                    SUM(tokens_total) as tokens,
                    SUM(fallback_triggered) as fallbacks
            FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d SECOND)
            GROUP BY model
            ORDER BY tokens DESC",
            $seconds
        );

        $results = $wpdb->get_results($sql, ARRAY_A);

        $by_model = [];
        foreach ($results as $row) {
            $by_model[$row['model']] = [
                'requests'   => (int) $row['requests'],
                'tokens'     => (int) $row['tokens'],
                'fallbacks'  => (int) $row['fallbacks'],
            ];
        }

        return $by_model;
    }

    /**
     * Get usage by hour
     *
     * @param int $seconds Seconds in the past
     * @return array Usage data by hour
     */
    public function get_usage_by_hour($seconds)
    {
        global $wpdb;

        $hours = (int) ceil($seconds / HOUR_IN_SECONDS);

        $sql = $wpdb->prepare(
            "SELECT HOUR(timestamp) as hour,
                    SUM(tokens_total) as tokens,
                    COUNT(*) as requests
            FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d SECOND)
            GROUP BY HOUR(timestamp)
            ORDER BY hour",
            $seconds
        );

        $results = $wpdb->get_results($sql, ARRAY_A);

        // Fill in missing hours with zeros
        $by_hour = array_fill(0, 24, ['tokens' => 0, 'requests' => 0]);

        foreach ($results as $row) {
            $by_hour[$row['hour']] = [
                'tokens'   => (int) $row['tokens'],
                'requests' => (int) $row['requests'],
            ];
        }

        return array_values($by_hour);
    }

    /**
     * Get fallback rate
     *
     * @param int $seconds Seconds in the past
     * @return float Fallback rate as percentage
     */
    public function get_fallback_rate($seconds)
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT
                COUNT(*) as total,
                SUM(fallback_triggered) as fallbacks
            FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d SECOND)",
            $seconds
        );

        $result = $wpdb->get_row($sql, ARRAY_A);

        if (!$result || $result['total'] == 0) {
            return 0.0;
        }

        return round(($result['fallbacks'] / $result['total']) * 100, 2);
    }

    /**
     * Prune old log entries
     *
     * @param int $days Keep logs newer than this many days
     * @return int|false Number of rows deleted or false on failure
     */
    public function prune_old_entries($days = 30)
    {
        if (!$this->table_exists()) {
            return false;
        }

        global $wpdb;

        return $wpdb->query(
            $wpdb->prepare(
                "DELETE FROM {$this->table_name}
                WHERE timestamp < DATE_SUB(NOW(), INTERVAL %d DAY)",
                $days
            )
        );
    }

    /**
     * Get usage statistics summary
     *
     * @param int $days Number of days to analyze
     * @return array Summary statistics
     */
    public function get_summary_stats($days = 7)
    {
        global $wpdb;

        $sql = $wpdb->prepare(
            "SELECT
                COUNT(*) as total_requests,
                SUM(tokens_total) as total_tokens,
                SUM(tokens_prompt) as total_prompt,
                SUM(tokens_completion) as total_completion,
                SUM(fallback_triggered) as total_fallbacks,
                AVG(tokens_total) as avg_tokens_per_request,
                MAX(tokens_total) as max_tokens_single
            FROM {$this->table_name}
            WHERE timestamp >= DATE_SUB(NOW(), INTERVAL %d DAY)",
            $days
        );

        $result = $wpdb->get_row($sql, ARRAY_A);

        return [
            'total_requests'        => (int) ($result['total_requests'] ?? 0),
            'total_tokens'          => (int) ($result['total_tokens'] ?? 0),
            'total_prompt_tokens'   => (int) ($result['total_prompt'] ?? 0),
            'total_completion_tokens' => (int) ($result['total_completion'] ?? 0),
            'total_fallbacks'       => (int) ($result['total_fallbacks'] ?? 0),
            'avg_tokens_per_request' => round((float) ($result['avg_tokens_per_request'] ?? 0), 2),
            'max_tokens_single'     => (int) ($result['max_tokens_single'] ?? 0),
            'fallback_rate'         => $result['total_requests'] > 0
                ? round((($result['total_fallbacks'] ?? 0) / $result['total_requests']) * 100, 2)
                : 0,
        ];
    }
}
