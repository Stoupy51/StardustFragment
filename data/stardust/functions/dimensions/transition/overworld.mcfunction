
execute in the_end run tp 600 255 600
execute at @e[tag=stardust.portal,limit=1,sort=nearest,y=0] run tp @s ~ ~1 ~
execute in overworld at @e[tag=stardust.portal,distance=..100,sort=nearest,limit=1] run tp @s ~ ~1 ~
forceload remove ~-50 ~-50 ~50 ~50
execute if entity @s
