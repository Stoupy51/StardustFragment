scoreboard players set DungeonBuild stardust.data 0
execute store success score temp stardust.data run setblock -3 63 -106 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_-3_63_-106",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock -5 44 -43 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_-5_44_-43",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock -8 56 -83 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_-8_56_-83",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock -19 54 -15 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_-19_54_-15",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 31 65 -118 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_31_65_-118",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 36 141 -76 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_36_141_-76",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 51 67 -147 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_51_67_-147",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 57 123 4 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_57_123_4",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 63 143 -77 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_63_143_-77",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 72 68 -150 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_72_68_-150",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 108 111 -35 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_108_111_-35",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1
execute store success score temp stardust.data run setblock 131 94 -85 structure_block[mode=load]{mode:"LOAD",name:"stardust:dungeon_part_131_94_-85",ignoreEntities:0b}
execute if score temp stardust.data matches 1 run scoreboard players add DungeonBuild stardust.data 1

execute if score DungeonBuild stardust.data matches 12 run function stardust:dimensions/structure/dungeon_build
execute unless score DungeonBuild stardust.data matches 12 run tellraw @a {"text":"Stardust Fragment Error: The Stardust Dungeon couldn't be load. Something blocked the '/forceload' command in stardust:dungeon","italic":false,"color":"red"}
scoreboard players reset DungeonBuild stardust.data
