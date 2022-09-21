
scoreboard players set #infinite stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:place/stardust_portal/
scoreboard players reset #infinite stardust.data

fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 blue_concrete
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 blue_concrete
fill ~-1 ~-3 ~-1 ~1 ~-3 ~1 blue_concrete
setblock ~-3 ~-1 ~-3 air
setblock ~3 ~-1 ~-3 air
setblock ~-3 ~-1 ~3 air
setblock ~3 ~-1 ~3 air
setblock ~ ~-4 ~ glowstone
setblock ~ ~ ~ light_weighted_pressure_plate
setblock ~ ~-1 ~ lapis_block
