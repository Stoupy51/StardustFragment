
tag @e[type=stray,tag=stardust.to_throw] remove stardust.to_throw
tag @e[type=evoker,tag=stardust.to_throw] remove stardust.to_throw
execute positioned ~ ~2 ~ run function stardust:mobs/stardust_soldier
execute positioned ~2 ~ ~ run function stardust:mobs/stardust_soldier
execute positioned ~-2 ~ ~ run function stardust:mobs/stardust_evoker
execute positioned ~ ~-2 ~ run function stardust:mobs/stardust_soldier
execute positioned ~ ~ ~-2 run function stardust:mobs/stardust_soldier
execute positioned ~ ~ ~2 run function stardust:mobs/stardust_evoker
execute at @e[tag=stardust.to_throw,distance=..10] run tp @e[tag=stardust.to_throw,limit=1,sort=nearest,distance=..10] ~ ~ ~ facing entity @s eyes
execute as @e[tag=stardust.to_throw,distance=..10] at @s run function stardust:boss/aim
playsound entity.ghast.shoot hostile @a[distance=..50]
