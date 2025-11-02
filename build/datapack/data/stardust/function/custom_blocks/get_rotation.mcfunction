
#> stardust:custom_blocks/get_rotation
#
# @within	stardust:custom_blocks/nether_star_generator/place_main
#			stardust:custom_blocks/advanced_furnace_generator/place_main
#			stardust:custom_blocks/stardust_furnace_generator/place_main
#			stardust:custom_blocks/awakened_stardust_furnace_generator/place_main
#			stardust:custom_blocks/life_crystal_block/place_main
#

# Set up score
scoreboard players set #rotation stardust.data 0

# Player case
execute if score #rotation stardust.data matches 0 if entity @s[y_rotation=-46..45] run scoreboard players set #rotation stardust.data 1
execute if score #rotation stardust.data matches 0 if entity @s[y_rotation=45..135] run scoreboard players set #rotation stardust.data 2
execute if score #rotation stardust.data matches 0 if entity @s[y_rotation=135..225] run scoreboard players set #rotation stardust.data 3
execute if score #rotation stardust.data matches 0 if entity @s[y_rotation=225..315] run scoreboard players set #rotation stardust.data 4

# Predicate case
execute if score #rotation stardust.data matches 0 if predicate stardust:facing/north run scoreboard players set #rotation stardust.data 1
execute if score #rotation stardust.data matches 0 if predicate stardust:facing/east run scoreboard players set #rotation stardust.data 2
execute if score #rotation stardust.data matches 0 if predicate stardust:facing/south run scoreboard players set #rotation stardust.data 3
execute if score #rotation stardust.data matches 0 if predicate stardust:facing/west run scoreboard players set #rotation stardust.data 4
# No more cases for now

