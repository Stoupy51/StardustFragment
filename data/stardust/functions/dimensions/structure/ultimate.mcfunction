scoreboard players set UltimateBuild StardustFragment_Data 0
execute store success score Temp StardustFragment_Data run setblock 23 96 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_96_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock 23 96 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_96_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 96 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_96_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 96 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_96_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1

execute store success score Temp StardustFragment_Data run setblock 23 48 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_48_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock 23 48 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_48_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock 23 48 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_48_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 48 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_48_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 48 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_48_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 48 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_48_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 48 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_48_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 48 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_48_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 48 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_48_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1

execute store success score Temp StardustFragment_Data run setblock 23 0 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_0_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock 23 0 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_0_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock 23 0 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_23_0_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 0 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_0_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 0 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_0_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -73 0 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-73_0_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 0 -69 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_0_-69"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 0 -21 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_0_-21"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1
execute store success score Temp StardustFragment_Data run setblock -25 0 27 structure_block[mode=load]{mode:"LOAD",name:"stardust:ultimate_part_-25_0_27"}
execute if score Temp StardustFragment_Data matches 1 run scoreboard players add UltimateBuild StardustFragment_Data 1

execute if score UltimateBuild StardustFragment_Data matches 22 run function stardust:dimensions/structure/ultimate_build
execute unless score UltimateBuild StardustFragment_Data matches 22 run tellraw @a {"text":"Stardust Fragment Error: The Ultimate Dimension couldn't be rebuilt. Something blocked the '/forceload' command in stardust:ultimate","italic":false,"color":"red"}
scoreboard players set UltimateBuilt StardustFragment_Data 1
scoreboard players reset UltimateBuild StardustFragment_Data

execute as @e[distance=0..,type=!#energy:valid_block_entities] at @s unless block ~ ~1 ~ air run function stardust:boss/ultimate_boss/tp_up
