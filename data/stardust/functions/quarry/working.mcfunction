
#> stardust:quarry/working
#
# @within			stardust:quarry/working/opti
# @executed			as & at quarry custom entity
#
# @description		Function called when the quarry is working and is not full of items.
#

# If the quarry is in start mode, copy start position
execute if score @s stardust.quarry_status matches 1 run function stardust:quarry/working/start

## Check if the selected region is valid (Less than 5 million blocks)
# Tellraw error if the region is too large
execute if score @s stardust.quarry_size matches 5000001.. run tellraw @a[distance=..3] {"text":"Stardust Fragment Error: Quarry region size cannot be larger than 5 million blocks.","color":"red","italic":false}

# Stop the quarry if the region is too large
scoreboard players set @s[scores={stardust.quarry_size=5000001..}] stardust.quarry_status 0
scoreboard players add @s stardust.quarry_speed 0
scoreboard players set #quarry_count stardust.data 0
scoreboard players set #quarry_temp stardust.data 0

## Working part
# Summon marker to keep track of the position
execute at @s run summon marker ~ ~ ~ {UUID:[I;15000,12000,20000,22000]}

# Set the module data (0 = None, 1 = Fortune, 2 = Silk Touch)
scoreboard players set #module stardust.data 0
execute if entity @s[tag=stardust.fortune_module] run scoreboard players set #module stardust.data 1
execute if entity @s[tag=stardust.silk_touch_module] run scoreboard players set #module stardust.data 2

# Consumes energy
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv1] energy.storage 125
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv2] energy.storage 250
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv3] energy.storage 375
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv4] energy.storage 500
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv5] energy.storage 625

# Set the count of blocks to break (10 = 1 non-air block, 1 = 1 air block, allowing air blocks to not slow down the quarry)
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv1] run scoreboard players set #quarry_count stardust.data 50
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv2] run scoreboard players set #quarry_count stardust.data 100
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv3] run scoreboard players set #quarry_count stardust.data 150
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv4] run scoreboard players set #quarry_count stardust.data 200
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv5] run scoreboard players set #quarry_count stardust.data 250
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv6] run scoreboard players set #quarry_count stardust.data 2500

# If requirements are met, process the task
execute if score @s stardust.quarry_status matches 2 if score #quarry_count stardust.data matches 1.. at @s run function stardust:quarry/working/pos_check

# Kill the temporary marker
kill 00003a98-0000-2ee0-0000-4e20000055f0

