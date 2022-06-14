execute in stardust:stardust positioned ~-50 ~-250 ~-50 unless entity @e[tag=stardust.portal,dx=100,dy=500,dz=100] positioned ~50 ~250 ~50 run function stardust:dimensions/structure/stardust
execute in stardust:stardust at @e[tag=stardust.portal,limit=1,sort=nearest,y=0] run tp @s ~ ~1 ~
execute in stardust:stardust run forceload remove ~-50 ~-50 ~50 ~50
