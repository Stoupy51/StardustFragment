
#> stardust:v4.0.0/load/check_dependencies
#
# @within	stardust:v4.0.0/load/secondary
#

## Check if StardustFragment is loadable (dependencies)
scoreboard players set #dependency_error stardust.data 0
execute if score #dependency_error stardust.data matches 0 unless score #common_signals.major load.status matches 0.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #common_signals.major load.status matches 0 unless score #common_signals.minor load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #smithed.custom_block.major load.status matches 0.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smithed.custom_block.major load.status matches 0 unless score #smithed.custom_block.minor load.status matches 7.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smithed.custom_block.major load.status matches 0 if score #smithed.custom_block.minor load.status matches 7 unless score #smithed.custom_block.patch load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #smithed.crafter.major load.status matches 0.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 7.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smithed.crafter.major load.status matches 0 if score #smithed.crafter.minor load.status matches 7 unless score #smithed.crafter.patch load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #furnace_nbt_recipes.major load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #furnace_nbt_recipes.major load.status matches 1 unless score #furnace_nbt_recipes.minor load.status matches 9.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #furnace_nbt_recipes.major load.status matches 1 if score #furnace_nbt_recipes.minor load.status matches 9 unless score #furnace_nbt_recipes.patch load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #smart_ore_generation.major load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smart_ore_generation.major load.status matches 1 unless score #smart_ore_generation.minor load.status matches 7.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 7 unless score #smart_ore_generation.patch load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #itemio.major load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #itemio.major load.status matches 1 unless score #itemio.minor load.status matches 4.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #itemio.major load.status matches 1 if score #itemio.minor load.status matches 4 unless score #itemio.patch load.status matches 1.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score $bs.block.major load.status matches 3.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score $bs.block.major load.status matches 3 unless score $bs.block.minor load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score $bs.move.major load.status matches 3.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score $bs.move.major load.status matches 3 unless score $bs.move.minor load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score $bs.raycast.major load.status matches 3.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score $bs.raycast.major load.status matches 3 unless score $bs.raycast.minor load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score $bs.view.major load.status matches 3.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score $bs.view.major load.status matches 3 unless score $bs.view.minor load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 unless score #simplenergy.major load.status matches 2.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #simplenergy.major load.status matches 2 unless score #simplenergy.minor load.status matches 0.. run scoreboard players set #dependency_error stardust.data 1
execute if score #dependency_error stardust.data matches 0 if score #simplenergy.major load.status matches 2 if score #simplenergy.minor load.status matches 0 unless score #simplenergy.patch load.status matches 15.. run scoreboard players set #dependency_error stardust.data 1

