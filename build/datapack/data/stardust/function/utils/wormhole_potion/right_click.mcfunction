
#> stardust:utils/wormhole_potion/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Prepare dialog for which player to teleport to
data modify storage stardust:temp dialog set value {"actions":[],"title":{"translate": "stardust.wormhole_potion"}}
execute as @a[distance=1..] run function stardust:utils/wormhole_potion/add_to_actions

# Show dialog
function stardust:utils/wormhole_potion/show_dialog with storage stardust:temp dialog

