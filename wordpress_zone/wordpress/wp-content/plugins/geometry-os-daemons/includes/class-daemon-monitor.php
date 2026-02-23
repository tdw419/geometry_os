<?php
/**
 * Daemon Monitor class.
 *
 * Monitors multiple Geometry OS daemon processes using pgrep/ps with transient caching.
 *
 * @package Geometry_OS_Daemons
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Daemon_Monitor
 *
 * Provides status checking for multiple daemons with 30-second transient cache.
 * Returns metrics: id, name, description, process_name, running, pid, uptime, cpu, memory, last_check.
 *
 * @since 1.0.0
 */
class Daemon_Monitor {

    /**
     * Transient cache TTL in seconds.
     */
    private const CACHE_TTL = 30;

    /**
     * Transient key prefix for cached status.
     */
    private const CACHE_KEY_PREFIX = 'geometry_os_daemon_';

    /**
     * Transient key for all daemons status.
     */
    private const CACHE_KEY_ALL = 'geometry_os_all_daemons';

    /**
     * Status when shell_exec is unavailable.
     */
    private const STATUS_UNAVAILABLE = 'unavailable';

    /**
     * Configured daemons to monitor.
     *
     * @var array<string, array{id: string, name: string, description: string, process_name: string}>
     */
    private array $daemons;

    /**
     * Whether shell_exec is available.
     *
     * @var bool|null Cached availability status.
     */
    private ?bool $shell_exec_available = null;

    /**
     * Last error message.
     *
     * @var string|null
     */
    private ?string $last_error = null;

    /**
     * Constructor.
     *
     * Initialize the daemons configuration.
     */
    public function __construct() {
        $this->daemons = $this->get_configured_daemons();
        $this->shell_exec_available = $this->check_shell_exec_available();
    }

    /**
     * Get configured daemons to monitor.
     *
     * @return array<string, array{id: string, name: string, description: string, process_name: string}>
     */
    public function get_configured_daemons(): array {
        return [
            'evolution' => [
                'id'           => 'evolution',
                'name'         => 'Evolution Daemon',
                'description'  => 'Autonomous code improvement and self-evolution system',
                'process_name' => 'evolution_daemon.py',
            ],
            'directive' => [
                'id'           => 'directive',
                'name'         => 'Directive Daemon',
                'description'  => 'Command processing and agent coordination',
                'process_name' => 'directive_daemon.py',
            ],
            'visual_bridge' => [
                'id'           => 'visual_bridge',
                'name'         => 'Visual Bridge',
                'description'  => 'WebSocket hub for real-time HUD streaming',
                'process_name' => 'visual_bridge.py',
            ],
        ];
    }

    /**
     * Get status for all configured daemons.
     *
     * @param bool $force_check Bypass cache and force fresh check.
     * @return array<string, array> Associative array of daemon_id => status array.
     */
    public function get_all_status( bool $force_check = false ): array {
        // Check cache first (unless force check)
        if ( ! $force_check ) {
            $cached = get_transient( self::CACHE_KEY_ALL );
            if ( $cached !== false && is_array( $cached ) ) {
                return $cached;
            }
        }

        $all_status = [];

        foreach ( $this->daemons as $daemon_id => $config ) {
            $all_status[ $daemon_id ] = $this->get_daemon_status( $daemon_id, true );
        }

        // Cache the result
        set_transient( self::CACHE_KEY_ALL, $all_status, self::CACHE_TTL );

        return $all_status;
    }

