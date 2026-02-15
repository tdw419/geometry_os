// systems/visual_shell/web/testing_tools.js
/**
 * Continuous Testing Tools for WebMCP
 * ============================================================
 *
 * Provides 4 WebMCP tools for AI-assisted testing:
 *   40. test_select   - Select tests based on context
 *   41. test_run      - Execute tests with structured results
 *   42. test_analyze  - Analyze test failures
 *   43. test_suggest_fix - Generate fix suggestions
 *
 * Integration with Python backend:
 *   - WebSocket connection to ws://localhost:8765
 *   - Mock fallback when backend unavailable
 *
 * @version 1.0.0
 * @phase Phase O: Continuous Testing
 * @date 2026-02-15
 */

/**
 * Testing Tools for Continuous Validation
 */
class TestingTools {

    #bridge = null;
    #bridgeUrl = 'ws://localhost:8765';
    #connected = false;
    #mockMode = true;
    #socket = null;

    constructor(bridge) {
        this.#bridge = bridge;
        this.#initWebSocket();
    }

    /**
     * Initialize WebSocket connection to Python backend
     */
    async #initWebSocket() {
        try {
            this.#socket = new WebSocket(this.#bridgeUrl);

            this.#socket.onopen = () => {
                this.#connected = true;
                this.#mockMode = false;
                console.log('TestingTools: Connected to Python backend');
            };

