
#> stardust:custom_blocks/stardust_portal/find_teleporter
#
# @executed	in stardust:stardust
#
# @within	stardust:custom_blocks/stardust_portal/teleport_player [ in stardust:stardust ]
#

execute if dimension minecraft:overworld in stardust:stardust at @n[tag=stardust.stardust_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:stardust in minecraft:overworld at @n[tag=stardust.stardust_portal,distance=..100] run return run tp @s ~ ~1 ~
execute if dimension stardust:stardust run return run function stardust:dimensions/teleport_home
return fail

