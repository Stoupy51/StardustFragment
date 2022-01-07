execute unless block ~ ~ ~ #stardust:non_solid run scoreboard players set Temp StardustFragment_Data -1
execute as @s[distance=..64] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/floating_island_awakened/go_down
