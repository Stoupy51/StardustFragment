
# Imports
from stewbeet import DefaultOre, EquipmentsConfig, VanillaEquipments

# Constants
DIAMOND_PICKAXE: float = VanillaEquipments.PICKAXE.value[DefaultOre.DIAMOND]["durability"]
NETHERITE_PICKAXE: float = VanillaEquipments.PICKAXE.value[DefaultOre.NETHERITE]["durability"]
DAMAGED_STARDUST_DURABILITY: float = 1.5 * DIAMOND_PICKAXE
ORIGINAL_DURABILITY: float = 3.0 * DIAMOND_PICKAXE
LEGENDARIUM_DURABILITY: float = 4.5 * DIAMOND_PICKAXE
SOLARIUM_DURABILITY: float = 5.0 * DIAMOND_PICKAXE
DARKIUM_DURABILITY: float = 5.5 * DIAMOND_PICKAXE

ORES_CONFIGS: dict[str, EquipmentsConfig|None] = {
	"awakened_stardust!":	None,
	"ancient_stardust!":	EquipmentsConfig(DefaultOre.DIAMOND, DAMAGED_STARDUST_DURABILITY, {"attack_damage": 2, "armor": 1.0, "armor_toughness": 1.0, "mining_efficiency": 1.5}),
	"original_stardust!":	EquipmentsConfig(DefaultOre.DIAMOND, ORIGINAL_DURABILITY, {"attack_damage": 8, "armor": 3.0, "armor_toughness": 1.3, "mining_efficiency": 2.0}),
	"legendarium_ingot":	EquipmentsConfig(DefaultOre.NETHERITE, LEGENDARIUM_DURABILITY, {"attack_damage": 13, "armor": 5.5, "armor_toughness": 1.6, "mining_efficiency": 3.0}),
	"solarium_ingot":		EquipmentsConfig(DefaultOre.NETHERITE, SOLARIUM_DURABILITY, {"attack_damage": 15, "armor": 6.0, "armor_toughness": 1.8, "mining_efficiency": 3.0}),
	"darkium_ingot":		EquipmentsConfig(DefaultOre.NETHERITE, DARKIUM_DURABILITY, {"attack_damage": 17, "armor": 6.5, "armor_toughness": 2.0, "mining_efficiency": 3.0}),
	"ultimate_ingot":		None,
}