    /**
     * Get status for a specific daemon.
     *
     * @param string $daemon_id    Daemon identifier.
     * @param bool   $force_check  Bypass cache and force fresh check.
     * @return array Status array with daemon metrics.
     */
    public function get_daemon_status( string $daemon_id, bool $force_check = false ): array {
        // Validate daemon ID
        if ( ! isset( $this->daemons[ $daemon_id ] ) ) {
            return [
                'id'          => $daemon_id,
                'error'       => 'Unknown daemon',
                'running'     => false,
                'last_check'  => current_time( 'mysql' ),
            ];
        }

        $cache_key = self::CACHE_KEY_PREFIX . $daemon_id;

        // Check cache first (unless force check)
        if ( ! $force_check ) {
            $cached = get_transient( $cache_key );
            if ( $cached !== false && is_array( $cached ) ) {
                return $cached;
            }
        }

        // Check if shell_exec is available
        if ( ! $this->shell_exec_available ) {
            $config = $this->daemons[ $daemon_id ];
            return [
                'id'           => $config['id'],
                'name'         => $config['name'],
                'description'  => $config['description'],
                'process_name' => $config['process_name'],
                'status'       => self::STATUS_UNAVAILABLE,
                'running'      => false,
                'error'        => 'shell_exec is disabled on this server',
                'pid'          => null,
                'uptime'       => null,
                'uptime_raw'   => 0,
                'cpu'          => null,
                'memory'       => null,
                'last_check'   => current_time( 'mysql' ),
            ];
        }

        // Perform fresh status check
        $config = $this->daemons[ $daemon_id ];

        try {
            $status = $this->check_daemon_process( $config );
        } catch ( \Exception $e ) {
            $this->last_error = $e->getMessage();
            $status = [
                'id'           => $config['id'],
                'name'         => $config['name'],
                'description'  => $config['description'],
                'process_name' => $config['process_name'],
                'status'       => 'error',
                'running'      => false,
                'error'        => $e->getMessage(),
                'pid'          => null,
                'uptime'       => null,
                'uptime_raw'   => 0,
                'cpu'          => null,
                'memory'       => null,
                'last_check'   => current_time( 'mysql' ),
            ];
        }

        // Cache the result
        set_transient( $cache_key, $status, self::CACHE_TTL );

        return $status;
    }

    /**
     * Check daemon process using pgrep and ps.
     *
     * @param array{id: string, name: string, description: string, process_name: string} $config Daemon config.
     * @return array Status array with all metrics.
     */
    private function check_daemon_process( array $config ): array {
        $status = [
            'id'           => $config['id'],
            'name'         => $config['name'],
            'description'  => $config['description'],
            'process_name' => $config['process_name'],
            'status'       => 'stopped',
            'running'      => false,
            'pid'          => null,
            'uptime'       => null,
            'uptime_raw'   => 0,
            'cpu'          => null,
            'memory'       => null,
            'last_check'   => current_time( 'mysql' ),
        ];

        // Check if shell_exec is available (should already be checked, but be safe)
        if ( ! $this->shell_exec_available ) {
            $status['status'] = self::STATUS_UNAVAILABLE;
            $status['error']  = 'shell_exec is disabled on this server';
            return $status;
        }

        try {
            // Use pgrep to find daemon process
            $pgrep_command = sprintf(
                'pgrep -f %s 2>/dev/null',
                escapeshellarg( $config['process_name'] )
            );

            $pgrep_output = $this->safe_shell_exec( $pgrep_command );

            if ( $pgrep_output === null || trim( $pgrep_output ) === '' ) {
                // Process not running, but no error
                return $status;
            }

            // Process found - extract first PID
            $pids = preg_split( '/\s+/', trim( $pgrep_output ) );
            if ( empty( $pids ) || ! is_numeric( $pids[0] ) ) {
                // Invalid output, treat as not running
                return $status;
            }

            $pid = (int) $pids[0];
            $status['running'] = true;
            $status['status']  = 'running';
            $status['pid']     = $pid;

            // Get detailed process info using ps
            // Format: pid, elapsed time (ELAPSED), cpu%, mem%
            $ps_command = sprintf(
                'ps -p %d -o pid=,etime=,%%cpu=,%%mem= 2>/dev/null',
                $pid
            );

            $ps_output = $this->safe_shell_exec( $ps_command );

            if ( $ps_output !== null && trim( $ps_output ) !== '' ) {
                $this->parse_ps_output( $ps_output, $status );
            }
        } catch ( \Exception $e ) {
            $this->last_error = $e->getMessage();
            $status['status'] = 'error';
            $status['error']  = $e->getMessage();
            // Log error if WordPress debug mode is enabled
            if ( defined( 'WP_DEBUG' ) && WP_DEBUG ) {
                error_log( 'Geometry OS Daemons: ' . $e->getMessage() );
            }
        }

        return $status;
    }

