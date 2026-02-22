<?php
/**
 * Simple Test Runner for ASCII Desktop Control
 *
 * Run with: php tests/php/run-tests.php
 *
 * For full WordPress integration tests, use:
 * vendor/bin/phpunit --configuration phpunit.xml
 */

// Prevent direct access
if (php_sapi_name() !== 'cli') {
    die('This script must be run from command line');
}

// Load bootstrap
require_once __DIR__ . '/bootstrap.php';

echo "\n";
echo "========================================\n";
echo " ASCII Desktop Control - PHP Tests\n";
echo "========================================\n\n";

// Track results
$total_tests = 0;
$passed_tests = 0;
$failed_tests = 0;

// Run all test classes
$test_classes = [
    'Test_Directive_API',
    'Test_ASCII_View',
    'Test_Daemon_Status',
    'Test_AJAX_Handlers',
];

foreach ($test_classes as $class_name) {
    echo "--- $class_name ---\n";

    if (class_exists($class_name)) {
        $test = new $class_name();
        $results = $test->run_all();

        foreach ($results as $method => $passed) {
            $total_tests++;
            if ($passed) {
                $passed_tests++;
            } else {
                $failed_tests++;
            }
        }
    } else {
        echo "Class not found: $class_name\n";
    }

    echo "\n";
}

// Summary
echo "========================================\n";
echo " Results: $passed_tests/$total_tests passed\n";
if ($failed_tests > 0) {
    echo " Failed: $failed_tests\n";
}
echo "========================================\n\n";

// Exit code
exit($failed_tests > 0 ? 1 : 0);
