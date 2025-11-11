
#> stardust:utils/get_world_spawn_from_marker
#
# @within	stardust:v3.5.0/load/confirm_load
#			stardust:v3.5.0/minute
#

# Store world spawn position
data modify storage stardust:main world_spawn set value {x:0,y:0,z:0,yaw:0.0f,pitch:0.0f,dimension:"minecraft:overworld"}
execute store result storage stardust:main world_spawn.x int 1 run data get entity @s Pos[0]
execute store result storage stardust:main world_spawn.y int 1 run data get entity @s Pos[1]
execute store result storage stardust:main world_spawn.z int 1 run data get entity @s Pos[2]
execute store result storage stardust:main world_spawn.yaw float 1 run data get entity @s Rotation[0]
execute store result storage stardust:main world_spawn.pitch float 1 run data get entity @s Rotation[1]

# Store world spawn dimension
execute positioned -30000000 51 1610 summon piglin_brute run function stardust:utils/get_dimension_from_piglin

# Kill marker
kill @s

