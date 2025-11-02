
#> stardust:custom_blocks/nether_star_generator/second
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:custom_blocks/second
#

# Consume nether stars for fuel
execute if data block ~ ~ ~ {Items:[{Slot:0b,id:"minecraft:nether_star"}],lit_time_remaining:0s} run function stardust:custom_blocks/nether_star_generator/consume_nether_star

# Update the gui to default
execute store result score #burn_time stardust.data run data get block ~ ~ ~ lit_time_remaining
execute if score #burn_time stardust.data matches 0 run item replace block ~ ~ ~ container.1 with cobblestone[item_model="stardust:gui/nether_star_generator",tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}]
execute if score #burn_time stardust.data matches 0 run data modify entity @s item.components."minecraft:item_model" set value "stardust:nether_star_generator"
execute if score #burn_time stardust.data matches 1.. run item replace block ~ ~ ~ container.1 with cobblestone[item_model="stardust:gui/nether_star_generator_on",tooltip_display={"hide_tooltip": true},custom_data={"common_signals":{"temp":true}}]
execute if score #burn_time stardust.data matches 1.. run data modify entity @s item.components."minecraft:item_model" set value "stardust:nether_star_generator_on"

# Update the gui & produce Energy while working
execute if score #burn_time stardust.data matches 1.. run scoreboard players add @s energy.storage 1500
execute if score #burn_time stardust.data matches 1.. run playsound stardust:nether_star_generator block @a[distance=..12] ~ ~ ~ 0.25
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage

# Prevent the furnace from really cooking
data modify block ~ ~ ~ cooking_total_time set value -200s
data modify block ~ ~ ~ cooking_time_spent set value 0s

