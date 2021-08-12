function stardust:craft/drop_gui
function stardust:craft/gui

#Verifying if craft has been done
scoreboard players set Crafted SF_Data 0
scoreboard players set Count SF_Data 0
execute store result score Crafted SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].tag.CustomModelData
execute store result score Count SF_Data run data get block ~ ~ ~ Items[{Slot:16b}].Count
execute unless score @s[tag=SF_WaitingCraft] SF_Data = Crafted SF_Data unless score @s SF_X = Count SF_Data run function stardust:craft/crafted

tag @s remove SF_WaitingCraft
item replace block ~ ~ ~ container.16 with minecraft:cobblestone{CustomModelData:2011929,SE_CustomTextureItem:1b,display:{Name:'[{"text":"","italic":false}]'}}
scoreboard players set @s SF_Data 0
scoreboard players set @s SF_X 1

#Dragon Pearl
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:dragon_breath"},{Slot:3b,id:"minecraft:dragon_breath"},{Slot:4b,id:"minecraft:dragon_breath"},{Slot:11b,id:"minecraft:dragon_breath"},{Slot:12b,id:"minecraft:ender_pearl"},{Slot:13b,id:"minecraft:dragon_breath"},{Slot:20b,id:"minecraft:dragon_breath"},{Slot:21b,id:"minecraft:dragon_breath"},{Slot:22b,id:"minecraft:dragon_breath"}]} run function stardust:craft/items/dragon_pearl
#Ender Dragon Pearl
    execute if entity @s[tag=!SF_WaitingCraft] if block ~ ~ ~ barrel{Items:[{Slot:2b,id:"minecraft:ender_pearl"},{Slot:3b,id:"minecraft:ender_pearl"},{Slot:4b,id:"minecraft:ender_pearl"},{Slot:11b,id:"minecraft:ender_pearl"},{Slot:12b,tag:{SF_DragonPearl:1b}},{Slot:13b,id:"minecraft:ender_pearl"},{Slot:20b,id:"minecraft:ender_pearl"},{Slot:21b,id:"minecraft:ender_pearl"},{Slot:22b,id:"minecraft:ender_pearl"}]} run function stardust:craft/items/ender_dragon_pearl

#Types Crafts
    execute if entity @s[tag=!SF_WaitingCraft] run function stardust:craft/types/all





