
#> stardust:custom_blocks/darkium_seed/search
#
# @executed	as the player & at current position
#
# @within	advancement stardust:custom_block_alternative/darkium_seed
#

# Advancement revoke
advancement revoke @s only stardust:custom_block_alternative/darkium_seed

# Execute the place function as and at the new placed item frame
execute as @e[type=item_frame,tag=stardust.new,tag=stardust.darkium_seed] at @s run function stardust:custom_blocks/darkium_seed/place_main

