
#> stardust:v3.5.0/load/valid_dependencies
#
# @within	stardust:v3.5.0/load/secondary
#			stardust:v3.5.0/load/valid_dependencies 1t replace
#

# Waiting for a player to get the game version, but stop function if no player found
execute unless entity @p run schedule function stardust:v3.5.0/load/valid_dependencies 1t replace
execute unless entity @p run return 0
execute store result score #game_version stardust.data run data get entity @p DataVersion

# Check if the game version is supported
scoreboard players set #mcload_error stardust.data 0
execute unless score #game_version stardust.data matches 4556.. run scoreboard players set #mcload_error stardust.data 1

# Decode errors
execute if score #mcload_error stardust.data matches 1 run tellraw @a {"translate": "stardustfragment_error_this_version_is_made_for_minecraft_1_21_1","color":"red"}
execute if score #dependency_error stardust.data matches 1 run tellraw @a {"translate": "stardustfragment_error_libraries_are_missingplease_download_the_","color":"red"}
execute if score #dependency_error stardust.data matches 1 unless score #common_signals.major load.status matches 0.. run tellraw @a {"translate": "stardust.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error stardust.data matches 1 if score #common_signals.major load.status matches 0 unless score #common_signals.minor load.status matches 1.. run tellraw @a {"translate": "stardust.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error stardust.data matches 1 if score #common_signals.major load.status matches 0 if score #common_signals.minor load.status matches 1 unless score #common_signals.patch load.status matches 1.. run tellraw @a {"translate": "stardust.common_signals_v0_1_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/CommonSignals"}}
execute if score #dependency_error stardust.data matches 1 unless score #smithed.custom_block.major load.status matches 0.. run tellraw @a {"translate": "stardust.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error stardust.data matches 1 if score #smithed.custom_block.major load.status matches 0 unless score #smithed.custom_block.minor load.status matches 7.. run tellraw @a {"translate": "stardust.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error stardust.data matches 1 if score #smithed.custom_block.major load.status matches 0 if score #smithed.custom_block.minor load.status matches 7 unless score #smithed.custom_block.patch load.status matches 1.. run tellraw @a {"translate": "stardust.smithed_custom_block_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/custom-block/"}}
execute if score #dependency_error stardust.data matches 1 unless score #smithed.crafter.major load.status matches 0.. run tellraw @a {"translate": "stardust.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error stardust.data matches 1 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 7.. run tellraw @a {"translate": "stardust.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error stardust.data matches 1 if score #smithed.crafter.major load.status matches 0 if score #smithed.crafter.minor load.status matches 7 unless score #smithed.crafter.patch load.status matches 1.. run tellraw @a {"translate": "stardust.smithed_crafter_v0_7_1","color":"gold","click_event":{"action":"open_url","url":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error stardust.data matches 1 unless score #furnace_nbt_recipes.major load.status matches 1.. run tellraw @a {"translate": "stardust.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error stardust.data matches 1 if score #furnace_nbt_recipes.major load.status matches 1 unless score #furnace_nbt_recipes.minor load.status matches 9.. run tellraw @a {"translate": "stardust.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error stardust.data matches 1 if score #furnace_nbt_recipes.major load.status matches 1 if score #furnace_nbt_recipes.minor load.status matches 9 unless score #furnace_nbt_recipes.patch load.status matches 1.. run tellraw @a {"translate": "stardust.furnace_nbt_recipes_v1_9_1","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/FurnaceNbtRecipes"}}
execute if score #dependency_error stardust.data matches 1 unless score #smart_ore_generation.major load.status matches 1.. run tellraw @a {"translate": "stardust.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error stardust.data matches 1 if score #smart_ore_generation.major load.status matches 1 unless score #smart_ore_generation.minor load.status matches 7.. run tellraw @a {"translate": "stardust.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error stardust.data matches 1 if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 7 unless score #smart_ore_generation.patch load.status matches 2.. run tellraw @a {"translate": "stardust.smartoregeneration_v1_7_2","color":"gold","click_event":{"action":"open_url","url":"https://github.com/Stoupy51/SmartOreGeneration"}}
execute if score #dependency_error stardust.data matches 1 unless score #simplenergy.major load.status matches 2.. run tellraw @a {"translate": "stardust.simplenergy_v2_0_8","color":"gold","click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simplenergy"}}
execute if score #dependency_error stardust.data matches 1 if score #simplenergy.major load.status matches 2 unless score #simplenergy.minor load.status matches 0.. run tellraw @a {"translate": "stardust.simplenergy_v2_0_8","color":"gold","click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simplenergy"}}
execute if score #dependency_error stardust.data matches 1 if score #simplenergy.major load.status matches 2 if score #simplenergy.minor load.status matches 0 unless score #simplenergy.patch load.status matches 8.. run tellraw @a {"translate": "stardust.simplenergy_v2_0_8","color":"gold","click_event":{"action":"open_url","url":"https://modrinth.com/datapack/simplenergy"}}

# Load StardustFragment
execute if score #game_version stardust.data matches 1.. if score #mcload_error stardust.data matches 0 if score #dependency_error stardust.data matches 0 run function stardust:v3.5.0/load/confirm_load

