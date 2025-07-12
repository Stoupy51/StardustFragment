
#> stardust:calls/smithed_crafter/shapeless_recipes
#
# @within	#smithed.crafter:event/shapeless_recipes
#

execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"stardust_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_ingot_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"stardust_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_fragment_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"legendarium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_ingot_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"legendarium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_fragment_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"solarium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_ingot_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"solarium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_fragment_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"darkium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_ingot_x9
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"stardust": {"darkium_block": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_fragment_x9

