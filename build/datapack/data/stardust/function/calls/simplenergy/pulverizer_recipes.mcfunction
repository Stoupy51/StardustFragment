
#> stardust:calls/simplenergy/pulverizer_recipes
#
# @within	#simplenergy:calls/pulverizer_recipes
#

execute if score #found simplenergy.data matches 0 store result score #found simplenergy.data if data storage simplenergy:main pulverizer.input{"components": {"minecraft:custom_data": {"stardust": {"dog_excrement": true}}}} run loot replace entity @s contents loot stardust:recipes/minecraft/bone_meal_x4to6

