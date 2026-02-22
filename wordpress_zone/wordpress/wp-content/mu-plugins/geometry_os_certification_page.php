<?php
/**
 * Plugin Name: Geometry OS Certification Page
 * Description: Dedicated page for running certification tests with live logs
 */

if (!defined('ABSPATH')) exit;

class GeometryOS_CertificationPage {

    public function __construct() {
        add_action('admin_menu', [$this, 'add_menu']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_scripts']);
    }

    public function add_menu() {
        add_submenu_page(
            'tools.php',
            'Run Certifications',
            'Run Certifications',
            'manage_options',
            'geoos-certify',
            [$this, 'render_page']
        );
    }

    public function enqueue_scripts($hook) {
        if ($hook !== 'tools_page_geoos-certify') return;

        $map_server = 'http://localhost:8888';

        // Enqueue certification scripts
        wp_enqueue_script(
            'certification-tests',
            $map_server . '/CertificationTests.js',
            [],
            time(),
            true
        );
        wp_enqueue_script(
            'certification-runner',
            $map_server . '/CertificationRunner.js',
            ['certification-tests'],
            time(),
            true
        );
    }

    public function render_page() {
        ?>
        <div class="wrap">
            <h1>Geometry OS Certification Runner</h1>

            <div style="display: flex; gap: 20px; margin-top: 20px;">
                <!-- Controls Panel -->
                <div style="width: 300px; background: #1a1a2e; color: #fff; padding: 20px; border-radius: 8px;">
                    <h2 style="color: #00ffcc; margin-top: 0;">Run Tests</h2>

                    <button id="run-all-btn" class="button button-primary button-large" style="width: 100%; margin-bottom: 10px;">
                         Run All Certifications
                    </button>

                    <button id="run-level1-btn" class="button" style="width: 100%; margin-bottom: 5px;">
                        Level 1: Functional
                    </button>
                    <button id="run-level2-btn" class="button" style="width: 100%; margin-bottom: 5px;">
                        Level 2: Performance
                    </button>
                    <button id="run-level3-btn" class="button" style="width: 100%; margin-bottom: 15px;">
                        Level 3: Operational
                    </button>

                    <button id="reset-btn" class="button" style="width: 100%;">
                         Reset
                    </button>

                    <hr style="border-color: #3a3a5e; margin: 20px 0;">

                    <h3 style="color: #00ffcc;">Progress</h3>
                    <div id="progress-container">
                        <div id="progress-bar" style="background: #3a3a5e; height: 20px; border-radius: 4px; overflow: hidden;">
                            <div id="progress-fill" style="background: #00ffcc; height: 100%; width: 0%; transition: width 0.3s;"></div>
                        </div>
                        <p id="progress-text" style="text-align: center; margin: 10px 0;">Ready</p>
                    </div>

                    <div id="summary" style="display: none;">
                        <h3 style="color: #00ffcc;">Summary</h3>
                        <p id="summary-grade" style="font-size: 48px; text-align: center; margin: 0;">-</p>
                        <p id="summary-text" style="text-align: center;">-</p>
                    </div>
                </div>

                <!-- Log Panel -->
                <div style="flex: 1; background: #0d0d1a; color: #0f0; padding: 20px; border-radius: 8px; font-family: monospace;">
                    <h2 style="color: #00ffcc; margin-top: 0;">Live Log</h2>
                    <div id="log-output" style="height: 500px; overflow-y: auto; font-size: 13px; line-height: 1.6;">
                        <p style="color: #666;">Waiting for certification run...</p>
                    </div>
                </div>
            </div>

            <!-- Interactive Prompt Modal -->
            <div id="prompt-modal" style="display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.8); z-index: 9999;">
                <div style="background: #1a1a2e; color: #fff; max-width: 500px; margin: 100px auto; padding: 30px; border-radius: 8px; border: 2px solid #00ffcc;">
                    <h2 style="color: #00ffcc; margin-top: 0;">Interactive Test</h2>
                    <p id="prompt-message" style="font-size: 16px; line-height: 1.6;"></p>
                    <div style="margin-top: 20px; display: flex; gap: 10px;">
                        <button id="prompt-pass" class="button button-primary">Pass</button>
                        <button id="prompt-fail" class="button">Fail</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
        document.addEventListener('DOMContentLoaded', function() {
            const logOutput = document.getElementById('log-output');
            const progressFill = document.getElementById('progress-fill');
            const progressText = document.getElementById('progress-text');
            const summary = document.getElementById('summary');
            const summaryGrade = document.getElementById('summary-grade');
            const summaryText = document.getElementById('summary-text');
            const promptModal = document.getElementById('prompt-modal');
            const promptMessage = document.getElementById('prompt-message');

            let currentPromptTestId = null;

            function log(message, type = 'info') {
                const colors = {
                    info: '#0ff',
                    success: '#0f0',
                    error: '#f00',
                    warn: '#ff0'
                };
                const time = new Date().toLocaleTimeString();
                logOutput.innerHTML += `<p style="color: ${colors[type] || '#fff'}">[${time}] ${message}</p>`;
                logOutput.scrollTop = logOutput.scrollHeight;
            }

            function clearLog() {
                logOutput.innerHTML = '';
            }

            // Initialize runner when scripts load
            function initRunner() {
                if (typeof CertificationRunner === 'undefined' || typeof CertificationTests === 'undefined') {
                    setTimeout(initRunner, 100);
                    return;
                }

                const runner = new CertificationRunner({ stopOnFail: false });
                window.GeometryOSCertRunner = runner;

                // Event handlers
                runner.on('suite:start', (e) => {
                    clearLog();
                    log(`Starting certification suite (${e.testCount} tests)`, 'info');
                    summary.style.display = 'none';
                });

                runner.on('level:start', (e) => {
                    log(`\n=== Level ${e.level} (${e.testCount} tests) ===`, 'info');
                });

                runner.on('progress', (e) => {
                    const pct = Math.round((e.current / e.total) * 100);
                    progressFill.style.width = pct + '%';
                    progressText.textContent = `${e.current}/${e.total}: ${e.testName}`;
                });

                runner.on('test:start', (e) => {
                    log(`  Running: ${e.test.name}...`, 'info');
                });

                runner.on('test:complete', (e) => {
                    const icon = e.success ? 'PASS' : 'FAIL';
                    log(`  ${icon}: ${e.name}: ${e.details}`, e.success ? 'success' : 'error');
                });

                runner.on('prompt', (e) => {
                    currentPromptTestId = e.testId;
                    promptMessage.textContent = e.message;
                    promptModal.style.display = 'block';
                });

                runner.on('suite:complete', (e) => {
                    log(`\nCertification Complete!`, 'success');
                    const s = e.summary;
                    log(`   Passed: ${s.passed}/${s.total} (${s.percentage}%)`, s.percentage === 100 ? 'success' : 'warn');

                    summaryGrade.textContent = s.grade;
                    summaryGrade.style.color = s.grade === 'A' ? '#0f0' : s.grade === 'F' ? '#f00' : '#ff0';
                    summaryText.textContent = `${s.passed}/${s.total} tests passed`;
                    summary.style.display = 'block';
                });

                runner.on('level:complete', (e) => {
                    const s = e.summary;
                    log(`  Level ${e.level}: ${s.passed}/${s.total} passed (${s.grade})`, 'info');
                });

                log('Certification runner initialized', 'success');
            }

            initRunner();

            // Button handlers
            document.getElementById('run-all-btn').addEventListener('click', () => {
                if (window.GeometryOSCertRunner) {
                    window.GeometryOSCertRunner.runAll();
                }
            });

            document.getElementById('run-level1-btn').addEventListener('click', () => {
                if (window.GeometryOSCertRunner) window.GeometryOSCertRunner.runLevel(1);
            });

            document.getElementById('run-level2-btn').addEventListener('click', () => {
                if (window.GeometryOSCertRunner) window.GeometryOSCertRunner.runLevel(2);
            });

            document.getElementById('run-level3-btn').addEventListener('click', () => {
                if (window.GeometryOSCertRunner) window.GeometryOSCertRunner.runLevel(3);
            });

            document.getElementById('reset-btn').addEventListener('click', () => {
                if (window.GeometryOSCertRunner) {
                    window.GeometryOSCertRunner.reset();
                    clearLog();
                    progressFill.style.width = '0%';
                    progressText.textContent = 'Ready';
                    summary.style.display = 'none';
                    log('Reset complete', 'info');
                }
            });

            // Prompt handlers
            document.getElementById('prompt-pass').addEventListener('click', () => {
                if (window.GeometryOSCertRunner && currentPromptTestId) {
                    window.GeometryOSCertRunner.respond(currentPromptTestId, true, 'User verified');
                }
                promptModal.style.display = 'none';
            });

            document.getElementById('prompt-fail').addEventListener('click', () => {
                if (window.GeometryOSCertRunner && currentPromptTestId) {
                    window.GeometryOSCertRunner.respond(currentPromptTestId, false, 'User marked as failed');
                }
                promptModal.style.display = 'none';
            });
        });
        </script>
        <?php
    }
}

new GeometryOS_CertificationPage();
