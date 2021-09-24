execute as @s[distance=..100] positioned ~ ~-1 ~ unless block ~ ~ ~ grass_block run function stardust:generate/structure/water_well/go_down
execute if block ~ ~-1 ~ grass_block run tp @s ~ ~-1 ~
