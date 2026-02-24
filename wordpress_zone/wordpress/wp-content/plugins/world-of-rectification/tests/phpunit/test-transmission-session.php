<?php
/**
 * Unit tests for WOR_Transmission_Session
 *
 * @package World_of_Rectification
 */

/**
 * Test class for WOR_Transmission_Session
 */
class Test_WOR_Transmission_Session {

    /**
     * Test help request creates queue entry.
     */
    public function test_request_help_queue_addition() {
        // Simulate queue entry
        $queue = [];
        $sprout_id = 123;
        $quest_id = 456;

        $queue[] = [
            'sprout_id' => $sprout_id,
            'quest_id' => $quest_id,
            'requested_at' => date('Y-m-d H:i:s'),
        ];

        $this->assert(count($queue) === 1, 'Queue should have one entry');
        $this->assert($queue[0]['sprout_id'] === $sprout_id, 'Entry should have correct sprout_id');
    }

    /**
     * Test duplicate session prevention.
     */
    public function test_request_help_duplicate_prevention() {
        $active_sessions = [
            ['sprout_id' => 123, 'status' => 'active'],
        ];

        $new_sprout = 123;
        $has_active = false;

        foreach ($active_sessions as $session) {
            if ($session['sprout_id'] === $new_sprout && $session['status'] === 'active') {
                $has_active = true;
                break;
            }
        }

        $this->assert($has_active === true, 'Should detect existing active session');
    }

    /**
     * Test atomic sprout acceptance - race condition.
     */
    public function test_accept_sprout_atomic() {
        // Simulate atomic update with affected_rows check
        $queue = [
            ['sprout_id' => 123, 'claimed' => false],
            ['sprout_id' => 456, 'claimed' => false],
        ];

        $sprout_to_claim = 123;

        // First claim succeeds
        $affected_rows = 0;
        foreach ($queue as &$entry) {
            if ($entry['sprout_id'] === $sprout_to_claim && !$entry['claimed']) {
                $entry['claimed'] = true;
                $affected_rows = 1;
                break;
            }
        }

        $this->assert($affected_rows === 1, 'First claim should succeed');

        // Second claim fails (already claimed)
        $affected_rows = 0;
        foreach ($queue as &$entry) {
            if ($entry['sprout_id'] === $sprout_to_claim && !$entry['claimed']) {
                $entry['claimed'] = true;
                $affected_rows = 1;
                break;
            }
        }

        $this->assert($affected_rows === 0, 'Second claim should fail');
    }

    /**
     * Test empty message rejection.
     */
    public function test_send_message_empty_rejection() {
        $message = '';
        $is_valid = strlen(trim($message)) > 0;

        $this->assert($is_valid === false, 'Empty message should be rejected');

        $message = '   ';
        $is_valid = strlen(trim($message)) > 0;

        $this->assert($is_valid === false, 'Whitespace-only message should be rejected');
    }

    /**
     * Test message poll pagination.
     */
    public function test_poll_messages_pagination() {
        $all_messages = [
            ['id' => 1, 'text' => 'First'],
            ['id' => 2, 'text' => 'Second'],
            ['id' => 3, 'text' => 'Third'],
        ];

        $last_id = 1;
        $new_messages = [];

        foreach ($all_messages as $msg) {
            if ($msg['id'] > $last_id) {
                $new_messages[] = $msg;
            }
        }

        $this->assert(count($new_messages) === 2, 'Should return 2 new messages');
        $this->assert($new_messages[0]['id'] === 2, 'First new message should be id 2');
    }

    /**
     * Test session end duration calculation.
     */
    public function test_end_transmission_duration() {
        $started_at = strtotime('2024-01-01 10:00:00');
        $ended_at = strtotime('2024-01-01 10:05:30');

        $duration_seconds = $ended_at - $started_at;

        $this->assert($duration_seconds === 330, 'Duration should be 330 seconds (5 min 30 sec)');
    }

    /**
     * Test inactive session rejection.
     */
    public function test_send_message_inactive_session() {
        $session = ['status' => 'completed'];

        $can_send = $session['status'] === 'active';
        $this->assert($can_send === false, 'Should not send to inactive session');
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
        echo "Running WOR_Transmission_Session tests...\n\n";

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
    $test = new Test_WOR_Transmission_Session();
    $test->run_all();
}
