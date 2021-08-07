setblock ~ ~ ~ minecraft:air destroy
execute if entity @e[type=minecraft:glow_item_frame,tag=SF_Destroyer,distance=..1,limit=1] run function stardust:destroy/all
execute if entity @e[type=minecraft:glow_item_frame,tag=SE_Destroyer,distance=..1,limit=1] run function simplenergy:destroy/all
tp @e[type=minecraft:item,distance=..1] @s
kill @e[type=minecraft:experience_orb,distance=..1]
