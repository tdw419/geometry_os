/**
 * Geometry OS - React-like Hooks System
 *
 * Provides optimized state management and DOM updates without React dependency.
 * Features:
 * - useState: State with change tracking
 * - useEffect: Side effects with dependencies
 * - useMemo: Memoized computed values
 * - useCallback: Stable callback references
 * - useReducer: Complex state logic
 * - Batched DOM updates
 * - Automatic change detection
 */

// Current rendering context
let currentComponent = null;
let hookIndex = 0;
let isBatching = false;
let pendingUpdates = [];

/**
 * Component base class with hooks support
 */
export class Component {
    constructor(container, props = {}) {
        this.container = typeof container === 'string'
            ? document.querySelector(container)
            : container;
        this.props = props;
        this.state = {};
        this._hooks = [];
        this._hookIndex = 0;
        this._mounted = false;
        this._pendingEffects = [];
        this._domCache = new Map();
        this._stateVersion = 0;
        this._changedKeys = new Set();

        // Bind render method
        this.render = this.render.bind(this);
    }

    /**
     * Mount the component
     */
    async mount() {
        currentComponent = this;
        this._hookIndex = 0;

        const vdom = this.render();
        this._applyVDOM(vdom);

        // Run effects
        this._runEffects();

        this._mounted = true;
        currentComponent = null;
    }

    /**
     * Update the component
     */
    update() {
        if (!this._mounted) return;

        if (isBatching) {
            pendingUpdates.push(() => this._performUpdate());
            return;
        }

        this._performUpdate();
    }

    _performUpdate() {
        currentComponent = this;
        this._hookIndex = 0;

        const oldVDOM = this._lastVDOM;
        const newVDOM = this.render();
        this._lastVDOM = newVDOM;

        // Diff and patch
        this._diffAndPatch(oldVDOM, newVDOM);

        // Run effects
        this._runEffects();

        currentComponent = null;
        this._changedKeys.clear();
        this._stateVersion++;
    }

    /**
     * Override in subclass
     */
    render() {
        return { type: 'div', props: {}, children: [] };
    }

    /**
     * Hook: useState - State with change tracking
     */
    useState(key, initialValue) {
        const hookIdx = this._hookIndex++;

        if (!this._hooks[hookIdx]) {
            this._hooks[hookIdx] = {
                type: 'state',
                key,
                value: typeof initialValue === 'function' ? initialValue() : initialValue
            };
        }

        const hook = this._hooks[hookIdx];

        const setValue = (newValue) => {
            const resolved = typeof newValue === 'function'
                ? newValue(hook.value)
                : newValue;

            if (hook.value !== resolved) {
                hook.value = resolved;
                this._changedKeys.add(key);
                this.update();
            }
        };

        return [hook.value, setValue];
    }

    /**
     * Hook: useEffect - Side effects with cleanup
     */
    useEffect(callback, deps = []) {
        const hookIdx = this._hookIndex++;

        if (!this._hooks[hookIdx]) {
            this._hooks[hookIdx] = {
                type: 'effect',
                callback,
                deps,
                cleanup: null
            };
        }

        const hook = this._hooks[hookIdx];
        const depsChanged = !deps || deps.length === 0 ||
            deps.some((dep, i) => dep !== hook.deps?.[i]);

        if (depsChanged) {
            this._pendingEffects.push({
                hook,
                callback,
                hookIdx
            });
            hook.deps = deps;
        }
    }

    /**
     * Hook: useMemo - Memoized computed values
     */
    useMemo(factory, deps) {
        const hookIdx = this._hookIndex++;

        if (!this._hooks[hookIdx]) {
            this._hooks[hookIdx] = {
                type: 'memo',
                value: factory(),
                deps
            };
        }

        const hook = this._hooks[hookIdx];
        const depsChanged = deps.some((dep, i) => dep !== hook.deps?.[i]);

        if (depsChanged) {
            hook.value = factory();
            hook.deps = deps;
        }

        return hook.value;
    }

