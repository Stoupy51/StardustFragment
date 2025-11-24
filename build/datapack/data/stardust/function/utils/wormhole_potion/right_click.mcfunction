
#> stardust:utils/wormhole_potion/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Prepare dialog for which player to teleport to
tag @s add stardust.temp
data modify storage stardust:temp dialog set value {"actions":[],"title":{"translate": "stardust.wormhole_potion"}}
execute as @a[tag=!stardust.temp] run function stardust:utils/wormhole_potion/add_to_actions
tag @s remove stardust.temp

# Message if no other players connected
execute unless data storage stardust:temp dialog.actions[1] run playsound minecraft:entity.villager.no ambient @s
execute unless data storage stardust:temp dialog.actions[1] run return run tellraw @s {"translate": "stardust_fragment_no_other_players_are_currently_connected_to_te","color":"red"}

# Show dialog
function stardust:utils/wormhole_potion/show_dialog with storage stardust:temp dialog

