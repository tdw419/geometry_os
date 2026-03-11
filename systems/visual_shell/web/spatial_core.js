/**
 * Geometry OS: Spatial Core Module
 * 
 * Foundation for viewport-driven infinite map rendering.
 * Implements O(1) spatial queries using various indexing strategies.
 * 
 * Supports:
 * 1. SpatialHash (Grid-based)
 * 2. HexSpatialIndex (Hexagon-based, matches Python H3 backend)
 * 3. Quadtree (Hierarchical)
 * 
 * @module spatial_core
 */

/**
 * SpatialHash - O(1) spatial indexing for fast tile queries
 * Best for square grids.
 */
class SpatialHash {
    constructor(cellSize = 100) {
        this.cellSize = cellSize;
        this.cells = new Map(); // "x,y" -> Set of items
        this.items = new Map();  // item.id -> { item, x, y, cellKey }
        this.size = 0;
    }

    _getCellKey(x, y) {
        const cellX = Math.floor(x / this.cellSize);
        const cellY = Math.floor(y / this.cellSize);
        return `${cellX},${cellY}`;
    }

    insert(item, x, y) {
        if (!item || item.id === undefined) {
            console.warn('SpatialHash.insert: item must have an id property');
            return;
        }
        if (this.items.has(item.id)) this.remove(item.id);

        const cellKey = this._getCellKey(x, y);

        if (!this.cells.has(cellKey)) this.cells.set(cellKey, new Set());
        this.cells.get(cellKey).add(item);

        this.items.set(item.id, { item, x, y, cellKey });
        this.size++;
    }

    remove(id) {
        const itemData = this.items.get(id);
        if (!itemData) return false;

        const { item, cellKey } = itemData;
        const cell = this.cells.get(cellKey);
        if (cell) {
            cell.delete(item);
            if (cell.size === 0) this.cells.delete(cellKey);
        }

        this.items.delete(id);
        this.size--;
        return true;
    }

    update(id, newX, newY) {
        const itemData = this.items.get(id);
        if (!itemData) return;
        this.remove(id);
        this.insert(itemData.item, newX, newY);
    }

    get(id) {
        const itemData = this.items.get(id);
        return itemData ? itemData.item : undefined;
    }

    queryCell(x, y) {
        const cellKey = this._getCellKey(x, y);
        const cell = this.cells.get(cellKey);
        return cell ? Array.from(cell) : [];
    }

    queryRange(minX, minY, maxX, maxY) {
        const results = new Set();
        const minCellX = Math.floor(minX / this.cellSize);
        const minCellY = Math.floor(minY / this.cellSize);
        const maxCellX = Math.floor(maxX / this.cellSize);
        const maxCellY = Math.floor(maxY / this.cellSize);

        for (let cx = minCellX; cx <= maxCellX; cx++) {
            for (let cy = minCellY; cy <= maxCellY; cy++) {
                const cell = this.cells.get(`${cx},${cy}`);
                if (cell) {
                    cell.forEach(item => {
                        const d = this.items.get(item.id);
                        if (d && d.x >= minX && d.x <= maxX && d.y >= minY && d.y <= maxY) {
                            results.add(item);
                        }
                    });
                }
            }
        }
        return Array.from(results);
    }

    queryRadius(centerX, centerY, radius) {
        const results = [];
        const rSq = radius * radius;
        const minCellX = Math.floor((centerX - radius) / this.cellSize);
        const minCellY = Math.floor((centerY - radius) / this.cellSize);
        const maxCellX = Math.floor((centerX + radius) / this.cellSize);
        const maxCellY = Math.floor((centerY + radius) / this.cellSize);

        for (let cx = minCellX; cx <= maxCellX; cx++) {
            for (let cy = minCellY; cy <= maxCellY; cy++) {
                const cell = this.cells.get(`${cx},${cy}`);
                if (cell) {
                    cell.forEach(item => {
                        const d = this.items.get(item.id);
                        if (d) {
                            const dx = d.x - centerX;
                            const dy = d.y - centerY;
                            if (dx * dx + dy * dy <= rSq) results.push(item);
                        }
                    });
                }
            }
        }
        return results;
    }

