data modify storage stardust:items all.Count set from block ~ ~ ~ Items

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:2b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:2b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:3b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:3b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:4b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:4b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:11b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:11b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:12b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:12b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:13b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:13b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:20b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:20b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:21b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:21b}].Count byte 1 run scoreboard players get Count SE_Data

execute store result score Count SE_Data run data get storage stardust:items all.Count[{Slot:22b}].Count
scoreboard players remove Count SE_Data 1
execute store result storage stardust:items all.Count[{Slot:22b}].Count byte 1 run scoreboard players get Count SE_Data

data modify block ~ ~ ~ Items set from storage stardust:items all.Count

scoreboard players remove @s SE_CraftCount 1
execute if score @s SE_CraftCount matches 1.. run function stardust:craft/crafted

function stardust:craft/drop
tag @s remove SF_WaitingCraft
