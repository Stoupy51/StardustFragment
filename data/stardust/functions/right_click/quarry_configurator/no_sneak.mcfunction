
tag @s add stardust.config_quarry
#Look at where player is looking at and stop when found a block (stardust.config_quarry removed)
	execute anchored eyes positioned ^ ^ ^.2 run function stardust:right_click/quarry_configurator/no_sneak_raycast

tag @s remove stardust.config_quarry
