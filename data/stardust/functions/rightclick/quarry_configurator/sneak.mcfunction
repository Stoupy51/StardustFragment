tag @s add SF_ConfigQuarry
#Look at where player is looking at and stop when found a block (SF_ConfigQuarry removed)
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^ unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^0.50 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^0.75 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^1.00 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^1.25 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^1.50 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^1.75 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^2.00 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^2.25 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^2.50 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^2.75 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^3.00 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^3.25 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^3.50 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^3.75 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^4.00 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^4.25 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^4.50 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^4.75 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2
    execute if entity @s[tag=SF_ConfigQuarry] anchored eyes positioned ^ ^ ^5.00 unless block ~ ~ ~ #stardust:non_solid run function stardust:rightclick/quarry_configurator/sneak_2

tag @s remove SF_ConfigQuarry
