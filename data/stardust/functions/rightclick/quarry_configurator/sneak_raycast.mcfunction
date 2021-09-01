scoreboard players add Count SF_X 1
execute if score Count SF_X matches ..25 if block ~ ~ ~ #stardust:non_solid positioned ^ ^ ^.2 run function stardust:rightclick/quarry_configurator/sneak_raycast
execute unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
