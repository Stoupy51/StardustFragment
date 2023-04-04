
tag @s remove stardust.config_quarry
tag @s add stardust.temp
execute as @e[sort=nearest,limit=1,distance=..2,tag=stardust.quarry] run function stardust:right_click/quarry_configurator/quarry
execute if entity @s[tag=stardust.temp] summon marker run function stardust:right_click/quarry_configurator/sneak_3
tellraw @s[tag=stardust.temp] ["",{"text":"Second coordinates defined : x=","color":"green"},{"score":{"name":"Qx2","objective":"stardust.data_2"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy2","objective":"stardust.data_2"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz2","objective":"stardust.data_2"},"color":"dark_green"}]
tag @s remove stardust.temp

