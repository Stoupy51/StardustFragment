tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thanks for using Stardust Fragment !"}]

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}},Tags:["SF_GiveSeed"]}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}},Tags:["SF_GiveWormhole"]}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:wolf_spawn_egg",Count:2b}}
data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1] Item set from storage stardust:items 2013202
data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},limit=1] Item set from storage stardust:items 2013171
data modify entity @e[type=item,tag=SF_GiveSeed,limit=1] Item.Count set value 8
data modify entity @e[type=item,tag=SF_GiveWormhole,limit=1] Item.Count set value 4

scoreboard players operation @s SF_StardustID = NextID SF_StardustID
scoreboard players add NextID SF_StardustID 1
tag @s add SF_FirstJoin
