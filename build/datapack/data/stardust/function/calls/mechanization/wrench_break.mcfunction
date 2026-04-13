
#> stardust:calls/mechanization/wrench_break
#
# @within	#mechanization:wrench_break
#

execute if entity @s[tag=stardust.custom_block] run setblock ~ ~ ~ air destroy
execute if entity @s[tag=stardust.custom_block] run function stardust:custom_blocks/destroy

