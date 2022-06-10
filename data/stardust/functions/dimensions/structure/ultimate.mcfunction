
scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_96_-69 23 96 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_96_-21 23 96 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_96_-69 -73 96 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_96_-21 -73 96 -21

execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_-69 23 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_-21 23 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_27 23 48 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_-69 -73 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_-21 -73 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_27 -73 48 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_-69 -25 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_-21 -25 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_27 -25 48 27

execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_-69 23 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_-21 23 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_27 23 0 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_-69 -73 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_-21 -73 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_27 -73 0 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_-69 -25 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_-21 -25 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_27 -25 0 27

execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/ultimate_built 1s
execute if score #success stardust.data matches 0 run tellraw @a {"text":"Stardust Fragment Error: The Ultimate Dimension couldn't be rebuilt. Something blocked the '/forceload' command in stardust:ultimate","italic":false,"color":"red"}
scoreboard players reset #success stardust.data

execute as @e[y=0,type=!#energy:valid_block_entities,tag=!global.ignore,tag=!smithed.entity] at @s unless block ~ ~1 ~ air run function stardust:boss/ultimate_boss/tp_up

