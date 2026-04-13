
#> stardust:custom_blocks/stardust_dungeon_portal/create_teleporter
#
# @executed	in stardust:dungeon
#
# @within	stardust:custom_blocks/stardust_dungeon_portal/teleport_player if dimension minecraft:overworld in stardust:dungeon run function stardust:custom_blocks/stardust_dungeon_portal/create_teleporter [ in stardust:dungeon ]
#

# No portal to place, just teleport player
execute in stardust:dungeon run tp @s -9 67.5 3 225 0

