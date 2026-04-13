
#> stardust:dimensions/teleport_to
#
# @executed	in stardust:cavern
#
# @within	stardust:dimensions/teleport_home with storage stardust:main world_spawn
#			stardust:dimensions/teleport_home with storage stardust:temp macro
#			stardust:dimensions/teleport_home with storage stardust:main world_spawn [ at @s ]
#
# @args		dimension (string)
#			x (int)
#			y (int)
#			z (int)
#			yaw (float)
#			pitch (float)
#

$execute in $(dimension) run tp @s $(x) $(y).6 $(z) $(yaw) $(pitch)

