
execute if entity @s[distance=..5] if block ~ ~ ~ #stardust:non_solid positioned ^ ^ ^.2 run function stardust:right_click/quarry_configurator/no_sneak_raycast
execute unless block ~ ~ ~ #stardust:non_solid run function stardust:right_click/quarry_configurator/no_sneak_2
