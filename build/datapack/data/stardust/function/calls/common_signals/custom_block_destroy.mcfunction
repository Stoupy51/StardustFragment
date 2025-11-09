
#> stardust:calls/common_signals/custom_block_destroy
#
# @executed	at @s & align xyz
#
# @within	#common_signals:signals/custom_block_destroy
#			stardust:calls/common_signals/on_ore_destroyed
#

execute as @e[tag=stardust.custom_block,dx=0,dy=0,dz=0] at @s run function stardust:custom_blocks/destroy

