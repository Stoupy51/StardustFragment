
#> stardust:custom_blocks/cavern_portal/find_teleporter
#
# @executed	in stardust:cavern
#
# @within	stardust:custom_blocks/cavern_portal/teleport_player if dimension minecraft:overworld in stardust:cavern run function stardust:custom_blocks/cavern_portal/create_teleporter [ in stardust:cavern ]
#

execute if dimension minecraft:overworld in stardust:cavern at @n[tag=stardust.cavern_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:cavern in minecraft:overworld at @n[tag=stardust.cavern_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:cavern run return run function stardust:dimensions/teleport_home
return fail

