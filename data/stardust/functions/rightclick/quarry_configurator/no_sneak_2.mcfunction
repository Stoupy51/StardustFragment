tag @s remove SF_ConfigQuarry
tag @s add SF_Temp
execute as @e[type=glow_item_frame,sort=nearest,limit=1,distance=..2,tag=SF_Quarry] run function stardust:rightclick/quarry_configurator/quarry
execute if entity @s[tag=SF_Temp] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SF_ConfigQuarryPos"]}
execute as @e[type=area_effect_cloud,tag=SF_ConfigQuarryPos,limit=1] run function stardust:rightclick/quarry_configurator/no_sneak_3
tellraw @s[tag=SF_Temp] ["",{"text":"First coordinates defined : x=","color":"green"},{"score":{"name":"Qx1","objective":"SF_X"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy1","objective":"SF_X"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz1","objective":"SF_X"},"color":"dark_green"}]
tag @s remove SF_Temp
