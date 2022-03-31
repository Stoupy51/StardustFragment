execute in minecraft:the_end run tp 0 255 0
execute at @e[type=glow_item_frame,tag=stardust.portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s stardust.data
