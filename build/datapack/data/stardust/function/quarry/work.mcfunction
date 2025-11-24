
#> stardust:quarry/work
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/second
#

## Check if the selected region is valid (Less than 500 million blocks)
#execute if score @s stardust.quarry_size matches 500000001.. run tellraw @a[distance=..5] {"translate": "stardust_fragment_quarry_region_size_cannot_be_larger_than_500_m","color":"red"}
#execute if score @s stardust.quarry_size matches 500000001.. run return run scoreboard players set @s stardust.quarry_status 0

# Get module data
scoreboard players set #fortune_level stardust.data 0
scoreboard players set #silk_touch_level stardust.data 0
execute store result score #fortune_level stardust.data if data storage stardust:temp Items[{Slot:24b}].components."minecraft:custom_data".stardust.fortune_module run data get storage stardust:temp Items[{Slot:24b}].count
execute store success score #silk_touch_level stardust.data if data storage stardust:temp Items[{Slot:24b}].components."minecraft:custom_data".stardust.silk_touch_module

# Consume energy
scoreboard players operation @s energy.storage -= @s stardust.energy_rate

# Compute how many block-checks the quarry should attempt.
# A "quarry_multiplier" > 1 reduces the impact of empty space so air blocks don't
# slow the quarry as much (default multiplier = 25). Setting multiplier = 1
# treats air and solid blocks equally.
scoreboard players set #quarry_multiplier stardust.data 25
scoreboard players operation #blocks_to_break stardust.data = @s stardust.quarry_speed
scoreboard players operation #blocks_to_break stardust.data *= #quarry_multiplier stardust.data

# Start loop to break blocks
function stardust:quarry/working/loop

# Kill temporary shulkers displaying current position
schedule function stardust:quarry/display/kill_shulkers 1t append

