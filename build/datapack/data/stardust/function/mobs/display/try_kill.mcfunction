
#> stardust:mobs/display/try_kill
#
# @executed	as @e[type=item_display,tag=stardust.dying_model]
#
# @within	stardust:mobs/display/remove_dying_entity [ as @e[type=item_display,tag=stardust.dying_model] ]
#

# Decrease timer
scoreboard players remove @s stardust.data 1

# If timer reached 0, kill display
execute if score @s stardust.data matches 0 run return run kill @s

# Else, mark as remaining
scoreboard players add #remaining_displays stardust.data 1

