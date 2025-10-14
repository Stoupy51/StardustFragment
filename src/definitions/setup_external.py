
# Imports
from stewbeet import (
	CUSTOM_BLOCK_VANILLA,
	CUSTOM_ITEM_VANILLA,
	Context,
	JsonDict,
	Mem,
	add_item_name_and_lore_if_missing,
	add_private_custom_data_for_namespace,
)
from stouputils import super_json_dump, super_open


# Make all the external item definitions
def beet_default(ctx: Context) -> None:
	if Mem.ctx is None: # type: ignore
		Mem.ctx = ctx

	# Replace temporarily the main definitions with the external definitions (for utility functions)
	main_definitions: JsonDict = Mem.definitions
	Mem.definitions = Mem.external_definitions

	## Incomplete item definition
	Mem.definitions.update({
		"simplenergy:simplunium_block": {"id": CUSTOM_BLOCK_VANILLA},
		"simplenergy:simplunium_ingot": {"id": CUSTOM_ITEM_VANILLA},
		"simplenergy:machine_block": {"id": CUSTOM_BLOCK_VANILLA},

		"simplenergy:solar_panel": {"id": CUSTOM_BLOCK_VANILLA},

		"simplenergy:elite_battery": {"id": CUSTOM_BLOCK_VANILLA},
		"simplenergy:elite_cable": {"id": CUSTOM_ITEM_VANILLA},
	})

	# External items config
	add_item_name_and_lore_if_missing(is_external = True)
	add_private_custom_data_for_namespace(is_external = True)

	# Fix SimplEnergy lore
	for data in Mem.definitions.values():
		data["lore"] = [{"text": "SimplEnergy", "italic": True, "color": "blue"}]

	# Debug external definitions
	with super_open("./external_definitions.json", "w") as f:
		super_json_dump(Mem.definitions, f)

	# Restore the main definitions
	Mem.external_definitions = Mem.definitions
	Mem.definitions = main_definitions

