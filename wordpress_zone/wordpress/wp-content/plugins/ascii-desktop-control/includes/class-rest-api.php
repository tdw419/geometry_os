<?php
/**
 * REST API class.
 *
 * Registers REST routes, handles authentication, delegates to existing classes.
 *
 * @package ASCII_Desktop_Control
 */

declare(strict_types=1);

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Class REST_API
 *
 * Provides REST API endpoints for external tools and AI agents.
 */
class REST_API {

    /**
     * REST API namespace.
     */
    public const NAMESPACE = 'ascii/v1';

    /**
     * API_Keys instance.
     */
    private API_Keys $api_keys;

    /**
     * ASCII_View instance.
     */
    private ASCII_View $ascii_view;

    /**
     * Daemon_Status instance.
     */
    private Daemon_Status $daemon_status;

    /**
     * Directive_API instance.
     */
    private Directive_API $directive_api;

    /**
     * Constructor.
     *
     * @param API_Keys      $api_keys      API keys handler.
     * @param ASCII_View    $ascii_view    ASCII view handler.
     * @param Daemon_Status $daemon_status Daemon status handler.
     * @param Directive_API $directive_api Directive API handler.
     */
    public function __construct(
        API_Keys $api_keys,
        ASCII_View $ascii_view,
        Daemon_Status $daemon_status,
        Directive_API $directive_api
    ) {
        $this->api_keys      = $api_keys;
        $this->ascii_view    = $ascii_view;
        $this->daemon_status = $daemon_status;
        $this->directive_api = $directive_api;
    }

    /**
     * Initialize REST API - register routes.
     */
    public function init(): void {
        add_action('rest_api_init', [$this, 'register_routes']);
    }

    /**
     * Register all REST routes.
     */
    public function register_routes(): void {
        // GET /ascii/v1/view
        register_rest_route(self::NAMESPACE, '/view', [
            'methods'             => 'GET',
            'callback'            => [$this, 'handle_get_view'],
            'permission_callback' => [$this, 'authenticate_request'],
        ]);

        // GET /ascii/v1/status
        register_rest_route(self::NAMESPACE, '/status', [
            'methods'             => 'GET',
            'callback'            => [$this, 'handle_get_status'],
            'permission_callback' => [$this, 'authenticate_request'],
        ]);

        // POST /ascii/v1/directives
        register_rest_route(self::NAMESPACE, '/directives', [
            'methods'             => 'POST',
            'callback'            => [$this, 'handle_create_directive'],
            'permission_callback' => [$this, 'authenticate_request'],
        ]);

        // GET /ascii/v1/directives
        register_rest_route(self::NAMESPACE, '/directives', [
            'methods'             => 'GET',
            'callback'            => [$this, 'handle_list_directives'],
            'permission_callback' => [$this, 'authenticate_request'],
        ]);

        // GET /ascii/v1/directives/{id}
        register_rest_route(self::NAMESPACE, '/directives/(?P<id>\d+)', [
            'methods'             => 'GET',
            'callback'            => [$this, 'handle_get_directive'],
            'permission_callback' => [$this, 'authenticate_request'],
        ]);
    }

    /**
     * Authenticate request via API key.
     *
     * Supports two authentication methods:
     * 1. X-API-Key header (preferred)
     * 2. api_key query parameter (URL encoded if contains special chars)
     *
     * Note: When using query parameter authentication, special characters
     * in the API key must be URL-encoded (e.g., + as %2B, / as %2F).
     * Header-based authentication is recommended to avoid encoding issues.
     *
     * @param \WP_REST_Request $request Request object.
     * @return true|\WP_Error True if authenticated, WP_Error otherwise.
     */
    public function authenticate_request(\WP_REST_Request $request) {
        // Try to get API key from header first (preferred method)
        $api_key = $request->get_header('X-API-Key');

        // Fall back to query parameter (URL decoded automatically by WordPress)
        if (empty($api_key)) {
            $api_key = $request->get_param('api_key');
        }

        // No key provided
        if (empty($api_key)) {
            return new \WP_Error(
                'rest_forbidden',
                __('Invalid or missing API key', 'ascii-desktop-control'),
                ['status' => 401]
            );
        }

        // Validate key using timing-safe comparison
        $key_data = $this->api_keys->validate($api_key);

        if ($key_data === null) {
            return new \WP_Error(
                'rest_forbidden',
                __('Invalid or missing API key', 'ascii-desktop-control'),
                ['status' => 401]
            );
        }

        // Update last_used timestamp
        $this->api_keys->update_last_used($key_data['id']);

        // Store key data in request for later use
        $request->set_param('_api_key_data', $key_data);

        return true;
    }

