/**
 * Research Import Admin JavaScript
 *
 * Handles AJAX-based import triggering and status updates with progress polling.
 */
(function($) {
    'use strict';

    $(document).ready(function() {
        var $form = $('#research-import-form');
        var $btn = $('#run-import-btn');
        var $statusContainer = $('#import-status-container');
        var $statusMessage = $('#import-status-message');
        var $progressFill = $('#import-progress-fill');
        var $details = $('#import-details');

        var progressInterval = null;
        var POLL_INTERVAL = 2000; // Poll every 2 seconds

        /**
         * Start polling for import progress
         */
        function startProgressPolling() {
            if (progressInterval) {
                clearInterval(progressInterval);
            }
            progressInterval = setInterval(fetchProgress, POLL_INTERVAL);
            // Fetch immediately
            fetchProgress();
        }

        /**
         * Stop polling for import progress
         */
        function stopProgressPolling() {
            if (progressInterval) {
                clearInterval(progressInterval);
                progressInterval = null;
            }
        }

        /**
         * Fetch current import progress from server
         */
        function fetchProgress() {
            $.ajax({
                url: researchImport.ajax_url,
                type: 'POST',
                data: {
                    action: 'research_import_progress',
                    nonce: researchImport.nonce
                },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        var progress = response.data;

                        // Update progress bar
                        var percent = progress.percent || 0;
                        $progressFill.css('width', percent + '%');

                        // Update status message
                        if (progress.message) {
                            $statusMessage.text(progress.message);
                        }

                        // Update details with counts
                        var detailsText = '';
                        if (progress.total > 0) {
                            detailsText = 'Processed: ' + progress.processed + '/' + progress.total;
                            detailsText += ' | Created: ' + progress.created;
                            detailsText += ' | Updated: ' + progress.updated;
                            detailsText += ' | Skipped: ' + progress.skipped;
                            if (progress.errors > 0) {
                                detailsText += ' | Errors: ' + progress.errors;
                            }
                            $details.text(detailsText);
                        }

                        // Check if complete
                        if (progress.status === 'complete' || progress.status === 'error') {
                            stopProgressPolling();

                            if (progress.status === 'complete') {
                                $statusMessage.text('Import complete!');
                                $statusMessage.css('color', 'green');
                                $progressFill.css('width', '100%');

                                // Reload page after 2 seconds to show updated stats
                                setTimeout(function() {
                                    window.location.reload();
                                }, 2000);
                            } else {
                                $statusMessage.text('Import failed');
                                $statusMessage.css('color', 'red');
                                $btn.prop('disabled', false).text('Run Import');
                            }
                        }
                    }
                },
                error: function() {
                    // Silently fail on polling errors, keep trying
                }
            });
        }

        // Handle form submission via AJAX
        $form.on('submit', function(e) {
            e.preventDefault();

            // Disable button and show progress
            $btn.prop('disabled', true).text('Importing...');
            $statusContainer.show();
            $statusMessage.text('Starting import...');
            $statusMessage.css('color', '');
            $progressFill.css('width', '5%');
            $details.text('');

            // Clear any previous progress transient and start polling
            startProgressPolling();

            // Make AJAX request to start import (runs in background)
            $.ajax({
                url: researchImport.ajax_url,
                type: 'POST',
                data: {
                    action: 'research_import_start',
                    nonce: researchImport.nonce
                },
                dataType: 'json',
                timeout: 600000, // 10 minute timeout for large imports
                success: function(response) {
                    // Progress polling handles the UI updates
                    // This callback just logs the final result
                    if (!response.success) {
                        stopProgressPolling();
                        $progressFill.css('width', '100%');
                        $statusMessage.text('Import failed');
                        $statusMessage.css('color', 'red');
                        if (response.data && response.data.message) {
                            $details.html('<pre>' + response.data.message + '</pre>');
                        }
                        $btn.prop('disabled', false).text('Run Import');
                    }
                },
                error: function(xhr, status, error) {
                    stopProgressPolling();
                    $progressFill.css('width', '100%');
                    $statusMessage.text('Import failed');
                    $statusMessage.css('color', 'red');
                    $details.html('<pre>Error: ' + error + '</pre>');
                    $btn.prop('disabled', false).text('Run Import');
                }
            });
        });
    });

})(jQuery);
