
#> stardust:custom_blocks/nether_star_generator/consume_nether_star
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/nether_star_generator/second
#

data modify block ~ ~ ~ lit_time_remaining set value 18000s
execute store result score #count stardust.data run data get block ~ ~ ~ Items[{Slot:0b}].count
scoreboard players remove #count stardust.data 1
execute if score #count stardust.data matches 1.. store result block ~ ~ ~ Items[{Slot:0b}].count int 1 run scoreboard players get #count stardust.data
execute if score #count stardust.data matches 0 run data remove block ~ ~ ~ Items[{Slot:0b}]

