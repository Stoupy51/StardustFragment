
#> stardust:mobs/delay/schedule
#
# @within	stardust:mobs/delay/convert 1t append [ scheduled ]
#			stardust:mobs/delay/schedule 1t replace [ scheduled ]
#

# Check if delay is over
scoreboard players set #remaining_delays stardust.data 0
execute as @e[tag=stardust.delayed_convert] at @s run function stardust:mobs/delay/tick

# If still delays remaining, reschedule
execute if score #remaining_delays stardust.data matches 1.. run schedule function stardust:mobs/delay/schedule 1t replace

