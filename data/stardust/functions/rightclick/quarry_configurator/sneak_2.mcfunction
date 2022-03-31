
tag @s remove stardust.config_quarry
tag @s add stardust.temp
execute as @e[type=glow_item_frame,sort=nearest,limit=1,distance=..2,tag=stardust.quarry] run function stardust:rightclick/quarry_configurator/quarry
execute if entity @s[tag=stardust.temp] run summon area_effect_cloud ~ ~ ~ {Tags:["stardust.config_quarry_pos"]}
execute as @e[type=area_effect_cloud,tag=stardust.config_quarry_pos,limit=1] run function stardust:rightclick/quarry_configurator/sneak_3
tellraw @s[tag=stardust.temp] ["",{"text":"Second coordinates defined : x=","color":"green"},{"score":{"name":"Qx2","objective":"stardust.data_2"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy2","objective":"stardust.data_2"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz2","objective":"stardust.data_2"},"color":"dark_green"}]
tag @s remove stardust.temp
