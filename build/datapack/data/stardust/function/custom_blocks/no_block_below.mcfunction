
#> stardust:custom_blocks/no_block_below
#
# @executed	at @s
#
# @within	stardust:custom_blocks/destroy_growing_seeds {item:"diamond_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"advanced_diamond_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"stardust_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"advanced_stardust_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"elite_stardust_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"legendarium_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"solarium_seed"}
#			stardust:custom_blocks/destroy_growing_seeds {item:"darkium_seed"}
#

# Break the block we're at and call the destroy function
execute if entity @s[type=item_frame] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:custom_data":{"stardust":{"item_frame_destroy":true}}}}}
execute if entity @s[type=item_display] run setblock ~ ~ ~ air destroy
$function stardust:custom_blocks/$(item)/destroy

