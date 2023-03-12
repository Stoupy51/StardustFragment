
## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Azalea Tree
execute at @s if block ~ ~ ~ #azalea_grows_on run place feature azalea_tree

