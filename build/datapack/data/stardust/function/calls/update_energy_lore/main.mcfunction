
#> stardust:calls/update_energy_lore/main
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:crimson_hyphae"}},distance=..1]
#
# @within	#energy:v1/update_energy_lore/main
#			stardust:utils/keep_energy
#

# Stop if not from the datapack
execute unless data storage energy:temp list[0].components."minecraft:custom_data".stardust run return 0

## Copy scores
scoreboard players set #energy stardust.data 0
execute store result score #energy stardust.data run data get storage energy:temp list[0].components."minecraft:custom_data".energy.storage
scoreboard players operation #part_1 stardust.data = #energy stardust.data
scoreboard players operation #part_2 stardust.data = #energy stardust.data
data modify storage stardust:temp macro set value {part_1:0, part_2:0, scale:""}

## kJ, MJ, GJ, TJ cases
execute if score #energy stardust.data matches ..999 run data modify storage stardust:temp macro.scale set value " kJ]"
execute if score #energy stardust.data matches ..999 run scoreboard players set #part_2 stardust.data 0
execute if score #energy stardust.data matches 1000..999999 run scoreboard players set #10 stardust.data 10
execute if score #energy stardust.data matches 1000..999999 run scoreboard players set #1000 stardust.data 1000
execute if score #energy stardust.data matches 1000..999999 run data modify storage stardust:temp macro.scale set value " MJ]"
execute if score #energy stardust.data matches 1000..999999 run scoreboard players operation #part_1 stardust.data /= #1000 stardust.data
execute if score #energy stardust.data matches 1000..999999 run scoreboard players operation #part_2 stardust.data %= #1000 stardust.data
execute if score #energy stardust.data matches 1000..999999 run scoreboard players operation #part_2 stardust.data /= #10 stardust.data
execute if score #energy stardust.data matches 1000000..999999999 run scoreboard players set #10000 stardust.data 10000
execute if score #energy stardust.data matches 1000000..999999999 run scoreboard players set #1000000 stardust.data 1000000
execute if score #energy stardust.data matches 1000000..999999999 run data modify storage stardust:temp macro.scale set value " GJ]"
execute if score #energy stardust.data matches 1000000..999999999 run scoreboard players operation #part_1 stardust.data /= #1000000 stardust.data
execute if score #energy stardust.data matches 1000000..999999999 run scoreboard players operation #part_2 stardust.data %= #1000000 stardust.data
execute if score #energy stardust.data matches 1000000..999999999 run scoreboard players operation #part_2 stardust.data /= #10000 stardust.data
execute if score #energy stardust.data matches 1000000000.. run scoreboard players set #10000000 stardust.data 10000000
execute if score #energy stardust.data matches 1000000000.. run scoreboard players set #1000000000 stardust.data 1000000000
execute if score #energy stardust.data matches 1000000000.. run data modify storage stardust:temp macro.scale set value " TJ]"
execute if score #energy stardust.data matches 1000000000.. run scoreboard players operation #part_1 stardust.data /= #1000000000 stardust.data
execute if score #energy stardust.data matches 1000000000.. run scoreboard players operation #part_2 stardust.data %= #1000000000 stardust.data
execute if score #energy stardust.data matches 1000000000.. run scoreboard players operation #part_2 stardust.data /= #10000000 stardust.data

# Apply the new lore to the item
execute store result storage stardust:temp macro.part_1 int 1 run scoreboard players get #part_1 stardust.data
execute store result storage stardust:temp macro.part_2 int 1 run scoreboard players get #part_2 stardust.data
function stardust:calls/update_energy_lore/macro with storage stardust:temp macro

# Indicate that the item lore was updated
data modify storage energy:temp list[0].components."minecraft:custom_data".energy.has_storage_lore set value 1b
#data remove storage stardust:temp macro

