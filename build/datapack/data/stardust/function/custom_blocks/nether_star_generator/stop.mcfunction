
#> stardust:custom_blocks/nether_star_generator/stop
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/nether_star_generator/second
#

item replace block ~ ~ ~ container.1 with cobblestone[item_model="stardust:gui/nether_star_generator",tooltip_display={"hide_tooltip":true},custom_data={"common_signals":{"temp":true}}]
data modify entity @s item.components."minecraft:item_model" set value "stardust:nether_star_generator"

