tag @s remove SF_ConfigQuarry
tag @s add SF_Temp
execute as @e[type=glow_item_frame,sort=nearest,limit=1,distance=..2,tag=SF_Quarry] run function stardust:rightclick/quarry_configurator/quarry
execute if entity @s[tag=SF_Temp] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SF_ConfigQuarryPos"]}
execute as @e[type=area_effect_cloud,tag=SF_ConfigQuarryPos,limit=1] run function stardust:rightclick/quarry_configurator/sneak_3
tellraw @s[tag=SF_Temp] ["",{"text":"Second coordinates defined : x=","color":"green"},{"score":{"name":"Qx2","objective":"SF_X"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy2","objective":"SF_X"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz2","objective":"SF_X"},"color":"dark_green"}]
tag @s remove SF_Temp
