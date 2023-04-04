
execute if score @s stardust.quarry_status matches 1 run function stardust:quarry/working/start

# Check Size
execute if score @s stardust.quarry_size matches 5000001.. run tellraw @a[distance=..3] {"text":"Stardust Fragment Error: Quarry region size cannot be larger than 5 million blocks.","color":"red","italic":false}
scoreboard players set @s[scores={stardust.quarry_size=5000001..}] stardust.quarry_status 0
scoreboard players add @s stardust.quarry_speed 0
scoreboard players set #quarry_count stardust.data 0
scoreboard players set #quarry_temp stardust.data 0

# Working
execute at @s run summon marker ~ ~ ~ {UUID:[I;15000,12000,20000,22000]}
scoreboard players set #module stardust.data 0
execute if entity @s[tag=stardust.fortune_module] run scoreboard players set #module stardust.data 1
execute if entity @s[tag=stardust.silk_touch_module] run scoreboard players set #module stardust.data 2
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv1] energy.storage 125
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv2] energy.storage 250
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv3] energy.storage 375
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv4] energy.storage 500
execute if score @s stardust.quarry_status matches 2 run scoreboard players remove @s[tag=stardust.quarry_lv5] energy.storage 625
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv1] run scoreboard players set #quarry_count stardust.data 50
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv2] run scoreboard players set #quarry_count stardust.data 100
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv3] run scoreboard players set #quarry_count stardust.data 150
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv4] run scoreboard players set #quarry_count stardust.data 200
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv5] run scoreboard players set #quarry_count stardust.data 250
execute if entity @s[scores={stardust.quarry_status=2},tag=stardust.quarry_lv6] run scoreboard players set #quarry_count stardust.data 2500
execute if score @s stardust.quarry_status matches 2 if score #quarry_count stardust.data matches 1.. at @s run function stardust:quarry/working/pos_check
kill 00003a98-0000-2ee0-0000-4e20000055f0

