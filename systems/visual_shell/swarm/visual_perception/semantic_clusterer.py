"""
SemanticClusterer Module

Clusters OCR elements into semantic UI groups based on spatial proximity
and content patterns. Identifies UI components like menu bars, button groups,
and form fields.
"""

from dataclasses import dataclass, field
from typing import List, Tuple, Optional
import math


@dataclass
class OCRElement:
    """
    Represents a single OCR-detected text element with position and dimensions.

    Attributes:
        text: The detected text string
        x: Left edge position in pixels
        y: Top edge position in pixels
        width: Element width in pixels
        height: Element height in pixels
    """
    text: str
    x: int
    y: int
    width: int
    height: int

    @property
    def center(self) -> Tuple[int, int]:
        """Calculate the center point of the element."""
        return (self.x + self.width // 2, self.y + self.height // 2)

    @property
    def right(self) -> int:
        """Get the right edge coordinate."""
        return self.x + self.width

    @property
    def bottom(self) -> int:
        """Get the bottom edge coordinate."""
        return self.y + self.height

    def distance_to(self, other: 'OCRElement') -> float:
        """Calculate Euclidean distance between centers of two elements."""
        cx1, cy1 = self.center
        cx2, cy2 = other.center
        return math.sqrt((cx2 - cx1) ** 2 + (cy2 - cy1) ** 2)

    def is_adjacent_to(self, other: 'OCRElement', threshold: int = 50) -> bool:
        """
        Check if this element is spatially adjacent to another.

        Uses both horizontal and vertical proximity thresholds.
        """
        # Check horizontal proximity
        h_gap = min(
            abs(self.right - other.x),      # self left of other
            abs(other.right - self.x),       # other left of self
        )

        # Check vertical proximity
        v_gap = min(
            abs(self.bottom - other.y),      # self above other
            abs(other.bottom - self.y),      # other above self
        )

        # Elements are adjacent if they're close in either direction
        return h_gap < threshold or v_gap < threshold


@dataclass
class UICluster:
    """
    Represents a cluster of OCR elements that form a semantic UI component.

    Attributes:
        label: Semantic label for the cluster (e.g., 'menu_bar', 'form', 'button_group')
        elements: List of OCRElements in this cluster
    """
    label: str
    elements: List[OCRElement] = field(default_factory=list)

    @property
    def bounds(self) -> Tuple[int, int, int, int]:
        """
        Calculate bounding box of all elements.

        Returns:
            Tuple of (min_x, min_y, max_right, max_bottom)
        """
        if not self.elements:
            return (0, 0, 0, 0)

        min_x = min(e.x for e in self.elements)
        min_y = min(e.y for e in self.elements)
        max_right = max(e.right for e in self.elements)
        max_bottom = max(e.bottom for e in self.elements)

        return (min_x, min_y, max_right, max_bottom)

    @property
    def center(self) -> Tuple[int, int]:
        """Calculate the center of the bounding box."""
        min_x, min_y, max_right, max_bottom = self.bounds
        return ((min_x + max_right) // 2, (min_y + max_bottom) // 2)

    def add_element(self, element: OCRElement) -> None:
        """Add an element to the cluster."""
        self.elements.append(element)


class SemanticClusterer:
    """
    Clusters OCR elements into semantic UI groups.

    Uses spatial proximity and content analysis to identify UI components
    like menu bars, button groups, form fields, etc.
    """

    # Distance thresholds for clustering
    HORIZONTAL_THRESHOLD = 50  # Pixels for horizontal adjacency
    VERTICAL_THRESHOLD = 40    # Pixels for vertical adjacency

    # Keywords for semantic labeling
    MENU_KEYWORDS = {'file', 'edit', 'view', 'help', 'window', 'tools', 'options'}
    FORM_KEYWORDS = {'name', 'email', 'phone', 'address', 'password', 'username', 'login'}
    BUTTON_KEYWORDS = {'ok', 'cancel', 'submit', 'save', 'open', 'close', 'yes', 'no', 'apply'}

    def cluster(self, elements: List[OCRElement]) -> List[UICluster]:
        """
        Cluster OCR elements into semantic UI groups.

        Args:
            elements: List of OCRElement objects to cluster

        Returns:
            List of UICluster objects representing semantic UI components
        """
        if not elements:
            return []

        # First pass: group by spatial proximity
        spatial_groups = self._spatial_cluster(elements)

        # Second pass: assign semantic labels
        clusters = []
        for group in spatial_groups:
            label = self._infer_label(group)
            cluster = UICluster(label=label, elements=group)
            clusters.append(cluster)

        return clusters

    def _spatial_cluster(self, elements: List[OCRElement]) -> List[List[OCRElement]]:
        """
        Group elements by spatial proximity using a simple neighbor-based algorithm.
        """
        if not elements:
            return []

        # Track which elements have been assigned to groups
        unassigned = set(range(len(elements)))
        groups = []

        while unassigned:
            # Start a new group with the first unassigned element
            seed_idx = unassigned.pop()
            group = [elements[seed_idx]]
            group_indices = {seed_idx}

            # Expand group by finding neighbors
            changed = True
            while changed:
                changed = False
                # Check remaining unassigned elements
                for idx in list(unassigned):
                    elem = elements[idx]
                    # Check if this element is adjacent to any in the current group
                    for group_elem in group:
                        if self._is_adjacent(elem, group_elem):
                            group.append(elem)
                            group_indices.add(idx)
                            unassigned.remove(idx)
                            changed = True
                            break

            groups.append(group)

        return groups

    def _is_adjacent(self, elem1: OCRElement, elem2: OCRElement) -> bool:
        """Check if two elements are spatially adjacent."""
        # Calculate horizontal gap
        h_gap = max(0, max(elem1.x, elem2.x) - min(elem1.right, elem2.right))

        # Calculate vertical gap
        v_gap = max(0, max(elem1.y, elem2.y) - min(elem1.bottom, elem2.bottom))

        # For true diagonal adjacency, we need both gaps to be small
        # or one gap to be zero and the other small

        if h_gap == 0:
            # Vertically aligned, check vertical gap
            return v_gap < self.VERTICAL_THRESHOLD
        elif v_gap == 0:
            # Horizontally aligned, check horizontal gap
            return h_gap < self.HORIZONTAL_THRESHOLD
        else:
            # Diagonal - use combined threshold
            return h_gap < self.HORIZONTAL_THRESHOLD and v_gap < self.VERTICAL_THRESHOLD

    def _infer_label(self, elements: List[OCRElement]) -> str:
        """
        Infer a semantic label for a group of elements based on their content.
        """
        if not elements:
            return "unknown"

        texts = [e.text.lower() for e in elements]

        # Check for menu bar patterns (horizontal row of menu keywords)
        if len(elements) >= 2:
            # Check if elements are horizontally aligned
            y_positions = [e.y for e in elements]
            if max(y_positions) - min(y_positions) < 30:  # Same row
                # Check for menu keywords
                menu_matches = sum(1 for t in texts if t in self.MENU_KEYWORDS)
                if menu_matches >= 2:
                    return "menu_bar"

        # Check for form patterns (vertical alignment with form keywords)
        if len(elements) >= 2:
            x_positions = [e.x for e in elements]
            if max(x_positions) - min(x_positions) < 30:  # Same column
                form_matches = sum(1 for t in texts if any(kw in t for kw in self.FORM_KEYWORDS))
                if form_matches >= 1:
                    return "form"

        # Check for button patterns
        button_matches = sum(1 for t in texts if t in self.BUTTON_KEYWORDS)
        if button_matches >= 1:
            return "button_group"

        # Default label based on layout
        if len(elements) >= 2:
            y_positions = [e.y for e in elements]
            x_positions = [e.x for e in elements]
            y_spread = max(y_positions) - min(y_positions)
            x_spread = max(x_positions) - min(x_positions)

            if y_spread > x_spread * 2:
                return "vertical_list"
            elif x_spread > y_spread * 2:
                return "horizontal_row"

        return "group"


# Convenience function for direct usage
def cluster_elements(elements: List[OCRElement]) -> List[UICluster]:
    """
    Convenience function to cluster OCR elements.

    Args:
        elements: List of OCRElement objects

    Returns:
        List of UICluster objects
    """
    clusterer = SemanticClusterer()
    return clusterer.cluster(elements)
