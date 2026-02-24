/**
 * World of Rectification - Chat Widget
 *
 * Handles real-time chat communication between Scribes and Sprouts.
 * Uses 2-second polling for MVP simplicity.
 */
(function($) {
    'use strict';

    // Global widget object
    window.WoRChatWidget = {
        // State
        config: {
            restUrl: '',
            nonce: '',
            transmissionId: null,
            sproutId: null,
            userId: null,
            isLoggedIn: false,
            pollInterval: 2000, // 2 seconds
        },
        state: {
            lastMessageId: 0,
            sessionStatus: 'idle', // idle, waiting, active, completed, abandoned
            pollTimer: null,
            queuePosition: 0,
        },

        /**
         * Initialize the chat widget.
         *
         * @param {Object} options Configuration options.
         */
        init: function(options) {
            this.config = $.extend({}, this.config, options);

            // Bind event handlers
            this.bindEvents();

            // If transmission already active, start polling
            if (this.config.transmissionId) {
                this.state.sessionStatus = 'active';
                this.startPolling();
            }
        },

        /**
         * Bind event handlers.
         */
        bindEvents: function() {
            var self = this;

            // Help button click
            $(document).on('click', '.wor-help-button', function(e) {
                e.preventDefault();
                var questId = $(this).data('quest-id') || 0;
                self.openChatModal();
                self.requestHelp(questId);
            });

            // Close modal
            $(document).on('click', '.wor-chat-close, .wor-chat-overlay', function() {
                self.closeChatModal();
            });

            // Send message
            $(document).on('click', '.wor-chat-send', function() {
                var message = $('.wor-chat-input').val().trim();
                if (message) {
                    self.sendMessage(message, self.getUserType());
                    $('.wor-chat-input').val('');
                }
            });

            // Send on Enter
            $(document).on('keypress', '.wor-chat-input', function(e) {
                if (e.which === 13) {
                    e.preventDefault();
                    $('.wor-chat-send').click();
                }
            });

            // Accept sprout (for Scribes)
            $(document).on('click', '.wor-accept-sprout', function() {
                var sproutId = $(this).data('sprout-id');
                self.acceptSprout(sproutId);
            });

            // Complete step (for onboarding)
            $(document).on('click', '.wor-complete-step', function() {
                var step = $(this).data('step');
                self.completeOnboardingStep(step, {});
            });

            // Quiz submission
            $(document).on('submit', '.wor-quiz-form', function(e) {
                e.preventDefault();
                var $form = $(this);
                var step = $form.data('step');
                var responses = [];

                $form.find('.wor-quiz-question').each(function(qIdx) {
                    var selected = $(this).find('input:checked').val();
                    responses.push(parseInt(selected) || 0);
                });

                self.completeOnboardingStep(step, { answers: responses });
            });

            // End session with rating
            $(document).on('click', '.wor-submit-rating', function() {
                var rating = $('input[name="wor-rating"]:checked').val();
                var feedback = $('.wor-feedback-text').val();
                if (rating) {
                    self.endSession(parseInt(rating), feedback);
                }
            });

            // Rating star click
            $(document).on('click', '.wor-rating-star', function() {
                var rating = $(this).data('rating');
                $('.wor-rating-star').removeClass('active');
                $('.wor-rating-star').each(function() {
                    if ($(this).data('rating') <= rating) {
                        $(this).addClass('active');
                    }
                });
                $('input[name="wor-rating"]').val(rating);
            });
        },

        /**
         * Open the chat modal.
         */
        openChatModal: function() {
            $('#wor-chat-modal').fadeIn(200);
            $('body').addClass('wor-modal-open');
        },

        /**
         * Close the chat modal.
         */
        closeChatModal: function() {
            $('#wor-chat-modal').fadeOut(200);
            $('body').removeClass('wor-modal-open');

            // Stop polling
            if (this.state.pollTimer) {
                clearTimeout(this.state.pollTimer);
                this.state.pollTimer = null;
            }
        },

        /**
         * Get the user type (scribe or sprout).
         *
         * @return {string} User type.
         */
        getUserType: function() {
            // If we have a transmission and started it, we're a Sprout
            // If we accepted it, we're a Scribe
            // For simplicity, check if we have a sproutId set
            return this.config.sproutId ? 'sprout' : 'scribe';
        },

        /**
         * Request help from a Scribe.
         *
         * @param {number} questId Quest ID for context.
         * @param {string} topic Optional topic.
         */
        requestHelp: function(questId, topic) {
            var self = this;

            this.state.sessionStatus = 'waiting';
            this.renderWaitingState();

            $.ajax({
                url: this.config.restUrl + '/transmission/request',
                method: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                data: {
                    quest_id: questId,
                    topic: topic || ''
                },
                success: function(response) {
                    if (response.transmission_id) {
                        self.config.transmissionId = response.transmission_id;
                        self.config.sproutId = response.sprout_id;
                        self.state.sessionStatus = 'active';
                        self.startPolling();
                    } else if (response.queue_position) {
                        self.state.queuePosition = response.queue_position;
                        self.updateQueuePosition(response.queue_position);
                    }
                },
                error: function(xhr) {
                    self.showError('Failed to request help. Please try again.');
                    self.state.sessionStatus = 'idle';
                }
            });
        },

        /**
         * Accept a Sprout (for Scribes).
         *
         * @param {number} sproutId Sprout ID to accept.
         */
        acceptSprout: function(sproutId) {
            var self = this;

            $.ajax({
                url: this.config.restUrl + '/transmission/accept',
                method: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                data: {
                    sprout_id: sproutId
                },
                success: function(response) {
                    if (response.transmission_id) {
                        self.config.transmissionId = response.transmission_id;
                        self.state.sessionStatus = 'active';
                        self.openChatModal();
                        self.renderChatState();
                        self.startPolling();

                        // Refresh dashboard queue
                        if (typeof location !== 'undefined') {
                            location.reload();
                        }
                    } else if (response.error) {
                        self.showError(response.error);
                    }
                },
                error: function() {
                    self.showError('Failed to accept Sprout. They may have been claimed by another Scribe.');
                }
            });
        },

        /**
         * Complete an onboarding step.
         *
         * @param {number} step Step number.
         * @param {Object} response Response data.
         */
        completeOnboardingStep: function(step, response) {
            var self = this;

            $.ajax({
                url: this.config.restUrl + '/scribe/complete-step',
                method: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                data: {
                    step: step,
                    response: response
                },
                success: function(result) {
                    if (result.completed) {
                        // Onboarding complete
                        location.reload();
                    } else if (result.error && result.quiz_failed) {
                        self.showError('Quiz score: ' + result.score + '%. Need ' + result.passing_score + '% to pass. Please try again.');
                    } else if (result.next_step !== undefined) {
                        location.reload();
                    }
                },
                error: function() {
                    self.showError('Failed to complete step. Please try again.');
                }
            });
        },

        /**
         * Start polling for messages.
         */
        startPolling: function() {
            var self = this;

            if (this.state.pollTimer) {
                clearTimeout(this.state.pollTimer);
            }

            this.pollMessages();
        },

        /**
         * Poll for new messages.
         */
        pollMessages: function() {
            var self = this;

            if (!this.config.transmissionId || this.state.sessionStatus !== 'active') {
                return;
            }

            $.ajax({
                url: this.config.restUrl + '/transmission/' + this.config.transmissionId + '/messages',
                method: 'GET',
                data: {
                    last: this.state.lastMessageId
                },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                success: function(response) {
                    if (response.messages && response.messages.length > 0) {
                        self.appendMessages(response.messages);
                        self.state.lastMessageId = response.last_id || self.state.lastMessageId;
                    }

                    // Check session status
                    if (response.session_status === 'completed' || response.session_status === 'abandoned') {
                        self.state.sessionStatus = response.session_status;

                        if (response.session_status === 'completed' && self.getUserType() === 'sprout') {
                            self.renderRatingForm();
                        } else {
                            self.renderSessionEnded(response.session_status);
                        }

                        return; // Stop polling
                    }

                    // Continue polling
                    self.state.pollTimer = setTimeout(function() {
                        self.pollMessages();
                    }, self.config.pollInterval);
                },
                error: function() {
                    // Retry after delay
                    self.state.pollTimer = setTimeout(function() {
                        self.pollMessages();
                    }, self.config.pollInterval * 2);
                }
            });
        },

        /**
         * Send a message.
         *
         * @param {string} message Message text.
         * @param {string} senderType 'scribe' or 'sprout'.
         */
        sendMessage: function(message, senderType) {
            var self = this;

            $.ajax({
                url: this.config.restUrl + '/transmission/' + this.config.transmissionId + '/send',
                method: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                data: {
                    message: message,
                    sender_type: senderType
                },
                success: function(response) {
                    if (response.message_id) {
                        // Message sent, will be picked up by polling
                    } else if (response.error) {
                        self.showError(response.error);
                    }
                },
                error: function() {
                    self.showError('Failed to send message. Please try again.');
                }
            });
        },

        /**
         * End the transmission session.
         *
         * @param {number} rating Rating (1-5).
         * @param {string} feedback Optional feedback.
         */
        endSession: function(rating, feedback) {
            var self = this;

            $.ajax({
                url: this.config.restUrl + '/transmission/' + this.config.transmissionId + '/end',
                method: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-WP-Nonce', self.config.nonce);
                },
                data: {
                    rating: rating,
                    feedback: feedback || ''
                },
                success: function(response) {
                    if (response.success) {
                        self.state.sessionStatus = 'completed';
                        self.renderSessionEnded('completed');
                        self.closeChatModal();

                        // Show thank you message
                        setTimeout(function() {
                            alert('Thank you for your feedback! Session duration: ' + response.duration_seconds + ' seconds.');
                        }, 300);
                    } else if (response.error) {
                        self.showError(response.error);
                    }
                },
                error: function() {
                    self.showError('Failed to end session. Please try again.');
                }
            });
        },

        /**
         * Append messages to the chat container.
         *
         * @param {Array} messages Array of message objects.
         */
        appendMessages: function(messages) {
            var $container = $('.wor-chat-messages');

            messages.forEach(function(msg) {
                var senderClass = 'wor-msg-' + msg.sender_type;
                var html = '<div class="wor-message ' + senderClass + '" data-id="' + msg.id + '">' +
                    '<div class="wor-msg-content">' + self.escapeHtml(msg.message_text) + '</div>' +
                    '<div class="wor-msg-time">' + msg.created_at + '</div>' +
                    '</div>';
                $container.append(html);
            });

            // Scroll to bottom
            $container.scrollTop($container[0].scrollHeight);
        },

        /**
         * Render the waiting state (in queue).
         */
        renderWaitingState: function() {
            var html = '<div class="wor-waiting-state">' +
                '<div class="wor-spinner"></div>' +
                '<p>Requesting help from a Scribe...</p>' +
                '<p class="wor-queue-position">Queue position: <span class="wor-position-num">' + this.state.queuePosition + '</span></p>' +
                '</div>';

            $('.wor-chat-body').html(html);
        },

        /**
         * Update queue position display.
         *
         * @param {number} position Queue position.
         */
        updateQueuePosition: function(position) {
            $('.wor-position-num').text(position);

            if (position === 0 || position === 1) {
                $('.wor-waiting-state p:first').text('Connecting you to a Scribe...');
            }
        },

        /**
         * Render the active chat state.
         */
        renderChatState: function() {
            var html = '<div class="wor-chat-messages"></div>' +
                '<div class="wor-chat-input-area">' +
                '<input type="text" class="wor-chat-input" placeholder="Type your message...">' +
                '<button class="wor-chat-send">Send</button>' +
                '</div>';

            $('.wor-chat-body').html(html);
        },

        /**
         * Render the rating form.
         */
        renderRatingForm: function() {
            var html = '<div class="wor-rating-form">' +
                '<h3>Rate Your Session</h3>' +
                '<p>How helpful was your Scribe?</p>' +
                '<div class="wor-rating-stars">' +
                '<span class="wor-rating-star" data-rating="1">★</span>' +
                '<span class="wor-rating-star" data-rating="2">★</span>' +
                '<span class="wor-rating-star" data-rating="3">★</span>' +
                '<span class="wor-rating-star" data-rating="4">★</span>' +
                '<span class="wor-rating-star" data-rating="5">★</span>' +
                '</div>' +
                '<input type="hidden" name="wor-rating" value="">' +
                '<textarea class="wor-feedback-text" placeholder="Optional feedback..."></textarea>' +
                '<button class="wor-button wor-submit-rating">Submit Rating</button>' +
                '</div>';

            $('.wor-chat-body').html(html);
        },

        /**
         * Render session ended state.
         *
         * @param {string} status End status.
         */
        renderSessionEnded: function(status) {
            var message = status === 'completed' ? 'Session ended.' : 'Session was abandoned.';
            var html = '<div class="wor-session-ended">' +
                '<p>' + message + '</p>' +
                '<button class="wor-button wor-close-chat">Close</button>' +
                '</div>';

            $('.wor-chat-body').html(html);
        },

        /**
         * Show an error message.
         *
         * @param {string} message Error message.
         */
        showError: function(message) {
            alert(message); // Simple alert for MVP
        },

        /**
         * Escape HTML entities.
         *
         * @param {string} text Text to escape.
         * @return {string} Escaped text.
         */
        escapeHtml: function(text) {
            var div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }
    };

    // Auto-initialize if config available
    $(document).ready(function() {
        if (typeof worChatData !== 'undefined') {
            WoRChatWidget.init(worChatData);
        }
    });

})(jQuery);
