execute in minecraft:the_end run tp 0 255 0
tp @s @e[type=minecraft:glow_item_frame,tag=SF_Portal,limit=1,sort=nearest,distance=0..]
forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s SF_Data
