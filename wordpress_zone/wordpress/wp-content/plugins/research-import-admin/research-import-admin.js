/**
 * Research Import Admin JavaScript
 *
 * Handles AJAX-based import triggering and status updates.
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

        // Handle form submission via AJAX
        $form.on('submit', function(e) {
            e.preventDefault();

            // Disable button and show progress
            $btn.prop('disabled', true).text('Importing...');
            $statusContainer.show();
            $statusMessage.text('Starting import...');
            $progressFill.css('width', '10%');
            $details.text('');

            // Make AJAX request
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
                    $progressFill.css('width', '100%');

                    if (response.success) {
                        $statusMessage.text('Import complete!');
                        $statusMessage.css('color', 'green');
                        $details.html('<pre>' + response.data.message + '</pre>');

                        // Reload page after 2 seconds to show updated stats
                        setTimeout(function() {
                            window.location.reload();
                        }, 2000);
                    } else {
                        $statusMessage.text('Import failed');
                        $statusMessage.css('color', 'red');
                        if (response.data && response.data.message) {
                            $details.html('<pre>' + response.data.message + '</pre>');
                        }
                        $btn.prop('disabled', false).text('Run Import');
                    }
                },
                error: function(xhr, status, error) {
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
