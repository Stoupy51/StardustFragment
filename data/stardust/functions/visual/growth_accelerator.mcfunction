
scoreboard players set #success stardust.data 0
execute store result score #success stardust.data if score @s energy.storage matches 100.. run scoreboard players add @s stardust.data_2 1
execute if score #success stardust.data matches 1 run particle happy_villager ~ ~ ~ 7.5 7.5 7.5 1 1000
execute if score @s stardust.data_2 matches 60.. run function stardust:work/growth_accelerator/main