    /**
     * Hook: useCallback - Stable callback references
     */
    useCallback(callback, deps) {
        return this.useMemo(() => callback, deps);
    }

    /**
     * Hook: useReducer - Complex state logic
     */
    useReducer(reducer, initialState) {
        const [state, setState] = useState('reducer', initialState);

        const dispatch = (action) => {
            setState(prev => reducer(prev, action));
        };

        return [state, dispatch];
    }

    /**
     * Hook: useRef - Mutable reference
     */
    useRef(initialValue) {
        const hookIdx = this._hookIndex++;

        if (!this._hooks[hookIdx]) {
            this._hooks[hookIdx] = {
                type: 'ref',
                current: initialValue
            };
        }

        return this._hooks[hookIdx];
    }

    /**
     * Cache DOM element reference
     */
    $(selector) {
        if (!this._domCache.has(selector)) {
            this._domCache.set(selector, this.container?.querySelector(selector));
        }
        return this._domCache.get(selector);
    }

    /**
     * Clear DOM cache (call when DOM structure changes)
     */
    _clearDOMCache() {
        this._domCache.clear();
    }

    /**
     * Run pending effects
     */
    _runEffects() {
        for (const { hook, callback } of this._pendingEffects) {
            // Cleanup previous
            if (hook.cleanup) {
                hook.cleanup();
            }

            // Run effect
            hook.cleanup = callback();
        }
        this._pendingEffects = [];
    }

    /**
     * Apply virtual DOM to container
     */
    _applyVDOM(vdom) {
        if (!vdom) return;

        this._lastVDOM = vdom;

        if (typeof vdom === 'string') {
            this.container.textContent = vdom;
            return;
        }

        const el = this._createElement(vdom);
        this.container.innerHTML = '';
        this.container.appendChild(el);
        this._clearDOMCache();
    }

    /**
     * Create DOM element from virtual DOM
     */
    _createElement(vdom) {
        if (typeof vdom === 'string' || typeof vdom === 'number') {
            return document.createTextNode(vdom);
        }

        const el = document.createElement(vdom.type);

        // Apply props
        for (const [key, value] of Object.entries(vdom.props || {})) {
            if (key === 'className') {
                el.className = value;
            } else if (key === 'style' && typeof value === 'object') {
                Object.assign(el.style, value);
            } else if (key.startsWith('on')) {
                el.addEventListener(key.slice(2).toLowerCase(), value);
            } else if (key === 'ref') {
                value.current = el;
            } else {
                el.setAttribute(key, value);
            }
        }

        // Children
        for (const child of vdom.children || []) {
            el.appendChild(this._createElement(child));
        }

        return el;
    }

    /**
     * Diff and patch DOM
     */
    _diffAndPatch(oldVDOM, newVDOM, parent = null, index = 0) {
        // Text nodes
        if (typeof oldVDOM === 'string' || typeof newVDOM === 'string') {
            if (oldVDOM !== newVDOM) {
                const el = parent?.childNodes[index];
                if (el && typeof newVDOM === 'string') {
                    el.textContent = newVDOM;
                }
            }
            return;
        }

        // Type changed
        if (oldVDOM?.type !== newVDOM?.type) {
            const el = this._createElement(newVDOM);
            const oldEl = parent?.childNodes[index];
            if (oldEl) {
                parent.replaceChild(el, oldEl);
            }
            return;
        }

        // Props changed
        const el = parent?.childNodes[index];
        if (el && newVDOM?.props) {
            this._updateProps(el, oldVDOM?.props || {}, newVDOM.props);
        }

        // Children
        const oldChildren = oldVDOM?.children || [];
        const newChildren = newVDOM?.children || [];
        const maxLen = Math.max(oldChildren.length, newChildren.length);

        for (let i = 0; i < maxLen; i++) {
            this._diffAndPatch(oldChildren[i], newChildren[i], el, i);
        }
    }

