
#> stardust:calls/simplenergy/pulverizer_recipes
#
# @within	#simplenergy:calls/pulverizer_recipes
#

execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"stardust_ingot": true}}}} run loot replace entity @s contents loot stardust:i/stardust_fragment_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"stardust_essence": true}}}} run loot replace entity @s contents loot stardust:i/stardust_ingot_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"stardust_core": true}}}} run loot replace entity @s contents loot stardust:i/stardust_essence_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"awakened_stardust_block": true}}}} run loot replace entity @s contents loot stardust:i/awakened_stardust_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"legendarium_ingot": true}}}} run loot replace entity @s contents loot stardust:i/legendarium_fragment_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"legendarium_block": true}}}} run loot replace entity @s contents loot stardust:i/legendarium_ingot_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"solarium_ingot": true}}}} run loot replace entity @s contents loot stardust:i/solarium_fragment_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"solarium_block": true}}}} run loot replace entity @s contents loot stardust:i/solarium_ingot_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"darkium_ingot": true}}}} run loot replace entity @s contents loot stardust:i/darkium_fragment_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"darkium_block": true}}}} run loot replace entity @s contents loot stardust:i/darkium_ingot_x8
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"ender_dragon_pearl": true}}}} run loot replace entity @s contents loot stardust:i/dragon_pearl
execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"dog_excrement": true}}}} run loot replace entity @s contents loot stardust:recipes/minecraft/bone_meal_x4to6

