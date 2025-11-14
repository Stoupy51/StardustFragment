
#> stardust:mobs/display/remove_dying_entity
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/display/start_dying 1t append
#			stardust:mobs/display/remove_dying_entity 1t replace
#

# Try to kill displays
scoreboard players set #remaining_displays stardust.data 0
execute as @e[type=item_display,tag=stardust.dying_model] run function stardust:mobs/display/try_kill

# If still displays remaining, reschedule
execute if score #remaining_displays stardust.data matches 1.. run schedule function stardust:mobs/display/remove_dying_entity 1t replace

