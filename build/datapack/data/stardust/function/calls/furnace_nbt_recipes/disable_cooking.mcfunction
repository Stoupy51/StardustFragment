
#> stardust:calls/furnace_nbt_recipes/disable_cooking
#
# @within	#furnace_nbt_recipes:v1/disable_cooking
#

execute if score #reset furnace_nbt_recipes.data matches 0 store success score #reset furnace_nbt_recipes.data if data storage furnace_nbt_recipes:main input{"id":"minecraft:furnace"}

