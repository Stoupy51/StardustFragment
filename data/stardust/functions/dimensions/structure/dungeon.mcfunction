
scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_-3_63_-106 -3 63 -106
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_-5_44_-43
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_-8_56_-83 -8 56 -83
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_-19_54_-15 -19 54 -15
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_31_65_-118 31 65 -118
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_36_141_-76 36 141 -76
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_51_67_-147 51 67 -147
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_57_123_4 57 123 4
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_63_143_-77 63 143 -77
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_72_68_-150 72 68 -150
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_108_111_-35 108 111 -35
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:dungeon_part_131_94_-85 131 94 -85

execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon_built 1s
execute if score #success stardust.data matches 0 run tellraw @a {"text":"Stardust Fragment Error: The Stardust Dungeon couldn't be load. Something blocked the '/forceload' command in stardust:dungeon","italic":false,"color":"red"}
scoreboard players reset #success stardust.data
