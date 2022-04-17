
tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thank you for using Stardust Fragment!"}]
scoreboard players add #next stardust.id 1
scoreboard players operation @s stardust.id = #next stardust.id
