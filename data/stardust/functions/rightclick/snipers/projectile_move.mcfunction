execute as @s[tag=SF_StardustSniper] run particle minecraft:dust 0 0 1 1 ~ ~ ~ .1 .1 .1 0 1
execute as @s[tag=SF_AwakenedStardustSniper] run particle minecraft:dust 1 0 0 1 ~ ~ ~ .1 .1 .1 0 1
execute as @s[tag=SF_UltimateSniper] run particle minecraft:dust 255 255 255 1 ~ ~ ~ .1 .1 .1 0 1
tp @s ^ ^ ^0.5
execute as @e[dx=0,dy=3,dz=0,distance=..3,tag=!SF_Shooter,tag=!SF_Shooted,type=!item,type=!#energy:valid_block_entities,type=!player] at @s run function stardust:rightclick/snipers/damage

execute unless block ~ ~ ~ #stardust:non_solid run kill @s
execute if block ~ ~ ~ #stardust:non_solid at @s run function stardust:rightclick/snipers/projectile_move
