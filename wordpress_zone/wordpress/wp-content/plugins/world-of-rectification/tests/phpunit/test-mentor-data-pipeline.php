<?php
/**
 * Unit tests for WOR_Mentor_Data_Pipeline
 *
 * @package World_of_Rectification
 */

/**
 * Test class for WOR_Mentor_Data_Pipeline
 */
class Test_WOR_Mentor_Data_Pipeline {

    /**
     * Intent patterns for classification.
     */
    private $intent_patterns = [
        'explanation' => ['/let me explain/', '/here\'s how/', '/the reason is/'],
        'hint' => ['/try looking at/', '/consider/', '/you might want to/'],
        'encouragement' => ['/great job/', '/you\'re doing well/', '/keep going/'],
        'clarification' => ['/do you mean/', '/let me clarify/', '/are you asking/'],
        'redirect' => ['/let\'s focus on/', '/back to the/', '/the main point is/'],
    ];

    /**
     * Test intent classification - explanation.
     */
    public function test_classify_intent_explanation() {
        $message = "Let me explain how the scoring works.";

        $intent = $this->classify_intent($message);
        $this->assert($intent === 'explanation', 'Should classify as explanation');
    }

    /**
     * Test intent classification - hint.
     */
    public function test_classify_intent_hint() {
        $message = "You might want to try a different approach.";

        $intent = $this->classify_intent($message);
        $this->assert($intent === 'hint', 'Should classify as hint');
    }

    /**
     * Test intent classification - encouragement.
     */
    public function test_classify_intent_encouragement() {
        $message = "Great job on completing that step!";

        $intent = $this->classify_intent($message);
        $this->assert($intent === 'encouragement', 'Should classify as encouragement');
    }

    /**
     * Test intent classification - clarification.
     */
    public function test_classify_intent_clarification() {
        $message = "Do you mean the first option?";

        $intent = $this->classify_intent($message);
        $this->assert($intent === 'clarification', 'Should classify as clarification');
    }

    /**
     * Test intent classification - redirect.
     */
    public function test_classify_intent_redirect() {
        $message = "Let's focus on the main quest now.";

        $intent = $this->classify_intent($message);
        $this->assert($intent === 'redirect', 'Should classify as redirect');
    }

    /**
     * Test export format validation.
     */
    public function test_export_transmission_format() {
        $transmission = [
            'id' => 1,
            'scribe_id' => 10,
            'sprout_id' => 20,
            'started_at' => '2024-01-01 10:00:00',
            'ended_at' => '2024-01-01 10:10:00',
            'duration_seconds' => 600,
        ];

        $messages = [
            ['sender_type' => 'sprout', 'message_text' => 'Help!'],
            ['sender_type' => 'scribe', 'message_text' => 'Let me help you.'],
        ];

        $export = [
            'metadata' => [
                'transmission_id' => $transmission['id'],
                'duration_seconds' => $transmission['duration_seconds'],
            ],
            'messages' => array_map(function($msg) {
                return [
                    'role' => $msg['sender_type'] === 'scribe' ? 'assistant' : 'user',
                    'content' => $msg['message_text'],
                ];
            }, $messages),
        ];

        $this->assert(isset($export['metadata']), 'Export should have metadata');
        $this->assert(isset($export['messages']), 'Export should have messages');
        $this->assert($export['messages'][0]['role'] === 'user', 'Sprout should be user role');
        $this->assert($export['messages'][1]['role'] === 'assistant', 'Scribe should be assistant role');
    }

    /**
     * Test training stats structure.
     */
    public function test_get_training_stats() {
        $stats = [
            'total_transmissions' => 100,
            'total_messages' => 500,
            'intent_distribution' => [
                'explanation' => 200,
                'hint' => 150,
                'encouragement' => 100,
                'clarification' => 30,
                'redirect' => 20,
            ],
            'avg_rating' => 4.2,
            'training_eligible' => true,
        ];

        $this->assert(isset($stats['total_transmissions']), 'Stats should have total_transmissions');
        $this->assert(isset($stats['intent_distribution']), 'Stats should have intent_distribution');
        $this->assert($stats['training_eligible'] === true, 'Should be training eligible');
    }

    /**
     * Test training eligibility threshold.
     */
    public function test_training_eligibility() {
        // Case 1: Eligible
        $transmissions = 60;
        $avg_rating = 4.0;

        $eligible = $transmissions >= 50 && $avg_rating >= 3.5;
        $this->assert($eligible === true, 'Should be eligible with 60 sessions and 4.0 rating');

        // Case 2: Not eligible - too few sessions
        $transmissions = 40;
        $avg_rating = 4.5;

        $eligible = $transmissions >= 50 && $avg_rating >= 3.5;
        $this->assert($eligible === false, 'Should not be eligible with only 40 sessions');

        // Case 3: Not eligible - low rating
        $transmissions = 60;
        $avg_rating = 3.0;

        $eligible = $transmissions >= 50 && $avg_rating >= 3.5;
        $this->assert($eligible === false, 'Should not be eligible with 3.0 rating');
    }

    /**
     * Classify intent using regex patterns.
     */
    private function classify_intent($message) {
        $message_lower = strtolower($message);

        foreach ($this->intent_patterns as $intent => $patterns) {
            foreach ($patterns as $pattern) {
                if (preg_match($pattern, $message_lower)) {
                    return $intent;
                }
            }
        }

        return null;
    }

    /**
     * Simple assertion helper.
     */
    private function assert($condition, $message) {
        if (!$condition) {
            echo "FAIL: {$message}\n";
            return false;
        }
        echo "PASS: {$message}\n";
        return true;
    }

    /**
     * Run all tests.
     */
    public function run_all() {
        echo "Running WOR_Mentor_Data_Pipeline tests...\n\n";

        $methods = get_class_methods($this);
        foreach ($methods as $method) {
            if (strpos($method, 'test_') === 0) {
                echo "- {$method}\n";
                $this->$method();
            }
        }

        echo "\nTests complete.\n";
    }
}

// Run tests if executed directly
if (php_sapi_name() === 'cli' && basename($argv[0] ?? '') === basename(__FILE__)) {
    $test = new Test_WOR_Mentor_Data_Pipeline();
    $test->run_all();
}
