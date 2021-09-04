execute in stardust:celestial unless entity @e[type=glow_item_frame,tag=SF_Portal,distance=..50] run function stardust:dimensions/structure/celestial
execute in stardust:celestial at @e[type=glow_item_frame,tag=SF_Portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
execute in stardust:celestial run forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s SF_Data
