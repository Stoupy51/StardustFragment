
#> stardust:utils/wormhole_potion/show_dialog
#
# @executed	as the player & at current position
#
# @within	stardust:utils/wormhole_potion/right_click with storage stardust:temp dialog
#
# @args		title (compound)
#			actions (list)
#

$dialog show @s {"type":"minecraft:multi_action","columns":3,"exit_action":{"label":{"translate":"gui.back"},"width":200},"title":$(title),"actions":$(actions)}

