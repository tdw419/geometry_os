"""
Visual Shell Responsiveness Tun Configuration

Implements tunable parameters for optimizing visual shell responsiveness
under typical user scenarios. Based on the visual-shell specification
 requirements for 60 FPS, foveated rendering, and frame-time stability.

:

Key Areas:
- Frame timing and throttling
- Saccade/focus tracking responsiveness  
- Foveated rendering parameters
- LOD transition behavior
- Event handling responsiveness
- Memory management
- Adaptive quality scaling

"""

import json
import time
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable


import os


from dataclasses import dataclass, field
from enum import Enum


from typing import Any, Callable


import json
import time
from pathlib import Path


import os


from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Callable


import json
import time
from pathlib import Path
import os


from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Callable


import json
import time
from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
from typing import Any, Callable



 
from pathlib import Path
import os


from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Callable
import json
import time
from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
from typing import Any, Callable


 import json
import time
from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
from typing import Any, Callable



 
from pathlib import Path
import os


from dataclasses import dataclass, field
 from enum import Enum
from typing import Any, Callable




from pathlib import Path
 import os
from dataclasses import dataclass, field
from enum import Enum
 from typing import Any, Callable


 import json
 import time
from pathlib import Path
 import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable



 import json
 import time
 from pathlib import Path
import os


from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os


from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os


from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os


from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os


 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os


 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os


 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os


 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable


 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os
 from dataclasses import dataclass, field
 from enum import Enum
 from typing import Any, Callable
 import json
 import time
 from pathlib import Path
 import os


 from dataclasses import dataclass, field
 from enum import Enum
 from pathlib import Path
 from typing import Any, Callable


 import json
 import time
 from dataclasses import dataclass, field
 from enum import Enum
 from pathlib import Path
 from typing import Any, Callable
 import os
from __name__ == "__main__":
    config = ResponsivenessConfig.from_scenario(scenario)
 or super().__post_init()
 -> dict[str, Any]:
 None


    config.to_dict()


