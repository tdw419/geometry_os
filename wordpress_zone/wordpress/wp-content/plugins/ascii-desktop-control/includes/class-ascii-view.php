<?php
/**
 * ASCII View shell exec wrapper class.
 *
 * Executes get_ascii_view.py Python script and parses output.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class ASCII_View
 *
 * Wrapper for executing get_ascii_view.py and parsing results.
 */
class ASCII_View {

    /**
     * Default grid width.
     */
    private const DEFAULT_WIDTH = 80;

    /**
     * Default grid height.
     */
    private const DEFAULT_HEIGHT = 24;

    /**
     * Python script path (relative to project root).
     */
    private const SCRIPT_PATH = '.gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py';

    /**
     * Project root directory.
     */
    private string $project_root;

    /**
     * Last error message.
     */
    private string $last_error = '';

    /**
     * Constructor.
     */
    public function __construct() {
        // Determine project root (3 levels up from plugin directory)
        $this->project_root = dirname(__FILE__, 5);
    }

    /**
     * Get ASCII view from Python script.
     *
     * @param int|null $width  Grid width (default 80).
     * @param int|null $height Grid height (default 24).
     * @return array Structured array with ascii, bindings, mode, timestamp.
     */
    public function get_view(?int $width = null, ?int $height = null): array {
        $width = $width ?? self::DEFAULT_WIDTH;
        $height = $height ?? self::DEFAULT_HEIGHT;

        $script_path = $this->project_root . '/' . self::SCRIPT_PATH;

        // Check if script exists
        if (!file_exists($script_path)) {
            return $this->error_response("Script not found: {$script_path}");
        }

        // Build command with DISPLAY=:0 environment
        $command = sprintf(
            'DISPLAY=:0 python3 %s %d %d 2>&1',
            escapeshellarg($script_path),
            $width,
            $height
        );

        // Execute with timeout
        $output = $this->shell_exec_timeout($command, 10);

        if ($output === false || $output === null) {
            return $this->error_response('Failed to execute Python script');
        }

        // Parse the output
        return $this->parse_output($output);
    }

    /**
     * Parse raw script output into structured array.
     *
     * Expected format:
     * --- ASCII MAP ---
     * <ASCII content>
     * --- BINDINGS ---
     * <JSON bindings>
     *
     * @param string $output Raw script output.
     * @return array Structured array.
     */
    public function parse_output(string $output): array {
        $result = [
            'ascii' => '',
            'bindings' => [],
            'mode' => 'unknown',
            'timestamp' => current_time('mysql'),
            'success' => true,
            'error' => '',
        ];

        // Check for ASCII section
        $ascii_start = strpos($output, '--- ASCII MAP ---');
        $bindings_start = strpos($output, '--- BINDINGS ---');

        if ($ascii_start === false) {
            // No structured output - might be error message
            if (strpos($output, 'ERROR') !== false) {
                return $this->error_response(trim($output));
            }
            // Return raw output as ASCII
            $result['ascii'] = trim($output);
            return $result;
        }

        // Extract ASCII section
        if ($bindings_start !== false) {
            $ascii_content = substr($output, $ascii_start + 17, $bindings_start - $ascii_start - 17);
            $result['ascii'] = trim($ascii_content);

            // Extract and parse JSON bindings
            $json_content = substr($output, $bindings_start + 16);
            $bindings = json_decode(trim($json_content), true);

            if (json_last_error() === JSON_ERROR_NONE && is_array($bindings)) {
                $result['bindings'] = $bindings;
            }
        } else {
            // No bindings section, just ASCII
            $ascii_content = substr($output, $ascii_start + 17);
            $result['ascii'] = trim($ascii_content);
        }

        // Detect mode from ASCII header line
        if (preg_match('/MODE:\s*(x11|screenshot)/i', $result['ascii'], $matches)) {
            $result['mode'] = strtolower($matches[1]);
            // Remove the header line from ASCII for cleaner display
            $result['ascii'] = preg_replace('/^WINDOW:.*MODE:.*\n/i', '', $result['ascii']);
        }

        return $result;
    }

    /**
     * Execute shell command with timeout.
     *
     * @param string $command Command to execute.
     * @param int    $timeout Timeout in seconds.
     * @return string|null Command output or null on failure.
     */
    private function shell_exec_timeout(string $command, int $timeout = 10): ?string {
        // Use proc_open for timeout control
        $descriptorspec = [
            0 => ['pipe', 'r'],
            1 => ['pipe', 'w'],
            2 => ['pipe', 'w'],
        ];

        $process = proc_open($command, $descriptorspec, $pipes);

        if (!is_resource($process)) {
            return null;
        }

        // Set stream timeout
        stream_set_timeout($pipes[1], $timeout);
        stream_set_timeout($pipes[2], $timeout);

        // Read output
        $output = stream_get_contents($pipes[1]);
        $errors = stream_get_contents($pipes[2]);

        // Close pipes
        fclose($pipes[0]);
        fclose($pipes[1]);
        fclose($pipes[2]);

        $return_value = proc_close($process);

        // Append errors to output for parsing
        if (!empty($errors)) {
            $output .= "\n" . $errors;
        }

        return $output;
    }

    /**
     * Create error response array.
     *
     * @param string $message Error message.
     * @return array Error response.
     */
    private function error_response(string $message): array {
        $this->last_error = $message;

        return [
            'ascii' => '',
            'bindings' => [],
            'mode' => 'error',
            'timestamp' => current_time('mysql'),
            'success' => false,
            'error' => $message,
        ];
    }

    /**
     * Get last error message.
     *
     * @return string Last error.
     */
    public function get_last_error(): string {
        return $this->last_error;
    }

    /**
     * Get project root path.
     *
     * @return string Project root directory.
     */
    public function get_project_root(): string {
        return $this->project_root;
    }

    /**
     * Get script full path.
     *
     * @return string Full path to Python script.
     */
    public function get_script_path(): string {
        return $this->project_root . '/' . self::SCRIPT_PATH;
    }
}
