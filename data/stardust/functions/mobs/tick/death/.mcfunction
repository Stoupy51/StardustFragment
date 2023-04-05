
#> stardust:mobs/tick/death/
#
# @within			stardust:mobs/tick/
# @executed			as & at Model item display
#
# @description		Manage death animation
#

# Decrease cooldown and kill if 0
scoreboard players remove @s stardust.cooldown 1
execute if score @s stardust.cooldown matches 0 run kill @s

