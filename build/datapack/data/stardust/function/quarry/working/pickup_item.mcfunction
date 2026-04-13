
#> stardust:quarry/working/pickup_item
#
# @executed	as @e[tag=stardust.quarry_item]
#
# @within	stardust:quarry/working/mine_block [ as @e[tag=stardust.quarry_item] ]
#

# Try to insert in container
data modify storage itemio:io input set from entity @s Item
data modify storage itemio:io input_side set value "wireless"
function #itemio:calls/input

# If inserted, remove count or kill item
execute if score #success_input itemio.io matches 1 store result score #output_count stardust.data run data get storage itemio:io output.count
execute if score #success_input itemio.io matches 1 if score #output_count stardust.data matches 0 run kill @s
execute if score #success_input itemio.io matches 1 if score #output_count stardust.data matches 1.. store result entity @s Item.count int 1 run scoreboard players get #output_count stardust.data
execute if score #success_input itemio.io matches 1 if score #output_count stardust.data matches 1.. run scoreboard players set #success_input itemio.io 0

# If not fully inserted, drop item at quarry position and stop working
execute if score #success_input itemio.io matches 0 run tp @s ~ ~ ~
execute if score #success_input itemio.io matches 0 run scoreboard players set #blocks_to_break stardust.data 0

# Remove quarry item tag
tag @s remove stardust.quarry_item

