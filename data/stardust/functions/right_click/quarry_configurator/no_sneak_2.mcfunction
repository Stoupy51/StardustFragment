
tag @s remove stardust.config_quarry
tag @s add stardust.temp
execute as @e[type=glow_item_frame,sort=nearest,limit=1,distance=..2,tag=stardust.quarry] run function stardust:right_click/quarry_configurator/quarry
execute if entity @s[tag=stardust.temp] run summon area_effect_cloud ~ ~ ~ {Tags:["stardust.config_quarry_pos"]}
execute as @e[type=area_effect_cloud,tag=stardust.config_quarry_pos,limit=1] run function stardust:right_click/quarry_configurator/no_sneak_3
tellraw @s[tag=stardust.temp] ["",{"text":"First coordinates defined : x=","color":"green"},{"score":{"name":"Qx1","objective":"stardust.data_2"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy1","objective":"stardust.data_2"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz1","objective":"stardust.data_2"},"color":"dark_green"}]
tag @s remove stardust.temp
