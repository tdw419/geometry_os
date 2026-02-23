<?php
/**
 * Proxy Status Checker
 *
 * Checks the health status of the hybrid LLM proxy service.
 *
 * @package Geometry_OS_LLM_Router
 * @since 1.0.0
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class Geometry_OS_Proxy_Status
 *
 * Provides health check functionality for the LLM proxy service.
 */
class Geometry_OS_Proxy_Status
{
    /**
     * Proxy port
     *
     * @var int
     */
    private $port;

    /**
     * Proxy host
     *
     * @var string
     */
    private $host;

    /**
     * Connection timeout in seconds
     *
     * @var int
     */
    private $timeout;

    /**
     * Last status check result
     *
     * @var bool|null
     */
    private $last_status = null;

    /**
     * Last check timestamp
     *
     * @var int|null
     */
    private $last_check_time = null;

    /**
     * Cache TTL for status checks
     *
     * @var int
     */
    private $cache_ttl;

    /**
     * Constructor
     *
     * @param int $port Proxy port
     * @param string $host Proxy host
     * @param int $timeout Connection timeout
     */
    public function __construct($port = 4000, $host = '127.0.0.1', $timeout = 2)
    {
        $this->port = $port;
        $this->host = $host;
        $this->timeout = $timeout;
        $this->cache_ttl = 30; // 30 seconds
    }

    /**
     * Check if proxy is online
     *
     * @return bool True if proxy is responding
     */
    public function check()
    {
        // Check cache first
        if ($this->is_cached_valid()) {
            return $this->last_status;
        }

        $status = $this->perform_check();

        // Cache the result
        $this->last_status = $status;
        $this->last_check_time = time();

        return $status;
    }

    /**
     * Perform actual health check
     *
     * @return bool True if proxy responds
     */
    private function perform_check()
    {
        $socket = @fsockopen($this->host, $this->port, $errno, $errstr, $this->timeout);

        if ($socket) {
            fclose($socket);
            return true;
        }

        return false;
    }

    /**
     * Check if cached status is still valid
     *
     * @return bool
     */
    private function is_cached_valid()
    {
        if ($this->last_check_time === null) {
            return false;
        }

        return (time() - $this->last_check_time) < $this->cache_ttl;
    }

    /**
     * Get detailed status information
     *
     * @return array Status details
     */
    public function get_status_details()
    {
        $is_online = $this->check();

        return [
            'online'       => $is_online,
            'host'         => $this->host,
            'port'         => $this->port,
            'url'          => "http://{$this->host}:{$this->port}",
            'last_check'   => $this->last_check_time ? date('Y-m-d H:i:s', $this->last_check_time) : null,
            'cache_ttl'    => $this->cache_ttl,
        ];
    }

    /**
     * Check health endpoint
     *
     * Makes HTTP request to proxy health endpoint.
     *
     * @return array|null Health data or null if unavailable
     */
    public function check_health_endpoint()
    {
        $url = "http://{$this->host}:{$this->port}/health";

        $response = wp_remote_get($url, [
            'timeout' => $this->timeout,
            'headers' => [
                'Accept' => 'application/json',
            ],
        ]);

        if (is_wp_error($response)) {
            return null;
        }

        $body = wp_remote_retrieve_body($response);
        $data = json_decode($body, true);

        return $data ?: null;
    }

    /**
     * Get proxy metrics
     *
     * @return array|null Metrics data or null if unavailable
     */
    public function get_metrics()
    {
        $url = "http://{$this->host}:{$this->port}/metrics";

        $response = wp_remote_get($url, [
            'timeout' => $this->timeout,
            'headers' => [
                'Accept' => 'application/json',
            ],
        ]);

        if (is_wp_error($response)) {
            return null;
        }

        $body = wp_remote_retrieve_body($response);
        $data = json_decode($body, true);

        return $data ?: null;
    }

    /**
     * Set cache TTL
     *
     * @param int $ttl Cache TTL in seconds
     */
    public function set_cache_ttl($ttl)
    {
        $this->cache_ttl = $ttl;
    }

    /**
     * Clear cached status
     *
     * Forces next check to perform actual connection test.
     */
    public function clear_cache()
    {
        $this->last_status = null;
        $this->last_check_time = null;
    }
}
