
#> stardust:custom_blocks/solarium_seed/place_check
#
# @executed	as @e[type=item_frame,tag=...] & at @s
#
# @within	stardust:custom_blocks/solarium_seed/search [ as @e[type=item_frame,tag=...] & at @s ]
#

# Check if there is air block at the position
execute if block ~ ~ ~ air run return run function stardust:custom_blocks/solarium_seed/place_main

# If not air, give back the item to the player
tag @e[type=item] add stardust.temp
execute as @p[tag=stardust.to_refund] at @s run loot spawn ~ ~ ~ loot stardust:i/solarium_seed
data merge entity @n[type=item,tag=!stardust.temp] {PickupDelay:0s,Motion:[0.0d,0.0d,0.0d]}
data modify entity @n[type=item,tag=!stardust.temp] Owner set from entity @p[tag=stardust.to_refund] UUID
tag @n[type=item] remove stardust.temp

# And kill the item frame
kill @s

