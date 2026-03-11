import { Container, Graphics, Mesh, Geometry, Shader } from 'pixi.js';

export class HSMLRenderer {
    constructor(app) {
        this.app = app;
        this.entityToRenderGroup = new Map();
        
        // Main container for the spatial world
        this.worldContainer = new Container();
        this.app.stage.addChild(this.worldContainer);
    }
    
    addEntity(entity) {
        // Create RenderGroup for spatial isolation (v8 optimization)
        const renderGroup = new Container();
        renderGroup.isRenderGroup = true; 
        
        renderGroup.position.set(entity.position.x || 0, entity.position.y || 0);

        // WebGPU Optimization: Use Meshes for common types
        const visual = this.createVisualForType(entity.type, entity.volume);
        renderGroup.addChild(visual);
        
        this.entityToRenderGroup.set(entity.id, renderGroup);
        this.worldContainer.addChild(renderGroup);
    }

    createVisualForType(type, volume) {
        const w = volume?.width || 32;
        
        if (type === 'data' || type === 'document') {
            // OPTIMIZATION: In a real system, we would share Geometry buffers
            // For now, we use standard Graphics for 100% compatibility across backends
            // until the 'shared_geometry' module is built.
            const g = new Graphics();
            g.circle(0, 0, w / 2);
            g.fill({ color: 0x00ccff, alpha: 0.8 });
            g.stroke({ width: 2, color: 0xffffff, alpha: 0.4 });
            return g;
        } 
        
        if (type === 'agent') {
             const g = new Graphics();
             g.rect(-w/2, -w/2, w, w);
             g.fill({ color: 0xffd700, alpha: 0.2 });
             g.stroke({ width: 1, color: 0xffd700 });
             return g;
        }

        const g = new Graphics();
        g.rect(-w/2, -w/2, w, w);
        g.stroke({ width: 1, color: 0x888888 });
        return g;
    }

    addRelationship(sourceId, targetId, relationType) {
        // Visualize the verb
        const sourceGroup = this.entityToRenderGroup.get(sourceId);
        const targetGroup = this.entityToRenderGroup.get(targetId);
        
        if (sourceGroup && targetGroup) {
             const link = new Graphics();
             link.moveTo(sourceGroup.x, sourceGroup.y);
             link.lineTo(targetGroup.x, targetGroup.y);
             link.stroke({ width: 1, color: 0xffffff, alpha: 0.2 });
             this.worldContainer.addChildAt(link, 0); // Background
        }
    }
}
