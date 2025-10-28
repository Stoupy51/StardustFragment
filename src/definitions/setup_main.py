
# Imports
from stewbeet import (
	RESULT_OF_CRAFTING,
	Context,
	JsonDict,
	Mem,
	add_energy_lore_to_definitions,
	add_item_model_component,
	add_item_name_and_lore_if_missing,
	add_private_custom_data_for_namespace,
	add_smithed_ignore_vanilla_behaviours_convention,
	generate_everything_about_these_materials,
)

from .additions.common import ORES_CONFIGS
from .additions.energy import main_additions as main_additions_energy
from .additions.equipments import main_additions as main_additions_equipments
from .additions.materials import main_additions as main_additions_materials
from .additions.miscellaneous import main_additions as main_additions_miscellaneous
from .manual_assets import manual_assets_main


# Make all the item definitions
def beet_default(ctx: Context) -> None:

	# Generate ores in database
	generate_everything_about_these_materials(ORES_CONFIGS, ignore_recipes=True)

	# Apply database additions
	main_additions_materials()
	main_additions_energy()
	main_additions_equipments()
	main_additions_miscellaneous()

	# Reorder some definitions
	reorder_list: list[str] = [
		"stardust_fragment","stardust_ingot","stardust_ingot","stardust_essence","stardust_core","compacted_stardust_shard",
		"stardust_block","stardust_ore","deepslate_stardust_ore","nether_stardust_ore","ender_stardust_ore"
	]
	ordered: JsonDict = {k: {} for k in reorder_list}
	for k, v in Mem.definitions.items():
		ordered[k] = v
	Mem.definitions = ordered

	# Sort by category (material in first position)
	Mem.definitions = dict(sorted(Mem.definitions.items(), key=lambda x: (x[1].get("category", "") != "materials", x[1].get("category", ""))))

	# TODO: remove
	for k, v in Mem.definitions.items():
		if not v.get(RESULT_OF_CRAFTING):
			print(f"Definition '{k}' is missing 'result_of_crafting' tag.")

	# Final adjustments
	add_energy_lore_to_definitions()
	add_item_model_component(black_list=["stardust_cable", "awakened_stardust_cable", "ultimate_cable"])
	add_item_name_and_lore_if_missing()
	add_private_custom_data_for_namespace()
	add_smithed_ignore_vanilla_behaviours_convention()

	# Copy manual assets that can't be generated
	manual_assets_main()

