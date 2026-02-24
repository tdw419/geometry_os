<?php
/**
 * World of Rectification - Scribe Portal
 *
 * Handles Scribe registration, onboarding flows, and dashboard.
 */

if (!defined('ABSPATH')) {
    exit;
}

class WOR_Scribe_Portal {

    private $table_scribes;

    private $onboarding_flows = [
        'internal' => [
            [
                'title' => 'Technical Architecture',
                'type' => 'reading',
                'content' => 'World of Rectification is built as a WordPress plugin with custom database tables. The game uses CTRM (Cognitive Transparent Reasoning Model) scoring and integrates with TMS (Truth Management System). Key files: class-wor-quest.php handles quest post type, class-wor-ctrm.php calculates scores.'
            ],
            [
                'title' => 'Codebase Walkthrough',
                'type' => 'interactive',
                'url' => '#code-tour'
            ],
            [
                'title' => 'Sample Transmissions',
                'type' => 'review',
                'sessions' => []
            ],
            [
                'title' => 'Ghost Mentor Pipeline',
                'type' => 'reading',
                'content' => 'Ghost Mentors are AI agents trained from your mentorship sessions. Every message you send is classified by intent (explanation, hint, encouragement, etc.) and stored for training. High-quality sessions (rating 3.5+) become training data.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'What is CTRM?',
                        'options' => ['Cognitive Transparent Reasoning Model', 'Computer Training Resource Manager', 'Content Tracking Rating Method'],
                        'correct' => 0
                    ],
                    [
                        'question' => 'What happens to your mentorship messages?',
                        'options' => ['They are deleted after 24 hours', 'They are classified by intent and stored for AI training', 'They are published publicly'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What makes a session eligible for Ghost Mentor training?',
                        'options' => ['Any completed session', 'Sessions with rating 3.5+ stars', 'Sessions longer than 10 minutes'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 80
            ],
        ],
        'community' => [
            [
                'title' => 'What is World of Rectification?',
                'type' => 'reading',
                'content' => 'World of Rectification (WoR) is a game that transforms Tikkun Olam (repairing the world) into an engaging experience. Players discover "sparks" trapped in "husks" and liberate them through acts of rectification. Each decision earns CTRM points.'
            ],
            [
                'title' => 'Tikkun Olam & Sefirot',
                'type' => 'reading',
                'content' => 'The Sefirot are ten attributes through which the Divine interacts with the world. In WoR, each quest aligns with a Sefirah: Chesed (kindness), Gevurah (strength), Tiferet (beauty), etc. Your choices shape which Sefirot you embody.'
            ],
            [
                'title' => 'Practice Scenario',
                'type' => 'simulation',
                'scenario' => 'A player asks: "I chose the easy option but feel guilty. Was that wrong?" How would you respond?'
            ],
            [
                'title' => 'Vibe Coding',
                'type' => 'reading',
                'content' => 'As a Scribe, your explanations become part of the game. When you describe a concept in your own words, you are "vibe coding" - creating the tone and instructional logic that AI will replicate. Be authentic and helpful.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'What is a Spark in WoR?',
                        'options' => ['A fire hazard', 'A trapped element that can be liberated through good choices', 'A type of currency'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What should you do if a Sprout asks about a mechanic you do not know?',
                        'options' => ['Make something up', 'Admit you do not know and help find the answer together', 'Tell them to figure it out'],
                        'correct' => 1
                    ],
                    [
                        'question' => 'What is Vibe Coding?',
                        'options' => ['Writing code while dancing', 'Creating instructional tone that AI will replicate', 'A programming language'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 70
            ],
        ],
        'domain_expert' => [
            [
                'title' => 'Your Expertise',
                'type' => 'form',
                'fields' => [
                    ['name' => 'domain', 'label' => 'Your Area of Expertise', 'type' => 'text', 'required' => true],
                    ['name' => 'years', 'label' => 'Years of Experience', 'type' => 'number', 'required' => true],
                    ['name' => 'specialties', 'label' => 'Specialties (comma-separated)', 'type' => 'text', 'required' => false]
                ]
            ],
            [
                'title' => 'WoR + Your Domain',
                'type' => 'reading',
                'content' => 'Your expertise can enrich World of Rectification. Whether you are an educator, theologian, game designer, or other professional - your domain knowledge helps create authentic scenarios and meaningful mentorship moments.'
            ],
            [
                'title' => 'Create Sample Explanation',
                'type' => 'submission',
                'prompt' => 'Imagine a player is stuck on a scenario involving your domain expertise. Write a brief explanation (2-3 sentences) that would help them understand without giving away the answer:'
            ],
            [
                'title' => 'Review Existing Content',
                'type' => 'review',
                'content' => 'Browse the existing scenarios and consider how your expertise might improve them. Note any opportunities for richer, more authentic content.'
            ],
            [
                'title' => 'Certification',
                'type' => 'quiz',
                'questions' => [
                    [
                        'question' => 'How should domain expertise be applied in WoR?',
                        'options' => ['To make content more authentic and meaningful', 'To show off knowledge', 'To make scenarios harder'],
                        'correct' => 0
                    ],
                    [
                        'question' => 'A player asks about something in your domain. You should:',
                        'options' => ['Give a full lecture on the topic', 'Provide just enough context to help them decide', 'Tell them it is irrelevant to the game'],
                        'correct' => 1
                    ]
                ],
                'passing_score' => 75
            ],
        ],
    ];

    public function __construct() {
        global $wpdb;
        $this->table_scribes = $wpdb->prefix . 'wor_scribes';
    }

    /**
     * Get onboarding flow for a cohort
     */
    public function get_onboarding_flow(string $cohort): array {
        return $this->onboarding_flows[$cohort] ?? [];
    }

    /**
     * Get scribe by ID
     */
    public function get_scribe(int $scribe_id): ?array {
        global $wpdb;
        return $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE id = %d",
            $scribe_id
        ), ARRAY_A);
    }

    /**
     * Get scribe by WordPress user ID
     */
    public function get_scribe_by_user(int $user_id): ?array {
        global $wpdb;
        return $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM {$this->table_scribes} WHERE user_id = %d",
            $user_id
        ), ARRAY_A);
    }

