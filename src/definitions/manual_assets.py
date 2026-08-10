
# Imports
import os
import shutil

from stewbeet.core import Mem, iso_renders_path
from stouputils import retry, super_copy


def manual_assets_main() -> None:
	ASSETS_FOLDER: str = "./assets"
	renders: str = iso_renders_path()

	# Copy simplenergy folder
	simplenergy_source = "../SimplEnergy/iso_renders/simplenergy"
	if not os.path.exists(simplenergy_source):
		os.system("git clone https://github.com/Stoupy51/SimplEnergy.git ../SimplEnergy")
	simplenergy_dest = f"{ASSETS_FOLDER}/simplenergy"

	# Copy from SimplEnergy to local assets folder
	if os.path.exists(simplenergy_source):
		retry(shutil.copytree)(simplenergy_source, simplenergy_dest, dirs_exist_ok=True)

	# Copy from assets to the renders folder
	if os.path.exists(simplenergy_dest):
		retry(shutil.copytree)(simplenergy_dest, f"{renders}/simplenergy", dirs_exist_ok=True)

	# Copy cables to the renders folder
	super_copy(f"{ASSETS_FOLDER}/stardust_cable.png", f"{renders}/{Mem.ctx.project_id}/")
	super_copy(f"{ASSETS_FOLDER}/awakened_stardust_cable.png", f"{renders}/{Mem.ctx.project_id}/")
	super_copy(f"{ASSETS_FOLDER}/ultimate_cable.png", f"{renders}/{Mem.ctx.project_id}/")

	return

