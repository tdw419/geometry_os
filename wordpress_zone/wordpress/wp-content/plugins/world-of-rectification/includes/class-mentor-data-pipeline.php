<?php
/**
 * World of Rectification - Mentor Data Pipeline
 *
 * Handles intent classification and AI training data export.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Mentor_Data_Pipeline {

    private $intent_patterns = [
        'explanation' => [
            'patterns' => [
                '/let me explain/',
                '/here\'s how/',
                '/the reason is/',
                '/basically,/',
                '/in other words/',
                '/think of it like/',
                '/this means/',
                '/simply put/',
            ],
            'weight' => 1.0,
        ],
        'hint' => [
            'patterns' => [
                '/have you tried/',
                '/what if you/',
                '/consider looking at/',
                '/hint:/',
                '/try checking/',
                '/maybe look at/',
                '/you might want to/',
                '/suggest/',
            ],
            'weight' => 0.9,
        ],
        'encouragement' => [
            'patterns' => [
                '/good job/',
                '/great/',
                '/well done/',
                '/keep going/',
                '/don\'t give up/',
                '/you\'ve got this/',
                '/excellent/',
                '/nice work/',
            ],
            'weight' => 0.8,
        ],
        'clarification' => [
            'patterns' => [
                '/do you mean/',
                '/are you asking/',
                '/can you clarify/',
                '/what do you mean/',
                '/could you explain/',
                '/are you referring to/',
            ],
            'weight' => 0.7,
        ],
        'redirect' => [
            'patterns' => [
                '/let\'s focus on/',
                '/first,/',
                '/before that/',
                '/step back/',
                '/start with/',
                '/let\'s begin/',
            ],
            'weight' => 0.7,
        ],
    ];

    /**
     * Classify a message's intent
     */
    public function classify_intent(string $message): array {
        $message_lower = strtolower($message);
        $scores = [];

        foreach ($this->intent_patterns as $intent => $config) {
            $score = 0;
            foreach ($config['patterns'] as $pattern) {
                if (preg_match($pattern . 'i', $message)) {
                    $score += $config['weight'];
                }
            }
            if ($score > 0) {
                $scores[$intent] = $score;
            }
        }

        arsort($scores);

        $primary_intent = !empty($scores) ? array_key_first($scores) : 'general';
        $confidence = !empty($scores) ? round($scores[$primary_intent], 2) : 0;

        return [
            'intent' => $primary_intent,
            'confidence' => $confidence,
            'all_scores' => $scores,
        ];
    }

    /**
     * Process a message for intent classification (scheduled task)
     */
    public function process_message_intent(int $message_id): void {
        global $wpdb;

        $message = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$wpdb->prefix}wor_transmission_messages WHERE id = %d",
            $message_id
        ), ARRAY_A);

        if (!$message || $message['sender_type'] !== 'scribe') {
            return;
        }

        $classification = $this->classify_intent($message['message_text']);

        // Update message with intent
        $wpdb->update(
            $wpdb->prefix . 'wor_transmission_messages',
            ['intent_label' => $classification['intent']],
            ['id' => $message_id]
        );

        // Update intent cluster
        $this->update_cluster($classification['intent'], $message['message_text']);
    }

    /**
     * Update intent cluster with new sample
     */
    private function update_cluster(string $intent, string $message): void {
        global $wpdb;

        $table = $wpdb->prefix . 'wor_intent_clusters';
        $phrase = $this->extract_phrase($message);

        $cluster = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM $table WHERE intent_name = %s",
            $intent
        ), ARRAY_A);

        if (!$cluster) {
            $wpdb->insert($table, [
                'intent_name' => $intent,
                'sample_phrases' => json_encode([$phrase]),
                'message_count' => 1,
            ]);
        } else {
            $phrases = json_decode($cluster['sample_phrases'], true) ?: [];
            $phrases[] = $phrase;
            $phrases = array_slice($phrases, -20);

            $wpdb->update(
                $table,
                [
                    'sample_phrases' => json_encode($phrases),
                    'message_count' => $cluster['message_count'] + 1,
                ],
                ['id' => $cluster['id']]
            );
        }
    }

    /**
     * Extract key phrase from message
     */
    private function extract_phrase(string $message): string {
        $sentence = preg_split('/[.!?]/', $message)[0] ?? $message;
        return trim(substr($sentence, 0, 100));
    }

    /**
     * Export a single transmission for training
     */
    public function export_transmission(int $transmission_id): array {
        global $wpdb;

        $transmission = $wpdb->get_row($wpdb->prepare(
            "SELECT t.*, s.user_id as scribe_user_id, sp.user_id as sprout_user_id
             FROM {$wpdb->prefix}wor_transmissions t
             JOIN {$wpdb->prefix}wor_scribes s ON t.scribe_id = s.id
             JOIN {$wpdb->prefix}wor_sprouts sp ON t.sprout_id = sp.id
             WHERE t.id = %d",
            $transmission_id
        ), ARRAY_A);

        if (!$transmission) {
            return ['error' => 'Transmission not found'];
        }

        $messages = $wpdb->get_results($wpdb->prepare(
            "SELECT sender_type, sender_id, message_text, intent_label, created_at
             FROM {$wpdb->prefix}wor_transmission_messages
             WHERE transmission_id = %d
             ORDER BY id ASC",
            $transmission_id
        ), ARRAY_A);

        $training_example = [
            'metadata' => [
                'transmission_id' => $transmission_id,
                'duration_seconds' => (int)$transmission['duration_seconds'],
                'scribe_rating' => (int)$transmission['scribe_rating'],
                'quest_context' => (int)$transmission['quest_context_id'],
            ],
            'messages' => [],
        ];

        foreach ($messages as $msg) {
            $training_example['messages'][] = [
                'role' => $msg['sender_type'] === 'scribe' ? 'assistant' : 'user',
                'content' => $msg['message_text'],
                'intent' => $msg['intent_label'],
                'timestamp' => $msg['created_at'],
            ];
        }

        return $training_example;
    }

    /**
     * Get training pipeline statistics
     */
    public function get_training_stats(): array {
        global $wpdb;

        $total_transmissions = (int)$wpdb->get_var(
            "SELECT COUNT(*) FROM {$wpdb->prefix}wor_transmissions WHERE status = 'completed'"
        );

        $total_messages = (int)$wpdb->get_var(
            "SELECT COUNT(*) FROM {$wpdb->prefix}wor_transmission_messages WHERE sender_type = 'scribe'"
        );

        $intent_distribution = $wpdb->get_results(
            "SELECT intent_label, COUNT(*) as count
             FROM {$wpdb->prefix}wor_transmission_messages
             WHERE sender_type = 'scribe' AND intent_label IS NOT NULL
             GROUP BY intent_label
             ORDER BY count DESC",
            ARRAY_A
        );

        $avg_rating = $wpdb->get_var(
            "SELECT AVG(scribe_rating) FROM {$wpdb->prefix}wor_transmissions WHERE scribe_rating IS NOT NULL"
        );

        return [
            'total_transmissions' => $total_transmissions,
            'total_scribe_messages' => $total_messages,
            'intent_distribution' => $intent_distribution,
            'average_rating' => $avg_rating ? round((float)$avg_rating, 2) : null,
            'training_eligible' => ($total_transmissions >= 50 && ($avg_rating ?? 0) >= 3.5),
        ];
    }
}
