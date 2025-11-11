
#> stardust:custom_blocks/celestial_portal/find_teleporter
#
# @executed	in stardust:celestial
#
# @within	stardust:custom_blocks/celestial_portal/teleport_player if dimension minecraft:overworld in stardust:celestial run function stardust:custom_blocks/celestial_portal/create_teleporter [ in stardust:celestial ]
#

execute if dimension minecraft:overworld in stardust:celestial at @n[tag=stardust.celestial_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:celestial in minecraft:overworld at @n[tag=stardust.celestial_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:celestial run return run function stardust:dimensions/teleport_home
return fail

