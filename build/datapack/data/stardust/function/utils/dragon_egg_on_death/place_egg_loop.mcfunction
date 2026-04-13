
#> stardust:utils/dragon_egg_on_death/place_egg_loop
#
# @executed	in minecraft:the_end & positioned 0 100 0
#
# @within	stardust:utils/dragon_egg_on_death/place_egg_start [ in minecraft:the_end & positioned 0 100 0 ]
#			stardust:utils/dragon_egg_on_death/place_egg_loop [ positioned ~ ~-1 ~ ]
#

# If current block is bedrock, stop and place egg
execute unless loaded ~ ~ ~ run return fail
execute if block ~ ~ ~ bedrock run return run setblock ~ ~1 ~ minecraft:dragon_egg

# Else, move down and repeat until bedrock found or bottom reached
execute positioned ~ ~-1 ~ run function stardust:utils/dragon_egg_on_death/place_egg_loop

