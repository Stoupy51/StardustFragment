execute in stardust:stardust unless entity @e[type=minecraft:glow_item_frame,tag=SF_Portal,distance=..50] run function stardust:dimensions/structure/stardust
execute in stardust:stardust at @e[type=minecraft:glow_item_frame,tag=SF_Portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
execute in stardust:stardust run forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s SF_Data
