tag @s remove StardustFragment_ConfigQuarry
tag @s add StardustFragment_Temp
execute as @e[type=glow_item_frame,sort=nearest,limit=1,distance=..2,tag=StardustFragment_Quarry] run function stardust:rightclick/quarry_configurator/quarry
execute as @s[tag=StardustFragment_Temp] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["StardustFragment_ConfigQuarryPos"]}
execute as @e[type=area_effect_cloud,tag=StardustFragment_ConfigQuarryPos,limit=1] run function stardust:rightclick/quarry_configurator/no_sneak_3
tellraw @s[tag=StardustFragment_Temp] ["",{"text":"First coordinates defined : x=","color":"green"},{"score":{"name":"Qx1","objective":"StardustFragment_X"},"color":"dark_green"},{"text":", y=","color":"green"},{"score":{"name":"Qy1","objective":"StardustFragment_X"},"color":"dark_green"},{"text":", z=","color":"green"},{"score":{"name":"Qz1","objective":"StardustFragment_X"},"color":"dark_green"}]
tag @s remove StardustFragment_Temp
