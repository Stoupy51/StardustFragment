
#> stardust:mobs/ultimate_dragon/essence/check_reached_max_size
#
# @executed	as @e[tag=stardust.ultimate_dragon_essence_landed] & at @s
#
# @within	stardust:mobs/ultimate_dragon/essence/animation_loop [ as @e[tag=stardust.ultimate_dragon_essence_landed] & at @s ]
#

# If not reached max size, return
execute if score #global_tick stardust.data < @s stardust.spawn_delay run return run scoreboard players add #remaining_essences_anim stardust.data 1

# Else, reached max size, proceed
function stardust:mobs/ultimate_dragon/essence/finish_animation

