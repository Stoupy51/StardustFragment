
execute in stardust:cavern positioned ~-50 ~-250 ~-50 unless entity @e[tag=stardust.portal,dx=100,dy=500,dz=100] positioned ~50 69 ~50 run function stardust:dimensions/structure/cavern
execute in stardust:cavern at @e[tag=stardust.portal,limit=1,sort=nearest,y=0] run tp @s ~ ~1 ~
execute in stardust:cavern run forceload remove ~-50 ~-50 ~50 ~50
execute if entity @s
