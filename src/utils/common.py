
# Imports
import json

from stewbeet import JsonDict
from stewbeet.core import create_gradient_text

# Constants
STARFRAG_LIST: list[JsonDict | list[JsonDict]] = [
    {"text":"[","color":"aqua"},
    create_gradient_text("Stardust Fragment", "198534", "249d9f"),
    {"text":"]","color":"aqua"},
]
STARFRAG_TEXT: str = json.dumps(STARFRAG_LIST)

