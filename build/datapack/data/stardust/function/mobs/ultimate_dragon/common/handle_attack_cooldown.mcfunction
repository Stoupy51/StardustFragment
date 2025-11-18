
#> stardust:mobs/ultimate_dragon/common/handle_attack_cooldown
#
# @executed	as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s
#
# @within	stardust:mobs/ultimate_dragon/tick [ as @e[tag=stardust.dragon,scores={stardust.attack_cooldown=-200..}] & at @s ]
#

# Decrease attack cooldown by 1 and stop when it reaches 0
scoreboard players remove @s stardust.attack_cooldown 1
execute if score @s stardust.attack_cooldown matches ..0 run return 1

# Only action for poop attack is particles
execute if score @s stardust.chosen_attack matches 1 run return run particle dust{color:[0.59,0.29,0],scale:4} ~ ~ ~ 0 0 0 0.05 1 force @a[distance=..200]

# Fireball Burst attack
execute if score @s stardust.chosen_attack matches 2 run function stardust:mobs/ultimate_dragon/fireball_burst/launch

