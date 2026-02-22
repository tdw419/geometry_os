// systems/visual_shell/web/vfs_pyodide_bridge.js

/**
 * Exposes WebMCP VFS tools to Pyodide.
 * This module is designed to be imported by Pyodide, allowing Python agents
 * to interact with the in-browser Virtual File System.
 */

export const vfs = {
    /**
     * Reads the content of a file from the VFS.
     * @param {string} path - The path to the file.
     * @returns {Promise<string>} The content of the file.
     * @throws {Error} If the file is not found or VFS is not initialized.
     */
    read_file: async (path) => {
        if (!navigator.modelContext || !navigator.modelContext.toolHandlers || !navigator.modelContext.toolHandlers.vfs_read_file) {
            throw new Error("WebMCP tool 'vfs_read_file' not available.");
        }
        const result = await navigator.modelContext.toolHandlers.vfs_read_file({ path });
        if (!result.success) {
            throw new Error(result.error || "Failed to read file from VFS.");
        }
        return result.content;
    },

    /**
     * Writes content to a file in the VFS.
     * @param {string} path - The path to the file.
     * @param {string} content - The content to write.
     * @returns {Promise<boolean>} True if successful.
     * @throws {Error} If VFS is not initialized or write fails.
     */
    write_file: async (path, content) => {
        if (!navigator.modelContext || !navigator.modelContext.toolHandlers || !navigator.modelContext.toolHandlers.vfs_write_file) {
            throw new Error("WebMCP tool 'vfs_write_file' not available.");
        }
        const result = await navigator.modelContext.toolHandlers.vfs_write_file({ path, content });
        if (!result.success) {
            throw new Error(result.error || "Failed to write file to VFS.");
        }
        return true;
    },

    /**
     * Lists the contents of a directory in the VFS.
     * @param {string} path - The path to the directory.
     * @returns {Promise<Array<Object>>} An array of file/directory objects ({ name, type }).
     * @throws {Error} If VFS is not initialized or list fails.
     */
    list_dir: async (path = '/') => {
        if (!navigator.modelContext || !navigator.modelContext.toolHandlers || !navigator.modelContext.toolHandlers.vfs_list_dir) {
            throw new Error("WebMCP tool 'vfs_list_dir' not available.");
        }
        const result = await navigator.modelContext.toolHandlers.vfs_list_dir({ path });
        if (!result.success) {
            throw new Error(result.error || "Failed to list directory in VFS.");
        }
        // Pyodide converts JS arrays of objects into Python lists of PyProxy objects.
        // The .toJs() method with dict_converter: Object.fromEntries converts them back to plain JS objects.
        // This is crucial for seamless interaction within Python.
        return result.contents.map(item => item.toJs({ dict_converter: Object.fromEntries }));
    }
};