    /**
     * Update element props
     */
    _updateProps(el, oldProps, newProps) {
        // Remove old props
        for (const key of Object.keys(oldProps)) {
            if (!(key in newProps)) {
                if (key === 'className') {
                    el.className = '';
                } else if (key === 'style') {
                    el.style.cssText = '';
                } else if (key.startsWith('on')) {
                    el.removeEventListener(key.slice(2).toLowerCase(), oldProps[key]);
                } else {
                    el.removeAttribute(key);
                }
            }
        }

        // Set new props
        for (const [key, value] of Object.entries(newProps)) {
            if (oldProps[key] !== value) {
                if (key === 'className') {
                    el.className = value;
                } else if (key === 'style' && typeof value === 'object') {
                    Object.assign(el.style, value);
                } else if (key.startsWith('on')) {
                    if (oldProps[key]) {
                        el.removeEventListener(key.slice(2).toLowerCase(), oldProps[key]);
                    }
                    el.addEventListener(key.slice(2).toLowerCase(), value);
                } else {
                    el.setAttribute(key, value);
                }
            }
        }
    }

    /**
     * Check if state key changed
     */
    hasChanged(key) {
        return this._changedKeys.has(key);
    }

    /**
     * Batch multiple state updates
     */
    batch(fn) {
        isBatching = true;
        fn();
        isBatching = false;

        // Process all pending updates
        for (const update of pendingUpdates) {
            update();
        }
        pendingUpdates = [];
    }

    /**
     * Cleanup component
     */
    unmount() {
        // Run all cleanup functions
        for (const hook of this._hooks) {
            if (hook.type === 'effect' && hook.cleanup) {
                hook.cleanup();
            }
        }

        this._mounted = false;
        this._hooks = [];
        this._domCache.clear();
    }
}

/**
 * Functional component wrapper
 */
export function createComponent(renderFn, container, props = {}) {
    const comp = new Component(container, props);
    comp.render = function() {
        return renderFn.call(this, this.props, this);
    };
    return comp;
}

/**
 * Batch multiple updates together
 */
export function batch(fn) {
    isBatching = true;
    fn();
    isBatching = false;

    for (const update of pendingUpdates) {
        update();
    }
    pendingUpdates = [];
}

/**
 * Create a reactive store
 */
export function createStore(initialState) {
    let state = initialState;
    const listeners = new Set();
    const changedKeys = new Set();

    return {
        getState() {
            return state;
        },

        setState(updater) {
            const oldState = state;
            state = { ...state, ...updater(state) };

            // Track changed keys
            for (const key of Object.keys(state)) {
                if (state[key] !== oldState[key]) {
                    changedKeys.add(key);
                }
            }

            // Notify listeners
            for (const listener of listeners) {
                listener(state, changedKeys);
            }
            changedKeys.clear();
        },

        subscribe(listener) {
            listeners.add(listener);
            return () => listeners.delete(listener);
        },

        getChanged() {
            return Array.from(changedKeys);
        }
    };
}

/**
 * Optimized list renderer with key-based reconciliation
 */
export function renderList(items, renderFn, keyFn = (item, i) => i) {
    return items.map((item, index) => {
        const vdom = renderFn(item, index);
        vdom.key = keyFn(item, index);
        return vdom;
    });
}

/**
 * Conditional rendering helper
 */
export function when(condition, trueFn, falseFn = () => null) {
    return condition ? trueFn() : falseFn();
}

/**
 * HTML helper for creating virtual DOM
 */
export function h(type, props, ...children) {
    return {
        type,
        props: props || {},
        children: children.flat().filter(c => c != null)
    };
}

// Shorthand
export const html = new Proxy({}, {
    get(target, tag) {
        return (props, ...children) => h(tag, props, ...children);
    }
});

export default {
    Component,
    createComponent,
    createStore,
    batch,
    renderList,
    when,
    h,
    html
};
