
#> stardust:custom_blocks/awakened_stardust_furnace_generator/stop
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/awakened_stardust_furnace_generator/second
#

item replace block ~ ~ ~ container.0 with cobblestone[item_model="stardust:gui/advanced_furnace_generator",tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}]
data modify entity @s item.components."minecraft:item_model" set value "stardust:awakened_stardust_furnace_generator"

