
#> stardust:mobs/fast_ticking
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/enable_mob_ticking 1t append
#			stardust:mobs/fast_ticking 1t replace
#

# Decrease ticking timer & Tick mob displays
scoreboard players remove #mobs_loop_ticking stardust.data 1
function stardust:mobs/ticking

# If still ticking, reschedule
execute if score #mobs_loop_ticking stardust.data matches 1.. run schedule function stardust:mobs/fast_ticking 1t replace