    getAll() { return Array.from(this.items.values()).map(d => d.item); }
    clear() { this.cells.clear(); this.items.clear(); this.size = 0; }
    getStats() { return { type: 'hash', items: this.size, cells: this.cells.size, cellSize: this.cellSize }; }
}

/**
 * HexSpatialIndex - Hexagonal spatial indexing (Axial Coordinates)
 * Matches the Geometry OS Python backend (systems/vectorland/spatial_index.py)
 * 
 * Ideal for organic movement and "H3" style world partitioning.
 */
class HexSpatialIndex {
    constructor(cellSize = 100) {
        this.cellSize = cellSize;
        this.cells = new Map(); // "q,r" -> Set of items
        this.items = new Map(); // item.id -> { item, q, r }
        this.size = 0;
    }

    _getCellKey(q, r) {
        return `${q},${r}`;
    }

    // Convert pixel to axial (q, r)
    _pixelToAxial(x, y) {
        const size = this.cellSize;
        const q = (Math.sqrt(3) / 3 * x - 1 / 3 * y) / size;
        const r = (2 / 3 * y) / size;
        return this._hexRound(q, r);
    }

    // Round cubic coords to nearest hex
    _hexRound(q, r) {
        let x = q;
        let z = r;
        let y = -x - z;

        let rx = Math.round(x);
        let ry = Math.round(y);
        let rz = Math.round(z);

        const x_diff = Math.abs(rx - x);
        const y_diff = Math.abs(ry - y);
        const z_diff = Math.abs(rz - z);

        if (x_diff > y_diff && x_diff > z_diff) {
            rx = -ry - rz;
        } else if (y_diff > z_diff) {
            ry = -rx - rz;
        } else {
            rz = -rx - ry;
        }

        return { q: rx, r: rz };
    }

    insert(item, x, y) {
        if (!item || item.id === undefined) return;
        if (this.items.has(item.id)) this.remove(item.id);

        const { q, r } = this._pixelToAxial(x, y);
        const key = this._getCellKey(q, r);

        if (!this.cells.has(key)) this.cells.set(key, new Set());
        this.cells.get(key).add(item);
        this.items.set(item.id, { item, q, r, x, y }); // Store x,y for exact queries
        this.size++;
    }

    remove(id) {
        const data = this.items.get(id);
        if (!data) return false;

        const key = this._getCellKey(data.q, data.r);
        if (this.cells.has(key)) {
            const set = this.cells.get(key);
            set.delete(data.item);
            if (set.size === 0) this.cells.delete(key);
        }
        this.items.delete(id);
        this.size--;
        return true;
    }

    update(id, x, y) {
        const data = this.items.get(id);
        if (!data) return;
        this.remove(id);
        this.insert(data.item, x, y);
    }

    get(id) {
        const d = this.items.get(id);
        return d ? d.item : undefined;
    }

    queryRadius(x, y, radiusPixels) {
        // Broadphase: Hex Ring
        const k = Math.ceil(radiusPixels / (this.cellSize * 0.866)); // 0.866 is sin(60)
        const center = this._pixelToAxial(x, y);
        const candidates = new Set();

        for (let dq = -k; dq <= k; dq++) {
            const lower = Math.max(-k, -dq - k);
            const upper = Math.min(k, -dq + k);
            for (let dr = lower; dr <= upper; dr++) {
                const key = this._getCellKey(center.q + dq, center.r + dr);
                if (this.cells.has(key)) {
                    this.cells.get(key).forEach(item => candidates.add(item));
                }
            }
        }

        // Narrowphase: Exact Distance using stored x,y
        const results = [];
        const rSq = radiusPixels * radiusPixels;
        candidates.forEach(item => {
            const d = this.items.get(item.id);
            if (d) {
                const dx = d.x - x;
                const dy = d.y - y;
                if (dx * dx + dy * dy <= rSq) results.push(item);
            }
        });
        return results;
    }

