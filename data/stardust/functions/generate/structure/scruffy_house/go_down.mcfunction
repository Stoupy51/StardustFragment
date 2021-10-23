execute as @s[distance=..100] if block ~ ~ ~ #stardust:non_solid positioned ~ ~-1 ~ run function stardust:generate/structure/scruffy_house/go_down
execute if block ~ ~-1 ~ podzol run tp @s ~ ~-1 ~
