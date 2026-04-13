
#> stardust:quarry/working/break_at_position
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/working/loop
#

# Get block at position
execute store result entity @s Pos[0] double 1 run scoreboard players get #quarry_x stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #quarry_y stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #quarry_z stardust.data

# If a player is nearby or it's last block, summon a shulker for visualization
execute at @s store success score #player_nearby stardust.data if entity @p[distance=..25]
execute if score #blocks_to_break stardust.data <= #quarry_multiplier stardust.data at @s unless block ~ ~ ~ #minecraft:air run scoreboard players set #player_nearby stardust.data 1
execute if score #blocks_to_break stardust.data matches 1 run scoreboard players set #player_nearby stardust.data 1
execute if score #player_nearby stardust.data matches 1 at @s run function stardust:quarry/display/current_position

# Mine block
function stardust:quarry/working/mine_block

# Clear marker
kill @s

