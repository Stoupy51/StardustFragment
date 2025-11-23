
#> stardust:utils/wormhole_potion/teleport_to
#
# @executed	as @a[distance=1..]
#
# @within	stardust:utils/wormhole_potion/set_teleport_command {"name":"$(player_name)"}'
#
# @args		name (unknown)
#

# Slow falling effect to avoid fall damage
effect give @s minecraft:slow_falling 3 255 true

# Teleport to selected player
$tp @s $(name)

# Feedback
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 0 1000
execute at @s run playsound stardust:wormhole_potion ambient @a[distance=..16]

# Consume one wormhole potion
clear @s *[custom_data~{stardust:{"wormhole_potion":true}}] 1

