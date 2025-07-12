
# Imports
from stewbeet.core import *

from .additions import main_additions
from .manual_assets import manual_assets_main

# Constants
stardust_base_durability = 12.5 * VanillaEquipments.PICKAXE.value[DefaultOre.IRON]["durability"]  # 3125 durability
reinforced_durability = 10 * VanillaEquipments.PICKAXE.value[DefaultOre.IRON]["durability"]  # 2500 durability
original_durability = 15 * VanillaEquipments.PICKAXE.value[DefaultOre.IRON]["durability"]  # 3750 durability
legendarium_durability = 20 * VanillaEquipments.PICKAXE.value[DefaultOre.DIAMOND]["durability"]  # ~31220 durability
solarium_durability = 20 * VanillaEquipments.PICKAXE.value[DefaultOre.DIAMOND]["durability"]  # ~31220 durability
darkium_durability = 20 * VanillaEquipments.PICKAXE.value[DefaultOre.DIAMOND]["durability"]  # ~31220 durability
ultimate_durability = -1  # Unbreakable items

ORES_CONFIGS: dict[str, EquipmentsConfig|None] = {
	"stardust_ingot": EquipmentsConfig(
		DefaultOre.CHAINMAIL, stardust_base_durability, {"attack_damage": 3, "armor": 2.5, "mining_efficiency": 1.0}
	),
	"reinforced_stardust": EquipmentsConfig(
		DefaultOre.IRON, reinforced_durability, {"attack_damage": 5, "armor": 4, "mining_efficiency": 2.0}
	),
	"original_stardust": EquipmentsConfig(
		DefaultOre.DIAMOND, original_durability, {"attack_damage": 9, "armor": 5.5, "mining_efficiency": 3.0}
	),
	"legendarium_ingot": EquipmentsConfig(
		DefaultOre.DIAMOND, legendarium_durability, {"attack_damage": 13, "armor": 6.5, "mining_efficiency": 4.0}
	),
	"solarium_ingot": EquipmentsConfig(
		DefaultOre.DIAMOND, solarium_durability, {"attack_damage": 15, "armor": 6.5, "mining_efficiency": 4.0}
	),
	"darkium_ingot": EquipmentsConfig(
		DefaultOre.DIAMOND, darkium_durability, {"attack_damage": 17, "armor": 6.5, "mining_efficiency": 4.0}
	),
}

# Make all the item definitions
def beet_default(ctx: Context) -> None:
	if Mem.ctx is None:
		Mem.ctx = ctx

	# Generate ores in database
	generate_everything_about_these_materials(ORES_CONFIGS)

	# Apply database additions
	main_additions()

	# Final adjustments
	add_energy_lore_to_definitions()
	add_item_model_component(black_list = ["stardust_cable", "awakened_stardust_cable", "ultimate_cable"])
	add_item_name_and_lore_if_missing()
	add_private_custom_data_for_namespace()
	add_smithed_ignore_vanilla_behaviours_convention()

	# Copy manual assets that can't be generated
	manual_assets_main()

