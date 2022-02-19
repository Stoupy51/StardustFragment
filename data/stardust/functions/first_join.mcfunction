
tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thank you for using Stardust Fragment!"}]
scoreboard players add NextID StardustFragment_StardustID 1
scoreboard players operation @s StardustFragment_StardustID = NextID StardustFragment_StardustID
