<?php
/**
 * World of Rectification - Scribe API
 *
 * REST API endpoints for Scribe Protocol functionality.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Scribe_API {

    /**
     * Singleton instance.
     *
     * @var WOR_Scribe_API|null
     */
    private static $instance = null;

    /**
     * Get singleton instance.
     *
     * @return self
     */
    public static function get_instance(): self {
        if (null === self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * Private constructor.
     */
    private function __construct() {
        add_action('rest_api_init', [$this, 'register_routes']);
    }

    /**
     * Register REST API routes
     */
    public function register_routes(): void {
        // Scribe Portal endpoints
        register_rest_route('wor/v1', '/scribe/register', [
            'methods' => 'POST',
            'callback' => [$this, 'api_scribe_register'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/scribe/onboarding', [
            'methods' => 'GET',
            'callback' => [$this, 'api_scribe_onboarding'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/scribe/complete-step', [
            'methods' => 'POST',
            'callback' => [$this, 'api_scribe_complete_step'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        // Transmission endpoints
        register_rest_route('wor/v1', '/transmission/request', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_request'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/queue', [
            'methods' => 'GET',
            'callback' => [$this, 'api_transmission_queue'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/accept', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_accept'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/messages', [
            'methods' => 'GET',
            'callback' => [$this, 'api_transmission_poll'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/send', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_send'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        register_rest_route('wor/v1', '/transmission/(?P<id>\d+)/end', [
            'methods' => 'POST',
            'callback' => [$this, 'api_transmission_end'],
            'permission_callback' => function() { return is_user_logged_in(); },
        ]);

        // Training pipeline endpoints
        register_rest_route('wor/v1', '/training/stats', [
            'methods' => 'GET',
            'callback' => [$this, 'api_training_stats'],
            'permission_callback' => function() { return current_user_can('manage_options'); },
        ]);
    }

    /**
     * API: Register as Scribe
     */
    public function api_scribe_register(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $cohort = sanitize_text_field($request->get_param('cohort'));
        $expertise = $request->get_param('expertise') ?? [];

        if (!in_array($cohort, ['internal', 'community', 'domain_expert'])) {
            return rest_ensure_response(['error' => 'Invalid cohort']);
        }

        require_once WOR_PATH . 'includes/class-scribe-portal.php';
        $portal = new WOR_Scribe_Portal();
        $result = $portal->register_scribe($user_id, $cohort, $expertise);

        if ($result === false) {
            return rest_ensure_response(['error' => 'Already registered']);
        }

        return rest_ensure_response(['success' => true, 'scribe_id' => $result]);
    }

    /**
     * API: Get onboarding status
     */
    public function api_scribe_onboarding(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();

        require_once WOR_PATH . 'includes/class-scribe-portal.php';
        $portal = new WOR_Scribe_Portal();
        $scribe = $portal->get_scribe_by_user($user_id);

        if (!$scribe) {
            return rest_ensure_response(['error' => 'Not registered as Scribe']);
        }

        $flow = $portal->get_onboarding_flow($scribe['cohort']);
        $current_step = (int)$scribe['onboarding_step'];

        return rest_ensure_response([
            'cohort' => $scribe['cohort'],
            'current_step' => $current_step,
            'total_steps' => count($flow),
            'completed' => (bool)$scribe['onboarding_completed'],
            'current_content' => $flow[$current_step] ?? null,
            'progress_percent' => count($flow) > 0 ? round(($current_step / count($flow)) * 100) : 0,
        ]);
    }

    /**
     * API: Complete onboarding step
     */
    public function api_scribe_complete_step(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $step = (int)$request->get_param('step');
        $response = $request->get_param('response') ?? [];

        require_once WOR_PATH . 'includes/class-scribe-portal.php';
        $portal = new WOR_Scribe_Portal();
        $scribe = $portal->get_scribe_by_user($user_id);

        if (!$scribe) {
            return rest_ensure_response(['error' => 'Not registered as Scribe']);
        }

        $result = $portal->complete_step($scribe['id'], $step, $response);
        return rest_ensure_response($result);
    }

    /**
     * API: Request help (Sprout)
     */
    public function api_transmission_request(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $quest_id = $request->get_param('quest_id') ? (int)$request->get_param('quest_id') : null;
        $topic = sanitize_text_field($request->get_param('topic') ?? '');

        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $result = $session->request_help($user_id, $quest_id, $topic);

        return rest_ensure_response($result);
    }

    /**
     * API: Get sprout queue (Scribe)
     */
    public function api_transmission_queue(WP_REST_Request $request): WP_REST_Response {
        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        return rest_ensure_response(['queue' => $session->get_queue()]);
    }

    /**
     * API: Accept sprout (Scribe)
     */
    public function api_transmission_accept(WP_REST_Request $request): WP_REST_Response {
        $user_id = get_current_user_id();
        $sprout_id = (int)$request->get_param('sprout_id');

        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $result = $session->accept_sprout($user_id, $sprout_id);

        return rest_ensure_response($result);
    }

    /**
     * API: Poll messages
     */
    public function api_transmission_poll(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $last_id = (int)$request->get_param('last') ?? 0;

        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $result = $session->poll_messages($transmission_id, $last_id);

        return rest_ensure_response($result);
    }

    /**
     * API: Send message
     */
    public function api_transmission_send(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $user_id = get_current_user_id();
        $message = $request->get_param('message');
        $sender_type = sanitize_text_field($request->get_param('sender_type'));

        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $result = $session->send_message($transmission_id, $sender_type, $user_id, $message);

        return rest_ensure_response($result);
    }

    /**
     * API: End transmission
     */
    public function api_transmission_end(WP_REST_Request $request): WP_REST_Response {
        $transmission_id = (int)$request->get_param('id');
        $user_id = get_current_user_id();
        $rating = $request->get_param('rating') ? (int)$request->get_param('rating') : null;
        $feedback = sanitize_textarea_field($request->get_param('feedback') ?? '');

        require_once WOR_PATH . 'includes/class-transmission-session.php';
        $session = new WOR_Transmission_Session();
        $result = $session->end_transmission($transmission_id, $user_id, $rating, $feedback ?: null);

        return rest_ensure_response($result);
    }

    /**
     * API: Get training stats
     */
    public function api_training_stats(WP_REST_Request $request): WP_REST_Response {
        require_once WOR_PATH . 'includes/class-mentor-data-pipeline.php';
        $pipeline = new WOR_Mentor_Data_Pipeline();
        return rest_ensure_response($pipeline->get_training_stats());
    }
}

/**
 * Helper function to get WOR_Scribe_API instance.
 *
 * @return WOR_Scribe_API
 */
function WOR_Scribe_API(): WOR_Scribe_API {
    return WOR_Scribe_API::get_instance();
}
