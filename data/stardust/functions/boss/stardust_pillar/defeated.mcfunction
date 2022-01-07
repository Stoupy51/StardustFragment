execute at @a[distance=..200] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b},Tags:["SF_GiveKey"]}
execute at @a[distance=..200] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b},Tags:["SF_GiveEssence"]}
execute as @e[type=item,tag=SF_GiveKey] run data modify entity @s Item set from storage stardust:items all.2013229
execute as @e[type=item,tag=SF_GiveEssence] run data modify entity @s Item set from storage stardust:items all.2013002
execute as @e[type=item,tag=SF_GiveKey] run data modify entity @s Item.Count set value 2
execute as @e[type=item,tag=SF_GiveEssence] run data modify entity @s Item.Count set value 4

tellraw @a[distance=..200] ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment]","italic":false,"color":"aqua"},{"text":" The Stardust Pillar has been defeated."}]
scoreboard players remove StardustPillar SF_Data 1
kill @s
