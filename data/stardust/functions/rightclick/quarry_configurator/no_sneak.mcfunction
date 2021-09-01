tag @s add SF_ConfigQuarry
#Look at where player is looking at and stop when found a block (SF_ConfigQuarry removed)
    scoreboard players set Count SF_X 0
    execute anchored eyes positioned ^ ^ ^.2 run function stardust:rightclick/quarry_configurator/no_sneak_raycast

tag @s remove SF_ConfigQuarry
