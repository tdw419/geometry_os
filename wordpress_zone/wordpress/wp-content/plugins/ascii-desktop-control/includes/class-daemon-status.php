<?php
/**
 * Daemon Status class.
 *
 * Checks daemon process status using pgrep with transient caching.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Daemon_Status
 *
 * Provides daemon running status with 30-second transient cache.
 */
class Daemon_Status {

    /**
     * Transient cache TTL in seconds.
     */
    private const CACHE_TTL = 30;

    /**
     * Transient key for cached status.
     */
    private const CACHE_KEY = 'ascii_daemon_status';

    /**
     * Daemon process name to check.
     */
    private const DAEMON_PROCESS = 'directive_daemon.py';

    /**
     * Check if the daemon is running.
     *
     * Uses transient cache to avoid excessive shell exec calls.
     *
     * @param bool $force_check Bypass cache and force fresh check.
     * @return bool True if daemon is running, false otherwise.
     */
    public function is_running(bool $force_check = false): bool {
        $status = $this->get_status($force_check);
        return $status['running'];
    }

    /**
     * Get daemon status with caching.
     *
     * @param bool $force_check Bypass cache and force fresh check.
     * @return array Status array with 'running', 'last_check', and 'pid' keys.
     */
    public function get_status(bool $force_check = false): array {
        // Check cache first (unless force check)
        if (!$force_check) {
            $cached = get_transient(self::CACHE_KEY);
            if ($cached !== false) {
                return $cached;
            }
        }

        // Perform fresh status check
        $status = $this->check_daemon_process();

        // Cache the result
        set_transient(self::CACHE_KEY, $status, self::CACHE_TTL);

        return $status;
    }

    /**
     * Check daemon process using pgrep.
     *
     * @return array Status array with running, last_check, and pid.
     */
    private function check_daemon_process(): array {
        $status = [
            'running' => false,
            'last_check' => current_time('mysql'),
            'pid' => null,
            'process_name' => self::DAEMON_PROCESS,
        ];

        // Use pgrep to find daemon process
        $command = sprintf(
            'pgrep -f %s 2>/dev/null',
            escapeshellarg(self::DAEMON_PROCESS)
        );

        $output = shell_exec($command);

        if ($output !== null && trim($output) !== '') {
            // Process found - extract PID
            $pids = preg_split('/\s+/', trim($output));
            if (!empty($pids) && is_numeric($pids[0])) {
                $status['running'] = true;
                $status['pid'] = (int) $pids[0];
            }
        }

        return $status;
    }

    /**
     * Clear the cached status.
     *
     * @return bool True if cache was cleared, false otherwise.
     */
    public function clear_cache(): bool {
        return delete_transient(self::CACHE_KEY);
    }

    /**
     * Get cache TTL.
     *
     * @return int Cache TTL in seconds.
     */
    public function get_cache_ttl(): int {
        return self::CACHE_TTL;
    }

    /**
     * Get daemon process name.
     *
     * @return string Process name being monitored.
     */
    public function get_process_name(): string {
        return self::DAEMON_PROCESS;
    }

    /**
     * Get time since last check.
     *
     * @return int|null Seconds since last check, or null if never checked.
     */
    public function get_seconds_since_check(): ?int {
        $status = get_transient(self::CACHE_KEY);

        if ($status === false) {
            return null;
        }

        $last_check = strtotime($status['last_check']);
        $now = current_time('timestamp');

        return $now - $last_check;
    }

    /**
     * Check if cache is still valid.
     *
     * @return bool True if cache is valid, false if expired or empty.
     */
    public function is_cache_valid(): bool {
        return get_transient(self::CACHE_KEY) !== false;
    }
}