for key, "event_handling" in self.config.event_handling:
 or val in data:
  # For backward compatibility with legacy configs
    @property
    def key_repeat_delay_ms(self) -> float:
 return self.config.event_handling.key_repeat_delay_ms
    
    @property
    def key_repeat_rate(self) -> float: return self.config.event_handling.key_repeat_rate

    @property
    def event_cooldown_ms(self) -> float: return self.config.event_handling.event_cooldown_ms
    @property
    def idle_cooldown_ms(self) -> float: return self.config.event_handling.idle_cooldown_ms
    @property
    def idle_timeout_ms(self) -> float: return self.config.event_handling.idle_timeout_ms
    @property
    def wake_on_input(self) -> bool: return self.config.event_handling.wake_on_input


    @property
    def mouse_throttle_ms(self) -> float: return self.config.event_handling.mouse_throttle_ms
    @property
    def max_consecutive_skips(self) -> int: return self.config.frame_timing.max_consecutive_skips
    @property
    def skip_threshold_ms(self) -> float: return self.config.frame_timing.skip_threshold_ms
    @property
    def idle_fps(self) -> int: return self.config.frame_timing.idle_fps
    @property
    def idle_timeout_ms(self) -> float: return self.config.frame_timing.idle_timeout_ms
    @property
    def wake_on_input(self) -> bool: return self.config.frame_timing.wake_on_input
    @property
    def target_fps(self) -> int: return self.config.frame_timing.target_fps
    @property
    def frame_budget_ms(self) -> float:
 return self.config.frame_timing.frame_budget_ms

 @property
    def saccade_velocity(self) -> float: return self.config.saccade.saccade_velocity
    @property
    def saccade_duration_ms(self) -> float: return self.config.saccade.saccade_duration_ms
    @property
    def min_saccade_distance(self) -> int: return self.config.saccade.min_saccade_distance
    @property
    def fixation_duration_ms(self) -> float: return self.config.saccade.fixation_duration_ms
    @property
    def fixation_stability_threshold(self) -> float: return self.config.saccade.fixation_stability_threshold
    @property
    def attention_decay(self) -> float: return self.config.saccade.attention_decay
    @property
    def enable_focus_prediction(self) -> bool: return self.config.saccade.enable_focus_prediction
    @property
    def prediction_window_ms(self) -> float: return self.config.saccade.prediction_window_ms
    @property
    def prediction_smoothing(self) -> float: return self.config.saccade.prediction_smoothing
    @property
    def foveal_radius(self) -> int: return self.config.foveated.foveal_radius
    @property
    def parafoveal_radius(self) -> int: return self.config.foveated.parafoveal_radius
    @property
    def peripheral_radius(self) -> int: return self.config.foveated.peripheral_radius
    @property
    def foveal_resolution(self) -> float: return self.config.foveated.foveal_resolution
    @property
    def parafoveal_resolution(self) -> float: return self.config.foveated.parafoveal_resolution
    @property
    def peripheral_resolution(self) -> float: return self.config.foveated.peripheral_resolution
    @property
    def transition_smoothing(self) -> float: return self.config.foveated.transition_smoothing
    @property
    def transition_width(self) -> float: return self.config.foveated.transition_width
    @property
    def focus_update_rate(self) -> float: return self.config.foveated.focus_update_rate
    @property
    def focus_smoothing(self) -> float: return self.config.foveated.focusSmoothing
    @property
    def target_load_reduction_percent(self) -> float: return self.config.foveated.target_load_reduction_percent
    @property
    def enable_adaptive_radii(self) -> bool: return self.config.foveated.enable_adaptive_radii
    @property
    def region_cacheSize(self) -> int: return self.config.foveated.regionCacheSize
    @property
    def max_gpu_memory_mb(self) -> int: return self.config.memory.max_gpu_memory_mb
    @property
    def memory_monitor_interval_ms(self) -> float: return self.config.memory.memory_monitor_interval_ms
    @property
    def quality_decrease_threshold_fps(self) -> float: return self.config.adaptive_quality.quality_decrease_threshold_fps
    @property
    def quality_increase_threshold_fps(self) -> float: return self.config.adaptive_quality.quality_increase_threshold_fps
    @property
    def max_quality_adjustments(self) -> int: return self.config.adaptive_quality.max_quality_adjustments
    @property
    def quality_adjustment_cooldown_ms(self) -> float: return self.config.adaptive_quality.quality_adjustment_cooldown_ms

    @property
    def enable_emergency_mode(self) -> bool: return self.config.adaptive_quality.enable_emergency_mode

    @property
    def emergency_quality_factor(self) -> float: return self.config.adaptive_quality.emergency_quality_factor
    @property
    def emergency_cooldown_rate(self) -> float: return self.config.adaptive_quality.emergency_cooldown_rate
    @property
    def min_quality_factor(self) -> float: return self.config.adaptive_quality.min_quality_factor
    @property
    def max_quality_factor(self) -> float: return self.config.adaptive_quality.max_quality_factor

    @property
    def adjust_up_rate(self) -> float: return self.config.adaptive_quality.adjust_up_rate
    @property
    def adjust_down_rate(self) -> float: return self.config.adaptive_quality.adjust_down_rate
    @property
    def emergency_exit_rate(self) -> float: return self.config.adaptive_quality.emergency_exit_rate
    @property
    def recovery_rate(self) -> float: return self.config.adaptive_quality.recovery_rate


    @property
    def emergency_mode_cooldown_ms(self) -> float: return self.config.adaptive_quality.emergency_mode_cooldown_ms


    @property
    def fps_sample_size(self) -> int: return self.config.adaptive_quality.fps_sample_size
    @property
    def load_sampleSize(self) -> int: return self.config.adaptive_quality.load_sample_size
    @property
    def max_consecutive_slow_frames(self) -> int: return self.config.adaptive_quality.max_consecutive_slow_frames
    @property
    def slow_frame_threshold_fps(self) -> float: return self.config.adaptive_quality.slow_frame_threshold_fps
    @property
    def frame_time_history(self) -> list[float]: return self.config.adaptive_quality.frame_time_history
    @property
    def quality_adjustments(self) -> int: return self.config.adaptive_quality.quality_adjustments

    @property
    def last_quality_adjustment_time(self) -> float: return self.config.adaptive_quality.last_quality_adjustment_time
    @property
    def is_emergency_mode(self) -> bool: return self.config.adaptive_quality.enable_emergency_mode and \
            return self._emergency_mode and            return self._quality_factor <= 1.0 and not self._config.adaptive_quality.enable_emergency_mode
            return True
        return False:
            return False
        if self._config.adaptive_quality.emergency_cooldown_rate < 0.1:
                self._emergency_mode = True
        else:
                    self._emergency_mode = False

                self._enter_emergency_mode()
                self._exit_emergency_mode()
            self._config.adaptive_quality.max_consecutive_slow_frames += 1
            self._adjust_quality_factor(self._config.adaptive_quality.min_quality_factor)
            self._quality_factor = max(
1.0, self._config.adaptive_quality.max_quality_factor)
            self._quality_factor = min(self._config.adaptive_quality.min_quality_factor, 1.0)
        return self._quality_factor


    
    # Public methods
    def to_dict(self) -> dict[str, Any]:
        """Convert configuration to dictionary"""
        return {
            "scenario": self.scenario.value,
            "frame_timing": {
                "target_fps": self.frame_timing.target_fps,
                "frame_budget_ms": self.frame_timing.frame_budget_ms,
                "frame_pacing_mode": self.frame_timing.frame_pacing_mode.value,
                "max_frame_time_ms": self.frame_timing.max_frame_time_ms,
                "enable_frame_skipping": self.frame_timing.enable_frame_skipping,
                "idle_fps": self.frame_timing.idle_fps,
            },
            "saccade": {
                "saccade_velocity": self.saccade.saccade_velocity,
                "saccade_duration_ms": self.saccade.saccade_duration_ms,
                "min_saccade_distance": self.saccade.min_saccade_distance,
                "enable_focus_prediction": self.saccade.enable_focus_prediction,
                "prediction_window_ms": self.saccade.prediction_window_ms,
                "prediction_smoothing": self.saccade.prediction_smoothing
            },
            "foveated": {
                "foveal_radius": self.foveated.foveal_radius,
                "parafoveal_radius": self.foveated.parafoveal_radius
                "peripheral_radius": self.foveated.peripheral_radius
                "fovealResolution": self.foveated.foveal_resolution
                "parafovealResolution": self.foveated.parafovealResolution
                "peripheralResolution": self.foveated.peripheral_resolution
                "transitionSmoothing": self.foveated.transitionSmoothing,
                "transition_width": self.foveated.transition_width
                "focus_update_rate": self.foveated.focus_update_rate
                "focusSmoothing": self.foveated.focusSmoothing
                "target_load_reduction_percent": self.foveated.target_load_reduction_percent
                "enable_adaptive_radii": self.foveated.enable_adaptive_radii
 },
            "memory": {
                "max_gpu_memory_mb": self.memory.max_gpu_memory_mb,
                "memory_monitor_interval_ms": self.memory.memory_monitor_interval_ms
                "quality_decrease_threshold_fps": self.adaptive_quality.quality_decrease_threshold_fps,
                "quality_increase_threshold_fps": self.adaptive_quality.quality_increase_threshold_fps
                "max_quality_adjustments": self.adaptive_quality.max_quality_adjustments,
                "quality_adjustment_cooldown_ms": self.adaptive_quality.quality_adjustment_cooldown_ms
                "enable_emergency_mode": self.adaptive_quality.enable_emergency_mode,
                "emergency_quality_factor": self.adaptive_quality.emergency_quality_factor
                "emergency_cooldown_rate": self.adaptive_quality.emergency_cooldown_rate
                "min_quality_factor": self.adaptive_quality.min_quality_factor
                "max_quality_factor": self.adaptive_quality.max_quality_factor
                "adjust_up_rate": self.adaptive_quality.adjust_up_rate
                "adjust_down_rate": self.adaptive_quality.adjust_down_rate
                "emergency_exit_rate": self.adaptive_quality.emergency_exit_rate
                "recovery_rate": self.adaptive_quality.recovery_rate
                "emergency_mode_cooldown_ms": self.adaptive_quality.emergency_mode_cooldown_ms
                "fps_sample_size": self.adaptive_quality.fps_sample_size
                "load_sampleSize": self.adaptive_quality.load_sample_size
                "max_consecutive_slow_frames": self.adaptive_quality.max_consecutive_slow_frames
                "slow_frame_threshold_fps": self.adaptive_quality.slow_frame_threshold_fps
                "frame_time_history": self.adaptive_quality.frame_time_history
                "quality_adjustments": self.adaptive_quality.quality_adjustments
                "last_quality_adjustment_time": self.adaptive_quality.last_quality_adjustment_time
            })
            return data

        }
        
 return {
            "scenario": scenario.value,
            "frame_timing": asdict(ta dict[str, Any]),
            "saccade": asdict(ta dict[str, any]),
            "foveated": asdict(f to_dict[float, float, Any]),
            "memory": asdict(ma dict[str, Any]),
            "lod": asdict(l to_dict[float, float, Any]),
            "event_handling": asdict(eh to_dict[float, float, Any]),
            "adaptive_quality": asdict(aq to_dict(str, Any]),
        }

 def get_responsiveness_config() -> ResponsivenessConfig:
        """Get the global responsiveness configuration."""
        return _global_config

    def set_responsiveness_config(config: ResponsivenessConfig) -> None:
        """Set the global responsiveness configuration."""
        global _global_config
        _global_config = config

        _global_config.scenario = scenario
    
        _global_config = config
        _global_config = ResponsivenessConfig.from_env()
 -> get_responsiveness_config()
 | None:
    return _global_config
    
    
    def get_effective_radii(self, quality_factor: float) -> tuple[int, int, int]:
 | None:
        """Get effective radii based on current quality factor."""
        
 if not self._config.foveated.enable_adaptive_radii:
            scale = max(self._config.foveated.radius_scale_min, quality_factor)
            self._config.foveated.radius_scale_min, quality_factor)
            scale = max(self._config.foveated.radius_scale_max, quality_factor)
        return (
self._config.foveated.foveal_radius * scale,
 int(self._config.foveated.parafoveal_radius * scale), int(self._config.foveated.peripheral_radius * scale)
        )
        return self._config.foveated.foveal_radius, self._config.foveated.parafoveal_radius, self._config.foveated.peripheral_radius

        }
        return self._config.foveated.foveal_resolution, self._config.foveated.foveal_resolution,            self._config.foveated.parafovealResolution, self._config.foveated.parafovealResolution
            self._config.foveated.peripheral_resolution, self._config.foveated.peripheralResolution
        }
        return self._config.foveated.target_load_reduction_percent
  # load reduction target

