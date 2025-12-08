
#> stardust:quarry/stop_force_load
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/quarry_lv1/destroy
#			stardust:custom_blocks/quarry_lv2/destroy
#			stardust:custom_blocks/quarry_lv3/destroy
#			stardust:custom_blocks/quarry_lv4/destroy
#			stardust:custom_blocks/quarry_lv5/destroy
#			stardust:custom_blocks/quarry_creative/destroy
#			stardust:quarry/second
#

# If has force load module removed, stop force loading
execute if entity @s[tag=stardust.force_load_quarry] run forceload remove ~ ~

# Remove force load tag
tag @s remove stardust.force_load_quarry

