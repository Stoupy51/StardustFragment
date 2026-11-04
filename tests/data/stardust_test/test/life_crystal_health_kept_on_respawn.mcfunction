# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

scoreboard players set @s stardust.life_crystal 5
function stardust:utils/update_max_health
assert result 25 run attribute @s minecraft:max_health get

kill @s
dummy @s respawn
await result 25 run attribute @s minecraft:max_health get