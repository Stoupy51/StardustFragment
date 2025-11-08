
#> stardust:quarry/configurator/update_custom_data
#
# @executed	as the player & at current position
#
# @within	stardust:quarry/configurator/right_click
#

# Copy item, update it, and send it back
item replace entity @s contents from entity @p[tag=stardust.temp] weapon.mainhand
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_x1 int 1 run scoreboard players get #config_x1 stardust.data
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_y1 int 1 run scoreboard players get #config_y1 stardust.data
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_z1 int 1 run scoreboard players get #config_z1 stardust.data
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_x2 int 1 run scoreboard players get #config_x2 stardust.data
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_y2 int 1 run scoreboard players get #config_y2 stardust.data
execute store result entity @s item.components."minecraft:custom_data".stardust.quarry_z2 int 1 run scoreboard players get #config_z2 stardust.data
item replace entity @p[tag=stardust.temp] weapon.mainhand from entity @s contents
kill @s

