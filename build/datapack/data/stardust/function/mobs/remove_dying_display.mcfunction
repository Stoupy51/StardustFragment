
#> stardust:mobs/remove_dying_display
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/start_dying_display 1t append
#			stardust:mobs/remove_dying_display 1t replace
#

# Try to kill displays
scoreboard players set #remaining_displays stardust.data 0
execute as @e[type=item_display,tag=stardust.dying_model] run function stardust:mobs/try_kill_display

# If still displays remaining, reschedule
execute if score #remaining_displays stardust.data matches 1.. run schedule function stardust:mobs/remove_dying_display 1t replace

