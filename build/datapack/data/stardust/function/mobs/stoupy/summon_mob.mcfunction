
#> stardust:mobs/stoupy/summon_mob
#
# @executed	positioned ~1 ~ ~
#
# @within	stardust:mobs/stoupy/summon_wave [ positioned ~1 ~ ~ ]
#			stardust:mobs/stoupy/summon_wave [ positioned ~-1 ~ ~ ]
#			stardust:mobs/stoupy/summon_wave [ positioned ~ ~ ~1 ]
#			stardust:mobs/stoupy/summon_wave [ positioned ~ ~ ~-1 ]
#

# Particles
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.05 25

# Summon a wolf
execute positioned ~ ~-2 ~ summon minecraft:wolf run return run function stardust:mobs/stoupy/on_new_wolf

