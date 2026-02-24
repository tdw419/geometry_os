<?php
/**
 * World of Rectification - Transmission Session
 *
 * Handles Scribe-Sprout chat sessions and queue management.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Transmission_Session {

    private $table_transmissions;
    private $table_messages;
    private $table_scribes;
    private $table_sprouts;

    public function __construct() {
        global $wpdb;
        $this->table_transmissions = $wpdb->prefix . 'wor_transmissions';
        $this->table_messages = $wpdb->prefix . 'wor_transmission_messages';
        $this->table_scribes = $wpdb->prefix . 'wor_scribes';
        $this->table_sprouts = $wpdb->prefix . 'wor_sprouts';
    }

    /**
     * Get the sprout waiting queue
     */
    public function get_queue(): array {
        return get_option('wor_sprout_queue', []);
    }

    /**
     * Ensure a sprout record exists for a user
     */
    public function ensure_sprout(int $user_id): int {
        global $wpdb;

        $existing = $wpdb->get_var($wpdb->prepare(
            "SELECT id FROM {$this->table_sprouts} WHERE user_id = %d",
            $user_id
        ));

        if ($existing) {
            return (int)$existing;
        }

        $wpdb->insert($this->table_sprouts, ['user_id' => $user_id]);
        return $wpdb->insert_id;
    }

    /**
     * Sprout requests help - enters queue
     */
    public function request_help(int $sprout_user_id, ?int $quest_id = null, string $topic = ''): array {
        global $wpdb;

        // Check if already in active session
        $sprout_id = $this->ensure_sprout($sprout_user_id);

        $existing = $wpdb->get_var($wpdb->prepare(
            "SELECT id FROM {$this->table_transmissions}
             WHERE sprout_id = %d AND status = 'active'",
            $sprout_id
        ));

        if ($existing) {
            return ['error' => 'Already in active session', 'transmission_id' => (int)$existing];
        }

        // Add to waiting queue
        $queue = $this->get_queue();
        $queue[] = [
            'sprout_id' => $sprout_id,
            'user_id' => $sprout_user_id,
            'quest_id' => $quest_id,
            'topic' => $topic,
            'requested_at' => time(),
        ];
        update_option('wor_sprout_queue', $queue);

        // Broadcast to available scribes
        $this->broadcast_help_request($sprout_id, $quest_id, $topic);

        return [
            'success' => true,
            'queue_position' => count($queue),
            'sprout_id' => $sprout_id,
        ];
    }

    /**
     * Broadcast help request via Visual Bridge
     */
    private function broadcast_help_request(int $sprout_id, ?int $quest_id, string $topic): void {
        $payload = [
            'event' => 'SPROUT_HELP_REQUEST',
            'sprout_id' => $sprout_id,
            'quest_id' => $quest_id,
            'topic' => $topic,
            'timestamp' => time(),
        ];

        wp_remote_post('http://localhost:8768/broadcast', [
            'body' => json_encode($payload),
            'headers' => ['Content-Type' => 'application/json'],
            'timeout' => 2,
            'blocking' => false,
        ]);
    }

    /**
     * Scribe accepts a waiting Sprout
     */
    public function accept_sprout(int $scribe_user_id, int $sprout_id): array {
        global $wpdb;

        // Verify scribe is eligible
        $scribe = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE user_id = %d",
            $scribe_user_id
        ), ARRAY_A);

        if (!$scribe) {
            return ['error' => 'Not registered as Scribe'];
        }

        if (!$scribe['onboarding_completed']) {
            return ['error' => 'Onboarding not completed'];
        }

        // Remove from queue
        $queue = $this->get_queue();
        $sprout_data = null;
        foreach ($queue as $i => $item) {
            if ($item['sprout_id'] === $sprout_id) {
                $sprout_data = $item;
                unset($queue[$i]);
                break;
            }
        }
        update_option('wor_sprout_queue', array_values($queue));

        if (!$sprout_data) {
            return ['error' => 'Sprout no longer waiting'];
        }

        // Create transmission session
        $wpdb->insert($this->table_transmissions, [
            'scribe_id' => $scribe['id'],
            'sprout_id' => $sprout_id,
            'quest_context_id' => $sprout_data['quest_id'] ?? null,
            'status' => 'active',
            'started_at' => current_time('mysql'),
        ]);

        $transmission_id = $wpdb->insert_id;

        // Assign scribe to sprout
        $wpdb->update(
            $this->table_sprouts,
            ['assigned_scribe_id' => $scribe['id']],
            ['id' => $sprout_id]
        );

        // System message to start
        $this->send_message_internal(
            $transmission_id,
            'system',
            0,
            "Transmission started. {$scribe['cohort']} Scribe is here to help."
        );

        return [
            'success' => true,
            'transmission_id' => $transmission_id,
            'sprout_topic' => $sprout_data['topic'] ?? '',
        ];
    }

    /**
     * Send a message in a transmission
     */
    public function send_message(int $transmission_id, string $sender_type, int $sender_user_id, string $message): array {
        global $wpdb;

        // Verify session is active
        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d AND status = 'active'",
            $transmission_id
        ));

        if (!$session) {
            return ['error' => 'Session not active'];
        }

        // Sanitize message
        $message = sanitize_textarea_field($message);
        if (empty(trim($message))) {
            return ['error' => 'Message cannot be empty'];
        }

        return $this->send_message_internal($transmission_id, $sender_type, $sender_user_id, $message);
    }

    /**
     * Internal message insertion (no validation)
     */
    private function send_message_internal(int $transmission_id, string $sender_type, int $sender_user_id, string $message): array {
        global $wpdb;

        $wpdb->insert($this->table_messages, [
            'transmission_id' => $transmission_id,
            'sender_type' => $sender_type,
            'sender_id' => $sender_user_id,
            'message_text' => $message,
            'created_at' => current_time('mysql'),
        ]);

        $message_id = $wpdb->insert_id;

        // Schedule async intent classification for scribe messages
        if ($sender_type === 'scribe') {
            wp_schedule_single_event(time() + 5, 'wor_classify_message_intent', [$message_id]);
        }

        return [
            'success' => true,
            'message_id' => $message_id,
            'timestamp' => current_time('mysql'),
        ];
    }

    /**
     * Poll for new messages
     */
    public function poll_messages(int $transmission_id, int $last_message_id = 0): array {
        global $wpdb;

        // Verify transmission exists
        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d",
            $transmission_id
        ));

        if (!$session) {
            return ['error' => 'Transmission not found'];
        }

        $messages = $wpdb->get_results($wpdb->prepare(
            "SELECT id, sender_type, sender_id, message_text, created_at
             FROM {$this->table_messages}
             WHERE transmission_id = %d AND id > %d
             ORDER BY id ASC",
            $transmission_id, $last_message_id
        ), ARRAY_A);

        $last_id = $last_message_id;
        if (!empty($messages)) {
            $last_id = (int)end($messages)['id'];
        }

        return [
            'success' => true,
            'messages' => $messages,
            'last_id' => $last_id,
            'session_status' => $session->status,
        ];
    }

    /**
     * End a transmission session
     */
    public function end_transmission(int $transmission_id, int $ended_by_user_id, ?int $rating = null, ?string $feedback = null): array {
        global $wpdb;

        $session = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_transmissions} WHERE id = %d",
            $transmission_id
        ), ARRAY_A);

        if (!$session) {
            return ['error' => 'Transmission not found'];
        }

        if ($session['status'] !== 'active') {
            return ['error' => 'Session already ended'];
        }

        // Calculate duration
        $started = strtotime($session['started_at']);
        $duration = time() - $started;

        // Update session
        $wpdb->update(
            $this->table_transmissions,
            [
                'status' => 'completed',
                'ended_at' => current_time('mysql'),
                'duration_seconds' => $duration,
                'scribe_rating' => $rating,
                'sprout_feedback' => $feedback,
            ],
            ['id' => $transmission_id]
        );

        // Update Scribe stats
        $wpdb->query($wpdb->prepare(
            "UPDATE {$this->table_scribes}
             SET mentorship_count = mentorship_count + 1
             WHERE id = %d",
            $session['scribe_id']
        ));

        // Update Sprout stats
        $wpdb->query($wpdb->prepare(
            "UPDATE {$this->table_sprouts}
             SET total_sessions = total_sessions + 1,
                 assigned_scribe_id = NULL
             WHERE id = %d",
            $session['sprout_id']
        ));

        // Queue for training export
        wp_schedule_single_event(time() + 60, 'wor_queue_transmission_for_training', [$transmission_id]);

        return [
            'success' => true,
            'duration_seconds' => $duration,
        ];
    }
}
