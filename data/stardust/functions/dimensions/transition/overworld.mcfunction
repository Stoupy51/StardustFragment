execute in minecraft:the_end run tp 0 255 0
execute in minecraft:overworld at @e[type=minecraft:glow_item_frame,tag=SF_Portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s SF_Data
