
#> stardust:custom_blocks/solarium_seed/search
#
# @executed	as the player & at current position
#
# @within	advancement stardust:custom_block_alternative/solarium_seed
#

# Advancement revoke
advancement revoke @s only stardust:custom_block_alternative/solarium_seed

# Execute the place function as and at the new placed item frame
execute as @e[type=item_frame,tag=stardust.new,tag=stardust.solarium_seed] at @s run function stardust:custom_blocks/solarium_seed/place_main

