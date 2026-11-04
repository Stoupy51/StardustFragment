# @template stardust_test:room
# @environment stardust_test:dungeon_exit
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

scoreboard players add #players_in_dungeon stardust.data 0
scoreboard players operation #before stardust_test.data = #players_in_dungeon stardust.data

# Ward 26.3 has no stardust:dungeon level to travel to, so the changed_dimension branches are called directly
function stardust:dimensions/dungeon/enter_dimension
assert entity @s[gamemode=adventure,tag=stardust.is_in_dungeon]
scoreboard players operation #inside stardust_test.data = #players_in_dungeon stardust.data
scoreboard players operation #inside stardust_test.data -= #before stardust_test.data
assert score #inside stardust_test.data matches 1

function stardust:dimensions/dungeon/exit_dimension
assert entity @s[gamemode=survival,tag=!stardust.is_in_dungeon]
assert score #players_in_dungeon stardust.data = #before stardust_test.data
