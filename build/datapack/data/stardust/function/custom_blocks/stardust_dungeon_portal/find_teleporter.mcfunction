
#> stardust:custom_blocks/stardust_dungeon_portal/find_teleporter
#
# @executed	in stardust:dungeon
#
# @within	stardust:custom_blocks/stardust_dungeon_portal/teleport_player if dimension minecraft:overworld in stardust:dungeon run function stardust:custom_blocks/stardust_dungeon_portal/create_teleporter [ in stardust:dungeon ]
#

execute if dimension minecraft:overworld in stardust:dungeon at @n[tag=stardust.stardust_dungeon_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:dungeon in minecraft:overworld at @n[tag=stardust.stardust_dungeon_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:dungeon run return run function stardust:dimensions/teleport_home
return fail

