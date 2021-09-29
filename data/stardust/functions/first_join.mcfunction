tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thanks for using Stardust Fragment !"}]

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:wolf_spawn_egg",Count:2b}}

scoreboard players add NextID SF_StardustID 1
scoreboard players operation @s SF_StardustID = NextID SF_StardustID
tag @s add SF_FirstJoin
