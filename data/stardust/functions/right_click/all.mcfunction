
#> stardust:right_click/all
#
# @within			advancement stardust:right_click
# @executed			as & at current player
#
# @description		Function executed when a player right clicks, then switch case on the item in hand
#

# Advancement revoke
advancement revoke @s only stardust:right_click

# Copy SelectedItem to storage
data modify storage stardust:main SIT set from entity @s SelectedItem.tag

# Switch case on item in hand
execute if data storage stardust:main SIT.stardust.quarry_configurator run function stardust:right_click/quarry_configurator/
execute if data storage stardust:main SIT.stardust.lucky_artifact_bag run function stardust:right_click/lucky_artifact_bag/
execute if data storage stardust:main SIT.stardust.stardust_pillar run function stardust:right_click/stardust_pillar/
execute if data storage stardust:main SIT.stardust.wormhole_potion run function stardust:right_click/wormhole_potion/
execute if data storage stardust:main SIT.stardust.wither_killer run function stardust:right_click/wither_killer/
execute if data storage stardust:main SIT.stardust.travel_staff run function stardust:right_click/travel_staff/
execute if data storage stardust:main SIT.stardust.snip unless score @s stardust.cooldown matches 1.. at @s run function stardust:right_click/snipers/all

# Remove storage & Reset scores
data remove storage stardust:main SIT
scoreboard players reset @s stardust.right_click