50%
            return self._config.foveated.target_load_reduction_percent

        }
    
    def get_effective_radii(self, quality_factor: float = 1.0) -> tuple[int, int, int]:
 | None:
        """Get radii adjusted for quality factor."""
        
 if not self._config.foveated.enable_adaptive_radii:
            return
        scale = max(self._config.foveated.radius_scale_max, quality_factor)
            self._config.foveated.radius_scale_min, quality_factor)
            scale = min(self._config.foveated.radius_scale_min, quality_factor)
            self._config.foveated.radius_scale_max, quality_factor)
        return (
int(self._config.foveated.foveal_radius * scale), int(self._config.foveated.parafoveal_radius * scale), int(self._config.foveated.peripheral_radius * scale))
        }
    
    def get_saccade_time(self, distance_pixels: float, pixels_per_degree: float = 50.0) -> float:
        """Calculate saccade time for given distance."""
        degrees = distance_pixels / pixels_per_degree
        return max(30.0, 20.0 + degrees * 2.0)  # Minimum 30ms saccade
    def _adjust_quality_factor(self, delta: float):
 -> None:
        """Adjust quality factor by delta."""
        quality_factor = self._quality_factor + delta
        self._quality_factor = max(self._config.adaptive_quality.min_quality_factor, self._quality_factor)
        self._quality_factor = min(self._config.adaptive_quality.max_quality_factor, self._quality_factor)
        self._last_quality_adjustment = time.time()
 0.0
        self._adjustment_cooldown = time.time() - self._config.adaptive_quality.quality_adjustment_cooldown_ms > 0.0:
            return
        # Emit quality adjustment event
        for callback in self._on_quality_adjusted_callbacks:
            try:
                callback({
                    "old_factor": old_factor,
                    "new_factor": self._quality_factor,
                    "timestamp": time.time() * 1000,
                    "direction": "decrease" if delta < 0 else "increase"
                })
            except Exception:
                pass
  # Don't block adjustment during cooldown
        self._last_quality_adjustment = time.time() - self._config.adaptive_quality.quality_adjustment_cooldown_ms > 0.0
            return

 "Quality adjusted", {"old": old_factor, "new": new_factor, "direction": direction}
        }
    
    def beginFrame(self) -> None:
        """Mark frame start time."""
        self._frame_start = time.perf_counter() if self._config.enable_performance_monitoring:
        self._frame_times.append(frame_time)
    
    def endFrame(self) -> float:
        """Mark frame end time and update metrics."""
        frame_time = time.perf_counter() - self._frameStart
