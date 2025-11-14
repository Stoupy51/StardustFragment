
#> stardust:mobs/fast_ticking
#
# @within	stardust:advancements/enable_mob_ticking 1t append [ scheduled ]
#			stardust:mobs/fast_ticking 1t replace [ scheduled ]
#

# Decrease ticking timer & Tick mob displays
scoreboard players remove #mobs_loop_ticking stardust.data 1
function stardust:mobs/ticking

# If still ticking, reschedule
execute if score #mobs_loop_ticking stardust.data matches 1.. run schedule function stardust:mobs/fast_ticking 1t replace

