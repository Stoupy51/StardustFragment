tag @s add StardustFragment_ConfigQuarry
#Look at where player is looking at and stop when found a block (StardustFragment_ConfigQuarry removed)
	execute anchored eyes positioned ^ ^ ^.2 run function stardust:rightclick/quarry_configurator/no_sneak_raycast

tag @s remove StardustFragment_ConfigQuarry
