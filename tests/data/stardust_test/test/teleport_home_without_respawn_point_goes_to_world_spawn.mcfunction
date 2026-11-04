# @template stardust_test:room
# @environment stardust_test:home_world_spawn
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

# Ward puts the world spawn on the test, so the dummy leaves that block first
tp @s ~3.5 ~2 ~3.5
function stardust:dimensions/teleport_home

execute store result score #x stardust_test.data run data get entity @s Pos[0]
execute store result score #y stardust_test.data run data get entity @s Pos[1]
execute store result score #z stardust_test.data run data get entity @s Pos[2]
execute store result score #spawn_x stardust_test.data run data get storage stardust:main world_spawn.x
execute store result score #spawn_y stardust_test.data run data get storage stardust:main world_spawn.y
execute store result score #spawn_z stardust_test.data run data get storage stardust:main world_spawn.z
assert score #x stardust_test.data = #spawn_x stardust_test.data
assert score #y stardust_test.data = #spawn_y stardust_test.data
assert score #z stardust_test.data = #spawn_z stardust_test.data
assert data entity @s active_effects[{id:"minecraft:slow_falling"}]
