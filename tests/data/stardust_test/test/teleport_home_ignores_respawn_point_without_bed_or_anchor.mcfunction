# @template stardust_test:room
# @environment stardust_test:home_unset_respawn
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

# The anchor that set this respawn point is gone
spawnpoint @s ~2 ~1 ~2
tp @s ~4.5 ~ ~4.5
function stardust:dimensions/teleport_home

execute positioned ~2.5 ~1.6 ~2.5 run assert not entity @s[distance=..0.5]
execute store result score #x stardust_test.data run data get entity @s Pos[0]
execute store result score #z stardust_test.data run data get entity @s Pos[2]
execute store result score #spawn_x stardust_test.data run data get storage stardust:main world_spawn.x
execute store result score #spawn_z stardust_test.data run data get storage stardust:main world_spawn.z
assert score #x stardust_test.data = #spawn_x stardust_test.data
assert score #z stardust_test.data = #spawn_z stardust_test.data
