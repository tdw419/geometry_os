/**
 * WindowManager.js
 * Manages all desktop windows in the Geometry OS environment.
 */

class WindowManager {
    constructor(container) {
        this.container = container;
        this.windows = [];
    }

    createWindow(title, x, y, width, height) {
        const window = new DesktopWindow(title, x, y, width, height);

        // Listen for close event
        window.on('closed', () => {
            this.destroyWindow(window);
        });

        // Bring to front when clicked
        window.on('pointerdown', () => {
            this.bringToFront(window);
        });

        this.windows.push(window);
        this.container.addChild(window);
        this.bringToFront(window);
        return window;
    }

    destroyWindow(window) {
        const index = this.windows.indexOf(window);
        if (index > -1) {
            this.windows.splice(index, 1);
            if (window.parent === this.container) {
                this.container.removeChild(window);
            }
        }
    }

    bringToFront(window) {
        if (window.parent === this.container) {
            this.container.removeChild(window);
            this.container.addChild(window);
        }
    }

    createNotification(message, color = 0xFFFFFF, duration = 3000) {
        const notificationWindow = this.createWindow("Notification", 0, 0, 300, 50);
        notificationWindow.titleBar.visible = false; // No title bar for notifications
        notificationWindow.background.tint = color; // Use color as background tint
        notificationWindow.alpha = 0.9;

        const text = new PIXI.Text(message, {
            fontFamily: 'Courier New',
            fontSize: 12,
            fill: 0x000000, // Black text for contrast
            wordWrap: true,
            wordWrapWidth: 280,
        });
        text.anchor.set(0.5);
        text.x = notificationWindow.width / 2;
        text.y = notificationWindow.height / 2;
        notificationWindow.setContent(text);

        // Position at top center, for now
        notificationWindow.x = (this.container.parent.renderer.width / 2) - (notificationWindow.width / 2);
        notificationWindow.y = 10;

        // Auto-dismiss
        setTimeout(() => {
            this.destroyWindow(notificationWindow);
        }, duration);

        return notificationWindow;
    }
}
