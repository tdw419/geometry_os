"""
Memory Canvas Visual Debugger for Geometry OS
Renders the spatial state of the GlyphPool allocator.
"""

import json
from PIL import Image, ImageDraw

def render_spatial_state(json_state: str, output_path: str, grid_size: int = 512):
    """
    Render the spatial quadtree state to a PNG image.

    Args:
        json_state: JSON string from GlyphPool::dump_spatial_state
        output_path: Path to save the PNG
        grid_size: Side length of the grid
    """
    nodes = json.loads(json_state)
    
    # Create canvas
    img = Image.new('RGB', (grid_size, grid_size), color=(0, 0, 0))
    draw = ImageDraw.Draw(img)

    for node in nodes:
        x, y = node['x'], node['y']
        size = node['size']
        state = node['state'].lower()
        
        # Color based on state
        if state == "full":
            color = (255, 255, 255) # White = Allocated
        elif state == "free":
            color = (0, 100, 0) # Dark Green = Free
        else: # partial
            color = (150, 150, 0)

        # Draw rectangle
        draw.rectangle([x, y, x + size - 1, y + size - 1], fill=color, outline=(50, 50, 50))

    # Save image
    img.save(output_path)
    print(f"Memory canvas saved to {output_path}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'r') as f:
            state = f.read()
        render_spatial_state(state, "memory_canvas.png")
