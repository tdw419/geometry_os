const { app, BrowserWindow, screen } = require('electron');
const path = require('path');
const { spawn } = require('child_process');

// Determine environment
const isDev = !app.isPackaged;

// Global reference to prevent garbage collection
let mainWindow;
let backendProcess;

function startBackend() {
    // Start the Rust backend in headless mode
    // Adjust path as needed for production build
    const backendPath = path.join(__dirname, '../../../infinite_map_rs/target/release/infinite_map_rs'); // Dev path

    console.log('🚀 Launching Geometry OS Kernel (Rust Backend)...');

    // In dev, we assume cargo run or pre-built binary. 
    // For this demo, we'll try to run the binary if it exists, or skip if valid dev environment
    // For a true OS boot, this would be a systemd service, but here we spawn it as a child.

    // For now, we assume the user has the backend running or we let the web app handle connection failures gracefully.
    // In a "Real OS" boot, we would spawn:
    // backendProcess = spawn(backendPath, ['--headless']);
}

function createWindow() {
    // Get primary display dimensions
    const primaryDisplay = screen.getPrimaryDisplay();
    const { width, height } = primaryDisplay.workAreaSize;

    mainWindow = new BrowserWindow({
        width: width,
        height: height,
        x: 0,
        y: 0,
        frame: false, // OS-like experience (no title bar)
        fullscreen: true, // Kiosk mode
        backgroundColor: '#111111',
        webPreferences: {
            nodeIntegration: true, // Allow node access (safe for local OS shell)
            contextIsolation: false, // Simpler for prototype
            webSecurity: false // Allow loading local resources freely
        }
    });

    // Load the PixiJS Visual Shell
    // We can load the local file directly
    mainWindow.loadFile(path.join(__dirname, '../web/index.html'));

    // Open DevTools in dev mode
    if (isDev) {
        // mainWindow.webContents.openDevTools({ mode: 'detach' });
    }

    // Emulate OS behaviors
    mainWindow.on('closed', () => {
        mainWindow = null;
    });
}

// App Lifecycle
app.whenReady().then(() => {
    startBackend();
    createWindow();

    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) {
            createWindow();
        }
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
    if (backendProcess) {
        backendProcess.kill();
    }
});
