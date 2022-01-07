tag @e[type=stray,tag=StardustFragment_ToThrow] remove StardustFragment_ToThrow
tag @e[type=evoker,tag=StardustFragment_ToThrow] remove StardustFragment_ToThrow
execute positioned ~ ~2 ~ run function stardust:mobs/stray
execute positioned ~2 ~ ~ run function stardust:mobs/stray
execute positioned ~-2 ~ ~ run function stardust:mobs/evoker
execute positioned ~ ~-2 ~ run function stardust:mobs/stray
execute positioned ~ ~ ~-2 run function stardust:mobs/stray
execute positioned ~ ~ ~2 run function stardust:mobs/evoker
execute at @e[tag=StardustFragment_ToThrow,distance=..10] run tp @e[tag=StardustFragment_ToThrow,limit=1,sort=nearest,distance=..10] ~ ~ ~ facing entity @s eyes
execute as @e[tag=StardustFragment_ToThrow,distance=..10] at @s run function stardust:boss/aim
playsound minecraft:entity.ghast.shoot hostile @a[distance=..50]
