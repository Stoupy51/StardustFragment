execute in stardust:stardust positioned ~-50 ~-250 ~-50 unless entity @e[type=glow_item_frame,tag=StardustFragment_Portal,dx=100,dy=500,dz=100] positioned ~50 ~250 ~50 run function stardust:dimensions/structure/stardust
execute in stardust:stardust at @e[type=glow_item_frame,tag=StardustFragment_Portal,limit=1,sort=nearest,distance=0..] run tp @s ~ ~1 ~
execute in stardust:stardust run forceload remove ~-50 ~-50 ~50 ~50
scoreboard players reset @s StardustFragment_Data
