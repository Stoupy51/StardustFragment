
scoreboard players operation #predicate stardust.data = @s stardust.id
execute unless entity @e[type=bat,tag=stardust.stardust_dim,dx=0,dy=0,dz=0,predicate=stardust:equals_id,limit=1] run kill @s

