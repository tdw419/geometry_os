<?php
/**
 * Fallback Event Logger
 *
 * Tracks fallback events when Claude API is unavailable.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Geometry_OS_Fallback_Logger
 *
 * Logs and analyzes fallback events.
 */
class Geometry_OS_Fallback_Logger
{
    /**
     * WordPress option name for fallback log
     *
     * @var string
     */
    const OPTION_NAME = 'geometry_os_llm_fallback_log';

    /**
     * Maximum log entries to keep
     *
     * @var int
     */
    const MAX_ENTRIES = 1000;

    /**
     * Get all fallback log entries
     *
     * @return array Log entries
     */
    public function get_all()
    {
        $log = get_option(self::OPTION_NAME, []);

        if (!is_array($log)) {
            return [];
        }

        return $log;
    }

    /**
     * Log a fallback event
     *
     * @param array $event Event data
     * @return bool True if logged successfully
     */
    public function log_event($event = [])
    {
        $log = $this->get_all();

        $entry = [
            'timestamp' => current_time('mysql'),
            'timestamp_unix' => time(),
            'reason' => sanitize_text_field($event['reason'] ?? 'unknown'),
            'original_model' => sanitize_text_field($event['original_model'] ?? 'claude'),
            'fallback_model' => sanitize_text_field($event['fallback_model'] ?? 'local'),
            'source_worktree' => isset($event['source_worktree']) ? sanitize_text_field($event['source_worktree']) : null,
            'task_type' => isset($event['task_type']) ? sanitize_text_field($event['task_type']) : null,
        ];

        $log[] = $entry;

        // Prune old entries if needed
        if (count($log) > self::MAX_ENTRIES) {
            $log = array_slice($log, -self::MAX_ENTRIES, null, true);
        }

        return update_option(self::OPTION_NAME, $log);
    }

    /**
     * Get fallback count for today
     *
     * @return int Number of fallback events today
     */
    public function get_count_today()
    {
        $log = $this->get_all();
        $today_start = strtotime('today midnight');

        return count(array_filter($log, function($entry) use ($today_start) {
            return isset($entry['timestamp_unix']) && $entry['timestamp_unix'] >= $today_start;
        }));
    }

    /**
     * Get fallback count for this week
     *
     * @return int Number of fallback events this week
     */
    public function get_count_week()
    {
        $log = $this->get_all();
        $week_start = strtotime('monday this week');

        return count(array_filter($log, function($entry) use ($week_start) {
            return isset($entry['timestamp_unix']) && $entry['timestamp_unix'] >= $week_start;
        }));
    }

    /**
     * Get fallback count for a date range
     *
     * @param int $start_date Start timestamp
     * @param int $end_date End timestamp
     * @return int Number of fallback events in range
     */
    public function get_count_between($start_date, $end_date)
    {
        $log = $this->get_all();

        return count(array_filter($log, function($entry) use ($start_date, $end_date) {
            $ts = $entry['timestamp_unix'] ?? 0;
            return $ts >= $start_date && $ts <= $end_date;
        }));
    }

    /**
     * Get fallbacks by hour for the last 24 hours
     *
     * @return array Hourly fallback counts
     */
    public function get_fallbacks_by_hour()
    {
        $log = $this->get_all();
        $day_ago = time() - DAY_IN_SECONDS;

        $hourly = array_fill(0, 24, 0);

        foreach ($log as $entry) {
            $ts = $entry['timestamp_unix'] ?? 0;
            if ($ts >= $day_ago) {
                $hour = (int) date('H', $ts);
                $hourly[$hour]++;
            }
        }

        return $hourly;
    }

    /**
     * Get fallback reasons summary
     *
     * @param int $days Number of days to analyze
     * @return array Reasons and their counts
     */
    public function get_reasons_summary($days = 7)
    {
        $log = $this->get_all();
        $cutoff = time() - ($days * DAY_IN_SECONDS);

        $reasons = [];

        foreach ($log as $entry) {
            $ts = $entry['timestamp_unix'] ?? 0;
            if ($ts >= $cutoff) {
                $reason = $entry['reason'] ?? 'unknown';
                if (!isset($reasons[$reason])) {
                    $reasons[$reason] = 0;
                }
                $reasons[$reason]++;
            }
        }

        arsort($reasons);

        return $reasons;
    }

    /**
     * Get recent fallback events
     *
     * @param int $limit Number of events to return
     * @return array Recent events
     */
    public function get_recent($limit = 10)
    {
        $log = $this->get_all();

        // Reverse to get most recent first
        $reversed = array_reverse($log);

        return array_slice($reversed, 0, $limit);
    }

    /**
     * Clear all fallback logs
     *
     * @return bool True if cleared successfully
     */
    public function clear_all()
    {
        return update_option(self::OPTION_NAME, []);
    }

    /**
     * Prune old log entries
     *
     * @param int $days Keep entries newer than this many days
     * @return int Number of entries removed
     */
    public function prune_old($days = 30)
    {
        $log = $this->get_all();
        $cutoff = time() - ($days * DAY_IN_SECONDS);

        $original_count = count($log);
        $log = array_filter($log, function($entry) use ($cutoff) {
            return ($entry['timestamp_unix'] ?? 0) >= $cutoff;
        });

        // Re-index array
        $log = array_values($log);

        update_option(self::OPTION_NAME, $log);

        return $original_count - count($log);
    }

    /**
     * Get statistics summary
     *
     * @param int $days Number of days to analyze
     * @return array Statistics
     */
    public function get_stats($days = 7)
    {
        $log = $this->get_all();
        $cutoff = time() - ($days * DAY_IN_SECONDS);

        $stats = [
            'total' => 0,
            'by_reason' => [],
            'by_model' => [],
            'by_hour' => array_fill(0, 24, 0),
        ];

        foreach ($log as $entry) {
            $ts = $entry['timestamp_unix'] ?? 0;
            if ($ts >= $cutoff) {
                $stats['total']++;

                // Count by reason
                $reason = $entry['reason'] ?? 'unknown';
                if (!isset($stats['by_reason'][$reason])) {
                    $stats['by_reason'][$reason] = 0;
                }
                $stats['by_reason'][$reason]++;

                // Count by model
                $model = $entry['fallback_model'] ?? 'unknown';
                if (!isset($stats['by_model'][$model])) {
                    $stats['by_model'][$model] = 0;
                }
                $stats['by_model'][$model]++;

                // Count by hour
                $hour = (int) date('H', $ts);
                $stats['by_hour'][$hour]++;
            }
        }

        arsort($stats['by_reason']);
        arsort($stats['by_model']);

        return $stats;
    }
}