    /**
     * Parse ps command output and update status array.
     *
     * @param string $output PS command output.
     * @param array  $status Status array to update (passed by reference).
     */
    private function parse_ps_output( string $output, array &$status ): void {
        // ps output format: " PID  ELAPSED  %CPU  %MEM"
        // Example: "1234  04:23:45   4.5  2.1"
        $parts = preg_split( '/\s+/', trim( $output ) );

        if ( count( $parts ) >= 4 ) {
            // Parse elapsed time
            $elapsed = $parts[1] ?? '';
            $status['uptime_raw'] = $this->elapsed_to_seconds( $elapsed );
            $status['uptime'] = $this->format_uptime( $status['uptime_raw'] );

            // Parse CPU percentage
            $cpu = $parts[2] ?? '0';
            $status['cpu'] = $this->format_percentage( $cpu );

            // Parse memory percentage
            $mem = $parts[3] ?? '0';
            $status['memory'] = $this->format_percentage( $mem );
        }
    }

    /**
     * Safe shell exec wrapper.
     *
     * @param string $command Command to execute.
     * @return string|null Command output or null on failure.
     * @throws \RuntimeException If shell execution fails unexpectedly.
     */
    private function safe_shell_exec( string $command ): ?string {
        // Check if shell_exec is available
        if ( ! function_exists( 'shell_exec' ) ) {
            return null;
        }

        // Check if exec is disabled
        $disabled = explode( ',', ini_get( 'disable_functions' ) );
        if ( in_array( 'shell_exec', array_map( 'trim', $disabled ), true ) ) {
            return null;
        }

        try {
            $result = @shell_exec( $command );
        } catch ( \Exception $e ) {
            $this->last_error = 'Shell exec failed: ' . $e->getMessage();
            return null;
        }

        // Handle false return (command failed to execute)
        if ( $result === false ) {
            return null;
        }

        // Handle empty output
        if ( $result === '' || trim( $result ) === '' ) {
            return null;
        }

        return $result;
    }

    /**
     * Convert ps elapsed time format to seconds.
     *
     * Formats handled:
     * - SS (seconds)
     * - MM:SS
     * - HH:MM:SS
     * - D-HH:MM:SS
     * - D-days HH:MM:SS
     *
     * @param string $elapsed Elapsed time string from ps.
     * @return int Total seconds.
     */
    private function elapsed_to_seconds( string $elapsed ): int {
        $elapsed = trim( $elapsed );

        // Handle "days-HH:MM:SS" format (e.g., "2-04:23:45")
        if ( preg_match( '/^(\d+)-(\d+):(\d+):(\d+)$/', $elapsed, $matches ) ) {
            $days    = (int) $matches[1];
            $hours   = (int) $matches[2];
            $minutes = (int) $matches[3];
            $seconds = (int) $matches[4];
            return $seconds + ( $minutes * 60 ) + ( $hours * 3600 ) + ( $days * 86400 );
        }

        // Handle "days days HH:MM:SS" format (e.g., "2 days 04:23:45")
        if ( preg_match( '/^(\d+)\s+days?\s+(\d+):(\d+):(\d+)$/i', $elapsed, $matches ) ) {
            $days    = (int) $matches[1];
            $hours   = (int) $matches[2];
            $minutes = (int) $matches[3];
            $seconds = (int) $matches[4];
            return $seconds + ( $minutes * 60 ) + ( $hours * 3600 ) + ( $days * 86400 );
        }

        // Handle "HH:MM:SS" format
        if ( preg_match( '/^(\d+):(\d+):(\d+)$/', $elapsed, $matches ) ) {
            $hours   = (int) $matches[1];
            $minutes = (int) $matches[2];
            $seconds = (int) $matches[3];
            return $seconds + ( $minutes * 60 ) + ( $hours * 3600 );
        }

        // Handle "MM:SS" format
        if ( preg_match( '/^(\d+):(\d+)$/', $elapsed, $matches ) ) {
            $minutes = (int) $matches[1];
            $seconds = (int) $matches[2];
            return $seconds + ( $minutes * 60 );
        }

        // Handle just seconds
        if ( is_numeric( $elapsed ) ) {
            return (int) $elapsed;
        }

        return 0;
    }

