
#> stardust:quarry/configurator/apply_to_quarry
#
# @executed	as @e[tag=stardust.quarry,dx=0,dy=0,dz=0]
#
# @within	stardust:quarry/configurator/at_aimed_block [ as @e[tag=stardust.quarry,dx=0,dy=0,dz=0] ]
#

# Update quarry scores
scoreboard players operation @s stardust.quarry_x1 = #config_x1 stardust.data
scoreboard players operation @s stardust.quarry_y1 = #config_y1 stardust.data
scoreboard players operation @s stardust.quarry_z1 = #config_z1 stardust.data
scoreboard players operation @s stardust.quarry_x2 = #config_x2 stardust.data
scoreboard players operation @s stardust.quarry_y2 = #config_y2 stardust.data
scoreboard players operation @s stardust.quarry_z2 = #config_z2 stardust.data

# Tellraw message
tellraw @p[tag=stardust.temp] [{"translate": "stardust.quarry_configuration_updated","color":"green"}]
playsound block.note_block.pling ambient @p[tag=stardust.temp]

