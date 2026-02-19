/**
 * EventLog - Displays a scrollable, filterable list of swarm events.
 */

class EventLog {
    constructor(container) {
        this.container = container;
        this.element = document.createElement('div');
        this.element.className = 'event-log';
        
        this.listElement = null;
        this.filterType = 'all';
        
        this._initLayout();
        this.container.appendChild(this.element);
    }

    _initLayout() {
        const header = document.createElement('div');
        header.className = 'panel-header';
        header.textContent = 'Swarm Events';
        this.element.appendChild(header);

        const filterBar = document.createElement('div');
        filterBar.className = 'filter-bar';
        this.element.appendChild(filterBar);

        ['all', 'info', 'warn', 'error'].forEach(f => {
            const btn = document.createElement('button');
            btn.textContent = f.charAt(0).toUpperCase() + f.slice(1);
            btn.dataset.filter = f;
            if (f === 'all') btn.className = 'active';
            
            btn.onclick = () => {
                filterBar.querySelectorAll('button').forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                this.filter(f);
            };
            filterBar.appendChild(btn);
        });

        this.listElement = document.createElement('div');
        this.listElement.className = 'events-list';
        this.element.appendChild(this.listElement);
    }

    addEvent(message, severity = 'info') {
        const entry = document.createElement('div');
        entry.className = `event-entry ${severity}`;
        entry.dataset.severity = severity;
        
        const timeSpan = document.createElement('span');
        timeSpan.className = 'time';
        timeSpan.textContent = `[${new Date().toLocaleTimeString()}] `;
        
        const msgSpan = document.createElement('span');
        msgSpan.className = 'message';
        msgSpan.textContent = message;
        
        entry.appendChild(timeSpan);
        entry.appendChild(msgSpan);
        
        if (this.filterType !== 'all' && this.filterType !== severity) {
            entry.style.display = 'none';
        }
        
        this.listElement.prepend(entry);
        
        if (this.listElement.children.length > 100) {
            this.listElement.removeChild(this.listElement.lastChild);
        }
    }

    filter(type) {
        this.filterType = type;
        const entries = this.listElement.querySelectorAll('.event-entry');
        
        entries.forEach(entry => {
            if (type === 'all' || entry.dataset.severity === type) {
                entry.style.display = 'block';
            } else {
                entry.style.display = 'none';
            }
        });
    }
}

if (typeof window !== 'undefined') window.EventLog = EventLog;