    queryRange(minX, minY, maxX, maxY) {
        // Approximate range with radius for hex grid
        const width = maxX - minX;
        const height = maxY - minY;
        const radius = Math.sqrt(width * width + height * height) / 2;
        const centerX = minX + width / 2;
        const centerY = minY + height / 2;
        const items = this.queryRadius(centerX, centerY, radius);

        // Strict cull
        return items.filter(item => {
            const d = this.items.get(item.id);
            return d && d.x >= minX && d.x <= maxX && d.y >= minY && d.y <= maxY;
        });
    }

    getAll() { return Array.from(this.items.values()).map(d => d.item); }
    clear() { this.cells.clear(); this.items.clear(); this.size = 0; }
    getStats() { return { type: 'hex', items: this.size, cells: this.cells.size, cellSize: this.cellSize }; }
}

/**
 * QuadtreeNode - Hierarchical spatial partitioning
 */
class QuadtreeNode {
    constructor(x, y, width, height, capacity = 4, maxDepth = 8, depth = 0) {
        this.bounds = { x, y, width, height };
        this.capacity = capacity;
        this.maxDepth = maxDepth;
        this.depth = depth;
        this.items = [];
        this.children = null;
        this.isLeaf = true;
    }

    contains(x, y) {
        return x >= this.bounds.x && x < this.bounds.x + this.bounds.width &&
            y >= this.bounds.y && y < this.bounds.y + this.bounds.height;
    }

    intersects(minX, minY, maxX, maxY) {
        return !(maxX < this.bounds.x || minX > this.bounds.x + this.bounds.width ||
            maxY < this.bounds.y || minY > this.bounds.y + this.bounds.height);
    }

    split() {
        if (this.children !== null || this.depth >= this.maxDepth) return;
        const halfWidth = this.bounds.width / 2;
        const halfHeight = this.bounds.height / 2;
        const { x, y } = this.bounds;

        this.children = [
            new QuadtreeNode(x, y, halfWidth, halfHeight, this.capacity, this.maxDepth, this.depth + 1),
            new QuadtreeNode(x + halfWidth, y, halfWidth, halfHeight, this.capacity, this.maxDepth, this.depth + 1),
            new QuadtreeNode(x, y + halfHeight, halfWidth, halfHeight, this.capacity, this.maxDepth, this.depth + 1),
            new QuadtreeNode(x + halfWidth, y + halfHeight, halfWidth, halfHeight, this.capacity, this.maxDepth, this.depth + 1)
        ];
        this.isLeaf = false;
        const items = this.items;
        this.items = [];
        items.forEach(item => this.insert(item));
    }

    insert(item) {
        if (!this.contains(item.x, item.y)) return false;
        if (this.isLeaf && this.items.length < this.capacity) {
            this.items.push(item);
            return true;
        }
        if (this.isLeaf) this.split();
        for (const child of this.children) {
            if (child.insert(item)) return true;
        }
        this.items.push(item);
        return true;
    }

    queryRange(minX, minY, maxX, maxY, results = []) {
        if (!this.intersects(minX, minY, maxX, maxY)) return results;
        for (const item of this.items) {
            if (item.x >= minX && item.x <= maxX && item.y >= minY && item.y <= maxY) {
                results.push(item);
            }
        }
        if (this.children) {
            for (const child of this.children) child.queryRange(minX, minY, maxX, maxY, results);
        }
        return results;
    }

    getStats() {
        const stats = { depth: this.depth, itemCount: this.items.length, isLeaf: this.isLeaf, children: 0 };
        if (this.children) {
            stats.children = this.children.length;
            for (const child of this.children) stats.itemCount += child.getStats().itemCount;
        }
        return stats;
    }
}

