
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
item modify entity @s contents {"function":"minecraft:set_lore","entity":"this","lore":[[{"keybind": "key.use", "italic": false, "color": "white"}, {"translate": "stardust.to_set_1st_coordinates", "color": "gray"}], [{"keybind": "key.sneak", "italic": false, "color": "white"}, {"text": " + ", "color": "gray"}, {"keybind": "key.use"}, {"translate": "stardust.to_set_2nd_coordinates", "color": "gray"}], ["", {"text": "I", "color": "white", "italic": false, "font": "stardust:icons"}, {"translate": "stardustfragment", "italic": true, "color": "blue"}], "", [{"translate": "stardust.selected_area", "color": "aqua", "italic": false}], [{"text": "- X: ", "color": "dark_red", "italic": false}, {"score": {"name": "#config_x1", "objective": "stardust.data"}}, {"text": " to "}, {"score": {"name": "#config_x2", "objective": "stardust.data"}}], [{"text": "- Y: ", "color": "green", "italic": false}, {"score": {"name": "#config_y1", "objective": "stardust.data"}}, {"text": " to "}, {"score": {"name": "#config_y2", "objective": "stardust.data"}}], [{"text": "- Z: ", "color": "blue", "italic": false}, {"score": {"name": "#config_z1", "objective": "stardust.data"}}, {"text": " to "}, {"score": {"name": "#config_z2", "objective": "stardust.data"}}]],"mode":"replace_all"}
item replace entity @p[tag=stardust.temp] weapon.mainhand from entity @s contents
kill @s

