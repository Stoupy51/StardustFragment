
#> stardust:mobs/ultimate_dragon/essence/animation_loop
#
# @within	stardust:mobs/ultimate_dragon/essence/has_landed 1t append [ scheduled ]
#			stardust:mobs/ultimate_dragon/essence/animation_loop 1t replace [ scheduled ]
#

# Loop until max size reached
scoreboard players set #remaining_essences_anim stardust.data 0
execute as @e[tag=stardust.ultimate_dragon_essence_landed] at @s run function stardust:mobs/ultimate_dragon/essence/check_reached_max_size

# If any remaining, reschedule
execute if score #remaining_essences_anim stardust.data matches 1.. run schedule function stardust:mobs/ultimate_dragon/essence/animation_loop 1t replace

