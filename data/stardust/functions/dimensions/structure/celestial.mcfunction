
scoreboard players set #infinite stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:place/celestial_portal/main
scoreboard players reset #infinite stardust.data

fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 white_concrete
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 white_concrete
fill ~-1 ~-3 ~-1 ~1 ~-3 ~1 white_concrete
setblock ~-3 ~-1 ~-3 air
setblock ~3 ~-1 ~-3 air
setblock ~-3 ~-1 ~3 air
setblock ~3 ~-1 ~3 air
setblock ~ ~-4 ~ glowstone
setblock ~ ~-1 ~ iron_block
