/**
 * Geometry OS: Pyodide Executor
 *
 * Manages the Pyodide WASM Python runtime for in-browser Python execution.
 * Provides stdout/stderr capture, async execution, and result marshalling.
 *
 * @module pyodide_executor
 */

class PyodideExecutor {
    constructor(options = {}) {
        this.pyodide = null;
        this.loading = false;
        this.loaded = false;
        this.lastStdout = '';
        this.lastStderr = '';

        this.config = {
            pyodideUrl: 'https://cdn.jsdelivr.net/pyodide/v0.25.1/full/pyodide.js',
            indexUrl: 'https://cdn.jsdelivr.net/pyodide/v0.25.1/full/',
            loadTimeout: 60000,
            ...options
        };

        console.log(' PyodideExecutor created');
    }

    /**
     * Load the Pyodide runtime.
     * @returns {Promise<void>}
     */
    async load() {
        if (this.loaded) return;
        if (this.loading) {
            // Wait for existing load
            while (this.loading) {
                await new Promise(r => setTimeout(r, 100));
            }
            return;
        }

        this.loading = true;
        console.log(' Loading Pyodide runtime...');

        try {
            // loadPyodide is available globally after script loads
            this.pyodide = await loadPyodide({
                indexURL: this.config.indexUrl
            });

            // Set up stdout/stderr capture
            this.pyodide.runPython(`
import sys
from io import StringIO

class _CaptureOutput:
    def __init__(self):
        self.stdout = StringIO()
        self.stderr = StringIO()

    def get_stdout(self):
        return self.stdout.getvalue()

    def get_stderr(self):
        return self.stderr.getvalue()

    def clear(self):
        self.stdout = StringIO()
        self.stderr = StringIO()

_capture = _CaptureOutput()
sys.stdout = _capture.stdout
sys.stderr = _capture.stderr
`);

            // Inject the gemini bridge for calling WebMCP tools from Python
            this.pyodide.globals.set('gemini_tools', navigator.modelContext.toolHandlers);
            this.pyodide.runPython(`
import js
import asyncio

class Gemini:
    """
    A bridge to interact with the host Geometry OS WebMCP tools.
    """
    async def call_tool(self, tool_name, params_dict=None):
        """
        Asynchronously calls a registered WebMCP tool.

        Args:
            tool_name (str): The name of the tool to call.
            params_dict (dict, optional): A dictionary of parameters for the tool. Defaults to None.

        Returns:
            The result from the tool call.
        """
        if not hasattr(js.gemini_tools, tool_name):
            raise Exception(f"Tool '{tool_name}' not found in WebMCP tool handlers.")

        # Get the tool handler function from the JS side
        tool_handler = getattr(js.gemini_tools, tool_name)

        if params_dict is None:
            params_dict = {}

        # The handler returns a JS Promise. Await it.
        js_promise = tool_handler(params_dict)
        result = await js_promise

        # If the result is a PyProxy, it needs to be converted to a Python object
        if hasattr(result, 'to_py'):
            return result.to_py()
        return result

# Create a global instance for easy access
gemini = Gemini()
`);

            this.loaded = true;
            console.log(' Pyodide runtime loaded and Gemini bridge injected.');

        } catch (error) {
            console.error(' Failed to load Pyodide:', error);
            throw error;
        } finally {
            this.loading = false;
        }
    }

    /**
     * Run Python code and return the result.
     * @param {string} code - Python code to execute
     * @returns {Promise<any>} - Result of execution
     */
    async runPython(code) {
        if (!this.loaded) {
            await this.load();
        }

        // Clear capture buffers
        this.pyodide.runPython('_capture.clear()');

        try {
            // Execute the code
            const result = await this.pyodide.runPythonAsync(code);

            // Capture stdout/stderr
            this.lastStdout = this.pyodide.runPython('_capture.get_stdout()');
            this.lastStderr = this.pyodide.runPython('_capture.get_stderr()');

            return result;

        } catch (error) {
            // Still capture any output before the error
            this.lastStdout = this.pyodide.runPython('_capture.get_stdout()');
            this.lastStderr = this.pyodide.runPython('_capture.get_stderr()');

            throw error;
        }
    }

    /**
     * Run Python code with automatic result serialization.
     * @param {string} code - Python code to execute
     * @returns {Promise<{success: boolean, result: any, stdout: string, stderr: string}>}
     */
    async runPythonSafe(code) {
        try {
            const result = await this.runPython(code);
            return {
                success: true,
                result: this._serializeResult(result),
                stdout: this.lastStdout,
                stderr: this.lastStderr
            };
        } catch (error) {
            return {
                success: false,
                result: null,
                stdout: this.lastStdout,
                stderr: this.lastStderr,
                error: error.message
            };
        }
    }

    /**
     * Serialize Pyodide result to JSON-safe value.
     * @param {any} result - Pyodide result
     * @returns {any}
     */
    _serializeResult(result) {
        if (result === undefined || result === null) {
            return null;
        }
        // Pyodide proxies can be converted to JS types
        if (result.toJs) {
            return result.toJs();
        }
        return result;
    }

    /**
     * Load a Python package.
     * @param {string} packageName - Name of package to load
     * @returns {Promise<void>}
     */
    async loadPackage(packageName) {
        if (!this.loaded) {
            await this.load();
        }
        await this.pyodide.loadPackage(packageName);
    }

    /**
     * Get available Python version.
     * @returns {string}
     */
    getVersion() {
        if (!this.loaded) return 'not loaded';
        return this.pyodide.runPython('import sys; sys.version');
    }

    /**
     * Check if Pyodide is loaded and ready.
     * @returns {boolean}
     */
    isReady() {
        return this.loaded && this.pyodide !== null;
    }
}

// Export for browser
if (typeof window !== 'undefined') {
    window.PyodideExecutor = PyodideExecutor;
}

// Export for ES modules
export { PyodideExecutor };
