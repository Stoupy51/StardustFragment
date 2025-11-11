
# ruff: noqa: E501
# Imports
import os

from beet import Predicate
from stewbeet.core import Conventions, JsonDict, Mem, set_json_encoder, write_function, write_load_file, write_versioned_function
from stouputils.io import relative_path


# Setup custom mobs
def setup_custom_mobs() -> None:
	ns: str = Mem.ctx.project_id

	# TODO

