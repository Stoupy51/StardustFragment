
#> stardust:custom_blocks/legendarium_seed/search
#
# @executed	as the player & at current position
#
# @within	advancement stardust:custom_block_alternative/legendarium_seed
#

# Advancement revoke
advancement revoke @s only stardust:custom_block_alternative/legendarium_seed

# Execute the place function as and at the new placed item frame
tag @s add stardust.to_refund
execute as @e[type=item_frame,tag=stardust.new,tag=stardust.legendarium_seed] at @s run function stardust:custom_blocks/legendarium_seed/place_check
tag @s remove stardust.to_refund

# Grant advancement for placing seed
advancement grant @s only stardust:visible/adventure/seeds/legendarium_seed

