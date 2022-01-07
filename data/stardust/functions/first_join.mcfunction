tellraw @s ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"Welcome and Thanks for using Stardust Fragment !"}]

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}},PickupDelay:2s,Tags:["SF_Give"]}
data modify entity @e[type=item,tag=SF_Give,limit=1] Owner set from entity @s UUID
data modify entity @e[type=item,tag=SF_Give,limit=1] Item set from storage stardust:items all.2013398
data modify entity @e[type=item,tag=SF_Give,limit=1] Item.tag.display set value {Lore:['{"translate":"Drop a Stardust Fragment on","italic":false,"color":"gray"}','{"translate":"a crafting table to get a","italic":false,"color":"gray"}','{"translate":"Stardust Crafting Table","italic":false,"color":"gray"}']}
tag @e[type=item,tag=SF_Give] remove SF_Give

scoreboard players add NextID SF_StardustID 1
scoreboard players operation @s SF_StardustID = NextID SF_StardustID
tag @s add SF_FirstJoin
