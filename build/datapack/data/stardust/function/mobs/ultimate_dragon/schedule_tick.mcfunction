
#> stardust:mobs/ultimate_dragon/schedule_tick
#
# @within	stardust:mobs/ultimate_dragon/second 1t append [ scheduled ]
#			stardust:mobs/ultimate_dragon/schedule_tick 1t replace [ scheduled ]
#

# Decrease tick counter and run tick function
scoreboard players remove #ultimate_dragon_tick stardust.data 1
execute as @n[tag=stardust.mob_entity,tag=stardust.ultimate_dragon] at @s run function stardust:mobs/ultimate_dragon/tick

# Reschedule next tick if not zero
execute if score #ultimate_dragon_tick stardust.data matches 1.. run schedule function stardust:mobs/ultimate_dragon/schedule_tick 1t replace

