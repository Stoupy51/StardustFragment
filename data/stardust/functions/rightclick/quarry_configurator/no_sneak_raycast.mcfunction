execute as @s[distance=..5] if block ~ ~ ~ #stardust:non_solid positioned ^ ^ ^.2 run function stardust:rightclick/quarry_configurator/no_sneak_raycast
execute unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/no_sneak_2
