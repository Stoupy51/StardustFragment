tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thanks for using Stardust Fragment !"}]

loot give @s loot stardust:stardust_manual

scoreboard players add NextID SF_StardustID 1
scoreboard players operation @s SF_StardustID = NextID SF_StardustID
tag @s add SF_FirstJoin
