
# Imports
from stewbeet import (
	Context,
	DefaultOre,
	EquipmentsConfig,
	VanillaEquipments,
	add_energy_lore_to_definitions,
	add_item_model_component,
	add_item_name_and_lore_if_missing,
	add_private_custom_data_for_namespace,
	add_smithed_ignore_vanilla_behaviours_convention,
	generate_everything_about_these_materials,
)

from .additions import main_additions
from .manual_assets import manual_assets_main

# Constants
DIAMOND_PICKAXE: float = VanillaEquipments.PICKAXE.value[DefaultOre.DIAMOND]["durability"]
STARDUST_BASE_DURABILITY: float = 1.25 * DIAMOND_PICKAXE
REINFORCED_DURABILITY: float = 1.5 * DIAMOND_PICKAXE
ORIGINAL_DURABILITY: float = 3.0 * DIAMOND_PICKAXE
LEGENDARIUM_DURABILITY: float = 4.5 * DIAMOND_PICKAXE
SOLARIUM_DURABILITY: float = 5.0 * DIAMOND_PICKAXE
DARKIUM_DURABILITY: float = 5.5 * DIAMOND_PICKAXE

ORES_CONFIGS: dict[str, EquipmentsConfig|None] = {
	"awakened_stardust!":	None,
	"damaged_stardust!":	EquipmentsConfig(DefaultOre.DIAMOND, STARDUST_BASE_DURABILITY, {"attack_damage": 1, "armor": 0.5, "armor_toughness": 0.5, "mining_efficiency": 1.25}),
	"reinforced_stardust!":	EquipmentsConfig(DefaultOre.DIAMOND, REINFORCED_DURABILITY, {"attack_damage": 5, "armor": 1.5, "armor_toughness": 1.0, "mining_efficiency": 1.5}),
	"original_stardust!":	EquipmentsConfig(DefaultOre.NETHERITE, ORIGINAL_DURABILITY, {"attack_damage": 9, "armor": 3.5, "armor_toughness": 1.5, "mining_efficiency": 2.0}),
	"legendarium_ingot":	EquipmentsConfig(DefaultOre.NETHERITE, LEGENDARIUM_DURABILITY, {"attack_damage": 13, "armor": 5.5, "armor_toughness": 1.6, "mining_efficiency": 3.0}),
	"solarium_ingot":		EquipmentsConfig(DefaultOre.NETHERITE, SOLARIUM_DURABILITY, {"attack_damage": 15, "armor": 6.0, "armor_toughness": 1.8, "mining_efficiency": 3.0}),
	"darkium_ingot":		EquipmentsConfig(DefaultOre.NETHERITE, DARKIUM_DURABILITY, {"attack_damage": 17, "armor": 6.5, "armor_toughness": 2.0, "mining_efficiency": 3.0}),
	"ultimate_ingot":		None,
}

# Make all the item definitions
def beet_default(ctx: Context) -> None:

	# Generate ores in database
	generate_everything_about_these_materials(ORES_CONFIGS, ignore_recipes=True)

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