class Quadtree {
    constructor(x = -10000, y = -10000, width = 20000, height = 20000, capacity = 4, maxDepth = 8) {
        this.root = new QuadtreeNode(x, y, width, height, capacity, maxDepth);
        this.items = new Map();
        this.size = 0;
    }

    insert(item) {
        if (!item || item.id === undefined) {
            console.warn('Quadtree.insert: item must have id');
            return false;
        }
        const success = this.root.insert(item);
        if (success) {
            this.items.set(item.id, item);
            this.size++;
        }
        return success;
    }

    remove(id) {
        if (!this.items.has(id)) return false;
        this.items.delete(id);
        this.size--;
        // Simple rebuild
        const all = Array.from(this.items.values());
        this.clear();
        this.items = new Map(); // clear() resets roots but we need to re-add items map
        // Wait, clear resets root.
        all.forEach(i => { this.root.insert(i); this.items.set(i.id, i); });
        this.size = all.length;
        return true;
    }

    queryRange(minX, minY, maxX, maxY) { return this.root.queryRange(minX, minY, maxX, maxY, []); }
    getAll() { return Array.from(this.items.values()); }

    clear() {
        this.root = new QuadtreeNode(this.root.bounds.x, this.root.bounds.y, this.root.bounds.width, this.root.bounds.height, this.root.capacity, this.root.maxDepth);
        this.items.clear();
        this.size = 0;
    }

    getStats() { return { type: 'quadtree', items: this.size, tree: this.root.getStats() }; }
}

/**
 * SpatialIndex - Unified interface for spatial indexing
 * Automatically chooses between SpatialHash, HexSpatialIndex, and Quadtree.
 */
class SpatialIndex {
    /**
     * @param {Object} config
     * @param {string} config.type - 'hash', 'hex', or 'quadtree' (default: 'hash')
     * @param {number} config.cellSize - For hash or hex (default: 100)
     * @param {Object} config.bounds - For quadtree
     */
    constructor(config = {}) {
        this.type = config.type || 'hash';

        if (this.type === 'hex') {
            this.index = new HexSpatialIndex(config.cellSize || 100);
        } else if (this.type === 'quadtree') {
            const b = config.bounds || { x: -10000, y: -10000, width: 20000, height: 20000 };
            this.index = new Quadtree(b.x, b.y, b.width, b.height);
        } else {
            this.index = new SpatialHash(config.cellSize || 100);
        }
    }

    insert(item, x, y) {
        if (this.type === 'quadtree') {
            item.x = x; item.y = y;
            return this.index.insert(item);
        }
        return this.index.insert(item, x, y);
    }

    remove(id) { return this.index.remove(id); }

    update(id, newX, newY) {
        if (this.type === 'quadtree') {
            return this.index.remove(id) && this.index.insert({ id, x: newX, y: newY });
        }
        return this.index.update(id, newX, newY);
    }

    get(id) { return this.index.get(id); }
    queryRange(minX, minY, maxX, maxY) { return this.index.queryRange(minX, minY, maxX, maxY); }

    queryRadius(cx, cy, r) {
        if (this.type === 'quadtree') {
            return this.index.queryRange(cx - r, cy - r, cx + r, cy + r); // Approx
        }
        return this.index.queryRadius(cx, cy, r);
    }

    getAll() { return this.index.getAll(); }
    clear() { this.index.clear(); }
    getStats() { return this.index.getStats(); }
}

// Export
if (typeof window !== 'undefined') {
    window.SpatialHash = SpatialHash;
    window.HexSpatialIndex = HexSpatialIndex;
    window.Quadtree = Quadtree;
    window.QuadtreeNode = QuadtreeNode;
    window.SpatialIndex = SpatialIndex;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { SpatialHash, HexSpatialIndex, Quadtree, QuadtreeNode, SpatialIndex };
}
