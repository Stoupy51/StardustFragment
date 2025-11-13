
#> stardust:advancements/enable_mob_ticking
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/mob_hurt
#			advancement stardust:technical/mob_attack
#

# Revoke advancements
advancement revoke @s only stardust:technical/mob_hurt
advancement revoke @s only stardust:technical/mob_attack

# Set ticking flag (for 10 seconds)
scoreboard players set #mobs_loop_ticking stardust.data 200

# Schedule ticking function
schedule function stardust:mobs/fast_ticking 1t append

