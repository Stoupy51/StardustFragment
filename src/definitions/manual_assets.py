
# Imports
import os
import shutil

from stewbeet.core import *
from stouputils import super_copy


def manual_assets_main() -> None:
	ASSETS_FOLDER: str = "./assets"
	manual_cache: str = Mem.ctx.meta.stewbeet.manual.cache_path

	# Copy simplenergy folder
	simplenergy_source = "../SimplEnergy/manual_cache/items/simplenergy"
	simplenergy_dest = f"{ASSETS_FOLDER}/simplenergy"

	# Copy from SimplEnergy to local assets folder
	if os.path.exists(simplenergy_source):
		shutil.copytree(simplenergy_source, simplenergy_dest, dirs_exist_ok=True)

	# Copy from assets to manual cache
	if os.path.exists(simplenergy_dest):
		shutil.copytree(simplenergy_dest, f"{manual_cache}/items/simplenergy", dirs_exist_ok=True)

	# Copy cables to the manual folder
	super_copy(f"{ASSETS_FOLDER}/stardust_cable.png", f"{manual_cache}/items/{Mem.ctx.project_id}/")
	super_copy(f"{ASSETS_FOLDER}/awakened_stardust_cable.png", f"{manual_cache}/items/{Mem.ctx.project_id}/")
	super_copy(f"{ASSETS_FOLDER}/ultimate_cable.png", f"{manual_cache}/items/{Mem.ctx.project_id}/")

	return

