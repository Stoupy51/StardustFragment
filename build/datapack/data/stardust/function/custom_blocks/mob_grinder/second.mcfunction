
#> stardust:custom_blocks/mob_grinder/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/second
#

# If not enough energy, update model and stop
execute unless score @s energy.storage matches 100.. run return run data modify entity @s item.components."minecraft:item_model" set value "stardust:mob_grinder"
data modify entity @s item.components."minecraft:item_model" set value "stardust:mob_grinder_on"

# Consume energy (100 per second)
scoreboard players remove @s energy.storage 5

# Kill mobs in front of the grinder
execute positioned ^ ^ ^3 as @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,tag=!stardust.stardust_pillar,distance=..4] at @s run loot spawn ~ ~ ~ kill @s
execute positioned ^ ^ ^3 run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,tag=!stardust.stardust_pillar,distance=..4]