    /**
     * Handle GET /ascii/v1/view endpoint.
     *
     * @param \WP_REST_Request $request Request object.
     * @return \WP_REST_Response Response object.
     */
    public function handle_get_view(\WP_REST_Request $request): \WP_REST_Response {
        $width  = $request->get_param('width');
        $height = $request->get_param('height');

        $width  = $width ? (int) $width : null;
        $height = $height ? (int) $height : null;

        $result = $this->ascii_view->get_view($width, $height);

        if (!$result['success']) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => $result['error'],
            ], 500);
        }

        return new \WP_REST_Response([
            'success' => true,
            'data'    => [
                'ascii'     => $result['ascii'],
                'bindings'  => $result['bindings'],
                'mode'      => $result['mode'],
                'timestamp' => $result['timestamp'],
            ],
        ], 200);
    }

    /**
     * Handle GET /ascii/v1/status endpoint.
     *
     * @param \WP_REST_Request $request Request object.
     * @return \WP_REST_Response Response object.
     */
    public function handle_get_status(\WP_REST_Request $request): \WP_REST_Response {
        $result = $this->daemon_status->get_status();

        return new \WP_REST_Response([
            'success' => true,
            'data'    => [
                'running'    => $result['running'],
                'pid'        => $result['pid'],
                'checked_at' => $result['last_check'],
            ],
        ], 200);
    }

    /**
     * Handle POST /ascii/v1/directives endpoint.
     *
     * @param \WP_REST_Request $request Request object.
     * @return \WP_REST_Response Response object.
     */
    public function handle_create_directive(\WP_REST_Request $request): \WP_REST_Response {
        $title   = $request->get_param('title');
        $content = $request->get_param('content');

        // Validate required fields
        if (empty($title)) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => __('Title is required', 'ascii-desktop-control'),
            ], 400);
        }

        if (empty($content)) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => __('Content is required', 'ascii-desktop-control'),
            ], 400);
        }

        $result = $this->directive_api->create($title, $content);

        if (!$result['success']) {
            $status = isset($result['is_duplicate']) && $result['is_duplicate'] ? 400 : 500;

            return new \WP_REST_Response([
                'success'      => false,
                'error'        => $result['error'],
                'is_duplicate' => $result['is_duplicate'] ?? false,
            ], $status);
        }

        return new \WP_REST_Response([
            'success' => true,
            'data'    => [
                'id'      => $result['post_id'],
                'message' => $result['message'],
            ],
        ], 201);
    }

    /**
     * Handle GET /ascii/v1/directives endpoint.
     *
     * @param \WP_REST_Request $request Request object.
     * @return \WP_REST_Response Response object.
     */
    public function handle_list_directives(\WP_REST_Request $request): \WP_REST_Response {
        $limit = $request->get_param('limit');

        // Handle edge cases
        if ($limit === null) {
            $limit = 10;
        } elseif (!is_numeric($limit)) {
            // Non-numeric limit - return 400 error
            return new \WP_REST_Response([
                'success' => false,
                'error'   => __('Limit must be a numeric value', 'ascii-desktop-control'),
            ], 400);
        } else {
            $limit = (int) $limit;
            if ($limit < 1) {
                // Limit < 1 - default to 10
                $limit = 10;
            }
            if ($limit > 100) {
                // Limit > 100 - clamp to 100
                $limit = 100;
            }
        }

        $result = $this->directive_api->get_recent($limit);

        return new \WP_REST_Response([
            'success' => true,
            'data'    => [
                'directives' => $result['directives'],
                'total'      => $result['total'],
                'count'      => $result['count'],
            ],
        ], 200);
    }

    /**
     * Handle GET /ascii/v1/directives/{id} endpoint.
     *
     * @param \WP_REST_Request $request Request object.
     * @return \WP_REST_Response Response object.
     */
    public function handle_get_directive(\WP_REST_Request $request): \WP_REST_Response {
        $id = $request->get_param('id');

        // Validate ID
        if (!is_numeric($id)) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => __('Invalid directive ID', 'ascii-desktop-control'),
            ], 400);
        }

        $id = (int) $id;

        if ($id < 1) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => __('Invalid directive ID', 'ascii-desktop-control'),
            ], 400);
        }

        $result = $this->directive_api->get($id);

        if (!$result['success']) {
            return new \WP_REST_Response([
                'success' => false,
                'error'   => $result['error'],
            ], 404);
        }

        return new \WP_REST_Response([
            'success' => true,
            'data'    => $result['directive'],
        ], 200);
    }
}
