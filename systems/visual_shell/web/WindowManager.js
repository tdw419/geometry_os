/**
 * WindowManager.js
 *
 * Manages window state: positions, z-order, focus, and drag operations.
 * Emits events for renderer to consume.
 */

export class WindowManager {
    constructor() {
        this.windows = new Map();  // appId -> { x, y, z, width, height, focused }
        this.dragState = null;     // { appId, offsetX, offsetY } | null
        this.topZ = 0;
        this._cascadeOffset = 0;   // For new window positioning
        this._listeners = new Map(); // event -> [callback, ...]
    }

    // === Event System ===

    on(event, callback) {
        if (!this._listeners.has(event)) {
            this._listeners.set(event, []);
        }
        this._listeners.get(event).push(callback);
    }

    off(event, callback) {
        const callbacks = this._listeners.get(event);
        if (callbacks) {
            const idx = callbacks.indexOf(callback);
            if (idx >= 0) callbacks.splice(idx, 1);
        }
    }

    emit(event, data) {
        const callbacks = this._listeners.get(event);
        if (callbacks) {
            callbacks.forEach(cb => cb(data));
        }
    }

    // === Window Management ===

    addWindow(appId, width, height) {
        // Cascade position: each new window offset by 30px
        const x = 100 + this._cascadeOffset;
        const y = 100 + this._cascadeOffset;
        this._cascadeOffset = (this._cascadeOffset + 30) % 150;

        this.topZ += 1;

        const windowState = {
            x,
            y,
            z: this.topZ,
            width,
            height,
            focused: this.windows.size === 0, // First window focused
        };

        this.windows.set(appId, windowState);

        // If this is the first window, focus it
        if (windowState.focused) {
            this.emit('window_focused', { appId });
        }

        this.emit('window_added', { appId, ...windowState });
        return windowState;
    }

    removeWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return false;

        this.windows.delete(appId);
        this.emit('window_removed', { appId });

        // If removed window was focused, focus another
        if (win.focused && this.windows.size > 0) {
            const nextAppId = this.windows.keys().next().value;
            this.focusWindow(nextAppId);
        }

        return true;
    }

    focusWindow(appId) {
        const win = this.windows.get(appId);
        if (!win) return;

        // Unfocus current focused window
        for (const [id, w] of this.windows) {
            if (w.focused && id !== appId) {
                w.focused = false;
            }
        }

        // Focus new window and bring to front
        win.focused = true;
        this.topZ += 1;
        win.z = this.topZ;

        this.emit('window_focused', { appId });
    }

    getWindow(appId) {
        return this.windows.get(appId);
    }

    getFocusedApp() {
        for (const [appId, win] of this.windows) {
            if (win.focused) return appId;
        }
        return null;
    }

    // === Drag Operations ===

    startDrag(appId, mouseX, mouseY) {
        const win = this.windows.get(appId);
        if (!win) return;

        this.dragState = {
            appId,
            offsetX: mouseX - win.x,
            offsetY: mouseY - win.y,
        };

        // Focus on drag start
        this.focusWindow(appId);
    }

    updateDrag(mouseX, mouseY) {
        if (!this.dragState) return;

        const win = this.windows.get(this.dragState.appId);
        if (!win) return;

        let newX = mouseX - this.dragState.offsetX;
        let newY = mouseY - this.dragState.offsetY;

        // Clamp to stay partially visible (at least 50px on screen)
        const screenW = globalThis.innerWidth || 800;
        const screenH = globalThis.innerHeight || 600;
        newX = Math.max(-win.width * 10 + 50, Math.min(newX, screenW - 50));
        newY = Math.max(0, Math.min(newY, screenH - 50));

        win.x = newX;
        win.y = newY;

        this.emit('window_moved', {
            appId: this.dragState.appId,
            x: newX,
            y: newY,
        });
    }

    endDrag() {
        this.dragState = null;
    }

    isDragging() {
        return this.dragState !== null;
    }

    getDragAppId() {
        return this.dragState?.appId ?? null;
    }
}
