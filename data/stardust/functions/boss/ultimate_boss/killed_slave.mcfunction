execute store result score Health StardustFragment_Data run data get entity @s Health 1
scoreboard players set 250 StardustFragment_Data 250
scoreboard players operation Health StardustFragment_Data -= 250 StardustFragment_Data
execute store result entity @s Health float 1 run scoreboard players get Health StardustFragment_Data

execute store result score Absorption StardustFragment_Data run data get entity @s AbsorptionAmount 1
scoreboard players set 16000 StardustFragment_Data 16000
scoreboard players operation Absorption StardustFragment_Data -= 16000 StardustFragment_Data
execute store result entity @s AbsorptionAmount float 1 run scoreboard players get Absorption StardustFragment_Data

execute as @a at @s run playsound minecraft:entity.ender_dragon.growl hostile @s
tellraw @a ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":" One of the Slaves has been defeated, the "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"},{"text":" just lost 25% of Max Health!"}]
