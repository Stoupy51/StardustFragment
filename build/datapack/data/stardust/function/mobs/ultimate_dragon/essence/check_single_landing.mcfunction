
#> stardust:mobs/ultimate_dragon/essence/check_single_landing
#
# @executed	as @e[tag=stardust.check_ultimate_dragon_essence] & at @s
#
# @within	stardust:mobs/ultimate_dragon/essence/check_landing [ as @e[tag=stardust.check_ultimate_dragon_essence] & at @s ]
#

# If vehicle is not gone, still flying (return)
execute on vehicle run return run scoreboard players add #remaining_potions stardust.data 1

# Else, has landed, proceed to next step
function stardust:mobs/ultimate_dragon/essence/has_landed

