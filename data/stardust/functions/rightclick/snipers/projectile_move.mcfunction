execute if entity @s[tag=StardustFragment_StardustSniper] run particle minecraft:dust 0 0 1 1 ~ ~ ~ .1 .1 .1 0 1
execute if entity @s[tag=StardustFragment_AwakenedStardustSniper] run particle minecraft:dust 1 0 0 1 ~ ~ ~ .1 .1 .1 0 1
execute if entity @s[tag=StardustFragment_UltimateSniper] run particle minecraft:dust 255 255 255 1 ~ ~ ~ .1 .1 .1 0 1
tp @s ^ ^ ^0.5
execute as @e[dx=0,dy=3,dz=0,distance=..3,tag=!StardustFragment_Shooter,tag=!StardustFragment_Shooted,tag=!global.ignore,tag=!global.ignore.kill,type=!player,type=!item,type=!#energy:valid_block_entities] at @s run function stardust:rightclick/snipers/damage

execute unless block ~ ~ ~ #stardust:non_solid run kill @s
execute if block ~ ~ ~ #stardust:non_solid at @s run function stardust:rightclick/snipers/projectile_move
