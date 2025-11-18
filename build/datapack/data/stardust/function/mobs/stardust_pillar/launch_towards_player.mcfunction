
#> stardust:mobs/stardust_pillar/launch_towards_player
#
# @executed	at @s
#
# @within	stardust:mobs/stardust_pillar/second
#

# Compute motion towards nearest player
execute facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] eyes run function stardust:utils/compute_motion_towards {towards:500,scale:0.001}

# Bound pos
data modify storage stardust:temp Pos set from entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] Pos
data modify storage stardust:temp bound_pos set value [0, 0, 0]
execute store result storage stardust:temp bound_pos[0] int 1 run data get storage stardust:temp Pos[0]
execute store result storage stardust:temp bound_pos[1] int 1 run data get storage stardust:temp Pos[1]
execute store result storage stardust:temp bound_pos[2] int 1 run data get storage stardust:temp Pos[2]
data modify entity @s bound_pos set from storage stardust:temp bound_pos

