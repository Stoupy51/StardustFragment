tag @s remove SF_ConfigQuarry
tag @s add SF_Temp
execute as @e[type=minecraft:glow_item_frame,sort=nearest,limit=1,distance=..2,tag=SF_Quarry] run function stardust:rightclick/quarry_configurator/quarry
execute if entity @s[tag=SF_Temp] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SF_ConfigQuarryPos"]}
execute as @e[type=minecraft:area_effect_cloud,tag=SF_ConfigQuarryPos,limit=1] run function stardust:rightclick/quarry_configurator/no_sneak_3
tag @s remove SF_Temp
