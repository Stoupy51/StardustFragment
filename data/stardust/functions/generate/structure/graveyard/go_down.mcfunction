execute as @s[distance=..100] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/graveyard/go_down
execute if block ~ ~-1 ~ grass_block run tp @s ~ ~-1 ~
