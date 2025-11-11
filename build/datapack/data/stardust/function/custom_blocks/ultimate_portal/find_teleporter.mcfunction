
#> stardust:custom_blocks/ultimate_portal/find_teleporter
#
# @executed	in stardust:ultimate
#
# @within	stardust:custom_blocks/ultimate_portal/teleport_player if dimension minecraft:overworld in stardust:ultimate run function stardust:custom_blocks/ultimate_portal/create_teleporter [ in stardust:ultimate ]
#

execute if dimension minecraft:overworld in stardust:ultimate at @n[tag=stardust.ultimate_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:ultimate in minecraft:overworld at @n[tag=stardust.ultimate_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:ultimate run return run function stardust:dimensions/teleport_home
return fail

