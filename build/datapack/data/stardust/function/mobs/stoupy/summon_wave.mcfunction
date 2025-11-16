
#> stardust:mobs/stoupy/summon_wave
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/loop/display
#			stardust:advancements/consume_stoupegg [ positioned over world_surface run ]
#

# Summon 4 wolves around Stoupy
execute positioned ~1 ~ ~ run function stardust:mobs/stoupy/summon_mob
execute positioned ~-1 ~ ~ run function stardust:mobs/stoupy/summon_mob
execute positioned ~ ~ ~1 run function stardust:mobs/stoupy/summon_mob
execute positioned ~ ~ ~-1 run function stardust:mobs/stoupy/summon_mob

