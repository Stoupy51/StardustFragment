
#> stardust:boss/stardust_pillar/spawn
#
# @within			stardust:right_click/stardust_pillar/secondary
# @executed			as & at the current player that right clicked the stardust pillar item
#
# @description		Spawns a stardust pillar mob at the current player's location and runs the setup function
#

# Advancement for players in a radius
advancement grant @a[distance=..100] only stardust:visible/adventure/stardust_pillar

# Summon the Stardust Pillar
execute positioned ~ ~20 ~ run function stardust:mobs/stardust_pillar

# Playsound
execute as @a[distance=..200] at @s run playsound stardust:stardust_pillar_spawn hostile @s