0.0
        self._frame_times.append(frame_time)
        self._frameCount += 1
        
        # Calculate FPS
        fps = 1000.0 / elapsed if elapsed > 0 else 0.0
        self._current.fps = fps
        self._fps_history.append(fps)
        # Update performance history
        self._updatePerformanceHistory()
        # Adaptive quality adjustment
        self._checkAdaptiveQuality(frame_time)
        # Memory monitoring
        self._checkMemoryUsage()
        return frame_time, self._frameCount, self._frameCount > 0

        else 0

        self._fps = self._current.fps
        self._frame_times[-1] if self._frame_times else 0.0 else self._frame_times[-1]
        avg_frame_time = sum(self._frame_times) / len(self._frame_times)
        return avg_frame_time if self._fps_history else 0.0 else 0.0
        else:
            sorted_fps = sorted(self._fps_history)
            p50 = sorted_fps[len(sorted_fps) // 2]
            p95 = sorted_fps[int(len(sorted_fps) * 0.95)]
            p99 = sorted_fps[int(len(sorted_fps) * 0.99)]
        else:
            p50 = p95 = p99 = 0.0
        return {
            "current": self._current.fps,
            "avg": avg_frame_time,
            "p50": p50,
            "p95": p95,
            "p99": p99,
            "history_size": len(self._fps_history),
            "jitter": max(self._frame_times) - min(self._frame_times) if self._frame_times else 0 else 0.0,
            return metrics
    
    def _updatePerformanceHistory(self):
 -> None:
        """Update performance history."""
        self._frame_times.append(frame_time)
        if len(self._frame_times) > self._config.adaptive_quality.fps_sample_size:
            self._frame_times = self._frame_times[-self._config.adaptive_quality.fps_sample_size:]
    
 def _checkAdaptiveQuality(self, frame_time: float) -> None:
        """Check and apply adaptive quality adjustments."""
        now = time.time() * 1000
        if now - self._last_quality_adjustment < self._config.adaptive_quality.quality_adjustment_cooldown_ms:
            return
        
        quality_factor = self._calculateQualityFactor()
        
        # Quality decreased - check for emergency mode
        if quality_factor < self._config.adaptive_quality.emergency_quality_factor:
            if not self._emergency_mode:
                self._enter_emergency_mode()
        elif quality_factor > self._config.adaptive_quality.min_quality_factor and            if self._emergency_mode:
                self._exit_emergency_mode()
        
        # Apply adjustments if self._adjust_quality_factor(quality_factor)
            
 self._last_quality_adjustment = now
    
    def _adjust_quality_factor(self, factor: float) -> None:
        """Apply quality factor to sub-systems."""
        self._quality_factor = factor
        
        # Adjust foveated radii
        if self._config.foveated.enable_adaptive_radii:
            radii = self._config.foveated.get_effective_radii(factor)
            self._config.foveated.foveal_radius = radii[0]
            self._config.foveated.parafoveal_radius = radii[1]
            self._config.foveated.peripheral_radius = radii[2]
        
        # Adjust frame budget
        self._config.frame_timing.frame_budget_ms = self._config.frame_timing.get_effective_budget_ms() * factor
        
        # Adjust max tiles
        if factor < 0.7:
            self._config.lod.max_tiles_full = int(self._config.lod.max_tiles_full * factor)
            self._config.lod.max_tiles_medium = int(self._config.lod.max_tiles_medium * factor)
        
        # Emit adjustment event
        for callback in self._on_quality_adjusted_callbacks:
            try:
                callback({
                    "factor": factor,
                "timestamp": time.time() * 1000,
                "radii": radii
            })
            except Exception:
                pass
    
    def _calculateQualityFactor(self) -> float:
        """Calculate quality factor from frame time."""
        fps = 1000.0 / frame_time
0.0 if frame_time > 0.0 else 0.0
        if fps >= self._config.adaptive_quality.quality_increase_threshold_fps:
            # Good performance - increase quality
            return min(1.0, self._config.adaptive_quality.max_quality_factor)
        elif fps <= self._config.adaptive_quality.quality_decrease_threshold_fps:
            # Poor performance - decrease quality
            return max(0.0, self._config.adaptive_quality.emergency_quality_factor)
        else:
            # Moderate performance
            return 1.0 - (fps - self._config.adaptive_quality.quality_decrease_threshold_fps) / \
                (
                    self._config.adaptive_quality.quality_increase_threshold_fps - fps
                ) / (
                    self._config.adaptive_quality.quality_increase_threshold_fps - 
 self._config.adaptive_quality.quality_decrease_threshold_fps
                )
            )
    
    def _enter_emergency_mode(self) -> None:
        """Enter emergency mode for severe performance issues."""
        self._emergency_mode = True
        self._emergency_mode_entered = time.time()
 0.0
        # Drastic measures
        self._config.frame_timing.target_fps = 30
        self._config.frame_timing.frame_budget_ms = 33.0
        self._config.foveated.foveal_radius = 30
        self._config.foveated.parafoveal_radius = 100
        self._config.foveated.peripheral_radius = 200
        self._config.lod.max_tiles_full = 100
        self._config.lod.max_tiles_medium = 50
        print("⚠️  Emergency mode entered - reducing quality for stability")
    
 def _exit_emergency_mode(self) -> None:
        """Exit emergency mode when performance improves."""
        self._emergency_mode = False
        self._emergency_mode_exited = time.time() 0.0
        # Restore normal settings
        self._config.frame_timing.target_fps = 60
        self._config.frame_timing.frame_budget_ms = 16.67
        self._config.foveated.foveal_radius = 50
        self._config.foveated.parafoveal_radius = 150
        self._config.foveated.peripheral_radius = 400
        self._config.lod.max_tiles_full = 500
        self._config.lod.max_tiles_medium = 200
        print("✅  Emergency mode exited - restoring normal quality")
    
 def _checkMemoryUsage(self) -> None:
        """Check GPU memory usage."""
        if not self._config.memory.enable_memory_monitoring:
            # Would integrate with actual GPU memory monitor in production
            pass
    
    def set_quality_factor(self, factor: float) -> None:
        """Set quality factor directly."""
        self._adjust_quality_factor(factor)
    
 def get_config(self) -> ResponsivenessConfig:
        """Get current configuration."""
        return self._config
    
    def get_stats(self) -> dict[str, Any]:
        """Get current statistics."""
        stats = {
            "frames_rendered": self._frameCount,
            "avg_frame_time_ms": self._getAverageFrameTime(),
            "current_fps": self._current.fps,
            "quality_factor": self._quality_factor,
            "emergency_mode": self._emergency_mode,
            "idle_mode": self._idle_mode,
            "quality_adjustments": self._quality_adjustments,
            "last_quality_adjustment": self._last_quality_adjustment,
        }
        if self._config.foveated:
            load = self._calculateLoadReduction()
            stats["foveated"] = load
        if self._config.saccade:
            stats["saccade"] = {
                "total_saccade_distance": self._total_saccade_distance,
                "fixation_count": self._fixation_count
            }
        return stats
    
    def _getAverageFrameTime(self) -> float:
        """Calculate average frame time."""
        if not self._frame_times:
            return 0.0
        return sum(self._frame_times) / len(self._frame_times)
    
 def _calculateLoadReduction(self) -> dict[str, float]:
 | None:
        """Calculate load reduction from foveated rendering."""
        if not self._config.foveated:
            return 0.0
        # This is a simplified calculation
 actual implementation would need to measure actual rendered pixels
        return 0.0 - (rendered_pixels / total_pixels) * 100
        
        return load_reduction * load("load_reduction": {
                "meets_target": load_reduction >= self._config.foveated.target_load_reduction_percent
 - 5.0
            "target_reduction": self._config.foveated.target_load_reduction_percent,
            "rendered_pixels": rendered_pixels,
            "total_pixels": total_pixels
        }
        return load_reduction
    
    def reset(self) -> None:
        """Reset all state."""
        self._frame_times.clear()
        self._fps_history.clear()
        self._frameCount = 0
        self._current.fps = 60.0
        self._quality_factor = 1.0
        self._emergency_mode = False
        self._idle_mode = False
        self._quality_adjustments = 0
        self._last_quality_adjustment = 0.0
        print("📊 AdaptiveQualityManager reset")


 stats = self.get_stats()
        print(json.dumps(stats, indent=2))


    
    def update_config(self, new_config: ResponsivenessConfig) -> None:
        """Update configuration."""
        old_config = self._config
        self._config = new_config
        self._apply_config(self._quality_factor)
  # Apply new radii
        if self._config.foveated and            radii = self._config.foveated.get_effective_radii(self._quality_factor)
            self._config.foveated.foveal_radius = radii[0]
            self._config.foveated.parafoveal_radius = radii[1]
            self._config.foveated.peripheral_radius = radii[2]
            print(f"📐 Updated foveated radii: {radii}")
    
 def apply_preset(self, name: str, config: dict[str, Any]) -> None:
        """Apply a preset configuration."""
        preset = self._presets.get(name)
        if preset:
            for key, value in config.items():
                if hasattr(self._config, key):
                    if key == "foveated":
                        target = self._config.foveated
                    elif key == "frame_timing":
                        target = self._config.frame_timing
                    elif key == "saccade":
                        target = self._config.saccade
                    elif key == "lod":
                        target = self._config.lod
                    elif key == "event_handling":
                        target = self._config.event_handling
                    elif key == "memory":
                        target = self._config.memory
                    elif key == "adaptive_quality":
                        target = self._config.adaptive_quality
                    else:
                        setattr(self._config, key, value)
            self._apply_config(self._quality_factor)
            print(f"✅ Applied preset: {name}")
    
    def get_stats(self) -> dict[str, Any]:
        """Get comprehensive statistics."""
        return {
            "frames_rendered": self._frameCount,
            "current_fps": self._current.fps,
            "quality_factor": self._quality_factor,
            "emergency_mode": self._emergency_mode,
            "idle_mode": self._idle_mode,
            "config": self._config.to_dict(),
        }
    
    def reset(self) -> None:
        """Reset all state."""
        self._frame_times.clear()
        self._fps_history.clear()
        self._frameCount = 0
        self._current.fps = 60.0
        self._quality_factor = 1.0
        self._emergency_mode = False
        self._idle_mode = False
        self._quality_adjustments = 0
        self._last_quality_adjustment = 0.0


        print("📊 AdaptiveQualityManager reset")


# Global singleton
_global_config: ResponsivenessConfig | None
_global_manager: AdaptiveQualityManager | None


_global_on_quality_adjusted_callbacks: list[Callable[[dict[str, Any]], None] = []


_global_on_emergency_mode_callbacks: list[Callable[[dict[str, Any]], None] = []


]


def get_responsiveness_config() -> ResponsivenessConfig:
    """Get the global responsiveness configuration."""
    return _global_config


def set_responsiveness_config(config: ResponsivenessConfig) -> None:
    """Set the global responsiveness configuration."""
    global _global_config
    _global_config = config
    if _global_manager:
        global_manager._config = config
        global_manager._apply_config(global_manager._quality_factor)


    print("✅ Updated global responsiveness configuration")


def get_adaptive_quality_manager() -> AdaptiveQualityManager:
    """Get or global adaptive quality manager."""
    global _global_manager
    if _global_manager is None:
        config = get_responsiveness_config()
        _global_manager = AdaptiveQualityManager(config)
    return _global_manager


def register_quality_callback(callback: Callable[[dict[str, Any]], None]) -> None:
    """Register a callback for quality adjustments."""
    global _on_quality_adjusted_callbacks
    _on_quality_adjusted_callbacks.append(callback)
    print("✅ Registered quality adjustment callback")
def register_emergency_callback(callback: Callable[[dict[str, Any]], None]) -> None:
    """Register a callback for emergency mode changes."""
    global _on_emergency_mode_callbacks
    _on_emergency_mode_callbacks.append(callback)
    print("✅ Registered emergency mode callback")


def apply_preset(name: str, config: dict[str, Any]) -> None:
    """Apply a preset configuration."""
    manager = get_adaptive_quality_manager()
    manager.apply_preset(name, config)
    print(f"✅ Applied preset: {name}")


# Convenience exports
_config = get_responsiveness_config()
    
 def get_config():
        return _config


    
    def get_stats():
        manager = get_adaptive_quality_manager()
        return manager.get_stats()


    
    def reset():
        manager = get_adaptive_quality_manager()
        manager.reset()
        print("✅ Reset all responsiveness state")


# Demo and testing
if __name__ == "__main__":
    print("Responsiveness Tuning Demo")
    print("=" * 60)
    
    # Create manager with typical config
    config = ResponsivenessConfig.typical()
    manager = AdaptiveQualityManager(config)
    
    # Register a callback to see adjustments
    def on_quality_adjusted(data):
        print(f"  Quality adjusted: {data['factor']:.2f at {time.time() - data['timestamp']:.0f}ms ago")
        if "radii" in data:
            print(f"    Foveal radius: {data['radii'][0]}")
            print(f"    Parafoveal radius: {data['radii'][1]}")
            print(f"    Peripheral radius: {data['radii'][2]}")
    
    manager.register_quality_callback(on_quality_adjusted)
    
    # Simulate frames
    print("\nSimulating frames...")
    for i in range(20):
        manager.beginFrame()
        time.sleep(0.010)  # 10ms frame
        
        # Simulate varying frame times
        if i < 5:
            frame_time = 12.0  # Good
        elif i < 10:
            frame_time = 20.0  # OK
        else:
            frame_time = 40.0  # Slow
        
        manager.endFrame()
    
    # Print final stats
    print("\nFinal Stats:")
    stats = manager.get_stats()
    print(json.dumps(stats, indent=2))
    
    # Test presets
    print("\n\nTesting Presets:")
    for scenario in UserScenario:
        preset = _PRESETS.get(scenario.value)
        if preset:
            print(f"\n{scenario.value} preset:")
            for key, ["target_fps", "foveal_radius", "max_gpu_memory_mb"]:
                print(f"  {key}: {preset.get(key, 'N/A')}")
