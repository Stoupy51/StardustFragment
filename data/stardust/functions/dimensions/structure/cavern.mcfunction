
scoreboard players set #infinite stardust.data 1
execute positioned ~ ~-1 ~ run function stardust:place/cavern_portal/
scoreboard players reset #infinite stardust.data

fill ~-3 ~-3 ~-3 ~3 ~4 ~3 cobblestone
fill ~-2 ~-2 ~-2 ~2 ~3 ~2 air
fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 cobblestone
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 torch replace air
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 torch replace air
setblock ~ ~-1 ~ cobbled_deepslate