    /**
     * Register a new Scribe
     */
    public function register_scribe(int $user_id, string $cohort, array $expertise = []): int|false {
        global $wpdb;

        // Check if already registered
        $existing = $this->get_scribe_by_user($user_id);
        if ($existing) {
            return false;
        }

        $result = $wpdb->insert($this->table_scribes, [
            'user_id' => $user_id,
            'cohort' => $cohort,
            'expertise_tags' => json_encode($expertise),
            'onboarding_step' => 0,
            'onboarding_completed' => 0,
        ]);

        if ($result === false) {
            return false;
        }

        $scribe_id = $wpdb->insert_id;

        // Send notification (fire and forget)
        $this->send_onboarding_email($user_id, $cohort);

        return $scribe_id;
    }

    /**
     * Send onboarding welcome email
     */
    private function send_onboarding_email(int $user_id, string $cohort): void {
        $user = get_user_by('id', $user_id);
        if (!$user) {
            return;
        }

        $subject = 'Welcome to WoR Scribes - ' . ucfirst($cohort) . ' Track';

        $messages = [
            'internal' => 'Welcome to the Scribe program! As an internal team member, you will learn the technical architecture and help build the Ghost Mentor training pipeline.',
            'community' => 'Welcome to the Scribe program! As a community volunteer, you will help newcomers discover the joy of Tikkun Olam through gameplay.',
            'domain_expert' => 'Welcome to the Scribe program! Your expertise will help create authentic, meaningful content for players.',
        ];

        $message = $messages[$cohort] ?? 'Welcome to the Scribe program!';

        wp_mail($user->user_email, $subject, $message);
    }

    /**
     * Complete an onboarding step
     */
    public function complete_step(int $scribe_id, int $step, array $response = []): array {
        global $wpdb;

        $scribe = $this->get_scribe($scribe_id);
        if (!$scribe) {
            return ['error' => 'Scribe not found'];
        }

        $flow = $this->onboarding_flows[$scribe['cohort']] ?? [];

        if ($step < 0 || $step >= count($flow)) {
            return ['error' => 'Invalid step'];
        }

        $step_config = $flow[$step];

        // Handle quiz validation
        if ($step_config['type'] === 'quiz') {
            $quiz_result = $this->grade_quiz($step_config, $response);
            if (!$quiz_result['passed']) {
                return [
                    'error' => 'Quiz not passed',
                    'score' => $quiz_result['score'],
                    'passing_score' => $step_config['passing_score']
                ];
            }
        }

        // Calculate next step
        $new_step = $step + 1;
        $completed = ($new_step >= count($flow));

        // Update database
        $wpdb->update(
            $this->table_scribes,
            [
                'onboarding_step' => $new_step,
                'onboarding_completed' => $completed ? 1 : 0,
                'ghost_training_eligible' => $completed ? 1 : 0,
            ],
            ['id' => $scribe_id]
        );

        return [
            'success' => true,
            'next_step' => $new_step,
            'completed' => $completed,
            'next_content' => $completed ? null : ($flow[$new_step] ?? null),
        ];
    }

    /**
     * Grade a quiz submission
     */
    private function grade_quiz(array $quiz_config, array $response): array {
        $questions = $quiz_config['questions'] ?? [];
        $answers = $response['answers'] ?? [];
        $passing_score = $quiz_config['passing_score'] ?? 70;

        $correct = 0;
        $total = count($questions);

        foreach ($questions as $i => $q) {
            if (isset($answers[$i]) && (int)$answers[$i] === (int)$q['correct']) {
                $correct++;
            }
        }

        $score = $total > 0 ? round(($correct / $total) * 100) : 0;

        return [
            'score' => $score,
            'correct' => $correct,
            'total' => $total,
            'passed' => $score >= $passing_score,
        ];
    }
}
