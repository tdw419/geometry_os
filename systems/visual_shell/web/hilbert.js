/**
 * Hilbert Curve Utilities for Geometry OS
 *
 * The Hilbert curve maps 1D indices to 2D coordinates while preserving locality.
 * This is used for the Glyph Atlas where Opcode N is at Hilbert(N).
 */

/**
 * Convert Hilbert index (d) to (x, y) coordinates.
 * @param {number} n - Grid size (must be power of 2)
 * @param {number} d - Hilbert index
 * @returns {[number, number]} - [x, y] coordinates
 */
export function d2xy(n, d) {
    let x = 0;
    let y = 0;
    let s = 1;
    let d2 = d;

    while (s < n) {
        const rx = 1 & (d2 / 2);
        const ry = 1 & (d2 ^ rx);

        // Rotate
        if (ry === 0) {
            if (rx === 1) {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            // Swap
            const t = x;
            x = y;
            y = t;
        }

        x += s * rx;
        y += s * ry;
        d2 = Math.floor(d2 / 4);
        s *= 2;
    }

    return [x, y];
}

/**
 * Convert (x, y) coordinates to Hilbert index (d).
 * @param {number} n - Grid size (must be power of 2)
 * @param {number} x - X coordinate
 * @param {number} y - Y coordinate
 * @returns {number} - Hilbert index
 */
export function xy2d(n, x, y) {
    let d = 0;
    let s = Math.floor(n / 2);

    while (s > 0) {
        let rx = 0;
        let ry = 0;

        if ((x & s) !== 0) rx = 1;
        if ((y & s) !== 0) ry = 1;

        d += s * s * ((3 * rx) ^ ry);

        // Rotate
        if (ry === 0) {
            if (rx === 1) {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            // Swap
            const t = x;
            x = y;
            y = t;
        }

        s = Math.floor(s / 2);
    }

    return d;
}

/**
 * Get the atlas coordinate for an opcode using Hilbert convention.
 * @param {number} opcode - The opcode (0-255)
 * @param {number} gridSize - Atlas grid size (default 256)
 * @param {number} cellSize - Size of each cell in pixels (default 64)
 * @returns {{x: number, y: number, px: number, py: number}}
 */
export function opcodeToAtlasCoord(opcode, gridSize = 256, cellSize = 64) {
    const [gx, gy] = d2xy(gridSize, opcode);
    return {
        gridX: gx,
        gridY: gy,
        px: gx * cellSize,
        py: gy * cellSize
    };
}

// Make available globally for non-module usage
if (typeof window !== 'undefined') {
    window.Hilbert = { d2xy, xy2d, opcodeToAtlasCoord };
}
