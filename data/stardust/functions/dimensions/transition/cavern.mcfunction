execute in stardust:cavern unless entity @e[type=glow_item_frame,tag=SF_Portal,distance=..50] run function stardust:dimensions/structure/cavern
execute in stardust:cavern at @e[type=glow_item_frame,tag=SF_Portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
execute in stardust:cavern run forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s SF_Data
