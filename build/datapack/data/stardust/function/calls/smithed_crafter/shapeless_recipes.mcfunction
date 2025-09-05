
#> stardust:calls/smithed_crafter/shapeless_recipes
#
# @within	#smithed.crafter:event/shapeless_recipes
#

execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 9, "components": {"minecraft:custom_data": {"stardust": {"stardust_ingot": true}}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_block