    /**
     * Format uptime seconds to human-readable string.
     *
     * @param int $seconds Uptime in seconds.
     * @return string Formatted string like "4h 23m" or "2d 4h".
     */
    public function format_uptime( int $seconds ): string {
        if ( $seconds <= 0 ) {
            return '0m';
        }

        $days    = (int) floor( $seconds / 86400 );
        $hours   = (int) floor( ( $seconds % 86400 ) / 3600 );
        $minutes = (int) floor( ( $seconds % 3600 ) / 60 );

        $parts = [];

        // Show days if >= 1
        if ( $days >= 1 ) {
            $parts[] = "{$days}d";
        }

        // Show hours if >= 1 or if we have days
        if ( $hours >= 1 || ( $days >= 1 && $hours > 0 ) ) {
            $parts[] = "{$hours}h";
        }

        // Always show minutes if no days/hours, or just minutes remaining
        if ( empty( $parts ) || $minutes > 0 ) {
            if ( empty( $parts ) || $days < 1 ) {
                $parts[] = "{$minutes}m";
            }
        }

        // Limit to 2 parts for readability
        $parts = array_slice( $parts, 0, 2 );

        return implode( ' ', $parts );
    }

    /**
     * Format percentage to 1 decimal place.
     *
     * @param string|int|float $value Percentage value.
     * @return string Formatted percentage like "4.5%".
     */
    private function format_percentage( $value ): string {
        $float = (float) $value;
        return sprintf( '%.1f%%', $float );
    }

    /**
     * Clear all cached daemon status.
     *
     * @return void
     */
    public function clear_cache(): void {
        // Clear individual daemon caches
        foreach ( $this->daemons as $daemon_id => $config ) {
            delete_transient( self::CACHE_KEY_PREFIX . $daemon_id );
        }

        // Clear all daemons cache
        delete_transient( self::CACHE_KEY_ALL );
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
     * Check if cache is still valid for a daemon.
     *
     * @param string $daemon_id Daemon identifier.
     * @return bool True if cache is valid, false if expired or empty.
     */
    public function is_cache_valid( string $daemon_id ): bool {
        return get_transient( self::CACHE_KEY_PREFIX . $daemon_id ) !== false;
    }

    /**
     * Get seconds since last check for a daemon.
     *
     * @param string $daemon_id Daemon identifier.
     * @return int|null Seconds since last check, or null if never checked.
     */
    public function get_seconds_since_check( string $daemon_id ): ?int {
        $cached = get_transient( self::CACHE_KEY_PREFIX . $daemon_id );

        if ( $cached === false || ! isset( $cached['last_check'] ) ) {
            return null;
        }

        $last_check = strtotime( $cached['last_check'] );
        $now        = current_time( 'timestamp' );

        return $now - $last_check;
    }

    /**
     * Get list of daemon IDs.
     *
     * @return array<string> List of daemon IDs.
     */
    public function get_daemon_ids(): array {
        return array_keys( $this->daemons );
    }

    /**
     * Check if shell_exec is available.
     *
     * @return bool True if shell_exec is available, false otherwise.
     */
    public function is_shell_exec_available(): bool {
        return $this->shell_exec_available === true;
    }

    /**
     * Internal check for shell_exec availability.
     *
     * @return bool True if shell_exec is available, false otherwise.
     */
    private function check_shell_exec_available(): bool {
        if ( ! function_exists( 'shell_exec' ) ) {
            return false;
        }

        $disabled = explode( ',', ini_get( 'disable_functions' ) );
        if ( in_array( 'shell_exec', array_map( 'trim', $disabled ), true ) ) {
            return false;
        }

        return true;
    }

    /**
     * Get the last error message.
     *
     * @return string|null Last error message or null if no error.
     */
    public function get_last_error(): ?string {
        return $this->last_error;
    }

    /**
     * Clear the last error message.
     *
     * @return void
     */
    public function clear_last_error(): void {
        $this->last_error = null;
    }
}
