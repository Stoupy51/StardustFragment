
#> stardust:utils/wormhole_potion/set_teleport_command
#
# @executed	as @a[distance=1..]
#
# @within	stardust:utils/wormhole_potion/add_to_actions with storage stardust:temp
#
# @args		player_name (unknown)
#

$data modify storage stardust:temp element.action.command set value 'function stardust:utils/wormhole_potion/teleport_to {"name":"$(player_name)"}'