            this.#socket.onclose = () => {
                this.#connected = false;
                this.#mockMode = true;
                console.log('TestingTools: Disconnected from Python backend');
            };

            this.#socket.onerror = (error) => {
                console.warn('TestingTools: WebSocket error, using mock mode');
                this.#mockMode = true;
            };
        } catch (e) {
            console.warn('TestingTools: Failed to connect, using mock mode');
            this.#mockMode = true;
        }
    }

    /**
     * Send request to Python backend
     */
    async #sendRequest(action, params) {
        if (this.#mockMode || !this.#connected) {
            return this.#mockResponse(action, params);
        }

        return new Promise((resolve, reject) => {
            const requestId = Date.now().toString(36) + Math.random().toString(36).slice(2);

            const handler = (event) => {
                try {
                    const response = JSON.parse(event.data);
                    if (response.requestId === requestId) {
                        this.#socket.removeEventListener('message', handler);
                        resolve(response);
                    }
                } catch (e) {
                    // Not our response, ignore
                }
            };

            this.#socket.addEventListener('message', handler);

            this.#socket.send(JSON.stringify({
                requestId,
                action,
                params
            }));

            // Timeout after 30 seconds
            setTimeout(() => {
                this.#socket.removeEventListener('message', handler);
                resolve(this.#mockResponse(action, params));
            }, 30000);
        });
    }

    /**
     * Generate mock response when backend unavailable
     */
    #mockResponse(action, params) {
        switch (action) {
            case 'test_select':
                return this.#mockSelect(params);
            case 'test_run':
                return this.#mockRun(params);
            case 'test_analyze':
                return this.#mockAnalyze(params);
            case 'test_suggest_fix':
                return this.#mockSuggestFix(params);
            default:
                return { success: false, error: `Unknown action: ${action}` };
        }
    }

    /**
     * Tool 40: test_select
     * Select tests based on context (changed files, coverage gaps, etc.)
     */
    async test_select(params = {}) {
        const { strategy = 'changed_files', changed_files = [], coverage_threshold = 80.0 } = params;

        return this.#sendRequest('test_select', {
            strategy,
            changed_files,
            coverage_threshold
        });
    }

    /**
     * Mock test selection
     */
    #mockSelect(params) {
        const { strategy, changed_files } = params;

        // Mock test mapping
        const testMapping = {
            'systems/pixel_compiler/wasm_gpu_bridge.py': [
                'systems/pixel_compiler/tests/test_wasm_gpu_bridge.py',
                'systems/pixel_compiler/tests/test_wasm_function_calls.py'
            ],
            'systems/pixel_compiler/infinite_map_v2.py': [
                'systems/pixel_compiler/tests/test_infinite_map_integration.py',
                'systems/pixel_compiler/tests/test_vat_parser.py'
            ]
        };

        let selectedTests = [];

        if (strategy === 'changed_files' && changed_files.length > 0) {
            for (const file of changed_files) {
                if (testMapping[file]) {
                    selectedTests.push(...testMapping[file]);
                }
            }
        } else if (strategy === 'full') {
            selectedTests = [
                'systems/pixel_compiler/tests/test_wasm_gpu_bridge.py',
                'systems/pixel_compiler/tests/test_infinite_map_integration.py',
                'systems/testing/tests/test_test_runner.py',
                'systems/testing/tests/test_failure_analyzer.py'
            ];
        } else if (strategy === 'coverage_gap') {
            selectedTests = [
                'systems/pixel_compiler/tests/test_pattern_detector.py'
            ];
        }

        return {
            success: true,
            strategy,
            selected_tests: [...new Set(selectedTests)],  // Dedupe
            count: selectedTests.length,
            mock: true
        };
    }

    /**
     * Tool 41: test_run
     * Execute tests and return structured results
     */
    async test_run(params = {}) {
        const {
            test_files = [],
            test_pattern,
            coverage = false,
            failfast = false,
            verbose = true
        } = params;

        return this.#sendRequest('test_run', {
            test_files,
            test_pattern,
            coverage,
            failfast,
            verbose
        });
    }

    /**
     * Mock test execution
     */
    #mockRun(params) {
        const { test_files, test_pattern, coverage } = params;

        // Simulate running tests
        const results = [
            {
                name: 'test_init_with_project_root',
                status: 'pass',
                duration_ms: 12,
                file: 'systems/testing/tests/test_test_runner.py',
                line: 15
            },
            {
                name: 'test_build_basic_command',
                status: 'pass',
                duration_ms: 8,
                file: 'systems/testing/tests/test_test_runner.py',
                line: 35
            },
            {
                name: 'test_run_returns_structured_results',
                status: 'pass',
                duration_ms: 45,
                file: 'systems/testing/tests/test_test_runner.py',
                line: 62
            },
            {
                name: 'test_classify_import_error',
                status: 'pass',
                duration_ms: 5,
                file: 'systems/testing/tests/test_failure_analyzer.py',
                line: 20
            },
            {
                name: 'test_analyze_returns_dict',
                status: 'fail',
                duration_ms: 23,
                error: "AssertionError: 'root_cause' not in result",
                file: 'systems/testing/tests/test_failure_analyzer.py',
                line: 55
            }
        ];

        const passed = results.filter(r => r.status === 'pass').length;
        const failed = results.filter(r => r.status === 'fail').length;

        return {
            success: failed === 0,
            total: results.length,
            passed,
            failed,
            skipped: 0,
            duration_ms: results.reduce((sum, r) => sum + r.duration_ms, 0),
            results,
            coverage: coverage ? {
                line_coverage: 85.5,
                branch_coverage: 72.3,
                files_covered: 15
            } : undefined,
            mock: true
        };
    }

    /**
     * Tool 42: test_analyze
     * Analyze test failures and identify root causes
     */
    async test_analyze(params = {}) {
        const { test_result, include_suggestions = true } = params;

        if (!test_result) {
            return { success: false, error: 'test_result is required' };
        }

        return this.#sendRequest('test_analyze', {
            test_result,
            include_suggestions
        });
    }

    /**
     * Mock failure analysis
     */
    #mockAnalyze(params) {
        const { test_result } = params;
        const errorText = test_result?.error || '';

        // Classify error type
        let failureType = 'unknown';
        let rootCause = 'Unknown error';

        if (errorText.includes('ImportError') || errorText.includes('ModuleNotFoundError')) {
            failureType = 'import_error';
            const match = errorText.match(/named ['"]?(\S+)['"]?/);
            rootCause = match ? `Missing module: ${match[1]}` : 'Import error';
        } else if (errorText.includes('AssertionError')) {
            failureType = 'assertion_error';
            rootCause = errorText.replace('AssertionError: ', '');
        } else if (errorText.includes('TypeError')) {
            failureType = 'type_error';
            rootCause = errorText.replace('TypeError: ', '');
        } else if (errorText.includes('AttributeError')) {
            failureType = 'attribute_error';
            rootCause = errorText.replace('AttributeError: ', '');
        }

        // Generate suggestion
        const suggestions = {
            import_error: `Install missing module or check import path`,
            assertion_error: `Review assertion logic - expected value differs from actual`,
            type_error: `Check function signatures and argument types`,
            attribute_error: `Check class initialization and attribute access`,
            unknown: `Review error message and stack trace`
        };

        return {
            success: true,
            test_name: test_result?.name || 'unknown',
            failure_type: failureType,
            root_cause: rootCause,
            stack_trace: [
                `File "${test_result?.file || 'unknown'}", line ${test_result?.line || 0}`,
                `  in ${test_result?.name || 'test'}`
            ],
            suggested_fix: suggestions[failureType],
            confidence: failureType === 'unknown' ? 0.3 : 0.8,
            related_files: test_result?.file ? [test_result.file] : [],
            mock: true
        };
    }

    /**
     * Tool 43: test_suggest_fix
     * Generate code fix suggestions for test failures
     */
    async test_suggest_fix(params = {}) {
        const { analysis, max_suggestions = 3 } = params;

        if (!analysis) {
            return { success: false, error: 'analysis is required' };
        }

        return this.#sendRequest('test_suggest_fix', {
            analysis,
            max_suggestions
        });
    }

    /**
     * Mock fix suggestion
     */
    #mockSuggestFix(params) {
        const { analysis, max_suggestions } = params;
        const failureType = analysis?.failure_type || 'unknown';
        const rootCause = analysis?.root_cause || '';
        const relatedFiles = analysis?.related_files || [];

        const suggestions = [];

        // Primary suggestion based on error type
        const fixTemplates = {
            import_error: {
                suggestion: `Install missing module: pip install <module_name>`,
                action: 'install',
                confidence: 0.9
            },
            assertion_error: {
                suggestion: `Review assertion in ${relatedFiles[0] || 'test file'}: ${rootCause}`,
                action: 'investigate',
                confidence: 0.6
            },
            type_error: {
                suggestion: `Fix type mismatch in ${relatedFiles[0] || 'source file'}`,
                action: 'edit',
                confidence: 0.7
            },
            attribute_error: {
                suggestion: `Check attribute access in ${relatedFiles[0] || 'source file'}`,
                action: 'edit',
                confidence: 0.7
            },
            unknown: {
                suggestion: `Investigate error: ${rootCause}`,
                action: 'investigate',
                confidence: 0.4
            }
        };

        const template = fixTemplates[failureType] || fixTemplates.unknown;

        suggestions.push({
            suggestion: template.suggestion,
            action: template.action,
            target_file: relatedFiles[0] || 'unknown',
            confidence: template.confidence,
            details: {
                failure_type: failureType,
                root_cause: rootCause
            }
        });

        // Add secondary suggestions for import errors
        if (failureType === 'import_error') {
            const moduleMatch = rootCause.match(/module[:\s]+['"]?(\S+)['"]?/);
            const moduleName = moduleMatch ? moduleMatch[1] : 'unknown';

            suggestions.push({
                suggestion: `Add '${moduleName}' to requirements.txt`,
                action: 'edit',
                target_file: 'requirements.txt',
                confidence: 0.85,
                details: {
                    line_to_add: moduleName
                }
            });
        }

        return {
            success: true,
            suggestions: suggestions.slice(0, max_suggestions),
            count: Math.min(suggestions.length, max_suggestions),
            mock: true
        };
    }

    /**
     * Register all testing tools with WebMCP bridge
     */
    registerTools(bridge) {
        // Tool 40: test_select
        bridge.registerTool('test_select', {
            description: 'Select tests to run based on context (changed files, coverage gaps, etc.)',
            inputSchema: {
                type: 'object',
                properties: {
                    strategy: {
                        type: 'string',
                        enum: ['changed_files', 'coverage_gap', 'full'],
                        description: 'Selection strategy'
                    },
                    changed_files: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Files that changed (for changed_files strategy)'
                    },
                    coverage_threshold: {
                        type: 'number',
                        description: 'Minimum coverage % (for coverage_gap strategy)'
                    }
                },
                required: ['strategy']
            },
            handler: async (params) => this.test_select(params)
        });

        // Tool 41: test_run
        bridge.registerTool('test_run', {
            description: 'Execute tests and return structured pass/fail results',
            inputSchema: {
                type: 'object',
                properties: {
                    test_files: {
                        type: 'array',
                        items: { type: 'string' },
                        description: 'Specific test files to run'
                    },
                    test_pattern: {
                        type: 'string',
                        description: 'Pattern to match tests (-k flag)'
                    },
                    coverage: {
                        type: 'boolean',
                        description: 'Collect coverage data'
                    },
                    failfast: {
                        type: 'boolean',
                        description: 'Stop on first failure'
                    },
                    verbose: {
                        type: 'boolean',
                        description: 'Verbose output'
                    }
                }
            },
            handler: async (params) => this.test_run(params)
        });

        // Tool 42: test_analyze
        bridge.registerTool('test_analyze', {
            description: 'Analyze test failures and identify root causes',
            inputSchema: {
                type: 'object',
                properties: {
                    test_result: {
                        type: 'object',
                        description: 'Test result from test_run'
                    },
                    include_suggestions: {
                        type: 'boolean',
                        description: 'Include fix suggestions in analysis'
                    }
                },
                required: ['test_result']
            },
            handler: async (params) => this.test_analyze(params)
        });

        // Tool 43: test_suggest_fix
        bridge.registerTool('test_suggest_fix', {
            description: 'Generate code fix suggestions for test failures',
            inputSchema: {
                type: 'object',
                properties: {
                    analysis: {
                        type: 'object',
                        description: 'FailureAnalysis from test_analyze'
                    },
                    max_suggestions: {
                        type: 'number',
                        description: 'Maximum number of suggestions'
                    }
                },
                required: ['analysis']
            },
            handler: async (params) => this.test_suggest_fix(params)
        });

        console.log('TestingTools: Registered 4 WebMCP tools');
    }
}

// Export for ES modules
if (typeof window !== 'undefined') {
    window.TestingTools = TestingTools;
}

export { TestingTools };
