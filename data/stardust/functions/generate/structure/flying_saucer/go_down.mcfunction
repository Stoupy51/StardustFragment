execute unless block ~ ~ ~ #stardust:non_solid run scoreboard players set Temp SF_Data -1
execute as @s[distance=..64] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/flying_saucer/go_down
